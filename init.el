;; disable tool and Menu bar:

(tool-bar-mode -1)
(menu-bar-mode -1)

;; disable scroll bar , load-battery. :

(scroll-bar-mode -1)
(display-battery-mode 1)

;;(add-to-list 'load-path "~/.emacs.d/evil-setup.el")

(add-to-list 'load-path "~/.emacs.d/")

;; add repos for elpa

(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;; end of elpa setup

;; add key-chords
(require 'key-chord)
(key-chord-mode 1)

;; evil setup:
(require 'evil-setup)

;; set theme :
(load-theme 'gruber-darker t)


;; add winner-mode
(winner-mode 1)

;; add auto-complete
(require 'auto-complete-extension)
(auto-complete-mode 1)
;; end of auto-complete setup



