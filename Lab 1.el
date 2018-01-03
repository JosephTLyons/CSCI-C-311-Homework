;; Joseph Lyons
;; C311
;; Lab 1
;; Expressions are followed by their evaluated forms in the next line

(+ 2 3)
5

(* 2 (+ 3 5))
16

'(monday tuesday wednesday thursday friday saturday sunday)
(monday tuesday wednesday thursday friday saturday sunday)

(+ 1.0 2.0 3.0 4.0)
10.0

(- 1 2 3 4)
-8

(/ 15 2)
7

(/ 15.0 2)
7.5

(% 10 3)
1

(1+ 3)
4

(1- 6)
5

(message "hi")
"hi"

(message "hi" "lo")
"hi"

(message (concat "hi" "lo"))
"hilo"

(message "A day has %d hours." 24)
"A day has 24 hours."

(* 35 (- (/ 12 2.7) 4))
15.555555555555532

(> 1 2)
nil

(<= 1 2)
t

(= 1 2)
nil

(/= 1 2)
t

(= 1 1)
t

(not (equal 1 2))
t

(and (< 2 5) (<= 5 9))
t

(max 1 12 -50)
12

(expt 2 3)
8

(abs -15)
15

(sqrt 9)
3.0

(car '(monday tuesday wednesday thursday friday saturday sunday))
monday

(cdr '(monday tuesday wednesday thursday friday saturday sunday))
(tuesday wednesday thursday friday saturday sunday)

(car (cdr '(monday tuesday wednesday thursday friday saturday sunday)))
tuesday

