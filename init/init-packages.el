;; Package source
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url "http://melpa.org/packages/"))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; (setq package-archives '(("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;; 			 ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
;; 			 ("marmalade-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")
;;                          ("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)
;; (setq use-package-verbose t)

(provide 'init-packages)
