(use-package smart-mode-line
  :ensure smart-mode-line
  :init
  (progn
    (sml/setup)
    (setq sml/shorten-directory nil)
    (sml/apply-theme 'dark))
  )

(provide 'cjg-powerline)
