# Práctica ${ \bf N } ^ { \mathrm { o } }$ 1 - Programación Funcional

Para resolver esta práctica, recomendamos usar el intérprete GHCI, de distribución gratuita, que puede bajarse de https://www.haskell.org/ghc/.

Para resolver los ejercicios no está permitido usar recursión explícita, a menos que se indique lo contrario. Los ejercicios marcados con el símbolo $\star$ constituyen un subconjunto mínimo de ejercitación. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

# Currificación y tipos

# Ejercicio 1 ⋆

Considerar las siguientes deniciones de funciones:

- max2 (x, y) | x >= y = x | otherwise = y   
- normaVectorial (x, y) = sqrt $( \tt x \hat { \tau } 2 + \tt y \hat { \tau } 2 )$   
- subtract $=$ flip (-)   
- predecesor $=$ subtract 1

- evaluarEnCero $=$ \f -> f 0 - dosVeces $=$ \f -> f . f - flipAll $=$ map flip - flipRaro $=$ flip flip

i. $\dot { \downarrow } ^ { \mathrm { C u } \acute { \mathrm { a l } } }$ es el tipo de cada función? (Suponer que todos los números son de tipo Float).

ii. Indicar cuáles de las funciones anteriores no están curricadas. Para cada una de ellas, denir la función curricada correspondiente. Recordar dar el tipo de la función.

# Ejercicio 2 ⋆

i. Denir la función curry, que dada una función de dos argumentos, devuelve su equivalente curricada.

ii. Denir la función uncurry, que dada una función curricada de dos argumentos, devuelve su versión no curricada equivalente. Es la inversa de la anterior.

iii. $\mathrm { \Omega _ { i } S e }$ podría denir una función curryN, que tome una función de un número arbitrario de argumentos y devuelva su versión curricada?

Sugerencia: pensar cuál sería el tipo de la función.

# Esquemas de recursión

# Ejercicio 3 ⋆

i. Redenir usando foldr las funciones sum, elem, $( + + )$ , filter y map.

ii. Denir la función mejorSegún :: (a -> a -> Bool) $^ { - > }$ [a] -> a, que devuelve el máximo elemento de la lista según una función de comparación, utilizando foldr1. Por ejemplo, maximum $=$ mejorSegún $( > )$ .

iii. Denir la función sumasParciales :: Num $a  [ a ]  [ a ]$ , que dada una lista de números devuelve otra de la misma longitud, que tiene en cada posición la suma parcial de los elementos de la lista original desde la cabeza hasta la posición actual. Por ejemplo, sumasParciales $[ 1 , 4 , - 1 , 0 , 5 ] \sim [ 1 , 5 , 4 , 4 , 9 ]$ .

iv. Denir la función sumaAlt, que realiza la suma alternada de los elementos de una lista. Es decir, da como resultado: el primer elemento, menos el segundo, más el tercero, menos el cuarto, etc. Usar foldr.

v. Hacer lo mismo que en el punto anterior, pero en sentido inverso (el último elemento menos el anteúltimo, etc.). Pensar qué esquema de recursión conviene usar en este caso.

# Ejercicio 4

i. Denir la función permutaciones :: [a] -> [[a]], que dada una lista devuelve todas sus permutaciones. Se recomienda utilizar concatMap :: (a -> [b]) -> [a] -> [b], y también take y drop.

ii. Denir la función partes, que recibe una lista L y devuelve la lista de todas las listas formadas por los mismos elementos de L, en su mismo orden de aparición. Ejemplo: partes [5, 1, 2] [[], [5], [1], [2], [5, 1], [5, 2], [1, 2], [5, 1, 2]] (en algún orden).   
iii. Denir la función prefijos, que dada una lista, devuelve todos sus prejos. Ejemplo: prefijos [5, 1, $2 ]  [ [ ]$ , [5], [5, 1], [5, 1, 2]]   
iv. Denir la función sublistas que, dada una lista, devuelve todas sus sublistas (listas de elementos que aparecen consecutivos en la lista original). Ejemplo: sublistas [5, 1, $2 ]  [ [ ]$ , [5], [1], [2], [5, 1], [1, 2], [5, 1, 2]] (en algún orden).

# Ejercicio 5 ⋆

Considerar las siguientes funciones:

elementosEnPosicionesPares :: [a] -> [a]   
elementosEnPosicionesPares $\begin{array} { l l } { \left[ \begin{array} { l l l } \end{array} \right] } \end{array} =  &  \left[ \begin{array} { l l l } \end{array} \right]$   
elementosEnPosicionesPares $\begin{array} { r l } { ( \mathbf { \{ x } : x \mathbf { s } ) }  & { { } = } \end{array}$ if null xs then [x] else x : elementosEnPosicionesPares (tail xs)   
entrelazar :: [a] -> [a] -> [a]   
entrelazar $[ \mathsf { \lambda } ] ~ = ~ \mathsf { \lambda } \mathtt { i d }$   
entrelazar $\mathrm { ( { \bf x } : { \bf x } { \bf s } ) \mathrm { \bf \Sigma } = \nabla \times \mathrm { \bf s } \mathrm { \bf \Sigma } \mathrm { \bf - > \mathrm { \bf \Sigma } i f \mathrm { \bf \Sigma } n \mathrm { \bf \Sigma } } }$ ull ys then x : entrelazar xs [] else x : head ys : entrelazar xs (tail ys) Indicar si la recursión utilizada en cada una de ellas es o no estructural. Si lo es, reescribirla utilizando foldr.   
En caso contrario, explicar el motivo.

# Ejercicio $\textbf { 6 } \star$

El siguiente esquema captura la recursión primitiva sobre listas.

$$
\begin{array} { l } { { \mathrm { r e c r ~ : ~ \left( \mathtt { a } ~ \ - > \ ~ \left[ \mathtt { a } \right] ~ \ - > ~ \mathtt { b } ~ \mathtt { - > ~ \mathtt { b } } \right) ~ \mathtt { - > ~ \mathtt { b } ~ \mathtt { - > ~ \mathtt { b } } \ \left[ \mathtt { a } \right] ~ \mathtt { - > ~ \mathtt { b } } \ \mathtt { b } } } } } \\ { { \mathrm { r e c r ~ \ \mathtt { - ~ \mathtt { \mathtt { z } } } ~ \left[ \mathtt { \mathtt { I } } \right] ~ \ \left[ \mathtt { a } ~ \mathtt { \xi } \right] ~ \ = ~ \mathtt { z } ~ } } } \\ { { \mathrm { r e c r ~ \mathtt { { f } } ~ \mathtt { { z } } ~ \left( \mathtt { x } ~ : ~ \mathtt { x s } \right) ~ = ~ \mathtt { f } ~ \mathtt { x } ~ \mathtt { x s } ~ \left( \mathtt { r e c r } ~ \mathtt { { f } } ~ \mathtt { \mathtt { z } } ~ \mathtt { x s } \right) } } } \end{array}
$$

a. Denir la función sacarUna :: Eq a $= >$ a -> [a] -> [a], que dados un elemento y una lista devuelve el resultado de eliminar de la lista la primera aparición del elemento (si está presente).   
b. Explicar por qué el esquema de recursión estructural (foldr) no es adecuado para implementar la función sacarUna del punto anterior.   
c. Denr la función insertarOrdenado :: Ord a $= >$ a -> [a] -> [a] que inserta un elemento en una lista ordenada (de manera creciente), de manera que se preserva el ordenamiento.

# Ejercicio 7 ⋆

Denir las siguientes funciones para trabajar sobre listas, $_ \mathrm { y }$ dar su tipo. Todas ellas deben poder aplicarse a listas nitas e innitas.

i. mapPares, una versión de map que toma una función curricada de dos argumentos y una lista de pares de valores, y devuelve la lista de aplicaciones de la función a cada par. Pista: recordar curry y uncurry.   
ii. armarPares, que dadas dos listas arma una lista de pares que contiene, en cada posición, el elemento correspondiente a esa posición en cada una de las listas. Si una de las listas es más larga que la otra, ignorar los elementos que sobran (el resultado tendrá la longitud de la lista más corta). Esta función en Haskell se llama zip. Pista: aprovechar la curricación y utilizar evaluación parcial.

iii. mapDoble, una variante de mapPares, que toma una función curricada de dos argumentos y dos listas (de igual longitud), y devuelve una lista de aplicaciones de la función a cada elemento correspondiente de las dos listas. Esta función en Haskell se llama zipWith.

# Ejercicio 8

i. Escribir la función sumaMat, que representa la suma de matrices, usando zipWith. Representaremos una matriz como la lista de sus las. Esto quiere decir que cada matriz será una lista nita de listas nitas, todas de la misma longitud, con elementos enteros. Recordamos que la suma de matrices se dene como la suma celda a celda. Asumir que las dos matrices a sumar están bien formadas y tienen las mismas dimensiones.

sumaMat :: [[Int]] -> [[Int]] -> [[Int]]

ii. Escribir la función trasponer, que, dada una matriz como las del ítem i, devuelva su traspuesta. Es decir, en la posición $i , j$ del resultado está el contenido de la posición $j , i$ de la matriz original. Notar que si la entrada es una lista de $N$ listas, todas de longitud $M$ , la salida debe tener $M$ listas, todas de longitud $N$ . trasponer :: [[Int]] -> [[Int]]

# Otras estructuras de datos

En esta sección se permite (y se espera) el uso de recursión explícita únicamente para la denición de esquemas de recursión.

# Ejercicio 9 ⋆

i. Denir y dar el tipo del esquema de recursión foldNat sobre los naturales. Utilizar el tipo Integer de Haskell (la función va a estar denida sólo para los enteros mayores o iguales que 0).

ii. Utilizando foldNat, denir la función potencia.

# Ejercicio 10

i. Denir la función genLista :: a -> (a -> a) -> Integer -> [a], que genera una lista de una cantidad dada de elementos, a partir de un elemento inicial y de una función de incremento entre los elementos de la lista. Dicha función de incremento, dado un elemento de la lista, devuelve el elemento siguiente.

ii. Usando genLista, denir la función desdeHasta, que dado un par de números (el primero menor que el segundo), devuelve una lista de números consecutivos desde el primero hasta el segundo.

# Ejercicio 11

Denir el esquema de recursión estructural para el siguiente tipo:

data Polinomio a $\begin{array} { r l } { = } & { { } \texttt { X } } \\ { \mid } & { { } { \mathsf { C t e ~ \_ a } } } \\ { \mid } & { { } { \mathsf { S u m a ~ \_ ( P o l i n o m i o ~ a ) } } \quad { \mathsf { ( P o l i n o m i o m i o ~ a ) } } } \\ { \mid } & { { } { \mathsf { P r o d ~ \_ ( P o l i n o m i o ~ a ) } } \quad { \mathsf { ( P o l i n o m i o ~ a ) } } } \end{array}$

Luego usar el esquema denido para escribir la función evaluar :: Num a $= >$ a -> Polinomio a -> a que, dado un número y un polinomio, devuelve el resultado de evaluar el polinomio dado en el número dado.

# Ejercicio $\mathbf { 1 2 \star }$

Considerar el siguiente tipo, que representa a los árboles binarios: data AB $\mathrm { ~ a ~ } = \mathrm { ~ N i 1 ~ }$ | Bin (AB a) a (AB a)

i. Usando recursión explícita, denir los esquemas de recursión estructural (foldAB) y primitiva (recAB), y dar sus tipos.

ii. Denir las funciones esNil, altura y cantNodos (para esNil puede utilizarse case en lugar de foldAB o recAB).

iii. Denir la función mejorSegún :: $( \mathtt { a } - > \mathtt { a } - > \mathtt { B o o l } ) \ \mathtt { - } > \mathtt { A B } \ \mathtt { a } - > \mathtt { a }$ , análoga a la del ejercicio 3, para árboles. Se recomienda denir una función auxiliar para comparar la raíz con un posible resultado de la recursión para un árbol que puede o no ser Nil.

iv. Denir la función esABB :: Ord $\mathtt { a } = >$ AB $\tt a \to \tt B o o l$ que chequea si un árbol es un árbol binario de búsqueda. Recordar que, en un árbol binario de búsqueda, el valor de un nodo es mayor o igual que los valores que aparecen en el subárbol izquierdo $_ \mathrm { y }$ es estrictamente menor que los valores que aparecen en el subárbol derecho.

v. Justicar la elección de los esquemas de recursión utilizados para los tres puntos anteriores.

# Ejercicio 13

Dado el tipo AB a del ejercicio 12:

i. Denir las funciones ramas (caminos desde la raíz hasta las hojas), cantHojas y espejo.

ii. Denir la función mismaEstructura :: AB a -> AB b -> Bool que, dados dos árboles, indica si éstos tienen la misma forma, independientemente del contenido de sus nodos. Pista: usar evaluación parcial y recordar el ejercicio 7.

# Ejercicio 14

Se desea modelar en Haskell los árboles con información en las hojas (y sólo en ellas). Para esto introduciremos el siguiente tipo:

data AIH a $=$ Hoja a | Bin (AIH a) (AIH a)

a) Denir el esquema de recursión estructural foldAIH y dar su tipo. Por tratarse del primer esquema de recursión que tenemos para este tipo, se permite usar recursión explícita.

b) Escribir las funciones altura :: AIH a $^ { - > }$ Integer y tamaño :: AIH a -> Integer. Considerar que la altura de una hoja es $1 \mathrm { ~ y ~ }$ el tamaño de un AIH es su cantidad de hojas.

# Ejercicio 15 ⋆

i. Denir el tipo RoseTree de árboles no vacíos, con una cantidad indeterminada de hijos para cada nodo.

ii. Escribir el esquema de recursión estructural para RoseTree. Importante escribir primero su tipo.

iii. Usando el esquema denido, escribir las siguientes funciones:

a) hojas, que dado un RoseTree, devuelva una lista con sus hojas ordenadas de izquierda a derecha, según su aparición en el RoseTree.   
b) distancias, que dado un RoseTree, devuelva las distancias de su raíz a cada una de sus hojas.   
c) altura, que devuelve la altura de un RoseTree (la cantidad de nodos de la rama más larga). Si el RoseTree es una hoja, se considera que su altura es 1.

Ejercicio 16 (Opcional)

Se desea representar conjuntos mediante Hashing abierto (chain addressing). El Hashing abierto consta de dos funciones: una función de Hash, que dado un elemento devuelve un valor entero (el cual se espera que no se repita con frecuencia), y una tabla de Hash, que dado un número entero devuelve los elementos del conjunto a los que la función de Hash asignó dicho número (es decir, la preimagen de la función de Hash para ese número).

Los representaremos en Haskell de la siguiente manera:

data HashSet a $=$ Hash (a -> Integer) (Integer -> [a])

Por contexto de uso, vamos a suponer que la tabla de Hash es una función total, que devuelve listas vacías para los números que no corresponden a elementos del conjunto. Este es un invariante que deberá preservarse en todas las funciones que devuelvan conjuntos.

Denir las siguientes funciones:

i. vacío :: (a -> Integer) $^ { - > }$ HashSet a, que devuelve un conjunto vacío con la función de Hash indicada.

ii. pertenece :: Eq a $= >$ a $^ { - > }$ HashSet a $^ { - > }$ Bool, que indica si un elemento pertenece a un conjunto. Es decir, si se encuentra en la lista obtenida en la tabla de Hash para el número correspondiente a la función de Hash del elemento.

Por ejemplo:

pertenece $\textsf { 5 } \$ \$ \$ \$ \$ \varnothing$ agregar $1 \ \$ 8$ agregar $2 \$ 8$ agregar 1 $\$ 1$ vacío (flip mod 5) devuelve False.   
pertenece $2 \$ 8$ agregar $1 \ \$ 1$ agregar 2 $\$ 1$ agregar 1 $\$ 1$ vacío (flip mod 5) devuelve True.

iii. agregar :: Eq a $= >$ a $^ { - > }$ HashSet a $^ { - > }$ HashSet a, que agrega un elemento a un conjunto. Si el elemento ya estaba en el conjunto, se debe devolver el conjunto sin modicaciones.

iv. intersección :: Eq a $= >$ HashSet a -> HashSet a -> HashSet a que, dados dos conjuntos, devuelve un conjunto con la misma función de Hash del primero y con los elementos que pertenecen a ambos conjuntos a la vez.

v. foldr1(no relacionada con los conjuntos). Dar el tipo y denir la función foldr1 para listas sin usar recursión explícita, recurriendo a alguno de los esquemas de recursión conocidos.

Se recomienda usar la función error :: String -> a para el caso de la lista vacía.

# Generación infinita

Para resolver los ejercicios de esta parte se recomienda leer el apunte "Las tres leyes de la generación innita", que se encuentra en la sección Útil del campus.

# Ejercicio 17

$\dot { \downarrow } ^ { \mathrm { C u } \acute { \mathrm { a l } } }$ es el valor de esta expresión?

$$
[ \texttt { x } | \texttt { x } < - \texttt { [ 1 . . 3 ] } , \texttt { y } < - \texttt { [ x . 3 ] } , \texttt { ( x + y ) } ^ { \texttt { c } } \texttt { m o d } ^ { \texttt { 3 } } = = \texttt { 0 } ]
$$

# Ejercicio ${ \bf 1 8 \star }$

Denir la lista innita paresDeNat::[(Int,Int)], que contenga todos los pares de números naturales: (0,0), (0,1), (1,0), etc.

# Ejercicio 19

Una tripla pitagórica es una tripla (a, b, c) de enteros positivos tal que $a ^ { 2 } + b ^ { 2 } = c ^ { 2 }$ .

La siguiente expresión intenta ser una denición de una lista (innita) de triplas pitagóricas:

pitagóricas :: [(Integer, Integer, Integer)] pitagóricas $=$ [(a, b, c) | a <- [1..], b <-[1..], c <- [1..], a^2 + b^2 == c^2]

Explicar por qué esta denición no es útil. Dar una denición mejor.

# Ejercicio $\mathbf { 2 0 \star }$

Escribir la función listasQueSuman :: Int -> [[Int]] que, dado un número natural $n$ , devuelve todas las listas de enteros positivos (es decir, mayores o iguales que 1) cuya suma sea $n$ . Para este ejercicio se permite usar recursión explícita. Pensar por qué la recursón utilizada no es estructural. (Este ejercicio no es de generación innita, pero puede ser útil para otras funciones que generen listas innitas de listas).

# Ejercicio $\bf { 2 1 } \star$

Denir en Haskell una lista que contenga todas las listas nitas de enteros positivos (esto es, con elementos mayores o iguales que 1).

# Ejercicio 22

Dado el tipo de datos AIH a denido en el ejercicio 14:

a) Denir la lista (innita) de todos los AIH cuyas hojas tienen tipo ()1. Se recomienda denir una función auxiliar. Para este ejercicio se permite utilizar recursión explícita.

b) Explicar por qué la recursión utilizada en el punto a) no es estructural.