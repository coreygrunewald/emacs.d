(global-hl-line-mode +1)
(show-paren-mode +1)

(use-package planet-theme
  :ensure planet-theme
  :init
  (progn
    (require 'planet-theme)
    (load-theme 'planet t)
    (set-face-background 'hl-line "gray11")
    (set-face-foreground 'highlight nil)
    ))

(provide 'cjg-theme)
