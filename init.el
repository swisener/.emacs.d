(setq inhibit-startup-message t)

(add-to-list 'load-path user-emacs-directory)

(require 'init-package)

; ace-jump-mode is missing this require for some reason...
(require 'cl)

(require-package 'better-defaults)
(require-package 'diminish)
(require-package 'color-theme-solarized)
(require-package 'magit)
(require-package 'ace-jump-mode)
(require-package 'ag)
(require-package 'inf-ruby)

(require-package 'rspec-mode)
(setq rspec-use-rake-when-possible nil)
(setq rspec-spec-command "rspec")

(require-package 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

(electric-indent-mode t)

(require-package 'projectile)
(projectile-global-mode)

(setq ruby-deep-indent-paren nil)

(load-theme 'solarized-dark t)

(require 'key-bindings)
