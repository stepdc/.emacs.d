(use-package projectile
  :defer 2
  :bind (:map projectile-mode-map
              ("s-t" . projectile-find-file) ; `cmd-t' or `super-t'
              ("C-c e" . projectile-command-map))
  :hook (after-init . projectile-mode)
  :config
  (setq projectile-mode-line
        '(:eval (format "[%s]" (projectile-project-name))))

  (setq projectile-sort-order 'recentf)
  (setq projectile-use-git-grep t)

  ;; Use the faster searcher to handle project files:
  ;; ripgrep `rg', the platinum searcher `pt' or the silver searcher `ag'
  (let ((command
         (cond
          ((executable-find "rg")
           (let ((rg-cmd ""))
             (dolist (dir projectile-globally-ignored-directories)
               (setq rg-cmd (format "%s --glob '!%s'" rg-cmd dir)))
             (concat "rg -0 --files --color=never --hidden" rg-cmd)))
          ((executable-find "pt")
           (if sys/win32p
               (concat "pt /0 /l /nocolor /hidden ."
                       (mapconcat #'identity
                                  (cons "" projectile-globally-ignored-directories)
                                  " /ignore:"))
             (concat "pt -0 -l --nocolor --hidden ."
                     (mapconcat #'identity
                                (cons "" projectile-globally-ignored-directories)
                                " --ignore="))))
          ((executable-find "ag")
           (concat "ag -0 -l --nocolor --hidden"
                   (mapconcat #'identity
                              (cons "" projectile-globally-ignored-directories)
                              " --ignore-dir="))))))
    (setq projectile-generic-command command))

)

(provide 'init-projectile)
