(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("e9a1226ffed627ec58294d77c62aa9561ec5f42309a1f7a2423c6227e34e3581" "5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa" "3dd173744ae0990dd72094caef06c0b9176b3d98f0ee5d822d6a7e487c88d548" "246a51f19b632c27d7071877ea99805d4f8131b0ff7acb8a607d4fd1c101e163" "085f323fe46529bf4526eaf7b5ae8dfb87415a68150db71a60a86c2e44329923" "967c58175840fcea30b56f2a5a326b232d4939393bed59339d21e46cf4798ecf" "d347797c547ca95a11a2fa34ca1a825b5c4c80bfbb30e9b4fd34977f405fd746" default)))
 '(flycheck-highlighting-mode (quote lines))
 '(haskell-mode-hook (quote (turn-on-haskell-doc-mode)))
 '(linum-format " %7d ")
 '(main-line-color1 "#191919")
 '(main-line-color2 "#111111")
 '(powerline-color1 "#191919")
 '(powerline-color2 "#111111")
 '(py-load-pymacs-p nil)
 '(py-shebang-startstring "#! /bin/env python3")
 '(py-shell-name "python3")
 '(py-shell-toggle-1 "python3")
 '(python-mode-hook (quote ((lambda nil (setq indent-tabs-mode py-indent-tabs-mode) (set (make-local-variable (quote beginning-of-defun-function)) (quote py-beginning-of-def-or-class)) (set (make-local-variable (quote end-of-defun-function)) (quote py-end-of-def-or-class))) py-set-ffap-form jedi:setup pylint-python-hook flycheck-mode)))
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))
