;;(use-package color-theme-sanityinc-tomorrow
;;  :ensure color-theme-sanityinc-tomorrow
;;  :init
;;  (progn
;;    (require 'color-theme-sanityinc-tomorrow)
;;    (load-theme 'sanityinc-tomorrow-night t)))

(global-hl-line-mode +1)
(show-paren-mode +1)

(use-package ample-theme
  :ensure ample-theme
  :init
  (progn
    (require 'ample-theme)
    (load-theme 'ample-flat t)))

(provide 'cjg-theme)
