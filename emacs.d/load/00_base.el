(global-hl-line-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode 1)

(mouse-wheel-mode t)

(setq standard-indent 4)
(setq-default indent-tabs-mode nil)

(when (>= emacs-major-version 24)
    (setq package-archives 
          '(("gnu" . "http://elpa.gnu.org/packages/")
            ("marmalade" . "http://marmalade-repo.org/packages/")
            ("melpa" . "http://melpa.milkbox.net/packages/")))
    (package-initialize))

(recentf-mode 1)

(setq whitespace-style
      '(face tabs trailing lines space-before-tab empty
        space-after-tab tab-mark))
