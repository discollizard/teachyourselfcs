#lang racket

(define (square x)
    (* x x))

(define (average x y)
(/ (+ x y) 2))

(define (improve guess x)
(average guess (/ x guess)))

(define (good-enough guess x)
    (if (< (abs (- (square guess) x)) 0.001)
        guess
        (good-enough (improve guess x) x)))

(define (sqrt-iter guess x)
    (good-enough guess x))

(define (sqrt x)
    (sqrt-iter 1.0 x))

(sqrt 0.1)

;1.6
;the new-if procedure won't work like if
;because the if expression is a special case
;that short circuits the program into the 
;resolved section, ignoring the other one.
;using the new-if in place of if in this case
;results in an infinite loop

;1.7

;the test fails for small numbers by allowing 
;incorrect results at numbers small enough
;as well as with big numbers
;because the precision is not great enough to
;correctly assess these cases

;the new sqrt program works better for big numbers
;because small numbers get even smaller when squared
;and the base case returns the unsquared guess
;making it incorrect as the numbers get smaller than 1
