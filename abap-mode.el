;;; abap-mode.el -- ABAP Major Mode

;; 2015 - @hugo_dc
;; http://hugo-dc.com
;;

;; This file is not part of GNU Emacs

;; define keywords

(setq abap-keywords-mayus '("REPORT" "DATA" "DATA:" "TYPE" "TYPES" "IF" "ELSE" "ENDIF" "LOOP" "TABLES" "AT" "BEGIN" "OF" "END" "ENDLOOP" "DO" "TIMES" "ENDDO" "PERFORM" "FORM" "APPEND" "CLEAR" "TO" "ENDFORM" "CALL" "FUNCTION" "EXPORTING" "EXCEPTIONS" "SELECT" "UP" "FROM" "INTO" "CORRESPONDING" "FIELDS" "TABLE" "GT" "LT" "EQ" "LE" "GE" "INSERT" "INTO" "MODIFY" "CASE" "WHEN" "USING" "LIKE" "CHANGING" "ENDCASE" "TYPE-POOLS" "ROWS" "INITIAL" "SIZE" "WITH" "HEADER" "LINE" "CONSTANTS" "VALUE" "OCCURS" "RANGES" "PARAMETERS" "SELECT-OPTIONS" "SELECTION-SCREEN" "SKIP" "CHECKBOX" "BLOCK" "COMMENT" "INITIALIZATION" "CONCATENATE" "REFRESH" "BEGIN_METHOD" "DATASET" "IMPORTING" "CHECK" "NOT" "DESCRIBE" "WRITE" "READ" "WHERE" "AND") )

(setq abap-keywords (append abap-keywords-mayus (mapcar 'downcase abap-keywords-mayus)))


(setq abap-types    '("C" "I" "F" "STRING" "X" ) )
(setq abap-constants '("SPACE" "SY" ))
(setq abap-events    '("START-OF-SELECTION" "AT SELECTION-SCREEN" "END-OF-SELECTION"))
(setq abap-functions '("STRLEN" "CONCATENATE" ))

;; Generate regex string for each category
(setq abap-keywords-regexp ( regexp-opt abap-keywords 'symbols))
(setq abap-type-regexp     ( regexp-opt abap-types 'symbols))
(setq abap-constants-regexp ( regexp-opt abap-constants 'symbols))
(setq abap-event-regexp     ( regexp-opt abap-events    'symbols))
(setq abap-functions-regexp ( regexp-opt abap-functions 'symbols))

;; create the list for font-lock
(setq abap-font-lock-keywords
      `(
	(,abap-constants-regexp . font-lock-constant-face)
	(,abap-event-regexp    . font-lock-builtin-face)
	(,abap-functions-regexp . font-lock-function-name-face)
	(,abap-keywords-regexp  . font-lock-keyword-face)
	(,abap-type-regexp . font-lock-type-face)
	;; Order above matters, in general longer words first
	))

;;;###autoload
(define-derived-mode abap-mode prog-mode
  "ABAP Mode"
  "Major mode for the ABAP Programming Language"
  (modify-syntax-entry ?' "\"")
  (modify-syntax-entry ?\" "<")
  (modify-syntax-entry ?*  "<")
  (modify-syntax-entry ?\n ">")
  ;; Code for syntax highlighting
  ;(setq font-lock-defaults '((abap-font-lock-keywords))))
  (set (make-local-variable 'font-lock-defaults) '(abap-font-lock-keywords nil t)))

;; clear memory
(setq abap-keywords nil)
(setq abap-types    nil)
(setq abap-constants nil)
(setq abap-events    nil)
(setq abap-functions nil)

(setq abap-keywords-regexp nil)
(setq abap-type-regexp    nil)
(setq abap-constants-regexp nil)
(setq abap-event-regexp    nil)
(setq abap-functions-regexp nil)

;; add the mode to the list
(provide 'abap-mode)

;; Local Variables:
;; coding: utf-8
;; End:
