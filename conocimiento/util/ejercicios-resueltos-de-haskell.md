# Ejercicio 1

Sea el siguiente tipo: type Punto $=$ (Int,Int)

Definir, usando listas por comprensi´on, una lista (infinita) puntosDelPlano::[Punto] que contenga todos los puntos del cuadrante superior derecho del plano.

Atenci´on: la funci´on debe garantizar que eventualmente todo punto del cuadrante superior derecho ser´a listado. Una forma de garantizar esto es recorrer los puntos siguiendo las diagonales $x + y = k$ , con $k = 0 , 1 , 2 , 3 , \ldots$ (ver el gr´afico).

Ejemplo: [ (0,0), (0,1), (1,0), (0,2), (1,1), (2,0), (0,3), (1,2), (2,1), (3,0), (0,4), ... ]

![](images/1fe8a649c10d3234d73aa989065053d289a8a130d5624e3c30db152731dfae15.jpg)

# Soluci´on 1

puntosDelPlano :: [Punto] puntosDelPlano $=$ [(x, y) | k <- [0..], x <- [0..k], y<- [0..k], x + y == k]

# Soluci´on 2

puntosDelPlano :: [Punto] puntosDelPlano $=$ [(x,k-x) | k<-[0..], x<-[0..k]]

# Ejercicio 2

Definimos el siguiente tipo: data ´Arbol a $=$ Hoja a | Bin (´Arbol a) a (´Arbol a) Ejemplo: mi´Arbol $=$ Bin (Hoja 3) 5 (Bin (Hoja 7) 8 (Hoja 1))

Sea foldAB el siguiente esquema de recursi´on gen´erico para ´arboles:

foldAB f g (Hoja n) = f n foldAB f g $\left( \mathbb { B } \mathrm { i n } \ \mathrm { t } 1 \ \mathrm { ~ n ~ } \mathrm { t } 2 \right) \ \mathrm { ~ = ~ } \ \mathrm { g }$ (foldAB f g t1) n (foldAB f g t2) En la resoluci´on de este ejercicio, no usar recursi´on expl´ıcita.

1. Decir cu´al es el tipo de las funciones f, g y foldAB.

# Soluci´on

$a$ ) Miremos foldAB. Sabemos que recibe 3 par´ametros:

Por la forma en que esta definida foldAB, sabemos que el 3er par´ametro es un Arbol. ´ Adem´as, sabemos que el primer y segundo par´ametro son funciones.

$b$ ) Sabemos que f (el primer par´ametro de foldAB) recibe un s´olo par´ametro:

Por los usos de f en la definici´on de foldAB debemos pensar que en principio a y e podr´ıan ser tipos distintos.

) Sabemos que g (el segundo par´ametro de foldAB) recibe tres par´ametros:

$d$ ) Mirando:

foldAB f g (Bin t1 n t2) = g (foldAB f g t1) n (foldAB f g t2) Vemos que foldAB f g (Bin t1 n t2) es de tipo d (el tipo de retorno de foldAB). Adem´as foldAB f g t1 , foldAB f g t2 y g (foldAB f g t1) n (foldAB f g t2) tambi´en deben ser del mismo tipo. Por lo tanto:

e) Mirando ahora:

foldAB f g (Hoja n) = f n   
y sabiendo que foldAB f g (Hoja n) tiene que ser de tipo d, podemos concluir que   
f n tambi´en ser´a del mismo tipo. Por lo tanto:

foldAB :: (a -> d) -> (d -> h -> d -> d) -> ´Arbol c -> d

$f$ ) Mirando nuevamente:

foldAB f g (Hoja n) = f n   
Vemos que el par´ametro de f es del mismo tipo que los elementos del ´arbol. Lo mismo   
pasa con el segundo par´ametro de $\mathsf { g }$ en:

foldAB f g (Bin t1 n t2) = g (foldAB f g t1) n (foldAB f g t2) Por lo tanto:

No podemos deducir nada m´as. Haciendo un renombre de d por b nos queda:

2. Usando foldAB, definir una funci´on hojas :: ´Arbol a ->[a], que devuelva todas las hojas de un ´arbol.

Ejemplo: hojas mi´Arbol devuelve [3, 7, 1]

# Soluci´on

hojas $=$ foldAB singleton union where singleton $\begin{array} { r } { \mathrm { ~  ~ x ~ } = \mathrm { ~  ~ \left[ x \right] ~ } } \end{array}$ union xs x ys $=$ xs $^ { + + }$ ys

3. Usando foldAB, definir una funci´on espejo :: ´Arbol a ->´Arbol a, que devuelva el ´arbol que resulte de invertir en todos los niveles el sub´arbol izquierdo por el derecho.

Ejemplo: espejo mi´Arbol devuelve el ´arbol Bin (Bin (Hoja 1) 8 (Hoja 7)) 5 (Hoja 3) Soluci´on

espejo $=$ foldAB Hoja rbin where rbin t x t’ = Bin t’ x t

4. Usando foldAB, definir una funci´on ramas :: ´Arbol a $- >$ [[a]], que devuelva la lista de ramas de un ´arbol.

Ejemplo: ramas mi´Arbol devuelve [[5,3],[5,8,7],[5,8,1]]

# Soluci´on

ramas $=$ foldAB singleton merge where singleton $\begin{array} { r } { \textbf { x } = ~ \left[ \left[ \mathbf { x } \right] \right] } \end{array}$ merge xs x ys $=$ (map (x:) xs) ++ (map (x:) ys)

ramas $=$ foldAB ((:[]).(:[])) merge where merge xs x ys $=$ (map (x:) xs) ++ (map (x:) ys)

# Ejercicio 3

Dado el siguiente tipo, que representa un ´arbol arbitrario o RoseTree: data ´Arbol a $=$ Rose(a, [´Arbol a]) deducir el tipo de la siguiente funci´on: g a f $=$ Rose(a, map (flip g f) (f a)) donde:

flip f x y = f y x Soluci´on

Sabemos que $\mathsf { g }$ recibe dos par´ametros: g :: a -> b -> c El resultado de g es un ´Arbol: (por Rose): g :: a -> b -> ´Arbol c

En la expresi´on $\boxed { \textbf { f } \textbf { a } } .$ vemos que f (el segundo par´ametro) debe ser una funci´on de por lo menos un par´ametro:

g :: a -> (b -> d) -> ´Arbol c

A su vez, $\boxed { \textbf { f } \textbf { a } }$ es el segundo argumento de map en map (flip g f) (f a) , y por lo tanto debe ser una lista:

g :: a -> (b -> [d]) -> ´Arbol c

Notemos que el primer par´ametro de $\mathsf { g }$ sirve como par´ametro a f y como elemento del ´arbol resultado, con lo cual:

Por otro lado, sabemos que el tipo de flip es:

flip :: (a -> b -> c) -> (b -> a -> c)

Quiere decir que:

flip g :: (a -> [d]) -> a -> ´Arbol a

Entonces:

flip g f :: a -> ´Arbol a Como el primer par´ametro de map en map (flip g f) (f a) es una funci´on de tipo a $- >$ ´Arbol a, los elementos de la lista f a deben ser de tipo a. Por lo tanto:

Podemos ver que todo cierra porque todo el map devuelve [´Arbol a], es es lo que necesita el constructor Rose de ´Arbol

# Ejercicio 4

1. Definir la funci´on:

foldr2:: ( $\texttt { a } \to \texttt { b } \to \texttt { c } \to \texttt { c } ) \to \texttt { c } \to \texttt { [ a ] } \to \texttt { [ b ] } \to \texttt { c }$

Esta funci´on es similar a foldr, pero trabaja sobre dos listas en lugar de una. La funci´on que recibe como par´ametro se aplica a un elemento de cada lista y al caso base calculado hasta el momento. Ambas listas son recorridas de derecha a izquierda y la funci´on s´olo debe estar definida para listas de igual longitud.

Por ejemplo, el resultado de evaluar esta expresi´on:

foldr2 (\x y b -> (x,y):b) [] [1,2,3] [‘a’,‘b’,‘c’] es: $[ ( 1 , ^ { \prime } { \mathsf { a } } ^ { \prime } ) , ( 2 , ^ { \prime } { \mathsf { b } } ^ { \prime } ) , ( 3 , ^ { \prime } { \mathsf { c } } ^ { \prime } ) ]$

# Soluci´on

$$
( a ~  ~ b ~ - > ~ c ~ - > ~ c ) - > ~ c ~ - > ~ [ a ] - > ~ [ b ] - > ~ c
$$

foldr2 f b $[ ] \ [ ] = \ \mathtt { b }$ foldr2 f b (x:xs) (y:ys) = f x y (foldr2 f b xs ys)

2. Sea el tipo:

type Matriz a $=$ [[a]]

Utilizando foldr2 y listas por comprensi´on, y sin utilizar recursi´on expl´ıcita, definir el operador:

(<\*>) :: Matriz a $- >$ Matriz a $- >$ Matriz a

Este operador toma dos matrices y devuelve el producto entre ellas. Recordar que el producto entre dos matrices $m _ { 1 }$ y $m _ { 2 }$ s´olo est´a definido cuando $m _ { 1 }$ es de $N \times M$ y $m _ { 2 }$ es de $M \times T$ .

Por ejemplo:

1 2 1 2 3 9 12 15   
4 5 X 4 5 6 = 24 33 42   
7 8 39 54 69

Ayuda: Se cuenta con la siguiente funci´on:

col :: Int -> Matriz a -> [a] col i $=$ map (!!i)

que devuelve la i-´esima columna de una matriz (la primera columna corresponde al $0$ ).

# Soluci´on

cols m = [col z m | z <- [0..((length (m!!0)) - 1)]]   
$( < * > )$ ) m1 m2 = [ [ foldr2 (\x y b -> x\*y + b) 0 (m1!!i) ((cols m2)!!j) | j <- [0..(length (cols m2)) - 1] ] | i <- [0..(length m1) - 1] ] i <- [0..(length m1) - 1] es la lista de ´ındices de filas de m1, es decir $0 \ldots N - 1$ . j <- [0..(length (cols m2)) - 1] es la lista de ´ındices de columnas de m2, es decir $0 \dots T - 1$ . La lista interna es una de las filas de la matriz resultado. Cada fila tendr´a $T$ columnas. La lista de afuera es la lista de filas de la matriz resultado: habr´a $N$ filas, como era de esperarse. m1!!i es la $i$ -´esima fila de la matriz m1. cols $\mathtt { m 2 ! ! j }$ es la $j$ -´esima columna de la matriz m2. La funci´on $( \backslash \mathrm { \texttt { x y b } } \to \mathrm { \texttt { x } } \mathrm { \cdot } \mathrm { \texttt { y } } + \mathrm { \texttt { b } } )$ toma un elemento de la fila y otro de la columna, los multiplica entre s´ı y los suma al acumulado. Quiere decir que cada elemento de la lista de m´as adentro es el resultado de multiplicar una fila de m1 por una columna de m2.

Es decir:

$$
( m 1 < * > m 2 ) _ { i j } = \sum _ { k } m 1 _ { i k } * m 2 _ { k j }
$$