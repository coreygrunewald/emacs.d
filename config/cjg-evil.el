;; In order to work properly, we need to load evil-leader-mode before we load
;; evil-mode.
(use-package evil-leader
  :commands (evil-leader-mode global-evil-leader-mode)
  :ensure evil-leader
  :demand evil-leader
  :init
  (progn
    (evil-leader/set-leader ",")
    (global-evil-leader-mode t)
    (evil-leader/set-key "e" 'evil-ace-jump-word-mode)   ; ,e for Ace Jump (word)
    (evil-leader/set-key "l" 'evil-ace-jump-line-mode)   ; ,l for Ace Jump (line)
    (evil-leader/set-key "x" 'evil-ace-jump-char-mode))) ; ,x for Ace Jump (char)

(use-package evil
  :ensure evil
  :config
  (progn
    (evil-mode 1)
    (setq evil-want-C-u-scroll t)
    (setq evil-want-C-w-in-emacs-state t)
    (setq evil-search-module        'isearch)
    (setq evil-magic                'very-magic)
    (setq evil-emacs-state-cursor   '("#dfaf8f" box))
    (setq evil-normal-state-cursor  '("#f8f893" box))
    (setq evil-insert-state-cursor  '("#f8f893" bar))
    (setq evil-replace-state-cursor '("#cc9393" box))
    (setq evil-want-fine-undo t)
    (setq evil-want-change-word-to-end t)

    ; esc quits
    (define-key evil-normal-state-map [escape] 'keyboard-quit)
    (define-key evil-visual-state-map [escape] 'keyboard-quit)
    (define-key minibuffer-local-map [escape] 'cjg-minibuffer-keyboard-quit)
    (define-key minibuffer-local-ns-map [escape] 'cjg-minibuffer-keyboard-quit)
    (define-key minibuffer-local-completion-map [escape] 'cjg-minibuffer-keyboard-quit)
    (define-key minibuffer-local-must-match-map [escape] 'cjg-minibuffer-keyboard-quit)
    (define-key minibuffer-local-isearch-map [escape] 'cjg-minibuffer-keyboard-quit)
    (global-set-key [escape] 'evil-exit-emacs-state)

    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
    (define-key evil-normal-state-map (kbd "-") 'dired-jump)

    (define-key evil-normal-state-map (kbd "SPC SPC") 'helm-M-x)
    (define-key evil-normal-state-map (kbd "SPC r") 'helm-resume)

    (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
      'elisp-slime-nav-describe-elisp-thing-at-point)

    (evil-set-initial-state 'flycheck-error-list-mode 'normal)
    (evil-set-initial-state 'git-commit-mode 'insert)
    (evil-set-initial-state 'shell-mode 'emacs)
    (evil-set-initial-state 'esup-mode 'emacs)
    (evil-set-initial-state 'diff-mode 'emacs)
    (evil-set-initial-state 'term-mode 'emacs)
    (evil-set-initial-state 'multi-term-mode 'emacs)
    ))

(use-package evil-visualstar
  :commands (global-evil-visualstar-mode)
  :ensure evil-visualstar
  :config
  (progn
    (global-evil-visualstar-mode t)))

(use-package evil-surround
  :commands (global-evil-surround-mode)
  :ensure evil-surround
  :config
  (progn
    (global-evil-surround-mode t)))

(provide 'cjg-evil)
