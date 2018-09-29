#lang sicp

(define (expt x y)

  (define (expt-iter b n a)
    (cond ((= n 0) a)
      ((even? n) (expt-iter (* b b) (/ n 2) a))
      (else (expt-iter b (- n 1) (* a b)))))
  
  (expt-iter x y 1))

  (expt 3 5)
