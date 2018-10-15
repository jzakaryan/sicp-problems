#lang racket

(define (tree-map transform tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (transform tree))
        (else (cons (tree-map transform (car tree))
                    (tree-map transform (cdr tree))))))

(tree-map (lambda (x) (* x x)) (list 1 (list 2 3) (list 4 5) 6))
