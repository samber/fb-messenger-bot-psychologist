
(load-file "doctor.el")


; override
(defun doctor-txtype (ans)
  "Output to buffer a list of symbols or strings as a sentence."
  (setq doctor--*print-upcase* t doctor--*print-space* nil)
  (mapc 'doctor-type-symbol ans)
;  (insert "\n"))
  )

(defun process_msg (str)
  (setq doctor-sent str)
  (setq doctor-sent (mapcar 'intern (delete "" (split-string (downcase str) split-string-default-separators))))
  (doctor-doc)
  (princ (buffer-string))
  (erase-buffer)
  )

; init doctor answers
(make-doctor-variables)

; main loop
(while (setq line (read-from-minibuffer ""))
  (process_msg line)
  )
