;; set custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)



;; after-load / add-auto-mode - taken from Purcell's .emacs.d/
(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-elpa)
 
(require 'init-appearance)
 
(require 'init-autocomplete)
(require 'init-magnars)
(require 'pp-c-l)
(pretty-control-l-mode t)
 
(require-package 'ws-butler)
(ws-butler-global-mode)
(ido-mode t)
(require-package 'ido-better-flex)
(ido-everywhere t)
(ido-better-flex/enable)
(require-package 'ido-ubiquitous)

;; setup flycheck:

(require-package 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

(setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
      flycheck-idle-change-delay 0.4)

;; load ace-jump mode:
(require-package 'ace-jump-mode)
;; load go-mode:
(require 'init-go)

;; load key-chords
;; (require 'init-keychord)

;; setup ibuffer:
(require-package 'ibuffer-vc)
(add-hook 'ibuffer-hook 'ibuffer-vc-set-filter-groups-by-vc-root)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(require 'init-evil)

 
;; add key-chords
(require-package 'slime)
;;load slime-helper for quicklisp:
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq slime-lisp-implementations
      '((sbcl ("sbcl") :coding-system utf-8-unix)))
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
(slime-setup '(slime-fancy slime-tramp slime-asdf))


(unless (package-installed-p 'cider)
  (package-install 'cider))

(add-hook 'cider-repl-mode-hook 'paredit-mode)



;; end of multiple cursors




;; add winner-mode
(winner-mode 1)
 
 
;; end of auto-complete setup
;; map "C-h" to Delete char.
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

 
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

;; Add hook to start auto insert mode when starting el files.
(add-hook 'elisp-mode 'auto-insert-mode t)
(add-to-list 'completion-ignored-extensions ".hi")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;; enable ido-mode:
(setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1)

;; setup smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "<menu>") 'smex)



;; python jedi setup:
(setq jedi:setup-keys t)
(add-hook 'python-mode-hook 'jedi:setup)




;; set location to Edinburgh:
(setq calendar-latitude 55.95)
(setq calendar-longitude -3.18)
(setq calendar-location-name "Edinburgh, UK")



;; org-capture:
(setq org-default-notes-file (expand-file-name "~/todo.org"))
;; Org-mode setup:

(define-key mode-specific-map [?a] 'org-agenda)
(setq org-default-notes-file (expand-file-name "~/notes.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/todo.org" "Tasks")
         "* TODO %?\n  %i\n  %a")))

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-log-done 'note) ;; timelogging of when changing a TODO to DONE.

(require-package 'auctex) 

;(add-to-list 'org-export-latex-classes
  ;'("koma-article"
      ;"\\documentclass{scrartcl}"
             ;("\\section{%s}" . "\\section*{%s}")
             ;("\\subsection{%s}" . "\\subsection*{%s}")
             ;("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ;("\\paragraph{%s}" . "\\paragraph*{%s}")
             ;("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;;; "\\documentclass[11pt,a4paper]{article}
;;; \\usepackage[T1]{fontenc}
;;; \\usepackage{fontspec}
;;; \\usepackage{graphicx} 
;;; \\defaultfontfeatures{Mapping=tex-text}
;;; \\setromanfont{Gentium}
;;; \\setromanfont [BoldFont={Gentium Basic Bold},
;;;                 ItalicFont={Gentium Basic Italic}]{Gentium Basic}
;;; \\setsansfont{Charis SIL}
;;; \\setmonofont[Scale=0.8]{DejaVu Sans Mono}
;;; \\usepackage{geometry}
;;; \\geometry{a4paper, textwidth=6.5in, textheight=10in,
;;;             marginparsep=7pt, marginparwidth=.6in}
;;; \\pagestyle{empty}
;;; \\title{}
;;;       [NO-DEFAULT-PACKAGES]
;;;       [NO-PACKAGES]"
;;;      ("\\section{%s}" . "\\section*{%s}")
;;;      ("\\subsection{%s}" . "\\subsection*{%s}")
;;;      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;;      ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;;      ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;(setq org-latex-to-pdf-process 
  ;'("xelatex -interaction nonstopmode %f"
     ;"xelatex -interaction nonstopmode %f")) ;; for multiple passes

;;; end of org-mode .


;;;(setq evil-default-cursor t)

;; ;; load the ensime lisp code...
;; (add-to-list 'load-path "~/ensime_2.9.2-0.9.8.9/elisp")
;; (require 'ensime)

;; ;; This step causes the ensime-mode to be started whenever
;; ;; scala-mode is started for a buffer. You may have to customize this step
;; ;; if you're not using the standard scala mode.
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; setup python :




(add-auto-mode 'python-mode "\\.py\\'" "\\.py3\\'")
(add-hook 'python-mode-hook 'elpy-mode)
(setq py-load-pymacs-p t)


;; Sunrise / Sunset ThemeChanger
(setq calendar-location-name "Edinburgh, UK")
(setq calendar-latitude 56.0 )
(setq calendar-longitude -3.2)

;; setup Ruby:

(add-auto-mode 'ruby-mode
               "Rakefile\\'" "\\.rake\\'" "\\.rxml\\'"
               "\\.rjs\\'" "\\.irbrc\\'" "\\.pryrc\\'" "\\.builder\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'" "Kirkfile\\'")
(require 'ruby-tools)
(require 'ruby-electric)
(add-hook 'ruby-mode 'ruby-tools-mode 1)
(add-hook 'ruby-mode 'ruby-electric-mode)
(add-hook 'ruby-mode-hook 'subword-mode)
(require 'inf-ruby)
(require 'ac-inf-ruby)
(after-load 'auto-complete
  (add-to-list 'ac-modes 'inf-ruby-mode))
(add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)
(after-load 'ruby-mode
  (add-hook 'ruby-mode-hook 'robe-mode))
(after-load 'robe
  (add-hook 'robe-mode-hook
	    (lambda ()
	      (add-to-list 'ac-sources 'ac-source-robe)
	      (set-auto-complete-as-completion-at-point-function))))

;; setup Yasnippet :
;;(yas-global-mode 1)

;; dimm rainbow-delimiters
;; (defun krig-paren-clr (n)
;;   (let ((c (+ ?\x59 (* (- n 1) 8))))
;;     (format "#%X%X%X" c c c)))

;; (defun krig-rainbow-face-n (n)
;;   (intern (format "rainbow-delimiters-depth-%d-face" n)))


;; common Lisp:
;; paredit hook:
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;;(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
;;(add-hook 'lisp-mode-hook 'highlight-parentheses-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;;(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'show-paren-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook
 'lisp-mode-hook
	  (lambda ()
	    (font-lock-add-keywords nil
  				    '(("deftest" . font-lock-keyword-face)
				      ("clunit:assert-equal" . font-lock-keyword-face)
				      ("clunit:assert-true" . font-lock-keyword-face)
				      ("clunit:defsuite" . font-lock-keyword-face)
				      ("clunit:run-suite" . font-lock-keyword-face)))))



(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode t)))
;; (defun cliki:start-slime ()
;;   (save-excursion (slime)))





(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))



;; setup Clojure:
(add-hook 'clojure-mode-hook 'paredit-mode)
;(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
;; (cl-loop for i from 1 to 9 do
;; 	 (set-face-foreground (krig-rainbow-face-n i)
;; 			      (krig-paren-clr i)))

;;(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
;; (add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
;; (setq nrepl-hide-special-buffers t)
;; (add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
;; (add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'nrepl-mode))

;;recentf -mode
(require 'recentf)
 
;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
 
;; enable recent files mode.
(recentf-mode t)
 
; 50 files ought to be enough.
(setq recentf-max-saved-items 50)
 
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;; end of recentf-mode.
;; open-line-above
(defun smart-open-line-above ()
  "Insert an empty line above the current line."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))


(global-set-key (kbd "M-o") 'smart-open-line-above)




;;end of smart-open line

;; set sml-path:
;; (setq sml-program-name "/usr/lib/smlnj/bin/sml")





;; ;; ;; ;; Try JDEE:
;; (add-to-list 'load-path "~/.emacs.d/jdee-2.4.1/lisp")
;; (load "jde")


;; (add-hook 'java-mode-hook '(lambda ()
;; 			     (load "jde")
;; 			     (global-semantic-idle-completions-mode t)
;; 			     (global-semantic-decoration-mode t)
;; 			     (global-semantic-highlight-func-mode t)
;; 			     (global-semantic-show-unmatched-syntax-mode t)
;; 			     (jde-mode)
;; 			     (setq ac-sources (append '(ac-source-semantic) ac-sources))
;; 			     (local-set-key (kbd "RET") 'newline-and-indent)
;;			     (semantic-mode t)
;; ))
(defun lispdoc ()
  "Searches lispdoc.com for SYMBOL, which is by default the symbol currently under the curser"
  (interactive)
  (let* ((word-at-point (word-at-point))
         (symbol-at-point (symbol-at-point))
         (default (symbol-name symbol-at-point))
         (inp (read-from-minibuffer
               (if (or word-at-point symbol-at-point)
                   (concat "Symbol (default " default "): ")
                 "Symbol (no default): "))))
    (if (and (string= inp "") (not word-at-point) (not
                                                   symbol-at-point))
        (message "you didn't enter a symbol!")
      (let ((search-type (read-from-minibuffer
                          "full-text (f) or basic (b) search (default b)? ")))
        (browse-url (concat "http://lispdoc.com?q="
                            (if (string= inp "")
                                default
                              inp)
                            "&search="
                            (if (string-equal search-type "f")
                                "full+text+search"
                              "basic+search")))))))

(define-key lisp-mode-map (kbd "C-c l") 'lispdoc)


;; set yas-expand key
(global-set-key (kbd "C-<tab>") 'yas-expand-from-trigger-key)


;; setup go-mode:
;;(add-hook 'before-save-hook 'gofmt-before-save)

;; setup javascript:
(require 'init-javascript)

(require-package 'emmet-mode)
(require-package 'web-mode)
(add-auto-mode 'web-mode "\\.html\\'")
(add-auto-mode 'web-mode "\\.tmpl\\'")
(add-hook 'web-mode-hook 'emmet-mode)


(defun skewer-start ()
  (interactive)
  (let ((httpd-port 8023))
    (httpd-start)
    (message "Ready to skewer the browser. Now jack in with the bookmarklet.")))

(defun skewer-demo ()
  (interactive)
  (let ((httpd-port 8024))
    (run-skewer)
    (skewer-repl)))



;; (require 'ac-nrepl-compliment)
;; (add-hook 'nrepl-mode-hook 'ac-nrepl-compliment-setup)
;; (add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-compliment-setup)
;; (eval-after-load "auto-complete"
;;    '(add-to-list 'ac-modes 'nrepl-mode))
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook
	  'set-auto-complete-as-completion-at-point-function)





(require-package 'cursor-chg)  ; Load the library

;; hs-lint integreation:
(setenv "PATH" (concat "~/.cabal/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/.cabal/bin")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(require 'hs-lint)

(defun my-haskell-mode-hook ()
   (local-set-key "\C-cl" 'hs-lint))
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)


(add-hook 'haskell-mode-hook 'flymake-hlint-load)
;;(require 'racket-mode)


;; add uniquify
(require 'uniquify)

;; add icomplete
;; (require 'icomplete)

(require-package 'info+)
(put 'narrow-to-region 'disabled nil)
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'turn-on-elisp-slime-nav-mode))

(require-package 'icomplete)
;; icomplete+ setup:
(eval-after-load "icomplete"
  '(progn (require 'icomplete+)))


;; startup Emacs maximized:
(setq initial-frame-alist '((fullscreen . maximized)))

;; use ibuffer instead of normal buffer-list:
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; dark and light functions to quickly change between light and dark theme:
(defun dark ()
  (interactive)
  (disable-theme 'soft-stone)
  (load-theme 'soft-charcoal))

(defun light ()
  (interactive)
  (disable-theme 'soft-charcoal)
  (load-theme 'soft-stone))


(add-hook 'hy-mode-hook 'paredit-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)


;; setup <F5> to compile
(global-set-key (kbd "<f5>") 'compile)

;; set qml-mode for qml files
(add-to-list 'auto-mode-alist '("\\.qml'" . qml-mode))


;; setup cedet:
;; (load-file "~/cedet/cedet-devel-load.el")

;; ;; Add further minor-modes to be enabled by semantic-mode.
;; ;; See doc-string of `semantic-default-submodes' for other things
;; ;; you can use here.
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)

;; ;; Enable Semantic
;; (semantic-mode 1)
