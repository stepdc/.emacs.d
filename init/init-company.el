(use-package company
  :ensure t
  :defer t
  :diminish (company-mode
             eldoc-mode)
  :init (global-company-mode)
  :bind (:map company-active-map ("C-j" . company-select-next)
              :map company-active-map ("C-k" . company-select-previous)
              :map company-active-map ("C-l" . company-complete-selection)
              :map company-active-map ("C-n" . company-select-next)
              :map company-active-map ("C-p" . company-select-previous)
              :map company-active-map ("C-f" . company-complete-selection)
              ;; :map company-active-map ("TAB" . company-complete-common-or-cycle)
              ;; :map company-active-map ("<tab>" . company-complete-common-or-cycle)
              ;; :map company-active-map ("<backtab>" . company-select-previous)
              ;;:map company-active-map ("S-TAB" . company-select-previous)
              )
  :config (progn
            (bind-key [remap completion-at-point] #'company-complete company-mode-map)
            (setq company-tooltip-align-annotations t
                  company-show-numbers t) ;; Easy navigation to candidates with M-<n>
            (setq company-tooltip-limit 20)                      ; bigger popup window
            (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
            (setq company-echo-delay 0)                          ; remove annoying blinking
            (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing)
            ))

(provide 'init-company)
