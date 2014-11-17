(tool-bar-mode -1)

(visual-line-mode 1)

(setq create-lockfiles nil)

(setq-default indent-tabs-mode nil)

(column-number-mode)

(setq make-backup-files nil)

;; from <https://github.com/bling/dotemacs/>
(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
          '(progn ,@body)))

;; make sure $PATH is set correctly
(use-package exec-path-from-shell
    :ensure exec-path-from-shell)

(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(menu-bar-mode -1)

(provide 'cjg-core)
