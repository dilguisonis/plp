# Programaci´on Funcional (parte 2)

Paradigmas de (lenguajes de) programaci´on

2 de septiembre de 2025

# Esquemas de recursi´on estructural sobre listas

Para situaciones en las cuales no hay un caso base claro (ej: no existe el neutro), tenemos las funciones: foldr1 y foldl1 . Permiten hacer recursi´on estructural sobre listas sin definir un caso base:

foldr1 toma como caso base el ´ultimo elemento de la lista.

. foldl1 toma como caso base el primer elemento de la lista.

Para ambas, la lista no debe ser vac´ıa, y el tipo del resultado debe ser el de los elementos de la lista.

# Esquemas de recursi´on estructural sobre listas

Para situaciones en las cuales no hay un caso base claro (ej: no existe el neutro), tenemos las funciones: foldr1 y foldl1 . Permiten hacer recursi´on estructural sobre listas sin definir un caso base:

foldr1 toma como caso base el ´ultimo elemento de la lista.   
foldl1 toma como caso base el primer elemento de la lista.

Para ambas, la lista no debe ser vac´ıa, y el tipo del resultado debe ser el de los elementos de la lista.

Definir alguna de las siguientes funciones

last :: [ a] −> a   
maximum :: Ord a => [a] −> a   
mejorSeg´un :: (a −> a −> Bool) −> [a] −> a

Implementar las siguientes funciones utilizando esquemas de recursi´on

1 elem :: Eq a $\Rightarrow$ a -> [a] -> Bool que indica si un elemento pertence o no a la lista.

2 take :: Int -> [a]-> [a] utilizando foldr.

sacarUna:: Eq a $\Rightarrow$ a -> [a] -> [a] que elimina la primera aparici´on de un elemento en la lista.

Implementar las siguientes funciones utilizando esquemas de recursi´on

1 elem :: Eq a $\Rightarrow$ a -> [a] -> Bool que indica si un elemento pertence o no a la lista.

2 take :: Int -> [a]-> [a] utilizando foldr.

sacarUna:: Eq a $\Rightarrow$ a -> [a] -> [a] que elimina la primera aparici´on de un elemento en la lista.

¿Qu´e otros esquemas de recursi´on conocen?

Implementar las siguientes funciones utilizando esquemas de recursi´on

elem :: Eq a $\Rightarrow$ a -> [a] -> Bool que indica si un elemento pertence o no a la lista. take :: Int -> [a]-> [a] utilizando foldr. sacarUna:: Eq a $\Rightarrow$ a -> [a] -> [a] que elimina la primera aparici´on de un elemento en la lista. ¿Qu´e otros esquemas de recursi´on conocen? ¿Cu´ales de ellos pueden aplicarse a listas infinitas?

¿Qu´e tipo de recursi´on tiene cada una de las siguientes funciones? (Estructural, primitiva, global).

take’ :: [a] -> Int -> [a]   
take[]-=[]   
take’ (x:xs) ${ \textbf { n } } = { \dot { \textbf { 1 } } } { \dot { \mathbf { f } } }$ $\mathtt { n } = = 0$ then [] else x : take’ xs (n-1)   
listasQueSuman :: Int -> [[Int]]   
listasQueSuman $0 ~ = ~ [ [ ] ]$   
listasQueSuman n | $\mathrm { ~ \tt ~ { ~ n ~ } ~ } > \mathrm { ~ 0 ~ } = \mathrm { ~ \tt ~ { ~ \tt ~ { ~ \tt ~ { ~ \tt ~ { ~ \tt ~ { ~ \tt ~ { ~ \tt ~ { ~ \tt ~ { ~ \tt ~ { ~ \tt ~ { ~ ~ \tt ~ { ~ \tt ~ ~ } { ~ \tt ~ { ~ ~ \tt ~ { ~ \tt ~ ~ } { ~ \tt ~ ~ } } ~ } } } } } } } } } ~ } ~ } }$ [x : xs | x <- [1..n], xs <- listasQueSuman (n-x)]   
fact :: Int -> Int   
fact $\mathrm { ~ 0 ~ } = \mathrm { ~ 1 ~ }$   
fact n | $\texttt { n > 0 } = \texttt { n * f a c t } \left( \mathbf { n } { - } 1 \right)$   
fibonacci :: Int $- >$ Int   
fibonacci $\mathrm { ~ 0 ~ } = \mathrm { ~ 1 ~ }$   
fibonacci $\mathrm { ~ 1 ~ } = \mathrm { ~ 1 ~ }$   
fibonacci n | $\mathrm { ~ n ~ } > \mathrm { ~ 1 ~ } =$ fibonacci (n-1) $^ +$ fibonacci (n-2)

# Generaci´on Infinita

# Definir:

pares :: [(Int, Int)], una lista (infinita) que contenga todos los pares de n´umeros naturales (sin repetir).

# Generaci´on Infinita

# Definir:

pares :: [(Int, Int)], una lista (infinita) que contenga todos los pares de n´umeros naturales (sin repetir).

# Pr´actica 1, Ejercicio 21:

Definir en Haskell una lista que contenga todas las listas finitas de enteros positivos (esto es, con elementosmayores o iguales que 1).

Sea el siguiente tipo:

data AEB a $=$ Hoja a | Bin (AEB a) a (AEB a) Ejemplo: mi´Arbol $=$ Bin (Hoja 3) 5 (Bin (Hoja 7) 8 (Hoja 1))

Definir el esquema de recursi´on estructural (fold) para ´arboles estrictamente binarios, y dar su tipo.

El esquema debe permitir definir las funciones altura, ramas, cantNodos, cantHojas, espejo, etc.

Recordemos el tipo de foldr, el esquema de recursi´on estructural para listas.

¿Por qu´e tiene ese tipo?

(Pista: pensar en cu´ales son los constructores del tipo [a]).

Recordemos el tipo de foldr, el esquema de recursi´on estructural para listas.

¿Por qu´e tiene ese tipo?

(Pista: pensar en cu´ales son los constructores del tipo [a]).

Un esquema de recursi´on estructural espera recibir un argumento por cada constructor (para saber qu´e devolver en cada caso), y adem´as la estructura que va a recorrer.

El tipo de cada argumento va a depender de lo que reciba el constructor correspondiente. (¡Y todos van a devolver lo mismo!)

Si el constructor es recursivo, el argumento correspondiente del fold va a recibir el resultado de cada llamada recursiva.

# ¿C´omo hacemos? (Contin´ua)

Miremos bien la estructura del tipo.

data AEB a $=$ Hoja a Bin (AEB a) a (AEB a)

Estamos ante un tipo inductivo con un constructor no recursivo y un constructor recursivo.

Miremos bien la estructura del tipo.

data AEB a $=$ Hoja a Bin (AEB a) a (AEB a)

Estamos ante un tipo inductivo con un constructor no recursivo y un constructor recursivo.

¿Cu´al va a ser el tipo de nuestro fold?

Miremos bien la estructura del tipo.

data AEB a $=$ Hoja a Bin (AEB a) a (AEB a)

Estamos ante un tipo inductivo con un constructor no recursivo y un constructor recursivo.

¿Cu´al va a ser el tipo de nuestro fold?

¿Y la implementaci´on?

. Queremos ir de un AEB a a un b cualquiera.

. Queremos ir de un AEB a a un b cualquiera.

# AEB a -> b

Queremos ir de un AEB a a un b cualquiera.   
Necesitamos saber qu´e hacer para cada constructor.

AEB a -> b

Queremos ir de un AEB a a un b cualquiera.   
Necesitamos saber qu´e hacer para cada constructor.

foldAEB ::

->   
-> AEB a   
-> b

-- Si es Hoja Si es Bin -- Nuestro ´arbol -- Nuestro resultado

Queremos ir de un AEB a a un b cualquiera.   
Necesitamos saber qu´e hacer para cada constructor.   
En cada caso necesitamos devolver un el mismo tipo de resultado: b.

foldAEB ::

->   
-> AEB a   
-> b

-- Si es Hoja Si es Bin -- Nuestro ´arbol -- Nuestro resultado

Queremos ir de un AEB a a un b cualquiera.   
Necesitamos saber qu´e hacer para cada constructor.   
En cada caso necesitamos devolver un el mismo tipo de resultado: b.

foldAEB ::

( -> b) -> ( -> b) -> AEB a -> b

-- Si es Hoja Si es Bin -- Nuestro ´arbol -- Nuestro resultado

Queremos ir de un AEB a a un b cualquiera.   
Necesitamos saber qu´e hacer para cada constructor.   
。 En cada caso necesitamos devolver un el mismo tipo de resultado: b.   
Los par´ametros de cada constructor aparecen en el mismo orden en las funciones.

foldAEB ::

( -> b) -> ( -> b) -> AEB a -> b

-- Si es Hoja Si es Bin -- Nuestro ´arbol -- Nuestro resultado

Queremos ir de un AEB a a un b cualquiera.   
Necesitamos saber qu´e hacer para cada constructor.   
。 En cada caso necesitamos devolver un el mismo tipo de resultado: b.   
Los par´ametros de cada constructor aparecen en el mismo orden en las funciones.

foldAEB ::

( -> b) -- Si es Hoja -> ( -> -> -> b) -- Si es Bin -> AEB a -- Nuestro ´arbol -> b -- Nuestro resultado

Queremos ir de un AEB a a un b cualquiera.   
Necesitamos saber qu´e hacer para cada constructor.   
。 En cada caso necesitamos devolver un el mismo tipo de resultado: b.   
. Los par´ametros de cada constructor aparecen en el mismo orden en las funciones.   
Los par´ametros recursivos son un b, el resto mantiene el tipo.

foldAEB ::

( -> b) -- Si es Hoja -> ( -> -> -> b) -- Si es Bin -> AEB a -- Nuestro ´arbol -> b -- Nuestro resultado

Queremos ir de un AEB a a un b cualquiera.   
Necesitamos saber qu´e hacer para cada constructor.   
。 En cada caso necesitamos devolver un el mismo tipo de resultado: b.   
. Los par´ametros de cada constructor aparecen en el mismo orden en las funciones.   
Los par´ametros recursivos son un b, el resto mantiene el tipo.

foldAEB ::

-- Si es Hoja -- Si es Bin -- Nuestro ´arbol -- Nuestro resultado

Queremos ir de un AEB a a un b cualquiera.

Necesitamos saber qu´e hacer para cada constructor.

En cada caso necesitamos devolver un el mismo tipo de resultado: b.

Los par´ametros de cada constructor aparecen en el mismo orden en las funciones.

Los par´ametros recursivos son un b, el resto mantiene el tipo.

. Listo!

foldAEB ::

(a -> b) -> (b -> a -> b -> b) -> AEB a -> b

-- Si es Hoja -- Si es Bin -- Nuestro ´arbol -- Nuestro resultado

foldAEB :: (a -> b) -> (b -> a -> b -> b) -> AEB a -> b   
foldAEB fHoja fBin t $=$ case t of Hoja n -> fHoja n Bin t1 n t2 -> fBin (rec t1) n (rec t2) where rec $=$ foldAEB fHoja fBin Ejercicio para ustedes: definir las funciones altura, ramas, cantNodos, cantHojas y espejo usando foldAEB.   
Si quieren podemos hacer alguna en el pizarr´on.

Dado el tipo de datos:

data AB a $=$ Nil | Bin (AB a) a (AB a)

¿Qu´e tipo de recursi´on tiene cada una de las siguientes funciones? (Estructural, primitiva, global).

insertarABB :: Ord a $\Rightarrow$ a -> AB a -> AB a   
insertarABB $\texttt { x N i l } = \texttt { B i n } \texttt { N i l } \texttt { x N i l }$   
insertarABB x (Bin i r d) $=$ if $\textbf { x } < \textbf { r }$ then Bin (insertarABB x i) r d else Bin i r (insertarABB x d)   
truncar :: AB a -> Int -> AB a   
truncar Nil $\it { \Delta } . \Delta = \ v i 1$   
truncar (Bin i r d) $\texttt { n } = \texttt { i f } \texttt { n } = = \texttt { 0 }$ then Nil else Bin (truncar i (n-1)) r (truncar d (n-1))

Tarea: prueben escribir estas funciones con los esquemas de recursi´on

<table><tr><td>Paradigmas de (lenguajes de) programacion</td></tr><tr><td>Programacion Funcional (parte2)</td></tr><tr><td></td></tr></table>

Dado el siguiente tipo que representa polinomios:

data Polinomio a =

X   
Cte a   
Suma (Polinomio a) (Polinomio a) Prod (Polinomio a) (Polinomio a)

Definir la funci´on evaluar :: Num a $\Rightarrow$ a -> Polinomio a -> a

Dado el siguiente tipo que representa polinomios:

data Polinomio a =

X   
Cte a   
Suma (Polinomio a) (Polinomio a) Prod (Polinomio a) (Polinomio a)   
Definir la funci´on evaluar :: Num a $\Rightarrow$ a -> Polinomio a -> a   
. Definir el esquema de recursi´on estructural foldPoli para polinomios (y dar su tipo).

Dado el siguiente tipo que representa polinomios:

data Polinomio a =

X   
Cte a   
Suma (Polinomio a) (Polinomio a) Prod (Polinomio a) (Polinomio a)   
Definir la funci´on evaluar :: Num a $\Rightarrow$ a -> Polinomio a -> a   
Definir el esquema de recursi´on estructural foldPoli para polinomios (y dar su tipo).   
. Redefinir evaluar usando foldPoli.

Dado el tipo de datos

data RoseTree a $=$ Rose a [RoseTree a] de ´arboles donde cada nodo tiene una cantidad indeterminada de hijos.

1 Escribir el esquema de recursi´on estructural para RoseTree.

$\circ$ Usando el esquema definido, escribir las siguientes funciones:

hojas, que dado un RoseTree, devuelva una lista con sus hojas ordenadas de izquierda a derecha, seg´un su aparici´on en el RoseTree.   
ramas, que dado un RoseTree, devuelva los caminos de su ra´ız a cada una de sus hojas.   
tama\~no, que devuelve la cantidad de nodos de un RoseTree.   
altura, que devuelve la altura de un RoseTree (la cantidad de nodos de la rama m´as larga). Si el RoseTree es una hoja, se considera que su altura es 1.

# Funciones como estructuras de datos

# Representando conjuntos con funciones

Se cuenta con la siguiente representaci´on de conjuntos type Conj a $=$ (a->Bool) caracterizados por su funci´on de pertenencia. De este modo, si $c$ es un conjunto y $e$ un elemento, la expresi´on $c e$ devuelve True si $e$ pertenece a $c$ y False en caso contrario.

1 Definir la constante vac´ıo :: Conj a, y las funciones:

insertar :: Eq a $\Rightarrow$ a -> Conj a -> Conj a pertenece :: Eq a $\Rightarrow$ a -> Conj a -> Bool eliminar :: Eq a $\Rightarrow$ a -> Conj a -> Conj a

# Funciones como estructuras de datos

# Representando conjuntos con funciones

Se cuenta con la siguiente representaci´on de conjuntos type Conj a $=$ (a->Bool) caracterizados por su funci´on de pertenencia. De este modo, si $c$ es un conjunto y $e$ un elemento, la expresi´on $c e$ devuelve True si $e$ pertenece a $c$ y False en caso contrario.

1 Definir la constante vac´ıo :: Conj a, y las funciones:

insertar :: Eq a $\Rightarrow$ a -> Conj a -> Conj a pertenece :: Eq a $\Rightarrow$ a -> Conj a -> Bool eliminar :: Eq a $\Rightarrow$ a -> Conj a -> Conj a

2 Escribir las funciones intersecci´on, uni´on y diferencia (todas de tipo Conj a -> Conj a-> Conj a).

Revisar la secci´on ´util del campus, hay presentes apuntes sobre:

。 Recursi´on Generaci´on infinita

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?