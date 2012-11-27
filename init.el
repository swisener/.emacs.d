(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;; CURSOR MOVEMENTS

;; Single char cursor movement
(global-set-key (kbd "C-h") 'backward-char)
(global-set-key (kbd "C-n") 'forward-char)
(global-set-key (kbd "C-c") 'previous-line)
(global-set-key (kbd "C-t") 'next-line)

;; Move by word
(global-set-key (kbd "C-g") 'backward-word)
(global-set-key (kbd "C-r") 'forward-word)

;; Move by paragraph
(global-set-key (kbd "C-S-g") 'backward-block)
(global-set-key (kbd "C-S-r") 'backward-block)

;; Move to beginning/ending of line
(global-set-key (kbd "C-d") 'move-beginning-of-line)
(global-set-key (kbd "C-S-d") 'move-end-of-line)

;; Move by screen (page up/down)
;(global-set-key (kbd "C-S-c") 'scroll-down)
;(global-set-key (kbd "C-S-t") 'scroll-up)

;; Move to beginning/ending of file
;(global-set-key (kbd "C-S-h") 'backward-open-bracket)
;(global-set-key (kbd "C-S-n") 'forward-close-bracket)

;; isearch
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-S-f") 'isearch-backward)

(global-set-key (kbd "C-l") 'recenter)

;;; MAJOR EDITING COMMANDS

;; Delete previous/next char.
(global-set-key (kbd "C-e") 'delete-backward-char)
(global-set-key (kbd "C-u") 'delete-char)

; Delete previous/next word.
(global-set-key (kbd "C-.") 'backward-kill-word)
(global-set-key (kbd "C-p") 'kill-word)

; Copy Cut Paste, Paste previous
(global-set-key (kbd "C-q") 'kill-region)
(global-set-key (kbd "C-j") 'kill-ring-save)
(global-set-key (kbd "C-k") 'yank-key)
(global-set-key (kbd "C-S-k") 'yank-pop)
(global-set-key (kbd "C-S-j") 'copy-all)
(global-set-key (kbd "C-S-q") 'cut-all)

;; undo and redo
(global-set-key (kbd "C-:") 'redo)
(global-set-key (kbd "C-;") 'undo)

; Kill line
(global-set-key (kbd "M-i") 'kill-line)
(global-set-key (kbd "M-S-i") 'kill-line-backward)

;;; Textual Transformation

(global-set-key (kbd "C-S-SPC") 'mark-paragraph)
(global-set-key (kbd "C-,") 'shrink-whitespaces)
(global-set-key (kbd "C--") 'comment-dwim)
(global-set-key (kbd "C-z") 'toggle-letter-case)

; keyword completion
(global-set-key (kbd "C-y") 'call-keyword-completion)

; Hard-wrap/un-hard-wrap paragraph
(global-set-key (kbd "C-'") 'compact-uncompact-block)

;;; EMACS'S SPECIAL COMMANDS

; Cancel
(global-set-key (kbd "C-b") 'keyboard-quit)

; Mark point.
(global-set-key (kbd "C-SPC") 'set-mark-command)

(global-set-key (kbd "C-a") 'execute-extended-command)
(global-set-key (kbd "C-S-a") 'shell-command)

;;; WINDOW SPLITING
(global-set-key (kbd "C-o") 'move-cursor-next-pane)
(global-set-key (kbd "C-S-o") 'move-cursor-previous-pane)

;;; --------------------------------------------------
;;; OTHER SHORTCUTS

(global-set-key (kbd "C-~") 'switch-to-previous-frame)
(global-set-key (kbd "C-`") 'switch-to-next-frame)

(global-set-key (kbd "C-5") 'query-replace)
(global-set-key (kbd "C-%") 'query-replace-regexp)

(global-set-key (kbd "C-3") 'delete-other-windows)
(global-set-key (kbd "C-0") 'delete-window)

(global-set-key (kbd "C-4") 'split-window-vertically)
(global-set-key (kbd "C-$") 'split-window-horizontally)

(global-set-key (kbd "C-8") 'extend-selection)
(global-set-key (kbd "C-*") 'select-text-in-quote-key)
