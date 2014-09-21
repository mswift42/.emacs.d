;;; setup company mode-name

(require-package 'company)
(require-package 'company-go)

(setq company-tooltip-limit 20)
(setq company-idle-delay .3)
(setq company-echo-delay 0)

(setq company-begin-commands '(self-insert-command))



(provide 'init-company)
