#lang sicp

(define (square x) (* x x))

(define (cube x) (* x (* x x)))

(define (improve guess x) 
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (abs x) 
(if (< x 0) (- x) x))

(define (cube-root-iter guess x)
  (if (good-enough? guess (improve guess x)) guess
    (cube-root-iter (improve guess x) x)))

(define (good-enough? old-guess new-guess)
  (< (abs (- old-guess new-guess)) 0.001))

(define (cube-root x) (cube-root-iter 1.0 x))

(cube-root 9)