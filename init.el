(setq custom-file "~/.emacs.d/custom.el"
      tab-always-indent 'complete
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      inhibit-startup-screen t
      make-backup-files nil
      auto-save-default nil
      mac-option-modifier 'meta
      mac-option-modifier nil
      exec-path (append exec-path '("/usr/local/bin"))
      exec-path (append exec-path '("/usr/bin"))
      exec-path (append exec-path '("/opt/homebrew/bin"))
      user-full-name "Brian Bernt Frost"
      user-mail-address "brianfrostpedersen@gmail.com"
      current-language-environment "UTF-8"
      )


(load custom-file 'noerror)

(setq-default tab-width           4
              indent-tabs-mode  nil
              kill-whole-line     t
              c-basic-offset      4
              c-default-style "bsd")

(global-set-key (kbd "C-S-<left>")  'windmove-left)
(global-set-key (kbd "C-S-<right>") 'windmove-right)
(global-set-key (kbd "C-S-<up>")    'windmove-up)
(global-set-key (kbd "C-S-<down>")  'windmove-down)

(show-paren-mode    1)
(column-number-mode 1)
(blink-cursor-mode  0)
(menu-bar-mode     -1)
(tool-bar-mode     -1)
(scroll-bar-mode   -1)

(prefer-coding-system        'utf-8)
(set-default-coding-systems  'utf-8)
(set-language-environment    'utf-8)
(set-selection-coding-system 'utf-8)

(require 'linum)
(require 'package)

(setq package-enable-at-startup nil)
(global-linum-mode t)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package paredit
  :ensure t
  :config (progn
            (add-hook 'lisp-mode-hook       #'paredit-mode)
            (add-hook 'scheme-mode-hook     #'paredit-mode)
            (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
            (add-hook 'emacs-mode-hook      #'paredit-mode)
            (add-hook 'clojure-mode-hook    #'paredit-mode)))

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

(use-package haskell-mode
  :ensure t
  :config (progn
            (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
            (custom-set-variables '(haskell-process-type 'stack-ghci))))

(use-package org
  :ensure t)

(use-package org-bullets
  :ensure t
  :commands (org-bullets-mode)
  :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package company
  :ensure t
  :config (global-company-mode))

(use-package cider
  :ensure t)

(use-package elpy
  :ensure t
  :init (elpy-enable))

(when (member "Iosevka" (font-family-list))
  (set-frame-font "Iosevka-24" nil t))

(load-theme 'doom-dracula)
