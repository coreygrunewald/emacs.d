(global-linum-mode t)
;; (setq linum-format "%d ")

(defvar my-linum-format-string "%4d")

(defun my-linum-get-format-string ()
  (let* ((width (length (number-to-string
                         (count-lines (point-min) (point-max)))))
         (format (concat "%" (number-to-string width) "d")))
    (setq my-linum-format-string format)))

(defun my-linum-format (line-number)
  (propertize (format my-linum-format-string line-number) 'face 'linum))

(setq linum-format 'my-linum-format)

(provide 'cjg-linum)
