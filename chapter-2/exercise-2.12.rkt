#lang sicp

; basic math procedures

(define (positive? x) (> x 0))

(define (non-negative? x) (or (> x 0) (= x 0)))

(define (negative? x) (< x 0))

(define (half x) (/ x 2))

; interval arithmetic constructors and selectors

(define (make-interval a b)
  (cons (min a b) (max a b)))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (width-interval x)
  (half (- (upper-bound x) (lower-bound x))))

(define (center-interval x)
  (half (+ (lower-bound x) (upper-bound x))))

(define (make-center-percent c p)
  (make-interval (- c (/ 100.0 (* c p))) (+ c (/ 100.0 (* c p)))))

(define (percent x)
  (/ (* 100.0 (width-interval x)) (center-interval x)))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

; interval arithmetic operators
  
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (= 0 (width-interval y))
      (error "Invalid Operation: can not divide to an interval with width 0")
      (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))