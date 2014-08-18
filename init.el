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

(require-package 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(require-package 'projectile)
(projectile-global-mode)

(setq ruby-deep-indent-paren nil)

(load-theme 'solarized-dark t)

(require 'key-bindings)
