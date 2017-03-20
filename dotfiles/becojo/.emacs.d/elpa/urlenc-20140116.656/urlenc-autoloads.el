;;; urlenc-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "urlenc" "urlenc.el" (22575 25978 118794 711000))
;;; Generated autoloads from urlenc.el

(autoload 'urlenc:decode-region "urlenc" "\
Decode region between START and END as url with coding system CS.

\(fn START END CS)" t nil)

(autoload 'urlenc:encode-region "urlenc" "\
Encode region between START and END as url with coding system CS.

\(fn START END CS)" t nil)

(autoload 'urlenc:decode-insert "urlenc" "\
Insert decoded URL into current position with coding system CS.

\(fn URL CS)" t nil)

(autoload 'urlenc:encode-insert "urlenc" "\
Insert encoded URL into current position with coding system CS.

\(fn URL CS)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; urlenc-autoloads.el ends here
