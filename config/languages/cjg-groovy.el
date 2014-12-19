(use-package groovy-mode
  :ensure groovy-mode
  :config (progn
            (groovy-electric-mode 1)
            (add-to-list 'auto-mode-alist '("\\.groovy?\\'" . groovy-mode))
            ))

(provide 'cjg-groovy)
