;;; package init-golang

(use-package company-go
  :ensure t)

(use-package go-rename
  :ensure t
  :bind (:map go-mode-map ("S-<f6>" . go-rename)))

(use-package go-guru
  :ensure t
  :config
  (go-guru-hl-identifier-mode))

(use-package go-mode
  :ensure t
  :mode ("\\.go" . go-mode)
  :init
  (setq gofmt-command "goimports")
  :config
  (progn
    (setq tab-width 8)
    (setq standard-indent 8)
    (setq gofmt-command "goimports")

    (if (not (string-match "go" compile-command))
        (set (make-local-variable 'compile-command)
             "go generate && go install -v && go test -v && go vet"))
    
    (add-hook 'go-mode-hook
              (lambda () (add-hook 'before-save-hook 'gofmt-before-save)))

    (add-hook 'go-mode-hook 'flycheck-mode)
    (add-hook 'go-mode-hook 'yas-minor-mode)
    (add-hook 'go-mode-hook 'highlight-symbol-mode)
    (add-hook 'go-mode-hook 'highlight-symbol-nav-mode)
    (add-hook 'go-mode-hook
              (lambda () (progn (set (make-local-variable 'compile-command)
                                     "go generate && go build -v && go test -v && go vet") )))
    (add-hook 'go-mode-hook
              (lambda () (local-set-key (kbd "M-.") 'godef-jump)))
    (add-hook 'go-mode-hook (lambda ()
                              (set (make-local-variable 'company-backends) '(company-go))
                              (company-mode)))))


(use-package go-eldoc
  :ensure t
  :defer
  :init
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package go-snippets :ensure t)

(use-package gotest
  :ensure t
  :defer
  :config
  (progn
    (define-key go-mode-map (kbd "C-x t f") 'go-test-current-file)
    (define-key go-mode-map (kbd "C-x t t") 'go-test-current-test)
    (define-key go-mode-map (kbd "C-x t p") 'go-test-current-project)
    (define-key go-mode-map (kbd "C-x t b") 'go-test-current-benchmark)
    (define-key go-mode-map (kbd "C-x t x") 'go-run)))

(provide 'init-golang)
