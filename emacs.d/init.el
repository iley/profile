;;; init.el --- Main Emacs configuration file

;;; Commentary:

;; better-defaults.el is taken from https://github.com/technomancy/better-defaults/

;;; Code:

(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d"))

(require 'load-dir)
(load-dir-one "~/.emacs.d/load")

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
