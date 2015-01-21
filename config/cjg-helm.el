;; cjg-helm.el
;;
;; Settings for Helm, an interactive narrowing and completion framework.

(use-package helm
  :ensure helm
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (helm-mode 1)
  )
  :config
  (progn
    (setq helm-buffers-fuzzy-matching t)
    (setq helm-M-x-fuzzy-match t)
    (setq helm-imenu-fuzzy-match t)
    (setq helm-split-window-default-side (quote other))
    (setq helm-split-window-in-side-p nil)
    (setq helm-ff-file-name-history-use-recentf t)

    (setq helm-quick-update t)
    (setq helm-display-function 'helm-default-display-buffer)
    (setq helm-adaptive-history-file "~/.emacs.d/helm-adapative-history")

    (define-key helm-map (kbd "C-p") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-n") 'helm-delete-minibuffer-contents)
    (define-key helm-map (kbd "C-j") 'helm-next-line)
    (define-key helm-map (kbd "C-k") 'helm-previous-line)

    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (global-unset-key (kbd "C-x c"))

    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
    (global-set-key (kbd "C-c f") 'helm-apropos)
    (global-set-key (kbd "C-c r") 'helm-info-emacs)
    (global-set-key (kbd "C-c C-l") 'helm-locate-library)
    (global-set-key (kbd "C-c f") 'helm-recentf)
    (global-set-key (kbd "C-c h g") 'helm-google-suggest)

    (require 'helm-files)

    (use-package helm-dash
      :ensure helm-dash
      :config
      (progn
        (setq helm-dash-browser-func 'eww)
        ))

    (use-package helm-ag
      :ensure helm-ag
      :config
      (progn
        (setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
        (setq helm-ag-command-option "--after=0 --before=0 --context=0")
        (setq helm-ag-insert-at-point 'symbol)
        (setq helm-ag-use-grep-ignore-list t)))

    (after 'projectile
      (use-package helm-projectile
        :ensure helm-projectile
        :config
        (progn
          (after 'helm-ag
            (defun helm-projectile-ag ()
              (interactive)
              (helm-ag (projectile-project-root)))
            (after 'evil-leader
              (evil-leader/set-key "a" 'helm-projectile-ag)))
          (after 'evil-leader
            (evil-leader/set-key "s" 'helm-projectile-ack)
            (evil-leader/set-key "p" 'helm-projectile-switch-project))
          (after 'evil
            (define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)))))

    (use-package helm-swoop
      :ensure helm-swoop
      :config
      (progn
        ;; Don't start searching for the thing at point by default.
        ;; Let me type it.
        (setq helm-swoop-pre-input-function (lambda () ()))
        (after 'evil
          (define-key evil-normal-state-map (kbd "SPC l") 'helm-swoop))))

    (use-package helm-spotify
      :ensure t
      :commands helm-spotify)

    (after 'evil-leader
      (evil-leader/set-key "g" 'helm-do-grep)
      (evil-leader/set-key "y" 'helm-show-kill-ring)
      (evil-leader/set-key "b" 'helm-mini)
      (evil-leader/set-key "i" 'helm-imenu))

    (after 'flycheck
      (use-package helm-flycheck
        :ensure helm-flycheck))))

(provide 'cjg-helm)
