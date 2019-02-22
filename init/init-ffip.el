(use-package find-file-in-project
  :ensure t
  :bind
  ("C-x f" . #'find-file-in-project)
  ("C-c f" . #'find-file-in-project)
  :config
  (autoload 'find-file-in-project "find-file-in-project" nil t)
  (autoload 'find-file-in-project-by-selected "find-file-in-project" nil t)
  (autoload 'find-directory-in-project-by-selected "find-file-in-project" nil t)
  (autoload 'ffip-show-diff "find-file-in-project" nil t)
  (autoload 'ffip-save-ivy-last "find-file-in-project" nil t)
  (autoload 'ffip-ivy-resume "find-file-in-project" nil t))

(provide 'init-ffip)
;;; init-ffip.el ends here
