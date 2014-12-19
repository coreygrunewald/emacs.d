(use-package groovy-mode
  :mode "\\.groovy?\\'"
  :config (progn
    ;;; make Groovy mode electric by default.
            (add-hook 'groovy-mode-hook
                      '(lambda ()
                         (require 'groovy-electric)
                         (groovy-electric-mode)))))

(provide 'cjg-groovy)
