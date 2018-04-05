;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 11
;; Expressions are followed by their evaluated forms on the next line


;; PART 1
;; Context-Free Grammar


;; PART 2A
;; Parsing Tree


;; PART 2B
;; LL Parsing


;; PART 3
;; Recursive Descent
;; Checking and functions for the grammar that recognizes an
;; arithmetic expression using recursive descent.

;; Consume one token from the input string and return true.
(defun move-input ()
  (pop input)
  t)

;; E => T TT
(defun check-E ()
  (and (check-T) (check-TT)))

;; TT => AO T TT | e
(defun check-TT ()
  (cond ((or (equal (car input) "+")
	     (equal (car input) "-"))
	 (and (check-AO)
	      (check-T)
	      (check-TT)))
	(t t)))

;; T => F FT
(defun check-T()
; For the student to implement

;; FT => MO F FT | e
(defun check-FT ()
; For the student to implement

;; F => ( E ) | id | number
(defun check-F ()
  (cond ((symbolp (car input)) (move-input))
	((numberp (car input)) (move-input))
	((equal (car input) "(")
	 (move-input)
	 (and (check-E)
	      (equal (car input) ")")
	      (move-input)))
	(t nil)))

;; AO => + | -
(defun check-AO ()
  (if (or (equal (car input) "+")
	  (equal (car input) "-"))
      (move-input) ; returns t
    nil))

;; MO => * | /
(defun check-MO ()
  (if (or (equal (car input) "*")
          (equal (car input) "/"))
      (move-input) ; returns t
    nil))

(defun check-input (L)
  (setq input L)
  (and (check-E)
       (not input)))

(check-input '(2 "+" a "*" "(" 4 "-" b ")" ))
; should return t
