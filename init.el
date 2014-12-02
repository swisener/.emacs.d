(setq inhibit-startup-message t)

(add-to-list 'load-path (concat user-emacs-directory (convert-standard-filename "lisp/")))

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
(setq rspec-command-options nil)

(require-package 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

(electric-indent-mode t)

; Indent after yank
(dolist (command '(yank yank-pop))
   (eval `(defadvice ,command (after indent-region activate)
            (and (not current-prefix-arg)
                 (member major-mode '(emacs-lisp-mode lisp-mode
                                                      clojure-mode    scheme-mode
                                                      haskell-mode    ruby-mode
                                                      rspec-mode      python-mode
                                                      c-mode          c++-mode
                                                      objc-mode       latex-mode
                                                      plain-tex-mode))
                 (let ((mark-even-if-inactive transient-mark-mode))
                   (indent-region (region-beginning) (region-end) nil))))))

(require-package 'projectile)
(projectile-global-mode)

(setq ruby-deep-indent-paren nil)

(load-theme 'solarized-dark t)

(require 'key-bindings)
