#lang sicp

(define (f-recursive n)
  (cond ((< n 3) n)
    (else (+ (f-recursive (- n 1)) 
      (* 2 (f-recursive (- n 2)))
      (* 3 (f-recursive (- n 3)))))))

(define (f-iter n) 
  (define (fi a b c counter)
    (if (= counter 0) a 
      (fi b c (+ c (* 2 b) (* 3 a)) (- counter 1))))

  (fi 0 1 2 n))

(f-iter 5)
