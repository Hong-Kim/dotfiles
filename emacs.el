;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load extensions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; (require 'auto-complete)
; (global-auto-complete-mode t)

; (require 'smex)
; (smex-initialize)

; (require 'dired+)
; (require 'redo+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; custom settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(scroll-bar-mode -1)

(if (eq system-type 'windows-nt)
  (progn
    (set-face-attribute 'default nil :height 100)
    (set-default-font
     "-outline-Consolas-normal-r-normal-normal-14-97-96-96-c-*-iso8859-1")))

(if (eq system-type 'darwin)
    (set-face-attribute 'default nil :family "Monaco" :height 120))

;; key bindings for mac
(setq mac-option-modifier 'control)
(setq mac-command-modifier 'meta)

; (load-theme 'solarized-dark t)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(global-linum-mode t)

(defalias 'ar 'align-regexp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; custom functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun init-file ()
  "open this init file."
  (interactive)
  (find-file "~/.emacs.d/personal/custom.el"))

;; clear the buffer in shell
(defun shell-clear ()
  "clear the shell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (comint-send-input)))

(defun clone-window ()
  "If you have 2 windows, clone one to the other"
  (interactive)
  (if (/= (count-windows) 2)
      (message "You need exactly 2 windows to do this.")
    (let ((buffer (current-buffer)))
      (other-window 1)
      (switch-to-buffer buffer))))

(defalias 'qrr 'query-replace-regexp)
;; (defalias 'rs 'replace-string)
(defalias 'cw 'clone-window)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; personal key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; disable key bindings
(global-unset-key (kbd "S-SPC"))
(global-unset-key (kbd "C--"))

;; minor mode of my key bindings
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "M-x") 'smex)
(define-key my-keys-minor-mode-map (kbd "M-X") 'smex-major-mode-commands)
(define-key my-keys-minor-mode-map (kbd "C-c M-x") 'smex-update)

(define-key my-keys-minor-mode-map (kbd "C-v") '(lambda () "scroll up 20 lines" (interactive) (scroll-up 20)))
(define-key my-keys-minor-mode-map (kbd "M-v") '(lambda () "scroll down 20 lines" (interactive) (scroll-down 20)))

(define-key my-keys-minor-mode-map (kbd "C-.") 'repeat)

(define-key my-keys-minor-mode-map (kbd "C-?") 'redo)

(define-key my-keys-minor-mode-map (kbd "C-x C-m") 'smex)
(define-key my-keys-minor-mode-map (kbd "C-c C-m") 'smex)

(define-key my-keys-minor-mode-map (kbd "M-s") 'replace-string)

; GRB: use C-o and M-o to switch windows
(define-key my-keys-minor-mode-map (kbd "C-o") 'other-window)
(defun prev-window ()
  (interactive)
  (other-window -1))
(define-key my-keys-minor-mode-map (kbd "M-o") 'prev-window)

(define-key my-keys-minor-mode-map (kbd "C-;") 'iedit-mode)

;; override forward-sentence / backward-sentence
(define-key my-keys-minor-mode-map (kbd "M-e") 'forward-paragraph)
(define-key my-keys-minor-mode-map (kbd "M-a") 'backward-paragraph)

(define-key my-keys-minor-mode-map (kbd "C-t") 'projectile-find-file)

(define-key my-keys-minor-mode-map (kbd "C-c C-c") 'clone-window)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

;; (add-hook 'shell-mode-hook
;;           (lambda ()
;;             (define-key shell-mode-map (kbd "C-l") 'shell-clear)))
