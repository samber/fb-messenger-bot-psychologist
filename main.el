
(load-file "doctor.el")


(defun _doctor-readin ()
  "Read a sentence.  Return it as a list of words."
    argv)

; override
(defun doctor-txtype (ans)
  "Output to buffer a list of symbols or strings as a sentence."
  (setq doctor--*print-upcase* t doctor--*print-space* nil)
  (mapc 'doctor-type-symbol ans)
;  (insert "\n"))
  )

(defun process_msg (str)
  (setq doctor-sent str)
  (setq doctor-sent (mapcar 'intern (delete "" (split-string str split-string-default-separators))))
  (doctor-doc)
  (princ (buffer-string))
  (erase-buffer)
  )

; init doctor module
(make-doctor-variables)

(while (setq line (read-from-minibuffer ""))
  (process_msg line)
  )
