;; Use-packages
(use-package better-defaults :ensure t)
;; (use-package fzf :ensure t)

(setq gc-cons-threshold 40000000) ;; 40MB

(use-package super-save
  :ensure t
  :defer
  :diminish (super-save-mode
             hl-line-mode
             auto-revert-mode)
  :config
  (super-save-mode +1)
  (setq super-save-auto-save-when-idle t))

(use-package ace-window
  :ensure t
  :defer 1
  :bind (("C-M-o" . ace-window))
  :config
  (set-face-attribute 'aw-leading-char-face nil :foreground "deep sky blue" :weight 'bold :height 3.0)
  (set-face-attribute 'aw-mode-line-face nil :inherit 'mode-line-buffer-id :foreground "dim gray")
  (setq aw-keys   '(?a ?s ?d ?f ?j ?k ?l)
        aw-dispatch-always t
        aw-dispatch-alist
        '((?x aw-delete-window     "Ace - Delete Window")
          (?c aw-swap-window       "Ace - Swap Window")
          (?n aw-flip-window)
          (?v aw-split-window-vert "Ace - Split Vert Window")
          (?h aw-split-window-horz "Ace - Split Horz Window")
          (?m delete-other-windows "Ace - Maximize Window")
          (?g delete-other-windows)
          (?b balance-windows)
          (?u winner-undo)
          (?r winner-redo)))

  (when (package-installed-p 'hydra)
    (defhydra hydra-window-size (:color red)
      "Windows size"
      ("h" shrink-window-horizontally "shrink horizontal")
      ("j" shrink-window "shrink vertical")
      ("k" enlarge-window "enlarge vertical")
      ("l" enlarge-window-horizontally "enlarge horizontal"))
    (defhydra hydra-window-frame (:color red)
      "Frame"
      ("f" make-frame "neqw frame")
      ("x" delete-frame "delete frame"))
    (defhydra hydra-window-scroll (:color red)
      "Scroll other window"
      ("n" joe-scroll-other-window "scroll")
      ("p" joe-scroll-other-window-down "scroll down"))
    (add-to-list 'aw-dispatch-alist '(?w hydra-window-size/body) t)
    (add-to-list 'aw-dispatch-alist '(?o hydra-window-scroll/body) t)
    (add-to-list 'aw-dispatch-alist '(?\; hydra-window-frame/body) t))
  (ace-window-display-mode t))

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
  (global-yascroll-bar-mode t))

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

;; client save and exit
(defun client-save-kill-emacs(&optional display)
  " This is a function that can bu used to shutdown save buffers and 
shutdown the emacs daemon. It should be called using 
emacsclient -e '(client-save-kill-emacs)'.  This function will
check to see if there are any modified buffers or active clients
or frame.  If so an x window will be opened and the user will
be prompted."

  (let (new-frame modified-buffers active-clients-or-frames)

                                        ; Check if there are modified buffers or active clients or frames.
    (setq modified-buffers (modified-buffers-exist))
    (setq active-clients-or-frames ( or (> (length server-clients) 1)
					(> (length (frame-list)) 1)
                                        ))  

                                        ; Create a new frame if prompts are needed.
    (when (or modified-buffers active-clients-or-frames)
      (when (not (eq window-system 'x))
	(message "Initializing x windows system.")
	(x-initialize-window-system))
      (when (not display) (setq display (getenv "DISPLAY")))
      (message "Opening frame on display: %s" display)
      (select-frame (make-frame-on-display display '((window-system . x)))))

                                        ; Save the current frame.  
    (setq new-frame (selected-frame))


                                        ; When displaying the number of clients and frames: 
                                        ; subtract 1 from the clients for this client.
                                        ; subtract 2 from the frames this frame (that we just created) and the default frame.
    (when ( or (not active-clients-or-frames)
	       (yes-or-no-p (format "There are currently %d clients and %d frames. Exit anyway?" (- (length server-clients) 1) (- (length (frame-list)) 2)))) 
      
                                        ; If the user quits during the save dialog then don't exit emacs.
                                        ; Still close the terminal though.
      (let((inhibit-quit t))
                                        ; Save buffers
	(with-local-quit
	  (save-some-buffers)) 
        
	(if quit-flag
            (setq quit-flag nil)  
                                        ; Kill all remaining clients
	  (progn
	    (dolist (client server-clients)
	      (server-delete-client client))
                                        ; Exit emacs
	    (kill-emacs))) 
	))

                                        ; If we made a frame then kill it.
    (when (or modified-buffers active-clients-or-frames) (delete-frame new-frame))
    )
  )


(defun modified-buffers-exist() 
  "This function will check to see if there are any buffers
that have been modified.  It will return true if there are
and nil otherwise. Buffers that have buffer-offer-save set to
nil are ignored."
  (let (modified-found)
    (dolist (buffer (buffer-list))
      (when (and (buffer-live-p buffer)
		 (buffer-modified-p buffer)
		 (not (buffer-base-buffer buffer))
		 (or
		  (buffer-file-name buffer)
		  (progn
		    (set-buffer buffer)
		    (and buffer-offer-save (> (buffer-size) 0))))
		 )
	(setq modified-found t)
	)
      )
    modified-found
    )
  )


(provide 'init-basics)
