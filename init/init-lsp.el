(use-package lsp-mode
  :diminish lsp-mode
  :hook
  (prog-mode . lsp)
  :init
  (setq lsp-auto-guess-root t)
  :config
  (setq lsp-inhibit-message t)
  (setq lsp-message-project-root-warning t)
  (setq lsp-prefer-flymake nil)
  (setq lsp-clients-go-command "~/go/bin/gopls")

  ;; Restart server/workspace in case the lsp server exits unexpectedly.
  ;; https://emacs-china.org/t/topic/6392
  (defun restart-lsp-server ()
    "Restart LSP server."
    (interactive)
    (lsp-restart-workspace)
    (revert-buffer t t)
    (message "LSP server restarted."))

  ;; (require 'lsp-imenu)
  ;; (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

  (use-package company-lsp
    :after company
    :defines company-backends
    :init (setq company-lsp-cache-candidates 'auto)
    :config
    (push 'company-lsp company-backends)
    ;;  (setq company-lsp-enable-snippet nil)
    (setq company-lsp-async t))

  (use-package ccls
    :ensure t
    :defer t
    :hook ((c-mode c++-mode objc-mode) .
	   (lambda () (require 'ccls) (lsp))))
  )

;; (use-package lsp-ui
;;   :ensure
;;   :defer t
;;   :bind (:map lsp-ui-mode-map
;;               ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
;;               ([remap xref-find-references] . lsp-ui-peek-find-references))
;;   :hook (lsp-mode . lsp-ui-mode)
;;   :init (setq scroll-margin 0)
;;   :config
;;    )

(provide 'init-lsp)
