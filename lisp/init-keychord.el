;;; setup keychord and bindings.
(require-package 'key-chord)

(key-chord-mode 1)
(defun assign-keychord (list)
  "use an alist to assign keychord shortcuts to a command."
  (cl-loop for (shortcut . command) in list
           do (keychord-define-global shortcut command)))

(assign-keychords '(("vb" . ido-switch-buffer)
                    ("kj" . ace-jump-mode)
                    ("nm" . magit-status)
                    ("gr" . golden-ratio)
                    ("rw" . rotate-windows)
                    ("tw" . toggle-window-split)
                    ("sc" . org-capture)))

