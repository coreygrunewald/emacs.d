;; better buffer names for duplicates
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse
      uniquify-ignore-buffers-re "^\\*" ; leave special buffers alone
      uniquify-after-kill-buffer-p t)

(use-package ibuffer
  :commands ibuffer
  :ensure   ibuffer
  :config   (progn
              (after 'evil-leader (evil-leader/set-key "B" 'ibuffer))
              (after 'evil
                (evil-set-initial-state 'ibuffer-mode 'normal)
                (evil-define-key 'normal ibuffer-mode-map
                  (kbd "j") 'evil-next-line
                  (kbd "k") 'evil-previous-line))))

(provide 'cjg-buffers)
