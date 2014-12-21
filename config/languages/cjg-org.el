(use-package org
  ;;:commands (org-mode org-capture org-agenda orgtbl-mode)
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
    (global-set-key (kbd "C-c c") 'org-capture)
    (global-set-key (kbd "C-c a") 'org-agenda)
    )
  :config
  (progn
    (setq org-log-done t)
    (setq org-default-notes-file "~/.notes.org")
    ))


(provide 'cjg-org)
