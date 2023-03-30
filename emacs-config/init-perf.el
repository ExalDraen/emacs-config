;; Increase GC threshold, set it to 5*1000*1000 bytes (default 800 kB)
(setq gc-cons-threshold (* 5 1000 1000))

(add-hook 'emacs-startup-hook
          (lambda()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             float-time
                             (time-subtract after-init-time before-init-time))
                     gcs-done
                     )
            )
          )

(provide 'init-perf)
