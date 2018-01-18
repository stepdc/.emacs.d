
(use-package key-chord
  :ensure t
  :defer
  :config
  (key-chord-mode +1)
  (key-chord-define-global "jj" 'avy-goto-word-1)
  (key-chord-define-global "jl" 'avy-goto-line)
  (key-chord-define-global "jk" 'avy-goto-char)
  (key-chord-define-global "JJ" 'previous-buffer)
  ;; (key-chord-define-global "uu" 'undo-tree-visualize)
  ;; (key-chord-define-global "xx" 'execute-extended-command)
  ;; (key-chord-define-global "yy" 'browse-kill-ring)
  )

(provide 'init-key-chord)
