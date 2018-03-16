;; Practice using &rest: unlimited amounts of arguments

(defun average (&rest L)
  (let ((result 0) (counter 0))
    (dolist (x L result)
      (setq result (+ result x))
      (setq counter (+ counter 1)))
    (setq result (/ result (float counter)))))

(average 2 3 3 4 5 4 3 23 33 21 23 4 32)
;12.307692307692308

(average 2 2 2 3)
;2.25
