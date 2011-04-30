;; configuraton for muse
;; Copy and modify from debian study meeting.

(require 'muse-mode)
(require 'muse-html)
(require 'muse-project)

(muse-derive-style "ksp" "xhtml"
                   :author "ksp-ja <ksp-ja_(at)_googlegroups.com>"
                   :style-sheet "style.css"
                   :header "template/header.html"
                   :footer "template/footer.html"
                   )
(setq muse-project-alist
      `(("ksp"
         (,default-directory :default "index")
         (:base "ksp" :path ,(concat default-directory "html")))))

(require 'time-stamp)
(defun muse-html-time-stamp()
  (setq time-stamp-format "%:y/%:m/%d %02H:%02M")
  (concat "Last Update: " (time-stamp-string)))
