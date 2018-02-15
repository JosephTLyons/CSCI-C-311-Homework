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

;; Part 2b
;; Symbols in Lisp

;; Part 3 (Optional, Extra Credit)
;;
