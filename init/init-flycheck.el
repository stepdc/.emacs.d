(use-package flycheck
  :ensure t
  :defer 1
  :init (global-flycheck-mode))


(use-package flycheck-gometalinter
  :ensure t
  :defer 2
  :config
  (add-hook 'go-mode-hook
            (lambda ()
              (progn
                ;; (flycheck-gometalinter-setup)
                ;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
                ;; (setq flycheck-gometalinter-vendor t)
                ;; only run fast linters
                ;; (setq flycheck-gometalinter-fast t)
                ;; use in tests files
                ;; (setq flycheck-gometalinter-test t)
                ;; ;; disable linters
                ;; ;; (setq flycheck-gometalinter-disable-linters '("gotype" "gocyclo"))
                ;; ;; Only enable selected linters
                ;; ;; (setq flycheck-gometalinter-disable-all t)
                ;; (setq flycheck-gometalinter-enable-linters '("golint"))
                ;; ;; Set different deadline (default: 5s)
                ;; (setq flycheck-gometalinter-deadline "10s")
                ))))

(use-package flycheck-golangci-lint
      :ensure t
      :defer 2
      :hook (go-mode . flycheck-golangci-lint-setup)
      :init ;; (setenv "GO111MODULE" "on")
      :config
      (setq flycheck-golangci-lint-fast t))


(provide 'init-flycheck)
;;; init-flycheck ends here
