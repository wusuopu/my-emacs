(add-to-list 'load-path "~/.emacs.d")
(let ((default-directory "~/.emacs.d"))
  (normal-top-level-add-subdirs-to-load-path))

;; Line-by-Line Scrolling
(setq scroll-step 1)

;; Highlight Current Line
(global-hl-line-mode 1)

;; Set Indent Size
(setq standard-indent 4)

;; Show line number
(global-linum-mode 1)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; ========= Set colours ==========
;; Set cursor and mouse-pointer colours
;;(set-cursor-color "red")
;;(set-mouse-color "goldenrod")
;; Set region background colour
;;(set-face-background 'region "blue")
;; Set emacs background colour
;;(set-background-color "black")






