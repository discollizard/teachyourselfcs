(define (abs x)
  (if (< x 0)
      (- x)
      x)
)

#exercise 2.1
(define (make-rat-improved x y)
  (if (or (< x 0) (< y 0))
      (cons (abs x) (- y))
      (cons x y))
 )

(define (print-rat x)
	(newline)
	(display (car x))
	(display "/")
	(display (cdr x))  
)

(print-rat (make-rat-improved 2 -10))

#2.2
(define (make-point x y)
	(cons x y)
)

(define (x-point pointx)
	(car pointx)
)

(define (y-point pointx)
	(cdr pointx)
)

(define (make-segment pointx pointy)
 	(cons pointx pointy)
)

(define (start-segment segx)
	(car segx)
)

(define (end-segment segx)
 	(cdr segx)
)

(define (avg-seg segx)
 	(cons
     	(/
     		(+
         		(x-point
             		(start-segment segx))
         		(x-point
             		(end-segment segx))
             )
        2)
     	(/
     		(+
         		(y-point
             		(start-segment segx))
         		(y-point
             		(end-segment segx))
             )
        2)
     )
)

(define (midpoint-segment segx)
 	(avg-seg segx)
)

(define (print-point p)
(newline)
(display "(")
(display (x-point p))
(display ",")
(display (y-point p))
(display ")"))

(print-point
	(midpoint-segment
    	(make-segment
         	(make-point 2 3)
         	(make-point 3 -2)
         )
     )
 )



