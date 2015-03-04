(defun cjg/js-doc ()
  (interactive)
  (after 'helm-dash
    (setq-local helm-dash-docsets '("JavaScript" "NodeJS"))))

(use-package js2-mode
  :ensure js2-mode
  :mode "\\.js\\|.jss\\'"
  :init
  (progn
    (add-to-list 'interpreter-mode-alist '("node" . js2-mode)))
  :config
  (progn
    (add-hook 'js2-mode-hook 'cjg/js-doc)
    (add-hook 'js2-mode-hook
              '(lambda ()
                (js2-imenu-extras-setup)))

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
