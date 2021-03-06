;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "132ikl"
      user-mail-address "132@ikl.sh")

(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 16))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;;(setq org-directory "~/org/")

;; rainbow pog
(setq rainbow-delimiters-max-face-count 9)

;;;; EDITOR CONFIG
;; evil config
(setq display-line-numbers-type 'relative)
(after! evil-snipe (evil-snipe-mode -1)) ; regular vim s

(define-key evil-normal-state-map "J" 'centaur-tabs-backward) ; qutebrowser tabs
(define-key evil-normal-state-map "K" 'centaur-tabs-forward)
(define-key evil-normal-state-map (kbd "C-J") 'centaur-tabs-move-current-tab-to-left) ; qutebrowser tabs
(define-key evil-normal-state-map (kbd "C-K") 'centaur-tabs-move-current-tab-to-right)

;; scpaste
(after! scpaste
  (setq scpaste-http-destination "https://p.ikl.sh"
        scpaste-scp-destination "gaghiel:/var/www/paste"
        scpaste-user-name "steven"
        scpaste-user-address "mailto:132@ikl.sh"
        scpaste-make-name-function 'scpaste-make-name-from-buffer-name))
;; allow ivy to select prompt
(setq ivy-use-selectable-prompt t)

;; company
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0.1)

;; use projectile root dir as default if set
(defun set-default-dir ()
  (if (projectile-project-root)
      (setq default-directory (projectile-project-root))))
(add-hook! 'find-file-hook #'set-default-dir)

(unless (display-graphic-p)
  ;; Remove any keybindings and theme setup here
  )

;;;; LANG
;; java (pain)
(setq lsp-java-java-path "/usr/lib/jvm/java-11-openjdk/bin/java")
(setq lsp-java-configuration-runtimes '[(:name "JavaSE-8"
                                         :path "/usr/lib/jvm/java-8-openjdk/"
                                         :default t)]);;;;
;;;; VISUAL
;; treemacs
(setq treemacs-width 45)
(define-key! treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
