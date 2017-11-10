(use-package ycmd
  :ensure t
  :defer t
  :config
  (progn
    (add-hook 'go-mode-hook 'ycmd-mode)
    (require 'ycmd-eldoc)
    (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)
    (set-variable 'ycmd-server-command '("python" "/home/bembee/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd"))
    (set-variable 'ycmd-global-config "/home/bembee/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py")
    ))

(use-package company-ycmd
  :ensure t
  :config
  (progn
    (company-ycmd-setup)))

(provide 'init-ycmd)