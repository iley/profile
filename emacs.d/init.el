;;; init.el --- Main Emacs configuration file

;;; Commentary:

;; better-defaults.el is taken from https://github.com/technomancy/better-defaults/

;;; Code:

(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d")
  (require 'cl)
  (require 'server))

(require 'better-defaults)

(defvar myfont "PragmataPro 12")
(set-default-font myfont)
(add-to-list 'default-frame-alist
             (cons 'font myfont))
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

(setq solarized-termcolors 256)

(defun setup-theme ()
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (load-theme 'solarized-dark t))

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

(load "erc" t)

(when (load "org-install" t)
  (setq org-directory "~/Dropbox/org")
  (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
  (setq org-mobile-inbox-for-pull "~/Dropbox/org/inbox.org"))

(when (load "taskpaper")
  (add-to-list 'auto-mode-alist '("\\.taskpaper\\'" . taskpaper-mode))
  (add-hook 'taskpaper-mode-hook
            (lambda () (setq indent-tabs-mode t))))

(unless (server-running-p)
  (server-start))

(defun packages-filename ()
  (locate-user-emacs-file "packages.txt"))

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

(defun whack-whitespace ()
  "Delete all white space from point to the next word."
  (interactive nil)
  (when (re-search-forward "[ \t\n]+" nil t)
    (replace-match "" nil nil)))

(global-set-key "\C-l" 'whack-whitespace)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(background-color "#002b36")
 '(background-mode dark)
 '(cursor-color "#839496")
 '(custom-safe-themes (quote ("146aeadf49a8e27f28d7aebb7640f41fe75c1b9d4e94f38113860d08afd21e37" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(foreground-color "#839496"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)

;;; init.el ends here
