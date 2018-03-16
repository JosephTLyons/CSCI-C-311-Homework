;; power can compute both positive and negative integer exponent problems.
;; However, the algorithm doesn't work properly for exponents that are floats.

(defun positive-exponent (base exponent)
  (let ((result 1))
    (while (> exponent 0)
      (setq exponent (- exponent 1))
      (setq result (* result base)))
    result))

(defun negative-exponent (base exponent)
  (let ((result 1))
    (while (< exponent 0)
      (setq exponent (+ exponent 1))
      (setq result (* result (/ 1 (float base)))))
    result))

(defun power (base exponent)
  "Computes (base)^(exponent)."
  (let ((result))
    (cond
     ((= exponent 0) 1)
     ((> exponent 0)
      (setq result (positive-exponent base exponent)))
     ((< exponent 0)
      (setq result (negative-exponent base exponent)))
    result)))

(power 3 3)
;27

(power 3 -3)
;0.037037037037037035
