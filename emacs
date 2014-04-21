(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/my-plugin")
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
(setq mmm-global-mode 'maybe)
(mmm-add-group
 'fancy-html
 '(
         (html-php-tagged
                :submode php-mode
                :face mmm-code-submode-face
                :front "<[?]php"
                :back "[?]>")
         (html-css-attribute
                :submode css-mode
                :face mmm-declaration-submode-face
                :front "style=\""
                :back "\"")))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.php[34]?\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.[sj]?html?\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . html-mode))
(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-js))
(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-css))
(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil fancy-html))

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

;; window编号， C-x C-j n 跳到对应window
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
(setq flymake-python-pyflakes-executable "flake8")
(setq flymake-python-pyflakes-extra-arguments '("--ignore=W806"))

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(require 'flymake-shell)
(add-hook 'sh-set-shell-hook 'flymake-shell-load)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow"))))
 '(mode-line ((t (:foreground "white" :background "#0044cc" :box nil))))
 '(mode-line-inactive ((t (:foreground "white" :background "#262626" :box nil)))))

;;; 设置flymake-cursor 延时时间
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.9))
;;; 查看下一个错误
(defun my-flymake-show-next-error()
   (interactive)
   (flymake-goto-next-error)
   (flymake-display-err-menu-for-current-line)
)
(local-set-key "\C-c\C-v" 'my-flymake-show-next-error)

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

;; tabbar
(tabbar-mode 1)
(global-set-key "\C-x\C-n" 'tabbar-forward-tab)
(global-set-key "\C-x\C-p" 'tabbar-backward-tab)

(require 'cedet)
(global-ede-mode t) 
;;;; Helper tools.
(custom-set-variables
  '(semantic-default-submodes (quote (
         global-semantic-decoration-mode global-semantic-idle-completions-mode
         global-semantic-idle-scheduler-mode global-semantic-idle-summary-mode
         global-semantic-mru-bookmark-mode)))
  '(semantic-idle-scheduler-idle-time 3))
(semantic-mode)

(require 'semantic/ia)

;; ecb Emacs Code Browser  需要安装 cedet
;; ecb-activate   ecb-deactivate
(require 'ecb-autoloads)
(setq ecb-examples-bufferinfo-buffer-name nil)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; pep8
;; (add-hook 'before-save-hook 'py-autopep8-before-save)

;; 多终端
(require 'multi-term)

(add-to-list 'load-path "~/.emacs.d/my-plugin/powerline")
(require 'powerline)
(defun graphic-powerline-config ()  
  "powerline setting for graphic"  
  (interactive)  
  (progn  
   (setq powerline-arrow-shape 'arrow)  
   (custom-set-faces  
    '(mode-line ((t (:foreground "white" :background "#0044cc" :box nil))))  
    '(mode-line-inactive ((t (:foreground "white" :background "#262626" :box nil))))  
    )  
   (setq powerline-color1 "#0088cc")  
   (setq powerline-color2 "white")  
   )  
)  
  
(defun terminal-powerline-config()  
   " powerline setting for terminal"  
   (interactive)  
   (setq powerline-arrow-shape 'arrow)  
   (setq powerline-color1 "grey22")  
   (setq powerline-color2 "grey22")   
   (custom-set-faces  
    '(mode-line ((t (:foreground "grey44" :background "grey22" :box nil))))  
    '(mode-line-inactive ((t (:foreground "grey22" :background "grey44" :box nil))))  
    )
)  
  
(graphic-powerline-config)
;;  "根据是否图形界面加载配置"  
;;(if (display-graphic-p)  
;;    (graphic-powerline-config)  
;;  (terminal-powerline-config))



; python.el
(require 'python)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(setq 
  python-shell-interpreter "ipython2"
  python-shell-interpreter-args ""
  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
  python-shell-completion-setup-code
  "from IPython.core.completerlib import module_completion"
  python-shell-completion-module-string-code
  "';'.join(module_completion('''%s'''))\n"
  python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")



;;;;;;;;;;;;;;;;;;;;;;;;
;; 默认字体
(set-default-font "Monospace-9") 
;; Line-by-Line Scrolling
(setq scroll-step 1)

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

;; mode line
;;; 模式行
(display-time-mode 1)
(setq display-time-format "%m/%d %T")
(setq default-mode-line-format
      (list "%*%+%& "
        'buffer-file-type
        "%Z<" (getenv "USER") ">"
        "%f "
        ;"[" 'display-time-string "]"
        " " "%[(" 'mode-name 'minor-mode-alist "%n" 'mode-line-process ")%]--"
        "%I (%l %c)--"
        '(-3 . "%P")
        "-%-"
      )
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


;; hide toolbar menubar scrollbar
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
