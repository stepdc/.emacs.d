;; completion framework

(use-package company
  :ensure t
  ;; :defer t
  :diminish (company-mode
             eldoc-mode)
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
            (setq company-tooltip-align-annotations t)
            (setq company-show-numbers t) ;; Easy navigation to candidates with M-<n>
            (setq company-tooltip-limit 20)                      ; bigger popup window
            (setq company-idle-delay .2)                         ; decrease delay before autocompletion popup shows
            (setq company-echo-delay 0)                          ; remove annoying blinking
            ;; (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing)
            (setq company-minimum-prefix-length 2)
            (setq company-backends (delete 'company-xcode company-backends))
            (setq company-backends (delete 'company-bbdb company-backends))
            (setq company-backends (delete 'company-eclim company-backends))
            (setq company-backends (delete 'company-gtags company-backends))
            (setq company-backends (delete 'company-etags company-backends))
            (setq company-backends (delete 'company-oddmuse company-backends))
            (add-to-list 'company-backends 'company-files)
            ;; (company-tng-configure-default)
            (global-company-mode)
            ))

;; (use-package company-statistics
;;   :ensure t
;;   :config (progn
;;             (company-statistics-mode)))

(use-package company-box
  :ensure
  :defer t
  :hook (company-mode . company-box-mode))

(provide 'init-company)
