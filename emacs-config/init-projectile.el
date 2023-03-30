(use-package projectile
  :ensure t
  :diminish projectile-mode
  :bind-keymap
  ("C-c p" . projectile-command-map) ;; http://projectile.readthedocs.io
  :config
  (setq projectile-dirconfig-comment-prefix ?#)
  (setq projectile-enable-caching t)
  (projectile-global-mode)
  ;;(use-package helm-projectile)
  ;;(helm-projectile-on))
  )

(use-package helm-projectile
  :ensure t
  :after projectile
  :config
  (helm-projectile-on))

;; helm-projectile-switch-project
(provide 'init-projectile)
