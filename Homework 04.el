;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 4
;; Expressions are followed by their evaluated forms in the next line

;; Part 1 - Not Done

;; Part 2 - Not Done
(defun is-prime (number)
  (let ((divisor-count 0) (quotient number))
    (dotimes (divisor quotient)
      (setq divisor (+ 1 divisor))
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
t

(is-prime 5)
;t

(is-prime 6)
t

(is-prime 7)
;t

(is-prime 8)
;nil

(is-prime 9)
t


;; Part 3 - Not Done
