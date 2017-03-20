
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'fringe-mode) (fringe-mode 0))

(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

(setq themes-dir
      (expand-file-name "themes" user-emacs-directory))

(setq include-dir
      (expand-file-name "include" user-emacs-directory))

(setq user-settings-dir
      (concat user-emacs-directory "users/" system-name))


;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path include-dir)
(add-to-list 'custom-theme-load-path themes-dir)
(add-to-list 'load-path user-settings-dir)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)


;; Write backup files to own directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq create-lockfiles nil)

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))


;; Packages
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)


(setq el-get-user-package-directory (concat user-emacs-directory "settings"))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(setq my:el-get-packages
      '(yasnippet
	company-mode
	emmet-mode
	paredit
	grizzl
	projectile
	expand-region
	multiple-cursors
        magit
        phi-search
        web-mode
        js2-mode
        irony-mode
        elpy
        ))

(el-get-bundle
  password-manager
  :url "https://raw.githubusercontent.com/ldionmarcil/elisp-password-manager/5b9bc463514a88a921d46daa281f90d9c95636fa/password-manager.el"
  :features password-manager)

(el-get-bundle josteink/csharp-mode)

(el-get 'sync my:el-get-packages)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require 'key-bindings)

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; Don't break lines for me, please
(setq-default truncate-lines t)

;; No bell
(setq ring-bell-function 'ignore)

;; No tabs
(setq-default indent-tabs-mode nil)

;; I know what I'm doing
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Match dem pairs
(electric-pair-mode)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

(defun delete-trailing-whitespace-except-current-line ()
  (interactive)
  (let ((begin (line-beginning-position))
        (end (line-end-position)))
    (save-excursion
      (when (< (point-min) begin)
        (save-restriction
          (narrow-to-region (point-min) (1- begin))
          (delete-trailing-whitespace)))
      (when (> (point-max) end)
        (save-restriction
          (narrow-to-region (1+ end) (point-max))
          (delete-trailing-whitespace))))))

(add-hook 'before-save-hook 'delete-trailing-whitespace-except-current-line)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

(setq org-src-fontify-block t)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.launch\\'" . nxml-mode))

(setq delete-by-moving-to-trash t)

(add-hook 'ruby-mode-hook 'robe-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))


(exec-path-from-shell-initialize)
