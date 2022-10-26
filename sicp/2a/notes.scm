#lang racket

(define (square x)
    (* x x))

(define (sum-int a b)
    (if (> a b)
        0
        (+ a (sum-int (add1 a) b))))

(define (sum-sq a b)
    (if (> a b)
        0
        (+ (square a)
           (sum-sq (add1 a) b))))

(sum-sq 2 5)

;the functions above look very similar
;question: how does one abstract away the similarities
;between them, ideally creating a generic 'sum'
;function?
;answer:

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

;applying the pattern to make new functions

(define (sum-int a b)
    (define (identity x x))
    (sum identity a add1 b))

(define (sum-sq a b)
    (sum square a add1 b))

;using lambda functions as the term applied to the lower bound (a)

(define (pi-sum a b)
    (sum (lambda (i) (/ 1 (* i (+ i 2)))) a (lambda (i) (+ i 4)) b))

;refactoring sqrt using newton's method
(define dx 0.0001)
(define (deriv
    (lambda (f)
        (lambda (x)
            (/ (- (f (+ x dx))
               (f x))
            dx)))) 

(define (sqrt x)
    (define (newton f guess)
        (define df (deriv f))
        (fixed-point
            (lambda (x) (- x (/ (f x) (df x))))
            guess))
    (newton (lambda (y) (-x (square y)))
        1))

