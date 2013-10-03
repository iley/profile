;;; init.el --- Main Emacs configuration file

;;; Commentary:

;; better-defaults.el is taken from https://github.com/technomancy/better-defaults/

;;; Code:

(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d")
  (require 'cl)
  (require 'server))

(require 'better-defaults)

(set-default-font "PragmataPro 12")
(make-face-italic 'font-lock-comment-face)
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

(setq whitespace-style
      '(face tabs trailing lines space-before-tab empty
        space-after-tab tab-mark))

(add-hook 'python-mode-hook
          (lambda ()
            (auto-complete-mode 1)
            (whitespace-mode 1)))

(when (load "git-gutter" t)
  (global-git-gutter-mode 1))

(when (load "jedi" t)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t))

(when (load "yasnippet" t)
  (yas-global-mode 1))

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

;; Shift the selected region right if distance is positive, left if
;; negative

(defun shift-region (distance)
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun shift-right ()
  (interactive)
  (shift-region 1))

(defun shift-left ()
  (interactive)
  (shift-region -1))

;; Bind (shift-right) and (shift-left) function to your favorite keys. I use
;; the following so that Ctrl-Shift-Right Arrow moves selected text one 
;; column to the right, Ctrl-Shift-Left Arrow moves selected text one
;; column to the left:

(global-set-key [C-S-right] 'shift-right)
(global-set-key [C-S-left] 'shift-left)

(provide 'init)

;;; init.el ends here
