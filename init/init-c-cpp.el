(use-package irony
  :ensure t
  ;; :defer t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)

  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company-irony
  :ensure t
  :defer t
  :config
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-irony)))

(use-package flycheck-irony
  :ensure t
  :defer t
  :config
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))

(use-package irony-eldoc
  :ensure t
  :defer t
  :config
  (add-hook 'irony-mode-hook 'irony-eldoc))

(use-package clang-format
  :ensure t
  :bind (:map c-mode-map ("C-c i" . clang-format-region)
	      :map c++-mode-map ("C-c i" . clang-format-region)
	      :map c-mode-map ("C-c u" . clang-format-buffer)
	      :map c++-mode-map ("C-c u" . clang-format-buffer))
  :config
  (setq clang-format-style-option "google"))

;; Linux kernel like style ".clang-format"
;; ---
;; BasedOnStyle: LLVM
;; IndentWidth: 8
;; UseTab: Always
;; BreakBeforeBraces: Linux
;; AllowShortIfStatementsOnASingleLine: false
;; IndentCaseLabels: false
;; ---

(provide 'init-c-cpp)
