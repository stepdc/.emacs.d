;; Whitespace
(use-package whitespace
  :ensure t
  :defer 2
  :bind (("C-c T w" . whitespace-mode))
  :init
  (dolist (hook '(prog-mode-hook text-mode-hooki
                  conf-mode-hook))
    (add-hook hook #'whitespace-mode))
  :config (setq whitespace-line-column nil)
  :diminish whitespace-mode)

(provide 'init-whitespace)
