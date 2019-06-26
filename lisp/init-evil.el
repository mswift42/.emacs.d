;; setup evil mode



(use-package evil
  :ensure t
  :init
  (progn
    (evil-mode t)
    (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state))
  :config
  (progn
    (use-package evil-leader
      :ensure t
      :init
      (progn
        (global-evil-leader-mode)
        (setq evil-leader/in-all-states 1)
        (evil-leader/set-leader "<SPC>")
        (evil-leader/set-key "c" 'compile)
        (evil-leader/set-key "m" 'magit-status)
        (evil-leader/set-key "fj" 'frog-jump-buffer)
        (evil-leader/set-key "sb" 'ido-switch-buffer)
        (evil-leader/set-key "sc" 'org-capture)
        (evil-leader/set-key "k" 'ido-kill-buffer)))
    (use-package evil-surround
      :ensure t
      :config
      (progn
        (global-evil-surround-mode)))
    (use-package evil-escape
      :ensure t
      :config
      (progn
        (evil-escape-mode)
        (setq-default evil-escape-key-sequence "tn")))
    (defvar evil-emacs-state-cursor)
    (defvar evil-normal-state-cursor)
    (defvar evil-visual-state-cursor)
    (defvar evil-insert-state-cursor)
    (defvar evil-replace-state-cursor)
    (defvar evil-operator-state-cursor)
    (defvar evil-normal-state-map)
    (defvar evil-insert-state-map)

    (setq evil-emacs-state-cursor '("red" box))
    (setq evil-normal-state-cursor '("green" box))
    (setq evil-visual-state-cursor '("orange" box))
    (setq evil-insert-state-cursor '("red" bar))
    (setq evil-replace-state-cursor '("red" bar))
    (setq evil-operator-state-cursor '("red" ))
    (define-key evil-normal-state-map "p" 'evil-paste-after)
    (define-key evil-normal-state-map "P" 'evil-paste-before)
    (define-key evil-normal-state-map (kbd "C-s") 'save-buffer)
    (define-key evil-normal-state-map (kbd "C-]") (kbd "\\ M-."))))


(provide 'init-evil)
;;; init-evil ends here


