;;; Basic Go Mode setup.
(require-package 'go-mode)
(require-package 'go-autocomplete)
(require-package 'go-errcheck)
(add-hook 'before-save-hook 'gofmt-before-save)

;; set go mode as subword mode:
(add-hook 'go-mode-hook 'subword-mode t)

(add-hook 'go-mode-hook 'go-eldoc-setup)
;; remove unused imports:
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

;; load oracle:

(load-file "~/go/src/code.google.com/p/go.tools/cmd/oracle/oracle.el" )
;; add golint:
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/golang/lint/misc/emacs"))
(require 'golint)

(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))
(require 'go-flycheck)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook (lambda () (flycheck-select-checker 'go-gofmt)
                          (flycheck-mode)))
(add-hook 'go-mode-hook (lambda ()
                         (local-set-key (kbd "M-.") #'godef-jump)))

;; disable electric-indent-mode:

(add-hook 'go-mode-hook (lambda () (electric-indent-local-mode -1)))
(provide 'init-go)

;;; init-go ends here
