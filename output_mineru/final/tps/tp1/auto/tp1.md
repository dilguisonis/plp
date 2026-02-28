# Trabajo Pr´actico 1 Programaci´on Funcional

versi´on 1.0

Paradigmas de Lenguajes de Programaci´on $2 ^ { \mathrm { d o } }$ cuatrimestre 2025

Fecha de entrega: 16 de septiembre

# Introducci´on: Calculadora Incierta

Vamos a hacer una calculadora que opere con cierta incertidumbre. La idea es que adem´as de n´umeros concretos y las operaciones aritm´eticas $+ , - , \times , /$ , vamos a trabajar con rangos num´ericos.

Un rango num´erico se representa como un par de n´umeros reales $a \sim b$ . El rango nos indica un n´umero que no sabemos exactamente cu´al va a ser, pero sabemos que va a estar entre $a$ y $b$ con una confianza del $9 5 \%$ . Esto quiere decir que hay un $5 \%$ de probabilidad de que est´e por fuera del rango. La distribuci´on de los n´umeros es normal: las chances de obtener un n´umero en el medio del rango son mayores, y decrecen a medida que nos alejamos. No hace falta saber estad´ıstica.

Entonces, cuando queramos evaluar una expresi´on, como por ejemplo $1 0 0 0 0 * 0 . 7 \sim 0 . 8 +$ $2 0 0 0 \sim 5 0 0 0$ , vamos a obtener a veces un valor y a veces otro.

Para llegar a una conclusi´on sobre el resultado de la expresi´on, vamos a realizar muchas muestras, donde cada una nos dar´a un resultado distinto. Juntando todas las muestras vamos a construir un histograma que nos permita ver c´omo se distribuyen los resultados.

El histograma a continuaci´on nos va a decir adem´as que con un $9 5 \%$ de confianza el resultado va a estar entre 9415.63 y 12580.79.

![](images/a66bb10fdb101bcd9af2a9844fd7f1b0e0ceea4e840258c991c02f8395e906bf.jpg)  
incierticalc> :q

Adi´os!

Los ejercicios a continuaci´on tienen como objetivo implementar las partes faltantes de la aplicaci´on incierticalc.

El c´odigo base cuenta con varios archivos, algunos completos y otros con funciones a implementar. La estructura es la siguiente:

app/Main.hs es el punto de entrada de la aplicaci´on interactiva. Este archivo est´a completo.   
src/App.hs define la aplicaci´on interactiva. Este archivo est´a completo.   
src/Expr/Parser.hs define un parser para convertir un String en una expresi´on del tipo Expr. Este archivo est´a completo.   
src/Generador.hs define funciones para generar n´umeros aleatorios. Este archivo est´a completo.   
src/Util.hs define funciones auxiliares. Hay ejercicios para completar este m´odulo.   
src/Histograma.hs define el tipo abstracto de datos Histograma. Hay ejercicios para completar este m´odulo.   
src/Expr.hs define el tipo algebraico de datos Expr y varias funciones sobre ´el. Hay ejercicios para completar este m´odulo.   
test/Main.hs es el punto de entrada para los tests. Hay algunos ejemplos de tests. Deber´an agregar m´as tests. Con make test o make watch pueden ejecutarlos.

# M´odulo Util

En este m´odulo definiremos funciones que nos ser´an ´utiles para resolver el resto del trabajo. Dentro se encuentran definidas las constantes infinitoPositivo e infinitoNegativo debido a que Haskell no tiene literal para $\infty$ .

# Ejercicio 1

Definir la funci´on alinearDerecha :: Int → String String que, dados n un entero y s un String, agrega espacios a la izquierda de s hasta que su longitud sea n. Si s ya es de longitud mayor o igual a $\mathbf { n }$ , devuelve s. No se permite recursi´on expl´ıcita. Por ejemplo:

ghci> alinearDerecha 6 "hola" = hola"

ghci> alinearDerecha 10 "incierticalc" "incierticalc"

# Ejercicio 2

Definir la funci´on actualizarElem :: $\mathrm { I n t } ~ \to ~ ( \tt a \to \tt a ) \to [ \tt a ] \to [ \tt a ]$ que dados un ´ındice, una funci´on y una lista, actualiza en la lista el elemento en la posici´on del ´ındice aplicando la funci´on al valor actual. Si el ´ındice est´a fuera de los l´ımites de la lista, devuelve la lista sin cambios. El primer elemento de la lista es el ´ındice 0. Por ejemplo:

ghci> actualizarElem 1 ( $_ { + 1 0 }$ ) [0, 1, 2, 3, 4] [0,11,2,3,4]

ghci> actualizarElem (-1) ( $+ 1 0$ ) [0, 1, 2, 3, 4] [0,1,2,3,4]

Es importante que la funci´on sea total por construcci´on, deben evitar usar funciones parciales como (!!). No se permite recursi´on expl´ıcita.

Dos posibles caminos para resolver este ejercicio son completar alguna de las siguientes implementaciones:

a) actualizarElem n f $=$ zipWith _ [0 ..] b) actualizarElem n f xs $=$ actualizarElem’ f xs n act $\mathtt { u a l i z a r E 1 e m } ^ { , } : : ( { \mathtt { a } }  { \mathtt { a } } ) \  \ \mathtt { [ a ] } \  \ \mathtt { ( I n t  \ [ a ] ) }$ actualizarElem’ f $=$ foldr _ (const [])

# M´odulo Histograma

En este m´odulo se define el tipo Histograma. Es un tipo abstracto, no se exportan sus constructores. Se dispone de operaciones para crear un Histograma y una funci´on casilleros para poder observarlo.

Un histograma se puede ver como una serie de casilleros. Cada casillero tiene un intervalo y cuenta cu´antos n´umeros caen dentro de dicho intervalo. El primer casillero empieza en $- \infty$ . El ´ultimo termina en $+ \infty$ . El tama˜no del intervalo de todos los casilleros intermedios es el mismo. A partir de esto resulta que un Histograma se define de la siguiente forma:

data Histograma $=$ Histograma Float Float [ Int ] deriving ( Show , Eq )

El primer Float es el inicio del intervalo de la segunda casilla.   
El segundo Float es el tama˜no del intervalo de cada casillero, que debe ser mayor que 0.   
La lista de enteros representa la cuenta de cu´antos elementos caen en el intervalo de cada casillero. Tiene al menos 3 elementos.

Sea Histograma i t cs :: Histrograma, sabemos cs !! 0 indica cuantos n´umeros caen en $( - \infty , i )$ cs !! 1 indica cuantos n´umeros caen en $[ i , i + t )$ cs !! 2 indica cuantos n´umeros caen en $[ i + t , i + 2 \times t )$ cs !! 3 indica cuantos n´umeros caen en $[ i + 2 \times t , i + 3 \times t )$ . .

Nota: Dado que el tipo Histograma es abstracto, no se pueden acceder directamente a sus campos en test/Main.hs. En el ejercicio 6 se pide definir la funci´on casilleros que permite observar un Histograma. Dicha funci´on es ´util para definir los casos de prueba para los ejercicios $3 , 4 \mathrm { ~ y ~ 5 ~ }$ . Aunque tambi´en necesitan los ejercicios 3 y 4 para hacer los casos de prueba del ejercicio 6.

# Ejercicio 3

Definir la funci´on vacio :: Int (Float, Float) Histograma que inicializa un histograma con todos sus casilleros vac´ıos. vacio n (l, u) devuelve un histograma con n casilleros finitos para representar valores en el rango (l, u) y 2 casilleros adicionales para los valores fuera del rango. Requiere que $\mathrm { ~ \tt ~ { ~ L ~ } ~ } <$ u y $\mathrm { ~ n ~ } \geq \ 1$ (se puede asumir como verdadero sin necesidad de verificarlo). La funci´on fromIntegral :: Int Float puede ser ´util.

# Ejercicio 4

Definir la funci´on agregar :: Float Histograma Histograma que agrega el valor indicado al casillero correspondiente del histograma.

Pueden utilizar actualizarElem para generar la nueva lista de cantidades.

Las funciones fromIntegral :: Int Float, floor :: Float Int, min y max pueden ser ´utiles.

# Ejercicio 5

Definir la funci´on histograma :: Int (Float, Float) [Float] Histograma que construye un histograma a partir de una lista de n´umeros reales con la cantidad de casilleros finitos y rango indicados. No se permite recursi´on expl´ıcita.

En el m´odulo se define el tipo algebraico de datos Casillero y funciones convenientes para observarlo.

data Casillero $=$ Casillero Float Float Int Float deriving ( Show , Eq )

casMinimo :: Casillero Float casMaximo :: Casillero Float casCantidad :: Casillero Int casPorcentaje :: Casillero Float

Cada funci´on se corresponde con un campo del tipo Casillero. El porcentaje es un n´umero entre 0 y 100 y representa la cantidad de valores en el casillero respecto al total de valores en el histograma.

# Ejercicio 6

Definir la funci´on casilleros :: Histograma [Casillero] que, dado un histograma, devuelve la lista de casilleros con sus l´ımites, cantidad y porcentaje. El primer casillero es el que va desde $- \infty$ hasta el m´ınimo del rango del histograma.

Esta funci´on es ´util para poder escribir tests, ya que nos permite observar un Histograma. No se permite recursi´on expl´ıcita.

Pueden usar la funci´on zipWith4 para construir la lista de casilleros. Esta se debe importar desde Data.List agregando import Data.List (zipWith4) al principio del archivo.

# M´odulo Generador

El m´odulo Generador nos permite generar n´umeros aleatorios dentro de un rango con $9 5 \%$ de confianza. Este m´odulo est´a completo. Los generadores se representan con el tipo Gen.

Se dispone de la funci´on dameUno :: (Float, Float) Gen (Float, Gen) que genera un n´umero aleatorio y devuelve el generador actualizado.

¿Por qu´e dameUno devuelve un generador actualizado? Porque los valores (incluso los generadores) son inmutables y cada vez que se genera un n´umero aleatorio, debemos dejar de usar el generador original. Si no lo hacemos, el generador original seguir´a generando el mismo n´umero una y otra vez (no muy aleatorio, ¿no?).

Si g :: Gen, dameUno (a, b) $\mathsf { g }$ reduce a $\left( \mathbf { x } , \ \mathbf { g } ^ { \prime } \right)$ donde x es un n´umero entre a y b con un $9 5 \%$ de confianza y $\mathsf { g } '$ es un nuevo Gen que debe ser usado para obtener el siguiente n´umero a x.

Hay 3 formas de crear un generador:

genFijo es un generador que siempre devuelve el valor medio del rango.

genNormalConSemilla n con n :: Int es un generador que produce n´umeros aleatorios con distribuci´on normal. La semilla n permite reproducibilidad dado que determina cu´ales van a ser los n´umeros aleatorios a generar1 .   
genNormal es un generador que produce n´umeros aleatorios con distribuci´on normal usando una semilla aleatoria.

La ´ultima funci´on no es pura. Dada una funci´on f :: Gen → a, podemos evaluarla usando f genFijo, f (genNormalConSemilla 0), f (genNormalConSemilla 1), etc.

Si queremos evaluar f con un generador aleatorio podemos usar conGenNormal f que devuelve el resultado de f. conGenNormal tampoco es una funci´on pura, pero nos permite aplicar funciones puras en forma c´omoda.

En ghci podemos probar:

ghci> dameUno (1, 5) genFijo (3.0,<Gen>)

ghci> dameUno (1, 5) (genNormalConSemilla 0) (2.7980492,<Gen>)

ghci> conGenNormal (dameUno (1, 5)) (1.2677777,<Gen>)

ghci> conGenNormal (dameUno (1, 5)) (0.3479743,<Gen>)

ghci> conGenNormal (dameUno (1, 5)) (1.4352515,<Gen>)

Nuevamente, siempre que se trabaje con generadores como par´ametro de una funci´on vamos a querer devolver otro generador como resultado. Si no perder´ıamos el “nuevo estado” del generador y solo podr´ıamos generar el mismo n´umero nuevamente.

Por ejemplo dameUno :: (Float, Float) Gen → (Float, Gen). La ´ultima parte indica que toma un generador y devuelve un n´umero y el generador resultante.

Se dispone del tipo G a que es un sin´onimo de tipo para ${ \tt G e n }  ( { \tt a } , { \tt G e n } )$ . Usando G a el tipo de dameUno queda dameUno :: (Float, Float) $\begin{array} { r l } {  } & { { } G } \end{array}$ Float, ¡pero es el mismo tipo!

El tipo G a es una funci´on que toma un generador y devuelve un valor de tipo a y el generador resultante.

Dada una funci´on f :: G a y n :: Int, entonces muestra f n :: G [a] aplica f exactamente n veces devolviendo los resultados en una lista (y el generador resultante).

La funci´on rango95 :: [Float] (Float, Float) toma una lista finita de n´umeros reales, que si provienen de un generador de distribuci´on normal, devuelve un rango que cubre el $9 5 \%$ de los valores que producir´a el generador. Si todos los n´umeros son iguales, devuelve el rango (valor-1, valor $+ 1$ ). La lista debe tener al menos un elemento.

Nota: Dado el caracter aleatorio de un generador es esperable que algunos casos de prueba usen los n´umeros que sabemos ser´an generados. Saber qu´e n´umeros ser´an generados requiere experimentaci´on.

ghci> fst (dameUno (1, 5) (genNormalConSemilla 0)) == 2.7980492 True

ghci> muestra (dameUno (1, 5)) 2 (genNormalConSemilla 0) ([2.7980492,3.1250308],<Gen>)

# M´odulo Expr

Las expresiones de incierticalc se representan con el siguiente tipo algebraico:

data Expr $=$ Const Float | Rango Float Float | Suma Expr Expr | Resta Expr Expr | Mult Expr Expr | Div Expr Expr deriving ( Show , Eq )

A continuaci´on algunos ejemplos de expresiones:

■ $1 + 2 \times 3$ representa como Suma (Const 1.0) (Mult (Const 2.0) (Const 3.0)).   
■ $( 1 + 2 ) \times 3$ representa como Mult (Suma (Const 1.0) (Const 2.0)) (Const 3.0).

# Ejercicio 7

Definir las funciones recrExpr y foldExpr que corresponden con los esquemas de recursi´on primitiva y estructural respectivamente del tipo Expr. Indicar el tipo de las funciones junto a sus definiciones. Se permite usar recursi´on expl´ıcita en estas funciones.

# Ejercicio 8

Definir la funci´on eval que permite obtener una posible evaluaci´on de una expresi´on dado un generador de n´umeros aleatorios. No se permite recursi´on expl´ıcita.

El tipo deseado es eval :: $\mathtt { E x p r } \to \mathtt { G e n } \to \mathtt { ( F l o a t , \mathtt { G e n } ) }$ para poder obtener el generador resultante despu´es de generar algunos n´umeros aleatorios para evaluar los rangos. Puede escribirse usando G a como eval :: Expr $\begin{array} { r l } {  } & { { } G } \end{array}$ Float.

Se debe usar dameUno para determinar el valor de un rango.

# Ejercicio 9

Definir la funci´on armarHistograma :: Int → Int → G Float $\begin{array} { r l } {  } & { { } G } \end{array}$ Histograma.

armarHistograma m n f g arma un histograma con m casilleros finitos a partir del resultado de tomar n muestras de f usando el generador g. El rango del histograma debe ser calculado con rango95 para que abarque el $9 5 \%$ de confianza de los valores que producir´a f. n y m deben ser mayor que 0.

El tipo Expr no aparece en la signatura de la funci´on, porque va a ser usado junto con eval e en el pr´oximo ejercicio, dado un valor e :: Expr. Notar que eval e :: G Float.

Dicho de otra manera, esta funci´on toma un generador de n´umeros f :: G Float y genera un histograma a partir de tomar n muestras de f.

Las funciones muestra, histograma y rango95 van a ser ´utiles.

# Ejercicio 10

Definir la funci´on evalHistograma : $\mathbf { \Sigma } : \ \mathrm { I n t } \ \to \ \mathrm { I n t } \ \to \ \mathrm { E x p r } \ \to \ \mathsf { G }$ Histograma.

evalHistograma m n e $\mathsf { g }$ eval´ua la expresi´on e usando el generador $\mathsf { g }$ un total de n veces. n y m deben ser mayor que 0.

El histograma se arma seg´un armarHistograma y tendr´a m casilleros finitos.

# Ejercicio 11

Definir la funci´on mostrar :: Expr String para convertir una expresi´on en un String con la notaci´on infija de operadores usuales, y evitando algunos par´entesis innecesarios. En particular queremos evitar par´entesis en sumas dentro de sumas, y en productos dentro de productos. No se permite recursi´on expl´ıcita.

Disponemos para esto de show :: Float String definida en Prelude y de las siguientes definiciones no exportadas en el m´odulo Expr:

data ConstructorExpr $=$ CEConst | CERango | CESuma | CEResta | CEMult | CEDiv deriving ( Show , Eq )   
constructor :: Expr ConstructorExpr   
maybeParen :: Bool String String constructor e devuelve el constructor de la expresi´on e.   
maybeParen b s devuelve s entre par´entesis si b es True, y s sin cambios si b es False.

Por ejemplo:

ghci> mostrar (Suma (Suma (Suma (Const 1) (Const 2)) (Const 3)) (Const 4))   
$" 1 . 0 ~ + ~ 2 . 0 ~ + ~ 3 . 0 ~ + ~ 4 . 0 "$ 1   
ghci> mostrar (Suma (Const 1) (Suma (Const 2) (Suma (Const 3) (Const 4))))   
$" 1 . 0 ~ + ~ 2 . 0 ~ + ~ 3 . 0 ~ + ~ 4 . 0 "$   
ghci> mostrar (Div (Suma (Rango 1 5) (Mult (Const 3) (Rango 100 105))) (Const 2))   
"(1.0∼5.0 + (3.0 \* 100.0∼105.0)) / 2.0"   
ghci> mostrar (Resta (Resta (Const 1) (Const 2)) (Resta (Const 3) (Const 4)))   
"(1.0 - 2.0) - (3.0 - 4.0)"   
ghci> mostrar (Resta (Resta (Resta (Const 1) (Const 2)) (Const 3)) (Const 4))   
"((1.0 - 2.0) - 3.0) - 4.0"

# M´odulo Expr.Parser

El m´odulo Expr.Parser nos permite convertir String en Expr. Este m´odulo est´a completo y puede ser c´omodo para escribir algunos tests, aunque no es obligatorio usarlo.

parse :: String Expr devuelve un Expr si el String es una expresi´on v´alida o lanza da error en otro caso. Es una funci´on parcial. parseEither :: String Either String Expr similar a la anterior, pero devuelve un String describiendo el error si la expresi´on no es v´alida. Es una funci´on total.

# M´odulo App

El m´odulo App define la aplicaci´on incierticalc. Este m´odulo est´a completo. Define adem´as la funci´on auxiliar probarHistograma que puede usarse para probar el histograma de una expresi´on a partir de un generador directamente.

Cuando carguen ghci mediante make repl se va a cargar este m´odulo autom´aticamente, lo que les permite usar todos los m´odulos anteriores directamente.

# Demostraci´on

# Ejercicio 12

Necesitamos demostrar que toda expresi´on tiene un literal m´as que su cantidad de operadores. Los literales son las constantes y los rangos. Para esto se dispone de las siguientes definiciones2:

data Nat = Z | S Nat suma :: Nat Nat → Nat suma $z \texttt { m } = \texttt { m }$ -- { S1 } suma ( S n ) $\mathrm { ~ { ~ \tt ~ m ~ } ~ } = \mathrm { ~ { ~ \tt ~ S ~ } ~ }$ ( suma n m ) -- { S2 } cantLit :: Expr $\begin{array} { r l } {  } & { { } \mathbb { N } \mathtt { a t } } \end{array}$ cantLit ( Const _ ) = S Z -- { L1 } cantLit ( Rango _ _ ) = S Z -- { L2 } cantLit ( Suma a b ) $=$ suma ( cantLit a ) ( cantLit b ) -- { L3 } cantLit ( Resta a b ) $=$ suma ( cantLit a ) ( cantLit b ) -- { L4 } cantLit ( Mult a b ) $=$ suma ( cantLit a ) ( cantLit b) -- { L5 } cantLit ( Div a b ) $=$ suma ( cantLit a ) ( cantLit b ) -- { L6 }

$$
 \begin{array} { c c c c c c c c c c } { \operatorname { c a n t 0 p } } & { : : } & { \operatorname { E x p r } } & { \to } & { \mathbb { N a t } } & & & & \\ { \operatorname { c a n t 0 p } } & { ( \operatorname { C o n s t } } & { _ { - } ) } & { = } & { \operatorname { Z } } & & & & { - } & { \operatorname { \ell O } { \boldsymbol { \mathcal { Z } } } } \\ { \operatorname { c a n t 0 p } } & { ( \operatorname { R a n g } \circ } & { _ { - } - ) } & { = } & { \operatorname { Z } } & & & & & & { - } & { \operatorname { \ell O } { \boldsymbol { \mathcal { Z } } } } \\ { \operatorname { c a n t 0 p } } & { ( \operatorname { S u m a } _ { \mathrm { ~ a ~ \ b } } ) } & { = } & { \operatorname { S } } & { ( \operatorname { s u m a } } & { ( \operatorname { c a n t 0 p } _ { \mathrm { ~ a } } ) } & { ( \operatorname { c a n t 0 p } _ { \mathrm { ~ b } } ) ) } & { - } & { \operatorname { \ell } { \boldsymbol { \mathcal { O } } } { \boldsymbol { \mathcal { Z } } } } \\ { \operatorname { c a n t 0 p } } & { ( \operatorname { R e s t a } _ { \mathrm { ~ a ~ \ell } } \mathrm { ~ a ~ \ell } \mathrm { ~ b } ) } & { = } & { \operatorname { S } } & { ( \operatorname { s u m a } } & { ( \operatorname { c a n t 0 p } _ { \mathrm { ~ a } } ) } & { ( \operatorname { c a n t 0 p } _ { \mathrm { ~ b } } ) ) } & { - } & { \operatorname { \ell } { \boldsymbol { \mathcal { O } } } { \boldsymbol { \mathcal { Z } } } } \\ { \operatorname { c a n t 0 p } } & { ( \operatorname { N u 1 } \mathrm { t } \mathrm { ~ a ~ \ell } \mathrm { ~ a ~ \ell } \mathrm { ~ b } ) } & { = } & { \operatorname { S } } & { ( \operatorname { s u m a } } & { ( \operatorname { c a n t 0 p } _ { \mathrm { ~ a } } ) } & { ( \operatorname { c a n t 0 p } _ { \mathrm { ~ b } } ) ) } & { - } & { \operatorname { \ell } { \boldsymbol { \mathcal { O } } } { \boldsymbol { \mathcal { Z } } } } \\ { \operatorname { c a n t 0 p } } & { ( \operatorname { D i v } \mathrm { ~ a ~ \ell } \mathrm { ~ a ~ \ell ~ b } ) } & { = } & { \operatorname { S } } & { ( \operatorname { s u m a } } & { ( \operatorname { c a n t 0 p } ~ \mathrm { a } ) } & { ( \operatorname { c a n t 0 p } ~ \mathrm { b } ) ) } & \end{array}
$$

La propiedad a demostrar queda expresada de la siguiente manera:

Se pide:

a) Definir el predicado unario correspondiente a una demostraci´on por inducci´on estructural ( $\iota ,$ en qu´e estructura?) de esta propiedad.   
b) Definir el esquema formal de inducci´on estructural correspondiente a dicha demostraci´on. Incluir todos los cuantificadores necesarios (los cuantificadores son los ∀s y los $\exists \mathrm { s }$ ).   
c) Demostrar los casos correspondientes a los casos base y al constructor Suma. Los dem´as casos inductivos son an´alogos a este ´ultimo, y por eso les pedimos que no los escriban para este trabajo pr´actico. En general en la materia siempre tendr´an que escribir todos los casos, aunque sean an´alogos o similares, excepto que les digamos expl´ıcitamente que no es necesario.

• Todos los pasos de la demostraci´on deben estar debidamente justificados usando las herramientas que vimos en clase. • Pueden asumir el siguiente lema como v´alido. No hace falta demostrarlo:

$$
\{ \mathrm { C O N M U T } \} \qquad \forall \mathtt { n } , \mathtt { m } \ : : \ \mathtt { N a t } \ \cdot \ \mathtt { s u m a } \ \mathtt { n } \ \mathtt { m } = \mathtt { s u m a } \ \mathtt { m } \ \mathtt { n }
$$

# Pautas de Entrega

Se debe entregar a trav´es del campus un ´unico archivo llamado “tp1.zip” conteniendo el c´odigo con la implementaci´on de las funciones pedidas. Para eso, ya se encuentra disponible la entrega “TP1 - Programaci´on Funcional” en la solapa “TPs” (configurada de forma grupal para que s´olo una persona haga la entrega en nombre del grupo). El c´odigo entregado debe incluir tests que permitan probar las funciones definidas. El c´odigo debe poder ser ejecutado en Haskell2010. No es necesario entregar un informe sobre el trabajo, alcanza con que el c´odigo est´e adecuadamente comentado (son comentarios adecuados los que ayudan a entender lo que no es evidente o explican decisiones tomadas; no son adecuadas las traducciones al castellano del c´odigo). Los objetivos a evaluar son:

Correcci´on.

Declaratividad.

Prolijidad: evitar repetir c´odigo innecesariamente y usar adecuadamente las funciones previamente definidas (tener en cuenta tanto las funciones definidas en el enunciado como las definidas por ustedes mismos).

Uso adecuado de funciones de alto orden, currificaci´on y esquemas de recursi´on: Es necesario para los ejercicios que usen las funciones que vimos en clase y aquellas disponibles en la secci´on Util del campus y aprovecharlas, por ejemplo, usar zip, map, filter, take, takeWhile, ´ dropWhile, foldr, foldl, listas por comprensi´on, etc, cuando sea necesario y no volver a implementarlas.

Salvo donde se indique lo contrario, no se permite utilizar recursi´on expl´ıcita, dado que la idea del TP es aprender a aprovechar las caracter´ısticas enumeradas en el ´ıtem anterior. Se permite utilizar listas por comprensi´on y esquemas de recursi´on definidos en el preludio de Haskell y los m´odulos Prelude, List, Maybe, Data.Char, Data.List, Data.Map, Data.Function, Data.Maybe, Data.Ord y Data.Tuple. Las sugerencias de los ejercicios pueden ayudar, pero no es obligatorio seguirlas. Pueden escribirse todas las funciones auxiliares que se requieran, pero estas no pueden usar recursi´on expl´ıcita (ni mutua, ni simulada con fix).

Tests: cada ejercicio debe contar con uno o m´as ejemplos que muestren que exhibe la funcionalidad solicitada. Para esto se recomienda la codificaci´on de tests usando el paquete HUnit https://hackage.haskell.org/package/HUnit. El esqueleto provisto incluye algunos ejemplos de c´omo utilizarlo para definir casos de test para cada ejercicio.

Tambi´en se dispone de un Makefile que permite compilar y ejecutar los tests de los ejercicios y descargar HUnit directamente.

make test compila y ejecuta todos los tests.

make repl inicia GHCi con los m´odulos cargados.

make watch inicia GHCid y ejecuta los tests cada vez que se modifica un archivo.

make run compila y ejecuta la aplicaci´on interactiva.

Importante: Se espera que la elaboraci´on de este trabajo sea $1 0 0 \%$ de los estudiantes del grupo que realiza la entrega. As´ı que, m´as all´a de que pueden tomar informaci´on de lo visto en las clases o consultar informaci´on en la documentaci´on de Haskell o disponible en Internet, no se podr´an utilizar herramientas para generar parcial o totalmente en forma autom´atica la resoluci´on del TP (e.g., chat-GPT, copilot, etc). En caso de detectarse esto, el trabajo ser´a considerado como un plagio, por lo que ser´a gestionado de la misma forma que se resuelven las copias en los parciales u otras instancias de evaluaci´on.

# Referencias del lenguaje Haskell

Como principales referencias del lenguaje de programaci´on Haskell, mencionaremos:

The Haskell 2010 Language Report: el reporte oficial de la versi´on del lenguaje Haskell al 2010, disponible online en https://www.haskell.org/onlinereport/haskell2010.

Learn You a Haskell for Great Good!: libro accesible, para todas las edades, cubriendo todos los aspectos del lenguaje, notoriamente ilustrado, disponible online en https:// learnyouahaskell.com/chapters.   
Real World Haskell: libro apuntado a zanjar la brecha de aplicaci´on de Haskell, enfoc´andose principalmente en la utilizaci´on de estructuras de datos funcionales en la “vida real”, disponible online en https://book.realworldhaskell.org/read.   
Hoogle: buscador que acepta tanto nombres de funciones y m´odulos, como signaturas y tipos parciales, online en https://www.haskell.org/hoogle.