;;; Basic Go Mode setup.
(require-package 'go-mode)
(require-package 'go-autocomplete)
(require-package 'go-errcheck)
(setq gofmt-cmd "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;; set go mode as subword mode:
(add-hook 'go-mode-hook 'subword-mode t)

(add-hook 'go-mode-hook 'go-eldoc-setup)

;; load oracle:

(load-file "~/go/src/code.google.com/p/go.tools/cmd/oracle/oracle.el" )

(provide 'init-go)
