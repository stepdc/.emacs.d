;; Yasnippet package. By default custom snippets should be placed in
;; ~/.emacs.d/snippets.

(use-package yasnippet
  :ensure t
  :diminish yas-global-mode
  :config
  (yas-global-mode t)
  ;; disable yassnippet for term-mode
  (add-hook 'term-mode-hook (lambda() (yas-minor-mode -1))))

(provide 'init-yas)
