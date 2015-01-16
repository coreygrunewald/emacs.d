(use-package js2-mode
  :ensure js2-mode
  :mode "\\.js?\\'"
  :init
  (progn
    (add-to-list 'interpreter-mode-alist '("node" . js2-mode)))
  :config
  (progn
    (add-hook 'js2-mode-hook
              (lambda ()
                (js2-imenu-extras-setup)
                (setq-local helm-dash-docsets '("JavaScript"))))

    (after 'js2-mode
      (setq js2-highlight-level 3)
      (when (executable-find "tern")
        (after 'tern
          (add-hook 'js2-mode-hook 'tern-mode)
          )
        )
      )
    )
  )

(provide 'cjg-js)
