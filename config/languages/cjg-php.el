(use-package php-mode
  :ensure php-mode
  :config (progn
            (add-hook 'php-mode-hook
                      (lambda () (interactive) (setq-local helm-dash-docsets '("PHP")))))
            )

(provide 'cjg-php)
