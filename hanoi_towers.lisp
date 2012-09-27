; Unfinished: figure out how to make this a simpler recursion that does not grow exponentially
; the bad way
(define (move n from to spare)
  (cond ((= n 0) true)
        (else 
          (move (- n 1) from spare to)
          (print-move n from to)
          (move (- n 1) spare to from)
          )
        )
  )

(define (print-move n from to)
  (display n)
    (display " :Move top disk from ")
    (display from)
    (display " to ")
    (display to)
    (newline)
  )

(move 4 1 2 3)

(print-move 1 2)

(display "hello")
