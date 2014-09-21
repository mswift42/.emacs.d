;;; setup theme,font, menubar, scroll-bar ...

;; disable tool and Menu bar:
(tool-bar-mode -1)
(column-number-mode 1)

;; don't use tabs
(setq-default indent-tabs-mode nil)
;; disable scroll bar , load-battery. :
(scroll-bar-mode -1)

(defun disable-all-themes ()
  "disable all custom enabled themes"
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(require-package 'oldlace-theme)
;;; set theme and hl-line mode
(load-theme 'oldlace)
(global-hl-line-mode t)

;; set default font:
(set-frame-font "Camingo Code 10")

(provide 'init-appearance)
;;; init-appearance ends here.
