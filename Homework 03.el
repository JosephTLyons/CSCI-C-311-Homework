;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 3
;; Expressions are followed by their evaluated forms in the next line

(defun is-const (L)
  (if (not L) 
      t
    (if (not (cdr L))
        t
      (let ((m t))
        (dolist (x L m)
          (if (not (equal (car L) x)) ; Compare every element with first 
              (setq m nil)))))))

(is-const '())
;t

(is-const '(1))
;t

(is-const '(1 2))
;nil

(is-const '(5 2 7 3 8 4))
;nil

(is-const '('(1 2 3) '(1 2 3) '(1 2 3)))
;t

(is-const '("dog" "dog" "dog"))
;t

(is-const '("dog" "dog" "dog" "cat"))
;nil


