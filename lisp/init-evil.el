;;; Setup Evil
(require-package 'evil)
(evil-mode t)
(require-package 'evil-leader)
(require-package 'evil-nerd-commenter)
(require-package 'evil-surround)
(require-package 'evil-matchit)


;; color cursor:
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" ))


(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "f" 'evil-ace-jump-word-mode)
(global-evil-surround-mode 1)
(define-key evil-normal-state-map "p" 'evil-paste-after)
(define-key evil-normal-state-map "P" 'evil-paste-before)
;; undo
(define-key evil-normal-state-map "u" 'undo)
(evil-leader/set-key "c" 'compile)

(when (fboundp 'undo-tree-undo)
  (define-key evil-normal-state-map "u" 'undo-tree-undo)
  (define-key evil-normal-state-map "\C-r" 'undo-tree-redo))
(define-key evil-normal-state-map "=" 'evil-indent)
(provide 'init-evil)
;;; init-evil ends here
