(defun sqrt2 (x)
  "A modified sqrt function to deal with imaginary numbers."
  (if (> x 0)
      (sqrt x)
    (princ (sqrt (* x -1)))
    (princ " imaginary")))

(defun quadratic (a b c)
  "Calculates the zeroes of a quadratic function by inputing the coefficients."
  (let (results '())
    (push (/ (+ (* b -1) (sqrt2 (- (expt b 2) (* 4 a c)))) (* 2 a)) results)
    (push (/ (- (* b -1) (sqrt2 (- (expt b 2) (* 4 a c)))) (* 2 a)) results)
    results))

(quadratic 1 0 9)
6.0 imaginary

