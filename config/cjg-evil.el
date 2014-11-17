(defun dired-go-to-current-file-dir ()
  (interactive)
  (dired (file-name-directory buffer-file-name)))

(use-package evil
  :ensure evil
  :config
  (progn
    (evil-mode 1)
    (setq evil-want-C-u-scroll t)
    (setq evil-want-C-w-in-emacs-state t)
    (setq evil-search-module        'isearch)
    (setq evil-magic                'very-magic)
    (setq evil-emacs-state-cursor   '("#dfaf8f" box))
    (setq evil-normal-state-cursor  '("#f8f893" box))
    (setq evil-insert-state-cursor  '("#f8f893" bar))
    (setq evil-replace-state-cursor '("#cc9393" box))
    (setq evil-want-fine-undo t)
    (setq evil-want-change-word-to-end t)
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
    (define-key evil-normal-state-map (kbd "-") 'dired-go-to-current-file-dir)
    (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
	'elisp-slime-nav-describe-elisp-thing-at-point)
    ))

(provide 'cjg-evil)
