;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 10
;; Expressions are followed by their evaluated forms on the next line


;; PART 1
;; Writing a Grammar
;; This may be a little complex, but I wanted to try to write it to be a DFA
;; The rule containing the '!' symbol refers to all characters excluding the '*' symbol

;; A => /B
;; B => *C
;; C => !D
;; C => *E
;; D => !C
;; D => *E
;; D => /F
;; E => !C
;; E => *D
;; E => /F
;; E => /F
;; F => end

;; Testing the grammar:
;; A => /B => /*C => /**E => /**aC => /**abD => /**ab*E => /**ab*cC => /**ab*c*E => /**ab*c**D
;; => /**ab*c**/F => /**ab*c**/

;; The image of the finite state machine is figure 10.1

;; Table:
;; |   | / | * | ! | end |
;; | A | B |err|err| err |
;; | B |err| C |err| err |
;; | C |err| E | D | err |
;; | D | F | E | C | err |
;; | E | F | D | C | err |
;; | F |err|err|err| end |


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
;; This grammar is a DFA.  No one terminal node has branches with multiple repeates of the same non-
;; terminal.

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
