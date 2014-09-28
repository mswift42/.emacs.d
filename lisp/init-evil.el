;;; Setup Evil
(require-package 'evil)
(require-package 'evil-nerd-commenter)
(require-package 'evil-surround)
(require-package 'evil-matchit)


;; color cursor:
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))


(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)


(provide 'init-evil)
