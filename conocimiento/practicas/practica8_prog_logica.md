# Practica N° 8 - Programacion logica

**Paradigmas de Programacion (PLP) - 2do Cuatrimestre de 2025**

Para resolver esta practica, recomendamos utilizar el programa "SWI-Prolog", de distribucion gratuita, que puede bajarse de http://www.swi-prolog.org. El unico *meta predicado* que puede utilizarse para resolver los ejercicios es `not`. No utilizar *cut* (`!`) ni predicados de *alto orden* (como `setof`). Los ejercicios marcados con el simbolo ★ constituyen un subconjunto minimo de ejercitacion. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

---

## El motor de busqueda de Prolog

### Ejercicio 1 ★

Considerar la siguiente base de conocimiento.

```prolog
padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).
abuelo(X,Y) :- padre(X,Z), padre(Z,Y).
```

i. ¿Cual es el resultado de la consulta `abuelo(X, manuel)`?

ii. A partir del predicado binario `padre`, definir en Prolog los predicados binarios: `hijo`, `hermano` y `descendiente`.

iii. Dibujar el arbol de busqueda de Prolog para la consulta `descendiente(Alguien, juan)`.

iv. ¿Que consulta habria que hacer para encontrar a los nietos de `juan`?

v. ¿Como se puede definir una consulta para conocer a todos los hermanos de `pablo`?

vi. Considerar el agregado del siguiente hecho y regla:

```prolog
ancestro(X, X).
ancestro(X, Y) :- ancestro(Z, Y), padre(X, Z).
```

y la base de conocimiento del item anterior.

vii. Explicar la respuesta a la consulta `ancestro(juan, X)`. ¿Que sucede si se pide mas de un resultado?

viii. Sugerir una solucion al problema hallado en los puntos anteriores reescribiendo el programa de `ancestro`.

### Ejercicio 2

Sea el siguiente programa logico:

```prolog
vecino(X, Y, [X|[Y|Ls]]).
vecino(X, Y, [W|Ls]) :- vecino(X, Y, Ls).
```

i. Mostrar el arbol de busqueda en Prolog para resolver `vecino(5, Y, [5,6,5,3])`, devolviendo todos los valores de `Y` que hacen que la meta se deduzca logicamente del programa.

ii. Si se invierte el orden de las reglas, ¿los resultados son los mismos? ¿Y el orden de los resultados?

### Ejercicio 3 ★

Considerar las siguientes definiciones:

```prolog
natural(0).
natural(suc(X)) :- natural(X).

menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
menorOIgual(X,X) :- natural(X).
```

i. Explicar que sucede al realizar la consulta `menorOIgual(0,X)`.

ii. Describir las circunstancias en las que puede colgarse un programa en Prolog. Es decir, ejecutarse infinitamente sin arrojar soluciones.

iii. Corregir la definicion de `menorOIgual` para que funcione adecuadamente.

---

## Operaciones sobre listas

### Ejercicio 4 ★

Definir el predicado `juntar(?Lista1,?Lista2,?Lista3)`, que tiene exito si `Lista3` es la concatenacion de `Lista1` y `Lista2`. Por ejemplo:

```prolog
?- juntar([a,b,c], [d,e], [a,b,c,d,e]).   → true.
?- juntar([a,b,c], [d,e], L).              → L = [a,b,c,d,e].
?- juntar([a,b,c], L, [a,b,c,d,e]).        → L = [d,e].
?- juntar(L, [d,e], [a,b,c,d,e]).          → L = [a,b,c].
?- juntar(L1, L2, [1,2,3]).                → L1 = [], L2 = [1, 2, 3];
                                              L1 = [1], L2 = [2, 3];
                                              L1 = [1,2], L2 = [3];
                                              L1 = [1,2,3], L2 = [].
```

Al igual que la mayoria de los predicados, puede dar `false` despues de agotar los resultados.

**Nota:** este predicado ya esta definido en prolog con el nombre `append`.

### Ejercicio 5 ★

Definir los siguientes predicados sobre listas usando **append**:

i. `last(?L, ?U)`, donde `U` es el ultimo elemento de la lista `L`.

ii. `reverse(+L, ?R)`, donde `R` contiene los mismos elementos que `L`, pero en orden inverso.
Ejemplo: `reverse([a,b,c], [c,b,a])`.
Mostrar el arbol de busqueda para el ejemplo dado.

iii. `prefijo(?P, +L)`, donde `P` es prefijo de la lista `L`.

iv. `sufijo(?S, +L)`, donde `S` es sufijo de la lista `L`.

v. `sublista(?S, +L)`, donde `S` es sublista de `L`.

vi. `pertenece(?X, +L)`, que es verdadero sii el elemento `X` se encuentra en la lista `L`. (Este predicado ya viene definido en Prolog y se llama `member`).

### Ejercicio 6 ★

Definir el predicado `aplanar(+Xs, -Ys)`, que es verdadero sii `Ys` contiene los elementos de todos los niveles de `Xs`, en el mismo orden de aparicion. Los elementos de `Xs` son enteros, atomos o nuevamente listas, de modo que `Xs` puede tener una profundidad arbitraria. Por el contrario, `Ys` es una lista de un solo nivel de profundidad.

Ejemplos:

```prolog
?- aplanar([a, [3, b, []], [2]], L).          → L=[a, 3, b, 2]
?- aplanar([[1, [2, 3], [a]], [[[]]]], L).    → L=[1, 2, 3, a]
```

**Nota:** este predicado ya esta definido en prolog con el nombre `flatten`.

### Ejercicio 7 ★

Definir los siguientes predicados, usando **member** y/o **append** segun sea conveniente:

i. `interseccion(+L1, +L2, -L3)`, tal que `L3` es la interseccion sin repeticiones de las listas `L1` y `L2`, respetando en `L3` el orden en que aparecen los elementos en `L1`.

`partir(N, L, L1, L2)`, donde `L1` tiene los `N` primeros elementos de `L`, y `L2` el resto. Si `L` tiene menos de `N` elementos el predicado debe fallar. ¿Cuan reversible es este predicado? Es decir, ¿que parametros pueden estar indefinidos al momento de la invocacion?

ii. `borrar(+ListaOriginal, +X, -ListaSinXs)`, que elimina todas las ocurrencias de `X` de la lista `ListaOriginal`.

iii. `sacarDuplicados(+L1, -L2)`, que saca todos los elementos duplicados de la lista `L1`.

iv. `permutacion(+L1, ?L2)`, que tiene exito cuando `L2` es permutacion de `L1`. ¿Hay una manera mas eficiente de definir este predicado para cuando `L2` esta instanciada?

v. `reparto(+L, +N, -LListas)` que tenga exito si `LListas` es una lista de `N` listas (N >= 1) de cualquier longitud - incluso vacias - tales que al concatenarlas se obtiene la lista `L`.

vi. `repartoSinVacias(+L, -LListas)` similar al anterior, pero ninguna de las listas de `LListas` puede ser vacia, y la longitud de `LListas` puede variar.

### Ejercicio 8

Definir el predicado `parteQueSuma(+L,+S,-P)` que es verdadero cuando `P` es una lista con elementos de `L` que suman `S`. Por ejemplo:

```prolog
?- parteQueSuma([1,2,3,4,5],9,P).
P = [1, 3, 5] ;
P = [2, 3, 4] ;
P = [4, 5] ;
false.
```

---

## Instanciacion y reversibilidad

### Ejercicio 9 ★

Considerar el siguiente predicado:

```prolog
desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).
```

i. ¿Como deben instanciarse los parametros para que el predicado funcione? (Es decir, para que no se cuelgue ni produzca un error). ¿Por que?

ii. Dar una nueva version del predicado que funcione con la instanciacion `desdeReversible(+X,?Y)`, tal que si `Y` esta instanciada, sea verdadero si `Y` es mayor o igual que `X`, y si no lo esta genere todos los `Y` de `X` en adelante.

### Ejercicio 10

Definir el predicado `intercalar(L1, L2, L3)`, donde `L3` es el resultado de intercalar uno a uno los elementos de las listas `L1` y `L2`. Si una lista tiene longitud menor, entonces el resto de la lista mas larga es pasado sin cambiar. Indicar la reversibilidad, es decir si es posible obtener `L3` a partir de `L1` y `L2`, y viceversa.

Ejemplo: `intercalar([a,b,c], [d,e], [a,d,b,e,c])`.

### Ejercicio 11 ★

Un arbol binario se representara en Prolog con:

- `nil`, si es vacio.
- `bin(izq, v, der)`, donde `v` es el valor del nodo, `izq` es el subarbol izquierdo y `der` es el subarbol derecho.

Definir predicados en Prolog para las siguientes operaciones: `vacio`, `raiz`, `altura` y `cantidadDeNodos`. Asumir siempre que el arbol esta instanciado.

### Ejercicio 12 ★

Definir los siguientes predicados, utilizando la representacion de arbol binario definida en el ejercicio 11:

i. `inorder(+AB,-Lista)`, que tenga exito si `AB` es un arbol binario y `Lista` la lista de sus nodos segun el recorrido *inorder*.

ii. `arbolConInorder(+Lista,-AB)`, version inversa del predicado anterior.

iii. `aBB(+T)`, que sera verdadero si `T` es un arbol binario de busqueda.

iv. `aBBInsertar(+X, +T1, -T2)`, donde `T2` resulta de insertar `X` en orden en el arbol `T1`. Este predicado ¿es reversible en alguno de sus parametros? Justificar.

---

## Generate & Test

### Ejercicio 13 ★

Definir el predicado `coprimos(-X,-Y)`, que genere uno a uno *todos* los pares de numeros naturales coprimos (es decir, cuyo maximo comun divisor es 1), sin repetir resultados. Usar la funcion `gcd` del motor aritmetico.

### Ejercicio 14 ★

Un cuadrado semi-magico es una matriz cuadrada de naturales (incluido el cero) donde todas las filas de la matriz suman lo mismo. Por ejemplo:

```
1 3 0
2 2 0      todas las filas suman 4
1 1 2
```

Representamos la matriz como una lista de filas, donde cada fila es una lista de naturales. El ejemplo anterior se representaria de la siguiente manera: `[[1,3,0],[2,2,0],[1,1,2]]`.

i. Definir el predicado `cuadradoSemiMagico(+N, -XS)`. El predicado debe ir devolviendo matrices (utilizando la representacion antes mencionada), que sean cuadrados *semi-magicos* de dimension N\*N. Dichas matrices deben devolverse de manera ordenada: primero aquellas cuyas filas suman 0, luego 1, luego 2, etc. No es necesario utilizar la tecnica *Generate & Test*.

Ejemplo: `cuadradoSemiMagico(2,X).` devuelve:

```prolog
X = [[0, 0], [0, 0]] ;
X = [[0, 1], [0, 1]] ;
X = [[0, 1], [1, 0]] ;
X = [[1, 0], [0, 1]] ;
X = [[1, 0], [1, 0]] ;
X = [[0, 2], [0, 2]] ;
```
etc.

ii. Definir utilizando *Generate & Test* el predicado `cuadradoMagico(+N, -XS)`, que instancia `XS` con cuadrados cuyas filas y columnas suman todas un mismo valor.

### Ejercicio 15

En este ejercicio trabajaremos con triangulos. La expresion `tri(A,B,C)` denotara el triangulo cuyos lados tienen longitudes A, B y C respectivamente. Se asume que las longitudes de los lados son siempre numeros naturales.

Implementar los siguientes predicados:

i. `esTriangulo(+T)` que, dada una estructura de la forma `tri(A,B,C)`, indique si es un triangulo valido. En un triangulo valido, cada lado es menor que la suma de los otros dos, y mayor que su diferencia (y obviamente mayor que 0).

ii. `perimetro(?T,?P)`, que es verdadero cuando `T` es un triangulo (valido) y `P` es su perimetro. No se deben generar resultados repetidos (no tendremos en cuenta la congruencia entre triangulos: si dos triangulos tienen las mismas longitudes, pero en diferente orden, se consideraran diferentes entre si). El predicado debe funcionar para cualquier instanciacion de `T` y `P` (ambas instanciadas, ambas sin instanciar, una instanciada y una no; no es necesario que funcione para triangulos parcialmente instanciados), debe generar todos los resultados validos (sean finitos o infinitos), y no debe colgarse (es decir, no debe seguir ejecutando infinitamente sin producir nuevos resultados). Por ejemplo:

```prolog
?- perimetro(tri(3,4,5),12).       → true.
?- perimetro(T,5).                  → T = tri(1, 2, 2) ; T = tri(2, 1, 2) ; T = tri(2, 2, 1) ; false.
?- perimetro(tri(2,2,2),P).        → P = 6.
?- perimetro(T,P).                  → T = tri(1, 1, 1), P = 3 ; T = tri(1, 2, 2), P = 5 ; ...
```

iii. `triangulo(-T)`, que genera todos los triangulos validos, sin repetir resultados.

---

## Negacion por falla y Cut

### Ejercicio 16 ★

A Ana le gustan los helados que sean a la vez cremosos y frutales. En una heladeria de su barrio, se encontro con los siguientes sabores:

```prolog
frutal(frutilla).
frutal(banana).
frutal(manzana).
cremoso(banana).
cremoso(americana).
cremoso(frutilla).
cremoso(dulceDeLeche).
```

Ana desea comprar un cucurucho con sabores que le gustan. El cucurucho admite hasta 2 sabores. Los siguientes predicados definen las posibles maneras de armar el cucurucho.

```prolog
leGusta(X) :- frutal(X), cremoso(X).
cucurucho(X,Y) :- leGusta(X), leGusta(Y).
```

i. Escribir el arbol de busqueda para la consulta `?- cucurucho(X,Y).`

ii. Indicar que partes del arbol se podan al colocar un `!` en cada ubicacion posible en las definiciones de `cucurucho` y `leGusta`.

### Ejercicio 17 ★

i. Sean los predicados `P(?X)` y `Q(?X)`, ¿que significa la respuesta a la siguiente consulta?

```prolog
?- P(Y), not(Q(Y)).
```

ii. ¿Que pasaria si se invirtiera el orden de los literales en la consulta anterior?

iii. Sea el predicado `P(?X)`, ¿Como se puede usar el `not` para determinar si existe una unica `Y` tal que `P(?Y)` es verdadero?

### Ejercicio 18 ★

Definir el predicado `corteMasParejo(+L,-L1,-L2)` que, dada una lista de numeros, realiza el corte mas parejo posible con respecto a la suma de sus elementos (puede haber mas de un resultado). Por ejemplo:

```prolog
?- corteMasParejo([1,2,3,4,2],L1,L2).    → L1 = [1, 2, 3], L2 = [4, 2] ; false.
?- corteMasParejo([1,2,1],L1,L2).         → L1 = [1], L2 = [2, 1] ; L1 = [1, 2], L2 = [1] ; false.
```

### Ejercicio 19

Dado un predicado unario `P(?X)` sobre numeros naturales, definir un predicado que determine el minimo `X` que satisfaga `P(X)`. Se puede suponer que hay una cantidad finita de naturales que lo satisfacen.

### Ejercicio 20 ★

Un numero poderoso es un numero natural *m* tal que por cada numero primo *p* que divide a *m*, *p*² tambien divide a *m*. Definir el predicado `proximoNumPoderoso(+X,-Y)` que instancie en `Y` el siguiente numero poderoso a partir de `X`. Por ejemplo:

```prolog
?- proximoNumPoderoso(20,Y).
Y = 25;
false.

?- proximoNumPoderoso(8,Y).
Y = 9;
false.
```

Notar que, como en el ultimo caso, si `X` ya es un numero poderoso, `Y` no debe instanciarse con el valor de `X`, sino con el siguiente numero poderoso.

### Ejercicio 21

Contamos con una representacion de conjuntos desconocida, que permite enumerar un conjunto mediante el predicado `pertenece(?Elemento, +Conjunto)`. Dado el siguiente predicado:

```prolog
natural(cero).
natural(suc(X)) :- natural(X).
```

- Definir el predicado `conjuntoDeNaturales(X)` que sea verdadero cuando todos los elementos de `X` son naturales (se asume que `X` es un conjunto).

- ¿Con que instanciacion de `X` funciona bien el predicado anterior? Justificar.

- Indicar el error en la siguiente definicion alternativa, justificando por que no funciona correctamente:

```prolog
conjuntoDeNaturalesMalo(X) :- not( (not(natural(E)), pertenece(E,X)) ).
```

---

## Ejercicios integradores

### Ejercicio 22 ★

En este ejercicio trabajaremos con grafos no orientados. Un grafo no orientado es un conjunto de nodos y un conjunto de aristas sin una direccion especifica. Cada arista esta representada por un par de nodos y, como se puede viajar en cualquiera de los dos sentidos, la arista *(a, b)* y la arista *(b, a)* son la misma.

No sabemos cual es la representacion interna de un grafo, pero contamos con un predicado `esNodo(+G,?X)` que dado un grafo `G` dice si `X` es nodo de `G`. Tambien tenemos otro predicado `esArista(+G,?X,?Y)` que dice si en `G` hay una arista de `X` a `Y`. Notar que podemos usar `esNodo` para enumerar los nodos del grafo y `esArista` para enumerar las aristas. Instanciando apropiadamente, tambien podemos usar `esArista` para obtener todas las aristas que tienen a un nodo particular. Cuando `esArista` lista todas las aristas, cada arista se lista una sola vez en una orientacion arbitraria de las dos posibles, pero si se pregunta por cualquiera de las dos, respondera que si. Suponer que dos nodos son el mismo si y solo si unifican.

**Ayuda:** para algunos items conviene pensar primero en como programar el predicado opuesto al que se pide.

i. Implementar el predicado `caminoSimple(+G,+D,+H,?L)` que dice si `L` es un camino simple en el grafo `G` que empieza en `D` y termina en `H`. Un camino simple lo representaremos por una lista de nodos **distintos**, tal que para cada par de nodos consecutivos en `L` existe una arista en `G` que los conecta. Notar que el primer elemento de `L` debe ser `D` y el ultimo `H`. Cuando `L` esta sin instanciar, el predicado debe ir devolviendo **todos** los caminos simples desde `D` a `H` sin repetidos (es decir, hay que tener cuidado con los ciclos).

ii. Un camino `L` en un grafo `G` es Hamiltoniano sii `L` es un camino simple que contiene a todos los nodos `G`. Implementar el predicado `caminoHamiltoniano(+G,?L)` que dice si `L` es un camino Hamiltoniano en `G`.

iii. Implementar el predicado `esConexo(+G)` que dado un grafo dice si este es conexo. Un grafo `G` es conexo sii no existe un par de nodos en `G` tal que no hay un camino simple que los una. Notar que con esta definicion un grafo de un nodo (y sin aristas) es conexo.

iv. Implementar el predicado `esEstrella(+G)` que dado un grafo dice si es un grafo estrella. Un grafo es estrella sii es conexo y hay un nodo comun a todas sus aristas.

### Ejercicio 23 ★

Trabajaremos con arboles binarios, usando `nil` y `bin(AI, V, AD)` para representarlos en Prolog.

i. Implementar un predicado `arbol(-A)` que genere estructuras de arbol binario, dejando los valores de los nodos sin instanciar. Deben devolverse todos los arboles posibles (es decir, para toda estructura posible, el predicado debe devolverla luego de un numero finito de pedidos). No debe devolverse dos veces el mismo arbol.

```prolog
?- arbol(A).
A = nil ;
A = bin(nil, _G2388, nil) ;
A = bin(nil, _G2391, bin(nil, _G2398, nil)) ;
A = bin(bin(nil, _G2398, nil), _G2391, nil) ;
...
```

ii. Implementar un predicado `nodosEn(?A, +L)` que es verdadero cuando `A` es un arbol cuyos nodos pertenecen al conjunto de atomos `L` (representado mediante una lista no vacia, sin orden relevante y sin repetidos). Puede asumirse que el arbol se recibe instanciado en su estructura, pero no necesariamente en sus nodos.

```prolog
?- arbol(A), nodosEn(A, [ka, pow]).
A = nil ;
A = bin(nil, ka, nil) ;
A = bin(nil, pow, nil) ;
A = bin(nil, ka, bin(nil, ka, nil)) ;
A = bin(nil, ka, bin(nil, pow, nil)) ;
...
```

iii. Implementar un predicado `sinRepEn(-A, +L)` que genere todos los arboles cuyos nodos pertenezcan al alfabeto `L` y usando como maximo una vez cada simbolo del mismo. En este caso, no hay infinitos arboles posibles; es importante que el predicado no devuelva soluciones repetidas y que no se quede buscando indefinidamente una vez terminado el espacio de soluciones.

```prolog
?- arbolSinRepEn(A, [ka, pow]).
A = nil ;
A = bin(nil, ka, nil) ;
...
A = bin(nil, ka, bin(nil, pow, nil)) ;
... ;
No.
```
