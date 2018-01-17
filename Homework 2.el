;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 2
;; Expressions are followed by their evaluated forms in the next line

;; PART 1
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

;; PART 2
(defun prod-list (L)
    "Returns the product of the elements in the list."
    (if (not L) 
        0                                      ; if list is empty, return 0
        (if (not (cdr L))                      ; When at last number
            (car L)                            ; Simply return it
            (* (car L) (prod-list (cdr L)))))) ; Recursive call
			    
(prod-list '())
;0

(prod-list '(1 2 3 4 5))
;120

(prod-list '(33 2 9))
;594

(prod-list '(2 2 2 2 3 3 3 3))
;1296


(defun is-in-list (L x)
    "Returns 't' if 'x' element is in 'L' list, 'nil' if it is not."
    (if (not L)
        nil
        (if (equal (car L) x)
            t
            (is-in-list (cdr L) x))))

(is-in-list '() 1)
;nil

(is-in-list '(4 3 2 1) 3)
;t

(is-in-list '(2 6 135 62 23 100) 10)
;nil

(is-in-list '(5 1 26 53 75 92) 53)
;t


(defun median (x y z)
    "Returns the median of 3 numbers."
    (car (cdr (sort (list x y z) '<))))

(median 51 90 100)
;90

(median 3 1 2)
;2

(median 4 0 1)
;1

(median 55 22 11)
;22