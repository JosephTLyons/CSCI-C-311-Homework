;; Quadratic only works with real numbers, I haven't found a good way
;; to implement solutions with imaginary numbers yet.

(defun sqrtI (x)
  "A modified sqrt function to deal with imaginary numbers."
  (let ((result '()))
    (if (> x 0)
        (setq result (sqrt x))
      (push "imaginary" result)
      (push (sqrt (* x -1)) result))
    result))

(sqrtI -4)
;(2.0 "imaginary")

(defun quadratic (a b c)
  "Calculates the zeroes of a quadratic function by inputing the coefficients."
  (let ((results '()))
    (push (/ (+ (* b -1) (sqrt (- (expt b 2) (* 4 a c)))) (* 2 a)) results)
    (push (/ (- (* b -1) (sqrt (- (expt b 2) (* 4 a c)))) (* 2 a)) results)
    results))

(quadratic 1 0 -9)
;(-3.0 3.0)

;; Making up a scenario to test:
;(x + 3.2) * (2x - 1.9) = (2x^2 + 4.5x - 6.08)

(quadratic 2 4.5 -6.08)
;(-3.2 0.9500000000000002)