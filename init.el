;; disable tool and Menu bar:

(tool-bar-mode -1)
(menu-bar-mode -1)

;; disable scroll bar , load-battery. :

(scroll-bar-mode -1)
(display-battery-mode 1)
(set-fringe-mode 0)

;; set default font:

(set-frame-font "Source Code Pro-11")

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
(require 'auto-complete-config)
(require 'auto-complete-extension)
(add-to-list 'ac-dictionary-directories "/home/martin/.emacs.d//ac-dict")

;; end of auto-complete setup



;; use y/n instead of yes / no:
(defalias 'yes-or-no-p 'y-or-n-p)

;; flymake-mode for haskell:
(require 'flymake)

;; optional setting
;; if you want to use flymake always, then add the following hook.
(add-hook
 'haskell-mode-hook
 '(lambda ()
    (if (not (null buffer-file-name)) (flymake-mode))))

(add-hook 'haskell-mode-hook 'flymake-hlint-load)

;; enable ido-mode:
(setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1)

;; toggle window-split:

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))


;; python jedi setup:
(setq jedi:setup-keys t)
(add-hook 'python-mode-hook 'jedi:setup)


;; auto-complete the 2nd.
(when (require 'auto-complete-config)
  ; Load the default configs and do some further tweaking
  (ac-config-default)
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous)

  ;; default sources of candidates
  (setq-default ac-sources (cons 'ac-source-yasnippet ac-sources))

  ;; A new way of adding keywords is through dictionary:
  ; Any user defined keywords go here
  ;(add-to-list 'ac-user-dictionary "foobar@example.com")
  ; mode-specific keywords
  (add-to-list 'ac-dictionary-directories "~/Emacs/auto-complete/dict")

  
  ;; Somehow the hook doesn't enable auto-complete-mode for Haskell although it should
  ; ac-modes lists all modes with auto-complete enabled
  (setq ac-modes
      (append '(scheme-mode haskell-mode literate-haskell-mode tuareg-mode js-mode inferior-haskell-mode)
              ac-modes)))


(add-hook 'inferior-haskell-mode-hook
   (lambda ()
     (setq ac-sources '(my/ac-source-haskell ac-source-dictionary ac-source-words-in-same-mode-buffers)
     )))

;; end of auto-complete for haskell 

;; weather-metno-setup:
(setq weather-metno-location-name "City_of_Edinburgh,Scotland"
      weather-metno-location-latitude 56
      weather-metno-location-longitude 3)
