#lang sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define (square x) (* x x))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ test-divisor 1)))))

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

(define (search-for-primes a b)
  (define closest-odd (+ a (- 1 (remainder a 2))))
  (if (<= closest-odd b) (timed-prime-test closest-odd))
  (if (<= closest-odd b) (search-for-primes (+ a 2) b)))

(search-for-primes 100000 200000)


