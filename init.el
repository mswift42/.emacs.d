;; disable tool and Menu bar:
(tool-bar-mode -1)
(menu-bar-mode -1)


;; add repos for elpa

(require 'package)

 (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;; end of elpa setup


;; evil setup:

(require 'evil)
(require 'evil-leader)
(require 'surround)
(evil-mode 1)

;; set theme :
(load-theme 'gruber-darker t)







