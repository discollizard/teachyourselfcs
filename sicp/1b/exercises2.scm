#lang racket
;1.9
;explaining the difference between the iterative and recursive
;implementations of the algorithm using
;the substitiution model

;recursive process
;(define (+ a b)
; (if (= a 0) b (add1 (+ (sub1 a) b))))

;(+ 4 5)
;(add1 (+ (sub1 4) 5))
;(add1 (add1 (+ (sub1 3) 5)))
;(add1 (add1 (add1 (+ (sub1 2) 5))))
;...
;(add1 (add1 (add1 (add1 5))))
;(add1 (add1 (add1 6)))
;(add1 (add1 7))
;(add1 8)
;9

;iterative process
;(define (+ a b)
;  (if (= a 0) b (+ (sub1 a) (add1 b))))

;(+ (sub1 4) (add1 5))
;(+ (sub1 3) (add1 6))
;(+ (sub1 2) (add1 7))
;(+ (sub1 1) (add1 8))
;(+ (sub1 0) (add1 9))
;9

;1.10
(define (A x y)
  (display x)
  (newline)
  (display y)
  (newline)
  (newline)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(A 0 4) ; f(n) = 2n
(A 1 4) ; g(n) = 2^n
(A 2 4) ; h(n) = 2^^n or h(n) = 2^h(n-1)
