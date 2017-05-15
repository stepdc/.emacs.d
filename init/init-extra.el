;; Package to present nice undo tree, activated with: C-x u.
(use-package undo-tree
  :ensure t
  :defer t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamp nil)
  (setq undo-tree-visualizer-diff t))

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'racket-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode))

;; Display available keybindings in popup.
(use-package which-key
  :ensure t
  :defer t)

;; Highlight symbol
(use-package highlight-symbol
  :ensure t
  :defer t)

(use-package multiple-cursors
  :ensure t
  :defer t
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


(provide 'init-extra)
