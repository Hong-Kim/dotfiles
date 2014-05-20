(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

;; ido-like behavior to M-x commands
(define-key my-keys-minor-mode-map (kbd "M-x") 'smex)
(define-key my-keys-minor-mode-map (kbd "M-X") 'smex-major-mode-commands)
(define-key my-keys-minor-mode-map (kbd "C-c M-x") 'smex-update)

;; use C-c C-m instead of M-x
(define-key my-keys-minor-mode-map (kbd "C-c C-m") 'smex)

;; soften scroll up/down to 10 lines
(define-key my-keys-minor-mode-map (kbd "C-v") 
  '(lambda () "scroll up 10 lines" (interactive) (scroll-up 10)))
(define-key my-keys-minor-mode-map (kbd "M-v")
  '(lambda () "scroll down 10 lines" (interactive) (scroll-down 20)))

;; window switching should be easier
(define-key my-keys-minor-mode-map (kbd "C-o") 'other-window)
(defun prev-window ()
  (interactive)
  (other-window -1))
(define-key my-keys-minor-mode-map (kbd "M-o") 'prev-window)

;; window management convenience 
(define-key my-keys-minor-mode-map (kbd "C-c C-c") 'clone-window)
(define-key my-keys-minor-mode-map (kbd "C-c s") 'swap-windows)

;; override forward/backward-sentence to paragraph movement
(define-key my-keys-minor-mode-map (kbd "M-e") 'forward-paragraph)
(define-key my-keys-minor-mode-map (kbd "M-a") 'backward-paragraph)

;; convenient keybindings for frequent commands
(define-key my-keys-minor-mode-map (kbd "C-.") 'repeat)
(define-key my-keys-minor-mode-map (kbd "C-?") 'redo)
(define-key my-keys-minor-mode-map (kbd "M-s") 'replace-string)
(define-key my-keys-minor-mode-map (kbd "C-;") 'iedit-mode)
(define-key my-keys-minor-mode-map (kbd "C-t") 'projectile-find-file)

;; adjust text scale to desktop/laptop
(define-key my-keys-minor-mode-map (kbd "C-x C-+") 'text-scale-desktop)
(define-key my-keys-minor-mode-map (kbd "C-x C--") 'text-scale-laptop)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(provide 'my-keybindings)
