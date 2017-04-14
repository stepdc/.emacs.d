;; Add local paths to PATH enviroment.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "~/.local/bin")))

;; Add local binary locations.
(setq exec-path (append exec-path (list (expand-file-name "~/.local/bin"))))

;; Add path to custom modules and init scripts.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))

(require 'init-packages)
(require 'init-basics)
(require 'init-extra)
(require 'init-yas)
(require 'init-themes)
(require 'init-ivy)
(require 'init-flycheck)
(require 'init-vc)
(require 'init-company)
(require 'init-golang)
(require 'init-c-cpp)
(require 'init-server)
(require 'init-pinyin)
(require 'init-ispell)

;;; init.el ends here
