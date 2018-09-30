#lang sicp

; segment package

(define (average x y) (/ (+ x y) 2))

(define (make-point a b) (cons a b))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display " ")
  (display (y-point p))
  (display ")"))

(define (make-segment p1 p2) (cons p1 p2))

(define (segment-start x) (car x))

(define (segment-end x) (cdr x))

(define (print-segment x)
  (display "[")
  (print-point (segment-start x))
  (display "-")
  (print-point (segment-end x))
  (display "]"))
  
(define (segment-midpoint x)
  (make-point (average (* 1.0 (x-point (segment-start x))) (x-point (segment-end x)))
              (average (* 1.0 (y-point (segment-start x))) (y-point (segment-end x)))))

(define p1 (make-point 3 4))

(define p2 (make-point 2 8))

(define s1 (make-segment p1 p2))

(print-point (segment-midpoint s1))
(newline)
(print-segment s1)