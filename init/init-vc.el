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

(provide 'init-vc)
