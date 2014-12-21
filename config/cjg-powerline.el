(use-package smart-mode-line
  :ensure smart-mode-line
  :init
  (progn
    (sml/setup)
    (setq sml/shorten-directory nil)
    (sml/apply-theme 'dark))
  )

(use-package nyan-mode
  :ensure nyan-mode
  :init
  (progn
    (nyan-mode))
  :config
  (progn
    (setq-default nyan-wavy-trail t))
  )

(provide 'cjg-powerline)
