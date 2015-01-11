(use-package groovy-mode
  :mode "\\.groovy?\\'"
  :config (progn
    ;;; make Groovy mode electric by default.
            (add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
            (add-hook 'groovy-mode-hook
                      '(lambda ()
                         (setq c-basic-offset 4)
                         (require 'groovy-electric)
                         (groovy-electric-mode)))))

(provide 'cjg-groovy)
