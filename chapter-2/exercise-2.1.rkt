#lang sicp
(define (sign a)
  (cond ((> a 0) 1)
        ((< a 0) -1)
        (else 0)))

(define (abs a)
  (if (< a 0)
      (- a)
      a))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; rational number system
(define (make-rat n d)
  (let ((g (abs (gcd n d)))
        (s (sign (* n d))))
    (cons (* s (abs (/ n g))) (abs (/ d g)))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat a b)
  (make-rat (+ (* (numer a) (denom b)) (* (denom a) (numer b)))
            (* (denom a) (denom b))))

(define (sub-rat a b)
  (make-rat (- (* (numer a) (denom b)) (* (denom a) (numer b)))
            (* (denom a) (denom b))))

(define (mul-rat a b)
  (make-rat (* (numer a) (numer b)) (* (denom a) (denom b))))

(define (div-rat a b)
  (make-rat (* (numer a) (denom b)) (* (denom a) (numer b))))

(define (equal-rat? a b)
  (= (* (numer a) (denom b))
     (* (denom a) (numer b))))

