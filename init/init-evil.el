(use-package evil
  :init ;; tweak evil's configuration before loading it
  (setq evil-disable-insert-state-bindings t)
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  (evil-mode)
  :config ;; tweak evil after loading it
  ;; skip to evil normal state
  (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)

  ;; more bindings
  (define-key evil-normal-state-map (kbd "SPC w") 'save-buffer)
  ;; (define-key evil-normal-state-map (kbd "SPC t") 'fzf-projectile)
  (define-key evil-normal-state-map (kbd "SPC t") 'counsel-fzf)
  (define-key evil-normal-state-map (kbd "C-k") (lambda () (interactive) (previous-line 3)))
  (define-key evil-normal-state-map (kbd "C-j") (lambda () (interactive) (next-line 3)))
  (define-key evil-normal-state-map (kbd "K") (lambda () (interactive) (backward-paragraph)))
  (define-key evil-normal-state-map (kbd "J") (lambda () (interactive) (forward-paragraph)))
  (define-key evil-normal-state-map (kbd "C-l") (lambda () (interactive) (recenter-top-bottom) (evil-ex-nohighlight)))

  ;; hooks
  ;; (add-hook 'focus-in-hook
  ;; 	    #'evil-normal-state)
  (add-hook 'go-mode-hook
            (lambda () (define-key evil-normal-state-map (kbd "C-]") 'godef-jump)))
  (add-hook 'prog-mode-hook #'hs-minor-mode)

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
    (run-with-idle-timer 15 t #'evil-normalize-all-buffers)
    "Drop back to normal state after idle for 15 seconds.")

  ;; extras
  (use-package evil-surround
    :config
    (global-evil-surround-mode 1))

  (use-package evil-matchit
    :init
    (setq evilmi-shortcut "m")
    :config
    (global-evil-matchit-mode 1))

  (use-package evil-leader
    :config
    (setq evil-leader/in-all-states t)
    (global-evil-leader-mode))

  (use-package evil-nerd-commenter
    ;; :after evil-leader
    :config
    ;; (evilnc-default-hotkeys)
    
    (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
    ;; (global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
    ;; (global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
    (global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)
    (evil-leader/set-key
      "ci" 'evilnc-comment-or-uncomment-lines
      "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
      "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
      "cc" 'evilnc-copy-and-comment-lines
      "cp" 'evilnc-comment-or-uncomment-paragraphs
      "cr" 'comment-or-uncomment-region
      "cv" 'evilnc-toggle-invert-comment-line-by-line
      "."  'evilnc-copy-and-comment-operator
      "\\" 'evilnc-comment-operator ; if you prefer backslash key
      ))
  )

(provide 'init-evil)
