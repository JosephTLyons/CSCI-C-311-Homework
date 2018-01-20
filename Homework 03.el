;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 3
;; Expressions are followed by their evaluated forms in the next line

(defun is-const (list)
  (if (not list) 
      t
    (if (not (cdr list))
        t
      (let ((m t))
        (dolist (x list m)
          (if (not (equal (car list) x)) ; Compare every element with first 
              (setq m nil)))))))

(is-const '())
;t

(is-const '(1))
;t

(is-const '(1 2))
;nil

(is-const '(5 2 7 3 8 4))
;nil

(is-const '('(1 2 3) '(1 2 3) '(1 2 3)))
;t

(is-const '("dog" "dog" "dog"))
;t

(is-const '("dog" "dog" "dog" "cat"))
;nil


;; Not Done
(defun element-i (list position)
  (if (> position (length list))
      nil
    (let ((temp list))
      (dotimes (x position number)
        (setq number (car temp))
        (setq temp (cdr temp))))))
