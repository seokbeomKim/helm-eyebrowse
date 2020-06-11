(defun helm-eyebrowse--win-list ()
  (interactive)
  "Helm backend"
  (setq eyebrowse-winlist '())
  (dolist (item (eyebrowse--get 'window-configs))
    (push (format"%s: %s" (first item) (car (last item))) eyebrowse-winlist))
  (setq eyebrowse-winlist (reverse eyebrowse-winlist))
  (setq some-helm-source
	'((name . "Select window number to open")
          (candidates . eyebrowse-winlist)
          (action . (lambda (candidate)
		      (eyebrowse-switch-to-window-config (string-to-number (substring candidate 0 1)))))))

  (helm :sources '(some-helm-source)))

(provide 'helm-eyebrowse)
