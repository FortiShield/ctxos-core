;; ~/.emacs: CtxOS Emacs Configuration
;; Basic sanity settings

;; Disable startup screen
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; Menu and toolbar
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Line numbers
(column-number-mode t)
(global-linum-mode t)

;; Paren matching
(show-paren-mode t)

;; Highlight current line
(global-hl-line-mode t)

;; UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-unix)

;; Custom variables
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
