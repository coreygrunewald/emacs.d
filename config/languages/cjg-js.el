(use-package js2-mode
  :ensure js2-mode
  :mode "\\.js?\\'"
  :init
  (progn
    (add-to-list 'interpreter-mode-alist '("node" . js2-mode)))
  :config
  (progn
    (add-hook 'js2-mode-hook
              (lambda () (interactive) (setq-local helm-dash-docsets '("JavaScript"))))
    )
  )

(provide 'cjg-js)
