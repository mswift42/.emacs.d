;; set custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

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

;; load elisp-slime-nav
(use-package elisp-slime-nav
  :ensure t
  :init
  (dolist (i '(emacs-lisp-mode-hook ielm-mode-hook))
    (add-hook i 'elisp-slime-nav-mode)))


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


(require 'init-appearance)

;; setup magit
(use-package magit
  :ensure t
  :bind (("M-<f12>" . magit-status)))

(require 'init-web)







