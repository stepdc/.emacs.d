;; version control

;; Interface to Git.
(use-package magit
  :ensure t
  :defer t
  :config
  (setq magit-completing-read-function 'magit-ido-completing-read))

(use-package magit-popup  
  :ensure t
  :defer t)

(provide 'init-vc)
