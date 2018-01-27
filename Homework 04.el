;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 4
;; Expressions are followed by their evaluated forms in the next line

;; Part 1 - Not Done

;; Part 2 - Not Done
;; Logic: divisor-counter = 2 since all positive integers are divisible
;; by one and themselves
;; halfway-mark = (number / 2) because we dont need to waste time checking
;; values past the halfway mark, since they won't be evenly divide the
;; number were checking   
(defun is-prime (number)
  (let ((prime t) (divisor-counter 2) (halfway-mark (/ number 2)))
    (dotimes (2 halfway-mark prime)
      
;; Part 3 - Not Done
