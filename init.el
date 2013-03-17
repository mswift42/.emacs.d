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

;; add key-chords
(require 'key-chord)
(key-chord-mode 1)

;; evil setup:

(require 'evil)
(require 'evil-leader)
(require 'surround)
(evil-mode 1)

(key-chord-define evil-normal-state-map "kj" 'evil-force-normal-state)
(key-chord-define evil-visual-state-map "kj" 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-define evil-replace-state-map "kj" 'evil-normal-state)

;; set theme :
(load-theme 'gruber-darker t)


;; add winner-mode
(winner-mode 1)

