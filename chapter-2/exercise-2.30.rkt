#lang racket

(define (square x) (* x x))

(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (t)
         (if (pair? t)
             (square-tree-map t)
             (square t)))
       tree))

(square-tree (list 1 2 (list 3 4) 5))
(square-tree-map (list 1 2 (list 3 4) 5))