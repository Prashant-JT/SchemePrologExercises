% Fibonacci (pasa las pruebas)
fibo(0, 0) :- !.
fibo(1, 1) :- !.
fibo(N, Resultado) :- N > 1, N1 is N - 1, N2 is N - 2, fibo(N1, Resultado1), fibo(N2, Resultado2), Resultado is Resultado1 + Resultado2.

% Exponencial (pasa las pruebas)
expo(_, 0, 1) :- !.
expo(B, N, Resultado) :- Exponente is N - 1, expo(B, Exponente, Resultado1), Resultado is B * Resultado1.

% Mínimo de una lista (pasa las pruebas)
minimo([Minimo], Minimo) :- !.
minimo([Primero, Segundo | Resto], Minimo) :- (Primero > Segundo -> minimo([Segundo | Resto], Minimo); 
                                                                    minimo([Primero | Resto], Minimo)).

% Insertar en una lista (pasa las pruebas)
inserta([], Valor, [Valor]).
inserta([Primero | Resto], X, Resultado) :- Primero =:= X -> inserta(Resto, X, Resultado), !.
inserta([Primero | Resto], X, [X, Primero | Resto]) :- X =< Primero, !.
inserta([Primero | Resto], X, [Primero | RestoResultado]) :- inserta(Resto, X, RestoResultado).

% Invertir un lista (pasa las pruebas)
invierte([], []) :- !.
invierte([Primero | Resto], ListaInvertida) :- invierte(Resto, RestoInvertido), append(RestoInvertido, [Primero], ListaInvertida).

% Eliminar en una lista (pasa las pruebas)
elimina([], _, []).
elimina([X | Resto], X, Resultado) :- !, elimina(Resto, X, Resultado). 
elimina([Primero | Resto], X, [Primero | RestoResultado]) :- elimina(Resto, X, RestoResultado).

% Método auxiliar para repetidos(Lista, Resultado)
buscar(X, [X | _]) :- !.
buscar(X, [_ | Resto]) :- buscar(X, Resto).

% Repetidos en una lista (pasa las pruebas)
repetidos([], []).
repetidos([Primero | Resto], Resultado) :- buscar(Primero, Resto), !, repetidos(Resto, Resultado).
repetidos([Primero | Resto], [Primero | RestoResultado]) :- repetidos(Resto, RestoResultado).


% Batería de pruebas del enunciado
%fibo(7, N).
%expo(2,3, N).
%minimo([7,6,3,2,9,1], N).
%inserta([5,6,30,60,90], 40, L).
%inserta([5,6,30,60,90], 30, L).  
%invierte([a,[b,c],d,[e,f]], L).
%elimina([f,e,d,[a,h],a,d,a],a, L).
%elimina([f,e,d,[a,h],a,[d,a]],[a,h], L).
%repetidos([a,b,c,d,a,f,g,d,c,c,h], L).