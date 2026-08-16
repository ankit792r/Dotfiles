;; UTF-8 everywhere
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

;; make ESC to quit prompt
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


(set-face-attribute 'default nil
                    :font "Iosevka Nerd Font"
                    :height 150
                    :weight 'regular)

(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory))

(load-theme 'rose-pine t)

(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; Set-language-environment sets default-input-method, which is unwanted.
(setq default-input-method nil)

;; Ask the user whether to terminate asynchronous compilations on exit.
;; This prevents native compilation from leaving temporary files in /tmp.
(setq native-comp-async-query-on-exit t)

;; Allow for shorter responses: "y" for yes and "n" for no.
(setq read-answer-short t)
(if (boundp 'use-short-answers)
    (setq use-short-answers t)
  (advice-add 'yes-or-no-p :override #'y-or-n-p))
(setq revert-buffer-quick-short-answers t)

;; Don't create lockfiles
(setq create-lockfiles nil)

;; NeoVim options translation to emacs
;; Hide menu bar
(menu-bar-mode -1)
;; Hide tool bar
(tool-bar-mode -1)
;; Hide scroll bar
(scroll-bar-mode -1)
(column-number-mode 1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)

(setq-default tab-width 2)
(setq-default standard-indent 2)
(setq-default indent-tabs-mode nil)

(global-visual-line-mode -1)
(setq-default truncate-lines t)

(setq case-fold-search t)
(setq search-highlight t)
(show-paren-mode 1)

(setq scroll-margin 4)
(setq hscroll-margin 8)

(setq split-window-preferred-direction 'horizontal)
(setq split-height-threshold nil)
(setq split-width-threshold 0)

(setq mouse-wheel-mode nil)

(delete-selection-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)

(setq completion-styles '(basic partial-completion flex))

;; -------------------------
;; Evil
;; -------------------------

;; MUST be before evil is loaded
(setq evil-want-integration t
      evil-want-keybinding nil)

(require 'evil)
(evil-mode 1)

(require 'evil-collection)
(evil-collection-init)

;; Completion UI
(require 'vertico)
(vertico-mode 1)

;; Better matching
(require 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-overrides
      '((file (styles partial-completion))))

;; Search/navigation
(require 'consult)


;; Evil leader
(evil-set-leader 'normal (kbd "SPC"))
(evil-set-leader 'normal (kbd "\\") t)

(evil-define-key 'normal 'global

  ;; Files / buffers / projects
  (kbd "<leader><SPC>") #'project-find-file
  (kbd "<leader>ff")    #'project-find-file
  (kbd "<leader>bb")    #'consult-buffer
  (kbd "<leader>bB")    #'ibuffer
  (kbd "<leader>fp")    #'project-switch-project

  ;; Search
  (kbd "<leader>sg")    #'consult-ripgrep
  (kbd "<leader>sb")    #'consult-line
  (kbd "<leader>sB")    #'my/consult-grep-buffers
  (kbd "<leader>sw")    #'my/consult-ripgrep-word

  ;; Navigation
  (kbd "<leader>sm")    #'consult-mark

  ;; Misc
  (kbd "<leader>sh")    #'consult-info
  (kbd "<leader>s/")    #'consult-history)


(defun my/save-and-quit ()
  "Save current buffer and quit the current Evil window."
  (interactive)
  (save-buffer)
  (evil-quit))

(evil-define-key 'normal 'global
  ;; <leader>qq
  (kbd "<leader>qq") #'save-buffers-kill-terminal

  ;; <leader>q
  (kbd "<leader>q") #'evil-quit

  ;; <leader>Q
  (kbd "<leader>Q") #'my/save-and-quit)


;; File explorer
(evil-define-key 'normal 'global
  (kbd "<leader>e") #'dired-jump)

;; jj -> Escape
(evil-define-key 'insert 'global
  (kbd "j j") #'evil-normal-state)

;; Window navigation
(evil-define-key 'normal 'global
  (kbd "C-h") #'evil-window-left
  (kbd "C-j") #'evil-window-down
  (kbd "C-k") #'evil-window-up
  (kbd "C-l") #'evil-window-right)


;; Escape -> clear search highlight
(defun my/evil-escape ()
  "Return to normal state and clear search highlighting."
  (interactive)
  (evil-ex-nohighlight)
  (evil-normal-state))

(evil-define-key 'normal 'global
  (kbd "<escape>") #'my/evil-escape)

(evil-define-key 'insert 'global
  (kbd "<escape>") #'my/evil-escape)

;; Substitute
(evil-define-key 'normal 'global
  (kbd "<leader>sr") #'evil-ex)

;; Join lines and keep cursor centered
(defun my/evil-join-centered ()
  "Join current line with the next line and recenter."
  (interactive)
  (evil-join 1)
  (recenter))

(evil-define-key 'normal 'global
  (kbd "J") #'my/evil-join-centered)


(defun my/evil-scroll-down ()
  (interactive)
  (evil-scroll-down nil)
  (recenter))

(defun my/evil-scroll-up ()
  (interactive)
  (evil-scroll-up nil)
  (recenter))

(evil-define-key 'normal 'global
  (kbd "C-d") #'my/evil-scroll-down
  (kbd "C-u") #'my/evil-scroll-up
  (kbd "C-f") #'evil-scroll-page-down
  (kbd "C-b") #'evil-scroll-page-up)


(evil-define-key 'normal 'global
  (kbd "C-<up>")
  #'enlarge-window

  (kbd "C-<down>")
  #'shrink-window

  (kbd "C-<left>")
  #'shrink-window-horizontally

  (kbd "C-<right>")
  #'enlarge-window-horizontally)

(evil-define-key 'normal 'global
  ;; Split below
  (kbd "<leader>-") #'evil-window-split

  ;; Split right
  (kbd "<leader>|") #'evil-window-vsplit

  ;; Delete window
  (kbd "<leader>wd") #'delete-window)
