;; integer-power can compute both positive and negative exponent problems.
;; However, the algorithm doesn't work properly for exponents that are floats.

(defun integer-power (base exponent)
  "Computes (base)^(exponent)."
  (let ((result 1))
    (cond
     ((= exponent 0) 1)
     ((> exponent 0)
      (while (> exponent 0)
        (setq exponent (- exponent 1))
        (setq result (* result base))))
     ((< exponent 0)
      (while (< exponent 0)
        (setq exponent (+ exponent 1))
        (setq result (* result (/ 1 (* base 1.0)))))))
    result))

(integer-power 3 3)
;27

(integer-power 3 -3)
;0.037037037037037035
