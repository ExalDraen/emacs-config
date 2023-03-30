(use-package helm
  ;; https://writequit.org/eos/eos-helm.html
  :ensure t
  :bind
  ( ;; First using helm for M-x so we get a live filter
   ;; of options, and don't need to keep tab completing.
   ("M-x" . helm-M-x)
   ;; Also use helm for buffers. I can never remember the
   ;; buffers I have open.
   ("C-x C-b" . helm-buffers-list)
   ;; Finding files can also be a pain, so use helm
   ;; to locate and open files
   ("C-x C-f" . helm-find-files)
   ;; Use helm for the kill ring
   ("M-y" . helm-show-kill-ring)
   )
  :config
  (require 'helm-config)
  (setq helm-boring-buffer-regexp-list (list
                                        ;; (rx "*magit-")
                                        ;; (rx "*magit: ")
                                        ;; (rx "magit-")
                                        ;; (rx "magit: ")
                                        ;; (rx "*helm ")
                                        ;; (rx "*Minibuf-")
                                        ;; (rx "*Echo Area")

                                        ;; (rx "*Backtrace*")
                                        ;; (rx "*code-converting-work*")
                                        ;; (rx "*code-conversion-work*")
                                        ;; (rx "*Compile-Log*")
                                        ;; (rx "*Completions*")
                                        ;; (rx "*groovy*")
                                        ;; (rx "*Help*")
                                        ;; (rx "*Messages*")
                                        (rx "*NeoTree*")
                                        ;; (rx "*scratch*")
                                        ;; (rx "*server*")
                                        ;; (rx "*Shell Command Output*")
                                        )
        )
  (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
  (setq completion-styles '(flex)) ;; recommended for emacs 27+ by https://emacs-helm.github.io/helm/
    )
(provide 'init-helm)
