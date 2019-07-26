;; version control

;; Interface to Git.
(use-package magit
  :ensure t
  :defer 2
  :config
  (setq magit-completing-read-function 'ivy-completing-read))

(use-package magit-popup
  :ensure t
  :defer 2)

(use-package git-gutter
  :ensure t
  :defer 2
  :hook (go-mode . git-gutter-mode)
  :config (global-git-gutter-mode 1))

(provide 'init-vc)
