# Trabajo Pr´actico 2 Programaci´on L´ogica versi´on 1.2

Paradigmas de Lenguajes de Programaci´on $2 ^ { \mathrm { d o } }$ cuatrimestre 2025

Fecha de entrega: martes 11 de noviembre

# 1. Introducci´on

Los nonogramas son un tipo de rompecabezas l´ogico que consiste en pintar una matriz mediante ciertas restricciones: los n´umeros proporcionados en los bordes. Estos n´umeros indican las secuencias de celdas pintadas en cada fila y columna.

Los n´umeros en los bordes de las filas y columnas indican la cantidad de celdas consecutivas que deben ser pintadas. Por ejemplo, si una fila tiene los n´umeros “3 2”, significa que hay un grupo de 3 celdas pintadas seguidas, luego al menos una celda sin pintar, y luego un grupo de 2 celdas pintadas. Antes del grupo de 3 y despu´es del grupo de 2 puede haber cualquier cantidad de celdas sin pintar, incluyendo cero.

A continuaci´on se muestra un ejemplo de nonograma junto con su soluci´on.

![](images/124079e87b7d2cb3a6bc0deba44ed2effdce8304ac72faf231d7e50233798aec.jpg)

Hay algunos nonogramas que se pueden resolver ´unicamente deduciendo sobre las restricciones, sin necesidad de probar opciones. Depende de qu´e l´ogica se use para deducir, cada vez que se pinta una celda, puede ayudar a deducir otras celdas. Las deducciones son determin´ısticas, no hay elecciones involucradas.

Hay otros nonogramas que requieren probar opciones y eventualmente volver atr´as para encontrar la soluci´on correcta. Entre cada paso de probar opciones se puede volver a aplicar la l´ogica de deducci´on para pintar m´as celdas.

Independientemente de c´omo se lo resuelva: solamente con deducciones o probando opciones, hay nonogramas que tienen una ´unica soluci´on y otros que tienen m´ultiples soluciones. Los m´as satisfactorios son aquellos que tienen una ´unica soluci´on y que adem´as muestran un dibujo claro.

En este link encontrar´an muchos nonogramas que pueden tratar de resolver para entender mejor la idea: nonograms.org

# 1.1. Objetivo

En este trabajo pr´actico vamos a implementar un programa que resuelva nonogramas en Prolog.

Las estructuras de datos, la l´ogica que vamos a usar y algunos predicados ya est´an dise˜nadas o implementados. Hay que completar los predicados que faltan descritos a continuaci´on.

Finalmente se pide realizar algunas mediciones y analizar la reversibilidad de uno de los predicados implementados.

Se dispone de un Makefile que permite cargar el entorno y ejecutar los tests de los ejercicios.

make repl inicia swipl con el archivo nonograma.pl cargado.   
make test corre los tests de tests.pl usando plunit.   
make watch corre los tests autom´aticamente cada vez que se modifica alg´un archivo .pl. Requiere fswatch y xargs.

# 1.2. Representaci´on de un nonograma

Un nonograma se representa con el t´ermino nono(M, RS) donde:

M es una matriz representada como lista de filas (la matriz a pintar).   
Cada elemento de la matriz M representa una celda.   
Una celda puede tomar los valores $\mathbf { x }$ (celda pintada o negra), $^ \circ$ (celda sin pintar o blanca) o ser una variable no instanciada (color sin determinar a´un).   
RS es una lista de t´erminos $\boldsymbol { \mathbf { r } } \left( \mathbb { R } , \ \mathrm { ~ L ~ } \right)$ que representa las restricciones para las filas y columnas.   
Cada R es una lista de enteros.   
Cada L es la lista de celdas a las que se aplica la restricci´on R.

Por ejemplo, un nonograma 2 filas y 3 columnas con todas las celdas no instanciadas y las restricciones correspondientes se representa como:

![](images/ccd3941e6f7114f9a0ca534370f8fb37b95cee5d47bc7767799d6414b669caba.jpg)

nono([[A, B, C], [D, E, F] ], [r([1], [A, B, C]), % filas r([2], [D, E, F]), r([], [A, D]), % columnas r([2], [B, E]), r([1], [C, F]) ]).

Al ir tratando de resolver el nonograma, las variables no instanciadas se van unificando con x o o seg´un corresponda y van a quedando instanciadas las celdas tanto en la matriz M como en las restricciones RS. Por ejemplo, la primera columna sabemos tienen que ser blancas. Unificando $\mathtt { A } = \mathtt { O }$ , $\mathtt { D = } 0$ queda:

![](images/52df6e13c190db5a2efe92ed27f0ff39e8a54748f469aa0810a1541d24e06848.jpg)

nono([[o, B, C], [o, E, F] ], [r([1], [o, B, C]), % filas r([2], [o, E, F]), r([], [o, o]), % columnas r([2], [B, E]), r([1], [C, F]) ]).

De forma an´aloga, la segunda columna tienen que ser negras. Unificando $\mathtt { B } \mathrm { = x }$ , $\mathtt { E } \mathrm { = x }$ queda:

![](images/9631641e65408637599e72d22bd2ffbcc404e2fb71cea2c1380e1d1029b060e3.jpg)

nono([[o, x, C], [o, x, F] ], [r([1], [o, x, C]), % filas r([2], [o, x, F]), r([], [o, o]), % columnas r([2], [x, x]), r([1], [C, F]) ]).

En los ejemplos anteriores todas las restricciones eran de un solo n´umero. Pero pueden ser m´as. nono([[A, B, C, D, E],

![](images/efec6a6754753ebd53244210ea17e2bce2e5f354b2e741c2ff311fea99e4246b.jpg)

[F, G, H, I, J], [K, L, M, N, O], [P, Q, R, S, T] ], [r([1,1], [A, B, C, D, E]), % filas r([2,1], [F, G, H, I, J]), r([3,1], [K, L, M, N, O]), r([4], [P, Q, R, S, T]), r([1,1], [A, F, K, P]), % columnas r([2], [B, G, L, Q]), r([2,1], [C, H, M, R]), r([1], [D, I, N, S]), r([1], [E, J, O, T]) ]).

# 1.3. (Una) l´ogica para resolver nonogramas

En los ejercicios a continuaci´on vamos a implementar predicados que resuelvan nonogramas a partir de las restricciones de cada fila y columna. A modo de introducci´on vamos a describir la l´ogica que vamos a usar.

El siguiente diagrama muestra todas las posibles soluciones para una restricci´on [2, 1] en una fila de longitud 5. Todas las posibilidades tienen en com´un que la segunda celda debe estar pintada (x). Con lo cual podemos pintar esa celda con seguridad, no hay elecci´on.

![](images/b8382c8c041caa47753cbdbace2f624c33b82fc8a321381442ebf20e5901cd39.jpg)

![](images/9d26a8b0ff4ce495c3a4dc7291611f7fd6a783b3635d6935ef3d82154498e9f9.jpg)

r([2,1], [x,x,o,x,o]) r([2,1], [x,x,o,o,x]) r([2,1], [o,x,x,o,x])

r([2,1], [A,x,C,D,E])

Lo mismo aplica para celdas que necesariamente no deben estar pintadas (o) y para las colum

La representaci´on de restricciones elegida permite tratar filas y columnas de la misma forma.

Como no todos los nonogramas se pueden resolver s´olo con esta l´ogica, vamos a necesitar usar backtracking para probar distintas combinaciones de pintadas v´alidas. Cuando as´ı lo hagamos, vamos a elegir una de las posibles soluciones para la fila (o columna) que tenga alguna celda no instanciada. Esta decisi´on puede ser la incorrecta y eventualmente vamos a tener que volver atr´as y probar otra opci´on.

# 2. Ejercicios

Ejercicio 1: matriz/3

Definir el predicado matriz( $+ \mathtt { F }$ , $+ \complement$ , -M) que es verdadero si $\mathbb { M }$ es una matriz (lista de listas) de F filas y C columnas. Cuando M no est´a instanciada el predicado debe generar una matriz con variables no instanciadas en las celdas

?- matriz(2, 3, M).   
M = [[_, _, _], [_, _, _]].

Nota: Cada una uno de los representa una variable diferente.

Usando nth1/3 podemos acceder a la primera fila y luego a la segunda celda de esa fila:

?- matriz(2, 3, M), nth1(1, M, F1), nth1(2, F1, x). M = [[_A, x, _B], [_, _, _]],   
F1 = [_A, x, _B].

# Ejercicio 2: replicar/3

Definir el predicado replicar( $+ \mathtt { E 1 }$ em, $+ \mathbb { N }$ , -Lista) es cierto cuando Lista es una lista de longitud N, donde cada elemento es igual a Elem.

?- replicar(x, 3, L).   
L = [x, x, x].

# Ejercicio 3: transponer/2

Definir el predicado transponer( $\mathtt { + M }$ , -MT) es cierto cuando MT es la matriz transpuesta de M. La transpuesta, MT, tiene como filas las columnas de M y viceversa. Asumir que M es una matriz bien formada (todas las filas tienen la misma longitud). M puede estar parcialmente instanciada, es decir, puede contener variables no instanciadas como elementos de la matriz.

?- transponer([[1, 2, 3], [4, 5, 6]], MT).   
MT = [[1, 4], [2, 5], [3, 6]]. ?- transponer([[1, 2, A], [4, B, 6]], MT).   
MT = [[1, 4], [2, B], [A, 6]].

# Predicado existente: armarNono/3

armarNono( $+ \mathtt { R F }$ , $+ \mathtt { R C }$ , -NN) genera un nonograma a partir de las restricciones de filas RF y las restricciones de columnas RC con todas las celdas no instanciadas.

RF y RC son listas de listas de enteros, donde cada lista de enteros representa las restricciones de una fila o columna respectivamente.

?- armarNono([[1],[2]],[[],[2],[1]], NN).   
NN $=$ nono([ [_A, _B, _C], [_D, _E, _F] ], [ r([1], [_A, _B, _C]), r([2], [_D, _E, _F]), r([], [_A, _D]), r([2], [_B, _E]), r([1], [_C, _F]) ]).

Nota: Este predicado usa ´ matriz/3 y transponer/2. Si no funciona de la manera esperada, aseg´urense de que esos predicados est´en correctamente implementados.

# Predicado existente: nn/2

Se dispone de varios nonogramas predefinidos con el predicado nn/2. nn(+N, -NN) genera el nonograma n´umero $\mathbb { N }$ en la variable NN. Utiliza armarNono/3 internamente. Pueden agregar sus propios nonogramas siguiendo el mismo formato.

No se pueden modificar los nonogramas predefinidos.

?- nn(0, NN).   
NN $=$ nono([[_A, _B, _C], [_D, _E, _F]], [r([1], [_A, _B, _C]) | ...]) .

# Predicado existente: mostrarNono/1, mostrarFila/1

Se dispone de mostrarNono/1 que muestra un nonograma en la consola. En el siguiente ejemplo definimos manualmente el valor de las celdas del nonograma usando la informaci´on de las restricciones de las primeras dos columnas. Es un ejemplo a modo ilustrativo, para ver c´omo se muestra un nonograma.

?- nn(0，NN)，NN=nono([[o,x,_],[o,x,_]]，_)，mostrarNono(NN).

Tambi´en se puede usar mostrarFila/1 para mostrar una fila individualmente.

# Ejercicio 4: pintadasValidas/1

Definir el predicado pintadasValidas $( + \mathtt { R } )$ que genera las posibles pintadas v´alidas para una restricci´on R. R ser´a de la forma r(Res, Celdas) donde Res es una lista de enteros que representan las restricciones y Celdas es una lista de variables (parcialmente no instanciadas) que representan las celdas. Notar que $\mathtt { R }$ puede corresponder tanto a una fila como a una columna. La estructura del nonograma nos permite tratarlas de la misma forma.

Importante: No debe generar soluciones repetidas.

?- length(L，5)，pintadasValidas(r([3]，L))，mostrarFila(L).  
L=[x，x,x,o,o]；  
L=[0，x，x,x,o]；= [o,o,x,x，x] ；  
false.

Debe poder funcionar con celdas parcialmente instanciadas en $\mathbf { x }$ o o.

= X _,_]，pintadasValidas(r([1,1],L))，mostrarFila(L).[x，o，x,o,o]；  
=[o,o,x,o,x]；  
false.

Tambi´en debe poder funcionar para verificar si hay alguna pintada v´alida dada.

?- L=[_,_,x,x,_], pintadasValidas(r([1,1], L)), mostrarFila(L).   
false.

Tip 1: Se puede usar el predicado replicar/3 definido anteriormente.

Tip 2: Dada una lista de restricciones [R|RS] y una lista de celdas L de longitud N sabemos que antes de las $\scriptstyle \mathrm { \mathrm { ~ R ~ } }$ celdas pintadas puede o no haber celdas sin pintar. Entre las dem´as restricciones debe haber al menos una celda sin pintar. Esto limita cu´antas celdas sin pintar puede haber en total. Puede resultar conveniente plantear un predicado auxiliar que resuelva en forma recursiva y que reciba como par´ametro adicional la cantidad m´ınima de celdas sin pintar que debe haber antes de la primera restricci´on. Tambi´en pueden considerar pasar como par´ametro la sumatoria de las restricciones para evitar calcularla varias veces.

Tip 3: Otra alternativa es pensar el problema como un problema de combinatoria. Sabemos exactamente cu´antas celdas deben ser pintadas y cu´antas no pintadas. Dada una lista de restricciones $r _ { 1 , } , r _ { 2 } , \ldots , r _ { k }$ aplicada a una lista de tama˜no $N$ sabemos que la cantidad total de celdas pintadas debe ser $\textstyle \sum _ { i = 1 } ^ { k } r _ { i }$ y la cantidad total de celdas no pintadas debe ser $\textstyle N - \sum _ { i = 1 } ^ { k } r _ { i }$ . Tambi´en sabemos que entre cada par de restricciones debe haber al menos una celda no pintada, Lo cual significa que tenemos que elegir $\textstyle N - \sum _ { i = 1 } ^ { k } r _ { i }$ $b _ { 1 } , b _ { 2 } , \dotsc , b _ { k - 1 } \geq 1$ $b _ { 0 } , b _ { k } \ge 0$ $b _ { 0 } , b _ { 1 } , \ldots , b _ { k }$ es y despu´es puede haber cero o m´as celdas noque ser´an las cantidades de celdas no pintadas. i=0  ez que tenemos estos valores podemos armar la lista final $\left[ b _ { 0 } , r _ { 1 } , b _ { 1 } , r _ { 2 } , b _ { 2 } , \ldots , r _ { k } , b _ { k } \right]$

# Ejercicio 5: resolverNaive/1

Definir el predicado resolverNaive( $\left( + \mathbb { N N } \right)$ que resuelve un nonograma NN usando backtracking y el predicado pintadasValidas/1 definido anteriormente.

?- nn(0，NN)，resolverNaive(NN)，mostrarNono(NN).

N([2],[([δ3,(£j,[[,x）],,[r([1]，[0,x，0]），r([2]，[0,x，x]），r([]，[o,0]),false

Nota: Puede que para tama˜nos medios sea muy lenta.

# Ejercicio 6: pintarObligatorias/1

Definir el predicado pintarObligatorias $( + \mathtt { R } )$ que pinta las celdas que son obligatoriamente x o o. Esto es viendo todas las posibilidades de pintadas v´alidas para la restricci´on R, tal como se ilustraba en la secci´on 1.3. R ser´a de la forma r(Res, Celdas) donde Res es una lista de enteros que representan las restricciones y Celdas es una lista de variables (parcialmente no instanciadas) que representan las celdas.

?- length(L，5)，pintarObligatorias(r([5]，L))，mostrarFila(L).=[x,x,x,x,x]；  
false.  
?-length(L，5)，pintarObligatorias(r([],L))，mostrarFila(L).=[o，o，o，o，o]；  
false.  
?-_length(L,5),pintarObligatorias(r([3],L))，mostrarFila(L).li?i？  
false.'  
?-_length(L，5)，pintarObligatorias(r([4]，L))，mostrarFila(L).  
_,x；x,x,_]；  
false.

Tambi´en debe poder funcionar para verificar si hay alguna pintada v´alida dada. $\dots { \mathrm { ~ L ~ } } = { \mathrm { ~ [ \dots , \circ , \dots , \dots ] ~ } }$ , pintarObligatorias( $\mathbf { r }$ ([4], L)), mostrarFila(L). false.

Tip: Traten de combinar todas las posibles pintadas v´alidas para encontrar las celdas obligatorias. Retomando el ejemplo inicial de restricci´on [2, 1] para una lista de 5 celdas sabemos que las posibilidades son:

[x, x, o, x, o] [x, x, o, o, x] [o, x, x, o, x]

Combinando las primeras dos posibilidades tenemos [x, x, o, D, E], y combinando este resultado con la tercera posibilidad tenemos [A, x, C, D, E].

Se dispone del predicado combinarCelda/3. combinarCelda(?A, ?B, ?C) es verdadero cuando el valor de A y B es consistente con C.

?- combinarCelda(x, x, C).  
${ \texttt { C } } = { \texttt { x } }$ ;  
false.  
?- combinarCelda(o, o, C).  
${ \textsf { C } } = { \textsf { o } }$ ;  
false.  
?- combinarCelda(x, o, C).  
true.  
?- combinarCelda(_, o, C).  
true ;  
false.

# Ejercicio 7: deducir1Pasada/1

Definir el predicado deducir1Pasada $\mathord { \left. \kern - delimiterspace \right.} + \mathbb { M } \mathbb { N }  $ ) que aplica el predicado pintarObligatorias/1 a todas las restricciones del nonograma NN.

Es posible que este predicado logre resolver varios nonogramas sencillos por s´ı solo, pero no todos.

# Predicado existente: cantidadVariablesLibres/2

Se dispone del predicado cantidadVariablesLibres(?T, -N) que es verdadero cuando N es la cantidad de variables no instanciadas en el t´ermino T.

Puede ser usado para contar la cantidad de celdas no instanciadas en una lista, en una matriz, en un nonograma o en cualquier t´ermino.

?- cantidadVariablesLibres([x,o,C,D,E],N).   
$\tt { N } = \tt { 3 }$ .

# Predicado existente: deducirVariasPasadas/1

Se dispone del predicado deducirVariasPasadas $\left( + \tt N N \right)$ ) que aplica el predicado deducir1Pasada/1 repetidamente hasta que no pueda deducir m´as celdas.

En la implementaci´on se puede ver que se usa cantidadVariablesLibres/2 para contar las celdas no instanciadas antes y despu´es de aplicar deducir1Pasada/1.

Luego, deducirVariasPasadasCont/3 es un predicado auxiliar que recibe estas cantidades y dependendiendo de si coinciden o no itera o frena.

Definir un predicado que define si continuar o no puede ser ´util en otro ejercicio ;-).

# Ejercicio 8: restriccionConMenosLibres/2

Definir el predicado restriccionConMenosLibres( $+ \tt N N$ , -R) que es verdadero cuando R es la restricci´on (o una de las restricciones) del nonograma NN que tiene la menor cantidad de celdas no instanciadas, pero que tenga al menos una celda no instanciada. Este predicado va a ser usado para elegir la siguiente restricci´on a resolver cuando se use backtracking, por eso es importante que tenga al menos una celda libre.

Importante: El predicado no puede ser recursivo. Aprovechen el not/1. No se permite el uso de findall/3, bagof/3, setof/3 ni ning´un otro metapredicado salvo not/1.

# Ejercicio 9: resolverDeduciendo/2

Definir el predicado resolverDeduciendo( $\left. + \mathbb { N } \right. { T }$ ) que resuelve un nonograma NN de manera m´as eficiente que resolverNaive/1. Para ello debe comenzar por resolver usando deducirVariasPasadas/1, si no est´a resuelto, elegir una restricci´on con menor cantidad de celdas libres usando restriccionConMenosLibres/2 y probar las posibles pintadas v´alidas para esa restricci´on usando pintadasValidas/1. Continuar aplicando la misma l´ogica, una vez que se elige una pintada v´alida, se puede volver a usar deducirVariasPasadas/1 para aprovechar las nuevas celdas pintadas.

Notar que inmediatamente despu´es de aplicar pintadasValidas/1 no se garantiza que la soluci´on parcial sea consistente con las dem´as restricciones.

Importante: Este predicado no debe generar soluciones repetidas, para ello se permite el uso de !/1 (cut).

# Ejercicio 10: solucionUnica/1

Definir el predicado solucionUnica( $\left[ + \mathbb { N } \mathbb { N } \right]$ ) que es verdadero cuando el nonograma NN tiene una ´unica soluci´on.   
No es necesario que el predicado encuentre la soluci´on, alcanza con que determine si es ´unica o no.

# Ejercicio 11: An´alisis de nonogramas

Se pide completar la siguiente tabla con el an´alisis de los nonogramas predefinidos. Completar dicha tabla en un comentario en el c´odigo fuente o un .txt/ texttt.md/.pdf que lo acompa˜ne.

Indicar qu´e consultas se usaron para averiguar cada uno de los datos. Ejemplo: el predicado tam/2 puede ser usado para completar la primera columna.

tam(N, (F, C)) :- nn(N, nono(M, _)), matriz(F, C, M).   
?- tam(0, T).   
T = (2, 3).

Si alg´un nonograma no puede ser analizado, indicar el motivo.

<table><tr><td rowspan=1 colspan=1>N</td><td rowspan=1 colspan=1>Tamano</td><td rowspan=1 colspan=1>iTiene solucion ünica?</td><td rowspan=1 colspan=1>𝑖Es deducible sin backtracking?</td></tr><tr><td rowspan=1 colspan=1>0</td><td rowspan=5 colspan=1>2×3</td><td rowspan=5 colspan=1>Si</td><td rowspan=5 colspan=1>Si</td></tr><tr><td rowspan=1 colspan=1>1</td></tr><tr><td rowspan=1 colspan=1>2</td></tr><tr><td rowspan=1 colspan=1>3</td></tr><tr><td rowspan=1 colspan=1>4：</td></tr></table>

# Ejercicio 12: Reversibilidad

Indicar si el predicado replicar/3 es reversible en el segundo argumento. En concreto se pide analizar si replicar( $+ \tt E 1 e m$ , $- \mathbb { N }$ , -Lista) funciona correctamente.

# 3. Pautas de Entrega

Importante: Se espera que la elaboraci´on de este trabajo sea $1 0 0 \%$ de los estudiantes del grupo que realiza la entrega. As´ı que, m´as all´a de que pueden tomar informaci´on de lo visto en las clases o consultar informaci´on en la documentaci´on de SWI-Prolog u otra disponible en Internet, no se podr´an utilizar herramientas para generar parcial o totalmente en forma autom´atica la resoluci´on del TP (e.g., ChatGPT, Copilot, etc). En caso de detectarse esto, el trabajo ser´a considerado como un plagio, por lo que ser´a gestionado de la misma forma que se resuelven las copias en los parciales u otras instancias de evaluaci´on.

Se deber´a subir el c´odigo fuente a la tarea respectiva en el Campus.

El c´odigo debe poder ser ejecutado en SWI-Prolog. No es necesario entregar un informe sobre el trabajo, alcanza con que el c´odigo est´e adecuadamente comentado. Los objetivos a evaluar en la implementaci´on de los predicados son:

correcci´on,   
declaratividad,   
reutilizaci´on de predicados previamente definidos   
Uso de unificaci´on, backtracking, generate and test y reversibilidad de los predicados que correspondan.   
No est´a permitido usar macros que colapsen cl´ausulas, como ; y ->.   
Importante: salvo donde se indique lo contrario, los predicados no deben instanciar soluciones repetidas. Vale aclarar que no es necesario filtrar las soluciones repetidas si la repetici´on proviene de las caracter´ısticas de la entrada.

Importante: se admitir´a un ´unico env´ıo, sin excepci´on alguna. Por favor planifiquen el trabajo para llegar a tiempo con la entrega.

# 4. Referencias y sugerencias

Como referencia se recomienda la bibliograf´ıa inclu´ıda en el sitio de la materia (ver secci´on Bibliograf´ıa → Programaci´on L´ogica).

Se recomienda que, siempre que sea posible, utilicen los predicados ISO y los de SWI-Prolog ya disponibles. Recomendamos especialmente examinar los predicados y metapredicados que figuran en la secci´on Util ´ de la p´agina de la materia. Pueden hallar la descripci´on de los mismos en la ayuda de SWI-Prolog (a la que acceden con el predicado help). Tambi´en se puede acceder a la documentaci´on online de SWI-Prolog.

En particular, seguramente les resulten ´utiles los siguientes predicados: between/3, member/2, length/2, append/3, maplist/2, maplist/4, findall/3, not/1.