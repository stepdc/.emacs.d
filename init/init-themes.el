;; Themes setup
(use-package plan9-theme
  :ensure t)

(use-package solarized-theme
  :ensure t
  :config
  (if (not(display-graphic-p))
      (progn
        ;; (setq global-hl-line-mode nil)
        (load-theme 'plan9 t))
    (load-theme 'solarized-light t))
  
  ;; make the fringe stand out from the background
  ;; (setq solarized-distinct-fringe-background t)

  ;; make the modeline high contrast
  ;; (setq solarized-high-contrast-mode-line t)

  ;; Use less colors for indicators such as git:gutter, flycheck and similar
  ;; (setq solarized-emphasize-indicators nil)
  )

;; (load-theme 'quiet-light)

(provide 'init-themes)
