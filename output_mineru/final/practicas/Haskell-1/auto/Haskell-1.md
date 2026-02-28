# Programaci´on Funcional en Haskell Primera parte

Paradigmas de Lenguajes de Programaci´on

Departamento de Ciencias de la Computaci´on Universidad de Buenos Aires

26 de agosto de 2025

# Repaso: usando GHCi

C´omo empezar:

![](images/31b5b4bca5b1f0a56a655149c97f6dc6249e762e29ca7782610e3fbea971e75e.jpg)

# Repaso: usando GHCi

C´omo empezar:

![](images/057d9f77e615e8aa75fc0323ad7c3cdcb6aa77b1f8d3f6d8d748df9ff1b04c47.jpg)

# Repaso: usando GHCi

C´omo empezar:

![](images/65adedf9a3adcb87a3ee20d3c350bd8604ab3e08cb68fae2cc2a32f415954fef.jpg)

# Repaso: usando GHCi

C´omo empezar:

\$ ghci   
Loading   
Prelude>:q   
Leaving GHCi.   
\$ ghci test.hs   
Loading .   
[1 of 1] Compiling Main ( test.hs, interpreted Ok, modules loaded: Main.   
\*Main>

# Repaso: usando GHCi

C´omo empezar:

\$ ghci   
Loading ..   
Prelude>:q   
Leaving GHCi.   
\$ ghci test.hs   
Loading .   
[1 of 1] Compiling Main ( test.hs, interpreted ) Ok, modules loaded: Main.   
\*Main>

Otros comandos ´utiles:

。 Para recargar: :r Para cargar otro archivo: :l archivo.hs Para conocer el tipo de una expresi´on: :t Tru

# Currificaci´on y aplicaci´on parcial

prod :: (Int, Int) -> Int prod (x, y) = x \* y prod’ :: Int -> Int -> Int prod’ x y = x \* y

¿Qu´e hacen estas funciones?

# Currificaci´on y aplicaci´on parcial

prod :: (Int, Int) -> Int prod (x, y) = x \* y prod’ :: Int -> Int -> Int prod’ x $\dot { \mathrm { ~ \bf ~ y ~ } } = \textbf { x } * \textbf { y }$

¿Qu´e hacen estas funciones?

Podr´ıa decirse que ambas “toman dos argumentos $\left( x , y \right)$ y devuelven su producto”. Pero esto no es del todo as´ı...

# Currificaci´on y aplicaci´on parcial

prod :: (Int, Int) -> Int prod (x, y) = x \* y prod’ :: Int -> Int -> Int prod’ x y = x \* y

Las funciones en Haskell siempre toman un ´unico argumento.

# Currificaci´on y aplicaci´on parcial

prod :: (Int, Int) -> Int prod (x, y) = x \* y prod’ :: Int -> Int -> Int prod’ x y = x \* y

Las funciones en Haskell siempre toman un ´unico argumento. Entonces ¿qu´e hacen estas funciones?

# Currificaci´on y aplicaci´on parcial

prod :: (Int, Int) -> Int prod (x, y) = x \* y prod’ :: Int -> Int -> Int prod’ $\texttt { \textbf { \small y } } = \texttt { \textbf { x } } * \texttt { y }$

Las funciones en Haskell siempre toman un ´unico argumento.

Entonces ¿qu´e hacen estas funciones?

. prod recibe una tupla de dos elementos.

# Currificaci´on y aplicaci´on parcial

prod :: (Int, Int) -> Int prod (x, y) = x \* y prod’ :: Int -> Int -> Int prod’ $\texttt { \textbf { \small y } } = \texttt { \textbf { x } } * \texttt { y }$

Las funciones en Haskell siempre toman un ´unico argumento.

Entonces ¿qu´e hacen estas funciones?

prod recibe una tupla de dos elementos. ¿¿Y prod’??

# Currificaci´on y aplicaci´on parcial

prod :: (Int, Int) -> Int prod (x, y) = x \* y prod’ :: Int -> (Int -> Int) (prod’ x) y = x \* y

Las funciones en Haskell siempre toman un ´unico argumento.

Entonces ¿qu´e hacen estas funciones?

prod recibe una tupla de dos elementos.   
prod’ es una funci´on que toma un x de tipo Int y devuelve una funci´on de tipo Int -> Int, cuyo comportamiento es tomar un entero y multiplicarlo por x.

# Currificaci´on y aplicaci´on parcial

prod :: (Int, Int) -> Int prod (x, y) = x \* y prod’ :: Int -> (Int -> Int) (prod’ x) y = x \* y

Las funciones en Haskell siempre toman un ´unico argumento.

Entonces ¿qu´e hacen estas funciones?

prod recibe una tupla de dos elementos.   
prod’ es una funci´on que toma un x de tipo Int y devuelve una funci´on de tipo Int -> Int, cuyo comportamiento es tomar un entero y multiplicarlo por x.   
En particular, (prod’ 2) es la funci´on que duplica.

# Currificaci´on y aplicaci´on parcial

prod :: (Int, Int) -> Int prod (x, y) = x \* y prod’ :: Int -> (Int -> Int) (prod’ x) y = x \* y

Las funciones en Haskell siempre toman un ´unico argumento.

Entonces ¿qu´e hacen estas funciones?

prod recibe una tupla de dos elementos. prod’ es una funci´on que toma un x de tipo Int y devuelve una funci´on de tipo Int -> Int, cuyo comportamiento es tomar un entero y multiplicarlo por x . En particular, (prod’ 2) es la funci´on que duplica. Una definici´on equivalente de prod’ usando funciones an´onimas:

$$
\mathtt { p r o d } ^ { \prime } \mathtt { x } \ = \ \backslash \ \mathtt { y } \ \to \ \mathtt { x } \ast \mathtt { y }
$$

# Currificaci´on y aplicaci´on parcial

prod :: (Int, Int) -> Int prod (x, y) = x \* y prod’ :: Int -> (Int -> Int) (prod’ x) y = x \* y

Las funciones en Haskell siempre toman un ´unico argumento.

Entonces ¿qu´e hacen estas funciones?

prod recibe una tupla de dos elementos.   
prod’ es una funci´on que toma un x de tipo Int y devuelve una funci´on de tipo Int -> Int, cuyo comportamiento es tomar un entero y multiplicarlo por x . En particular, (prod’ 2) es la funci´on que duplica. Una definici´on equivalente de prod’ usando funciones an´onimas:

Decimos que prod’ es la versi´on currificada de prod.

$$
\mathtt { p r o d } ^ { \prime } \mathtt { x } \ = \ \backslash \ \mathtt { y } \ \to \ \mathtt { x } \ast \mathtt { y }
$$

Definir las siguientes funciones:

curry :: ((a,b) -> c) -> (a -> b -> c)   
que devuelve la versi´on currificada de una funci´on no currificada.   
uncurry :: (a -> b -> c) -> ((a,b) -> c) que devuelve la versi´on no currificada de una funci´on currificada.

Sea la funci´on:

prod :: Int -> Int -> Int prod $\texttt { x y = x * y }$

Sea la funci´on:

prod :: Int -> Int -> Int prod $\texttt { x y = x * y }$

Definimos doble $\mathrm { ~ x ~ } =$ prod 2 x

1 ¿Cu´al es el tipo de doble?

Sea la funci´on:

prod :: Int -> Int -> Int prod $\texttt { x y = x * y }$

Definimos doble $\mathrm { ~ x ~ } =$ prod 2 x

1 ¿Cu´al es el tipo de doble? $\mathbf { \^ {  } }$ ¿Qu´e pasa si cambiamos la definici´on por doble $=$ prod 2?

Sea la funci´on:

prod :: Int -> Int -> Int prod $\texttt { x y = x * y }$

Definimos doble $\mathrm { ~ x ~ } =$ prod 2 x

¿Cu´al es el tipo de doble? ¿Qu´e pasa si cambiamos la definici´on por doble $=$ prod 2? 3 ¿Qu´e significa (+) 1?

Sea la funci´on:

prod :: Int -> Int -> Int prod $\texttt { x y = x * y }$

Definimos doble $\mathrm { ~ x ~ } =$ prod 2 x

¿Cu´al es el tipo de doble? ¿Qu´e pasa si cambiamos la definici´on por doble $=$ prod 2? ¿Qu´e significa (+) 1?   
$\mathbf { o }$ Definir las siguientes funciones de forma similar a $( + ) 1$ :

Sea la funci´on:

prod :: Int -> Int -> Int prod $\texttt { x y = x * y }$

Definimos doble $\mathrm { ~ x ~ } =$ prod 2 x

¿Cu´al es el tipo de doble?   
¿Qu´e pasa si cambiamos la definici´on por doble $=$ prod 2?   
¿Qu´e significa (+) 1?   
Definir las siguientes funciones de forma similar a $( + ) 1$ : triple :: Float -> Float

Sea la funci´on:

prod :: Int -> Int -> Int prod $\texttt { x y = x * y }$

Definimos doble $\mathrm { ~ x ~ } =$ prod 2 x

¿Cu´al es el tipo de doble?   
¿Qu´e pasa si cambiamos la definici´on por doble $=$ prod 2?   
¿Qu´e significa (+) 1?   
Definir las siguientes funciones de forma similar a (+)1: triple :: Float -> Float esMayorDeEdad :: Int -> Bool

# Funciones muy ´utiles

1 Implementar y dar los tipos de las siguientes funciones:

Pueden ver m´as funciones ´utiles en la secci´on Util del Campus. ´

# Funciones muy ´utiles

1 Implementar y dar los tipos de las siguientes funciones:

a (.) que compone dos funciones. Por ejemplo: ( $( \backslash \textbf { x } \to \textbf { x } * \textbf { 4 } )$ . $( { \bf \zeta } ) { \bf \zeta }  { \bf \zeta } { \bf { y } } \mathrm { ~ - ~ } 3 )$ ) 10 devuelve 28.

Pueden ver m´as funciones ´utiles en la secci´on Util del Campus. ´

# Funciones muy ´utiles

# Ejercicios

1 Implementar y dar los tipos de las siguientes funciones:

(.) que compone dos funciones. Por ejemplo: ( $( \backslash \textbf { x } \to \textbf { x } * \textbf { 4 } )$ ). $( { \bf \zeta } ) { \bf \zeta }  { \bf \zeta } { \bf { y } } \mathrm { ~ - ~ } 3 )$ ) 10 devuelve 28.   
flip que invierte los argumentos de una funci´on. Por ejemplo: flip $( \backslash \textbf { x } \textrm { y } \to \textbf { x } - \textbf { y } )$ 1 5 devuelve 4.

Pueden ver m´as funciones ´utiles en la secci´on Util del Campus. ´

# Funciones muy ´utiles

1 Implementar y dar los tipos de las siguientes funciones:

(.) que compone dos funciones. Por ejemplo: ( $( \backslash \textbf { x } \to \textbf { x } * \textbf { 4 } )$ ). $( { \bf \zeta } ) { \bf \zeta }  { \bf \zeta } { \bf { y } } \mathrm { ~ - ~ } 3 )$ ) 10 devuelve 28.   
flip que invierte los argumentos de una funci´on. Por ejemplo: flip $( \backslash \textbf { x } \textrm { y } \to \textbf { x } - \textbf { y } )$ 1 5 devuelve 4.   
(\$) que aplica una funci´on a un argumento. Por ejemplo: id $\$ 1$ 6 devuelve 6.

Pueden ver m´as funciones ´utiles en la secci´on Util del Campus. ´

# Funciones muy ´utiles

1 Implementar y dar los tipos de las siguientes funciones:

(.) que compone dos funciones. Por ejemplo: ( $( \backslash \textbf { x } \to \textbf { x } * \textbf { 4 } )$ ). $( { \bf \zeta } ) { \bf \zeta }  { \bf \zeta } { \bf { y } } \mathrm { ~ - ~ } 3 )$ ) 10 devuelve 28.   
flip que invierte los argumentos de una funci´on. Por ejemplo: flip $( \backslash \textbf { x } \textrm { y } \to \textbf { x } - \textbf { y } )$ 1 5 devuelve 4.   
(\$) que aplica una funci´on a un argumento. Por ejemplo: id $\$ 6$ devuelve 6.   
const que, dado un valor, retorna una funci´on constante que   
devuelve siempre ese valor. Por ejemplo: const 5 ‘‘casa’’ devuelve 5.

Pueden ver m´as funciones ´utiles en la secci´on Util del Campus. ´

# Funciones muy ´utiles

# Ejercicios

1 Implementar y dar los tipos de las siguientes funciones:

(.) que compone dos funciones. Por ejemplo: ( $( \backslash \textbf { x } \to \textbf { x } * \textbf { 4 } )$ ). $( { \bf \zeta } ) { \bf \zeta }  { \bf \zeta } { \bf { y } } \mathrm { ~ - ~ } 3 )$ ) 10 devuelve 28.   
flip que invierte los argumentos de una funci´on. Por ejemplo: flip $( \backslash \textbf { x } \textrm { y } \to \textbf { x } - \textbf { y } )$ 1 5 devuelve 4.   
(\$) que aplica una funci´on a un argumento. Por ejemplo: id $\$ 6$ devuelve 6.   
const que, dado un valor, retorna una funci´on constante que   
devuelve siempre ese valor. Por ejemplo: const 5 ‘‘casa’’ devuelve 5.

$\mathbf { \^ {  } }$ ¿Qu´e hace flip (\$) 0?

Pueden ver m´as funciones ´utiles en la secci´on Util del Campus. ´

# Funciones muy ´utiles

1 Implementar y dar los tipos de las siguientes funciones:

(.) que compone dos funciones. Por ejemplo: ( $( \backslash \textbf { x } \to \textbf { x } * \textbf { 4 } )$ ). $( { \bf \zeta } ) { \bf \zeta }  { \bf \zeta } { \bf { y } } \mathrm { ~ - ~ } 3 )$ ) 10 devuelve 28.   
flip que invierte los argumentos de una funci´on. Por ejemplo: flip $( \backslash \textbf { x } \textrm { y } \to \textbf { x } - \textbf { y } )$ 1 5 devuelve 4.   
(\$) que aplica una funci´on a un argumento. Por ejemplo: id $\$ 6$ devuelve 6.   
const que, dado un valor, retorna una funci´on constante que   
devuelve siempre ese valor. Por ejemplo: const 5 ‘‘casa’’ devuelve 5.

2 ¿Qu´e hace flip (\$) 0?

3 ¿Y $( = = 0 )$ ) . (flip mod 2)?

Pueden ver m´as funciones ´utiles en la secci´on Util del Campus. ´

Hay varias macros para definir listas:

# Hay varias macros para definir listas:

Por extensi´on

Esto es, dar la lista expl´ıcita, escribiendo todos sus elementos.   
Por ejemplo: [4, 3, 3, 4, 6, 5, 4, 5, 4, 5].

# Hay varias macros para definir listas:

Por extensi´on

Esto es, dar la lista expl´ıcita, escribiendo todos sus elementos.   
Por ejemplo: [4, 3, 3, 4, 6, 5, 4, 5, 4, 5].

# Secuencias

Son progresiones aritm´eticas en un rango particular.

Por ejemplo: [3..7] es la lista que tiene todos los n´umeros enteros entre 3 y 7, mientras que [2, 5..18] es la lista que contiene 2, 5, 8, 11, 14 y 17.

# Hay varias macros para definir listas:

# Por extensi´on

Esto es, dar la lista expl´ıcita, escribiendo todos sus elementos.   
Por ejemplo: [4, 3, 3, 4, 6, 5, 4, 5, 4, 5].

# Secuencias

Son progresiones aritm´eticas en un rango particular.

Por ejemplo: [3..7] es la lista que tiene todos los n´umeros enteros entre 3 y 7, mientras que [2, 5..18] es la lista que contiene 2, 5, 8, 11, 14 y 17.

# Por comprensi´on

Se definen de la siguiente manera:

[expresi´on | selectores, condiciones] Por ejemplo: [(x,y) | x <- [0..5], y <- [0..3], x+y==4]

# Hay varias macros para definir listas:

# Por extensi´on

Esto es, dar la lista expl´ıcita, escribiendo todos sus elementos.   
Por ejemplo: [4, 3, 3, 4, 6, 5, 4, 5, 4, 5].

# Secuencias

Son progresiones aritm´eticas en un rango particular.

Por ejemplo: [3..7] es la lista que tiene todos los n´umeros enteros entre 3 y 7, mientras que [2, 5..18] es la lista que contiene 2, 5, 8, 11, 14 y 17.

# Por comprensi´on

Se definen de la siguiente manera:

[expresi´on | selectores, condiciones] Por ejemplo: [(x,y) | x <- [0..5], y <- [0..3], $\tt x + y = = 4 ]$ es la lista que tiene los pares (1,3), (2,2), (3,1) y (4,0).

Haskell tambi´en nos permite trabajar con listas infinitas.

# Listas infinitas

Haskell tambi´en nos permite trabajar con listas infinitas.

Algunos ejemplos:

naturales = [1..] 1, 2, 3, 4, ...

# Listas infinitas

Haskell tambi´en nos permite trabajar con listas infinitas.

Algunos ejemplos:

naturales = [1..] 1, 2, 3, 4, ...

multiplosDe3 = [0,3..] 0, 3, 6, 9, ...

# Listas infinitas

Haskell tambi´en nos permite trabajar con listas infinitas.

Algunos ejemplos:

naturales = [1..] 1, 2, 3, 4, ...

multiplosDe3 = [0,3..] 0, 3, 6, 9, ...

repeat ‘‘hola’’ “hola”, “hola”, “hola”, “hola”, ...

# Listas infinitas

Haskell tambi´en nos permite trabajar con listas infinitas.

Algunos ejemplos:

naturales = [1..] 1, 2, 3, 4, ...

multiplosDe3 = [0,3..] 0, 3, 6, 9, ...

repeat ‘‘hola’’ “hola”, “hola”, “hola”, “hola”, ...

primos = [n | n <- [2..], esPrimo n] (asumiendo esPrimo definida) 2, 3, 5, 7, ...

# Listas infinitas

Haskell tambi´en nos permite trabajar con listas infinitas.

Algunos ejemplos:

naturales = [1..] 1, 2, 3, 4, ...

multiplosDe3 = [0,3..] 0, 3, 6, 9, ...

repeat ‘‘hola’’ “hola”, “hola”, “hola”, “hola”, ...

primos = [n | n <- [2..], esPrimo n] (asumiendo esPrimo definida) 2, 3, 5, 7, ...

infinitosUnos = 1 : infinitosUnos 1, 1, 1, 1, ...

Haskell tambi´en nos permite trabajar con listas infinitas.

Algunos ejemplos:

naturales = [1..] 1, 2, 3, 4, ...

multiplosDe3 = [0,3..] 0, 3, 6, 9, ...

repeat ‘‘hola’’ “hola”, “hola”, “hola”, “hola”, ...

primos = [n | n <- [2..], esPrimo n] (asumiendo esPrimo definida) 2, 3, 5, 7, ...

infinitosUnos = 1 : infinitosUnos 1, 1, 1, 1, ...

¿C´omo es posible trabajar con listas infinitas sin que se cuelgue?

# Evaluaci´on lazy

take :: Int -> [a] -> [a]   
take $0 \mathrm { ~ \it ~ \ / ~ } = \mathrm { ~ \it ~ \ / ~ } [ ]$   
take $\begin{array} { l l l } { { \displaystyle \left[ \begin{array} { l l l } { } \end{array} \right] } } & { { = } } & { { \displaystyle \left[ \begin{array} { l l l } { } \end{array} \right] } } \end{array}$   
take n $( { \bf { x } } : { \bf { x } } { \bf { s } } ) \ = \ { \bf { x } }$ : take (n-1) xs   
infinitosUnos :: [Int]   
infinitosUnos $\ c = ~ 1$ : infinitosUnos   
nUnos :: Int -> [Int]   
nUnos $\mathrm { ~ n ~ } =$ take n infinitosUnos

# Evaluaci´on lazy

take :: Int -> [a] -> [a]   
take $0 \mathrm { ~ \it ~ \ / ~ } = \mathrm { ~ \it ~ \ / ~ } [ ]$   
take $\begin{array} { l l l } { { \displaystyle \left[ \begin{array} { l l l } { } \end{array} \right] } } & { { = } } & { { \displaystyle \left[ \begin{array} { l l l } { } \end{array} \right] } } \end{array}$   
take n $( { \bf { x } } : { \bf { x } } { \bf { s } } ) \ = \ { \bf { x } }$ : take (n-1) xs   
infinitosUnos :: [Int]   
infinitosUnos $\ c = ~ 1$ : infinitosUnos   
nUnos :: Int -> [Int]   
nUnos n = take n infinitosUnos

Si ejecutamos nUnos 2...

# Evaluaci´on lazy

take :: Int -> [a] -> [a]   
take $0 \mathrm { ~ \it ~ \ / ~ } = \mathrm { ~ \it ~ \ / ~ } [ ]$   
take $\begin{array} { l l l } { { \displaystyle \left[ \begin{array} { l l l } { } \end{array} \right] } } & { { = } } & { { \displaystyle \left[ \begin{array} { l l l } { } \end{array} \right] } } \end{array}$   
take n $( { \bf { x } } : { \bf { x } } { \bf { s } } ) \ = \ { \bf { x } }$ : take (n-1) xs

infinitosUnos :: [Int] infinitosUnos $\ c = ~ 1$ : infinitosUnos nUnos :: Int -> [Int] nUnos n = take n infinitosUnos

Si ejecutamos nUnos 2...   
nUnos $2 $ take 2 infinitosUnos take 2 (1:infinitosUnos) $ 1$ : take (2-1) infinitosUnos   
$ 1$ : take 1 infinitosUnos   
$ 1$ : take 1 (1:infinitosUnos)   
→ 1 : 1 : take (1-1) infinitosUnos   
→ 1 : 1 : take 0 infinitosUnos   
→ 1 : 1 : []

# Evaluaci´on lazy

¿Qu´e suceder´ıa si us´aramos otra estrategia de reducci´on?

# Evaluaci´on lazy

¿Qu´e suceder´ıa si us´aramos otra estrategia de reducci´on? Si para alg´un t´ermino existe una reducci´on finita, entonces la estrategia de reducci´on lazy termina.

# Evaluaci´on lazy: Fibonacci

infinitosUnos es un ejemplo sencillo de lista infinita. ¿C´omo definir´ıan la sucesi´on de Fibonacci como lista infinita?

fibs = 0 : 1 :

# Evaluaci´on lazy: Fibonacci

infinitosUnos es un ejemplo sencillo de lista infinita. ¿C´omo definir´ıan la sucesi´on de Fibonacci como lista infinita?

fibs = 0 : 1 : fibsAPartirDe 0 1 where fibsAPartirDe a b = (a+b) : fibsAPartirDe b (a+b)

# Evaluaci´on lazy: Fibonacci

infinitosUnos es un ejemplo sencillo de lista infinita. ¿C´omo definir´ıan la sucesi´on de Fibonacci como lista infinita?

fibs = 0 : 1 : fibsAPartirDe 0 1 where fibsAPartirDe a b = (a+b) : fibsAPartirDe b (a+b)

La siguiente implementaci´on tambi´en anda. Queda como curiosidad entender en detalle c´omo anda.

fibs = 0 : 1 : zipWith ( $^ +$ ) fibs (drop 1 fibs)

# Evaluaci´on lazy: Fibonacci

infinitosUnos es un ejemplo sencillo de lista infinita. ¿C´omo definir´ıan la sucesi´on de Fibonacci como lista infinita?

fibs = 0 : 1 : fibsAPartirDe 0 1 where fibsAPartirDe a b = (a+b) : fibsAPartirDe b (a+b)

La siguiente implementaci´on tambi´en anda. Queda como curiosidad entender en detalle c´omo anda.

fibs = 0 : 1 : zipWith ( $^ +$ ) fibs (drop 1 fibs)

Obtener el n-´esimo elemento de la serie

fib $\mathrm { ~ n ~ } =$ head (drop n fibs)

# Funciones totales vs parciales

¿Cu´ales de estas funciones pueden ser totales?

null :: [a] -> Bool tail :: [a] -> [a] head :: [a] -> a safeHead :: [a] -> Maybe a

# Composici´on de funciones

Las siguientes funciones son totales ¿por qu´e?

dobleHeadA l = if null l then Nothing else Just (2 \* head l)

dobleHeadB l = case l of [] -> Nothing (x: ) -> Just (2 \* x)

# Funciones de alto orden

Definamos las siguientes funciones Precondici´on: las listas tienen alg´un elemento.

maximo :: Ord a $\Rightarrow$ [a] -> a minimo :: Ord a $\Rightarrow$ [a] -> a listaMasCorta :: [[a]] -> [a]

# Funciones de alto orden

Definamos las siguientes funciones Precondici´on: las listas tienen alg´un elemento.

maximo :: Ord a $\Rightarrow$ [a] -> a minimo :: Ord a $\Rightarrow$ [a] -> a listaMasCorta :: [[a]] -> [a]

Siempre hago lo mismo... ¿Se podr´a generalizar? ¿C´omo?

# Funciones de alto orden

Definamos las siguientes funciones Precondici´on: las listas tienen alg´un elemento.

maximo :: Ord a $\Rightarrow$ [a] -> a minimo :: Ord a => [a] -> a listaMasCorta :: [[a]] -> [a]

Siempre hago lo mismo... ¿Se podr´a generalizar? ¿C´omo?

# Ejercicio

mejorSegun ::

# Funciones de alto orden

Definamos las siguientes funciones Precondici´on: las listas tienen alg´un elemento.

maximo :: Ord a $\Rightarrow$ [a] -> a minimo :: Ord a => [a] -> a listaMasCorta :: [[a]] -> [a]

Siempre hago lo mismo... ¿Se podr´a generalizar? ¿C´omo?

# Ejercicio

mejorSegun :: (a -> a -> Bool) -> [a] -> a

# Funciones de alto orden

Definamos las siguientes funciones Precondici´on: las listas tienen alg´un elemento.

maximo :: Ord a $\Rightarrow$ [a] -> a minimo :: Ord a => [a] -> a listaMasCorta :: [[a]] -> [a]

Siempre hago lo mismo... ¿Se podr´a generalizar? ¿C´omo?

# Ejercicio

mejorSegun :: (a -> a -> Bool) -> [a] -> a Reescribir maximo y listaMasCorta en base a mejorSegun

# Filtrar elementos de una lista

# Filtrar elementos de una lista

filter :: (a -> Bool) -> [a] -> [a]

# Filtrar elementos de una lista

filter :: (a -> Bool) -> [a] -> [a] filter [] = []

# Filtrar elementos de una lista

filter :: (a -> Bool) -> [a] -> [a]   
filter [] = []   
filter p (x:xs) = if p x then x : filter p xs else filter p xs

# Filtrar elementos de una lista

filter :: (a -> Bool) -> [a] -> [a]   
filter [] = []   
filter p (x:xs) = if p x then x : filter p xs else filter p xs

# Ejercicios

Definir usando filter:

# Filtrar elementos de una lista

filter :: (a -> Bool) -> [a] -> [a]   
filter [] = []   
filter p (x:xs) = if p x then x : filter p xs else filter p xs

# Ejercicios

Definir usando filter:

deLongitudN :: Int -> [[a]] -> [[a]]

# Filtrar elementos de una lista

filter :: (a -> Bool) -> [a] -> [a]   
filter [] = []   
filter p (x:xs) = if p x then x : filter p xs else filter p xs

# Ejercicios

Definir usando filter:

deLongitudN :: Int -> [[a]] -> [[a]]   
soloPuntosFijosEnN :: Int -> [Int->Int] -> [Int->Int] Dados un n´umero n y una lista de funciones, deja las funciones que al aplicarlas a $^ { n }$ dan $n$

# Transformar elementos de una lista

# Transformar elementos de una lista

# Transformar elementos de una lista

map :: (a -> b) -> [a] -> [b] map [] = []

# Transformar elementos de una lista

map :: (a -> b) -> [a] -> [b] map [] = [] map f (x:xs) = f x : map f xs

# Transformar elementos de una lista

map :: (a -> b) -> [a] -> [b] map [] = [] map f (x:xs) = f x : map f xs

# Ejercicio

Definir usando map:

# Transformar elementos de una lista

map :: (a -> b) -> [a] -> [b] map [] = [] map f (x:xs) = f x : map f xs

# Ejercicio

Definir usando map:

reverseAnidado :: [[Char]] -> [[Char]] que, dada una lista de strings, devuelve una lista con cada string dado vuelta y la lista completa dada vuelta. Por ejemplo: reverseAnidado [‘‘quedate’’, ‘‘en’’, ‘‘casa’’] devuelve [‘‘asac", ‘‘ne’’, ‘‘etadeuq’’].

Ayuda: ya existe la funci´on reverse que invierte una lista.

# Transformar elementos de una lista

map :: (a -> b) -> [a] -> [b] map [] = [] map f (x:xs) = f x : map f xs

# Ejercicio

Definir usando map:

reverseAnidado :: [[Char]] -> [[Char]] que, dada una lista de strings, devuelve una lista con cada string dado vuelta y la lista completa dada vuelta. Por ejemplo: reverseAnidado [‘‘quedate’’, ‘‘en’’, ‘‘casa’’] devuelve [‘‘asac", ‘‘ne’’, ‘‘etadeuq’’].

Ayuda: ya existe la funci´on reverse que invierte una lista.

paresCuadrados :: [Int] -> [Int] que, dada una lista de enteros, devuelve una lista con los cuadrados de los n´umeros pares y los impares sin modificar.

¿Hay similitud entre estas definiciones?

filter :: (a -> Bool) -> [a] -> [a]   
filter [] = []   
filter p (x:xs) = if p x then x : filter p xs else filter p xs

map :: (a -> b) -> [a] -> [b] map [] = [] map f (x:xs) = f x : map f xs ¿Hay similitud entre estas definiciones?

filter :: (a -> Bool) -> [a] -> [a]   
filter [] = []   
filter p (x:xs) = if p x then x : filter p xs else filter p xs

map :: (a -> b) -> [a] -> [b] map [] = [] map f (x:xs) = f x : map f xs

En el caso base devolvemos un valor determinado.

¿Hay similitud entre estas definiciones?

![](images/2d13059de6edfb7624cc24dfb3818f5d795375a73bc09bf48f03832aea56634d.jpg)

En el caso base devolvemos un valor determinado. En el caso recursivo devolvemos algo en funci´on de:

La cabeza de la lista.

¿Hay similitud entre estas definiciones?

![](images/35f1ec57f907e676a272135f3bf0a436921e67e96bbacae48630512ff58cf4c8.jpg)

En el caso base devolvemos un valor determinado. En el caso recursivo devolvemos algo en funci´on de:

La cabeza de la lista.   
El llamado recursivo sobre la cola de la lista.

¿Hay similitud entre estas definiciones?

![](images/dd18335e3d727a3bcf42f2e1f84af153b393231ea7392d11cfcc9367bd1e4406.jpg)

En el caso base devolvemos un valor determinado. En el caso recursivo devolvemos algo en funci´on de:

La cabeza de la lista.   
El llamado recursivo sobre la cola de la lista.

¿Se puede generalizar?

foldr :: (a -> b -> b) -> b -> [a] -> b foldr z [] = z foldr f z (x:xs) = f x (foldr f z xs)

foldr :: (a -> b -> b) -> b -> [a] -> b foldr z [] = z foldr f z (x:xs) = f x (foldr f z xs)

z es el valor que devolvemos para una lista vac´ıa.

foldr :: (a -> b -> b) -> b -> [a] -> b foldr z [] = z foldr f z (x:xs) = f x (foldr f z xs)

z es el valor que devolvemos para una lista vac´ıa.

f es una funci´on que computa el resultado sobre la lista entera a partir de:

La cabeza de la lista.

foldr :: (a -> b -> b) -> b -> [a] -> b foldr z [] = z foldr f z (x:xs) = f x (foldr f z xs)

z es el valor que devolvemos para una lista vac´ıa.

f es una funci´on que computa el resultado sobre la lista entera a partir de:

La cabeza de la lista.   
El llamado recursivo sobre la cola de la lista.

foldr :: (a -> b -> b) -> b -> [a] -> b foldr z [] = z foldr f z (x:xs) = f x (foldr f z xs)

z es el valor que devolvemos para una lista vac´ıa.

f es una funci´on que computa el resultado sobre la lista entera a partir de:

La cabeza de la lista.   
El llamado recursivo sobre la cola de la lista.

# Ejemplo

Si xs $=$ [x1, x2, x3] entonces: foldr f z xs = f x1 (f x2 (f x3 z)) Equivalentemente con notaci´on infija: foldr ⋆ z xs = x1 ⋆ (x2 ⋆ (x3 ⋆ z))

# Reescribiendo filter y map con foldr

filter :: (a -> Bool) -> [a] -> [a]   
filter p xs = foldr (\x r -> if p x then x:r else r) [] xs

# Reescribiendo filter y map con foldr

map :: (a -> b) -> [a] -> [b] map f xs $=$ foldr (\x r -> f x : r) [] xs

# Reescribiendo filter y map con foldr

![](images/ead1b12c0336a5fd4dd78effb1da3fe61e0ee11b8d3d2f844eaeecc713b9dd6e.jpg)

¿Es necesario el argumento xs?

# Reescribiendo filter y map con foldr

# Ejercicio (para la casa)

Escribir filterMap que dada una funci´on se queda con los valores Just y descarta los Nothing luego de aplicarla a cada elemento de la lista.

filterMap :: (a -> Maybe b) -> [a] -> [b]

¿La implementaci´on que hicieron es total por construcci´on o usan funciones parciales?

Desplegando la macro de las listas por comprensi´on

Definir una expresi´on equivalente a la siguiente utilizando map y filter:

# Ejercicio

listaComp :: (a -> Bool) -> (a -> b) -> [a] -> [b] listaComp p f xs $=$ [f x | x <- xs, p x]

En la secci´on ´util del campus pueden encontrar:

。 “Introducci´on a la programaci´on funcional” “Repaso de Funciones Totales y Maybe” ¡Nuevo!

¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?