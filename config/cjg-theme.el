(global-hl-line-mode +1)
(show-paren-mode +1)

(use-package planet-theme
  :ensure planet-theme
  :init
  (progn
    (require 'planet-theme)
    (load-theme 'planet t)
    (set-face-background 'hl-line "#0a0b0e")
    (set-face-foreground 'highlight nil)
    ))

;;(use-package moe-theme
;;  :ensure moe-theme
;;  :init
;;  (progn
;;    (require 'moe-theme)
;;    (moe-dark)))

(provide 'cjg-theme)
