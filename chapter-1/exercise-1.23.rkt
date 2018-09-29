#lang sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define (square x) (* x x))

(define (next-test-divisor n)
  (if (= n 2) 3 (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (next-test-divisor test-divisor)))))

(define (divides? divisor number)
  (= (remainder number divisor) 0))

(define (prime? n)
 (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(timed-prime-test 1999993)