(require-package 'find-file-in-project)

; Good enough for Rails...might need no make this fancier at some point ala magnars/.emacs.d
(setq ffip-find-options "-not -regex '.*vendor.*'")

; Some projects have a ton of files...
(setq ffip-limit 4096)

(provide 'init-ffip)
