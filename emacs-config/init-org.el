;;; init-org.el --- Configure org mode and associated bits
;;; Commentary:
;; References - see:
;; - https://orgmode.org/manual/Capture.html
;; - https://orgmode.org/manual/Capture.html
;; References: https://orgmode.org/manual/Capture.html
;;
(defcustom org-journal-file "~/notes/journal/diary.org"
  "Directory for journal entries."
  :type 'file
  :group 'org-agenda
  )

(defun goto-journal-file ()
  "Create and load a journal file based on month date."
  (interactive)
  (find-file org-journal-file)
  (org-reveal)
  ;; Go to the datetree entry for today Copied from org-capture.el
  (org-datetree-find-date-create (calendar-gregorian-from-absolute (org-today)))
)

;; Org-mode
(use-package org
  :bind
  ( ;; Bindings for storing and insertnig links
    ("C-C l" . org-store-link)
    ("C-C C-l" . org-insert-link)
    ;; Bindings for agenda
    ("C-C c" . org-capture)
    ("C-C a" . org-agenda)
    ;; Bindings for journaling
    ("C-C j" . goto-journal-file)
  )
  :config
  ;; improve look & feel
  (setq org-src-fontify-natively t
        org-fontify-quote-and-verse-blocks t
        org-hide-emphasis-markers t
        org-edit-src-content-indentation 2
        org-src-preserve-indentation nil  ;on export
        org-cycle-separator-lines 2  ;; num lines needed to keep empty line between subtrees
        org-hide-block-startup nil ;;dont fold everything at startup
        org-startup-folded 'content ;;fold content only on startup
        )
  (setq org-log-done 'time)
  ;; What will be considered for the agenda
  (setq org-agenda-files
        '("~/notes/journal/diary.org"
          ;"~/notes/1_on_1s/"
          )
        )
)

(use-package org-capture
  ;:ensure t ;; probably unnecessary b/c base org will pull this in
  :config
  ;; templates for quick note capture
  (setq org-capture-templates '(
                                 ("j" "Journal" entry (file+datetree org-journal-file)
                                 "* %?\n%U\n %i\n" :jump-to-captured t)
                                 ("g" "Glen Q" entry (file+olp "~/notes/1_on_1s/glen.org" "NEXT")
                                 "** %?\n%U\n %i\n" :empty-lines-after 1)
                                 ("s" "Sched Journal Todo" entry (file+datetree "~/notes/journal/diary.org")
                                 "* TODO %?\nSCHEDULED: %t\n %i\n" :jump-to-captured t :time-prompt t)
                                 ;;("1" "1-on-1" entry (file+datetree "~/notes/journal/diary.org")
                                 ;;"* TODO %?\n%t\n %i\n" :jump-to-captured t :immediate-finish t )
                                 ))
  )

(use-package org-refile
  ;:ensure t ;; probably unnecessary b/c base org will pull this in
  :config
  ; Refiling
  (setq org-refile-use-outline-path 'file)  ;; allow filing at top level
  (setq org-outline-path-complete-in-steps nil)  ;; so we can use helm
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  )

(provide 'init-org)
;;; init-org.el ends here
