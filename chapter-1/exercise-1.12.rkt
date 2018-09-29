#lang sicp

(define (pascal i j) 
  (cond 
    ((or (> j i) (< i 0) (< j 0)) 0)
    ((= j i) 1)
    (else (+ (pascal (- i 1) j) (pascal (- i 1) (- j 1))))))

(pascal 3 2)