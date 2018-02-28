(use-package flycheck
  :ensure t
  :defer t
  :init (global-flycheck-mode))


(use-package flycheck-gometalinter
  :ensure t
  :defer
  :config
  (progn
    (flycheck-gometalinter-setup))
  (add-hook 'go-mode-hook
            (lambda ()
              (progn
                (flycheck-gometalinter-setup)
                ;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
                (setq flycheck-gometalinter-vendor t)
                ;; only run fast linters
                (setq flycheck-gometalinter-fast t)
                ;; use in tests files
                (setq flycheck-gometalinter-test t)
                ;; ;; disable linters
                ;; ;; (setq flycheck-gometalinter-disable-linters '("gotype" "gocyclo"))
                ;; ;; Only enable selected linters
                ;; ;; (setq flycheck-gometalinter-disable-all t)
                ;; (setq flycheck-gometalinter-enable-linters '("golint"))
                ;; ;; Set different deadline (default: 5s)
                ;; (setq flycheck-gometalinter-deadline "10s")
                )))
  )

(provide 'init-flycheck)
;;; init-flycheck ends here
