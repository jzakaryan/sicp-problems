#lang sicp

(define (double x) (* x 2))
(define (half x) (/ x 2))

(define (mul x y)
  
  (define (mul-iter a b c)
    (cond ((= b 0) c)
      ((even? b) (mul-iter (double a) (half b) c))
      (else (mul-iter a (- b 1) (+ c a)))))
  
  (mul-iter x y 0))

(mul 24 2)

