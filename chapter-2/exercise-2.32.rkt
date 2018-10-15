#lang racket

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(subsets (list 1 2 3))

; This works because the power set of 's' is defined as:
; 1. If the set is empty, then its power set it the empty set (base case).
; 2. If the set is not empty, then the power set is the union of
;     a) The power set of 's' minus its first element
;     b) The power set of 's' minus its first element, appended with the first element of 's'