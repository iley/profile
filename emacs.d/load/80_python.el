(add-hook 'python-mode-hook
          (lambda ()
            (auto-complete-mode 1)
            (whitespace-mode 1)))

(when (load "jedi" t)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t))
