(provide 'evil-setup)

(require 'evil)

(require 'evil-leader)
(require 'surround)
(evil-mode 1)

(key-chord-define evil-normal-state-map "kj" 'evil-force-normal-state)
(key-chord-define evil-visual-state-map "kj" 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-define evil-replace-state-map "kj" 'evil-normal-state)
