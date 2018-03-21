;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 3
;; Expressions are followed by their evaluated forms on the next line

;; PART 1A
(defun is-const (L)
  "Returns true if every element in the list is the equivalent to one another."
  (if (not L)
      t
    (if (not (cdr L))
        t
      (let ((elements-equal t))
        (dolist (x L elements-equal)
          (if (not (equal (car L) x)) ; Compare every element with first
              (setq elements-equal nil)))))))

(is-const '())
;t

(is-const '(1))
;t

(is-const '(1 2))
;nil

(is-const '(4 4 4 4 4 4 4 4))
;t

(is-const '(5 2 7 3 8 4))
;nil

(is-const '('(1 2 3) '(1 2 3) '(1 2 3)))
;t

(is-const '("dog" "dog" "dog"))
;t

(is-const '("dog" "dog" "dog" "cat"))
;nil

;; PART 1B
(defun element-i (L i)
  "Returns the ith element in the list."
  (if (> i (length L))
      nil
      (dotimes (x (+ 1 i) number-returned) ; loop 0 to i + 1 to adjust for
        (setq number-returned (car L))     ; length of list
        (setq L (cdr L)))))

(element-i '() 0) ; Empty list
;nil

(element-i '(1) 0) ; List with one element
;1

(element-i '(5 6 7) 0) ; Test to make sure function works over whole list
;5

(element-i '(5 6 7) 1)
;6

(element-i '(5 6 7) 2)
;7

(element-i '(5 6 7) 3) ; Past index of the list
;nil

;; PART 1C
(defun is-sorted (L)
  "Returns true if list is sorted in ascending order."
  (let ((previous-val (car L)) (is-ordered t))
    (setq L (cdr L))
    (dolist (x L is-ordered)
      (if (> previous-val x)
          (setq is-ordered nil))
      (setq previous-val x))))

(is-sorted '())
;t

(is-sorted '(1))
;t

(is-sorted '(1 1 1))
;t

(is-sorted '(1 2 3))
;t

(is-sorted '(6 5 4 3 2 1))
;nil

(is-sorted '(4 2 5 1 6))
;nil

(is-sorted '(-4 -2 3))
;t

(is-sorted '(-2 -3 3))
;nil

;; PART 1D
(defun reverse (L)
  "Returns the list in reverse order."
  (let ((backwards '()))
    (dolist (x L backwards)
      (setq backwards (append (list x) backwards)))))

(reverse '())
;nil

(reverse '(1))
;(1)

(reverse '(1 2 3 4 5))
;(5 4 3 2 1)

(reverse '(-1 -2 -3 -4 -5))
;(-5 -4 -3 -2 -1)

(reverse '("dog" "cat" "bird"))
;("bird" "cat" "dog")
