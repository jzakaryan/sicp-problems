#lang sicp

(define (fringe t)
  (cond ((null? t) '())
        ((not (pair? (car t))) (cons (car t) (fringe (cdr t))))
        (else (append (fringe (car t)) (fringe (cdr t))))))

(fringe (list 1 2 (list 3 (list 4 5) 6)))