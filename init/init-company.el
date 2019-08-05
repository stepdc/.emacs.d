;; completion framework

(use-package company
  :hook (after-init . global-company-mode)
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
            (setq company-idle-delay 0)                         ; decrease delay before autocompletion popup shows
            (setq company-echo-delay 0)                          ; remove annoying blinking
            (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing)
            ;; (setq company-minimum-prefix-length 2)
            (setq company-backends (delete 'company-xcode company-backends))
            (setq company-backends (delete 'company-bbdb company-backends))
            (setq company-backends (delete 'company-eclim company-backends))
            (setq company-backends (delete 'company-gtags company-backends))
            (setq company-backends (delete 'company-etags company-backends))
            (setq company-backends (delete 'company-oddmuse company-backends))
            (add-to-list 'company-backends 'company-files)
            ;; (company-tng-configure-default)
            ;; (setq company-frontends
            ;;       '(company-tng-frontend
            ;;         company-pseudo-tooltip-frontend
            ;;         company-echo-metadata-frontend))

            ;; The free version of TabNine is good enough,
            ;; and below code is recommended that TabNine not always
            ;; prompt me to purchase a paid version in a large project.
            (defadvice company-echo-show (around disable-tabnine-upgrade-message activate)
              (let ((company-message-func (ad-get-arg 0)))
                (when (and company-message-func
                           (stringp (funcall company-message-func)))
                  (unless (string-match "The free version of TabNine only indexes up to" (funcall company-message-func))
                    ad-do-it))))
            ))

;; (use-package company-statistics
;;   :ensure t
;;   :config (progn
;;             (company-statistics-mode)))

;; (use-package company-box
;;   :ensure t
;;   :defer t
;;   :hook (company-mode . company-box-mode))

(use-package company-tabnine
  :after company
  :config
  (defun company//sort-by-tabnine (candidates)
    (if (or (functionp company-backend)
            (not (and (listp company-backend) (memq 'company-tabnine company-backend))))
        candidates
      (let ((candidates-table (make-hash-table :test #'equal))
            candidates-1
            candidates-2)
        (dolist (candidate candidates)
          (if (eq (get-text-property 0 'company-backend candidate)
                  'company-tabnine)
              (unless (gethash candidate candidates-table)
                (push candidate candidates-2))
            (push candidate candidates-1)
            (puthash candidate t candidates-table)))
        (setq candidates-1 (nreverse candidates-1))
        (setq candidates-2 (nreverse candidates-2))
        (nconc (seq-take candidates-1 2)
               (seq-take candidates-2 2)
               (seq-drop candidates-1 2)
               (seq-drop candidates-2 2)))))

  (add-to-list 'company-transformers 'company//sort-by-tabnine t)
  ;; `:separate`  使得不同 backend 分开排序
  (add-to-list 'company-backends '(company-lsp :with company-tabnine :separate))

  (defun company//sort-by-tabnine (candidates)
    (if (or (functionp company-backend)
            (not (and (listp company-backend) (memq 'company-tabnine company-backend))))
        candidates
      (let ((candidates-table (make-hash-table :test #'equal))
            candidates-1
            candidates-2)
        (dolist (candidate candidates)
          (if (eq (get-text-property 0 'company-backend candidate)
                  'company-tabnine)
              (unless (gethash candidate candidates-table)
                (push candidate candidates-2))
            (push candidate candidates-1)
            (puthash candidate t candidates-table)))
        (setq candidates-1 (nreverse candidates-1))
        (setq candidates-2 (nreverse candidates-2))
        (nconc (seq-take candidates-1 2)
               (seq-take candidates-2 2)
               (seq-drop candidates-1 2)
               (seq-drop candidates-2 2)))))
  )

(provide 'init-company)
