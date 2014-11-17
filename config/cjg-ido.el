(use-package ido
  :config
  (progn
    (ido-mode 1)
    (ido-everywhere 1)
    (setq ido-enable-flex-matching t)

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
