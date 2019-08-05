;; Yasnippet package. By default custom snippets should be placed in
;; ~/.emacs.d/snippets.

(use-package yasnippet
  :diminish yas-global-mode
  :hook (after-init . yas-global-mode)
  :config
  (use-package yasnippet-snippets)
  ;; disable yassnippet for term-mode
  (add-hook 'term-mode-hook (lambda() (yas-minor-mode -1))))

(provide 'init-yas)
