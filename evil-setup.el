(provide 'evil-setup)

(require 'evil)

(require 'evil-leader)
(require 'surround)
(evil-mode 1)

(key-chord-define evil-normal-state-map "kj" 'evil-force-normal-state)
(key-chord-define evil-visual-state-map "kj" 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-define evil-replace-state-map "kj" 'evil-normal-state)

;; evil-leader setup:

(evil-leader/set-leader ",")
(evil-leader/set-key
  "m" 'magit-status
  "g r" 'golden-ratio
  "t w" 'toggle-window-split
  "c" 'kill-buffer
  "f" 'find-file
  "b" 'switch-to-buffer
  "h" 'windmove-left
  "l" 'windmove-right
  "j" 'windmove-down
  "k" 'windmove-up)



