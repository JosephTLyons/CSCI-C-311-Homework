;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 10
;; Expressions are followed by their evaluated forms on the next line


;; PART 1
;; Writing a Grammar
;; This may be a little complex (maybe more so than it needs to be), but I wanted to try to write it
;; to be a DFA.
;; The rule containing the '!' symbol refers to all characters excluding the '*' and '/' symbols.

;; A => /B
;; B => *C
;; C => *D
;; C => !E
;; D => *D
;; D => !E
;; D => /F
;; E => !C
;; E => *D
;; F => end

;; Testing the grammar:
;; A => /B => /*C => /**D => /**aE => /**abC => /**ab*D => /**ab*cE => /**ab*c*D => /**ab*c**D =>
;; /**ab*c**/F => /**ab*c**/

;; The image of the finite state machine is figure 10.1

;; Table:
;; |   |  /  |  *  |  !  | end |
;; | A |  B  | err | err | err |
;; | B | err |  C  | err | err |
;; | C | err |  D  |  E  | err |
;; | D |  F  |  D  |  E  | err |
;; | E | err |  D  |  C  | err |
;; | F | err | err | err | end |


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
;; A => aBaa
;; A => bBba
;; B => b
;; B => epsilon

;; A => aBaa => abaa
;; A => bBba => bbba

;; This seems to be an LL(k) grammar, with k being 1.  We must look ahead up to at most 1 character,
;; in the input string, to find the next non-terminal symbol, such as for the first and second rule
;; with non-terminal 'B'.

;; PART 3B
;; ClassAttr => Name();
;; ClassAttr => Name;
;; Name => idQual
;; Qual => .idQual
;; Qual => epsilon

;; Some strings that it can produce
;; ClassAttr => Name(); => idQual(); => id.idQual() => id.id();
;; ClassAttr => Name(); => idQual(); => id();
;; ClassAttr => Name; => idQual; => id.idQual => id.id.idQual => id.id.id;
;; ClassAttr => Name; => idQual; => id;

;; This does not seems to be a non-LL(k) grammar.  If we check out the string id.id,id, which I
;; assume id represents object  and fucntion names, then we know that we must parse through that
;; name itself before knowing what rule to apply.  Because a variables name can be arbitrarily
;; large, we can't define this grammar with a particular constant k.  Therefore, it is non-LL(k).
