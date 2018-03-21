;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 9
;; Expressions are followed by their evaluated forms on the next line


;; PART 1
;; Lambda Expression
(defun replace (L z y)
  "Replaces all occurances of z in a list with y."
  (let ((lam (lambda (x) (if (equal x z) y x))))
    (mapcar lam L)))

(replace '(3 1 5 6 3 2 3) 3 9)
;(9 1 5 6 9 2 9)

(replace '("dog" "cat" "man") "man" "mouse")
;("dog" "cat" "mouse")

(replace '(9 a x 3.14 "house" x) 'x 'j)
;(9 a j 3.14 "house" j)


;; PART 2
;; Formal Grammar
