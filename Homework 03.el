;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 3
;; Expressions are followed by their evaluated forms in the next line

(defun is-const (list)
  "Returns true if every element in the list is the equivalent to one another."
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

(is-const '(4 4 4 4 4 4 4 4))
;t

(is-const '(5 2 7 3 8 4))
;nil

(is-const '('(1 2 3) '(1 2 3) '(1 2 3)))
;t

(is-const '("dog" "dog" "dog"))
;t

(is-const '("dog" "dog" "dog" "cat"))
;nil


;; Use better logic to avoid having to use (setq i (+ i 1))
(defun element-i (list i)
  "Returns the ith element in the list"
  (if (> i (length list))
      nil
    (let ((temp list))
      (setq i (+ i 1))
      (dotimes (x i number-returned)
        (setq number-returned (car temp))
        (setq temp (cdr temp))))))

(element-i '(5 4 3 2 1) 2)
;3

(element-i '(1 3 3 4 2 33) 2)
;3

(element-i '(1 3 3 4 2 33) 5)
;33

(element-i '() 0) ; List is empty, so it returns nil
;nil

(element-i '(1 2 3) 3)
;nil


;; Not Done
(defun is-sorted (L)

;; D) Not Done
(defun reverse (L)
  (if (not L)
      
  (list (reverse (cdr L))))

(reverse '(1 2 3 4 5))
