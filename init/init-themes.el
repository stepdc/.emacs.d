;; Themes setup

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
(use-package solarized
  :if (display-graphic-p)
  :config
  (progn
    (setq solarized-use-variable-pitch nil
      solarized-scale-org-headlines nil)
    (load-theme 'solarized-light t)))

;; (use-package zenburn-theme
;;   :if (not (display-graphic-p))
;;   :init (load-theme 'zenburn))

(use-package plan9-theme
  :if (not (display-graphic-p))
  :init (load-theme 'plan9))

;; (load-theme 'quiet-light)

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/mgl-theme")
;; (load-theme 'mgl-light t)

(provide 'init-themes)
