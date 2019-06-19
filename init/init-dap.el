(use-package dap-mode
  :ensure t
  :defer t
  ;; :after lsp-mode
  :diminish
  :hook
  ((after-init . dap-mode)
   (dap-mode . dap-ui-mode)
   (go-mode . (lambda () (require 'dap-go)))))


(provide 'init-dap)
