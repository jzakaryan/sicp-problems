#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ (/ dx 2.0) a) add-dx b) dx))

(define (cube x) (* x x x))

(integral cube 0 1 0.001)

(define (inc x) (+ x 1))

(define (integral-simpsons f a b n)
  (define h (/ (- b a) n))
  (define (get-term k) (* (f (+ a (* k h))) (+ 2 (* (remainder k 2) 2))))
  (* (/ h 3.00) (sum get-term 0 inc n)))

(integral-simpsons cube 0 1 1000)