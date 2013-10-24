(when (load "flycheck" t)
  (add-hook 'after-init-hook #'global-flycheck-mode))

(when (load "git-gutter" t)
  (global-git-gutter-mode 1))

(when (load "yasnippet" t)
  (yas-global-mode 1))

(when (load "ace-jump-mode")
  (define-key global-map (kbd "C-c SPC") 'ace-jump-mode))

(load "erc" t)
