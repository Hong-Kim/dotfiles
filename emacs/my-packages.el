(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; required because of a package.el bug
(setq url-http-attempt-keepalives nil)

(defvar my-packages
  '(smex
    solarized-theme
    redo+
    auto-complete
    haskell-mode
    whole-line-or-region
    iedit
    projectile
    flx-ido)
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun install-my-packages ()
  (unless (my-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs my is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dolist (p my-packages)
      (unless (package-installed-p p)
        (package-install p)))))

(install-my-packages)

;; package startups
(require 'redo+)
(require 'auto-complete-config)
(ac-config-default)
(whole-line-or-region-mode t)
(projectile-global-mode)
(flx-ido-mode +1)

(provide 'my-packages)
