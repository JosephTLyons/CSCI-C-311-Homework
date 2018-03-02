;; I wrote the Power method recursivley in a non-tail-recursive way so that I could apply
;; techniques I learned to first, make the non-tail-recursive function tail-recursive,
;; then, transform that version to an iterative version.  This function would've been fairly
;; easy to make iterative to begin with, but practicing the whole process is good for when the
;; problems are not so easy to transform.

;; Non-Tail-Recursive Power Method
(defun power (base exponent)
  "Computes (base)^(exponent)"
  (cond
   ((= exponent 0) 1)
   (t (* base (power base (- exponent 1))))))

(power 2 3)
;8

(power 3 4)
;81

(power 2 9)
;512

(power 2 10)
;1024

;; Tail-Recursive Method (Transformation)
(defun power2 (base exponent result)
  "Computes (base)^(exponent)"
  (cond
   ((= exponent 0) result)
   (t (power base (- exponent 1) (* result base)))))

(power2 2 3 1)
;8

(power2 3 4 1)
;81

(power2 2 9 1)
;512

(power2 2 10 1)
;1024

;; Iteration transformation
(defun power3 (base exponent)
  "Computes (base)^(exponent)"
  (let ((result 1))
  (while (not (= exponent 0))
    (setq exponent (- exponent 1))
    (setq result (* result base)))
  result))

(power3 2 3)
;8

(power3 3 4)
;81

(power3 2 9)
;512

(power3 2 10)
;1024
