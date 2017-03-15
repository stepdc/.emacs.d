;; version control

;; Interface to Git.
(use-package magit
  :ensure t
  :config
  (setq magit-completing-read-function 'magit-ido-completing-read))

(use-package magit-popup
:ensure t)

(provide 'init-vc)
