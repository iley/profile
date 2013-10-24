(defvar myfont "PragmataPro 13")

(set-default-font myfont)
(add-to-list 'default-frame-alist
             (cons 'font myfont))
(make-face-italic 'font-lock-comment-face)

(defvar solarized-termcolors 256)

(when (>= emacs-major-version 24)
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (load-theme 'solarized-dark t))
