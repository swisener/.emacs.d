(setq inhibit-startup-message t)

(add-to-list 'load-path (concat user-emacs-directory (convert-standard-filename "lisp/")))

(require 'init-package)

; ace-jump-mode is missing this require for some reason...
(require 'cl)

(require-package 'better-defaults)
(require-package 'diminish)
(require-package 'color-theme-solarized)
(require-package 'paredit)
(require-package 'clojure-mode)
(require-package 'clojure-mode-extra-font-locking)
(require-package 'cider)
(require-package 'rainbow-delimiters)
(require-package 'magit)
(require-package 'avy)
(require-package 'ag)
(require-package 'inf-ruby)

(require-package 'move-text)
(move-text-default-bindings)

(require-package 'rspec-mode)
(setq rspec-use-rake-when-possible nil)
(setq rspec-spec-command "rspec")
(setq rspec-command-options nil)

(require-package 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
(setq flymake-ruby-executable "/usr/local/rbenv/shims/ruby")

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
;; remove this advice when we upgrade to emacs24.4, it's built in
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(if (eq system-type 'darwin)
    (require-package 'exec-path-from-shell))

;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

;; no bell
(setq ring-bell-function 'ignore)

(custom-set-variables
  '(frame-background-mode 'dark))
(load-theme 'solarized t)

(require 'key-bindings)
