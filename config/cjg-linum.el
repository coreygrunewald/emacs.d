(global-linum-mode t)
(setq linum-format "%d ")

;;(unless window-system
;;  (add-hook 'linum-before-numbering-hook
;;            (lambda ()
;;              (setq-local linum-format-fmt
;;                          (let ((w (length (number-to-string
;;                                            (count-lines (point-min) (point-max))))))
;;                            (concat "%" (number-to-string w) "d"))))))
;;
;;(defun linum-format-func (line)
;;  (concat
;;   (propertize (format linum-format-fmt line) 'face 'linum)
;;   (propertize " " 'face 'mode-line)))
;;
;;(unless window-system
;;  (setq linum-format 'linum-format-func))

;;(use-package nlinum
;;  :ensure nlinum
;;  :init
;;  (progn
;;    (add-hook 'php-mode-hook 'nlinum-mode)
;;    (add-hook 'js2-mode-hook 'nlinum-mode)
;;    (add-hook 'web-mode-hook 'nlinum-mode)
;;    (add-hook 'emacs-lisp-mode-hook 'nlinum-mode)))

(provide 'cjg-linum)
