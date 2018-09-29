#lang sicp

(define (double x) (* x 2))
(define (half x) (/ x 2))

(define (mul a b)
  (cond ((= b 1) a)
    ((even? b) (mul (double a) (half b)))
    (else (+ a (mul a (- b 1))))))

(mul 3 6)