#lang sicp

; NOTE: the accuracy of the calculations is not satisfying. there might be a bug in here

(define (inc x) (+ x 1))

(define (cont-frac n d k)
  (define (cont-frac-iter i)
    (let ((ni (n i))
          (di (d i)))
      (if (> i k)
        0
        (/ ni (+ di (cont-frac-iter (inc i)))))))
  (cont-frac-iter 1))

(define (tan-cf x k)
  (cont-frac
   (lambda (i) (if (= i 1) x (- (* x x)))) (lambda (i) (- (* 2 i) 1)) k))

(define pi 3.1415926)

(tan-cf (/ pi 4) 3000)