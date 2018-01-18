;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 3
;; Expressions are followed by their evaluated forms in the next line

(defun is-const (L)
  (if (not L) 
      t
    (if (not (cdr L))
	t
      ()))) ; add loop here

(is-const '())
(is-const '(1))

