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
;; Logic: When a number greater than one that more than 2 divisors, 
;; it is not prime.

;; I explicitly test for 0 and 1, since those numbers are a bit odd
;; when compared to the tests for the rest of the prime numbers.
;; The only aspect that is a bit confusing in my algorithm is the 
;; test condition of x < limit - 1.  This is where this comes from:
;; I want to test that divisor <= limit.  Divisors initial value is 2, but
;; Dotimes can't start its counter from 2, it starts from 0, so I need to
;; adjust the inequality.  x (starting at 0) <= limit - 2.  Because dotimes
;; loops dont include the limit number, I need to change the inequality:
;; x < limit - 2 + 1, so  x < limit - 1.
(defun is-prime (number)
  (if (or (= number 0) (= number 1))
      nil
    (let ((divisor 2) (divisor-count 2) (limit (floor (sqrt number))))
      (dotimes (x (- limit 1))
        (if (equal (mod number divisor) 0)
            (setq divisor-count (+ 2 divisor-count)))
        (setq divisor (+ 1 divisor)))
      (if (equal divisor-count 2)
          t
        nil))))

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

(print-list '(1 2 3))
;1 2 3 (1 2 3)

(print-list '(10 9 8 7 6 5 4 3 2 1))
;10 9 8 7 6 5 4 3 2 1 (10 9 8 7 6 5 4 3 2 1)

(print-list '(a b c))
;a b c (a b c)

(print-list '("Dog" "Cat" "Bird"))
;Dog Cat Bird ("Dog" "Cat" "Bird")

(funcall 'print-list '(1 1 2 3 5 8))
;1 1 2 3 5 8 (1 1 2 3 5 8)

(apply 'print-list '((9 8 7)))
;9 8 7 (9 8 7)
