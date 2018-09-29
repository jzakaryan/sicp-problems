#lang sicp

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

; iterates over all positive integers a less than n and prints
; whether a to the power of n is congruent with n.
(define (carmichael-test n)
  (define (report-carmichael-test a n)
    (newline)
    (display a)
    (display " >> ")
    (display (=  (expmod a n n) a)))
  (define (carmichael-test-it i)
    (if (< i n) (report-carmichael-test i n))
    (if (< i n) (carmichael-test-it (+ i 1))))
  (carmichael-test-it 2))

; tests on carmichael numbers
; these fool the fermat test
(carmichael-test 561)
(carmichael-test 1105)
(carmichael-test 1729)