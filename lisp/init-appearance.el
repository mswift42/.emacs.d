;;; init-appearance.el --- theme,fonts and menu      -*- lexical-binding: t; -*-
;; disable toolbar 
(tool-bar-mode -1)
(column-number-mode t)

(scroll-bar-mode -1)

(defun disable-all-themes ()
  "disable all custom enabled themes"
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(use-package color-theme-sanityinc-solarized
  :ensure t)

(load-theme 'sanityinc-solarized-light)

(global-hl-line-mode t)
(set-frame-font "Inconsolata 11")

(provide 'init-appearance)
	     

