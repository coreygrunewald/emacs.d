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
    (setq org-default-notes-file (expand-file-name "~/org/notes.org"))
    (setq org-capture-templates
          (quote (("t" "todo" entry (file (expand-file-name "~/org/todo.org"))
                   "* TODO %?\n %i\n %a")
                  ;; TODO: figure out org mode and capture templates!
                  ("n" "note" entry (file (expand-file-name "~/org/notes.org"))
                   "* %? :NOTE:\n %U\n %a\n" :prepend t)
                  )))

    ))

(provide 'cjg-org)
