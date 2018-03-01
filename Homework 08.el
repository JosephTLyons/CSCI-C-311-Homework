;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 8
;; Expressions are followed by their evaluated forms in the next line

;; Part 1
(defun bsymbol (&rest L)
    (dolist (x L)
      (if (symbolp x)
          (if (equal (substring (symbol-name x) 0 1) "b")
              (progn
                (princ (symbol-name x))
                (princ " ")))))
    (princ "\n")
    t)

(bsymbol 'boot 3 'basic 'balloon 8 'march)
;boot basic balloon 
;t
