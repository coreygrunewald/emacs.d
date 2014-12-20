(use-package js2-mode
  :ensure js2-mode
  :mode "\\.js?\\'"
  :init
  (progn
    (add-to-list 'interpreter-mode-alist '("node" . js2-mode))))

(provide 'cjg-js)
