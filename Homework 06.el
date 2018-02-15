;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 6
;; Expressions are followed by their evaluated forms in the next line


;; Part 1
;; Recursion
;; Draw the recursion tree for the function merge sort seen in C243 applied to the array
;; | 17 | 8 | 3 | 11 | 18 | 2 | 5 | 1 |

;; m() = merge()
;;                            m(| 17 | 8 | 3 | 11 | 18 | 2 | 5 | 1 |)
;;                                                |
;;                         _______________________________________________
;;                        |                                               |
;;             m(| 17 | 8 | 3 | 11 |)                          m(| 18 | 2 | 5 | 1 |)
;;                        |                                               |
;;              _____________________                           _____________________
;;             |                     |                         |                     |
;;      m(| 17 | 8 |)          m(| 3 | 11 |)            m(| 18 | 2 |)          m(| 5 | 1 |)
;;             |                     |                         |                     |
;;        ___________           ___________               ___________           ___________
;;       |           |         |           |             |           |         |           |
;;   m(| 17 |)   m(| 8 |)   m(| 3 |)   m(| 11 |)     m(| 18 |)   m(| 2 |)  m(| 6 |)    m(| 1 |)


;; Part 2a
;; Symbols in Lisp
(defun next-day (day)
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

;; Part 3 (Optional, Extra Credit)
;;
