(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t) ;; load theme without confirming
  )

;; Remove the splashy intro page
(setq inhibit-splash-screen t)

;; Ensure UTF8 set, helps on windows especially
(prefer-coding-system 'utf-8)

;; Use "y" and "n" to confirm/negate prompt instead of "yes" and "no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Use 4 spaces for indentation by default
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Deal with whitespace
(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(setq-default line-move-visual nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; delete trailing whitespaces on save

;; Parentheses
(setq show-paren-delay 0)
(show-paren-mode 1)
(electric-pair-mode 1) ; auto-insert matching bracket

;; Enable line number and customize format
(column-number-mode)
;; Enable line numbers for some modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))
;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Make scrolling less stuttered
(setq auto-window-vscroll nil)
(setq fast-but-imprecise-scrolling t)
(setq scroll-conservatively 101)
(setq scroll-margin 0)
(setq scroll-preserve-screen-position t)

;; Minimal interface
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)  ;; left/right fringes on all frames

;; Don't warn for following symlinked files
(setq vc-follow-symlinks t)

;; Make shebang (#!) file executable when saved
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; Revert dired and other non-fiel buffers automatically
(setq global-auto-revert-non-file-buffers t)
;; Revert buffers when underlying file has changed
(global-auto-revert-mode 1)

;; Don't prompt me to carry over the TAGS table
;; I.e. if a new dir has a TAGS table, don't ask me to keep using the old one
(setq tags-add-tables nil)

;; Don't show auto-revert modeline
(use-package autorevert
  :diminish auto-revert-mode
  )

;; Set locations for world clock

(setq display-time-world-list
  '(("Etc/UTC" "UTC")
    ("Asia/Singapore" "Singapore")
    ("Europe/London" "London")
    ("America/New_York" "New York")
    ("America/Los_Angeles" "Los Angeles")
    ("Asia/Bangalore" "Bangalore")))
(setq display-time-world-time-format "%a, %d %b %I:%M %p %Z")


;; Global key bind for word wrapping / long line truncation
(global-set-key (kbd "C-x p") 'toggle-truncate-lines)

;; eval-buffer is used a lot when doing config file shenanigans
(global-set-key (kbd "<C-M-return>") 'eval-buffer)

(provide 'init-misc-prefs)
;;; init-misc-prefs.el ends here
