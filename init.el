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

(require 'cjg-core)
(require 'cjg-theme)
(require 'cjg-fonts)
(require 'cjg-elisp-slime-nav)
(require 'cjg-buffers)
(require 'cjg-dired)
;; (require 'cjg-ido)
(require 'cjg-autocomplete)
(require 'cjg-linum)
(require 'cjg-git-gutter)
(require 'cjg-magit)
(require 'cjg-flycheck)
(require 'cjg-projects)
(require 'cjg-help)
(require 'cjg-helm)
(require 'cjg-package-list)
(require 'cjg-powerline)
(require 'cjg-indentation)

;; languages

(require 'cjg-web)
(require 'cjg-js)
(require 'cjg-php)
(require 'cjg-less)
;; (require 'cjg-jsx)
(require 'cjg-groovy)
(require 'cjg-org)

;; evil

(require 'cjg-evil)
