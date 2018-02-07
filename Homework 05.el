;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 5
;; Expressions are followed by their evaluated forms in the next line


;; Part 1a

;; Part 1b

;; Part 2a
(defun make-multiples (n m)
  "Returns a list of values obtained by mulitplying n by number 1 through m"
  (let ((temp-list '()))
    (dotimes (x m)
      (setq temp-list (append temp-list (list (* (+ x 1) n)))))
    temp-list))

(make-multiples 1 1) ; Testing some simple cases
;(1)

(make-multiples 1 6)
;(1 2 3 4 5 6)

(make-multiples 2 3) ; Testing more interesting values
;(2 4 6)

(make-multiples 3 8)
;(3 6 9 12 15 18 21 24)

(make-multiples 4 12)
;(4 8 12 16 20 24 28 32 36 40 44 48)

(make-multiples -9 7) ; Testing a case with a negative number
;(-9 -18 -27 -36 -45 -54 -63)


;; Part 2b
