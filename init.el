(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(setq tab-always-indent 'complete
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      inhibit-startup-screen t
      make-backup-files nil
      auto-save-default nil
      mac-right-option-modifier nil
      ;mac-command-modifier 'meta
      exec-path (append exec-path '("/usr/local/bin"))
      exec-path (append exec-path '("/usr/bin"))
      exec-path (append exec-path '("/opt/homebrew/bin")))

(show-paren-mode 1)
(column-number-mode 1)
(blink-cursor-mode 0)
     
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq-default tab-width 4
              indent-tabs-mode nil
              kill-whole-line t
              c-basic-offset 4
              c-default-style "bsd")

(setq user-full-name "Brian Bernt Frost")
(setq user-mail-address "brianfrostpedersen@gmail.com")
(add-to-list 'completion-styles 'initials t)

(prefer-coding-system        'utf-8)
(set-default-coding-systems  'utf-8)
(set-language-environment    'utf-8)
(set-selection-coding-system 'utf-8)
(setq current-language-environment "UTF-8")

(global-set-key (kbd "C-S-<left>")  'windmove-left)
(global-set-key (kbd "C-S-<right>") 'windmove-right)
(global-set-key (kbd "C-S-<up>")    'windmove-up)
(global-set-key (kbd "C-S-<down>")  'windmove-down)

;; packages

(require 'linum)
(global-linum-mode t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package visual-regexp
  :ensure t)

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package highlight-thing
  :ensure t
  :config
  (global-highlight-thing-mode))

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x C-b" . helm-buffers-list)))

(use-package helm-swoop
  :ensure t
  :bind (("C-s" . helm-swoop)))

(use-package cider
  :ensure t)

(use-package paredit
  :ensure t
  :config (progn
            (add-hook 'lisp-mode-hook       #'paredit-mode)
            (add-hook 'scheme-mode-hook     #'paredit-mode)
            (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
            (add-hook 'emacs-mode-hook      #'paredit-mode)
            (add-hook 'clojure-mode-hook    #'paredit-mode)))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package magit
  :ensure t)

(use-package git-gutter-fringe
  :ensure t
  :diminish git-gutter-mode
  :config (global-git-gutter-mode))

(use-package doom-themes
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package org
  :ensure t)

(use-package org-bullets
  :ensure t
  :commands (org-bullets-mode)
  :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package company
  :ensure t
  :config (global-company-mode))

(load-theme 'doom-dark+)
(set-frame-font "Iosevka 16" nil)

(defun save-all-and-compile ()
  (interactive)
  (save-some-buffers 1)
  (compile compile-command))
(global-set-key [f12] 'save-all-and-compile)
