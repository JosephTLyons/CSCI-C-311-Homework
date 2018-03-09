;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 8
;; Expressions are followed by their evaluated forms in the next line


;; PART 1
;; Dynamic Programming
(defvar counter 0)

(defun comb (n m)
  "Calculates nCm."
  (setq counter (+ counter 1))
  (cond
   ((= n m) 1)
   ((= m 0) 1)
   ((= m 1) n)
   (t (+ (comb (- n 1) m)
         (comb (- n 1) (- m 1))))))

(setq counter 0)
;0

(comb 5 3)
;10

(print counter)
;11

(setq counter 0)
;0

(comb 6 4)
;15

(print counter)
;19

(defun el10 (n m)
  (+ (* n 10) m))

(setq C (make-vector 100 nil))

(defun comb1 (n m)
  "Caclulates nCm with dynamic programming optimizations."
  (setq counter (+ counter 1))
  (let ((res 0))
    (if (setq res (elt C (el10 n m))) res
      (setq res
            (cond
             ((= n m) 1)
             ((= m 0) 0)
             ((= m 1) n)
             (t (+ (comb1 (- n 1) m)
                   (comb1 (- n 1)
                          (- m 1))))))
      (aset C (el10 n m) res))))

(setq counter 0)
;0

(comb1 5 3)
;10

(print counter)
;9

(setq counter 0)
;0

(comb1 6 4)
;15

(print counter)
;13

;; It is clear that dynamic programming reduces the amount of recursive calls needed.
;; With 5C3 orinally, we had 11 recursive calls.  After dynamic programming, we only had 9.
;; With 6C4, we had 19, but after dynamic programming, we went down to 13.


;; PART 2
;; Dynamic Programming
;; First recursive version:

;; I used the counter like in the first exercise
;; to check to make sure dynamic programming was working.
(defun f (n)
  (setq counter (+ counter 1))
  (cond
   ((= n 0) 0)
   ((= n 1) 1)
   ((= n 2) 1)
   (t (+ (f (- n 1)) (f (- n 3))))))

(f 6)
;4

(f 7)
;6

(f 8)
;9

(setq counter 0)
;0

(f 9)
;13

(print counter) ; Printing the count for (f 9) to ensure optimization worked
;37

;; Second version with dynamic programming optimization:
(setq store (make-vector 20 nil))

(defun f1 (n)
  (setq counter (+ counter 1))
  (let ((temp 0) (val 0))
    (if (setq temp (elt store n))
        temp
      (cond
       ((= n 0) (setq val 0))
       ((= n 1) (setq val 1))
       ((= n 2) (setq val 1))
       (t (setq val (+ (f1 (- n 1)) (f1 (- n 3))))))
      (aset store n val))))

(f1 6)
;4

(f1 7)
;6

(f1 8)
;9

(setq counter 0)
;0

(f1 9)
;13

(print counter) ; Printing the count for (f 9) to ensure optimization worked
;15


;; PART 3
;; Deep Recursion
(defun search-driver (L val)
  "Driver for search method, call this method when searching."
  (catch 'found
  (search L val)))

(defun search (L val)
  "Deeply searchs a list of elements for a value."
  (if (not L) nil
    (dolist (elem L nil)
      (cond
       ((equal elem val) (throw 'found t))
       ((listp elem) (search elem val))))))

(search-driver '() 1) ; Tests for simple cases
;nil

(search-driver '(1) 1)
;t

(search-driver '(1 2 3) 3)
;t

(search-driver '(1 '(11 12) 3 4 5) 6) ; Tests for 2 levels deep
;nil

(search-driver '(1 '(11 12) 3 4 5) 5)
;t

(search-driver '(1 '(11 12) 3 4 5) 12)
;t

(search-driver '(1 '(11 '(20 21 21)) 3 4 5) 22) ; Tests for 3 levels deep
;nil

(search-driver '(1 '(11 '(20 21 21)) 3 4 5) 21)
;t


;; PART 4
;; General Transformation
(defun root (T) "The root of the tree."
  (if T (car T)))

(defun left-subtree (T)
  "The left subtree, also a list."
  (if (and T (cdr T))
    (car (cdr T)))) ; (cadr T)

(defun right-subtree (T)
  "The right subtree, also a list."
  (if (> (length T) 2)
    (car (cdr (cdr T))))) ; (caddr T)

(defun my-print (&rest L)
  "Prints any number of arguments with princ and returns true."
  (mapc 'princ L) t)

;; PART 4AA
(defun print-in-order (T)
  "Recursively prints the tree in-order.  Left - Root - Right"
  (if T
      (progn
        (print-in-order (left-subtree T))
        (my-print (root T) " ")
        (print-in-order (right-subtree T)))))

(setq S '(23 (51 (18) (33 (5))) (7 () (10))))

(print-in-order S)
18 51 5 33 23 7 10 nil

;; PART 4AB
(defun print-in-order1 (T)
  "Iteratively prints the tree in-order.  Left - Root - Right"
  (let ((stackT nil) (frame nil) (state nil))
    (push (cons T 'left) stackT)
    (while stackT
      (setq frame (pop stackT))
      (setq T (car frame) state (cdr frame))
      (if T
          (cond ((eq state 'left)
                 (my-print (root T) " ")
                 (push (cons T 'right) stackT)
                 (push (cons (left-subtree T) 
                             'left) stackT))
                ((eq state 'right)
                 (push (cons (right-subtree T) 
                             'left) stackT)))))))

(print-in-order1 S)
23 51 18 33 5 7 10 nil
