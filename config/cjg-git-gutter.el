(use-package git-gutter
  :ensure git-gutter
  :init
  (progn
    (require 'git-gutter)
    (global-git-gutter-mode t)
    (git-gutter:linum-setup)
    (after 'evil-leader
      (evil-leader/set-key "k" 'git-gutter:previous-hunk)
      (evil-leader/set-key "j" 'git-gutter:next-hunk))))

(provide 'cjg-git-gutter)
