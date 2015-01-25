(require-package 'magit)
(require-package 'git-commit-mode)
(require-package 'git-rebase-mode)
(require-package 'gitignore-mode)

(global-set-key (kbd "M-<f12>") 'magit-status)

(provide 'init-git)
