#lang sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (identity x) x)
(define (inc x) (+ x 1))

(define (factorial x) (product identity 1 inc x))
(define (factorial-iter x) (product-iter identity 1 inc x))

(factorial 10)
(factorial-iter 10)

(define (plus-2 x) (+ x 2))

(define (square x) (* x x))

(define (compute-pi n)
  (define (get-term k) (/ (square k) (square (+ k 1))))
  (* 2.0 (product-iter get-term 2 plus-2 n) (+ n 1 (- 1 (remainder n 2)))))

(compute-pi 100000)