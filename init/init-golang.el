;;; package init-golang

;; (use-package company-go
;;   :ensure t)

;; (use-package go-rename
;;   :ensure t
;;   :bind (:map go-mode-map ("S-<f6>" . go-rename)))

(use-package go-guru
  :ensure t
  :config
  (go-guru-hl-identifier-mode))

(use-package go-mode
  :ensure t
  :mode ("\\.go" . go-mode)
  :defer
  :init
  (setq gofmt-command "goimports")
    (add-hook 'go-mode-hook
	      (lambda () (add-hook 'before-save-hook 'gofmt-before-save)))
    ;; (add-hook 'go-mode-hook #'lsp)
    ;; (add-hook 'before-save-hook 'lsp-format-buffer)

    ;; (add-hook 'go-mode-hook 'eglot-ensure)

    (add-hook 'go-mode-hook 'flycheck-mode)
    ;; (add-hook 'go-mode-hook 'yas-minor-mode)
    (add-hook 'go-mode-hook 'highlight-symbol-mode)
    (add-hook 'go-mode-hook 'highlight-symbol-nav-mode)
    (add-hook 'go-mode-hook
              (lambda () (progn (set (make-local-variable 'compile-command)
                                     "go generate && go build -v && go test -v && go vet") )))
    (add-hook 'go-mode-hook
              (lambda () (local-set-key (kbd "M-.") 'godef-jump)))
    (add-hook 'go-mode-hook
	      (lambda () (define-key evil-normal-state-map (kbd "C-]") 'godef-jump)))
    (add-hook 'go-mode-hook (lambda ()
                              ;; (set (make-local-variable 'company-backends) '(company-go))
                              (company-mode)))
  :config
  (progn
    (setq tab-width 8)
    (setq standard-indent 8)
    (setq gofmt-command "goimports")

    (if (not (string-match "go" compile-command))
        (set (make-local-variable 'compile-command)
             "go generate && go install -v && go test -v && go vet"))))

;; (use-package go-eldoc
;;   :ensure t
;;   :defer
;;   :init
;;   ;; (add-hook 'go-mode-hook 'go-eldoc-setup)
;;   )

(use-package go-snippets
  :ensure t)

(use-package gotest
  :ensure t
  :defer
  :bind
  (:map go-mode-map ("C-c t f" . 'go-test-current-file))
  (:map go-mode-map ("C-c t t" . 'go-test-current-test))
  (:map go-mode-map ("C-c t p" . 'go-test-current-project))
  (:map go-mode-map ("C-c t b" . 'go-test-current-benchmark))
  (:map go-mode-map ("C-c t x" . 'go-run)))

(use-package godoctor
  :ensure t
  :bind
  (:map go-mode-map ("S-<f6>" . 'godoctor-rename)))

(use-package flycheck-golangci-lint
  :ensure t
  :hook (go-mode . flycheck-golangci-lint-setup)
  :config
  (progn
    (setq flycheck-disabled-checkers '(go-gofmt
				       go-golint
				       go-vet
				       go-build
				       go-test
				       go-errcheck))))

(use-package go-fill-struct
  :ensure t
  :defer t)

(use-package go-gen-test
  :ensure t
  :defer t)

(use-package go-impl
    :defer t
    :ensure t)

(use-package go-tag
    :defer t
    :ensure t
    :config
    (setq go-tag-args (list "-transform" "camelcase")))

(provide 'init-golang)
