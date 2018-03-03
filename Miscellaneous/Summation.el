(defun summation (k n)
    (cond
     ((> k n) 0)
     ((<= k n) n)
     (t (+ k (summation (+ k 1) n)))))

(summation 10 11)
;21

(summation 0 10)
;55

(summation 10 0)
;0