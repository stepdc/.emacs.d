;; Use-packages
(use-package better-defaults :ensure t)
;; (use-package fzf :ensure t)

(use-package super-save
  :ensure t
  :defer
  :diminish (super-save-mode
             hl-line-mode
             auto-revert-mode)
  :config
  (super-save-mode +1)
  (setq super-save-auto-save-when-idle t))

;; ace-jump
;; (use-package ace-jump-mode
;;   :ensure t
;;   :defer
;;   :init
;;   :bind (("C-c SPC" . ace-jump-mode)
;;         ("C-j" . ace-jump-mode)
;;         ("C-S-H" . ace-jump-mode-pop-mark)
;;         ("C-x SPC" . ace-jump-mode-pop-mark))
;;   :config
;;   (setq ace-jump-mode-case-fold t)
;;   (ace-jump-mode-enable-mark-sync))

;; ace-window
(use-package ace-window
  :ensure t
  :bind(
        ("M-p" . ace-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (defvar aw-dispatch-alist
    '((?x aw-delete-window " Ace - Delete Window")
      (?m aw-swap-window " Ace - Swap Window")
      (?n aw-flip-window)
      (?c aw-split-window-fair " Ace - Split Fair Window")
      (?v aw-split-window-vert " Ace - Split Vert Window")
      (?b aw-split-window-horz " Ace - Split Horz Window")
      (?i delete-other-windows " Ace - Maximize Window")
      (?o delete-other-windows))
    "List of actions for `aw-dispatch-default'.")
  )

;; automatically sync buffer's content with files on disk
(global-auto-revert-mode t)
(setq-default auto-revert-verbose nil)
;; (diminish 'auto-revert-mode)

;; Show current column number in status line.
(setq column-number-mode t)
(global-linum-mode t)

;; Highlight current line.
(global-hl-line-mode t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode t)

;; Add closing bracket automatically.
(electric-pair-mode t)

;; Change all yes/no prompts to y/n.
(fset 'yes-or-no-p 'y-or-n-p)

;; Allways add new line on end of file.
(setq-default require-final-newline t)

;; Frame config
(defun setup-frame-decorations ()
  "Setup frame decoration in window-system"
  (tool-bar-mode 0)  ;; remove tool bar
  (menu-bar-mode 0)  ;; remove menu bar
  ;; (scroll-bar-mode 0)  ;; remove scroll bars
  (set-fringe-mode '(8 . 0))  ;; set fringe size
  (blink-cursor-mode t)  ;; turn on blinking cursor
  (setq-default cursor-type 'box)
  (set-frame-font "DejaVuSansMono 11")
  )

(setup-frame-decorations)

;; Apply settings to each frame.
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame (setup-frame-decorations))))

;; (global-set-key (kbd "<f2>") 'toggle-truncate-lines)

;; yascroll
(use-package yascroll
  :ensure t
  :config
  (global-yascroll-bar-mode 1))

;; C-a, move to first non space char of the line
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; Remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; Allows to switch windows with M-<up>, M-<down>, M-<left> and M-<right>;
;; bind-keys* allows to bind key sequence that is alway available.
(bind-keys*
 ((kbd "M-<left>") . windmove-left)
 ((kbd "M-<right>") . windmove-right)
 ((kbd "M-<up>") . windmove-up)
 ((kbd "M-<down>") . windmove-down))

(global-set-key (kbd "C-c g") 'rgrep)
(global-set-key (kbd "C-c f") 'find-name-dired)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-3") 'split-window-right)

(defun kill-default-buffer ()
  "Kill the currently active buffer -- set to C-x k so that users
are not asked which buffer they want to kill."
  (interactive)
  (let (kill-buffer-query-functions) (kill-buffer)))

;; Load custom settings (those changed with M-x customize).
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(provide 'init-basics)
