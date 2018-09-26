;; set custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(defalias 'flymake-get-temp-dir
  (if (fboundp 'temp-directory)
      'temp-directory
    (lambda () temporary-file-directory)))


;; disable yes-or-no
(fset 'yes-or-no-p-history 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)

;; get rid of splash screen
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)


;;; no backup files
(setq make-backup-files nil)
(global-auto-revert-mode t)

;;; no tabs
(setq-default indent-tabs-mode nil)
;; package init

;;; set subword globally to on.
(global-subword-mode t)

;; start emacs maximized
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(require 'diminish)

(when (fboundp 'winner-mode)
  (winner-mode t))



;; load elisp-slime-nav
(use-package elisp-slime-nav
  :ensure t
  :init
  (dolist (i '(emacs-lisp-mode-hook ielm-mode-hook))
    (add-hook i 'elisp-slime-nav-mode))
  :diminish elisp-slime-nav-mode)


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-evil)

(require 'init-appearance)

;; setup magit
(use-package magit
  :ensure t
  :bind ("M-<f12>" . magit-status))

(require 'init-web)

;; setup paredit
(use-package paredit
  :ensure t
  :init
  (dolist (hook '(emacs-lisp-mode-hook lisp-mode-hook clojure-mode-hook))
    (add-hook hook 'paredit-mode))
  :diminish paredit-mode)

(use-package flycheck
  :ensure t
  :defer t
  :init (global-flycheck-mode))

(use-package flycheck-pos-tip
  :ensure t
  :defer t
  :config
  (with-eval-after-load 'flycheck (flycheck-pos-tip-mode)))

(use-package smex
  :ensure t
  :bind
  (([remap execute-extended-command] . smex)
   ("M-X" . smex-major-mode-commands)))

(use-package ido                        ; Better minibuffer completion
  :init (progn
          (ido-mode)
          (ido-everywhere))
  :config
  (setq ido-enable-flex-matching t      ; Match characters if string doesn't
                                        ; match
        ido-create-new-buffer 'always   ; Create a new buffer if nothing matches
        ido-use-filename-at-point 'guess
        ;; Visit buffers and files in the selected window
        ido-default-file-method 'selected-window
        ido-default-buffer-method 'selected-window
        ido-use-faces nil))             ; Prefer flx ido faces



;; (use-package ido-ubiquitous             ; IDO everywhere, really!
;;   :ensure t
;;   :init (progn 
;; 	  (require 'ido)
;; 	  (ido-ubiquitous-mode)))

(use-package flx-ido                    ; Flex matching for IDO
  :ensure t
  :init (flx-ido-mode))

(use-package company               
  :ensure t
  :defer t
  :init (global-company-mode)
  :config
  (progn
    ;; Use Company for completion
    (bind-key [remap completion-at-point] #'company-complete company-mode-map)

    (setq company-tooltip-align-annotations t
          ;; Easy navigation to candidates with M-<n>
          company-show-numbers t)
    (setq company-dabbrev-downcase nil))
  :diminish company-mode)


(use-package company-quickhelp          ; Documentation popups for Company
  :ensure t
  :defer t
  :init (add-hook 'global-company-mode-hook #'company-quickhelp-mode))

(use-package company-go
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-go)))


(use-package go-mode
  :ensure t
  :init
  (progn
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
    (bind-key [remap find-tag] #'godef-jump))
  :config
  (add-hook 'go-mode-hook 'electric-pair-mode))

(use-package go-eldoc
  :ensure t
  :defer
  :init
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package switch-window
  :ensure t
  :init
  (bind-key [remap other-window] 'switch-window))

(use-package ibuffer                    ; Better buffer list
  :bind (([remap list-buffers] . ibuffer))
  ;; Show VC Status in ibuffer
  :config (setq ibuffer-formats
                '((mark modified read-only vc-status-mini " "
                        (name 18 18 :left :elide)
                        " "
                        (size 9 -1 :right)
                        " "
                        (mode 16 16 :left :elide)
                        " "
                        (vc-status 16 16 :left)
                        " "
                        filename-and-process)
                  (mark modified read-only " "
                        (name 18 18 :left :elide)
                        " "
                        (size 9 -1 :right)
                        " "
                        (mode 16 16 :left :elide)
                        " " filename-and-process)
                  (mark " "
                        (name 16 -1)
                        " " filename))))

(use-package ibuffer-vc                 ; Group buffers by VC project and status
  :ensure t
  :defer t
  :init (add-hook 'ibuffer-hook
                  (lambda ()
                    (ibuffer-vc-set-filter-groups-by-vc-root)
                    (unless (eq ibuffer-sorting-mode 'alphabetic)
                      (ibuffer-do-sort-by-alphabetic)))))


(use-package fullframe
  :ensure t
  :defer t
  :init
  (progn
    (fullframe magit-status magit-mode-quit-window)
    (fullframe list-packages quit-window)))

(use-package hydra
  :ensure t
  :defer t
  :init
  (defhydra hydra-zoom (global-map "<f2>")
    "zoom"
    ("g" text-scale-increase)
    ("l" text-scale-decrease)))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package multiple-cursors
  :ensure t
  :bind ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this))


(use-package cider
  :ensure t
  :config
  (progn
    (add-hook 'cider-mode-hook #'eldoc-mode)
    (setq nrepl-hide-special-buffers t)
    (setq cider-repl-wrap-history t)
    (add-hook 'cider-repl-mode-hook #'paredit-mode)
    (setq cider-boot-parameters "cider repl -s wait")))

(use-package weather-metno
  :ensure t
  :config
  (setq weather-metno-location-name "Edinburgh, UK"
        weather-metno-location-latitude 56
        weather-metno-location-longitude -3.4))

;; (use-package dart-mode
;;   :config
;;   (progn
;;     (setq dart-executable-path "/usr/lib/dart/bin/dart")
;;     (setq dart-analysis-server-snapshot-path
;;           "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot")
;;     (setq dart-enable-analysis-server t)
;;     (add-hook 'dart-mode-hook #'electric-pair-mode)
;;     (add-hook 'dart-mode-hook 'flycheck-mode)
;;     (add-hook 'dart-mode-hook
;;               (lambda ()
;;                 (setq imenu-create-index-function #'dart-imenu-index)))))

;; ;; (use-package flycheck-dart
;; ;;   :init
;; ;;   (add-to-list 'flycheck-checkers 'dart-dartanalyzer))

;; disable magit warning:
(setq magit-last-seen-setup-instructions "1.4.0")

;;; load evil
;; (require 'init-evil)

(menu-bar-mode t)

;; setup

(use-package swiper
  :ensure t
  :bind
  ("M-'" . swiper))

(use-package avy
  :ensure t
  :bind
  ("C-'" . avy-goto-char)
  ("C-;" . avy-goto-char-2))



(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(use-package irony
  :ensure t
  :config
  (progn
    (use-package company-irony
      :ensure t
      :config
      (add-to-list 'company-backends 'company-irony))
    (add-hook 'irony-mode-hook 'electric-pair-mode)
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'my-irony-mode-hook)
    (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)))




(use-package paredit-everywhere
  :ensure t
  :config
  (add-hook 'go-mode-hook 'paredit-everywhere-mode)
  (add-hook 'web-mode-hook 'paredit-everywhere-mode)
  (add-hook 'typescript-mode-hook 'paredit-everywhere-mode))


;; ;; use agressive-indent
;; (use-package aggressive-indent
;;   :ensure t
;;   :config
;;   (global-aggressive-indent-mode nil))

;; setup org-capture

(setq org-directory "~/Dropbox")
(setq org-default-notes-file (concat org-directory "/todo.org"))
(evil-leader/set-key "oc" 'org-capture)

;; use beacon mode
(use-package beacon
  :ensure t
  :config
  (beacon-mode t))

(desktop-save-mode t)

;; setup rust
(use-package rust-mode
  :ensure t
  :config
  (progn
    (use-package racer
      :ensure t
      :config
      (setq racer-rust-src-path
            "/home/martin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"))
    (use-package flycheck-rust
      :ensure t
      :config
      (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
    (add-hook 'rust-mode-hook #'racer-mode)
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (add-hook 'racer-mode-hook #'company-mode)
    (add-hook 'rust-mode-hook #'electric-pair-mode)
    (setq rust-format-on-save t)))

;; nov.el mode
(use-package nov
  :ensure t
  :config
  (push '("\\.epub\\'" . nov-mode) auto-mode-alist))

;; haskell mode
(use-package haskell-mode
  :ensure t)

(use-package intero
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(use-package elm-mode
  :ensure t
  :config
  (setq exec-path (append exec-path '("/home/martin/.npm-packages/bin/")))
  (setq elm-tags-on-save t)
  (setq elm-tags-exclude-elm-stuff nil)
  (add-to-list 'company-backends 'company-elm))





(provide 'init)



;;; init.el ends here









