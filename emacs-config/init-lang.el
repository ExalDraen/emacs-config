;; Bazel-mode
;; (use-package bazel-mode
;;   :config
;;   (setq bazel-mode-buildifier-before-save nil)  ;; this is very slow so dont set for now
;;   (setq bazel-mode-buildifier-command "~/bin/buildifier")
;; )

;; Hashicorp configuration language
(use-package hcl-mode
  :ensure t)

;; YAML
(use-package yaml-mode
  :ensure t)

(provide 'init-lang)
