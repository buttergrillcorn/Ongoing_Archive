(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(package-install 'htmlize)

(require 'ox-publish)

(message "Building site...")

(setq org-publish-project-alist
      '(("pages"
         :base-directory "./content/"
         :base-extension "org"
         :recursive t
         :publishing-directory "./public"
         :publishing-function org-html-publish-to-html
         :with-toc nil
         :with-author nil
         :with-creator t
         :section-numbers nil
         :time-stamp-file nil)

        ("images"
         :base-directory "./content/images/"
         :base-extension "jpg\\|gif\\|png"
         :recursive t
         :publishing-directory "./public/images"
         :publishing-function org-publish-attachment)

        ("ongoing-archive"
         :components ("pages" "images"))))

(setq org-html-validation-link nil)

(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

(org-publish-all t)
