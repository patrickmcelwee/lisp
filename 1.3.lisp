(define (square x) (* x x))

(define (sum-sq x y) (+ (square x) (square y)))

(define (sum-two-largest x y z)
  (  COND ((and (> x z) (> y z)) (+ x y))
          ((> x y) (+ x z))
          ((> y x) (+ y z))
          )
  )

(define (sum-two-largest-squares x y z)
  (sum-two-largest (square x) (square y) (square z))
  )

(sum-two-largest-squares 4 2 3)
