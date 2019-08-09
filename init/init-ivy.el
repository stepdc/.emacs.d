;; ivy setup

(use-package ivy
  :diminish (ivy-mode . "")
  :hook (after-init . ivy-mode)
	 ;; (ivy-mode . counsel-mode)
  :bind
  (("C-s" . swiper)
   ("C-c r" . counsel-recentf)
   ("C-c C-r" . ivy-resume)
   ("<f6>" . ivy-resume)
   ("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("<f1> f" . counsel-describe-function)
   ("<f1> v" . counsel-describe-variable)
   ("<f1> l" . counsel-find-library)
   ("<f2> i" . counsel-info-lookup-symbol)
   ("<f2> u" . counsel-unicode-char)
   ("C-c g" . counsel-git)
   ("C-c K" . counsel-rg)
   ("C-c s" . counsel-ag)
   ("C-c l" . counsel-imenu)
   ("C-x l" . counsel-locate)
   ("C-S-o" . counsel-rhythmbox)
   ("C-c v" . ivy-push-view)
   ("C-c V" . ivy-pop-view)
   ("C-c b" . ivy-switch-view)
   ("C-c o" . ivy-switch-view)
   :map read-expression-map
   ("C-r" . counsel-expression-history))
  :config
  (progn
    ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
    (setq ivy-use-virtual-buffers t)
    ;; number of result lines to display
    (setq ivy-height 10)
    ;; does not count candidates
    (setq ivy-count-format "")
    ;; no regexp by default
    (setq ivy-initial-inputs-alist nil)

    ;; Enhance fuzzy matching
    ;; (use-package flx :ensure t)
    ;; configure regexp engine.
    ;; (setq ivy-re-builders-alist
    ;;       ;; allow input not in order
    ;;       '((t . ivy-regex-fuzzy)
    ;;         (t . ivy--regex-ignore-order)))

    (setq ivy-re-builders-alist
          '((counsel-grep . ivy--regex-plus)
            (counsel-rg   . ivy--regex-plus)
            (counsel-pt   . ivy--regex-plus)
            (counsel-M-x  . ivy--regex-plus)
            (counsel-find-file . ivy--regex-plus)
            (swiper       . ivy--regex-plus)
            (t            . ivy--regex-fuzzy)
            (t . ivy--regex-ignore-order)))

    ;; (use-package flx
    ;;   :ensure t
    ;;   :init
    ;;   (setq ivy-re-builders-alist
    ;;         '((counsel-grep . ivy--regex-plus)
    ;;           (counsel-rg   . ivy--regex-plus)
    ;;           (counsel-pt   . ivy--regex-plus)
    ;;           (swiper       . ivy--regex-plus)
    ;;           (t            . ivy--regex-fuzzy))))
    ))

(use-package counsel
  :config
  (with-eval-after-load 'find-file-in-project
    (setq counsel-fzf-dir-function 'ffip-project-root)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)))

(use-package avy
  :after ivy
  :bind(
	("C-:" . avy-goto-char)
	("C-;" . avy-goto-char-2)
	("M-g f" . avy-goto-line)
	("M-g w" . avy-goto-word-1)
	("M-g e" . avy-goto-word-0)
	))

(use-package ivy-hydra)

(use-package amx :after ivy)

(use-package all-the-icons-ivy
  :config (all-the-icons-ivy-setup))

(provide 'init-ivy)
