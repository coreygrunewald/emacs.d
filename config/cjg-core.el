(tool-bar-mode -1)

(visual-line-mode 1)

(setq create-lockfiles nil)

(setq-default indent-tabs-mode nil)

(column-number-mode)

(setq make-backup-files nil)

(set-fringe-style '(8 . 0))

;; from <https://github.com/bling/dotemacs/>
(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
          '(progn ,@body)))


;; Hide startup messages
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; make sure $PATH is set correctly
(use-package exec-path-from-shell
  :ensure exec-path-from-shell
  :init
  (progn
    (ignore-errors ;; windows
        (exec-path-from-shell-initialize))))

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(menu-bar-mode -1)

;; Let me write `y` or `n` even for important stuff that would normally require
;; me to fully type `yes` or `no`.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Flash the frame to represent a bell.
(setq visible-bell t)
;; nevermind that's annoying
(setq ring-bell-function 'ignore)

(provide 'cjg-core)
