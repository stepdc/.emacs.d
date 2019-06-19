;; Themes setup

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/lisp")
;; (load-theme 'procolors)

(defun gh/disable-all-themes ()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))

;; Theme hooks
(defvar gh/theme-hooks nil
  "((theme-id . function) ...)")

(defun gh/add-theme-hook (theme-id hook-func)
  (add-to-list 'gh/theme-hooks (cons theme-id hook-func)))

(defun gh/load-theme-advice (f theme-id &optional no-confirm no-enable &rest args)
  "Enhances `load-theme' in two ways:
1. Disables enabled themes for a clean slate.
2. Calls functions registered using `gh/add-theme-hook'."
  (unless no-enable
    (gh/disable-all-themes))
  (prog1
      (apply f theme-id no-confirm no-enable args)
    (unless no-enable
      (pcase (assq theme-id gh/theme-hooks)
        (`(,_ . ,f) (funcall f))))))

(advice-add 'load-theme
            :around
            #'gh/load-theme-advice)

;; (if (display-graphic-p)
;;     (use-package solarized
;;       :init
;;       (progn
;;         (gh/disable-all-themes)
;;         (load-theme 'solarized-light t)))
;;   (use-package plan9-theme
;;     :ensure t
;;     :config
;;     (gh/disable-all-themes)
;;     (load-theme 'plan9)))

;; theme (zenburn in terminal, solarized otherwise)
;; (use-package solarized
;;   :if (display-graphic-p)
;;   :config
;;   (progn
;;     (setq solarized-use-variable-pitch nil
;;       solarized-scale-org-headlines nil)
;;     (load-theme 'solarized-light t)))

;; (use-package spacemacs-theme
;;   :if (display-graphic-p)
;;   :ensure t
;;   ;; :defer t
;;   :init	(load-theme 'spacemacs-light t))

;; (use-package spacemacs-common
;;   :if (display-graphic-p)
;;   :ensure spacemacs-theme
;;   :config (load-theme 'spacemacs-light t))

;; (use-package parchment-theme
;;   :if (display-graphic-p)
;;   :ensure t
;;   :config (load-theme 'parchment t))

;; (use-package zenburn-theme
;;   :if (not (display-graphic-p))
;;   :init (load-theme 'zenburn))

;; (use-package kaolin-themes
;;   :ensure t
;;   :if (display-graphic-p)
;;   :config (load-theme 'kaolin-light t))

;; (use-package gruvbox-theme
;;   :ensure t
;;   :if (display-graphic-p)
;;   :config (load-theme 'gruvbox-light-hard))

;; (use-package doom-themes
;;   :ensure t
;;   :if (display-graphic-p)
;;   :init (load-theme 'doom-one-light t))


(use-package apropospriate-theme
  :ensure t
  :if (display-graphic-p)
  :init (load-theme 'apropospriate-light t))

(use-package plan9-theme
  :ensure t
  :if (not (display-graphic-p))
  :init (load-theme 'plan9))

;; (load-theme 'quiet-light)

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/mgl-theme")
;; (load-theme 'mgl-light t)

;; (load-theme 'base16-procolors-light)

(provide 'init-themes)
