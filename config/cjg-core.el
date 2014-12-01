(eval-when-compile (require 'cl))
(require 'cl-lib)

;; basics

(tool-bar-mode -1)

(visual-line-mode 1)

(setq create-lockfiles nil)

(setq-default indent-tabs-mode nil)

(column-number-mode)

(setq make-backup-files nil)

(set-fringe-style '(8 . 0))

(setq visual-line-mode +1)

(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(menu-bar-mode -1)

;; type
(setq-default line-spacing 4)
(defvar my-graphical-font "Anonymous Pro-14"
    "Font used for graphical editing sessions.")

(defun my-set-window-font (font)
    "Set the frame font to FONT.
FONT is the name of a xft font, like `Monospace-10'. This command
only has any effect on graphical frames."
    (interactive "sFont: ")
    (set-face-attribute 'default nil :font font)
    (set-frame-font font nil t))

(my-set-window-font my-graphical-font)

;; trailing whitespace

(defun cjg-show-trailing-whitespace ()
  (setq show-trailing-whitespace t))

(add-hook 'find-file-hook 'cjg-show-trailing-whitespace)

;; hide trailing whitespace in following mode
(defun cjg-hide-trailing-whitespace ()
  (setq show-trailing-whitespace nil))

(add-hook 'minibuffer-inactive-mode-hook 'cjg-hide-trailing-whitespace)

(global-whitespace-mode +1)
(setq whitespace-style '(face tab-mark trailing))

;; fullscreen

(custom-set-variables
  '(initial-frame-alist (quote ((fullscreen . maximized))))) ;; start maximized

;; scrolling

(setq scroll-conservatively 9999
      scroll-preserve-screen-position t)

;; functions

;; from <https://github.com/bling/dotemacs/>
(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

;; esc quits
(defun cjg-minibuffer-keyboard-quit ()
    "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
        (setq deactivate-mark t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
          (abort-recursive-edit)))

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

;; Let me write `y` or `n` even for important stuff that would normally require
;; me to fully type `yes` or `no`.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Flash the frame to represent a bell.
(setq visible-bell t)
;; nevermind that's annoying
(setq ring-bell-function 'ignore)

(provide 'cjg-core)
