(use-package eglot
  :ensure t
  :config
  (progn
    (add-to-list 'eglot-server-programs '((go-mode) . ("bingo" "--format-style" "goimports"))))
    (add-hook 'go-mode-hook 'eglot-ensure)
  )

(provide 'init-eglot)
