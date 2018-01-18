;; Joseph Lyons
;; C311 - Spring 2018
;; Homework 3
;; Expressions are followed by their evaluated forms in the next line

(defun is-const (L)
  (if (not L) 
      t
    (if (not (cdr L))
        t
      (let ((m nil))
        (dolist (x L m)
          (if (equal 1 1)
              (setq m t)))))))

(is-const '())
(is-const '(1))
(is-const '(1 2))

