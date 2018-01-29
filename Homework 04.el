;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 4
;; Expressions are followed by their evaluated forms in the next line

;; Part 1 - Not Done

;; Part 2 - Not Done
;; Logic: divisor-counter = 1 since all positive integers are divisible
;; by themselves
;; halfway-mark = (number / 2) because we dont need to waste time checking
;; values past the halfway mark, since they won't be evenly divide the
;; number were checking   
(defun is-prime (number)
  (let ((number-is-prime) (divisor-count 0) (quotient number))
    (dotimes (divisor quotient)
      (setq divisor (+ 1 divisor))
      (setq quotient (/ number divisor))
      (if (equal (mod number divisor) 0)
          (setq divisor-count (+ 2 divisor-count)))
      (setq divisor (+ 1 divisor)))
    (if (equal divisor-count 2)
        (setq number-is-prime t)
      (setq number-is-prime nil))))
