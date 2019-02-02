;; completion framework

(use-package company
  :ensure t
  :defer
  :diminish (company-mode
             eldoc-mode)
  :init (global-company-mode)
  :bind (:map company-active-map
              ("C-j" . company-select-next)
              ("C-k" . company-select-previous)
              ("C-l" . company-complete-selection)
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)
              ("C-f" . company-complete-selection)
              ("TAB" . company-complete-common-or-cycle)
              ("<tab>" . company-complete-common-or-cycle)
              ("<backtab>" . company-select-previous)
              ("S-TAB" . company-select-previous))
  :config (progn
            (bind-key [remap completion-at-point] #'company-complete company-mode-map)
            (setq company-tooltip-align-annotations t
                 company-show-numbers t) ;; Easy navigation to candidates with M-<n>
            ;; (setq company-tooltip-limit 10)                      ; bigger popup window
            (setq company-idle-delay 0.05)                         ; decrease delay before autocompletion popup shows
            (setq company-echo-delay 0)                          ; remove annoying blinking
            (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing)
	    (setq company-minimum-prefix-length 2)

	    ;; (setq company-dabbrev-downcase nil)
	    ;; (setq company-dabbrev-ignore-case t)

	    ;; (setq company-dabbrev-code-ignore-case t)
	    ;; (setq company-dabbrev-code-everywhere t)

	    ;; (setq company-etags-ignore-case t)
	    ;; (company-tng-configure-default)
            ))

(use-package company-statistics
  :ensure t
  :config (progn
            (company-statistics-mode)))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(provide 'init-company)
