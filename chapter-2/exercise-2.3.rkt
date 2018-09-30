#lang sicp

; basic math package

(define (average x y) (/ (+ x y) 2))

(define (square x) (* x x))

; segment package

(define (make-point a b) (cons a b))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display " ")
  (display (y-point p))
  (display ")"))

(define (make-segment p1 p2) (cons p1 p2))

(define (segment-start x) (car x))

(define (segment-end x) (cdr x))

(define (print-segment x)
  (display "[")
  (print-point (segment-start x))
  (display "-")
  (print-point (segment-end x))
  (display "]"))
  
(define (segment-midpoint x)
  (make-point (average (* 1.0 (x-point (segment-start x))) (x-point (segment-end x)))
              (average (* 1.0 (y-point (segment-start x))) (y-point (segment-end x)))))

(define (segment-length x)
  (let ((x1 (x-point (segment-start x)))
        (x2 (x-point (segment-end x)))
        (y1 (y-point (segment-start x)))
        (y2 (y-point (segment-end x))))
    (sqrt (+ (square (- x1 x2)) (square (- y1 y2))))))

; rectangle package

(define (make-rect top-left bottom-right)
  (cons top-left bottom-right))

(define (rect-top-left r) (car r))

(define (rect-bottom-right r) (cdr r))

(define (rect-left r)
  (make-segment (rect-top-left r)
                (make-point
                 (x-point (rect-top-left r))
                 (y-point (rect-bottom-right r)))))

(define (rect-top r)
  (make-segment (rect-top-left r)
                (make-point
                 (x-point (rect-bottom-right r))
                 (y-point (rect-top-left r)))))

(define (rect-perimeter r)
   (+ (* 2 (segment-length (rect-left r))) (* 2 (segment-length (rect-top r)))))

(define (rect-area r)
  (* (segment-length (rect-left r)) (segment-length (rect-top r))))

(define p1 (make-point 0 0))
(define p2 (make-point 4 3))
(define r (make-rect p1 p2))
(rect-perimeter r)
(rect-area r)
    