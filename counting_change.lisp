(define (count_change amount)
  (define (ways_to_change amount coin_kinds)
    (define (denomination coin_kinds)
      (cond ( (= coin_kinds 5) 50)
            ( (= coin_kinds 4) 25)
            ( (= coin_kinds 3) 10)
            ( (= coin_kinds 2) 5)
            ( (= coin_kinds 1) 1)
            )
      )
    (cond ( (= amount 0) 1 )
         ( (< amount 0) 0 )
         ( (= coin_kinds 0) 0 )
         (else (+ (ways_to_change amount (- coin_kinds 1))
                  (ways_to_change (- amount (denomination coin_kinds)) coin_kinds)
                  ))
         )
  ) 
 (ways_to_change amount 5)
 )

(count_change 10)

; change 10 cents with nickels and pennies:
; 1 way (only pennies) + (# ways to change 5 cents)
; 1 way + 1 way + (#ways to change 0 cents)
; 1 way + 1 way + 1 way
; 3 ways

(count_change 15)

; all pennies: 1 for any amount
; nickels: 1 + (amount / 5, discarding remainder)
; dimes: nickels + (amount / 10) + nickels(amount - ((amount / 10) -1)))
; so for 20, it is 1 + 4 + 2 + 1

(define (count-change amount)
  (define (ways-to-change amount coin-types running-total)
    (cond ((= amount 0) 1)
          ((< amount 0) 0)
          ((= 0 coin-types) 0)
          ((= 1 coin-types) (+ running-total 1))
          (else (+ running-total (/ amount denomination )
                  (ways-to-change ) 
                   ) )
          )
    )
  )
