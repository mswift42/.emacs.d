(require-package 'js2-mode)
(require-package 'coffee-mode)
(require-package 'ac-js2)
(require-package 'js-comint)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(after-load 'js2-mode
  ;; Disable js2 mode's syntax error highlighting by default...
  (setq-default js2-mode-show-parse-errors nil
                js2-mode-show-strict-warnings nil)
  ;; ... but enable it if flycheck can't handle javascript
  (autoload 'flycheck-get-checker-for-buffer "flycheck"))

(require-package 'rainbow-delimiters)

(add-hook 'js2-mode-hook 'rainbow-delimiters-mode)


;; inferior js-mode:

(setq inferior-js-program-command "js")

(defvar inferior-js-minor-mode-map (make-sparse-keymap))
(define-key inferior-js-minor-mode-map "\C-x\C-e" 'js-send-last-sexp)
(define-key inferior-js-minor-mode-map "\C-\M-x" 'js-send-last-sexp-and-go)
(define-key inferior-js-minor-mode-map "\C-cb" 'js-send-buffer)
(define-key inferior-js-minor-mode-map "\C-c\C-b" 'js-send-buffer-and-go)
(define-key inferior-js-minor-mode-map "\C-cl" 'js-load-file-and-go)

(define-minor-mode inferior-js-keys-mode
  "Bindings for communicating with an inferior js interpreter."
  nil " InfJS" inferior-js-minor-mode-map)

(add-hook 'js2-mode-hook 'inferior-js-keys-mode)
(setq inferior-js-program-command "node")

(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\033\\[[0-9]+[A-Z]" "" output)
           (replace-regexp-in-string ".*1G.*3G" "&GT;" output)
           (replace-regexp-in-string "&GT;" "> " output)))))

(setenv "NODE_NO_READLINE" "1")

;; load tern
(add-to-list 'load-path "~/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (electric-pair-mode t)))
(add-hook 'js2-mode-hook (lambda () (electric-indent-mode -1)))

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))


(setq ac-js2-evaluate-calls t)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(add-hook 'jsx-mode-hook 'auto-complete-mode)

(add-hook 'jsx-mode-hook (lambda () (electric-indent-mode -1)))


(provide 'init-javascript)

;;; init-javascript ends here
