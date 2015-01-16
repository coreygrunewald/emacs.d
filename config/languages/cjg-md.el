(defvar cjg/markdown-imenu-generic-expression
  '((nil "^#\\s-+\\(.+\\)$" 1)))

(defun cjg/markdown-imenu-configure ()
  (interactive)
  (setq imenu-generic-expression cjg/markdown-imenu-generic-expression))

(use-package markdown-mode
  :ensure markdown-mode
  :init
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
    (add-hook 'markdown-mode-hook 'cjg/markdown-imenu-configure)
    )
  )

(provide 'cjg-md)
