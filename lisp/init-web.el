;;; init-web.el html, css and javascript stuff

(use-package web-mode
  :ensure t
  :mode "\\.html\\'"
  :init
  (progn
    (use-package emmet-mode
      :ensure t
      :init
      (add-hook 'web-mode-hook 'emmet-mode t))))

(provide 'init-web)
