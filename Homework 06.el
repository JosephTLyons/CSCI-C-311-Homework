;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 6
;; Expressions are followed by their evaluated forms in the next line


;; Part 1
;; Recursion
;; Draw the recursion tree for the function merge sort seen in C243 applied to the array:
;; | 17 | 8 | 3 | 11 | 18 | 2 | 5 | 1 |
;; m() = merge_sort()
;;                         m(| 17 | 8 | 3 | 11 | 18 | 2 | 5 | 1 |)
;;                                             |
;;                       _____________________________________________
;;                      |                                             |
;;           m(| 17 | 8 | 3 | 11 |)                        m(| 18 | 2 | 5 | 1 |)
;;                      |                                             |
;;            _____________________                         _____________________
;;           |                     |                       |                     |
;;    m(| 17 | 8 |)          m(| 3 | 11 |)          m(| 18 | 2 |)          m(| 5 | 1 |)
;;           |                     |                       |                     |
;;      ___________           ___________             ___________           ___________
;;     |           |         |           |           |           |         |           |
;; m(| 17 |)   m(| 8 |)  m(| 3 |)    m(| 11 |)   m(| 18 |)   m(| 2 |)  m(| 5 |)    m(| 1 |)


;; Part 2a
;; Symbols in Lisp
(defun next-day (day)
  "Receives a symbol for a day, prints the next one in the week out"
  (let ((next))
    (if (equal "sunday" (symbol-name day))
        (setq next 'monday)
      (if (equal "monday" (symbol-name day))
          (setq next 'tuesday)
        (if (equal "tuesday" (symbol-name day))
            (setq next 'wednesday)
          (if (equal "wednesday" (symbol-name day))
              (setq next 'thursday)
            (if (equal "thursday" (symbol-name day))
                (setq next 'friday)
              (if (equal "friday" (symbol-name day))
                  (setq next 'saturday)
                (if (equal "saturday" (symbol-name day))
                    (setq next 'sunday))))))))
    next))

(next-day 'sunday)
;monday

(next-day 'monday)
;tuesday

(next-day 'tuesday)
;wednesday

(next-day 'wednesday)
;thursday

(next-day 'thursday)
;friday

(next-day 'friday)
;saturday

(next-day 'saturday)
;sunday


;; Part 2b
;; Symbols in Lisp
(setq days '(sunday monday tuesday wednesday thursday friday saturday))

(defun random-day ()
  "Prints a random day of the week and the next one after it"
  (let ((rand-num (% (abs (random)) 7)))
    (princ "Today is ")
    (princ (capitalize (symbol-name (elt days rand-num))))
    (princ " and tomorrow will be ")
    (princ (capitalize (symbol-name (next-day (elt days rand-num))))))
  (princ "\n"))

;; Newlines at the end cause the function to both print a newline and return one
;; So there is an extra set of "" at the end of the evaluated forms that I can't help

(random-day)
;Today is Saturday and tomorrow will be Sunday
;"
;"

(random-day)
;Today is Friday and tomorrow will be Saturday
;"
;"

(random-day)
;Today is Tuesday and tomorrow will be Wednesday
;"
;"

(random-day)
;Today is Thursday and tomorrow will be Friday
;"
;"

(random-day)
;Today is Monday and tomorrow will be Tuesday
;"
;"


;; Part 3 (Optional, Extra Credit)
;; Prints calendar
(defun calendar (start-day day-limit)
  "Prints a calendar out"
  (dolist (x days) ; Print days of the Week
    (princ (capitalize (substring (symbol-name x) 0 1)))
    (princ "  "))
  (princ "\n")
  (setq start-day (% start-day 7)) ; Keep spacing before days start from going off calendar
  (dotimes (x start-day) ; Print the space before the days start
    (princ "   "))
  (let ((day-count 1))
    (while (<= (+ day-count start-day) 7) ; Print first line of days
      (princ day-count)
      (princ "  ")
      (setq day-count (+ day-count 1)))
    (let ((counter 0))
      (while (<= day-count day-limit) ; Print rest of the days after first line
        (if (equal (% counter 7) 0)
            (princ "\n"))
        (princ day-count)
        (if (<= day-count 9)
            (princ "  ")
          (princ " "))
        (setq day-count (+ day-count 1))
        (setq counter (+ counter 1)))))
  (princ "\n"))

;; Newlines at the end cause the function to both print a newline and return one
;; So there is an extra set of "" at the end of the evaluated forms that I can't help

(calendar 4 28)      ; February 2018
;S  M  T  W  T  F  S
;            1  2  3
;4  5  6  7  8  9  10
;11 12 13 14 15 16 17
;18 19 20 21 22 23 24
;25 26 27 28
;"
;"

(calendar 0 30)      ; Testing all cases 0 - 6 with different day amounts
;S  M  T  W  T  F  S
;1  2  3  4  5  6  7
;8  9  10 11 12 13 14
;15 16 17 18 19 20 21
;22 23 24 25 26 27 28
;29 30
;"
;"

(calendar 1 31)
;S  M  T  W  T  F  S
;   1  2  3  4  5  6
;7  8  9  10 11 12 13
;14 15 16 17 18 19 20
;21 22 23 24 25 26 27
;28 29 30 31
;"
;"

(calendar 2 30)
;S  M  T  W  T  F  S
;      1  2  3  4  5
;6  7  8  9  10 11 12
;13 14 15 16 17 18 19
;20 21 22 23 24 25 26
;27 28 29 30
;"
;"

(calendar 3 31)
;S  M  T  W  T  F  S
;         1  2  3  4
;5  6  7  8  9  10 11
;12 13 14 15 16 17 18
;19 20 21 22 23 24 25
;26 27 28 29 30 31
;"
;"

(calendar 4 30)
;S  M  T  W  T  F  S
;            1  2  3
;4  5  6  7  8  9  10
;11 12 13 14 15 16 17
;18 19 20 21 22 23 24
;25 26 27 28 29 30
;"
;"

(calendar 5 31)
;S  M  T  W  T  F  S
;               1  2
;3  4  5  6  7  8  9
;10 11 12 13 14 15 16
;17 18 19 20 21 22 23
;24 25 26 27 28 29 30
;31
;"
;"

(calendar 6 30)
;S  M  T  W  T  F  S
;                  1
;2  3  4  5  6  7  8
;9  10 11 12 13 14 15
;16 17 18 19 20 21 22
;23 24 25 26 27 28 29
;30
;"
;"

(calendar 7 31)      ; Testing a case where first number "overflows", but it still works
;S  M  T  W  T  F  S
;1  2  3  4  5  6  7
;8  9  10 11 12 13 14
;15 16 17 18 19 20 21
;22 23 24 25 26 27 28
;29 30 31
;"
;"
