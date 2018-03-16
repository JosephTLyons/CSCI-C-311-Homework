;; Quadratic only works with real numbers, I haven't found a good way
;; to implement solutions with imaginary numbers yet.

(defun sqrt2 (x)
  "A modified sqrt function to deal with imaginary numbers."
  (let ((result '()))
    (if (> x 0)
        (setq result (sqrt x))
      (push "imaginary" result)
      (push (sqrt (* x -1)) result))
    result))

(defun quadratic (a b c)
  "Calculates the zeroes of a quadratic function by inputing the coefficients."
  (let ((results '()))
    (push (/ (+ (* b -1) (sqrt (- (expt b 2) (* 4 a c)))) (* 2 a)) results)
    (push (/ (- (* b -1) (sqrt (- (expt b 2) (* 4 a c)))) (* 2 a)) results)
    results))

(quadratic 1 0 -9)