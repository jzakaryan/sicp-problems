#lang sicp

(define (half x) (/ x 2))

(define (make-interval a b)
  (cons (min a b) (max a b)))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

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

(define (width-interval x)
  (half (- (upper-bound x) (lower-bound x))))

(define i1 (make-interval 1.0 4.0))
(define i2 (make-interval 1.0 1.0))

(div-interval i1 i2)