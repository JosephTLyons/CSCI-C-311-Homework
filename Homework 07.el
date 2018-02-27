;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 7
;; Expressions are followed by their evaluated forms in the next line


;; Part 1
;; Write a function that sorts an array using any of the sorting algorithms from C243.
;; Verify that the array being passed in is in fact an array with arrayp
;; Return the sorted array

;; Using Bubble Sort
(defun bubblle-sort (L)


;; Part 2
;; Transform the following recursive function into an iterative one:

;; Recursive version
(defun random-select (L)
  (cond
   ((not L) nil)  ; Base case 1
   ((not (cdr L)) ; Base case 2
    (car L))
   ((= (% (random) 2) 0) ; Base case 3
    (car L))
   (t (random-select (cdr L)))))

;; Steps to transforming a tail recursive function into an interative function:
;; 1) Negate the recursive condition and use it as the condition of the iterative while loop
;;    If multiple base cases exist, link them with an "and" operator in the iterative version
;; 2) Transform recursive calls into assignments of the variables
;; 3) The return value comes from the base cases

;; Iterative version
(defun random-select-iter (L)
  (while (and (L)

;; Part 2


;; Part 3


;; Part 4
;; Functions with Unlimited Number of Parameters
(defun sum-numbers (&rest L)
  "Returns the sum of all numbers being passed in"
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
