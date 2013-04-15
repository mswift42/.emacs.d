;; set custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
 
;; disable tool and Menu bar:
 
(tool-bar-mode -1)
(menu-bar-mode -1)
 
;; disable scroll bar , load-battery. :
 
(scroll-bar-mode -1)
(display-battery-mode 1)
(set-fringe-mode 0)
 
;; set default font:
 
(set-frame-font "Source Code Pro-11")
 
;;(add-to-list 'load-path "~/.emacs.d/evil-setup.el")
 
(add-to-list 'load-path "~/.emacs.d/")
 
;; add repos for elpa
 
(require 'package)
 
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
 			 ("marmalade" . "http://marmalade-repo.org/packages/")
 			 ("melpa" . "http://melpa.milkbox.net/packages/")))
 
(package-initialize)
 
;; end of elpa setup

;; set themes directory:

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
 
;; add key-chords
(require 'key-chord)
(key-chord-mode 1)
 
;; evil setup:
(require 'evil-setup)
 
;; set theme :
(load-theme 'solarized-dark)
 
 
;; add winner-mode
(winner-mode 1)
 
;; add auto-complete
(require 'auto-complete-config)
(require 'auto-complete-extension)
(add-to-list 'ac-dictionary-directories "/home/martin/.emacs.d//ac-dict")
 
;; end of auto-complete setup
 
 
 
;; use y/n instead of yes / no:
(defalias 'yes-or-no-p 'y-or-n-p)
 
;; flymake-mode for haskell:
(require 'flymake)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'flymake-mode nil)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'flymake-hlint-load)
(add-hook 'haskell-mode-hook 'flymake-mode t)
(add-hook 'haskell-mode-hook 'eldoc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)



;; enable ido-mode:
(setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1)

;; setup smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; toggle window-split:

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))


;; python jedi setup:
(setq jedi:setup-keys t)
(add-hook 'python-mode-hook 'jedi:setup)


;; auto-complete the 2nd.
(when (require 'auto-complete-config)
  ; Load the default configs and do some further tweaking
  (ac-config-default)
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous)

  ;; default sources of candidates
  (setq-default ac-sources (cons 'ac-source-yasnippet ac-sources))

  ;; A new way of adding keywords is through dictionary:
  ; Any user defined keywords go here
  ;(add-to-list 'ac-user-dictionary "foobar@example.com")
  ; mode-specific keywords
  (add-to-list 'ac-dictionary-directories "~/Emacs/auto-complete/dict")

  
  ;; Somehow the hook doesn't enable auto-complete-mode for Haskell although it should
  ; ac-modes lists all modes with auto-complete enabled
  (setq ac-modes
      (append '(scheme-mode haskell-mode literate-haskell-mode tuareg-mode js-mode inferior-haskell-mode scala-mode scala-mode2)
              ac-modes)))


(add-hook 'inferior-haskell-mode-hook
   (lambda ()
     (setq ac-sources '(my/ac-source-haskell ac-source-dictionary ac-source-words-in-same-mode-buffers)
     )))

;; end of auto-complete for haskell 

;; weather-metno-setup:
(setq weather-metno-location-name "City_of_Edinburgh,Scotland"
      weather-metno-location-latitude 55
      weather-metno-location-longitude 3)

;; org-capture:
(setq org-default-notes-file (expand-file-name "~/todo.org"))



;; Org-mode setup:



(setq org-default-notes-file (expand-file-name "~/notes.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/todo.org" "Tasks")
         "* TODO %?\n  %i\n  %a")))

;; end of org-mode .


(setq evil-default-cursor t)

;; ;; load the ensime lisp code...
;; (add-to-list 'load-path "~/ensime_2.9.2-0.9.8.9/elisp")
;; (require 'ensime)

;; ;; This step causes the ensime-mode to be started whenever
;; ;; scala-mode is started for a buffer. You may have to customize this step
;; ;; if you're not using the standard scala mode.
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; setup python :
(setq py-install-directory "~/.emacs.d/site-lisp/python-mode.el-6.1.1")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)


;; switch window contents
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

;; End of switch window contents.

;; Sunrise / Sunset ThemeChanger
(setq calendar-location-name "Edinburgh, UK")
(setq calendar-latitude 56.0 )
(setq calendar-longitude -3.2)

;; setup Ruby:
(require 'ruby-tools)
(require 'ruby-electric)
(add-hook 'ruby-mode 'ruby-tools-mode 1)
(add-hook 'ruby-mode 'ruby-electric-mode)

;; setup Yasnippet :
(yas-global-mode 1)

;; common Lisp:
;; paredit hook:
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

;; swap '(' with '[' :
(define-key paredit-mode-map (kbd "[") 'paredit-open-round)
(define-key paredit-mode-map (kbd "]") 'paredit-close-round)
(define-key paredit-mode-map (kbd "M-[") 'paredit-wrap-round)
(define-key paredit-mode-map (kbd "(") 'paredit-open-square)
(define-key paredit-mode-map (kbd ")") 'paredit-close-square)
