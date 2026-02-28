Paradigmas (de Lenguajes) de Programaci´on

Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

7 de noviembre de 2025

# Nomenclatura para patrones de instanciaci´on

Por convenci´on se aclara mediante prefijos en los comentarios:

1 $\mathtt { p } ( { + } \mathtt { A } )$ indica que A debe proveerse instanciado.

p(-A) indica que A no debe estar instanciado.

p(?A) indica que A puede o no proveerse instanciado.

Existe un ´ultimo caso en donde un argumento puede aparecer sem instanciado (es decir, contiene variables libres), por ejemplo: [p,r,o,X,o, ] unifica con [p,r,o,l,o,g] pero no con [] o prolog.

# Nomenclatura para patrones de instanciaci´on

Por convenci´on se aclara mediante prefijos en los comentarios:

$\mathtt { p } ( { + } \mathtt { A } )$ indica que A debe proveerse instanciado.   
p(-A) indica que A no debe estar instanciado.   
p(?A) indica que A puede o no proveerse instanciado.   
Existe un ´ultimo caso en donde un argumento puede aparecer semi instanciado (es decir, contiene variables libres), por ejemplo: [p,r,o,X,o, ] unifica con [p,r,o,l,o,g] pero no con [] o prolog.

# Predicados ´utiles

var(A) tiene ´exito si A es una variable libre.   
nonvar(A) tiene ´exito si A no es una variable libre.   
ground(A) tiene ´exito si A no contiene variables libres.

# Ejercicio: i´esimo

Implementar el predicado iesimo $( + \mathbb { I }$ , $+ \mathbb { L }$ , -X), donde X es el i´esimo elemento de la lista L.

# Ejercicio: i´esimo

Implementar el predicado iesimo $( + \mathbb { I }$ , $+ \mathbb { L }$ , -X), donde X es el i´esimo elemento de la lista L.

¿Es nuestra implementaci´on reversible en I? Si no lo es, hacer una versi´on reversible.

# El predicado desde.

desde(X, X).   
desde(X, Y) :- N is ${ \tt X } { + } 1$ , desde(N, Y).

# El predicado desde.

desde(X, X).   
desde(X, Y) :- N is ${ \tt X } { + } 1$ , desde(N, Y).

# Ejercicio: desde

¿C´omo deben instanciarse los par´ametros para que el predicado funcione? (es decir, para que no se cuelgue ni produzca un error). ¿Por qu´e?

# El predicado desde.

desde(X, X).   
desde(X, Y) :- N is ${ \tt X } { + } 1$ , desde(N, Y).

# Ejercicio: desde

¿C´omo deben instanciarse los par´ametros para que el predicado funcione? (es decir, para que no se cuelgue ni produzca un error). ¿Por qu´e?

Implementar el predicado desdeReversible( $+ \tt X$ ,?Y) tal que si Y est´a instanciada, sea verdadero si Y es mayor o igual que X, y si no lo est´a, genere todos los Y de X en adelante.

Definir el predicado pmq( $( + \tt X$ , -Y) que genera todos los naturales pares menores o iguales a X.

R is X mod Y unifica R con el resto de dividir X por Y.

Una t´ecnica que usaremos muy a menudo es:

1 Generar todas las posibles soluciones de un problema. (L´ease, los candidatos a soluci´on, seg´un cierto criterio general)

2 Testear cada una de las soluciones generadas.

(Hacer que fallen los candidatos que no cumplan cierto criterio particular)

La idea se basa fuertemente en el orden en que se procesan las reglas.

![](images/72a6e0592f970e6e87e36257cd948c0c1169cfb51a5562efdb4986cb9336a06d.jpg)

# Esquema general de Generate & Test

Un predicado que usa el esquema G&T se define mediante otros dos:

pred(X1,...,Xn) :- generate(X1, ...,Xm), test(X1, ...,Xm).

Esta divisi´on de tareas implica que:

generate(...) deber´a instanciar ciertas variables.

test(...) deber´a verificar si los valores intanciados pertenecen a la soluci´on, pudiendo para ello asumir que ya est´a instanciada.

# Ejercicio

Definir el predicado coprimos(-X, -Y) que instancia en X e Y todos los pares de n´umeros coprimos.

Tip: utilizar la funci´on gcd del motor aritm´etico. X is gcd(15, 8) instancia ${ \tt X } { = } 1$ , por lo que 15 y 8 son coprimos.

# Ejercicio

Definir el predicado coprimos(-X, -Y) que instancia en X e Y todos los pares de n´umeros coprimos.

Tip: utilizar la funci´on gcd del motor aritm´etico. X is gcd(15, 8) instancia ${ \tt X } { = } 1$ , por lo que 15 y 8 son coprimos.

¿Es reversible en X e Y? Justificar.

# Algunos hechos sobre la tragedia de Edipo

progenitorx(yocasta,edipo).   
progenitorx(yocasta,ant´ıgona).   
progenitorx(edipo,ant´ıgona).

abuela(X,Y) :- progenitorx(X,Z), progenitorx(Z,Y).

pariente(X,Y) :- progenitorx(X,Y). pariente(X,Y) :- abuela(X,Y)

# Soluciones repetidas

# Algunos hechos sobre la tragedia de Edipo

progenitorx(yocasta,edipo).   
progenitorx(yocasta,ant´ıgona).   
progenitorx(edipo,ant´ıgona).

# Consulta

abuela(X,Y) :- progenitorx(X,Z), progenitorx(Z,Y).

pariente(X,Y) :- progenitorx(X,Y). pariente(X,Y) :- abuela(X,Y)

?- pariente(yocasta,X).

# Algunos hechos sobre la tragedia de Edipo

progenitorx(yocasta,edipo).   
progenitorx(yocasta,ant´ıgona).   
progenitorx(edipo,ant´ıgona).

abuela(X,Y) :- progenitorx(X,Z), progenitorx(Z,Y).

pariente(X,Y) :- progenitorx(X,Y). pariente(X,Y) :- abuela(X,Y)

# Consulta

?- pariente(yocasta,X).

# Resultados

$=$ edipo;

# Algunos hechos sobre la tragedia de Edipo

progenitorx(yocasta,edipo).   
progenitorx(yocasta,ant´ıgona).   
progenitorx(edipo,ant´ıgona).

abuela(X,Y) :- progenitorx(X,Z), progenitorx(Z,Y).

pariente(X,Y) :- progenitorx(X,Y). pariente(X,Y) :- abuela(X,Y)

# Consulta

?- pariente(yocasta,X).

# Resultados

X = edipo;   
X = ant´ıgona;

# Algunos hechos sobre la tragedia de Edipo

progenitorx(yocasta,edipo).   
progenitorx(yocasta,ant´ıgona).   
progenitorx(edipo,ant´ıgona).

abuela(X,Y) :- progenitorx(X,Z), progenitorx(Z,Y).

pariente(X,Y) :- progenitorx(X,Y). pariente(X,Y) :- abuela(X,Y)

# Consulta

?- pariente(yocasta,X).

# Resultados

X = edipo;   
X = ant´ıgona;   
$\texttt { X } =$ ant´ıgona;

# Algunos hechos sobre la tragedia de Edipo

progenitorx(yocasta,edipo).   
progenitorx(yocasta,ant´ıgona).   
progenitorx(edipo,ant´ıgona).

abuela(X,Y) :- progenitorx(X,Z), progenitorx(Z,Y).

pariente(X,Y) :- progenitorx(X,Y). pariente(X,Y) :- abuela(X,Y)

¿Razonable o err´oneo?

# Consulta

?- pariente(yocasta,X).

# Resultados

X = edipo;   
$\texttt { X } =$ ant´ıgona;   
$\texttt { X } =$ ant´ıgona;   
false.

# Algunos hechos sobre la tragedia de Edipo

progenitorx(yocasta,edipo).   
progenitorx(yocasta,ant´ıgona).   
progenitorx(edipo,ant´ıgona).

abuela(X,Y) :- progenitorx(X,Z), progenitorx(Z,Y).

pariente(X,Y) :- progenitorx(X,Y). pariente(X,Y) :- abuela(X,Y)

# Consulta

?- pariente(yocasta,X).

# Resultados

X = edipo;   
$\texttt { X } =$ ant´ıgona;   
$\texttt { X } =$ ant´ıgona;   
false.

¿Razonable o err´oneo?

¿C´omo hacer para evitar repeticiones no deseadas?

# El metapredicado not

# Definici´on

not(P) :- call(P), !, fail.   
not(P).

# El metapredicado not

# Definici´on

not(P) :- call(P), !, fail.   
not(P).

not(p(X1, ..., Xn)) tiene ´exito si no existe instanciaci´on posible para las variables no instanciadas en $\{ \mathtt { X } 1 \ldots \mathtt { X } \mathtt { n } \}$ que haga que P tenga ´exito.

el not no deja instanciadas las variables libres luego de su ejecuci´on.

# C´omo evitar soluciones repetidas

Una buena idea: usando cl´ausulas excluyentes.

# Algunos hechos sobre la tragedia de Edipo

progenitorx(yocasta,edipo).   
progenitorx(yocasta,ant´ıgona).   
progenitorx(edipo,ant´ıgona).

abuela(X,Y) :- progenitorx(X,Z), progenitorx(Z,Y).

pariente(X,Y) :- progenitorx(X,Y), not(abuela(X,Y)).   
pariente(X,Y) :- abuela(X,Y).

# C´omo evitar soluciones repetidas

Una buena idea: usando cl´ausulas excluyentes.

# Algunos hechos sobre la tragedia de Edipo

progenitorx(yocasta,edipo).   
progenitorx(yocasta,ant´ıgona).   
progenitorx(edipo,ant´ıgona).

abuela(X,Y) :- progenitorx(X,Z), progenitorx(Z,Y).

pariente(X,Y) :- progenitorx(X,Y), not(abuela(X,Y)).   
pariente(X,Y) :- abuela(X,Y).

# ¡Esto no funciona! ¿Por qu´e?

pariente(X,Y) :- not(abuela(X,Y)), progenitorx(X,Y).   
pariente(X,Y) :- abuela(X,Y).

# Negaci´on por Falla

# Ejercicio

Definir el predicado corteM´asParejo $\cdot { + \mathbb { L } }$ ,-L1,-L2) donde L es una lista de n´umeros, y L1 y L2 representan el corte m´as parejo posible de L respecto a la suma de sus elementos (predicado sumlist/2). Puede haber m´as de un resultado.

# Negaci´on por Falla

# Ejercicio

Definir el predicado corteM´asParejo $\cdot { + \mathbb { L } }$ ,-L1,-L2) donde L es una lista de n´umeros, y L1 y L2 representan el corte m´as parejo posible de L respecto a la suma de sus elementos (predicado sumlist/2). Puede haber m´as de un resultado.

corteM´asParejo([1,2,3,4,2],I,D). ⇝ I = [1, 2, 3], $\mathrm { ~ D ~ } =$ [4, 2] ; false.   
corteM´asParejo([1,2,1],I,D). $ { \mathcal { W } }  { \mathrm { ~ T ~ } } = \ [ 1 ]$ , $\tt { D } = \psi [ 2$ , 1] ; I = [1, 2], D = [1] ; false.

# Negaci´on por Falla

# Ejercicio

Definir el predicado corteM´asParejo $\cdot { + \mathbb { L } }$ ,-L1,-L2) donde L es una lista de n´umeros, y L1 y L2 representan el corte m´as parejo posible de L respecto a la suma de sus elementos (predicado sumlist/2). Puede haber m´as de un resultado.

corteM´asParejo([1,2,3,4,2],I,D). ⇝ I = [1, 2, 3], $\mathrm { ~ D ~ } =$ [4, 2] ; false.   
corteM´asParejo([1,2,1],I,D). ⇝ I = [1], $\tt { D } = \psi [ 2$ , 1] ; I = [1, 2], D = [1] ; false.

Tip: Definir un predicado auxiliar unCorte(+L,?L1,?L2,-D) que genera todos los cortes posibles de L en L1 y L2. En D se unifica la diferencia absoluta entre las sumas de L1 y L2.

# Negaci´on por Falla

# Ejercicio

Definir el predicado pr´oximoPrimo( $( + \mathbb { N }$ ,-P) que instancia en P el siguiente n´umero primo a partir de N.

# Negaci´on por Falla

# Ejercicio

Definir el predicado pr´oximoPrimo( $\cdot + \mathbb { N }$ ,-P) que instancia en P el siguiente n´umero primo a partir de N.

pr´oximoPrimo(32,P). ⇝ P = 37; false.   
pr´oximoPrimo(37,P). $\ r  \textsf { P } = \ 4 1$ ; false. setof(-Var, +Goal, -Set)   
unifica Set con la lista ordenada y sin repetidos de Var que satisfacen Goal.

# Otros metapredicados

setof(-Var, +Goal, -Set)   
unifica Set con la lista ordenada y sin repetidos de Var que satisfacen Goal.

# Uso

setof(X, p(X), L) instancia L en el conjunto de X tales que p(X).

# Otros metapredicados

setof(-Var, +Goal, -Set)   
unifica Set con la lista ordenada y sin repetidos de Var que satisfacen Goal.

# Uso

setof(X, p(X), L) instancia L en el conjunto de X tales que p(X).

Un ejemplo:

primeraComponente([(X, )| ],X).   
primeraComponente([ |XS],X) :- primeraComponente(XS,X).

# Otros metapredicados

setof(-Var, +Goal, -Set)   
unifica Set con la lista ordenada y sin repetidos de Var que satisfacen Goal.

# Uso

setof(X, p(X), L) instancia L en el conjunto de X tales que p(X).

Un ejemplo:

primeraComponente([(X, )| ],X).   
primeraComponente([ |XS],X) :- primeraComponente(XS,X).

?- setof(X,primeraComponente([(2,2),(1,3),(1,4)],X),L).

# Otros metapredicados

setof(-Var, +Goal, -Set)   
unifica Set con la lista ordenada y sin repetidos de Var que satisfacen Goal.

# Uso

setof(X, p(X), L) instancia L en el conjunto de X tales que p(X).

Un ejemplo:

primeraComponente([(X, )| ],X).   
primeraComponente([ |XS],X) :- primeraComponente(XS,X). ?- setof(X,primeraComponente([(2,2),(1,3),(1,4)],X),L).   
$\mathrm { ~ L ~ } = \ \left[ 1 , 2 \right]$ . bagof(-Var, +Goal, -Set)   
igual que setof pero la lista mantiene el orden en el que obtiene las soluciones y puede tener repetidos.

# Otros metapredicados

bagof(-Var, +Goal, -Set)

igual que setof pero la lista mantiene el orden en el que obtiene las soluciones y puede tener repetidos.

# Uso

bagof(X, p(X), L) instancia L en el conjunto de X tales que p(X).

bagof(-Var, +Goal, -Set)

igual que setof pero la lista mantiene el orden en el que obtiene las soluciones y puede tener repetidos.

# Uso

bagof(X, p(X), L) instancia L en el conjunto de X tales que p(X).

Un ejemplo:

primeraComponente([(X, )| ],X).   
primeraComponente([ |XS],X) :- primeraComponente(XS,X).

?- bagof(X,primeraComponente([(2,2),(1,3),(1,4)],X),L).

bagof(-Var, +Goal, -Set)

igual que setof pero la lista mantiene el orden en el que obtiene las soluciones y puede tener repetidos.

# Uso

bagof(X, p(X), L) instancia L en el conjunto de X tales que p(X).

Un ejemplo:

primeraComponente([(X, )| ],X).   
primeraComponente([ |XS],X) :- primeraComponente(XS,X). ?- bagof(X,primeraComponente([(2,2),(1,3),(1,4)],X),L).   
$\mathrm { ~ \cal ~ L ~ } = \mathrm { ~ \ o ~ { ~ [ } ~ } 2 , 1 , 1 ]$ .

# Otros metapredicados

findall(-Var, +Goal, -Set)

igual que bagof pero ignora otras variables libres dentro del Goal que no sea Var. Adem´as devuelve la lista vac´ıa si no existen soluciones.

# Otros metapredicados

findall(-Var, +Goal, -Set)

igual que bagof pero ignora otras variables libres dentro del Goal que no sea Var. Adem´as devuelve la lista vac´ıa si no existen soluciones.

# Uso

findall(X, p(X), L) instancia L en el conjunto de X tales que p(X).

# Otros metapredicados

findall(-Var, +Goal, -Set)

igual que bagof pero ignora otras variables libres dentro del Goal que no sea Var. Adem´as devuelve la lista vac´ıa si no existen soluciones.

# Uso

findall(X, p(X), L) instancia L en el conjunto de X tales que p(X).

Un ejemplo: ?- findall(X, member((X,Y),[(1,2),(3,4)]),L).

# Otros metapredicados

findall(-Var, +Goal, -Set)

igual que bagof pero ignora otras variables libres dentro del Goal que no sea Var. Adem´as devuelve la lista vac´ıa si no existen soluciones.

# Uso

findall(X, p(X), L) instancia L en el conjunto de X tales que p(X).

Un ejemplo:

?- findall(X, member((X,Y),[(1,2),(3,4)]),L).   
$\mathrm { ~ \cal ~ L ~ } = \mathrm { ~ \ o ~ { ~ [ 1 ~ , 3 ] ~ } ~ }$ .

maplist(+Goal, ?List) es verdadero cuando el Goal satisface a todos los elementos de la lista

# Otros metapredicados

maplist(+Goal, ?List) es verdadero cuando el Goal satisface a todos los elementos de la lista

# Uso

esPar(X) :- mod(X,2) $\mathit { \Theta } = : = \mathit { \Theta } 0$ .   
uno(1).

?- maplist(esPar,[2,6,8]).

# Otros metapredicados

maplist(+Goal, ?List) es verdadero cuando el Goal satisface a todos los elementos de la lista

# Uso

esPar(X) :- mod(X,2) $\mathit { \Theta } = : = \mathit { \Theta } 0$ .   
uno(1).

?- maplist(esPar,[2,6,8]).

# Otros metapredicados

maplist(+Goal, ?List) es verdadero cuando el Goal satisface a todos los elementos de la lista

# Uso

esPar(X) :- mod(X,2) $\mathit { \Theta } = : = \mathit { \Theta } 0$ .   
uno(1).

?- maplist(esPar,[2,6,8]).

?- length(L,4), maplist(uno,L).

# Otros metapredicados

maplist(+Goal, ?List) es verdadero cuando el Goal satisface a todos los elementos de la lista

# Uso

esPar(X) :- mod(X,2) $\mathit { \Theta } = : = \mathit { \Theta } 0$ .   
uno(1).

?- maplist(esPar,[2,6,8]).

?- length(L,4), maplist(uno,L).   
L = [1, 1, 1, 1].

# Otros metapredicados

maplist(+Goal, ?List) es verdadero cuando el Goal satisface a todos los elementos de la lista

# Uso

esPar(X) :- mod(X,2) $\mathit { \Theta } = : = \mathit { \Theta } 0$ .   
uno(1).

?- maplist(esPar,[2,6,8]).

?- length(L,4), maplist(uno,L).   
L = [1, 1, 1, 1].

maplist(+Goal, ?List1, ?List2) es verdadero cuando el Goal satisface a todos los elementos de las listas

# Otros metapredicados

maplist(+Goal, ?List1, ?List2) es verdadero cuando el Goal satisface a todos los elementos de las listas

# Uso

sumarK(K,X,Y) :- Y is $x { + } K$ .

?- maplist(sumarK(4),[1,2,3],L).

maplist(+Goal, ?List1, ?List2) es verdadero cuando el Goal satisface a todos los elementos de las listas

# Uso

sumarK(K,X,Y) :- Y is $x { + } K$ .

?- maplist(sumarK(4),[1,2,3],L).   
$\mathrm { ~ L ~ } =$ [5,6,7].

# Otros metapredicados

limit(+Count,+Goal) limita el n´umero de soluciones del Goal.

# Otros metapredicados

limit(+Count,+Goal) limita el n´umero de soluciones del Goal.

# Uso

?- limit(5,desde(1,X)).

# Otros metapredicados

limit(+Count,+Goal) limita el n´umero de soluciones del Goal.

# Uso

?- limit(5,desde(1,X)).

$\texttt { X } = \texttt { 1 }$ $\tt { X } = \tt { 2 }$ $\tt { X } = \tt { 3 }$ $\tt { X } = \tt { 4 }$

# Otros metapredicados

forall(+Gen,+Cond) verifica que todas las soluciones de Gen satisfagan Cond.

# Otros metapredicados

forall(+Gen,+Cond) verifica que todas las soluciones de Gen satisfagan Cond.

# Uso

unCorte(L,L1,L2,D), forall(unCorte(L, , ,D2),D2 >= D).

# Generaci´on infinita: tri´angulos

Suponiendo que los tri´angulos se representan con tri(A,B,C) cuyos lados tienen longitudes A, B y C respectivamente. Se asume que las longitudes de los lados son siempre n´umeros naturales mayores a cero. Se cuenta con el predicado esTriangulo(+T) que es verdadero cuando T es una estructura de la forma tri(A,B,C) que representa un tri´angulo v´alido (cada lado es menor que la suma de los otros dos, y mayor que su diferencia).

# Generaci´on infinita: tri´angulos

Suponiendo que los tri´angulos se representan con tri(A,B,C) cuyos lados tienen longitudes A, B y C respectivamente. Se asume que las longitudes de los lados son siempre n´umeros naturales mayores a cero. Se cuenta con el predicado esTriangulo(+T) que es verdadero cuando T es una estructura de la forma tri(A,B,C) que representa un tri´angulo v´alido (cada lado es menor que la suma de los otros dos, y mayor que su diferencia).

# Ejercicio

Implementar un predicado per´ımetro(?T,?P) que es verdadero cuando T es un tri´angulo y P es su per´ımetro. No se deben generar resultados repetidos (no tendremos en cuenta la congruencia entre tri´angulos: si dos tri´angulos tienen las mismas longitudes, pero en diferente orden, se considerar´an diferentes entre s´ı). El predicado debe funcionar para cualquier instanciaci´on de T y P (no es necesario que funcione para tri´angulos parcialmente instanciados).

# Generaci´on infinita: tri´angulos

Suponiendo que los tri´angulos se representan con tri(A,B,C) cuyos lados tienen longitudes A, B y C respectivamente. Se asume que las longitudes de los lados son siempre n´umeros naturales mayores a cero. Se cuenta con el predicado esTriangulo(+T) que es verdadero cuando T es una estructura de la forma tri(A,B,C) que representa un tri´angulo v´alido (cada lado es menor que la suma de los otros dos, y mayor que su diferencia).

# Ejercicio

Implementar un predicado per´ımetro(?T,?P) que es verdadero cuando T es un tri´angulo y P es su per´ımetro. No se deben generar resultados repetidos (no tendremos en cuenta la congruencia entre tri´angulos: si dos tri´angulos tienen las mismas longitudes, pero en diferente orden, se considerar´an diferentes entre s´ı). El predicado debe funcionar para cualquier instanciaci´on de T y P (no es necesario que funcione para tri´angulos parcialmente instanciados).

Implementar un generador de tri´angulos v´alidos, sin repetir resultados: tri´angulo(-T).

¿ ¿ ¿ ¿ ¿ ¿Preguntas? ? ? ? ? ?