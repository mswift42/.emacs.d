;; set custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; disable yes-or-no
(fset 'yes-or-no-p-history 'y-or-n-p)
;; package init

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

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


(require 'init-appearance)

;; setup magit
(use-package magit
  :ensure t
  :bind ("M-<f12>" . magit-status))

(require 'init-web)

;; setup ace-isearch
(use-package ace-isearch
  :ensure t
  :defer t
  :idle (global-ace-isearch-mode t))

;; setup paredit
(use-package paredit
  :ensure t
  :init
  (dolist (hook '(emacs-lisp-mode-hook lisp-mode-hook geiser-mode-hook
				       clojure-mode-hook))
    (add-hook hook 'paredit-mode))
  :diminish paredit-mode)

(use-package flycheck
  :ensure t
  :defer t
  :idle (global-flycheck-mode))

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



(use-package ido-ubiquitous             ; IDO everywhere, really!
  :ensure t
  :init (progn 
	  (require 'ido)
	  (ido-ubiquitous-mode)))

(use-package flx-ido                    ; Flex matching for IDO
  :ensure t
  :init (flx-ido-mode))

(use-package company               
  :ensure t
  :defer t
  :idle (global-company-mode)
  :config
  (progn
    ;; Use Company for completion
    (bind-key [remap completion-at-point] #'company-complete company-mode-map)

    (setq company-tooltip-align-annotations t
          ;; Easy navigation to candidates with M-<n>
          company-show-numbers t))
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
    (add-hook 'before-save-hook 'gofmt-before-save)
    (bind-key [remap find-tag] #'godef-jump)
    (bind-key (kbd "C-c C-r") #'go-remove-unused-imports)))

(use-package go-eldoc
  :ensure t
  :defer
  :idle
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
  :idle
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


;; setup 





