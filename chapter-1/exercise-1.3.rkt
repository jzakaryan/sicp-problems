#lang sicp

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (min x y) (if (< x y) x y))

(define (min-of-3 x y z) (min x (min y z)))

(define (sum-of-squares-of-larger-2 x y z)
  (cond ((= (min-of-3 x y z) x) (sum-of-squares y z))
        ((= (min-of-3 x y z) y) (sum-of-squares x z))
        (else (sum-of-squares x y))))

(sum-of-squares-of-larger-2 1 2 3)