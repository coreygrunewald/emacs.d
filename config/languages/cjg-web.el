(use-package web-mode
  :ensure web-mode
  :config (progn
            (setq web-mode-markup-indent-offset 4)
            (setq web-mode-css-indent-offset 4)
            (setq web-mode-code-indent-offset 4)
            (add-to-list 'auto-mode-alist '("\\.region\\'" . web-mode)))
  )

(provide 'cjg-web)
