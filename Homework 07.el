;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 7
;; Expressions are followed by their evaluated forms in the next line


;; Part 1
;; Using Arrays in Lisp
;; Bubble Sort
(defun bubble-sort (A)
  "Sorts an array using the Bubble Sort method."
  (if (arrayp A)
      (let ((i 0) (j 0) (swapped t) (n (length A)) (temp))
        (while (and (< i (- n 1)) swapped)
          (setq j 0)
          (setq swapped nil)
          (while (< j (- (- n i) 1))
            (if (> (elt A j) (elt A (+ j 1)))
                (progn
                  (setq temp (elt A j))
                  (aset A j (elt A (+ j 1)))
                  (aset A (+ j 1) temp)
                  (setq swapped t)))
            (setq j (+ j 1)))
          (setq i (+ i 1)))))
  A)

(bubble-sort '[1 4 2 3 0 -1]) ; Testing a random case
;[-1 0 1 2 3 4]

(bubble-sort '[4 3 2 1 0 -1 -2 -3 -4]) ; Testing worst case scenario
;[-4 -3 -2 -1 0 1 2 3 4]

(bubble-sort '[2000 50 12 70000 400 300 1]) ; Testing bigger numbers
;[1 12 50 300 400 2000 70000]

(bubble-sort '[1.3 3.23 2.54 0.2]) ; Works with floats as well
;[0.2 1.3 2.54 3.23]

(bubble-sort 'a) ; Simply returns item if it is not an array
;a


;; Part 2
;; Tail Recursion Transformation
;; Transform the following recursive function into an iterative one:
;; Recursive version:
(defun random-select (L)
  "Selects a number from a list, using recursion."
  (cond
   ((not L) nil)  ; Base case 1 - for when list being passed in is empty
   ((not (cdr L)) ; Base case 2
    (car L))
   ((= (% (random) 2) 0) ; Base case 3
    (car L))
   (t (random-select (cdr L)))))

(random-select '())
;nil

(random-select '(1 2 3 4 5 6 7 8))
;1

(random-select '(1 2 3 4 5 6 7 8))
;5

(random-select '(1 2 3 4 5 6 7 8))
;4

;; Steps to transforming a tail recursive function into an interative function:
;; 1) Negate the recursive base conditions and use them as the conditions of
;;    the iterative while loop.  If multiple base cases exist, link them with
;;    an "and" operator in the iterative version.
;; 2) Transform recursive calls into assignments of the variables.
;; 3) The return values come from the base cases.

;; Iterative version:
(defun random-select-iter (L)
  "Selects a number from a list, using iteration."
  (while (and L (cdr L) (not (= (% (random) 2) 0)))
    (setq L (cdr L)))
  (if (not L)
      nil
    (car L)))

(random-select-iter '())
;nil

(random-select-iter '(1 2 3 4 5 6 7 8))
;5

(random-select-iter '(1 2 3 4 5 6 7 8))
;1

(random-select-iter '(1 2 3 4 5 6 7 8))
;3


;; Part 3
;; Transformation to Tail Recursion
;; Original Function:
(defun count-val (L val)
  "Counts occurrences of a specified value in a list."
  (cond ((not L) 0)
        ((equal (car L) val)
         (+ 1 (count-val (cdr L) val)))
        (t (count-val (cdr L) val))))

;; Example of calling this function:
(count-val '(3 2 7 1 7 2 7) 7)
;3

;; a
;; Convert to tail-recursive function
(defun count-val-tail (L val result)
  "Counts occurrences of a specified value in a list."
  (cond ((not L) result)
        ((equal (car L) val)
         (count-val-tail (cdr L) val (+ result 1)))
        (t (count-val-tail (cdr L) val (+ result 0)))))

(count-val-tail '(3 2 7 1 7 2 7) 7 0)
;3

;; b
;; Convert to iterative function
(defun count-val-iter (L val)
  "Counts occurrences of a specified value in a list."
  (let ((result 0))
  (while L
    (if (equal (car L) val)
        (setq result (+ result 1)))
    (setq L (cdr L)))
  result))

(count-val-iter '(3 2 7 1 7 2 7) 7)
;3


;; Part 4
;; Functions with Unlimited Number of Parameters
(defun sum-numbers (&rest L)
  "Returns the sum of all numbers being passed in."
  (let ((sum 0))
    (while L
      (if (numberp (car L))
          (setq sum (+ sum (car L))))
      (pop L))
    sum))

(sum-numbers 1 2 3 4) ; A test for just integers
;10

(sum-numbers 1.1 2 3.14 5) ; A mixture of integers and floats
;11.24

(sum-numbers 1 "dog" 'a '(1 2 3 4 5) 9) ; A case where some parameters are numbers
;10

(sum-numbers 'a 'b 'c "cat" '(10 9 8)) ; A case when no parameters are numbers
;0

(sum-numbers 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20) ; Testing many parameters
;210
