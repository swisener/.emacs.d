(require 'find-file-in-project)

; Good enough for Rails...might need no make this fancier at some point ala magnars/.emacs.d
(setq ffip-find-options "-not -regex '.*vendor.*'")

; Some projects have a ton of files...
(setq ffip-limit 4096)

; Probably move this to a global keybindings file
(global-set-key (kbd "C-x f") 'find-file-in-project)

(provide 'init-ffip)


