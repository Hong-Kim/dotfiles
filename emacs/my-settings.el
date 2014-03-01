;; disable nonsense
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; ui settings
(global-linum-mode t)
(column-number-mode)
(show-paren-mode)

;; color theme
(load-theme 'solarized-dark t)

;; better file and buffer navigation
(ido-mode t)

;; set font appropriate to OS
(if (eq system-type 'windows-nt)
  (progn
    (set-face-attribute 'default nil :height 100)
    (set-default-font
     "-outline-Consolas-normal-r-normal-normal-14-97-96-96-c-*-iso8859-1")))
(if (eq system-type 'darwin)
    (set-face-attribute 'default nil :family "Monaco" :height 120))

;; swap left option and cmd for Mac
(if (eq system-type 'darwin)
  (progn
    (setq mac-option-modifier 'control)
    (setq mac-command-modifier 'meta)))

;; cleanup buffer before save
(add-hook 'before-save-hook 'whitespace-cleanup nil t)

;; C-l should actually clear the shell buffer
(add-hook 'comint-mode-hook
	  (lambda () (define-key comint-mode-map (kbd "C-l") 'shell-clear)))

;; haskell settings
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(provide 'my-settings)
