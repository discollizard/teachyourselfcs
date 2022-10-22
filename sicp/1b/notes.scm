#lang racket

;Peano arithmetic: code adapted to racket
;(define (+ x y)
;    (if (= x 0)
;        y
;        (+ (sub1 x) (add1 y))))


(define (+ x y)
    (if (= x 0)
        y
        (add1 (+ (sub1 x) y))))

;the difference between the two is that
;the first one evals the recursion by applying directly
;the increment and the decrement to the arguments.
;the second one removes all the counts from x
;so that when the recursion exits and the stack collapses
;all the removed counts get added back to y

;the first one resembles an iteration loop (despite being a recursive definition)
;as it uses time = O(n) and space = O(1)
;and the second one is a recursive process
;because its time is O(n) and its space is also O(n)
;because the size of the deferred computations
;increase with n
;while the first one only evals for one operation

(+ 2 3)

(define (sos x y)
    (+ (square x) (square y)))

(define (square x)
    (* x x))

(sos 2 3)

;fib n, time = O(fib n), space = O(n)
(define (fib n)
    (if (< n 2)
        n
    (+ (fib (- n 1))
       (fib (- n 2)))))
(fib 10)

;hanoi tower algo
(define (move n from to spare)
    (cond ((= 0 n) "done")
          (else
            (move (sub1 n) from spare to)
            (print-move from to)
            (move (sub1 n) spare to from))))

;(move 5 from to spare)
