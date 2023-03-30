(use-package evil
  :ensure t
  ;; Don't show evil mode, it's basically always on
  :diminish evil-mode
  ;; Make C-g revert from insert to normal state
  :bind (:map evil-insert-state-map
              ("C-g" . evil-normal-state))
  :demand t ;;ensure evil is always and not lazy loaded
  :config
  (evil-mode 1)
  ;; Make sure some modes start in Emacs state
  (dolist (mode '(custom-mode
                eshell-mode
                dired-mode
                term-mode))
  (add-to-list 'evil-emacs-state-modes mode))
  )

;; Integration between evil and org
;; The config ensures that we autoload in org mode and can use normal tab to cycle
(use-package evil-org
    ;;:ensure t
    :after org
    ;; autoload evil-org-mode when org mode is activated
    :hook (org-mode . evil-org-mode)
    :config
    ;; Enable extra key bindings
    (evil-org-set-key-theme '(navigation heading))
    (with-eval-after-load 'evil
      (evil-define-key 'normal outline-mode-map (kbd "<tab>") #'org-cycle)
      (evil-define-key 'normal outline-mode-map (kbd "TAB") #'org-cycle))
  )

;; Don't show undo-tree modeline
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  )

(provide 'init-evil)
