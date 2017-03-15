;; Package to present nice undo tree, activated with: C-x u.
(use-package undo-tree
  :ensure t
  :defer t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamp nil)
  (setq undo-tree-visualizer-diff t))

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'racket-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode))

;; Display available keybindings in popup.
(use-package which-key
  :ensure t
  :defer t)

;; Highlight symbol
(use-package highlight-symbol
  :ensure t
  :defer t
  :config)

(provide 'init-extra)
