#lang sicp

(define (same-parity x . y)
  (let ((p (remainder x 2)))
    (define (same-parity-impl l)
      (cond ((null? l) '())
            ((= (remainder (car l) 2) p) (cons (car l) (same-parity-impl (cdr l))))
            (else (same-parity-impl (cdr l)))))
  (same-parity-impl (cons x y))))

(same-parity 2 2 3 4 5 7 4 19)