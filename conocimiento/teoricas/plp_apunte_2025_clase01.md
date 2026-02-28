# Paradigmas de Programaci´on

Fundamentos de programaci´on funcional

2do cuatrimestre de 2025 Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

# 1

# Fundamentos de programaci´on funcional

Ejercicios

$$
2
$$

# Programaci´on funcional

Un problema central en computaci´on es el de procesar informaci´on:

La programaci´on funcional consiste en definir funciones y aplicarlas para procesar informaci´on.

Las “funciones” son verdaderamente funciones (parciales):

Aplicar una funci´on no tiene efectos secundarios.   
A una misma entrada corresponde siempre la misma salida.   
Las estructuras de datos son inmutables.

Las funciones son datos como cualquier otro:

Se pueden pasar como par´ametros.   
Se pueden devolver como resultados.   
Pueden formar parte de estructuras de datos.   
(Ej. ´arbol binario en cuyos nodos hay funciones).

$$
3
$$

# Programaci´on funcional

Un programa funcional est´a dado por un conjunto de ecuaciones:

# Ejemplo

longitud [] = 0 longitud (x : xs) = 1 + longitud xs

longitud [10, 20, 30] ≡ longitud (10 : (20 : (30 : []))) 1 + longitud (20 : (30 : [])) = 1 + (1 + (longitud (30 : []))) 1 + (1 + (1 + longitud [])) 1 + (1 + (1 + 0)) 1 + (1 + 1) = 1 + 2 = 3

$$
4
$$

# Expresiones

Las expresiones son secuencias de s´ımbolos que sirven para representar datos, funciones y funciones aplicadas a los datos. (Recordemos: las funciones tambi´en son datos).

Una expresi´on puede ser:

1. Un constructor: True False [] (:) 0 1 2 ...

2. Una variable: longitud ordenar x xs (+) (\*) ...

3. La aplicaci´on de una expresi´on a otra:

ordenar lista   
not True   
not (not True)   
(+) 1   
((+) 1) (alCuadrado 5)

4. Tambi´en hay expresiones de otras formas, como veremos. Las tres de arriba son las fundamentales.

# Expresiones

Convenimos en que la aplicaci´on es asociativa a izquierda:

# Ejemplo

[1, 2]   
≡ 1 : [2]   
≡ (:) 1 [2]   
≡ ((:) 1) [2]   
≡ ((:) 1) (2 : [])   
≡ ((:) 1) ((:) 2 [])   
≡ ((:) 1) (((:) 2) [])

# 6

# Ejemplo

sumarUno = (+) 1

sumarUno (sumarUno 5) ((+) 1) (sumarUno 5) ≡ 1 + sumarUno 5 一 1 + ((+) 1) 5 1 + (1 + 5) 1 + 6 = 7

# 7

# Tipos

Hay secuencias de s´ımbolos que no son expresiones bien formadas.

# Ejemplo

Hay expresiones que est´an bien formadas pero no tienen sentido.

# Ejemplo

True + 1 0 1 [[], (+)]

# 8

#

Un tipo es una especificaci´on del invariante de un dato o de una funci´on.

# Ejemplo

99 :: Int   
not :: Bool -> Bool   
not True :: Bool   
(+) :: Int -> (Int -> Int)   
(+) 1 :: Int -> Int   
((+) 1) 2 :: Int

$$
9
$$

El tipo de una funci´on expresa un contrato.

#

# Condiciones de tipado

Para que un programa est´e bien tipado:

1. Todas las expresiones deben tener tipo.   
2. Cada variable se debe usar siempre con un mismo tipo.   
3. Los dos lados de una ecuaci´on deben tener el mismo tipo.   
4. El argumento de una funci´on debe tener el tipo del dominio.   
5. El resultado de una funci´on debe tener el tipo del codominio.

# S´olo tienen sentido los programas bien tipados.

No es necesario escribir expl´ıcitamente los tipos. (Inferencia).

# Tipos

# 11

Convenimos en que “->” es asociativo a derecha:

# Ejemplo

suma4 :: Int -> Int -> Int -> Int -> Int suma4 a b c $\texttt { d } = \texttt { a } + \texttt { b } + \texttt { c } + \texttt { d }$

a -> $\begin{array} { l l l l l l l l } { { > } } & { { { \bf b } } } & { {  } } & { { { \sf c } } } & { { \equiv } } & { { { \bf a }  ( { \bf b }  { \sf c } ) } } \\ { { > } } & { { { \bf b } } } & { {  { \mathrm {  ~ c ~ } } } } & { {  { \mathrm {  ~ d ~ } } } } & { { \equiv } } & { { { \bf a }  ( { \bf b }  { \mathrm {  ~ ( c ~ } } } } \end{array}$ ✚❩≡ (a -> b) -> ca -> -> d))

Se puede pensar as´ı:

suma4 :: Int -> (Int -> (Int -> (Int -> Int))) (((suma4 a) b) c) $\texttt { d } = \texttt { a } + \texttt { b } + \texttt { c } + \texttt { d }$

# Polimorfismo

Hay expresiones que tienen m´as de un tipo. Usamos variables de tipo a, b, c para denotar tipos desconocidos:

# 12

# Ejemplo

flip f x y = f y x ¿Qu´e tipo tiene flip?

flip (:) [2, 3] 1 = (:) 1 [2, 3] ≡ 1 : [2, 3] = [1, 2, 3]

# Modelo de c´omputo

Dada una expresi´on, se computa su valor usando las ecuaciones:

![](images/b6ea02d2d84a9844d938c88ae586000cb56030ab40771dd31e4c730ffb7beef6.jpg)

Hay expresiones bien tipadas que no tienen valor. Ej.: 1 / 0.   
Decimos que dichas expresiones se indefinen o que tienen valor ⊥.

$$
\mathsf { M o d e l o ~ d e ~ c o m p u t o }
$$

Un programa funcional est´a dado por un conjunto de ecuaciones.   
M´as precisamente, por un conjunto de ecuaciones orientadas.

Una ecuaci´on e1 $=$ e2 se interpreta desde dos puntos de vista:

1. Punto de vista denotacional. Declara que e1 y e2 tienen el mismo significado.

2. Punto de vista operacional. Computar el valor de e1 se reduce a computar el valor de e2.

# Modelo de c´omputo

El lado izquierdo de una ecuaci´on no es una expresi´on arbitraria.   
Debe ser una funci´on aplicada a patrones.

Un patr´on puede ser:

1. Una variable. 2. Un comod´ın _. 3. Un constructor aplicado a patrones. El lado izquierdo no debe contener variables repetidas.

# Ejemplo

¿Cu´ales ecuaciones est´an sint´acticamente bien formadas?

sumaPrimeros (x : y : z : _) = x + y + z   
predecesor $( { \mathfrak { n } } + \ { \mathfrak { 1 } } ) \ = \ { \mathfrak { n } }$   
iguales x x = True

# Modelo de c´omputo

Evaluar una expresi´on consiste en:

1. Buscar la subexpresi´on m´as externa que coincida con el lado izquierdo de una ecuaci´on.   
2. Reemplazar la subexpresi´on que coincide con el lado izquierdo de la ecuaci´on por la expresi´on correspondiente al lado derecho.   
3. Continuar evaluando la expresi´on resultante.

La evaluaci´on se detiene cuando se da uno de los siguientes casos:

La expresi´on es un constructor o un constructor aplicado.

True (:) 1 [1, 2, 3]

2. La expresi´on es una funci´on parcialmente aplicada.

(+) (+) 5

3. Se alcanza un estado de error. Un estado de error es una expresi´on que no coincide con las ecuaciones que definen a la funci´on aplicada.

# Modelo de c´omputo

Ejemplo: resultado — constructor

tail :: [a] -> [a] tail (_ : xs) = xs

tail (tail [1, 2, 3]) ⇝ tail [2, 3] ⇝ [3]

Ejemplo: resultado — funci´on parcialmente aplicada

const :: a -> b -> a const x y = x

const (const 1) 2 ⇝ const 1

# Modelo de c´omputo

Ejemplo: indefinici´on — error

head :: [a] -> a head (x : _) = x

head (head [[], [1], [1, 1]]) ⇝ head [] ⇝ ⊥

Ejemplo: indefinici´on — no terminaci´on

loop :: Int -> a loop n = loop (n + 1)

loop 0 ⇝ loop (1 + 0) ⇝ loop (1 + (1 + 0)) ⇝ loop (1 + (1 + (1 + 0)))

$$
\mathsf { M o d e l o ~ d e ~ c o m p u t o }
$$

# Ejemplo: evaluaci´on no estricta

indefinido :: Int indefinido $=$ indefinido

head (tail [indefinido, 1, indefinido]) ⇝ head [1, indefinido] ⇝ 1

# Modelo de c´omputo

# Ejemplo: listas infinitas

desde :: Int -> [Int] desde $\mathrm { ~ \tt ~ n ~ } = \mathrm { ~ \tt ~ n ~ }$ : desde $\mathrm { ~ ( ~ n ~ + ~ } \mathrm { ~ 1 ~ ) ~ }$

desde 0   
⇝ 0 : desde 1   
⇝ 0 : (1 : desde 2)   
⇝ 0 : (1 : (2 : desde 3)) ⇝

head (tail (desde 0)) ⇝ head (tail (0 : desde 1)) head (desde 1) head (1 : desde 2) ⇝ 1

# Modelo de c´omputo

Nota. En Haskell, el orden de las ecuaciones es relevante.   
Si hay varias ecuaciones que coinciden se usa siempre la primera.

# Ejemplo

esCorta (_ : _ : _) = False esCorta _ $=$ True

esCorta [] ⇝ True esCorta [1] True esCorta [1, 2] False

# Funciones de orden superior

Definamos la composici´on de funciones (“g . f”).

Otra forma de definirla (usando la notaci´on “lambda”):

# Funciones de orden superior

¿Qu´e tienen en com´un las siguientes funciones?

dobleL :: [Float] -> [Float] dobleL [] = [] dobleL (x : xs) = x \* 2 : dobleL xs

esParL :: [Int] -> [Bool]   
esParL [] = []   
esParL (x : xs) = x ‘mod‘ 2 == 0 : esParL xs   
longitudL :: [[a]] -> [Int]   
longitudL [] = []   
longitudL (x : xs) = length x : longitudL xs

Todas ellas siguen el esquema:

g [] = [] g (x : xs) = f x : g xs

# Funciones de orden superior

¿C´omo se puede abstraer el esquema?

map :: (a -> b) -> [a] -> [b] map f [] = [] map f (x : xs) = f x : map f xs

Hagamos dobleL, esParL y longitudL con map.

dobleL xs = map (\ x -> x \* 2) xs esParL xs = map (\ x -> x ‘mod‘ $2 \ = = \ 0 )$ ) xs longitudL xs $=$ map length xs

Otra manera:

dobleL = map (\* 2)   
esParL = map ((== 0) . (‘mod‘ 2))   
longitudL $=$ map length

$$
2 4
$$

# Funciones de orden superior

¿Qu´e relaci´on hay entre las siguientes funciones?

negativos :: [Int] -> [Int] negativos [] = [] negativos (x : xs) = if x < 0 then x : negativos xs else negativos xs

noVacias :: [[a]] -> [[a]] noVacias [] = [] noVacias (x : xs) = if not (null x)

Ambas siguen el esquema:

g $\begin{array} { l } { { [ \begin{array} { l l l l l l } { { [ \begin{array} { l l l l l l } { { [ \begin{array} { l } { { \bf { \bar { \Phi } } } } } & { { { \bf { x } } } { { \bf { s } } } } \end{array} ] } } } & { { = } } & { { [ \begin{array} { l } { { \bf { \bar { \Phi } } } } \\ { { \bf { x } } } \end{array}  } } \\ { { ( { \bf { x } } } & { { : } } & { { \bf { x } } { \bf { s } } ) } } & { { = } } & { { \mathrm { i } } { \bf { f } } \mathrm { ~ \Lambda p ~ } \mathrm { ~ x ~ } } } \end{array}  }  \end{array} \end{array}$   
g then x : g xs else g xs

# Funciones de orden superior

¿C´omo se puede abstraer el esquema?

filter :: (a -> Bool) -> [a] -> [a] filter p [] = [] filter p (x : xs) = if p x

Hagamos negativos y noVacias usando filter.

negativos $=$ filter (< 0) noVacias $=$ filter (not . null)

# Ejercicio (tarea)

merge :: (a -> a -> Bool) -> [a] -> [a] -> [a] mergesort :: (a -> a -> Bool) -> [a] -> [a]

El primer par´ametro es una funci´on que determina una relaci´on de orden total entre los elementos de tipo a.

# Fundamentos de programaci´on funcional

Ejercicios

$$
^ { 2 8 }
$$

# Algunos esquemas de recursi´on

a) Definir una funci´on:

operatoria :: (a -> a -> a) -> [a] -> a que dada una operaci´on binaria (que asumimos asociativa) y una lista no vac´ıa devuelve el resultado de hacer la operaci´on entre todos los elementos.

Informalmente:

b) Definir la sumatoria y la productoria como casos particulares.

# Algunos esquemas de recursi´on

a) Definir una funci´on:

mientras :: (a -> Bool) -> (a -> a) -> a -> a que dada una condici´on, una funci´on de transformaci´on de estados y un estado inicial devuelva el resultado final que se alcanza aplicando repetidamente la funci´on de transformaci´on mientras se cumpla la condici´on.

b) Usando la funci´on mientras, definir la funci´on que computa el $n -$ -´esimo elemento de la sucesi´on de Fibonacci de manera iterativa.

Recordemos que:

$$
= 0 \qquad F _ { 1 } = 1 \qquad F _ { n + 2 } = F _ { n } + F _ { n + 1 }
$$

# Arboles binarios infinitos ´

Un ´arbol binario (AB) se representa como un valor del tipo:

data AB a = Nil | Bin (AB a) a (AB a)

Un AB infinito (ABI) se representa como un valor del tipo:

data ABI a $=$ IBin (ABI a) a (ABI a)

Definir una funci´on:

podadoDesdeElNivel :: Int -> ABI a -> AB a de tal modo que podadoDesdeElNivel n a denota el AB que resulta de podar el ´arbol a a partir del nivel $^ { n }$ .

# Arboles binarios infinitos ´

Consideremos los tipos de datos de las direcciones, y los caminos (listas finitas de direcciones):

data Direcci´on $=$ Izq | Der type Camino $=$ [Direcci´on]

Un ´arbol binario infinito cuyos nodos tienen datos de tipo a se puede representar tambi´en como una funci´on de caminos que, dado un camino, indica el valor del nodo en dicha posici´on:

type Funci´onDeCaminos a $=$ Camino -> a

# Ejercicio

a) Definir una funci´on:

funci´onDeCaminosDe :: ABI a -> Funci´onDeCaminos a que dado un ABI devuelve su funci´on de caminos.

b) Definir la funci´on inversa:

abiDe :: Funci´onDeCaminos a -> ABI a que dada una funci´on de caminos devuelve su ABI.

$$
3 2
$$

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

Lectura recomendada   
Cap´ıtulo 4 del libro de Bird.   
Richard Bird. Thinking functionally with Haskell. Cambridge University Press, 2015.

# Comentarios: tipos

Ojo. Dijimos:

“Cada variable se debe usar siempre con un mismo tipo.”

¿Est´a bien tipado el siguiente programa?

sucesor :: Int -> Int sucesor $\textbf { z } = \textbf { x } + \textbf { 1 }$

$$
3 4
$$

opuesto :: Bool -> Bool opuesto x = not x

S´ı. Hay dos “x” con distinto tipo pero son variables distintas. El programa se podr´ıa reescribir as´ı:

$$
\begin{array} { l } { \mathrm { s u c e s o r ~ x ~ = ~ x ~ + ~ 1 ~ } } \\ { \mathrm { o p u e s t o ~ y ~ = ~ n o t ~ y ~ } } \end{array}
$$