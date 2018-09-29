#lang sicp

(define (inc x) (+ x 1))

(define (cont-frac n d k)
  (define (cont-frac-iter i)
    (let ((ni (n i))
          (di (d i)))
      (if (> i k)
        0
        (/ ni (+ di (cont-frac-iter (inc i)))))))
  (cont-frac-iter 1))

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)

; 1 / phi is 0.61803398875. we get an accuracy of 4 decimal digits when k = 11