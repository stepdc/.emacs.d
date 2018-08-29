(use-package evil
  :ensure t ;; install the evil package if not installed
  :init ;; tweak evil's configuration before loading it
  (setq evil-disable-insert-state-bindings t)
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  :config ;; tweak evil after loading it
  (evil-mode)
  ;; skip to evil normal state
  (define-key evil-insert-state-map (kbd "C-c j") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-c k") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-c u") 'evil-normal-state)

  ;; more bindings
  (define-key evil-insert-state-map (kbd "C-c C-c") 'evil-normal-state)
  (define-key evil-normal-state-map (kbd "SPC w") 'save-buffer)
  (define-key evil-normal-state-map (kbd "SPC t") 'counsel-fzf)
  )


(provide 'init-evil)
