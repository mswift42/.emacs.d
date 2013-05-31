(provide 'evil-setup)

(require 'evil)

(require 'evil-leader)
(require 'surround)
(global-surround-mode 1)
(evil-mode 1)
(global-evil-leader-mode t)

;; emacs keybindings in insert-state:
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-emacs-state)

(key-chord-define evil-normal-state-map "kj" 'evil-force-normal-state)
(key-chord-define evil-visual-state-map "kj" 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-define evil-replace-state-map "kj" 'evil-normal-state)

;; evil-leader setup:

(evil-leader/set-leader ";")
(evil-leader/set-key
  "m" 'magit-status
  "g r" 'golden-ratio
  "t w" 'toggle-window-split
  "c w" 'rotate-windows
  "f" 'find-file
  "r" 'ido-recentf-open
  "b" 'switch-to-buffer
  "h" 'windmove-left
  "l" 'windmove-right
  "j" 'windmove-down
  "k" 'windmove-up
  "w b" 'winner-undo
  "w r" 'winner-redo
  "o c" 'org-capture)



