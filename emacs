(add-to-list 'load-path "~/.emacs.d")
;; (let ((default-directory "~/.emacs.d"))
;;   (normal-top-level-add-subdirs-to-load-path))

;   ; (:name magit                   ; git meet emacs, and a binding
;

(require 'package)
(package-initialize)
(add-to-list 'package-archives
  '("mepla" . "http://melpa.milkbox.net/packages/") t
)

;; helm
(helm-mode 1)

;; emmet-mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

;; mmm-mode
(require 'mmm-mode)

;; evil 模拟vim
(require 'evil)
(evil-mode 1)

;; wordpress
(require 'xml-rpc)
(require 'metaweblog)
(require 'org2blog)

;; 自动补全括号等
(require 'autopair)
(autopair-global-mode)

;; 
(require 'window-number)
(window-number-mode 1)

;; buffer-move
(global-set-key (kbd "<C-S-up>")    'buf-move-up)
(global-set-key (kbd "<C-S-down>")  'buf-move-down)
(global-set-key (kbd "<C-S-left>")  'buf-move-left)
(global-set-key (kbd "<C-S-right>") 'buf-move-right)


;; css synatx check
(require 'flymake-css)
(add-hook 'css-mode-hook 'flymake-css-load)

(require 'flymake-lua)
(add-hook 'lua-mode-hook 'flymake-lua-load)

(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-extra-arguments '("--ignore=W806"))

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(require 'flymake-shell)
(add-hook 'sh-set-shell-hook 'flymake-shell-load)

;; 自动补全C
(require 'auto-complete-c-headers)
(add-to-list 'ac-sources 'ac-source-c-headers)

;; 高亮外围括号
(require 'highlight-parentheses)
(highlight-parentheses-mode 1)
(hc-toggle-highlight-tabs 1)  ;; 显示tab符号
;; (require 'highlight-tail)
;; (highlight-tail-mode)

;; 列高亮
(require 'column-marker)
(column-marker-1 80)

(require 'color-theme)
(color-theme-initialize)
;; (load-theme 'color-theme-longchang t)
(require 'color-theme-wombat)
(color-theme-wombat)

;; inf-mongo: run mongodb shell
(require 'inf-mongo)

;; Line-by-Line Scrolling
(setq scroll-step 1)

;; hide toolbar menubar scrollbar
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)


;; Highlight Current Line
(global-hl-line-mode 1)

;; Set Indent
(setq standard-indent 4)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-stop-list ())
(loop for x downfrom 4 to 1 do
      (setq tab-stop-list (cons (* x 4) tab-stop-list)))

;; Show line number
(global-linum-mode 1)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; 查询字符串高亮
(setq search-hightlight t)

;; 将每个框架都设置为显示一个菜单条，并在鼠标移动到上面时弹出菜单
(setq default-frame-alist
      '((menu-bar-lines . 1)
          (auto-lower . t)
    (auto-raise . t)))

;; ========= Set colours ==========
;; Set cursor and mouse-pointer colours
;;(set-cursor-color "red")
;;(set-mouse-color "goldenrod")
;; Set region background colour
;;(set-face-background 'region "blue")
;; Set emacs background colour
;;(set-background-color "black")
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "slate blue")
(set-face-background 'region    "slate blue")
(set-face-background 'secondary-selection "turquoise")

;;; 设置鼠标形状和颜色
;(let ((mpointer (x-get-resource "*mpointer"
;                     "*emacs*mpointer")))
;  (if (eq mpointer nil)
;      (setq mpointer "132"))
;  (setq x-pointer-shape (string-to-int mpointer))
;  (set-mouse-color "white"))

;;; 模式行
(setq mode-line-system-identification
  (substring (system-name) 0
           (string-match "\\..+" (system-name))
  )
)
(setq default-mode-line-format
      (list ""
              'mode-line-modified
        "<"
        'mode-line-system-identification
        "> "
        "%14b"
        " "
        'default-directory
        " "
        "%[("
        'mode-name
        'minor-mode-alist
        "%n"
        'mode-line-process
        ")%]--"
        "(%l %c)--"
        '(-3 . "%P")
        "-%-")
)
(setq mode-line-format default-mode-line-format)

;;; Text mode and Auto Fill mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;; Mail mode
; To enter mail mode, type 'C-x m'
; To enter RMAIL (for reading mail), type 'M-x rmail'
; 邮件别名在 ./mailrc 中进行设置： alias <name> <address>
(setq mail-aliases t)

;;; Unbind 'C-x f'
(global-unset-key "\C-xf")

;;; Rebind 'C-x C-b'
(global-set-key "\C-x\C-b" 'buffer-menu)

