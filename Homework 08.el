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

(bsymbol 'boot 3 'basic 'balloon 8 'march) ; Test given in problem
;boot basic balloon
;t

(bsymbol 'bat 'girl 'boy 'a 'b 83 "man") ; Test with mixture of elements
;bat boy b
;t

(bsymbol 'superman 'batman 'bane 'black-panter 'wonder-woman 'spider-man 'bruce-banner) ; Long test
;batman bane black-panter bruce-banner
;t
