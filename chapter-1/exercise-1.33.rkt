#lang sicp

; primitive functions

(define (identity x) x)
(define (inc x) (+ x 1))
(define (all x) #true)
(define (square x) (* x x))

; gcd

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; primality test

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? x)
  (fast-prime? x 20))

; accumulation

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner
                        result
                        (if (filter a) (term a) null-value)))))
  (iter a null-value))

; Ex 1.33a - the sum of squares of the prime numbers in the interval a to b

(define (sum-of-prime-squares a b)
  (filtered-accumulate + 0 identity a inc b prime?))

(sum-of-prime-squares 100 120)

; Ex 1.33b - product of all positive integers less than n that are relatively prime to n

(define (product-rel-prime-ints n)
  (define (relatively-prime? x)
    (= 1 (gcd n x)))
  (filtered-accumulate * 1 identity 1 inc n relatively-prime?))

(product-rel-prime-ints 25)