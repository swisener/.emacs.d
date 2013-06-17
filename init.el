(setq inhibit-startup-message t)

(add-to-list 'load-path user-emacs-directory)

;; Set path to dependencies
(setq vendor-dir
      (expand-file-name "vendor" user-emacs-directory))

;; Add external projects to load path
(dolist (project (directory-files vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(require 'init-package)

(require-package 'better-defaults)
(require-package 'diminish)
(require-package 'color-theme-solarized)
(require-package 'magit)
(require-package 'ace-jump-mode)

(load-theme 'solarized-dark t)

(require 'init-ffip)
(require 'key-bindings)
