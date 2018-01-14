;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 2
;; Expressions are followed by their evaluated forms in the next line

;; Part 1
;; Declare 3 variables
(defvar age)
age

(defvar savings "Money in savings account")
savings

(defvar year)
year

;; Assign values to these variables
(setq age 27)
27

(setq savings -30)
-30

(setq year 2018)
2018

;; Use these variables in expressions (expt, random, abs, cos, truncate)
(expt age 2)
729

(random year)
1372

(abs savings)
30

(cos age)
-0.2921388087338362

(truncate (* 3.14 year))
6336

;; truncate is a built-in function in `C source code'.
;; (truncate ARG &optional DIVISOR)

;; Truncate a floating point number to an int.
;; Rounds ARG toward zero.
;; With optional DIVISOR, truncate ARG/DIVISOR.

;; Part 2
;; Function 1 - Not done
;; Function 2 - Not done

(defun median (x y z)
    (setq numbers (sort (list x y z) '<))
    (car (cdr numbers)))

(median 51 90 100)
90

(median 3 1 2)
2

(median 4 0 1)
1