;; Joseph Lyons
;; CSCI-C 311: Spring 2018
;; Homework 5
;; Expressions are followed by their evaluated forms on the next line


;; PART 1A
(defun first-fit (L x)
  "Returns the first number in the list greater than or equal to x, else nil."
  (if (not L) ; Return nil if list is empty
      nil
    (let ((found t) (exists nil)) ; found will end up holding the actual value
      (while (and found (not exists))
        (setq found (pop L))
        (if (not found) ; If end of list is reached, return nil
            (setq exists nil)
          (if (>= found x)
              (setq exists t))))
        (if exists
            found
          nil))))

(first-fit '(0 0 0 0 0) 1) ; Test for when no memory is available
;nil

(first-fit '(1 1 1) 3)
;nil

(first-fit '(1) 3) ; Testing all cases leading up to a value returned
;nil

(first-fit '(1 2) 3)
;nil

(first-fit '(1 2 3) 3)
;3

(first-fit '(1 2 3 4) 3) ; Testing one further to be sure
;3

(first-fit '(1 100 1000 10000) 543) ; Testing larger values
;1000

(first-fit '(500 400 300 200 100) 100) ; Testing descending list
;500

(first-fit '(-23 3 6 9 12 33) 5) ; Even though this problem represents memory allocation
;6                               ; Negative numbers work with the algorithm too

(first-fit '(-99 -66 -33 -11 -40) -40)
;-33

(first-fit '() 1) ; Works for this case too, even though it doesn't apply to memory
;nil


;; PART 1B
(defun best-fit (L x)
  "Returns the smallest number in the list thats greater than or equal to x, else nil."
  (if (not L) ; Return nil if list is empty
      nil
    (let ((exists nil) (found))
      (while (and L (> x (car L))) ; Find first number greater than x
        (pop L))
      (if L ; If the list isn't empty
          (progn
            (setq found (car L)) ; Assign that number to found
            (setq exists t)))
      (dolist (y L) ; Continue on in the rest of the list
        (if (and (<= x y) (<= y found)) ; Check if new num is between x and found
            (progn
              (setq found y) ; If so, update found
              (setq exists t))))
      (if exists
          found
        nil))))

(best-fit '(0 0 0 0 0) 1) ; Test for when no memory is available
;nil

(best-fit '(1 1 1) 3)
;nil

(best-fit '(1) 2)
;nil

(best-fit '(1 2 3) 3)
;3

(best-fit '(5 4 3 2) 3)
;3

(best-fit '(10000 100 1000 1) 543) ; Testing larger values
;1000

(best-fit '(-23 3 6 9 12 33) 5) ; Even though this problem represents memory allocation
;6                              ; Negative numbers work with the algorithm too

(best-fit '(-99 -66 -33 -11 -40) -40)
;-40

(best-fit '() 1) ; Works for this case too, even though it doesn't apply to memory
;nil


;; PART 2A
(defun make-multiples (n m)
  "Returns a list of values obtained by mulitplying n by number 1 through m."
  (let ((temp-list '()))
    (dotimes (x m)
      (setq temp-list (append temp-list (list (* (+ x 1) n)))))
    temp-list))

(make-multiples 0 3) ; Testing some simple cases
;(0 0 0)

(make-multiples 1 1)
;(1)

(make-multiples 1 6)
;(1 2 3 4 5 6)

(make-multiples 2 3) ; Testing more interesting values
;(2 4 6)

(make-multiples 3 8)
;(3 6 9 12 15 18 21 24)

(make-multiples 4 12)
;(4 8 12 16 20 24 28 32 36 40 44 48)

(make-multiples -9 7) ; Testing a case with a negative number
;(-9 -18 -27 -36 -45 -54 -63)


;; PART 2B
(defun is-multiple (L)
  "Returns true if every element after the first is a multiple of the first."
  (let ((are-multiples t) (first-value (car L)))
    (mapc (lambda (x)
            (if (not (= (% x first-value) 0))
                (setq are-multiples nil)))
          (cdr L))
    are-multiples))

(is-multiple '(1 1)) ; Testing some simple cases
;t

(is-multiple '(1 2 3 4 5 6))
;t

(is-multiple '(3 6 9)) ; Testing less trivial cases
;t

(is-multiple '(4 3 2))
;nil

(is-multiple '(3 6 9 12 15))
;t

(is-multiple '(-4 -8 -12 -16))
;t

(is-multiple '(-4 -8 -12 -15))
;nil

(is-multiple (make-multiples 2 7)) ; Test when arg make-multiple makes is-multiple true
;t

(is-multiple (make-multiples 3 4))
;t

(is-multiple '(1 2 0 4 8)) ; A list that can't be made from make-multiples that is true
;t

(is-multiple '(4 16 8 20 12)) ; A list that can't be made from make-multiples that is true
;t
