(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org"   . "http://orgmode.org/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")))

(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/languages"))

(require 'package)
(package-initialize)

(setq package-enable-at-startup nil)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(progn
  (require 'elisp-slime-nav)
  (defun cjg-lisp-hook ()
    (elisp-slime-nav-mode)
    (turn-on-eldoc-mode))
  (add-hook 'emacs-lisp-mode-hook 'cjg-lisp-hook))

(require 'use-package)
(require 'cjg-core)
(require 'cjg-ibuffer)
(require 'cjg-dired)
(require 'cjg-ido)
(require 'cjg-linum)
(require 'cjg-web)
(require 'cjg-js)
(require 'cjg-less)
(require 'cjg-evil)

(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-night t)
