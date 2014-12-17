;; cjg-helm.el
;;
;; Settings for Helm, an interactive narrowing and completion framework.

(use-package helm
  :ensure helm
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config))
  :config
  (progn
    (setq helm-buffers-fuzzy-matching t)
    (setq helm-split-window-default-side (quote other))
    (setq helm-split-window-in-side-p nil)
    (setq helm-ff-file-name-history-use-recentf t)
    ;;(defun my-helm-in-ido (buffer)
      ;;"Display a helm buffer in ido. Send the purists screaming."
      ;;(interactive)
      ;;(ido-buffer-internal 'display 'display-buffer nil nil nil 'ignore))
    )

  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  (setq helm-quick-update t)
  (setq helm-display-function 'helm-default-display-buffer)
  (setq helm-adaptive-history-file "~/.emacs.d/helm-adapative-history")

  (define-key helm-map (kbd "C-p") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-n") 'helm-delete-minibuffer-contents)
  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line)

  (require 'helm-files)

  (after 'projectile
    (use-package helm-projectile
      :ensure helm-projectile))

;;  (defun helm-jump ()
;;    "Find files with helm, but be smart about buffers and recent files."
;;    (interactive)
;;    (let ((helm-ff-transformer-show-only-basename nil))
;;      (helm-other-buffer '(helm-projectile-sources-list
;;                           helm-source-buffers-list
;;                           helm-source-recentf
;;                           helm-source-bookmarks
;;                           helm-source-file-cache
;;                           helm-source-files-in-current-dir
;;                           helm-source-locate
;;                           helm-source-buffer-not-found)
;;                         "*helm jump*")))

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
    (evil-leader/set-key "b" 'helm-mini)
    (evil-leader/set-key "i" 'helm-imenu))

  (after 'flycheck
    (use-package helm-flycheck
      :ensure helm-flycheck)))

(provide 'cjg-helm)
