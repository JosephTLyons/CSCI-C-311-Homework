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
(defun element-i (list i)
  (if (> i (length list))
      nil
    (let ((temp list))
      (setq i (+ i 1))
      (dotimes (x i number)
        (setq number (car temp))
        (setq temp (cdr temp))))))

(element-i '(1 3 3 4 2 33) 0)
;1

(element-i '(1 3 3 4 2 33) 5)
;33

(element-i '() 0) ; List is empty, so it returns nil
;nil

(element-i '(1 2 3) 3)
;nil
