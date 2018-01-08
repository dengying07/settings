;;; install mouse wheel for scrolling
(mwheel-install)
(setq user-emacs-directory ( concat (getenv "HOME" ) "/.emacs.d/"))
(add-to-list 'load-path "~/.emacs.d/themes")
;;; Turn off beeping
(setq visible-bell t)

;;; Turn off any startup messages
(setq inhibit-startup-message 0)
(setq inhibit-scratch-message nil)

;;; Turn off annoying cordump on tooltip "feature"
(setq x-gtk-use-system-tooltips nil)

;;; Insert spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;;; Line numbers and column numbers
(column-number-mode t)
(line-number-mode t)
;;;(global-linum-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("68185686ac5b35513f7393d4abb3df78e4d33419fddc3d89703759faa2213744" default)))
 '(load-home-init-file t t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq c-basic-offset 4) ;; default comments at 4 spaces
(c-set-offset 'innamespace 0) ;; namespaces shouldn't cause indentation
(show-paren-mode t) ;; show matching parenthesis
(c-set-offset 'access-label -2) ;; private, public etc. indent at two spaces

;; load headers files .h as C++ mode not c
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ;; treat .h as C++ no C

;;some key-bindings
(define-key global-map (kbd "M-g") 'goto-line)
(define-key global-map "\C-c\C-c" 'comment-line)
(define-key global-map (kbd "C-x C-o") 'ff-find-other-file)
(global-set-key (kbd "M-s") 'backward-kill-word);

;Autocomplete
(global-set-key [\C-tab] `dabbrev-expand)

;; Set the number to the number of columns to use.
(setq-default fill-column 79)

;; Add Autofill mode to mode hooks.
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Auto add header
(autoload 'auto-make-header "~/.emacs.d/header2.el")
;;(require 'setup-header2)
;;(add-hook 'c-mode-common-hook 'make-header-hook)
;;(add-hook 'emacs-lisp-mode-hook 'auto-make-header)

;; Show line number in the mode line.
(line-number-mode 1)

;; Show column number in the mode line.
(column-number-mode 1)

;;Syntax highlight
(global-font-lock-mode 1)

;;Python specific settings
(load-library "python")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'indent-tabs-mode nil))))


;;(add-to-list 'load-path "/home/zpan21")
;;(add-hook 'find-file-hook 'flymake-find-file-hook)
;;(when (load "flymake" t)
;;  (defun flymake-pyflakes-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                       'flymake-create-temp-inplace))
;;           (local-file (file-relative-name temp-file
;;                                           (file-name-directory buffer-file-name))))
;;      (list "pycheckers"  (list local-file))))
;;  (add-to-list 'flymake-allowed-file-name-masks
;;               '("\\.py\\'" flymake-pyflakes-init)))
;;(load-library "flymake-cursor")
;;(global-set-key [f10] 'flymake-goto-prev-error)
;;(global-set-key [f11] 'flymake-goto-next-error)

;;;;Flymake
;;;; Setup for Flymake code checking.
;;(require 'flymake)
;;(load-library "flymake-cursor")
;;
;;;; Script that flymake uses to check code. This script must be
;;;; present in the system path.
;;(setq pycodechecker "pychecker")
;;
;;(when (load "flymake" t)
;;  (defun flymake-pycodecheck-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                       'flymake-create-temp-inplace))
;;           (local-file (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;      (list pycodechecker (list local-file))))
;;  (add-to-list 'flymake-allowed-file-name-masks
;;               '("\\.py\\'" flymake-pycodecheck-init)))
;;
;;(add-hook 'python-mode-hook 'flymake-mode)
;;
;; Remove trailing whitespace manually by typing C-t C-w.
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key (kbd "C-t C-w")
                           'delete-trailing-whitespace)))

;; Automatically remove trailing whitespace when file is saved.
(add-hook 'python-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (delete-trailing-whitespace))))))

;; Use M-SPC (use ALT key) to make sure that words are separated by
;; just one space. Use C-x C-o to collapse a set of empty lines
;; around the cursor to one empty line. Useful for deleting all but
;; one blank line at end of file. To do this go to end of file (M->)
;; and type C-x C-o.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ENCODING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-h C RET
;; M-x describe-current-coding-system

(add-to-list 'file-coding-system-alist '("\\.tex" . utf-8-unix) )
(add-to-list 'file-coding-system-alist '("\\.txt" . utf-8-unix) )
(add-to-list 'file-coding-system-alist '("\\.el" . utf-8-unix) )
(add-to-list 'file-coding-system-alist '("\\.scratch" . utf-8-unix) )
(add-to-list 'file-coding-system-alist '("user_prefs" . utf-8-unix) )

(add-to-list 'process-coding-system-alist '("\\.txt" . utf-8-unix) )

(add-to-list 'network-coding-system-alist '("\\.txt" . utf-8-unix) )

(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; mnemonic for utf-8 is "U", which is defined in the mule.el
(setq eol-mnemonic-dos ":CRLF")
(setq eol-mnemonic-mac ":CR")
(setq eol-mnemonic-undecided ":?")
(setq eol-mnemonic-unix ":LF")

(defalias 'read-buffer-file-coding-system 'lawlist-read-buffer-file-coding-system)
(defun lawlist-read-buffer-file-coding-system ()
  (let* ((bcss (find-coding-systems-region (point-min) (point-max)))
         (css-table
          (unless (equal bcss '(undecided))
            (append '("dos" "unix" "mac")
                    (delq nil (mapcar (lambda (cs)
                                        (if (memq (coding-system-base cs) bcss)
                                            (symbol-name cs)))
                                      coding-system-list)))))
         (combined-table
          (if css-table
              (completion-table-in-turn css-table coding-system-alist)
            coding-system-alist))
         (auto-cs
          (unless find-file-literally
            (save-excursion
              (save-restriction
                (widen)
                (goto-char (point-min))
                (funcall set-auto-coding-function
                         (or buffer-file-name "") (buffer-size))))))
         (preferred 'utf-8-unix)
         (default 'utf-8-unix)
         (completion-ignore-case t)
         (completion-pcm--delim-wild-regex ; Let "u8" complete to "utf-8".
          (concat completion-pcm--delim-wild-regex
                  "\\|\\([[:alpha:]]\\)[[:digit:]]"))
         (cs (completing-read
              (format "Coding system for saving file (default %s): " default)
              combined-table
              nil t nil 'coding-system-history
              (if default (symbol-name default)))))
        (unless (zerop (length cs)) (intern cs))))

;;f5 find file
(global-set-key (kbd "<f5>") 'ff-find-other-file)

;;save to .saves
(setq backup-directory-alist `(("." ."~/.saves")))

;;simplified confirmation
(defalias 'yes-or-no-p 'y-or-n-p)

;;show whitespace
(setq-default show-trailing-whitespace t)

;;delete trailing white space at the end
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;line number
(global-linum-mode t)
(setq linum-format "%3d")

;;buffer switch
(global-set-key "\C-X\C-B" 'electric-buffer-list)

(mouse-wheel-mode t)
(global-hl-line-mode 1)
(menu-bar-mode -1)
(delete-selection-mode t)

;(load-file "~/.emacs.d/reykjavik-theme.el")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-file "~/.emacs.d/almost-monokai.el")
;;(color-theme-almost-monokai)
;;(load-theme 'almost-monokai)
(load-theme 'paganini t)

(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 200
                    :weight 'normal
                    :width 'normal)

;; wind move for window switching
(when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings))

;;let backspace work properly
(global-set-key "\C-h" 'delete-backward-char)

;; resize window
(global-set-key (kbd "ESC M-[ d") 'shrink-window-horizontally)
(global-set-key (kbd "ESC M-[ c") 'enlarge-window-horizontally)
(global-set-key (kbd "ESC M-[ a") 'shrink-window)
(global-set-key (kbd "ESC M-[ b") 'enlarge-window)

(defvar find-header-file-header-file-prefixes (list "/usr/include/"
                                                    "/usr/local/include/"
                                                    "/home/ydeng79/work/tpl/"
                                                    ))

(defun find-header-file-current-char ()
  (char-to-string (char-after (point))))

(defun find-header-file-current-line-string ()
  (let ((line-string ""))
    (save-excursion
      (while (not (bolp))
        (backward-char))
      (while (not (eolp))
        (setq line-string (concat line-string (find-header-file-current-char)))
        (forward-char)))
    line-string))

(defun find-header-file-buffer-on-path (prefix-list filename)
  (if (null (car prefix-list))
      nil
    (if (file-exists-p (concat (car prefix-list) filename))
        (find-file-noselect (concat (car prefix-list) filename))
      (find-header-file-buffer-on-path (cdr prefix-list) filename))))

(defun find-header-file ()
  (interactive)
  (let ((current-line-string (find-header-file-current-line-string))
        (header-file-buffer nil))
    (cond ((string-match "^\\s-*#\\s-*include\\s-*<\\s-*\\([^< ]+\\)\\s-*>" current-line-string)
           (let ((header-file-path (match-string 1 current-line-string)))
             (setq header-file-buffer (find-header-file-buffer-on-path find-header-file-header-file-prefixes
                                                                       header-file-path))))
          ((string-match "^\\s-*#\\s-*include\\s-*\"\\([^\"]+\\)\"\\s-*" current-line-string)
           (let* ((header-file-path (match-string 1 current-line-string))
                  (buffer           (if (file-exists-p (concat default-directory header-file-path))
                                        (find-file-noselect (concat default-directory header-file-path))
                                      nil)))
             (setq header-file-buffer buffer)
             (if (null header-file-buffer)
                 (setq header-file-buffer (find-header-file-buffer-on-path find-header-file-header-file-prefixes
                                                                           header-file-path))
               nil)))
          (t nil))
    (if (null header-file-buffer)
        (message "not found header file")
      (switch-to-buffer header-file-buffer))))

(global-set-key (kbd  "<f4>") 'find-header-file)

;; quick replace
(defalias 'rs 'replace-string)

;;silent save
(add-hook 'find-file-hook(lambda() (setq buffer-save-without-query t)))

(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
