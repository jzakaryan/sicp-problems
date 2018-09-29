#lang sicp

(define tolerance 0.0001)

(define (average a b) (/ (+ a b) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next-guess (f guess)))
      (if (close-enough? guess next-guess)
          guess
          (try next-guess))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)

(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)