(use-package ido
  :config
  (progn
    (ido-mode 1)
    (ido-everywhere 1)
    (setq ido-enable-flex-matching t)
    (setq ido-use-virtual-buffers t)
    (setq ido-enable-prefix nil)
    (setq ido-create-new-buffer 'always)
    (setq ido-show-dot-for-dired t)
    (setq ido-confirm-unique-completion nil)
    (setq ido-enable-last-directory-history nil)
    (setq ido-use-filename-at-point 'guess)
    (setq ido-save-directory-list-file
          (concat user-emacs-directory ".cache/ido.last"))

    (use-package smex
      :ensure smex
      :config
      (progn
        (global-set-key (kbd "M-x") 'smex)
        (setq smex-save-file (concat user-emacs-directory ".cache/smex-items"))
        (smex-initialize)

        ;; The following is from <http://www.emacswiki.org/emacs/Smex>.
        ;; Typing SPC inserts a hyphen:
        (defadvice smex (around space-inserts-hyphen activate compile)
          (let ((ido-cannot-complete-command
                 `(lambda ()
                    (interactive)
                    (if (string= " " (this-command-keys))
                        (insert ?-)
                      (funcall ,ido-cannot-complete-command)))))
            ad-do-it))

        ;; Update less often.
        (defun smex-update-after-load (unused)
          (when (boundp 'smex-cache)
            (smex-update)))

        (add-hook 'after-load-functions 'smex-update-after-load)))

    (use-package ido-ubiquitous
      :ensure ido-ubiquitous
      :config
      (progn
        (ido-ubiquitous-mode 1)))

    (use-package flx-ido
      :ensure flx-ido
      :defines (ido-cur-item ido-default-item ido-cur-list)
      :config
      (progn
        (flx-ido-mode 1)
        ;; disable ido faces to see flx highlights.
        (setq ido-use-faces nil)
        (setq flx-ido-use-faces t)))

    (use-package ido-vertical-mode
      :ensure ido-vertical-mode
      :init
      (progn
        (ido-vertical-mode 1)))))

(provide 'cjg-ido)
