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

(load-theme 'solarized-dark t)

(require 'init-ffip)
(require 'key-bindings)
