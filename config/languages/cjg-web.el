(use-package web-mode
  :ensure web-mode
  :config (progn
            (setq web-mode-markup-indent-offset 4)
            (setq web-mode-css-indent-offset 4)
            (setq web-mode-code-indent-offset 4)
            (setq web-mode-enable-current-element-highlight t)
            (setq web-mode-enable-auto-pairing t)
            (setq web-mode-engines-alist
                  '(("php" . "\\.phtml\\'")))
            (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
            (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
            (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
            (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
            (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
            (add-to-list 'auto-mode-alist '("\\.region\\'" . web-mode)))
  (add-hook 'web-mode-hook (lambda()
                             (when (equal web-mode-content-type "jsx")
                               (require 'js2-mode)
                               (js2-minor-mode)
                               (when (executable-find "tern")
                                 (after 'tern
                                   (tern-mode))))))

  )

(provide 'cjg-web)
