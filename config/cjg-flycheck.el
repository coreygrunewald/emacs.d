(use-package flycheck
  :ensure flycheck
  :config (progn
            (add-hook 'after-init-hook #'global-flycheck-mode)
            ))

(provide 'cjg-flycheck)
