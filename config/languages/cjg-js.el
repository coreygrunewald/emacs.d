(use-package js2-mode
  :ensure js2-mode
  :config (progn
            (add-to-list 'auto-mode-alist '("\\.js?\\'" . js2-mode))
            ))

(provide 'cjg-js)
