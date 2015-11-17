;;; Standard package repositories
(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; We include the org repository for completeness, but don't normally
;; use it.
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))


;;; Also use Melpa for most packages
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; But don't take Melpa versions of certain packages
(setq package-filter-function
      (lambda (package version archive)
        (or (not (string-equal archive "melpa"))
            (not (memq package '())))))




(package-initialize)


(unless (package-installed-p 'use-package)
  (package-refresch-contents)
  (package-install 'use-package))


(provide 'init-elpa)
