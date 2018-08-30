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
  (define-key evil-insert-state-map (kbd "C-c j")
    (lambda () (interactive) (progn
			       (evil-normal-state)
			       (next-line)
			       )))
  (define-key evil-insert-state-map (kbd "C-c k")
    (lambda () (interactive) (progn
			       (evil-normal-state)
			       (previous-line)
			       )))
  (define-key evil-insert-state-map (kbd "C-c u")
    (lambda () (interactive) (progn
			       (evil-normal-state)
			       (undo)
			      )))
  (define-key evil-normal-state-map (kbd "C-c j")
    (lambda () (interactive) (next-line)))
  (define-key evil-normal-state-map (kbd "C-c k")
    (lambda () (interactive) (previous-line)))

  ;; (define-key evil-insert-state-map (kbd "C-c u") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-c C-c") 'evil-normal-state)

  ;; more bindings
  (define-key evil-normal-state-map (kbd "SPC w") 'save-buffer)
  (define-key evil-normal-state-map (kbd "SPC t") 'counsel-fzf)
  (define-key evil-normal-state-map (kbd "C-k") (lambda () (interactive) (previous-line 3)))
  (define-key evil-normal-state-map (kbd "C-j") (lambda () (interactive) (next-line 3)))
  (define-key evil-normal-state-map (kbd "K") (lambda () (interactive) (backward-paragraph)))
  (define-key evil-normal-state-map (kbd "J") (lambda () (interactive) (forward-paragraph)))

  ;; hooks
  (add-hook 'go-mode-hook
	    (lambda () (define-key evil-normal-state-map (kbd "C-]") 'godef-jump)))
  ;; (add-hook 'focus-in-hook
  ;; 	    #'evil-normal-state)

  ;; funcs
  (defun evil-normalize-all-buffers ()
    "Force a drop to normal state."
    (unless (eq evil-state 'normal)
      (dolist (buffer (buffer-list))
	(set-buffer buffer)
	(unless (or (minibufferp)
		    (eq evil-state 'emacs))
	  (evil-force-normal-state)))
      (message "Dropped back to normal state in all buffers")))

  (defvar evil-normal-timer
    (run-with-idle-timer 30 t #'evil-normalize-all-buffers)
    "Drop back to normal state after idle for 30 seconds.")
  )

(provide 'init-evil)
