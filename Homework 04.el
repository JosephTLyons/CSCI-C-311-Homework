;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 4
;; Expressions are followed by their evaluated forms in the next line

;; Part 1 - Not Done

;; Part 2
;; Logic: When a number has more than 2 divisors, it is not prime.
;; We execute the body of the loop while divisor (starting at 1) < quotient,
;; which is equivalent to x (starting at 0) < (quotient - 1), since we cant set
;; x to 1 in dotimes loops.
;; Each loop, increment the divisor number and recalculate the quotient
;; to cut down the amount of loop executions needed - testing from 1 to 
;; The number checked is wasteful.
(defun is-prime (number)
  (let ((divisor 1) (divisor-count 0) (quotient number))
    (dotimes (x (- quotient 1))
      (setq quotient (/ number divisor))
      (if (equal (mod number divisor) 0)
          (setq divisor-count (+ 2 divisor-count)))
      (setq divisor (+ 1 divisor)))
    (if (equal divisor-count 2)
        t
      nil)))

(is-prime 0)
;nil

(is-prime 1)
;nil

(is-prime 2)
;t

(is-prime 3)
;t

(is-prime 4)
;nil

(is-prime 5)
;t

(is-prime 6)
;nil

(is-prime 7)
;t

(is-prime 8)
;nil

(is-prime 9)
;nil


;; Part 3 - Not Done
