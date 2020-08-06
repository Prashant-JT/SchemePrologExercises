(require errortrace) ;; Ofrece más información al producirse un error
(require racket/trace) ;; Permite seguir la ejecución de una función usando antes (trace nombre_de_función)

;; pasa las pruebas
(define (fibo n)
    (cond
        ((= n 0) 0)
        ((= n 1) 1)
        ( else (+ (fibo (- n 1)) (fibo (- n 2))) )
    )
)

;; pasa las pruebas
(define (expo b n)
    (cond
        ((= n 0) 1)
        ( else (* b (expo b (- n 1))) )
    )
)

;; pasa las pruebas
(define (minimo L)
    (if (null? (cdr L))
        (car L)
        (if (> (car L) (minimo (cdr L)))
            (minimo (cdr L))
            (car L)
        )
    )
)

;; pasa las pruebas
(define (inserta n L)
    (cond
        ((null? L) (cons n L))
        ((< n (car L)) (cons n L))
        ((null? (cdr L)) (cons (car L) (inserta n '())))
        ((and (>= n (car L)) (<= n (car (cdr L)))) (cons (car L) (cons n (cdr L))))
        ( else (cons (car L) (inserta n (cdr L))) )
    )
)

;; pasa las pruebas
(define (concatena L1 L2)
    (cond
        ((null? L1) L2)
        ( else (cons (car L1) (concatena (cdr L1) L2)) )
    )
)

;; pasa las pruebas
(define (invierte L)
    (cond
        ((null? L) L)
        ( else (concatena (invierte (cdr L)) (list (car L))) )
    )
)

;; pasa pruebas
(define (elimina e L)
    (cond
        ((null? L) L)
        ((equal? e (car L)) (elimina e (cdr L))) 
        ( else (cons (car L) (elimina e (cdr L))) )
    )
)

;; método auxiliar para (repetidos L)
(define (buscar n L)
    (cond
        ((null? L) #f)
        ((equal? n (car L)) #t)
        ( else (buscar n (cdr L)) )
    )
)

;; pasa las pruebas
(define (repetidos L)
    (if (null? L)
        L
        (if (buscar (car L) (cdr L))
            (repetidos (cdr L))
            (cons (car L) (repetidos(cdr L)))
        )
    )
)

;; bateria de pruebas del enunciado
(display "(fibo 7) : ")
(display (fibo 7))
(newline)
(display "(expo 2 3) : ")
(display (expo 2 3))
(newline)
(display "(minimo '(7 6 3 2 9 1)) : ") 
(display (minimo '(7 6 3 2 9 1)))
(newline)
(display "(inserta 55 '(5 6 30 60 90)) : ") 
(display (inserta 55 '(5 6 30 60 90))) 
(newline)
(display "(concatena '(a b c) '(a (b c) d e)) : ") 
(display (concatena '(a b c) '(a (b c) d e))) 
(newline)
(display "(invierte '(a (b c) d (e f))) : ") 
(display (invierte '(a (b c) d (e f))))
(newline)
(display "(elimina 'a '(f e d a h a d a)) : ") 
(display (elimina 'a '(f e d a h a d a)))
(newline)
(display "(elimina '(a b) '(a b (a b) c d (c d))) : ") 
(display (elimina '(a b) '(a b (a b) c d (c d)))) 
(newline)
(display "(repetidos '(a b c d a f g d c c h)) : ") 
(display (repetidos '(a b c d a f g d c c h))) 