;; Add local paths to PATH enviroment.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(setq gc-cons-threshold 80000000) ;; 80MB

;; Add local binary locations.
(add-to-list 'exec-path "~/.local/bin")
(add-to-list 'exec-path "~/go/bin")
(add-to-list 'exec-path "/usr/local/bin")

;; other hack
(setq inhibit-compacting-font-caches t)

;; Add path to custom modules and init scripts.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))

(require 'init-packages)
(require 'init-basics)
(require 'init-yas)
(require 'init-themes)
;; (require 'init-ivy)
(require 'init-ivy)
(require 'init-flycheck)
;; (require 'init-projectile)
(require 'init-ffip)
(require 'init-vc)
;; (require 'init-ac)
(require 'init-company)
(require 'init-golang)
(require 'init-c-cpp)
;; (require 'init-server)
;; (require 'init-pinyin)
(require 'init-spelling)
(require 'init-org)
;; (require 'init-key-chord)
;; (require 'init-hydra)
;; (require 'init-ycmd)
(require 'init-extra)
(require 'init-evil)
(require 'init-lsp)
;; (require 'init-eglot)
(require 'init-dap)

(setq gc-cons-threshold 2000000) ;; 2MB, gc will pause faster

;;; init.el ends here
