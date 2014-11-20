(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/languages"))

(require 'package)
(package-initialize)

(setq package-enable-at-startup nil)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(eval-when-compile (require 'cl))

(require 'cjg-core)
(require 'cjg-theme)
(require 'cjg-elisp-slime-nav)
(require 'cjg-ibuffer)
(require 'cjg-dired)
(require 'cjg-ido)
(require 'cjg-linum)
(require 'cjg-git-gutter)
(require 'cjg-magit)
(require 'cjg-flycheck)
(require 'cjg-projects)
(require 'cjg-evil)
(require 'cjg-package-list)

;; languages

(require 'cjg-web)
(require 'cjg-js)
;; (require 'cl) ;; temporary work around for php mode until bug gets fixed
(require 'cjg-php)
(require 'cjg-less)
(require 'cjg-jsx)
