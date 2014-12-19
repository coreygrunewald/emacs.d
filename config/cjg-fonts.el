;;; Changing font sizes

(require 'cl)

(defun cjg/font-name-replace-size (font-name new-size)
  (let ((parts (split-string font-name "-")))
    (setcar (nthcdr 7 parts) (format "%d" new-size))
    (mapconcat 'identity parts "-")))

(defun cjg/increment-default-font-height (delta)
  "Adjust the default font height by DELTA on every frame.
Emacs will keep the pixel size of the frame approximately the
same.  DELTA should be a multiple of 10, to match the units used
by the :height face attribute."
  (let* ((new-height (+ (face-attribute 'default :height) delta))
         (new-point-height (/ new-height 10)))
    (dolist (f (frame-list))
      (with-selected-frame f
        ;; Latest 'set-frame-font supports a "frames" arg, but
        ;; we cater to Emacs 23 by looping instead.
        (set-frame-font (cjg/font-name-replace-size
                         (face-font 'default)
                         new-point-height)
                        t)))
    (set-face-attribute 'default nil :height new-height)
    (message "Default font size is now %d" new-point-height)))

(defun cjg/increase-default-font-height ()
  (interactive)
  (cjg/increment-default-font-height 10))

(defun cjg/decrease-default-font-height ()
  (interactive)
  (cjg/increment-default-font-height -10))

(global-set-key (kbd "C-M-=") 'cjg/increase-default-font-height)
(global-set-key (kbd "C-M--") 'cjg/decrease-default-font-height)

(provide 'cjg-fonts)
