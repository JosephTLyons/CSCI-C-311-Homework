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
