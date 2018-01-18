;; Package to present nice undo tree, activated with: C-x u.
(use-package undo-tree
  :ensure t
  :defer
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamp nil)
  (setq undo-tree-visualizer-diff t))

(use-package rainbow-delimiters
  :ensure t
  :defer
  :init
  (add-hook 'racket-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode))

;; Display available keybindings in popup.
(use-package which-key
  :ensure t
  :defer)

;; Highlight symbol
(use-package highlight-symbol
  :ensure t
  :defer)

(use-package multiple-cursors
  :ensure t
  :defer
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
(require 'nice-jumper)
(global-nice-jumper-mode t)
;; (global-set-key (kbd "C-o") 'nice-jumper/backward)
;; (define-key input-decode-map [?\C-i] [control-i])
;; (global-set-key [control-i] 'nice-jumper/forward)
(global-set-key (kbd "C-S-h") 'nice-jumper/backward)
(global-set-key (kbd "C-S-l") 'nice-jumper/forward)

;; ivy icon
;; (use-package all-the-icons-ivy
;;   :ensure t
;;   :config
;;   (progn
;;     (all-the-icons-ivy-setup)))

;; yascroll
(use-package yascroll
  :ensure t
  :init
  (global-yascroll-bar-mode 1))

;; indent-guide
;; (use-package indent-guide
;;   :ensure t
;;   :defer
;;   :config
;;   (indent-guide-global-mode))

;; restclient
(use-package restclient
  :ensure t
  :defer)

(use-package popwin
  :ensure t
  :defer
  :config
  (progn
    (popwin-mode 1)
    (setq anything-samewindow nil)
    (push '("*anything*" :height 20) popwin:special-display-config)
    (push '("\*Go Test*" :regexp t :height 20) popwin:special-display-config)))

;; goto last change
(use-package goto-chg
  :ensure t
  :defer
  :bind
  ("C-=" . 'goto-last-change)
  ("C-+" . 'goto-last-change-reverse))

;; crux, most use for move begin of line
(use-package crux
  :ensure t
  :defer
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

(provide 'init-extra)
