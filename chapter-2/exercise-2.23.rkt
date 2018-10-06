#lang sicp

(define (for-each proc l)
  (cond ((null? l) #true)
        (else (proc (car l))
              (for-each proc (cdr l)))))

(for-each (lambda (x) (newline) (display x)) (list 1 2 3))