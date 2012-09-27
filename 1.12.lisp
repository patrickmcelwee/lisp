; Generate Pascal's triangle based on entered number, starting with 1

; note: next-row-end equals (+ row last-row-end)
(define (pascal n)
  (define (iter row last-row-end count)
    (cond ((= count n) 
           (cond 
             ((or (= n (+ 1 last-row-end)) (= n (+ row last-row-end))) 1); row ends and starts
             ((or (= n (+ 2 last-row-end)) (= n (+ row last-row-end -1))) (- row 1)); next-to-outside numbers
             (else (+ (pascal (+ 1 (- n row))) (pascal (- n row))))
             )
           )
          (else 
            (cond ((= count (+ row last-row-end)) 
                   (iter (+ row 1) count (+ count 1))
                   ) 
                  (else (iter row last-row-end (+ count 1))
                        ))
            )
          )
    )
  (cond ((< n 5) 1)
        (else (iter 3 3 5)) )
  )

(pascal 1); 1
(pascal 4); 1
(pascal 5); 2
(pascal 6); 1
(pascal 7); 1
(pascal 8); 3
(pascal 18); 10
(pascal 25); 20
(pascal 26); 15
(pascal 32); 35

1, 2, 4, 7, 11, 16, 22

1, 3, 6, 10, 15, 21


1 - R1
11 - R2
121 - R3
1331 - R4
14641 - R5
1 5 10 10 5 1 - R6
1 6 15 20 15 6 1 - R7
1 7 22 35 35 22 7 1 - R8
