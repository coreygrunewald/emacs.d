(use-package elisp-slime-nav
  :ensure elisp-slime-nav
  :config
    (progn
      (require 'elisp-slime-nav)
      (defun cjg-lisp-hook ()
        (elisp-slime-nav-mode)
        (eldoc-mode))
      (add-hook 'emacs-lisp-mode-hook 'cjg-lisp-hook)))

(provide 'cjg-elisp-slime-nav)
