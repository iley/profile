(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(set-default-font "PragmataPro 12")
(global-hl-line-mode 1)
(line-number-mode 1)
(column-number-mode 1)

(mouse-wheel-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq standard-indent 4)
(setq-default indent-tabs-mode nil)

(setq x-select-enable-clipboard t)

(custom-set-variables
 '(custom-safe-themes
   (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))

(load-theme 'solarized-dark)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
