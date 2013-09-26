;;; init.el --- Main Emacs configuration file

;;; Commentary:

;; better-defaults.el is taken from https://github.com/technomancy/better-defaults/

;;; Code:

(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d")
  (require 'cl))

(require 'better-defaults)

(set-frame-font "PragmataPro 12")
(global-hl-line-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode 1)

(mouse-wheel-mode t)

(setq standard-indent 4)
(setq-default indent-tabs-mode nil)

(global-set-key [(super x)] 'clipboard-kill-region)
(global-set-key [(super c)] 'clipboard-kill-ring-save)
(global-set-key [(super v)] 'clipboard-yank)

(defun setup-theme ()
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (let ((custom-safe-themes '("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
    (load-theme 'solarized-dark)))

(defun setup-package ()
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))
  (package-initialize))

(when (>= emacs-major-version 24)
  (setup-theme)
  (setup-package))

(when (load "flycheck" t)
  (add-hook 'after-init-hook #'global-flycheck-mode))

(add-hook 'python-mode-hook
          (lambda ()
            (auto-complete-mode 1)))

(when (load "git-gutter" t)
  (global-git-gutter-mode 1))

(when (load "jedi" t)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t))

(when (load "yasnippet" t)
  (yas-global-mode 1))

(eval-when-compile (load "server"))
(unless (server-running-p)
  (server-start))

(defun packages-filename ()
  (locate-user-emacs-file "packages.txt"))

(defun save-package-list ()
  "Save list of installed packages to packages.txt"
  (interactive)
  (with-temp-buffer
    (pp (mapcar 'car package-alist)
        (current-buffer))
    (write-region (point-min) (point-max) (packages-filename)))
  (message "Package list is saved to %s" (packages-filename)))

(defun install-missing-packages ()
  "Install packages from packages.txt"
  (interactive)
  (with-temp-buffer
    (insert-file-contents (packages-filename))
    (let ((packages (car (read-from-string (buffer-string))))
          (n 0))
      (dolist (p (remove-if 'package-installed-p packages))
        (message "Installing %s" p)
        (package-install p)
        (incf n))
      (message "Installed %d packages" n))))

(provide 'init)

;;; init.el ends here
