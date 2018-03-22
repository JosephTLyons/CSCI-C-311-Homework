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

;; PART 2A
;; Type 3: Regular Grammar
;; It produces strings in the form of [(bc)^n (a)^n]

;; PART 2B
;; S
;;  \
;;   U
;;  / \
;; bc  U
;;    / \
;;   bc  U
;;      / \
;;     bc  U
;;        / \
;;       a   V
;;          / \
;;         a   V
;;             |
;;             e

;; PART 2C
(defun check-S (Lst)
  (if (not Lst)
      nil
    (check-U Lst)))

(defun check-U (Lst)
  (cond
   ((and (equal (car Lst) 'b) (equal (cadr  Lst) 'c))
    (check-U (cdr (cdr Lst))))
   ((equal (car Lst) 'a)
    (check-V (cdr Lst)))))

(defun check-V (Lst)
  (cond
   ((equal (car Lst) 'a)
    (check-V (cdr Lst)))
   ((not Lst))))

(check-S '())
;nil

(check-S '(b c))
;nil

(check-S '(b c a))
;t

(check-S '(b c b c a))
;t

(check-S '(b c b c a b a a))
;nil

(check-S '(b c b c b c a a a a))
;t
