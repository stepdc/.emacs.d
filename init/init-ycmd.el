(use-package ycmd
  :ensure t
  :defer 2
  :config
  (progn
    (add-hook 'go-mode-hook 'ycmd-mode)
    (require 'ycmd-eldoc)
    (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)
    ;; (set-variable 'ycmd-server-command '("python" "/home/sker/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd"))
    (set-variable 'ycmd-server-command `("python" ,(file-truename "~/.vim/plugged/YouCompleteMe/third_party/ycmd/ycmd/")))
    ;; (set-variable 'ycmd-global-config "/home/sker/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py")
    (set-variable 'ycmd-force-semantic-completion nil)
    ))

(use-package company-ycmd
  :ensure t
  :defer 2
  :config
  (progn
    (company-ycmd-setup)
    (setq company-ycmd-request-sync-timeout 0)))

(provide 'init-ycmd)
