(use-package jsx-mode
  :ensure jsx-mode
  :mode "\\.jsx\\'"
  :config
  (progn
    (add-hook 'jsx-mode-hook
              (lambda()
                (require 'js2-mode)
                (js2-minor-mode)
                (js2-imenu-extras-mode)
                )
              )
    (when (executable-find "tern")
      (add-hook 'jsx-mode-hook 'tern-mode))
    )
  )

(provide 'cjg-jsx)
