(use-package lsp-mode
  :ensure
  :diminish lsp-mode
  :config
  (setq lsp-inhibit-message t)
  (setq lsp-message-project-root-warning t)

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
  )

;; (use-package lsp-ui
;;   :ensure
;;   :bind (:map lsp-ui-mode-map
;;               ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
;;               ([remap xref-find-references] . lsp-ui-peek-find-references))
;;   :hook (lsp-mode . lsp-ui-mode)
;;   :init (setq scroll-margin 0))

(use-package company-lsp
  :ensure
  :after company
  :defines company-backends
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-async t))

(provide 'init-lsp)
