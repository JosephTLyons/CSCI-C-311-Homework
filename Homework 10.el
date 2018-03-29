;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 10
;; Expressions are followed by their evaluated forms on the next line


;; PART 1
;; Writing a Grammar

;; PART 2
;; FSM to Grammar

;; PART 2A
;; A => yB
;; B => wC
;; C => zB
;; C => yD
;; D => end


;; PART 2B
;; This grammar produces strings in the form of [y w (z w)^n y]
;; Where n is an integer and n >= 0
;; This grammar is a DFA, as there is only one outgoing branch for each symbol.


;; PART 2C
(defun check-A (Lst)
  (cond
   ((not Lst)
    nil)
   ((equal (car Lst) 'y)
    (check-B (cdr Lst)))))

(defun check-B (Lst)
  (if (equal (car Lst) 'w)
      (check-C (cdr Lst))))

(defun check-C (Lst)
  (cond
   ((equal (car Lst) 'z)
    (check-B (cdr Lst)))
   ((equal (car Lst) 'y)
    (check-D (cdr Lst)))))

(defun check-D (Lst)
  (not Lst))

(check-A '())
;nil

(check-A '(y))
;nil

(check-A '(y w))
;nil

(check-A '(y w y))
;t

(check-A '(y w z y))
;nil

(check-A '(y w z w y))
;t

(check-A '(y w z w z w z w y))
;t

(check-A '(y w z w y)) ; Examples from the homework webpage
;t

(check-A '(y z w w))
;nil


;; PART 3
;; LL(k) Grammars

;; PART 3A

;; PART 3B
