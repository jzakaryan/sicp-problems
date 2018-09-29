#lang sicp

(define (identity x) x)
(define (inc x) (+ x 1))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(sum identity 1 inc 10)

(product identity 1 inc 10) ; factorial of 10

(sum-iter identity 1 inc 10)