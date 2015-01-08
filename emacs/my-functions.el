(defun init-file ()
  "open this init file."
  (interactive)
  (find-file "~/dotfiles/emacs/my-settings.el"))

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

(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (if (/= (count-windows) 2)
      (message "You need exactly 2 windows to do this.")
    (let* ((w1 (first (window-list)))
           (w2 (second (window-list)))
           (b1 (window-buffer w1))
           (b2 (window-buffer w2))
           (s1 (window-start w1))
           (s2 (window-start w2)))
      (set-window-buffer w1 b2)
      (set-window-buffer w2 b1)
      (set-window-start w1 s2)
      (set-window-start w2 s1)))
  (other-window 1))

(defun rename-file-and-buffer ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (message "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file name new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)))))))

(defun delete-file-and-buffer ()
  "Kills the current buffer and deletes the file it is visiting"
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (delete-file filename)
      (message "Deleted file %s" filename)))
  (kill-buffer))

(defun text-scale-laptop ()
  (interactive)
  (set-face-attribute 'default nil :family "Monaco" :height 120))

(defun text-scale-desktop ()
  (interactive)
  (set-face-attribute 'default nil :family "Monaco" :height 140))

(defalias 'qrr 'query-replace-regexp)
(defalias 'ar 'align-regexp)

(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; Automatically save on buffer/windows switches
;; (defadvice switch-to-buffer (before save-buffer-now activate)
;;   (when buffer-file-name (save-buffer)))
;; (defadvice other-window (before other-window-now activate)
;;   (when buffer-file-name (save-buffer)))

(provide 'my-functions)
