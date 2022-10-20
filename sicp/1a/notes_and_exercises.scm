#lang racket

; class notes

(define (square x)
  (* x x))

(square 3)

(define (abs x)
  (cond ((< x 0) (- x))
        (( = x 0) 0)
        ((> x 0) x)))

(define (average y x)
  (/ (+ x y) 2))

(define (sqrt x)
    (define (improve guess)
        (average guess (/ x guess)))
    (define (good-enough? guess)
        (< (abs (- (square guess) x)) 0.001))
    (define (try guess)
        (if (good-enough? guess)
            (exact->inexact guess)
            (try (improve guess))))

  (try 1))

(sqrt 2)


;exercises


;1.1

10 ; 10
(+ 5 3 4) ; 12
(- 9 1) ; 8
(/ 6 2) ; 3
(+ (* 2 4) (- 4 6)) ; 6
(define a 3) ; a
(define b (+ a 1)) ; b
(+ a b (* a b)) ; 19
(= a b) ; #f
(if (and (> b a) (< b (* a b))) ; 4
b
a)
(cond ((= a 4) 6)
((= b 4) (+ 6 7 a))
(else 25)) ; 16
(+ 2 (if (> b a) b a)) ; 6
(* (cond ((> a b) a)
((< a b) b)
(else -1))
(+ a 1)) ; 16

;1.2

(/ (+ 5 4 (- 2 (- 3 (+ 6 4/5)))) (* 3 (- 6 2) (- 2 7)))

;1.3

(define (sum-of-squares-for-two-biggest x y z)
  (cond ((or (and (> x y) (> y z)) (and (> y x) (> x z))) (+ (square x) (square y)))
        ((or (and (> y z) (> z x)) (and (> z y) (> y x))) (+ (square y) (square z)))
        ((or (and (> z x) (> x y)) (and (> x z) (> z y))) (+ (square z) (square x)))))
(sum-of-squares-for-two-biggest 5 3 4)

;1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
(a-plus-abs-b 2 (- 3))

;in the example above, the if statement is evaluated, returning
;the operator adequate for the abs b section based on if
;b is bigger or smaller than 0

;1.5

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
(test 0 3)

;if the applicative-order evaluation is used, the
;return value will be 0 because it exits from the if
;statement before (p) is evaluated. but, because
;the interpreter i'm using uses normal-order
;the (p) gets evaluated to an infinite loop
