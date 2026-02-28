# Programaci´on L´ogica - Parte 1

Paradigmas de Lenguajes de Programaci´on

Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

31 de octubre de 2025

![](images/76b81948e7d472ca4cd4fb37c5ac3b7eb6ce7a538cf1218573a2df33c6f6faff.jpg)

# La programacion declarativa es + MANIFESTAR\* pero con codigo

Lenguaje de programaci´on l´ogica.

Los programas se escriben en un subconjunto de la l´ogica de primer orden. Es declarativo: se especifican hechos, reglas de inferencia y objetivos, sin indicar c´omo se obtiene este ´ultimo a partir de los primeros. C´omputo basado en cl´ausulas de Horn y resoluci´on SLD. Mundo cerrado: s´olo se puede suponer lo que se declar´o expl´ıcitamente, todo lo que no pueda deducirse a partir del programa se supone falso. Tiene un solo tipo: los t´erminos.

# Bases de conocimiento

Podemos pensar los programas en Prolog como bases de conocimiento que describen el dominio del problema. Est´an formados por hechos y reglas de inferencia. Se utilizan realizando consultas sobre dicha base.

# Bases de conocimiento

Podemos pensar los programas en Prolog como bases de conocimiento que describen el dominio del problema. Est´an formados por hechos y reglas de inferencia. Se utilizan realizando consultas sobre dicha base.

# Base de conocimiento

Juan y Valeria son zombies.   
Carlos tom´o mate despu´es de Juan. Juan tom´o mate despu´es de Clara.   
Ernesto est´a infectado, aunque no sabemos por qu´e.   
Les zombies est´an infectades.   
Si alguien (X) tom´o mate despu´es de otre (Y) zombie, entonces X est´a infectade.

# Bases de conocimiento

Podemos pensar los programas en Prolog como bases de conocimiento que describen el dominio del problema. Est´an formados por hechos y reglas de inferencia. Se utilizan realizando consultas sobre dicha base.

# Base de conocimiento

Juan y Valeria son zombies.   
Carlos tom´o mate despu´es de Juan. Juan tom´o mate despu´es de Clara.   
Ernesto est´a infectado, aunque no sabemos por qu´e.   
Les zombies est´an infectades.   
Si alguien (X) tom´o mate despu´es de otre (Y) zombie, entonces X est´a infectade.

¿Qu´e consultas podr´ıamos hacer sobre esta base?

# Bases de conocimiento

Podemos pensar los programas en Prolog como bases de conocimiento que describen el dominio del problema. Est´an formados por hechos y reglas de inferencia. Se utilizan realizando consultas sobre dicha base.

# Base de conocimiento

Juan y Valeria son zombies.   
Carlos tom´o mate despu´es de Juan. Juan tom´o mate despu´es de Clara.   
Ernesto est´a infectado, aunque no sabemos por qu´e.   
Les zombies est´an infectades.   
Si alguien (X) tom´o mate despu´es de otre (Y) zombie, entonces X est´a infectade.

¿Qu´e consultas podr´ıamos hacer sobre esta base?

# Consultas

¿Est´a Carlos infectado? ¿Est´a Clara infectada? ¿Qui´enes est´an infectades?

# Cl´ausulas y Consultas

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).

# Cl´ausulas y Consultas

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).

![](images/e2d246df4e3f47837357ba2950e888a90c8ec490687c205d8ea938c14c85a8ca.jpg)

# Cl´ausulas y Consultas

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X). ?- zombie(juan).   
true.

# Cl´ausulas y Consultas

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X). ?- zombie(juan).   
true.

?- tomo mate despues(juan,X).

# Cl´ausulas y Consultas

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X). ?- zombie(juan).   
true. ?- tomo mate despues(juan,X).   
X = carlos.

# Cl´ausulas y Consultas

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X). ?- zombie(juan).   
true. ?- tomo mate despues(juan,X).   
X = carlos.

?- infectade(I).

# Cl´ausulas y Consultas

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X). ?- zombie(juan).   
true. ?- tomo mate despues(juan,X).   
X = carlos. ?- infectade(I).   
I = ernesto;

# Cl´ausulas y Consultas

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X). ?- zombie(juan).   
true. ?- tomo mate despues(juan,X).   
X = carlos. ?- infectade(I).   
I = ernesto;   
I = juan;

# Cl´ausulas y Consultas

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X). ?- zombie(juan).   
true. ?- tomo mate despues(juan,X).   
X = carlos. ?- infectade(I).   
I = ernesto;   
I = juan;   
I = valeria;

# Cl´ausulas y Consultas

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X). ?- zombie(juan).   
true. ?- tomo mate despues(juan,X).   
X = carlos.

- infectade(I). ernesto; T = juan; = valeria; I = carlos;

# Cl´ausulas y Consultas

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X). ?- zombie(juan).   
true. ?- tomo mate despues(juan,X).   
X = carlos. ?- infectade(I).   
ernesto;   
T = juan;   
I = valeria;   
I = carlos;   
false.

# Seguimiento de la consulta

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).

?- infectade(I).

# Seguimiento de la consulta

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).

?- infectade(I).

.{I := ernesto}

# Seguimiento de la consulta

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).

# Seguimiento de la consulta

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).

![](images/063736fa85febbfb1c074cd0123fcd64023e78093a3e97a2986ec55ef8ff17e7.jpg)

# Seguimiento de la consulta

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).

![](images/778a7c58b188114de877bf11a518c87e160975e6dad1454043396f27946108e8.jpg)

# Seguimiento de la consulta

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).

![](images/8978049410a825a9d3c25406bb3c0ccb53349532946fb00178d5cd7e072e7ef8.jpg)

# Seguimiento de la consulta

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).

![](images/ba841943dbef9810ebb37ad7b7a234825d7d6f73ec063843f5f3ee422edf4af2.jpg)

# Seguimiento de la consulta

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).

![](images/b46215a325fdbe837023803b72d7850e7cabbc9d3ac4dbeb279c037c785f91c6.jpg)

# Seguimiento de la consulta

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).

![](images/e02ccaeb23640ddca06a63369bbc692081b7b2940c512a72e7552a5ad84ede00.jpg)

# Seguimiento de la consulta

zombie(juan).   
zombie(valeria). tomo_mate_despues(juan,carlos).   
tomo_mate_despues(clara,juan). infectade(ernesto).   
infectade(X) :- zombie(X).   
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).

![](images/f25b193e5a6d8bf9d72afb3b319adc90b163ac80d3f6bc70129ce7ece75ff6c3.jpg)

# Herramientas de Prolog

Descargar https://www.swi-prolog.org (Download → SWI-Prolog → Stable release)   
swipl archivo.pl para iniciar el int´erprete con cierto archivo cargado. swipl y luego ?- [archivo]. para cargarlo una vez dentro del int´erprete. ?- make. para recargar cambios de archivos.   
?- consulta. para evaluar una consulta.   
; para ver la siguiente soluci´on.   
. para dejar de listar soluciones.   
CTRL+D o ?- halt. para salir del int´erprete.   
?- E. quiz´as para re´ırse.   
:- use_module(archivo). para importar un archivo dentro de otro. % comentario o %! documentaci´on   
?- help(predicado). para ver la documentaci´on de un predicado.

。 Variables: X, Persona, _var Valores que todav´ıa no fueron ligados. Despu´es de ligarse ya no pueden ser modificadas. Empiezan con may´uscula o .

Variables: X, Persona, _var Valores que todav´ıa no fueron ligados. Despu´es de ligarse ya no pueden ser modificadas. Empiezan con may´uscula o .

N´umeros: 10, 15.6

Variables: X, Persona, _var Valores que todav´ıa no fueron ligados. Despu´es de ligarse ya no pueden ser modificadas. Empiezan con may´uscula o .

N´umeros: 10, 15.6

Atomos:´ zombie, ’hola␣mundo’, cero, nil Constantes, texto. Empiezan con min´uscula o est´an entre comillas simples.

Variables: X, Persona, _var Valores que todav´ıa no fueron ligados. Despu´es de ligarse ya no pueden ser modificadas. Empiezan con may´uscula o .

N´umeros: 10, 15.6

Atomos: ´ zombie, ’hola␣mundo’, cero, nil Constantes, texto. Empiezan con min´uscula o est´an entre comillas simples.

T´erminos compuestos: suc(cero), bin(nil,1,nil), suc(X) Tambi´en llamado estructura. Consiste en un nombre seguido de $n$ argumentos, cada uno de los cuales es un t´ermino. Decimos que $n$ es la aridad del t´ermino compuesto. Pueden tener variables como argumentos.

# Sintaxis de Prolog

T´ermino: variable, n´umero, ´atomo o t´ermino compuesto.

# Sintaxis de Prolog

T´ermino: variable, n´umero, ´atomo o t´ermino compuesto. Cl´ausula: es una l´ınea del programa. Termina con punto. Puede ser:

# Sintaxis de Prolog

T´ermino: variable, n´umero, ´atomo o t´ermino compuesto. Cl´ausula: es una l´ınea del programa. Termina con punto. Puede ser: Hecho: zombie(juan).

# Sintaxis de Prolog

T´ermino: variable, n´umero, ´atomo o t´ermino compuesto.

Cl´ausula: es una l´ınea del programa. Termina con punto. Puede ser:

Hecho: zombie(juan).

Regla: infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).   
El s´ımbolo :- se puede pensar como un $\Leftarrow$ , y las comas como ∧.

# Sintaxis de Prolog

T´ermino: variable, n´umero, ´atomo o t´ermino compuesto.

Cl´ausula: es una l´ınea del programa. Termina con punto. Puede ser:

Hecho: zombie(juan).

Regla: infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).   
El s´ımbolo :- se puede pensar como un $\Leftarrow$ , y las comas como ∧.

Predicado: colecci´on de cl´ausulas.

# Sintaxis de Prolog

T´ermino: variable, n´umero, ´atomo o t´ermino compuesto.

Cl´ausula: es una l´ınea del programa. Termina con punto. Puede ser:

Hecho: zombie(juan).

Regla: infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).   
El s´ımbolo :- se puede pensar como un $\Leftarrow$ , y las comas como ∧.

Predicado: colecci´on de cl´ausulas.

Objetivo (goal): es el predicado que se consulta al motor de Prolog. Por ejemplo: infectade(X), tomo_mate_despues(X,Y).

# Ejercicios

Vamos a representar a los naturales (incluyendo el 0) como cero y suc(X). Consideremos el siguiente predicado:

natural ( cero ).natural ( suc ( X )) : - natural ( X ).

# Ejercicios

Vamos a representar a los naturales (incluyendo el 0) como cero y suc(X). Consideremos el siguiente predicado:

natural ( cero ).natural ( suc ( X )) : - natural ( X ).

Escribir los siguiente predicados

mayorA2(X) que es verdadero cuando X es mayor que 2.

# Ejercicios

Vamos a representar a los naturales (incluyendo el 0) como cero y suc(X). Consideremos el siguiente predicado:

natural ( cero ).natural ( suc ( X )) : - natural ( X ).

Escribir los siguiente predicados

mayorA2(X) que es verdadero cuando X es mayor que 2.

esPar(X) que es verdadero cuando X es par.

# Ejercicios

Vamos a representar a los naturales (incluyendo el 0) como cero y suc(X). Consideremos el siguiente predicado:

natural ( cero ).natural ( suc ( X )) : - natural ( X ).

Escribir los siguiente predicados

mayorA2(X) que es verdadero cuando X es mayor que 2.   
esPar(X) que es verdadero cuando X es par.   
menor(X,Y) que es verdadero cuando X es menor que Y.

# Ejercicios

Vamos a representar a los naturales (incluyendo el 0) como cero y suc(X). Consideremos el siguiente predicado:

natural ( cero ).natural ( suc ( X )) : - natural ( X ).

Escribir los siguiente predicados

mayorA2(X) que es verdadero cuando X es mayor que 2. esPar(X) que es verdadero cuando X es par. menor(X,Y) que es verdadero cuando X es menor que Y. Indicar qu´e ocurre si efectuamos las siguientes consultas:

menor(cero,uno).menor(cero,X).menor(suc(cero),cero).menor(X,suc(suc(suc(cero)))).menor(X,Y).

# Sustituci´on y Unificaci´on

Sea Term el conjunto formado por todos los posibles t´erminos. Una sustituci´on es una funci´on S : Variables $ T e r m$ . Podemos extender S a una funci´on Term → Term de la siguiente manera:

$$
S ( c ) = c
$$

$$
S ( f ( t _ { 1 } , . . . , t _ { n } ) ) = f ( S ( t _ { 1 } ) , . . . , S ( t _ { n } ) )
$$

Por ejemplo, si $S = \{ X : = a , Y : = Z \}$ , entonces:

$$
S ( b ( X , Y , c ) ) = b ( S ( X ) , S ( Y ) , S ( c ) ) = b ( a
$$

Usamos sustituciones obtenidas con el unificador m´as general (MGU) para igualar literales y aplicar la regla de resoluci´on.

# Sustituci´on y Unificaci´on

Dado un programa l´ogico $P$ y un goal G1, . . . , $G _ { n }$ , se quiere saber si el goal es consecuencia l´ogica de $P$ .

# Sustituci´on y Unificaci´on

Dado un programa l´ogico $P$ y un goal G1, . . . , $G _ { n }$ , se quiere saber si el goal es consecuencia l´ogica de $P$ .

La regla de resoluci´on que se utiliza es:

$$
\frac { \dots , G _ { n } } { S ( A _ { 1 } , \dots , A _ { k } , G _ { 2 } , \dots , G _ { n } ) } \dots
$$

# Sustituci´on y Unificaci´on

Dado un programa l´ogico $P$ y un goal G1, . . . , $G _ { n }$ , se quiere saber si el goal es consecuencia l´ogica de $P$ .

La regla de resoluci´on que se utiliza es:

$$
\begin{array} { r l } { \ldots , G _ { n } } & { { } \ H \ : - \ A _ { 1 } , \ldots , A _ { k } \qquad S \ \mathtt { e s } \ \mathtt { e l } \ \mathsf { M G U } } \\ { \quad } & { { } \ S ( A _ { 1 } , \ldots , A _ { k } , G _ { 2 } , \ldots , G _ { n } ) } \end{array}
$$

La conclusi´on de la regla de resoluci´on es el nuevo goal a resolver.

# Sustituci´on y Unificaci´on

Dado un programa l´ogico $P$ y un goal G1, . . . , $G _ { n }$ , se quiere saber si el goal es consecuencia l´ogica de $P$ .

La regla de resoluci´on que se utiliza es:

$$
\frac { \dots , G _ { n } } { S ( A _ { 1 } , \dots , A _ { k } , G _ { 2 } , \dots , G _ { n } ) } \dots
$$

La conclusi´on de la regla de resoluci´on es el nuevo goal a resolver.

Prolog resuelve el goal empezando desde $G _ { 1 }$ , de izquierda a derecha y haciendo DFS. Para cada $G _ { i }$ , recorre el programa de arriba hacia abajo buscando unificar $G _ { i }$ con la cabeza de una cl´ausula.

# Sustituci´on y Unificaci´on

Dado un programa l´ogico $P$ y un goal G1, . . . , $G _ { n }$ , se quiere saber si el goal es consecuencia l´ogica de $P$ .

La regla de resoluci´on que se utiliza es:

$$
\frac { \dots , G _ { n } } { S ( A _ { 1 } , \dots , A _ { k } , G _ { 2 } , \dots , G _ { n } ) } \dots
$$

La conclusi´on de la regla de resoluci´on es el nuevo goal a resolver.

Prolog resuelve el goal empezando desde $G _ { 1 }$ , de izquierda a derecha y haciendo DFS. Para cada $G _ { i }$ , recorre el programa de arriba hacia abajo buscando unificar $G _ { i }$ con la cabeza de una cl´ausula.

Tener en cuenta que el orden de las cl´ausulas y sus literales en el programa influyen en el resultado.

# Sustituci´on y Unificaci´on

Dado un programa l´ogico $P$ y un goal G1, . . . , $G _ { n }$ , se quiere saber si el goal es consecuencia l´ogica de $P$ .

La regla de resoluci´on que se utiliza es:

$$
\frac { \dots , G _ { n } } { S ( A _ { 1 } , \dots , A _ { k } , G _ { 2 } , \dots , G _ { n } ) } \dots
$$

La conclusi´on de la regla de resoluci´on es el nuevo goal a resolver.

Prolog resuelve el goal empezando desde $G _ { 1 }$ , de izquierda a derecha y haciendo DFS. Para cada $G _ { i }$ , recorre el programa de arriba hacia abajo buscando unificar $G _ { i }$ con la cabeza de una cl´ausula.

Tener en cuenta que el orden de las cl´ausulas y sus literales en el programa influyen en el resultado.

En este link hay ejemplos sobre el proceso de reducci´on de Prolog.

# Ejemplo de resoluci´on

Veamos un ejemplo. Sea el siguiente programa:

gato ( garfield ).   
tieneMascota ( john , odie ).   
tieneMascota ( john , garfield ).   
amaALosGatos ( X ) : - tieneMascota (X , Y ) , gato ( Y ).

Mostrar el seguimiento (´arbol de ejecuci´on) de la consulta: amaALosGatos(Z).

# Ejemplo de resoluci´on

¿Qu´e pasa si cambiamos el orden de algunas cl´ausulas?

gato ( garfield ).   
tieneMascota ( john , garfield ).   
tieneMascota ( john , odie ).   
amaALosGatos ( X ) : - tieneMascota (X , Y ) , gato ( Y ).

y el goal: amaALosGatos(Z).

Al evaluar un goal, los resultados posibles son los siguientes:

Al evaluar un goal, los resultados posibles son los siguientes:

true: la resoluci´on termin´o en la cl´ausula vac´ıa.

Al evaluar un goal, los resultados posibles son los siguientes:

true: la resoluci´on termin´o en la cl´ausula vac´ıa.

false: la resoluci´on termin´o en una cl´ausula que no unifica con ninguna regla del programa.

Al evaluar un goal, los resultados posibles son los siguientes:

true: la resoluci´on termin´o en la cl´ausula vac´ıa.

El proceso de aplicaci´on de la regla de resoluci´on no termina.

Un predicado define una relaci´on entre elementos. No hay par´ametros de “entrada” ni de “salida”.

Un predicado define una relaci´on entre elementos. No hay par´ametros de “entrada” ni de “salida”.

Conceptualmente, cualquier argumento podr´ıa cumplir ambos roles dependiendo de c´omo se consulte.

Un predicado define una relaci´on entre elementos. No hay par´ametros de “entrada” ni de “salida”.

Conceptualmente, cualquier argumento podr´ıa cumplir ambos roles dependiendo de c´omo se consulte.

Un predicado podr´ıa estar implementado asumiendo que ciertas variables ya est´an instanciadas, por diversas cuestiones pr´acticas.

# Patrones de instanciaci´on

El modo de instanciaci´on esperado por un predicado se comunicar´a en los comentarios.

# Patrones de instanciaci´on

El modo de instanciaci´on esperado por un predicado se comunicar´a en los comentarios.

% ! pow (+ B ,+ E , - P )   
% Es verdadero si P es igual a B elevado a E . pow (...) : -

# Patrones de instanciaci´on

El modo de instanciaci´on esperado por un predicado se comunicar´a en los comentarios.

% ! pow (+ B ,+ E , - P )   
% Es verdadero si P es igual a B elevado a E . pow (...) : -

+X -X ?X

debe estar instanciado no debe estar instanciado puede o no estar instanciado

# Patrones de instanciaci´on

El modo de instanciaci´on esperado por un predicado se comunicar´a en los comentarios.

% ! pow (+ B ,+ E , - P )   
% Es verdadero si P es igual a B elevado a E . pow (...) : -

+X -X ?X

debe estar instanciado no debe estar instanciado puede o no estar instanciado

Se debe tener en cuenta que el usuario no puede suponer m´as cosas de las que se especificaron. En caso de llamar a un predicado con argumentos instanciados de otra manera, el resultado puede no ser el esperado.

El motor de operaciones aritm´eticas de Prolog es independiente del motor l´ogico (es extra-l´ogico).

El motor de operaciones aritm´eticas de Prolog es independiente del motor l´ogico (es extra-l´ogico).

Expresi´on aritm´etica: Un n´umero.

El motor de operaciones aritm´eticas de Prolog es independiente del motor l´ogico (es extra-l´ogico).

Expresi´on aritm´etica:

Un n´umero.

Una variable ya instanciada en una expresi´on aritm´etica.

El motor de operaciones aritm´eticas de Prolog es independiente del motor l´ogico (es extra-l´ogico).

Expresi´on aritm´etica:

。 Un n´umero.

Una variable ya instanciada en una expresi´on aritm´etica.

E1+E2, E1-E2, E1\*E2, E1/E2, etc, siendo E1 y E2 expresiones aritm´eticas.

Algunos operadores aritm´eticos:

E1 < E2, $\mathtt { E 1 } ~ \mathtt { \sim } ~ \mathtt { E 2 }$ , E1 >= E2, $\mathtt { E 1 } ~ = : = ~ \mathtt { E 2 }$ , $\mathtt { E 1 } ~ = ~ \mathtt { \backslash } = ~ \mathtt { E 2 }$ : eval´ua ambas expresiones aritm´eticas y realiza la comparaci´on indicada.

Algunos operadores aritm´eticos:

$ { \mathbb { E } } 1 ~ < ~  { \mathbb { E } } 2$ , $\mathtt { E 1 } ~ \mathtt { \sim } ~ \mathtt { E 2 }$ , E1 >= E2, $\mathtt { E 1 } ~ = : = ~ \mathtt { E 2 }$ , $\mathtt { E 1 } ~ = ~ \mathtt { \backslash } = ~ \mathtt { E 2 }$ : eval´ua ambas expresiones aritm´eticas y realiza la comparaci´on indicada. $( \geq \mathsf { y } \leq$ se escriben de forma que no formen flechas).

Algunos operadores aritm´eticos:

$ { \mathbb { E } } 1 ~ < ~  { \mathbb { E } } 2$ , $\mathtt { E 1 } ~ \mathtt { \sim } ~ \mathtt { E 2 }$ , E1 >= E2, $\mathtt { E 1 } ~ = : = ~ \mathtt { E 2 }$ , $\mathtt { E 1 } ~ = ~ \mathtt { \backslash } = ~ \mathtt { E 2 }$ : eval´ua ambas expresiones aritm´eticas y realiza la comparaci´on indicada. $( \geq \mathsf { y } \leq$ se escriben de forma que no formen flechas).

X is E: tiene ´exito s´ı y s´olo si X unifica con el resultado de evaluar la expresi´on aritm´etica E.

Algunos operadores aritm´eticos:

$ { \mathbb { E } } 1 ~ < ~  { \mathbb { E } } 2$ , $\mathtt { E 1 } ~ \mathtt { \sim } ~ \mathtt { E 2 }$ , E1 >= E2, $\mathtt { E 1 } ~ = : = ~ \mathtt { E 2 }$ , $\mathtt { E 1 } ~ = ~ \mathtt { \backslash } = ~ \mathtt { E 2 }$ : eval´ua ambas expresiones aritm´eticas y realiza la comparaci´on indicada. $( \geq \mathsf { y } \leq$ se escriben de forma que no formen flechas).

X is E: tiene ´exito s´ı y s´olo si X unifica con el resultado de evaluar la expresi´on aritm´etica E.

Algunos operadores no aritm´eticos:

· $\texttt { X } = \texttt { Y }$ : tiene ´exito si y s´olo si X unifica con Y.

Algunos operadores aritm´eticos:

$ { \mathbb { E } } 1 ~ < ~  { \mathbb { E } } 2$ , $\mathtt { E 1 } ~ \mathtt { \sim } ~ \mathtt { E 2 }$ , E1 >= E2, $\mathtt { E 1 } ~ = : = ~ \mathtt { E 2 }$ , $\mathtt { E 1 } ~ = ~ \mathtt { \backslash } = ~ \mathtt { E 2 }$ : eval´ua ambas expresiones aritm´eticas y realiza la comparaci´on indicada. $( \geq \mathsf { y } \leq$ se escriben de forma que no formen flechas).

X is E: tiene ´exito s´ı y s´olo si X unifica con el resultado de evaluar la expresi´on aritm´etica E.

Algunos operadores no aritm´eticos:

· $\texttt { X } = \texttt { Y }$ : tiene ´exito si y s´olo si X unifica con Y.

X $\backslash =$ Y: X no unifica con Y. Ambos t´erminos deben estar instanciados.

# Aritm´etica

![](images/1d32e86f731ec0a65a45b2272722e47887fecdcf270392a354eb52853f42a81d.jpg)

# Aritm´etica

![](images/892fb86e91b6ea0c296072878dff6844006b601984c71a6dab703ff8c9dc581a.jpg)

# Aritm´etica

?- 1+1 =:= 2.   
true.

?- 1+1 = 2.

# Aritm´etica

?- 1+1 =:= 2.   
true. ?- 1+1 = 2.   
false.

# Aritm´etica

?- 1+1 =:= 2.   
true. ?- 1+1 = 2.   
false.

?- 1+1 = 1+1.

# Aritm´etica

?- 1+1 =:= 2.   
true. ?- 1+1 = 2.   
false. ?- 1+1 = 1+1.   
true. ?- 1+1 =:= 2.   
true.   
?- 1+1 = 2.   
false.   
?- 1+1 = 1+1.   
true.   
?- X is 1+1.   
X = 2.   
?- 2 is 1+1.   
true. ?- 1+1 =:= 2.   
true.   
?- 1+1 = 2.   
false.   
?- 1+1 = 1+1.   
true.   
?- X is 1+1.   
X = 2.   
?- 2 is 1+1.   
true.   
?- 1+1 is 2.   
false. ?- 1+1 =:= 2.   
true. ?- 1+1 = 2.   
false. ?- 1+1 is 2.   
false.

![](images/1c9acbaee46f88d1ec38702cc8219db4a5991a237ead943996031cdaf2ecd324.jpg)

![](images/ed8608903a48d74abf7ec5804b4237c756529876d9b29c70aece537c918221de.jpg)

![](images/6f23d70b2c815ec9eae5b36bfe308bee29198772f92cbc6e334927475b95c69c.jpg)

![](images/0708a1cdfaa9dbc2ac350513005a53023efb77733d635b08b3a87780fce95480.jpg)

?- 1+1 is 1+1.

![](images/fe02c9fadbc91e27d5f34de1ef4b55c188ee4418b246e1d6efd0bbba988131ca.jpg)

Definir el predicado entre( $+ \tt X$ ,+Y,-Z) que sea verdadero cuando el n´umero entero Z est´e comprendido entre los n´umeros enteros X e Y (inclusive).

Definir el predicado entre( $+ \tt X$ ,+Y,-Z) que sea verdadero cuando el n´umero entero Z est´e comprendido entre los n´umeros enteros X e Y (inclusive).

Notar que lo que se nos pide es un predicado capaz de instanciar sucesivamente Z en cada n´umero entero entre X e Y:

?- entre(1,3,Z).$z \ = \ 1$ ;$z \ = \ 2 ;$ $z \ = \ 3$ ;false.

Sintaxis: . [] [H | T] [X,Y,...,Z | L]

Sintaxis: . [] . [H | T] 。 [X,Y,...,Z | L]

Ejemplos:

[1,2], [1,2 | []], [1 | [2]], [1 | [2 | []]] [1,cero,’hola mundo’,[3,5]]

# Ejercicios sobre listas

Definir el predicado long(+L,-N) que relaciona una lista con su longitud.

# Ejercicios sobre listas

Definir el predicado long(+L,-N) que relaciona una lista con su longitud.

¿Es long/2 reversible? ¿Por qu´e? ¿C´omo lo notamos entonces?

# Ejercicios sobre listas

。 Definir el predicado long(+L,-N) que relaciona una lista con su longitud.

¿Es long/2 reversible? ¿Por qu´e? ¿C´omo lo notamos entonces?

Definir el predicado sacar $( + \tt X$ ,+XS,-YS), que relaciona un elemento y una lista con otra lista como la original pero sin el elemento dado. Por ejemplo: ?- sacar(2,[1,2,2,3,2],L). $\mathrm { ~ \cal ~ L ~ } = \mathrm { ~ \ o ~ { ~ [ 1 ~ , 3 ] ~ } ~ }$ .

# Ejercicios sobre listas

。 Definir el predicado long(+L,-N) que relaciona una lista con su longitud.

¿Es long/2 reversible? ¿Por qu´e? ¿C´omo lo notamos entonces?

Definir el predicado sacar $( + \tt X$ ,+XS,-YS), que relaciona un elemento y una lista con otra lista como la original pero sin el elemento dado. Por ejemplo: ?- sacar(2,[1,2,2,3,2],L). $\mathrm { ~ \cal ~ L ~ } = \mathrm { ~ \ o ~ { ~ [ 1 ~ , 3 ] ~ } ~ }$ .

Definir el predicado sinConsecRep( $+ { \tt X } { \tt S }$ ,-YS) que relaciona una lista con otra que contiene los mismos elementos sin las repeticiones consecutivas. Por ejemplo: ?- sinConsecRep([1,2,2,3,2],L). L = [1,2,3,2].

# Ejercicios sobre listas

Utilizando el siguiente predicado:

append([],L,L).  
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).

Implementar los siguientes:

# Ejercicios sobre listas

Utilizando el siguiente predicado:

append([],L,L).  
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).

Implementar los siguientes:

prefijo(+L,?P): que tiene ´exito si P es un prefijo de la lista L.

# Ejercicios sobre listas

Utilizando el siguiente predicado:

append([],L,L).  
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).

Implementar los siguientes:

prefijo(+L,?P): que tiene ´exito si P es un prefijo de la lista L.

sufijo(+L,?S): que tiene ´exito si S es un sufijo de la lista L.

# Ejercicios sobre listas

Utilizando el siguiente predicado:

append([],L,L).  
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).

Implementar los siguientes:

prefijo(+L,?P): que tiene ´exito si P es un prefijo de la lista L.   
sufijo(+L,?S): que tiene ´exito si S es un sufijo de la lista L.   
sublista(+L,?SL): que tiene ´exito si SL es una sublista de L.

# Ejercicios sobre listas

Utilizando el siguiente predicado:

append([],L,L).  
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).

Implementar los siguientes:

prefijo(+L,?P): que tiene ´exito si P es un prefijo de la lista L.

sufijo(+L,?S): que tiene ´exito si S es un sufijo de la lista L.

sublista(+L,?SL): que tiene ´exito si SL es una sublista de L.

insertar(?X,+L,?LX): que tiene ´exito si LX puede obtenerse insertando a X en alguna posici´on de L.

# Ejercicios sobre listas

Utilizando el siguiente predicado:

append([],L,L).  
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).

Implementar los siguientes:

prefijo(+L,?P): que tiene ´exito si P es un prefijo de la lista L.   
sufijo(+L,?S): que tiene ´exito si S es un sufijo de la lista L.   
sublista(+L,?SL): que tiene ´exito si SL es una sublista de L.   
. insertar(?X,+L,?LX): que tiene ´exito si LX puede obtenerse insertando a X en alguna posici´on de L.   
permutacion(+L,?P): que tiene ´exito si P es una permutaci´on de la lista L.

# Estructuras parcialmente instanciadas

capicua(?Lista) es verdadero si Lista es capic´ua. Por ejemplo: [1,2,1]

capicua ([]).   
capicua ([ _ ]).   
capicua ([ H | T ]) : - append (M , [ H ] , T ) , capicua ( M ).

Pero puede no estar instanciada, ¿C´omo se comporta en tal caso?

?- capicua(L).   
L = [] ;   
L = [_] ;   
L = [_A, _A] ;   
L = [_A, _, _A] ;   
L = [_A, _B, _B, _A] ;   
L = [_A, _B, _, _B, _A] ;

# Estructuras parcialmente instanciadas

capicua(?Lista) es verdadero si Lista es capic´ua. Por ejemplo: [1,2,1]

capicua ([]).   
capicua ([ _ ]).   
capicua ([ H | T ]) : - append (M , [ H ] , T ) , capicua ( M ).

Pero puede no estar instanciada, ¿C´omo se comporta en tal caso?

$$
\begin{array} { l }  { \mathrm { { \small ~ [ ~ \begin{array} { l } { { ~ L _ \rho ~ } = ~ [ ~ ] ~ } ~ ; } } } \\ { { \mathrm { { \small ~ [ ~ \rho ~ - ~ ] ~ } ~ ; } } } \\ { { \mathrm { { \small ~ [ ~ \rho ~ - ~ ] ~ } ~ - ~ [ ~ \rho ~ - A ] ~ } ~ ; } } \\ { { \mathrm { { \small ~ [ ~ \rho ~ - ~ ] ~ } ~ - ~ [ ~ \rho ~ - ~ ] ~ } ~ ; } } \\ { { \mathrm { { \small ~ [ ~ \rho ~ - ~ ] ~ } ~ - ~ [ ~ \rho ~ - ~ ] ~ } ~ ; } } \\ { { \mathrm { { \small ~ [ ~ \rho ~ - ~ ] ~ } ~ - ~ [ ~ \rho ~ - ~ ] ~ } ~ - ~ 8 , ~ \mathrm { { \small ~ [ ~ \rho ~ - A ] ~ } ~ } ~ ; } } \\ { { \mathrm { { \small ~ [ ~ \rho ~ - ~ ] ~ } ~ - ~ [ ~ \rho ~ - ~ ] ~ } ~ - ~ \mathrm { { \small ~ [ ~ \rho ~ - ~ ] ~ } ~ - ~ \mathrm { { \small ~ [ ~ \rho ~ - A ] ~ } ~ } ~ } ~ ; } } \end{array} \end{array}
$$

Soluci´on alternativa:

capicua ( L ) : - reverse (L , L ).

# Ejercicios sobre listas

Considerando el siguiente predicado:

member(X,[X|_]).   
member(X,[_|L]) :- member(X,L).

# Ejercicios sobre listas

Considerando el siguiente predicado:

member(X,[X|_]).   
member(X,[_|L]) :- member(X,L).

Realizar un seguimiento de las siguientes consultas:

?- member(2,[1,2]).  
?- member(X,[1,2]).  
?- member(5,[X,3,X]).  
?- member(2,[1,2,2]).  
?- length(L,2), member(5,L), member(2,L).

¿ ¿ ¿ ¿ ¿ ¿Preguntas? ? ? ? ? ?