% Prolog Program
% Facts and rules can be defined here

% Example facts
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Example rules
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% Example queries to try:
% ?- parent(tom, bob).
% ?- grandparent(tom, ann).
% ?- ancestor(tom, jim).





natural(cero).
natural(suc(X)) :- natural(X).

% Mayor a 2: el caso base es suc(suc(suc(cero))) = 3
% mayorA2(suc(suc(suc(cero)))).
% mayorA2(suc(X)) :- mayorA2(X).



mayorA2(suc(suc(suc(cero)))).
mayorA2(suc(X)) :- mayorA2(X).

% mayorA2(suc(suc(suc(X)))) :- natural(X).

% o sea si 
% ?- mayorA2(suc(suc(cero))).
% false.

menor(cero, suc(X)) :- natural(X).
menor(suc(X),suc(Y)) :- menor(X,Y). 



% arbol de gartfield

gato(gardfield).

tieneMascota(john, edie).
tieneMascota(john, gardfield).

amaALosGatos(X) :-
		tieneMascota(X,Y) , gato(Y).

% amaALosGatos(Z).
% nos queda tieneMascota(Z,Y) , gato(Y)
	% vemos tieneMascota(Z,Y)
			% Z := john, Y := edie, unifica
				%entonces queda gato(edie)
					%falla
	% vemos tieneMascota(Z,Y)
			% Z := john, Y := gardfield,
				%entonces queda gato(gardfield)
					%falla



%entre(+X,+Y, -Z)
% entre(1,3, W)


entre(X,Y,X):- Y >= X.
entre(X,Y,Z) :- Y >= X, X1 is X+1, entre(X1, Y, Z). 

% de esta manera se cuelga: 
%			entre(X,Y,Z) :- X1 is X+1, entre(X1, Y, Z). 
	% se cuelga porque despuesde que por ejeemplo ya tenga
	% entre(4,3,4) y no cumpla el caso base
	% va ir al segundo caso, y va a hacer recursion con
	% entre(5,3,5). hay que pararlo de alguna manera!

% long(+I, -N)
% long([1,2,3], X) 


long([], 0).
long([_|T], N) :- long(T, N1), N is N1 + 1. 

% long([1,2,3], X)

	% empiezo
	% H := 1, T := [2,3], X := N

	% long([2,3], N1), N := N2 + 1

		% H := 2, T := [3], N := N1


% sacar(+X, +XS, -Y)
% sacar(2, [2,1,2,3,2], L)

  sacar(_, [], []).
  sacar(X, [X|T], L) :- sacar(X, T, L).
  sacar(X, [H|T], [H|L]) :- sacar(X, T, L).

% sinConsecRep([1,2,2,3,2,2,2],L).
% L= [1,2,3,2]

  sinConsecRep([], []).
  sinConsecRep([X], [X]).
  sinConsecRep([H,H|T],   L)        :- sinConsecRep([H|T], L).
  
  % ojo lo tengo que agregr en la recursion
  %  sinConsecRep([H,H|T],   [H|L])        :- sinConsecRep(T, L).
  
  sinConsecRep([H1,H2|T], [H1|[H2|L]]) :- H1 \= H2, sinConsecRep(T, L).


append([],L,L).
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).

prefijo(L, P) 	:- append(L, _, P).

sufijo(L,P) 		:- append(_, L, P).


sublista(_, []).
sublista(L, SL) :- prefijo(L, P), sufijo(P, SL), SL \= [].

% insertar(?X,+L,?LX): 

insertar(0,L,LX) :- append([],L,LX).
insertar(X,L,[_|T]) :- length(L,X2), X =< X2, X1 is X-1, insertar(X1,L,T).

