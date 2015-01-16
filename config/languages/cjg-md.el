(use-package markdown-mode
  :ensure markdown-mode
  :init
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))))

(provide 'cjg-md)
