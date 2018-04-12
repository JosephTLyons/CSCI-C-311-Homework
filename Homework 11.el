;; Joseph Lyons
;; CSCI-C 311: Spring 2018
;; Homework 11
;; Expressions are followed by their evaluated forms on the next line


;; PART 1
;; Context-Free Grammar

;; Key:
;; I = if
;; EI = else if
;; E = else
;; O = Opening Brace
;; C = Closing Brace
;; SLC = Single Line of Code
;; MLC = Multipe Lines of Code
;; e = epsilon

;; Grammar:
;; Start => if (Expr) A
;; A => O MLC C END
;; A => O MLC C EI
;; A => O MLC C E END
;; A => SLC END
;; A => SLC EI
;; A => O SLC E END
;; O => {
;; C => }
;; EI => else if (Expr) A
;; E => else A
;; END => e

;; Examples 1:
;; if (Expr)
;; {
;;     // Single Line of Code
;;     // Single Line of Code
;; }

;; Start => if (Expr) A => if (Expr) O MLC C END => if (Expr) { MLC C END =>
;;                    ^              ^                              ^
;; if (Expr) { MLC } END => if (Expr) { MLC }
;;                   ^

;; Example 2:
;; if (Expr)
;;     // Single Line of Code
;; else if (Expr)
;; {
;;     // Single Line of Code
;;     // Single Line of Code
;; }
;; else
;;     // Single Line of Code

;; Start => if (Expr) A => if (Expr) SLC EI => if (Expr) SLC else if (Expr) A =>
;;                    ^                  ^                                  ^
;; if (Expr) SLC else if (Expr) O MLC C E END => if (Expr) SLC else if (Expr) { MLC C E END =>
;;                              ^                                                   ^
;; if (Expr) SLC else if (Expr) { MLC } E END => if (Expr) SLC else if (Expr) { MLC } else A END =>
;;                                      ^                                                  ^
;; if (Expr) SLC else if (Expr) { MLC } else SLC END END =>
;;                                               ^
;; if (Expr) SLC else if (Expr) { MLC } else SLC END
;;                                               ^
;; if (Expr) SLC else if (Expr) { MLC } else SLC

;; This is an LL(4) grammar.  The furthest the parser must look ahead is 4 tokens, in the first
;; three rules governing A.  For example, if we are checking a conditional block of code to check
;; whether it is valid or not and come to rule A, we must check multiple different cases.  In the
;; most extreme, we have:
;; A => O MLC C END
;; A => O MLC C EI
;; A => O MLC C E END
;; We must check up to 4 tokens ahead to differentiate between which one to use.  Therefore, this is
;; an ll(4) grammar.


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
