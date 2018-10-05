#lang sicp

(define (square-list items)
  (if (null? items)
      '()
      (cons ((lambda (x) (* x x)) (car items)) (square-list (cdr items)))))

(square-list (list 1 2 3))

(define (square-list2 items)
  (map (lambda (x) (* x x)) items))

(square-list2 (list 1 2 3))