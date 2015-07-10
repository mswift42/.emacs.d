;;; init-web.el html, css and javascript stuff

(use-package web-mode
  :ensure t
  :mode "\\.html\\'"
  :init
  (progn
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (use-package emmet-mode
      :ensure t
      :init
      (add-hook 'web-mode-hook 'emmet-mode t)
      :config
      (diminish 'emmet-mode))))

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :config
  (progn
    (use-package js2-refactor
      :ensure t)
    (use-package tern
      :ensure t
      :init
      (add-hook 'js2-mode-hook 'tern-mode))
    (use-package company-tern
      :ensure t
      :init
      (progn
        (add-hook 'js2-mode-hook 'company-mode)
        (add-to-list 'company-backends 'company-tern)
        ))
    (add-hook 'js2-mode-hook 'electric-pair-mode)))

(provide 'init-web)
