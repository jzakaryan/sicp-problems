#lang sicp

(define (reverse l)
  (define (reverse-iter l1 l2)
    (if (null? l1)
        l2
        (reverse-iter (cdr l1) (cons (car l1) l2))))
  (reverse-iter l '()))

(define (deep-reverse l)
  (define (reverse-iter l1 l2)
    (cond ((null? l1) l2)
          ((pair? (car l1)) (reverse-iter (cdr l1) (cons (reverse-iter (car l1) '()) l2)))
          (else (reverse-iter (cdr l1) (cons (car l1) l2)))))
  (reverse-iter l '()))

(list (list 1 2) (list 3 4))
(deep-reverse (list (list 1 2) (list 3 4)))