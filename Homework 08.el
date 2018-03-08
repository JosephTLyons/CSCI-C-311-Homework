;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 8
;; Expressions are followed by their evaluated forms in the next line


;; PART 1 ???? (OUTPUTS OF THE SECOND VERSION ARE DIFFERENT THE SECOND TIME THROUGH.)
;; Dynamic Programming
(defvar counter 0)

(defun comb (n m)
  (setq counter (+ counter 1))
  (cond
   ((= n m) 1)
   ((= m 0) 1)
   ((= m 1) n)
   (t (+ (comb (- n 1) m)
         (comb (- n 1) (- m 1))))))

(setq counter 0)
;0

(comb 5 3)
;10

(print counter)
;11

(setq counter 0)
;0

(comb 6 4)
;15

(print counter)
;19

(defun el10 (n m)
  (+ (* n 10) m))

(setq C (make-vector 100 nil))

(defun comb1 (n m)
  (setq counter (+ counter 1))
  (let ((res 0))
    (if (setq res (elt C (el10 n m))) res
      (setq res
            (cond
             ((= n m) 1)
             ((= m 0) 0)
             ((= m 1) n)
             (t (+ (comb1 (- n 1) m)
                   (comb1 (- n 1)
                          (- m 1))))))
      (aset C (el10 n m) res))))

(setq counter 0)
;0

(comb1 5 3)
;10

(print counter)
;9

(setq counter 0)
;0

(comb1 6 4)
;15

(print counter)
;13

;; It is clear that dynamic programming reduces the amount of recursive calls needed.
;; With 5C3 orinally, we had 11 recursive calls.  After dynamic programming, we only had 9.
;; With 6C4, we had 19, but after dynamic programming, we went down to 13.

;; PART 2
;; Dynamic Programming

;; PART 3
;; Deep Recursion

;; PART 4
;; General Transformation
