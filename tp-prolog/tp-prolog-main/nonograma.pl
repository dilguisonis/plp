

% Ejercicio 1
%construyo la fila de C columnas.
fila(0,[]).
fila(C,Fs):- C>0, N is (C-1),fila(N,R),append([_],R,Fs).
%matriz construye F filas. 
matriz(0,_,[]).
matriz(F, C, M) :-F >0,  N is (F-1),fila(C,R), matriz(N,C,M0),M =[R|M0].


% Ejercicio 2
%agregamos E a la recursion. 
replicar(_,0,[]).
replicar(E,N,L):-N>0,M is(N-1),replicar(E,M,R),L=[E|R].

% Ejercicio 3
%Sabemos que la primera fila de la matriz transpuesta se forma con
%las cabezas de las filas de la matriz y entonces, el resto de la
%matriz transpuesta será transponiendo las colas de todas las filas.
%primero separamos en cabezas y colas:
separarCabezasColas([],[],[]).
separarCabezasColas([[L|Ls]|M],Hs,Ts):-separarCabezasColas(M,Rh,Rt), Hs=[L|Rh],Ts=[Ls|Rt].

%separamos todas las cabezas de las filas, transponemos las colas y ligamos los resultados de la recursion.
transponer([[]|_],[]):- !. %cortamos el backtracking cuando llegamos a colas vacías.
transponer([M|Ms],[MT|MTs]):-separarCabezasColas([M|Ms],Hs,Ts),transponer(Ts,R),MT=Hs,MTs=R.

% Predicado dado armarNono/3
armarNono(RF, RC, nono(M, RS)) :-
	length(RF, F),
	length(RC, C),
	matriz(F, C, M),
	transponer(M, Mt),
	zipR(RF, M, RSFilas),
	zipR(RC, Mt, RSColumnas),
	append(RSFilas, RSColumnas, RS).

zipR([], [], []).
zipR([R|RT], [L|LT], [r(R,L)|T]) :- zipR(RT, LT, T).

% Ejercicio 4
%Tenemos k restricciones, por lo tanto la minima cantidad de celdas no pintadas (o en blanco)
% es B_min = k-1.
%La cantidad de celdas blancas que dispongo para distribuir es B_d = CantDeCeldas - CantCeldasNegras - B_min.
%La lista final será [b_0,r_1,b_1,...,r_k,b_k] por lo que tengo B_d celdas en blanco para distribuir en
%k+1 lugares.
%La cantidad de pintadas validas es encontrar todas las combinaciones de numeros que sumados entre sí den B_d.
%Es decir: x_0+x_1+..+x_k=B_d donde x_0,x_k >= 0 y x_i >=1, 1<=i<=k-1.

%a partir de dame_config obtengo todas las posibles configuraciones de las celdas en blanco. Es decir,
%tenemos el arreglo b_0,_b_1,...,b_k ya que b_0 contiene x_0 celdas en blanco, b_1 contiene x_1 + 1 celdas en blanco
%(ya que esta de base el separador por regla de restriccion), ...,b_k contiene x_k celdas en blanco.
%por lo tanto queda construir la fila de pintadas validas.
pintadasValidas(r(Res,Celdas)) :-
		sum_list(Res, CantCeldasNegras),%vemos cuantas celdas negras hay en la fila.
		length(Celdas, SizeFila),
		length(Res,K),
		K >= 0,%funciona tanto para K=0 como para K>0
		B_min is max(0, K-1),%si K=0 entonces B_min=0, si K>0 entonces B_min=K-1
		B_d is (SizeFila-CantCeldasNegras-B_min),
		EspaciosLibres is (K+1),
		dame_config(B_d,EspaciosLibres,ConfigBlancas),
		construirPintada(Res,ConfigBlancas,Celdas).%teniendo las posibles configs de las celdas blancas y como deben disponerse
								%las celdas negras, construimos la fila [b_0,r_1,..,r_k,b_k]


%defino predicado dame_config que toma un natural E, otro natural Size y una lista
%que será verdadero si la suma de los elementos de la lista de tamaño Size es igual a E.
dame_config(0,0,[]).
dame_config(E,Size,[L|Ls]):-
    Size>0,
    between(0,E, R),
    N is (E-R),
    M is (Size-1),
    dame_config(N,M,Ls),
    L = R.
		
construirPintada([],[B_k],Fila):- replicar(o,B_k,Fila). %caso base, no quedan restricciones, queda b_k cantidad final de 'o's.
construirPintada([R|Res],[B|Bs],Fila):-
		replicar(o,B,B_i),
		replicar(x,R,R_i),
		separador(Res,Separador),%si quedan elementos en Res, agrego 'o'.
		construirPintada(Res,Bs,L),
		append(B_i,R_i,Temp1),
		append(Temp1,Separador,Temp2),
		append(Temp2,L,Fila).

separador([],[]).
separador([_|_],[o]). 


% Ejercicio 5
%sabemos que el motor de prolog funciona con backtracking. Por lo tanto la función, coloquialmente hablando,
%es "El nonograma NN es un nonograma válido si cada fila es una pintada válida."

resolverNaive(nono(M,RS)):-
	dame_restricciones(M,RS,ResF,ResC),
	filas_nono(ResF,M),%acá nos queda la matriz M instanciada.
	cols_nono(ResC,M).%nos queda chequear que se cumplen las restricciones de las columnas.
					%podemos transponer la matriz y ver si es una pintada valida con las restricciones de la columna.

filas_nono([],[]).
filas_nono([r(Res,Fila)|RH],[Fila|M]):-%unifico Fila ya que las restricciones vienen en el orden de la matriz.
	pintadasValidas(r(Res,Fila)),
	filas_nono(RH,M).

cols_nono([],[]).
cols_nono(ResC,M):-transponer(M,MTranspuesta),filas_nono(ResC,MTranspuesta).

dame_restricciones(M,RS,ResF,ResC):-
	length(M,F),%cuantas filas hay
	separarRestricciones(F, RS, ResF, ResC).
	 
separarRestricciones(0,RS,[],RS).
separarRestricciones(F,[H|T],[H|L1],L2):- F>0,N is (F-1),separarRestricciones(N,T,L1,L2).

% Ejercicio 6
%Lo que se pide es, ver todas las soluciones posibles (pintadasValidas) y pintar aquellas celdas en la que en todas las soluciones 
%está el mismo valor ('x' o 'o').
%Es decir, dada la matriz con todas las pintadas validas, si todos los elementos de una columna contiene el mismo elemento, entonces
%la posicion de la Fila correspondiente a la de la columna sera ese elemento.
pintarObligatorias(r(Res,Celdas)) :- 
	findall(Celdas, pintadasValidas(r(Res,Celdas)),Msol),
	transponer(Msol,MsolTranspuesta),%transponemos para tener las columnas como filas y asi recursionar en la columna (ahora fila).
	construirFila(MsolTranspuesta,Celdas).


construirFila([],[]).
construirFila([M|Mt],[L|Ls]):-%caso 'x'.
	todos_iguales(x,M),
	!,
	L=x,	
	construirFila(Mt,Ls).
construirFila([M|Mt],[L|Ls]):-%caso 'o'.
	todos_iguales(o,M),
	!,
	L=o,	
	construirFila(Mt,Ls).
construirFila([_|Mt],[L|Ls]):-%caso 'x'.
	L=_,	
	construirFila(Mt,Ls).

todos_iguales(_,[]).
todos_iguales(E,[L|Ls]):- E == L, todos_iguales(E,Ls).

% Predicado dado combinarCelda/3
combinarCelda(A, B, _) :- var(A), var(B).
combinarCelda(A, B, _) :- nonvar(A), var(B).
combinarCelda(A, B, _) :- var(A), nonvar(B).
combinarCelda(A, B, A) :- nonvar(A), nonvar(B), A = B.
combinarCelda(A, B, _) :- nonvar(A), nonvar(B), A \== B.

% Ejercicio 7

deducir1Pasada(nono(M,RS)) :- 
		dame_restricciones(M,RS,ResF,ResC),%obtengo las restricciones de las filas y de las columnas.
		deducirPasadaAux(M,ResF),
		transponer(M,MTranspuesta),%transponemos filas y columnas.
		deducirPasadaAux(MTranspuesta,ResC).

deducirPasadaAux([],[]).
deducirPasadaAux([Celdas|MT],[r(Res,Celdas)|Ls]):-%al estar en orden, unificamos las filas de la matriz con la fila correspondiente de la restriccion.
		pintarObligatorias(r(Res,Celdas)),
		deducirPasadaAux(MT,Ls).

% Predicado dado
cantidadVariablesLibres(T, N) :- term_variables(T, LV), length(LV, N).

% Predicado dado
deducirVariasPasadas(NN) :-
	NN = nono(M,_),
	cantidadVariablesLibres(M, VI), % VI = cantidad de celdas sin instanciar en M en este punto
	deducir1Pasada(NN),
	cantidadVariablesLibres(M, VF), % VF = cantidad de celdas sin instanciar en M en este punto
	deducirVariasPasadasCont(NN, VI, VF).

% Predicado dado
deducirVariasPasadasCont(_, A, A). % Si VI = VF entonces no hubo más cambios y frenamos.
deducirVariasPasadasCont(NN, A, B) :- A =\= B, deducirVariasPasadas(NN).

% Ejercicio 8
restriccionConMenosLibres(nono(_,RS),R):-
			member(R,RS),%agarramos una restriccion candidata a menos libres
			R = r(_,Celdas),
			cantidadVariablesLibres(Celdas,N),%vemos cuantas libres hay en esa fila
			N>0,%al menos una no instanciada.
			not(
				(member(R2,RS),
				R2 = r(_,Celdas2),
				cantidadVariablesLibres(Celdas2,N2),
				N2>0,
				N2<N)
			). %no existe una restricción que tenga menos variables libres.
			
			


% Ejercicio 9
resolverDeduciendo(NN) :-
		deducirVariasPasadas(NN),
		NN=nono(M,_), %unifico la matriz del nono con M
		cantidadVariablesLibres(M,0),%vemos si quedo alguna variable libre en el nono
		!.
resolverDeduciendo(NN):-
		deducirVariasPasadas(NN),
		NN=nono(M,_),
		cantidadVariablesLibres(M,X),%vemos cuantas variables libres quedan.
		X>0,%por seguridad
		restriccionConMenosLibres(NN,R),
		!,%Nos quedamos con la primer restriccion que tenga la menor cantidad de libres para evitar duplicados.
		R=r(Res,Celdas),
		pintadasValidas(r(Res,Celdas)),
		resolverDeduciendo(NN).%vemos si ya está resuelto o si hay que seguir deduciendo.
% Ejercicio 10

solucionUnica(NN) :- 
		NN=nono(M,_),
		findall(M,resolverDeduciendo(NN),ListaSoluciones),
		length(ListaSoluciones, CantSoluciones),
		CantSoluciones is 1.

% Ejercicio 11

tam(N, (F, C)) :- 
    nn(N, nono(M, _ )),
    length(M, F), % agarramos a F es la cantidad de filas
    M = [Fila| _ ], % la primera fila
    length(Fila, C). % C es cantidad de columnas de la primera fila

solucionUnicaNn(N) :- nn(N, NN), solucionUnica(NN). % los nonos (NN) con sol unica..

esDeducible(N) :- 
    nn(N, NN ), % NN es el nono N de los ejemplos
    deducirVariasPasadas(NN), % vemos si se puede dedudcir con pasadas
    NN = nono( M, _ ), % extraemos la matriz del nono
    cantidadVariablesLibres(M, 0). % quedo resuelto? 

% ejercicio 12
% Análisis de reversibilidad de replicar/3 en el segundo argumento:
%
% El predicado replicar(+Elem, +N, -Lista) NO es reversible en el segundo argumento.
% Es decir, NO funciona correctamente con replicar(+Elem, -N, +Lista).
%
% Implementación:
% replicar(_,0,[]).
% replicar(E,N,L):-N>0,M is(N-1),replicar(E,M,R),L=[E|R].
%
% Explicación:
% 1. Cuando N no está instanciado, el caso base replicar(_,0,[]) unifica correctamente
%    con N=0 y L=[].
%
% 2. Sin embargo, en la segunda cláusula, la guarda N > 0 requiere que N esté instanciado
%    para poder evaluar la comparación aritmética. Si N es una variable no instanciada,
%    Prolog arroja el error "Arguments are not sufficiently instantiated".
%
% 3. Del mismo modo, la expresión M is (N-1) también requiere que N esté instanciado
%    para poder calcular el valor de M.
%
% Por lo tanto, el predicado NO es reversible en el segundo argumento porque las
% operaciones aritméticas (>, is) exigen instanciación.
%
% Ejemplo de falla:
% ?- replicar(x, N, [x,x,x]).
% ERROR: Arguments are not sufficiently instantiated
% ERROR: In:
% ERROR:   [10] _15292>0
% ERROR:    [9] toplevel_call(user:user: ...) at /usr/lib/swi-prolog/boot/toplevel.pl:1173
%
% Para hacerlo reversible habría que usar length/2 en lugar de aritmética explícita. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              %
%    Ejemplos de nonogramas    %
%        NO MODIFICAR          %
%    pero se pueden agregar    %
%                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Fáciles
nn(0, NN) :- armarNono([[1],[2]],[[],[2],[1]], NN).
nn(1, NN) :- armarNono([[4],[2,1],[2,1],[1,1],[1]],[[4],[3],[1],[2],[3]], NN).
nn(2, NN) :- armarNono([[4],[3,1],[1,1],[1],[1,1]],[[4],[2],[2],[1],[3,1]], NN).
nn(3, NN) :- armarNono([[2,1],[4],[3,1],[3],[3,3],[2,1],[2,1],[4],[4,4],[4,2]], [[1,2,1],[1,1,2,2],[2,3],[1,3,3],[1,1,1,1],[2,1,1],[1,1,2],[2,1,1,2],[1,1,1],[1]], NN).
nn(4, NN) :- armarNono([[1, 1], [5], [5], [3], [1]], [[2], [4], [4], [4], [2]], NN).
nn(5, NN) :- armarNono([[], [1, 1], [], [1, 1], [3]], [[1], [1, 1], [1], [1, 1], [1]], NN).
nn(6, NN) :- armarNono([[5], [1], [1], [1], [5]], [[1, 1], [2, 2], [1, 1, 1], [1, 1], [1, 1]], NN).
nn(7, NN) :- armarNono([[1, 1], [4], [1, 3, 1], [5, 1], [3, 2], [4, 2], [5, 1], [6, 1], [2, 3, 2], [2, 6]], [[2, 1], [1, 2, 3], [9], [7, 1], [4, 5], [5], [4], [2, 1], [1, 2, 2], [4]], NN).
nn(8, NN) :- armarNono([[5], [1, 1], [1, 1, 1], [5], [7], [8, 1], [1, 8], [1, 7], [2, 5], [7]], [[4], [2, 2, 2], [1, 4, 1], [1, 5, 1], [1, 8], [1, 7], [1, 7], [2, 6], [3], [3]], NN).
nn(9, NN) :- armarNono([[4], [1, 3], [2, 2], [1, 1, 1], [3]], [[3], [1, 1, 1], [2, 2], [3, 1], [4]], NN).
nn(10, NN) :- armarNono([[1], [1], [1], [1, 1], [1, 1]], [[1, 1], [1, 1], [1], [1], [ 1]], NN).
nn(11, NN) :- armarNono([[1, 1, 1, 1], [3, 3], [1, 1], [1, 1, 1, 1], [8], [6], [10], [6], [2, 4, 2], [1, 1]], [[2, 1, 2], [4, 1, 1], [2, 4], [6], [5], [5], [6], [2, 4], [4, 1, 1], [2, 1, 2]], NN).
nn(12, NN) :- armarNono([[9], [1, 1, 1, 1], [10], [2, 1, 1], [1, 1, 1, 1], [1, 10], [1, 1, 1], [1, 1, 1], [1, 1, 1, 1, 1], [1, 9], [1, 2, 1, 1, 2], [2, 1, 1, 1, 1], [2, 1, 3, 1], [3, 1], [10]], [[], [9], [2, 2], [3, 1, 2], [1, 2, 1, 2], [3, 11], [1, 1, 1, 2, 1], [1, 1, 1, 1, 1, 1], [3, 1, 3, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 3, 1, 1], [3, 1, 1, 1, 1], [1, 1, 2, 1], [11], []], NN).
nn(13, NN) :- armarNono([[2], [1,1], [1,1], [1,1], [1], [], [2], [1,1], [1,1], [1,1], [1]], [[1], [1,3], [3,1,1], [1,1,3], [3]], NN).
nn(14, NN) :- armarNono([[1,1], [1,1], [1,1], [2]], [[2], [1,1], [1,1], [1,1]], NN).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              %
%    Predicados auxiliares     %
%        NO MODIFICAR          %
%                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%! completar(+S)
%
% Indica que se debe completar el predicado. Siempre falla.
completar(S) :- write("COMPLETAR: "), write(S), nl, fail.

%! mostrarNono(+NN)
%
% Muestra una estructura nono(...) en pantalla
% Las celdas x (pintadas) se muestran como ██.
% Las o (no pintasdas) se muestran como ░░.
% Las no instanciadas se muestran como ¿?.
mostrarNono(nono(M,_)) :- mostrarMatriz(M).

%! mostrarMatriz(+M)
%
% Muestra una matriz. Solo funciona si las celdas
% son valores x, o, o no instanciados.
mostrarMatriz(M) :-
	M = [F|_], length(F, Cols),
	mostrarBorde('╔',Cols,'╗'),
	maplist(mostrarFila, M),
	mostrarBorde('╚',Cols,'╝').

mostrarBorde(I,N,F) :-
	write(I),
	stringRepeat('══', N, S),
	write(S),
	write(F),
	nl.

stringRepeat(_, 0, '').
stringRepeat(Str, N, R) :- N > 0, Nm1 is N - 1, stringRepeat(Str, Nm1, Rm1), string_concat(Str, Rm1, R).

%! mostrarFila(+M)
%
% Muestra una lista (fila o columna). Solo funciona si las celdas
% son valores x, o, o no instanciados.
mostrarFila(Fila) :-
	write('║'),
	maplist(mostrarCelda, Fila),
	write('║'),
	nl.

mostrarCelda(C) :- nonvar(C), C = x, write('██').
mostrarCelda(C) :- nonvar(C), C = o, write('░░').
mostrarCelda(C) :- var(C), write('¿?').
