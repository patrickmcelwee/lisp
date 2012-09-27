((
                              )
  )

(define (square x) (* x x))

(define (sum-sq x y) (+ (square x) (square y)))

(define (sum_2_largest x y z)
  (cond (and (> x z) (> y z)) (+ x y)
             (> x y) (+ x z)
             (> y x) (+ y z)
  ))
