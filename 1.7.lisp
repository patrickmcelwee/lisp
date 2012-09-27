(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) .001)
  )

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2)
  )

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)
    )
  )

(define (sqrt x)
   (sqrt-iter 1.0 x))

(sqrt 4)

;breaks for a small number: .001 is ok but .000001 breaks
;because of our poor good-enough? test

(sqrt .001)
(sqrt (* .001 .001))

;also breaks for a large number: goes into never-ending loop and has to be interrupted

(sqrt 1e100)

; Let's refactor by taking into account the difference in guesses compared to their magnitude

(define (good-enough? guess x last-guess)
  (< (/ (abs (- guess last-guess)) guess) .0001)
  )

(define (sqrt-iter guess x last-guess)
  (if (good-enough? guess x last-guess)
    guess
    (sqrt-iter (improve guess x) x guess)
    )
  )

(define (sqrt x)
   (sqrt-iter 1.0 x .1))

; Now all the above examples work, and the breaks now come because of float problems

(sqrt 1e308)
(sqrt 1e309)

; Function to find cubed roots - note that only improve function had to change

(define (cbrt x)
  (define (rt-iter guess x last-guess)
    (define (good-enough? guess x last-guess)
      (< (/ (abs (- guess last-guess)) guess) .0001)
      )
    (define (improve guess x)
      (/ (+ (* guess 2) (/ x (* guess guess))) 3)
      )
    (if (good-enough? guess x last-guess)
      guess
      (rt-iter (improve guess x) x guess)
      )
    )
  (rt-iter 1.0 x .1) 
  )

(cbrt 27)
(cbrt (* 1e25 1e25 1e25))
(cbrt (* 1e-25 1e-25 1e-25))
