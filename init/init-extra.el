;; Package to present nice undo tree, activated with: C-x u.
(use-package undo-tree
  :ensure
  :defer 2
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamp nil)
  (setq undo-tree-visualizer-diff t))

(use-package rainbow-delimiters
  :ensure t
  :defer 2
  :init
  (add-hook 'racket-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode))

;; Display available keybindings in popup.
(use-package which-key
  :ensure t
  :defer 2)

;; Highlight symbol
(use-package highlight-symbol
  :ensure t
  :defer 2)

(use-package multiple-cursors
  :ensure t
  :defer 2
  ;; :bind
  ;; ("M-D" . mc/mark-next-like-this-word)
  ;; (:map region-bindings-mode-map
  ;;        ("a" . mc/mark-all-like-this)
  ;;        ("p" . mc/mark-previous-like-this)
  ;;        ("n" . mc/mark-next-like-this)
  ;;        ("P" . mc/unmark-previous-like-this)
  ;;        ("N" . mc/unmark-next-like-this)
  ;;        ("[" . mc/cycle-backward)
  ;;        ("]" . mc/cycle-forward)
  ;;        ("m" . mc/mark-more-like-this-extended)
  ;;        ("h" . mc-hide-unmatched-lines-mode)
  ;;        ("\\" . mc/vertical-align-with-space)
  ;;        ("#" . mc/insert-numbers) ; use num prefix to set the starting number
  ;;        ("<" . mc/edit-beginnings-of-lines)
  ;;        (">" . mc/edit-ends-of-lines))
  )

;; pop-tag
(global-set-key (kbd "M-*") 'pop-tag-mark)

;; c-i, c-o jumper
;; (require 'nice-jumper)
;; (global-nice-jumper-mode t)
;; (global-set-key (kbd "C-o") 'nice-jumper/backward)
;; (define-key input-decode-map [?\C-i] [control-i])
;; (global-set-key [control-i] 'nice-jumper/forward)
;; (global-set-key (kbd "C-S-h") 'nice-jumper/backward)
;; (global-set-key (kbd "C-S-l") 'nice-jumper/forward)

;; (use-package better-jumper
;;   :ensure t
;;   :defer t
;;   :init (better-jumper-mode +1)
;;   :config
;;   ;; (with-eval-after-load 'evil-maps
;;   ;; (define-key evil-motion-state-map (kbd "C-o") 'better-jumper-jump-backward)
;;   ;; (define-key evil-motion-state-map (kbd "<C-i>") 'better-jumper-jump-forward))
;;   )

;; icons
;; (use-package  all-the-icons
;;   :ensure t
;;   :defer)

;; ivy icon
;; (use-package all-the-icons-ivy
;;   :ensure t
;;   :config
;;   (progn
;;     (all-the-icons-ivy-setup)))

;; yascroll
;; (use-package yascroll
;;   :ensure t
;;   :init
;;   (global-yascroll-bar-mode 1))

;; indent-guide
;; (use-package indent-guide
;;   :ensure t
;;   :defer
;;   :config
;;   (indent-guide-global-mode))

;; restclient
(use-package restclient
  :ensure t
  :defer 2)

(use-package popwin
  :ensure t
  :defer t
  :config
  (progn
    (popwin-mode 1)
    (setq anything-samewindow nil)
    (push '("*anything*" :height 20) popwin:special-display-config)
    (push '("*godoctor toggle*" :height 20) popwin:special-display-config)
    (push '("\*Go Test*" :regexp t :height 20) popwin:special-display-config)))

;; goto last change
(use-package goto-chg
  :ensure t
  :defer 1
  :bind
  ("C-=" . 'goto-last-change)
  ("C-+" . 'goto-last-change-reverse))

;; crux, most use for move begin of line
(use-package crux
  :ensure t
  :defer 1
  :bind ("C-a" . #'crux-move-beginning-of-line)
  :config
  (progn
    (global-set-key (kbd "C-c o") #'crux-open-with)
    (global-set-key [(shift return)] #'crux-smart-open-line)
    ;; (global-set-key (kbd "s-r") #'crux-recentf-find-file)
    (global-set-key (kbd "C-^") #'crux-top-join-line)
    (global-set-key (kbd "C-c TAB") #'crux-indent-rigidly-and-copy-to-clipboard)
    (global-set-key (kbd "C-<backspace>") #'crux-kill-line-backwards)
    (global-set-key [remap kill-whole-line] #'crux-kill-whole-line)))

(use-package dumb-jump
  :defer 2
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :ensure)

(use-package expand-region
  :ensure t
  :defer t
  :bind (("C-3" . er/expand-region))
  )

(use-package goldendict
  :ensure t
  :bind ("C-x t d" . goldendict-dwim))


;; (setq ivy-sort-matches-functions-alist '((t . ivy-fuz-sort-fn)))
;; (setq ivy-re-builders-alist '((t . ivy-fuz-regex-fuzzy)))
;; (with-eval-after-load 'ivy
;;   (add-to-list 'load-path "~/.emacs.d/lisp/fuz/")
;;   (require 'ivy-fuz)
;;   (add-to-list 'ivy-highlight-functions-alist '(ivy-fuz-regex-fuzzy . ivy-fuz-highlight-fn)))

(provide 'init-extra)
