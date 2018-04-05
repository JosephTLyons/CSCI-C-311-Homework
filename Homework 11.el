;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 11
;; Expressions are followed by their evaluated forms on the next line


;; PART 1
;; Context-Free Grammar


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
;;     T__        TT --- TT
;;    /   \        | \    |
;;   F    FT      AO  \   e
;;  /     / \      |   \
;; id   MO   F     -    T
;;  a    *   |     ^   / \
;;  ^    ^   id       F   \
;;            b       |    FT
;;            ^    ( exp )  |
;;                 ^  |  ^  e
;;                 ___|____
;;                /        \
;;               T         TT --- TT
;;              / \        | \     |
;;             F  FT      AO  \    e
;;            /    |       |   \
;;          num    e       +    T
;;           3             ^   / \
;;           ^                F  FT
;;                            |   |
;;                            id  e
;;                             a

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

(check-input '(2 "+" a "*" "(" 4 "-" b ")"))
;t

(check-input '(2 "." a "*" "(" 4 "-" b ")"))
;nil

(check-input '(2 "+" a "*" "(" 4 "-" a ")"))
;t

(check-input '(2 "+" a "*" "&" 4 "-" b ")"))
;nil
