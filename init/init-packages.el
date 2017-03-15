;; Package source
(require 'package)
(package-initialize)

(setq package-archives '(("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			 ("marmalade-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")
                         ("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)
(setq use-package-verbose t)


(provide 'init-packages)
