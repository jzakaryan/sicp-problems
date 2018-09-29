#lang sicp

(define (average x y) (/ (+ x y) 2))

(define (square x) (* x x))

(define (abs x) 
(if (< x 0) (- x) x))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x)) guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x) (average guess (/ x guess)))

(define (good-enough? old-guess new-guess)
  (< (abs (- old-guess new-guess)) 0.001))

(define (sqrt x) (sqrt-iter 1.0 x))

(sqrt 4)

(sqrt 12000000000000)