(add-to-list 'load-path "~/.emacs.d")

(set-default-font "PragmataPro 12")
(global-hl-line-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode 1)

(mouse-wheel-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)

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

(add-hook 'python-mode-hook
          (lambda () (auto-complete-mode 1)))

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
      (let* ((temp-file (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
             (local-file (file-relative-name
                          temp-file
                          (file-name-directory buffer-file-name))))
        (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init))
  (add-hook 'python-mode-hook 'flymake-mode)

  (setq flymake-run-in-place nil)
  (setq flymake-max-parallel-syntax-checks 8)

  (custom-set-faces
   '(flymake-errline ((((class color)) (:underline "red"))))
   '(flymake-warnline ((((class color)) (:underline "yellow"))))))

(when (load "git-gutter" t)
  (global-git-gutter-mode 1))

(when (load "jedi" t)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t))

(when (load "yasnippet" t)
  (yas-global-mode 1))
