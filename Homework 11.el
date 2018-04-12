;; Joseph Lyons
;; CSCI-C 311: Spring 2018
;; Homework 11
;; Expressions are followed by their evaluated forms on the next line


;; PART 1
;; Context-Free Grammar

;; Note: an "instruction" here is considered a non-terminal that is defined elsewhere.
;; It is a full, syntatically correct line of code

;; Grammar:
;; Start => if (Expr) A
;; A => I1
;; A => { I2
;; I1 = Instruction END
;; I1 = Instruction E END
;; I2 = Instruction I2
;; I2 = Instruction } END
;; I2 = Instruction } E END
;; E => else A
;; END => e

;; Example 1:
;; if (Expr)
;; {
;;     // Instruction
;;     // Instruction
;; }

;; Start => if (Expr) A => if (Expr) { I2 => if (Expr) { Instruction Instruction } END =>
;;                    ^                ^                             ^             ^
;; if (Expr) { Instruction Instruction }

;; Example 2:
;; if (Expr)
;;     // Instruction
;; else
;; {
;;     // Instruction
;;     // Instruction
;; }

;; Start => if (Expr) A => if (Expr) I1 => if (Expr) Instruction E END =>
;;                    ^              ^                           ^
;; if (Expr) Instruction else A END => if (Expr) Instruction else { I2 END =>
;;                            ^                                     ^
;; if (Expr) Instruction else { I2 END => if (Expr) Instruction else { Instruction I2 END =>
;;                              ^                                                  ^
;; if (Expr) Instruction else { Instruction Instruction } END END
;;                                                        ^
;; if (Expr) Instruction else { Instruction Instruction } END
;;                                                        ^
;; if (Expr) Instruction else { Instruction Instruction }

;; As long as the Instruction non-terminal is defined to be ll(2) or less, then this grammar is also
;; an LL(2) grammar.  Each rule only requires looking ahead up to 2 terminals/non-terminals in order
;; to figure out which rule to apply.  For example, in the following rules:
;; I1 = Instruction E END
;; I2 = Instruction I2
;; We must look past Instruction (1) and at the next non-terminal (2) to know which rule to apply.
;; If the rule for indentifying that an Instruction is syntatically correct is greater than ll(2) or
;; is non-ll(k), then my grammar will be the same ll(k) (or non-ll(k)) as Insruction.


;; PART 2A
;; Parsing Tree

;; Draw the parsing trees for the expression
;; a * b - (3 + a)
;; expr => term term_tail
;; term_tail => add_op term term_tail | e
;; term => factor factor_tail
;; factor_tail => mult_op factor factor_tail | e
;; factor => ( expr ) | id | number
;; add_op => + | -
;; mult_op => * | /

;; The "^" symbol is used to highlight the item from the input operation string.
;; The "e" symbol is used to represent epsilon.

;;       ___exp___
;;      /         \
;;     T__         TT --- TT
;;    /   \         | \    |
;;   F    FT-FT    AO  \   e
;;  /     / \  \    |   \
;; id   MO   F  e   -    T
;;  a    *   |      ^   / \
;;  ^    ^   id        F   \
;;            b        |    FT
;;            ^     ( exp )  |
;;                  ^  |  ^  e
;;                  ___|____
;;                 /        \
;;                T         TT --- TT
;;               / \        | \     |
;;              F  FT      AO  \    e
;;             /    |       |   \
;;           num    e       +    T
;;            3             ^   / \
;;            ^                F  FT
;;                             |   |
;;                             id  e
;;                              a
;;                              ^

;; PART 2B
;; LL Parsing

;; The "^" symbol is used to highlight the current path that we are taking.
;; a * b - (3 + a)
;; E -> T TT -> F FT TT -> (F a) FT TT -> (F a) MO F FT TT -> (F a) (MO *) F FT TT ->
;;      ^       ^                ^              ^                          ^
;; (F a) (MO *) (F b) FT TT -> (F a) (MO *) (F b) TT -> (F a) (MO *) (F b) AO T TT ->
;;                    ^                           ^                        ^
;; (F a) (MO *) (F b) (AO -) T TT -> (F a) (MO *) (F b) (AO -) F FT TT ->
;;                           ^                                 ^
;; (F a) (MO *) (F b) (AO -) (Exp) FT TT -> (F a) (MO *) (F b) (AO -) (T TT) FT TT ->
;;                             ^                                       ^
;; (F a) (MO *) (F b) (AO -) (F FT TT) FT TT -> (F a) (MO *) (F b) (AO -) ((F 3) FT TT) FT TT
;;                            ^                                                  ^
;; (F a) (MO *) (F b) (AO -) ((F 3) TT) FT TT -> (F a) (MO *) (F b) (AO -) ((F 3) AO T TT) FT TT ->
;;                                  ^                                             ^
;; (F a) (MO *) (F b) (AO -) ((F 3) (AO +) T TT) FT TT ->
;;                                         ^
;; (F a) (MO *) (F b) (AO -) ((F 3) (AO +) F FT TT) FT TT ->
;;                                         ^
;; (F a) (MO *) (F b) (AO -) ((F 3) (AO +) (F a) FT TT) FT TT ->
;;                                               ^
;; (F a) (MO *) (F b) (AO -) ((F 3) (AO +) (F a) TT) FT TT ->
;;                                               ^
;; (F a) (MO *) (F b) (AO -) ((F 3) (AO +) (F a)) FT TT ->
;;                                                ^
;; (F a) (MO *) (F b) (AO -) ((F 3) (AO +) (F a)) TT ->
;;                                                ^
;; (F a) (MO *) (F b) (AO -) ((F 3) (AO +) (F a))


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
  (and (check-F) (check-FT)));; go to F and FT

;; FT => MO F FT | e
(defun check-FT ()
  (cond ((or (equal (car input) "*")
             (equal (car input) "/"))
         (and (check-MO)
              (check-F)
              (check-FT)))
        (t t)))

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

(check-input '(1 "+" 2)) ; A simple example
;t

(check-input '(2 "+" a "*" "(" 4 "-" b ")")) ; Example from homework page
;t

(check-input '(2 "." a "*" "(" 4 "-" b ")")) ; Added error on purpose
;nil

(check-input '("*" 2 "+" a "*" "(" 4 "-" b ")")) ; Added another error on purpose
;nil
