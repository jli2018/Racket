;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname FunctionalP) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;#lang racket
;Jessica Li
;Test file
;2/23/16

;17
;(+ 8 8)
;(quotient 11 2)
;(remainder 11 2)

;(define (foo x) (+ x x))

;no arguments
;(define two-plus-two (+ 2 2))

;two-plus-two

;(define (foobar u v) (+ u v))

;(foobar 7 8)

;"bar"



;; to-celsius : number -> number

(define (to-celsius x) (/ (* (- x 32) 5) 9) )

(check-expect (to-celsius 32) 0)
(check-expect (to-celsius 86) 30)
(check-expect (to-celsius 5) -15)


;; is-leap-year : number -> boolean

(define (is-leap-year x)
  (if (= (remainder x 4) 0)
      (if (= (remainder x 100) 0)
          (if (= (remainder x 400) 0) true false ) true ) 
      false) )

(check-expect (is-leap-year 2016) true)
(check-expect (is-leap-year 2000) true)
(check-expect (is-leap-year 2015) false)
(check-expect (is-leap-year 1900) false)
(check-expect (is-leap-year 1700) false)


;; is-leap-year-cond : number -> boolean
;; uses different method with conds

(define (is-leap-year-cond x)
  (cond
    [ (and (= (remainder x 4) 0) (not (= (remainder x 100) 0))) true ]
    [ (and (= (remainder x 4) 0) (= (remainder x 400) 0)) true ]
    [ else false] ))

(check-expect (is-leap-year-cond 2016) true)
(check-expect (is-leap-year-cond 2000) true)
(check-expect (is-leap-year-cond 2015) false)
(check-expect (is-leap-year-cond 1900) false)
(check-expect (is-leap-year-cond 1700) false)


;; countdown : number -> string

(define (countdown x)
  (cond
    [(<= x 0) "Blastoff!" ]
    [else (string-append (number->string x) " " (countdown (- x 1))) ]))

(check-expect (countdown 10) "10 9 8 7 6 5 4 3 2 1 Blastoff!")
(check-expect (countdown 2) "2 1 Blastoff!")
(check-expect (countdown 0) "Blastoff!")
(check-expect (countdown -3) "Blastoff!")


;; summation : number -> number

(define (summation x)
  (if (> x 0) (+ x (summation (- x 1))) 0 ))

(check-expect (summation 3) 6)
(check-expect (summation 5) 15)


;; numDigits : number -> number

(define (numDigits x)
  (if (< x 10) 1 (+ 1 (numDigits (quotient x 10)))))

(check-expect (numDigits 10) 2)
(check-expect (numDigits 23874) 5)


;; cons
(cons 3 empty)
(cons 4 (cons 3 empty))
(cons 6 (cons 4 (cons 3 empty)))
"Methods:"


;; create-list : number -> list

(define (create-list size)
  (cond
    [(= size 0) empty]
    [else (cons size (create-list (- size 1)))]))

(create-list 5)
(create-list 10)


;; size : list -> number

(define (size l)
  (cond
    [(empty? l) 0]
    [else (+ 1 (size (cdr l)))]))

(size (create-list 5))
(size (create-list 10))
    