(use-package jsx-mode
  :ensure jsx-mode
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
    (autoload 'jsx-mode "jsx-mode" "JSX mode" t)))

(provide 'cjg-jsx)
