;; setup evil mode

(defun kill-both-buffers ()
    "if using package manager and updating packages,
     this command will kill the current buffer and the
     other buffer, in this case, the compilation buffer."
  (interactive)
  (kill-buffer (current-buffer))
  (kill-buffer (other-buffer)))

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
        (evil-leader/set-key "f" 'evil-ace-jump-word-mode)
        (evil-leader/set-key "c" 'compile)
        (evil-leader/set-key "m" 'magit-status)
        (evil-leader/set-key "h" 'helm-mini)
        (evil-leader/set-key "of" 'helm-find-files)
        (evil-leader/set-key "vb" 'ido-switch-buffer)
        (evil-leader/set-key "sc" 'org-capture)
        (evil-leader/set-key "q" 'kill-both-buffers)
        (evil-leader/set-key "k" 'ido-kill-buffer)))
    (use-package evil-surround
      :ensure t
      :config
      (progn
        (global-evil-surround-mode)))
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
    (define-key evil-normal-state-map (kbd "C-]") (kbd "\\ M-."))
    (evil-set-initial-state 'git-commit-mode 'insert)))


(provide 'init-evil)
;;; init-evil ends here


