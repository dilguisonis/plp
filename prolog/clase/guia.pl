

natural(0).
natural(suc(X)) :- natural(X).

% ej 3
% de esta manera no es reversible en Y

% menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
% menorOIgual(X,X) :- natural(X).

%  menorOIgual(0,Y).
%  X := 0, Y := suc(Y1),
	% menorOIgual(0, Y1).
		% vemos deunificar Y1 := suc(Y2)
		% y hacemos menorOIgual(X, Y2). 
		% y seguimos,nunca para.

% 
% de esta manera si lo es Y

menorOIgual(X,X) :- natural(X).
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
 

%  	menorOIgual(0,Y).
			%  	Y:= X, X := 0 -> menorOIgual(0,0) :- natural(0) TRUE, Y = 0-
			% 	Seguimos.	 
			% 	menorOIgual(X, suc(Y1)) :- menorOIgual(X, Y1).
			% 	X := 0, Y:= suc(Y1), hacemos recursion en menorOIgual(X, Y1).
				% menorOIgual(0, Y1). 
				% menorOIgual(0,Y1) :- natural(0).
				% entonces Y1 := 0, entonces Y := suc(0)
				% y asi seguimos. 				



% ej 4

% juntar(?Lista1,?Lista2,?Lista3)

juntar([],L,L).
juntar([H1|T1],L,[H1|T2]) :- juntar(T1,L,T2).

% ej 5



% i. last(?L, ?U), donde U es el último elemento de la lista L.

last([X], X).
last(L, X) :- append(H,XS,L), length(H,1), last(XS, X).


% ii. reverse(+L, ?R), donde R contiene los mismos elementos que L, pero en orden inverso.
% Ejemplo: reverse([a,b,c], [c,b,a]).


reverse([], []).
reverse(XS, YS) :-
      length(H,1),           % Primero restringir H
      append(H,L1,XS),       % Luego separar XS
      reverse(L1, L2),       % Recursión
      append(L2,H,YS).       % Construir YS


%	[1,2,3]
%	

% Mostrar el árbol de búsqueda para el ejemplo dado.


% iii. prefijo(?P, +L), donde P es prejo de la lista L.
% iv. sufijo(?S, +L), donde S es sujo de la lista L.
% v. sublista(?S, +L), donde S es sublista de L.
% vi. pertenece(?X, +L), que es verdadero sii el elemento X se encuentra en la lista L. (Este predicado ya viene
% denido en Prolog y se llama member).

% pertenece(?X, +L),

pertenece(X, [X]).
pertenece(X, XS) :- append([X],_,XS). 
pertenece(X, XS) :- length(H,1), H \= [X], append(H,L,XS), pertenece(X, L). 
% pertenece(X, XS) :-
%      length(H, 1),
%      append(H, L, XS),      % XS = [cabeza|L]
%      pertenece(X, L).       % buscar en L



% aplanar(+Xs, -Ys)


aplanar([]		, []).  
aplanar([[]], []).     
aplanar([X], [X]) :-  X \= [],X \= [_|_].              % X es átomo
aplanar([[H|T]], L) :- aplanar([H|T], L).     % X es lista
aplanar(XS, 	L) :- length(XS, Z), Z > 1, append(H,T,XS),length(H,1)	,  
										aplanar(H, HAplanada), aplanar(T, TAplanada),
										append(HAplanada,TAplanada,L).

										% [[1],[2]] 


% ej 7
%  intersección(+L1, +L2, -L3), tal que L3 es la intersección sin repeticiones de las listas L1 y L2, respe-
% tando en L3 el orden en que aparecen los elementos en L1.

sacar(_, [], []).
sacar(X, [X|T], L) :- sacar(X, T, L).
sacar(X, [H|T], [H|L]) :- X \= H, sacar(X, T, L).


interseccion([], _, []).
interseccion([X|L1], L2, [X|L3]) :-
    member(X, L2),
    sacar(X, L1, L1SinX),           % Elimina X de L1 para no repetirlo
    interseccion(L1SinX, L2, L3).

interseccion([X|L1], L2, L3) :-
    not(member(X, L2)),
    interseccion(L1, L2, L3).


% partir(N, L, L1, L2), donde L1 tiene los N primeros elementos de L, 
% y L2 el resto. Si L tiene menos de N elementos el predicado debe fallar. 
% ¾Cuán reversible es este predicado? Es decir, ¾qué parámetros pueden
% estar indenidos al momento de la invocación?


partir(N, L, L1, L2) :- append(L1,L2,L), length(L1,N).

% borrar(+ListaOriginal, +X, -ListaSinXs), 
% que elimina todas las ocurrencias de X de la lista ListaOriginal.
	
% v. permutación(+L1, ?L2), que tiene éxito cuando L2 es permutación de L1. ¾Hay una manera más eciente
% de denir este predicado para cuando L2 está instanciada?


permutación([], []).
permutación([H|T], L2) :-
    length([H|T], N),             % L1 tiene longitud N
    length(L2, N),                % ← L2 también debe tener longitud N
    append(LA, [H|LB], L2),
    append(LA, LB, L3),
    permutación(T, L3).

% sacarDuplicados(+L1, -L2), que saca todos los elementos duplicados de la lista L1.


sacarDuplicados([], []).
sacarDuplicados([H|T], [H|L3]) :- sacar(H, T, T1), sacarDuplicados(T1, L3). 

% v. reparto(+L, +N, -LListas) que tenga éxito si LListas es una lista de N listas (N ≥ 1)
% de cualquier longitud - incluso vacías - tales que al concatenarlas se obtiene la lista L.



%reparto(+L, +N, -LListas)
reparto(L, 1, [L]).
reparto(L, N, [L1|LListas]) :- 	N >= 1, append(L1, L2, L), N1 is N - 1, 
																reparto(L2, N1, LListas).


repartoSinVacías([], []).
repartoSinVacías(L, [L1|LListas]) :-
      append(L1, L2, L),      % Dividir L en L1 y L2
      L1 = [_|_],               % L1 no vacía
      repartoSinVacías(L2, LListas).



% Ejercicio 8
% Denir el predicado parteQueSuma(+L,+S,-P) que es verdadero cuando P es una lista con elementos de L que
% suman S. Por ejemplo:

% sum_list

parteQueSuma([], 0, []).
parteQueSuma([H|T], S, [H|P]) :-
    S1 is S - H,
    S1 >= 0,
    parteQueSuma(T, S1, P).
parteQueSuma([_|T], S, P) :-
    parteQueSuma(T, S, P).

desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

intercalar([], [], []).
intercalar(L1, [], L1) :- length(L1, Len), Len > 0.
intercalar([], L2, L2) :- length(L2, Len), Len > 0.
intercalar([H1|L1], [H2|L2], [H1,H2|L3]) :- intercalar(L1, L2, L3).

vacío(nil).
raiz(bin(izq, v, der), v).

altura(nil, 0). 
altura(bin(I, R, D), Altura) :- altura(I, AlturaI), altura(D, AlturaD), 
																Altura is max(AlturaI+1, AlturaD+1).  

% cantidadDeNodos 	

cantidadDeNodos(nil, 0).
cantidadDeNodos(bin(I, R, D), N) :- cantidadDeNodos(I, NodosI), 
																		cantidadDeNodos(D, NodosD), 
																		N is (1 + NodosI+NodosD).

% inorder(+AB,-Lista), que tenga éxito si AB es un árbol binario y 
% Lista la lista de sus nodos según el recorrido inorder.


inorder(nil, []).
inorder(bin(I, R, D), L):- 	inorder(I, LI), inorder(D, LD), append(LI, [R|LD], L).


% arbolConInorder(+Lista,-AB), versión inversa del predicado anterior.


arbolConInorder([], nil).
arbolConInorder(Lista, bin(I, R, D)) :-
    append(LI, [R|LD], Lista),    % PRIMERO: divide Lista en LI, R, LD
    arbolConInorder(LI, I),       % DESPUÉS: construye subárbol izquierdo
    arbolConInorder(LD, D).       % DESPUÉS: construye subárbol derecho


aBB(nil).
aBB(bin(nil, R, nil)).
aBB(bin(I, R, D)) 	:-	raiz(I, RI), RI < R, 
												raiz(D, RD), R 	< RD, aBB(I), aBB(D). 
aBB(bin(nil, R, D))	:- 	raiz(D, RD), R 	< RD, aBB(D). 
aBB(bin(I, R, nil))	:- 	raiz(I, RI), RI < R, 	aBB(I). 