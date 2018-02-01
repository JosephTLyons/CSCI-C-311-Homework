;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 4
;; Expressions are followed by their evaluated forms in the next line

;; Part 1
(defun GCD (n m)
  (let ((remainder 1) (dividend n) (divisor m))
    (while (not (= remainder 0))
      (setq remainder (mod dividend divisor))
      (setq dividend divisor)
      (setq divisor remainder))
    dividend))

(GCD 1 1)
;1

(GCD 14 20)
;2

(GCD 1024 40)
;8

(GCD 40 1024) ; Testing numbers both ways
;8

(GCD 15 100)
;5

(GCD 200 90)
;10

(GCD 100000 70050) ; Testing some big numbers
;50

(funcall 'GCD 9 3)
;3

(apply 'GCD '(10 5))
;5


;; Part 2
;; Logic: When a number has more than 2 divisors, it is not prime.
;; We execute the body of the loop while divisor (starting at 1) < quotient,
;; which is equivalent to x (starting at 0) < (quotient - 1), since we cant set
;; x to 1 in dotimes loops.
;; Each loop, test to see if the divisor evenly divides the number,  
;; Increment the divisor number, and recalculate the quotient
;; to cut down the amount of loop executions needed.  It is inefficient to 
;; see if all divisors from 1 to number evenly divide the number.
;; In the body, if a divisor evenly divides a number, we increment by 2
;; Since the number is divisible by both the divisor and quotient
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

(funcall 'is-prime 9)
;nil

(apply 'is-prime '(5))
;t


;; Part 3 - Not Done
(defun print-list (L)
  (mapc (lambda (x) (princ x) (princ " ")) L))
