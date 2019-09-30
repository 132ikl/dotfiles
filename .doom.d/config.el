;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;;; PACKAGES
(require 'package)
(package-initialize)
;;;

;;; DOOM THEMES
(require 'doom-themes)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(load-theme 'doom-one t)
(doom-themes-visual-bell-config)
(doom-themes-neotree-config)
(doom-themes-org-config)
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 14))
;;; DOOM


;;; PYTHON
; JEDI
(require 'jedi)
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'python-black-on-save-mode)
;
; MISC
; (setq python-shell-interpreter "/usr/bin/python3")
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))
;
;;;;

;;; COMPANY
(define-key global-map [f11] 'company-complete)
(add-hook 'after-init-hook 'global-company-mode)
(require 'company-jedi)
(setq company-backends '(company-jedi))
;;;


;;; CENTAUR TABS
(setq centaur-tabs-style "bar")
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-set-bar 'left)
(setq centaur-tabs-gray-out-icons 'buffer)
(setq centaur-tabs-set-modified-marker t)
(define-key evil-normal-state-map (kbd "K") 'centaur-tabs-forward)
(define-key evil-normal-state-map (kbd "J") 'centaur-tabs-backward)
(add-hook 'after-init-hook 'centaur-tabs-mode)
;;;

;;; MISC
(add-hook 'projectile-after-switch-project-hook 'neotree-projectile-action)
(add-hook 'projectile-after-switch-project-hook 'neotree-show)
;;;

;;; EVIL SETTINGS
(define-key evil-normal-state-map (kbd "<f8>") 'neotree-toggle)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd ", c") 'evil-commentary-line)
(define-key evil-normal-state-map (kbd "SPC m") (lambda() (interactive)(load-file "~/.doom.d/config.el")))
(setq display-line-numbers-type 'relative)
;;;
