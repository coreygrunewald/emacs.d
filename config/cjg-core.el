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

;; always launch emacsclient full screen
(add-to-list 'default-frame-alist '(fullscreen . fullboth))

;; disable lion-style full screen for osx
(setq ns-use-native-fullscreen nil)

;; Place custom settings in their own file.
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file) (load custom-file))

;; type
(setq-default line-spacing 4)

(add-to-list 'default-frame-alist '(font . "Anonymous Pro-14"))

(defun my-set-window-font (font)
    "Set the frame font to FONT.
FONT is the name of a xft font, like `Monospace-10'. This command
only has any effect on graphical frames."
    (interactive "sFont: ")
    (set-face-attribute 'default nil :font font)
    (set-frame-font font nil t))

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
(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

(defalias 'yes-or-no-p 'y-or-n-p)

;; Flash the frame to represent a bell.
(setq visible-bell t)
;; nevermind that's annoying
(setq ring-bell-function 'ignore)

;; No popup frames.
(setq ns-pop-up-frames nil)
(setq pop-up-frames nil)
(setq confirm-nonexistent-file-or-buffer nil)

;; No prompt for killing a buffer with processes attached.
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
        kill-buffer-query-functions))

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(provide 'cjg-core)
