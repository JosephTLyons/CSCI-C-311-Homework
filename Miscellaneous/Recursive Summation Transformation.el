;; I wrote the summation method recursivley in a non-tail-recursive way so that I could apply
;; techniques I learned to first, make the non-tail-recursive function tail-recursive,
;; then, transform that version to an iterative version.  This function would've been fairly
;; easy to make iterative to begin with, but practicing the whole process is good for when the
;; problems are not so easy to transform.

(defun summation (k n)
    (cond
     ((> k n) 0)
     ((= k n) n)
     (t (+ k (summation (+ k 1) n)))))

(summation 10 11)
;21

(summation 0 10)
;55

(summation 10 0)
;0

(defun summation2 (k n result)
     (cond
      ((> k n) result)
      ((= k n) (+ k result))
      (t (summation2 (+ k 1) n (+ k result)))))

(summation2 10 11 0)
;21

(summation2 0 10 0)
;55

(summation2 10 0 0)
;0

(defun summation3 (k n)
  (let ((result 0))
    (while (<= k n)
      (setq result (+ k result))
      (setq k (+ k 1)))
    (if (> k n)
        result
      (if (= k n)
          (+ k result)))))

(summation3 10 11)
;21

(summation3 0 10)
;55

(summation3 10 0)
;0
