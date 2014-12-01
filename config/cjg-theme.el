(global-hl-line-mode +1)
(show-paren-mode +1)

;;(use-package color-theme-sanityinc-tomorrow
;;  :ensure color-theme-sanityinc-tomorrow
;;  :init
;;  (progn
;;    ;;(require 'color-theme-sanityinc-tomorrow)
;;    ;;(load-theme 'sanityinc-tomorrow-night t)
;;    ))
;;
;;(use-package ample-theme
;;  :ensure ample-theme
;;  :init
;;  (progn
;;    ;;(require 'ample-theme)
;;    ;;(load-theme 'ample-flat t)
;;    ))
;;
;;(use-package lush-theme
;;  :ensure lush-theme
;;  :init
;;  (progn
;;    ;;(require 'lush-theme)
;;    ;;(load-theme 'lush t)
;;    ))
;;
;;(use-package smyx-theme
;;  :ensure smyx-theme
;;  :init
;;  (progn
;;    ;;(require 'smyx-theme)
;;    ;;(load-theme 'smyx t)
;;    ))

(use-package planet-theme
  :ensure planet-theme
  :init
  (progn
    (require 'planet-theme)
    (load-theme 'planet t)
    (set-face-background 'hl-line "gray11")
    (set-face-foreground 'highlight nil)
    ))

;;(use-package seti-theme
;;  :ensure seti-theme
;;  :init
;;  (progn
;;    ;;(require 'seti-theme)
;;    ;;(load-theme 'seti t)
;;    ))

(provide 'cjg-theme)
