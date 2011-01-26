;; configuraton for muse
;; Copy and modify from debian study meeting.

(require 'muse-mode)
(require 'muse-html)
(require 'muse-project)

(setq muse-project-alist
      `(("ksp"			
	 (,default-directory :default "index")
	 (:base "html" :path ,(concat default-directory "html")))))
(setq muse-html-style-sheet "<link rel=\"stylesheet\" type=\"text/css\" href=\"debianmeeting.css\">")

(setq muse-html-header
      (concat 
"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
<html>
  <head>
    <title><lisp>
  (concat (muse-publishing-directive \"title\")
          (let ((author (muse-publishing-directive \"author\")))
            (if (not (string= author (user-full-name)))
                (concat \" (by \" author \")\"))))</lisp></title>
    <meta name=\"generator\" content=\"muse.el\">
    <meta http-equiv=\"<lisp>muse-html-meta-http-equiv</lisp>\"
          content=\"<lisp>muse-html-meta-content-type</lisp>\">
    <lisp>
      (let ((maintainer (muse-style-element :maintainer)))
        (when maintainer
          (concat \"<link rev=\\\"made\\\" href=\\\"\" maintainer \"\\\">\")))
    </lisp>
    <lisp>muse-html-style-sheet</lisp>
  </head>
  <body>
    <h1><lisp>
  (concat (muse-publishing-directive \"title\")
          (let ((author (muse-publishing-directive \"author\")))
            (if (not (string= author (user-full-name)))
                (concat \" (by \" author \")\"))))</lisp></h1>
    <div class=\"bodydiv\">
    <!-- Page published by Emacs Muse begins here -->
"))

(setq muse-html-footer (concat 
"<!-- Page published by Emacs Muse ends here -->
    </div>
    <div class=\"toplinks\">
      <a class=\"toplinks\" href=\"index.html\">Index</a><br>
    </div>    

  </body>
</html>\n"))
