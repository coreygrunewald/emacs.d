(use-package ido
  :config
  (progn
    (ido-mode 1)
    (ido-everywhere 1)
    (setq ido-enable-flex-matching t)
    ;; (setq ido-create-new-buffer 'always)
    ;; (setq ido-show-dot-for-dired t)
    ;; (setq ido-confirm-unique-completion nil)
    ;; (setq ido-enable-last-directory-history nil)
    ;;(setq ido-use-filename-at-point 'guess)
    (setq ido-save-directory-list-file
          (concat user-emacs-directory ".cache/ido.last"))

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
