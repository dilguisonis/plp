# PARADIGMAS DE LENGUAJES DE PROGRAMACIÓN

Programación Funcional

Pablo E. “Fidel” Martínez López (fidel@unq.edu.ar)

“Cuando sepas reconocer la cuatrifolia en todas sus sazones, raíz, hoja y flor, por la vista y el olfato, y la semilla, podrás aprender el verdadero nombre de la planta, ya que entonces conocerás su escencia, que es más que su utilidad.”

Un mago de Terramar Úrsula K. Le Guin

# Programación

¿Cuáles son los dos aspectos fundamentales?

transformación de información

interacción con el medio

Ejemplos:

calcular el promedio de notas de examen

cargar datos de un paciente en su historia clínica

Este curso se concentra en el primer aspecto.

# Preguntas

¿Cómo saber cuándo dos programas son iguales?

Ejemplo:

¿Son equivalentes 'f(3)+f(3)' y '2\*f(3)'?

![](images/c570540e7e6fd915dcbebe8c3ec628f8ccead6ab93ef33bc63f24342684561da.jpg)

¿Siempre?

¿Sería deseable que siempre lo fueran? ¿Por qué?

# Ejemplo

¿Qué imprime este programa en Javascript?

// Test.js (gentileza de Martín Goffan, 2018)   
let x = 0;   
function f(y) { x = x + 1; return x + y; }   
console.log(f(3) + f(3));

¿Y con '2\*f(3)' en lugar de 'f(3)+f(3)'?

# Valores y Expresiones

Valores

→ entidades (matemáticas) abstractas con ciertas propiedades

→ Ejs: el número dos, el valor de verdad falso.

Expresiones

→ cadenas de símbolos utilizadas para denotar (escribir, nombrar, referenciar) valores

Ejs: 2, (1+1), False, (True && False)

# Transparencia Referencial

“El valor de una expresión depende sólo de los elementos que la constituyen.”

Implica:

+ consideración sólo del comportamiento externo de un programa (abstracción de detalles de ejecución).

posibilidad de demostrar propiedades usando las propiedades de las subexpresiones y métodos de deducción lógica.

![](images/50e48efac03314c4e586b38ada01c0086bbc29d2464f4b11065bbbf2b247e7b1.jpg)

# Expresiones

Expresiones atómicas

1 son las expresiones más simples

1 llamadas también formas normales

por abuso de lenguaje, les decimos valores

Ejs: 2, False, (3,True)

Expresiones compuestas

se 'arman' combinando subexpresiones

por abuso de lenguaje, les decimos expresiones

Ejs: (1+1), $( 2 = = 1 )$ , (4 - 1, True || False)

# Expresiones

![](images/118fe786f3359003f288a586b8528c22d512a4c9832edb25ddf7ce8f23068a41.jpg)

Puede haber expresiones incorrectas (“mal formadas”)

por errores sintácticos \*12 (True

por errores de tipo

¿Cómo saber si una expresión está “bien formada”?

Reglas sintácticas

Reglas de asignación de tipo

# Funciones

![](images/07633a1a2f3ec50d88a4f6387b8a0d67712c973cab4be7b90920f0a6f97d0eef.jpg)

Valores especiales, que representan “transformación de datos”

Dos formas de entender las funciones

VISIÓN DENOTACIONAL

una función es un valor matemático que relaciona cada elemento de un conjunto (de partida) con un único elemento de otro conjunto (de llegada).

# VISIÓN OPERACIONAL

![](images/723bfe57f78839514ae9b2152763a0b33934dfbaa15c6b822047d419b91ebc1c.jpg)

→ una función es un mecanismo (método, procedimiento, algoritmo, programa) que dado un elemento del conjunto de partida, calcula (devuelve, retorna) el elemento correspondiente del conjunto de llegada.

# Funciones

Ejemplo: doble x = x+x

Visión denotacional

a cada número x, doble le hace corresponder otro número, cuyo valor es la suma de x más x { (0,0), (1,2), (2,4), (3,6), ... }

Visión operacional

![](images/1c2c0a67633c5b99dfa131e5835fbb2b5d3c2e15ffc64b0255985583fce14df9.jpg)

dado un número x, doble retorna ese número sumado consigo mismo

doble 0  0 doble 1  2   
doble 2  4 doble 3  6

# Funciones

¿Cuál es la operación básica de una función?

la APLICACIÓN a un elemento de su partida

Regla sintáctica:

la aplicación se escribe por yuxtaposición

→ (f x) denota al elemento que se corresponde con x por medio de la función f.

Ej: (doble 2) denota al número 4

# Funciones

¿Qué expresiones denotan funciones?

Nombres (variables) definidos como funciones Ej: doble

Funciones anónimas (lambda abstracciones)

Ej: (\x -> x+x)

Resultado de usar otras funciones

Ej: doble . doble

# Ecuaciones Orientadas

Dada una expresión bien formada, ¿cómo determinamos el valor que denota?

Mediante ECUACIONES que establezcan su valor

¿Y cómo calculamos el valor de la misma?

Reemplazando subexpresiones, de acuerdo con las reglas dadas por las ecuaciones (REDUCCIÓN)

→ Por ello usamos ECUACIONES ORIENTADAS

# Ecuaciones Orientadas

Expresión-a-definir = expresión-definida

Visión denotacional

se define que el valor denotado por e1 (su significado) es el mismo que el valor denotado por la expresión e2

Visión operacional

para calcular el valor de una expresión que contiene a e1, se puede reemplazar e1 por e2

# Programas Funcionales

Definición de programa funcional (script):

→ Conjunto de ecuaciones que definen una o más funciones (valores).

Uso de un programa funcional

Reducción de la aplicación de una función a sus datos (reducción de una expresión).

# Funciones como valores

Las funciones son valores, al igual que los números, las tuplas, etc.

pueden ser argumento de otras funciones pueden ser resultado de otras funciones pueden almacenarse en estructuras de datos pueden ser estructuras de datos

![](images/277a3646a0998e6ba5738415c3a393ea9c47730c867f398b89fca2374e5751aa.jpg)

Funciones que manipulan funciones

Las llamamos “de alto orden”, abusando de esa nomenclatura

# Funciones como valores

Ejemplos doble x = x + x cuadruple x = 4 \* x sqr x = x\*x twice f = g where g x = f (f x) fs = [ sqr, doble, cuadruple, twice doble ]

(twice doble) 2  ?

¿Será cierto que cuadruple = twice doble?

# Lenguaje Funcional Puro

Definición de lenguaje funcional puro:

“lenguaje de expresiones con transparencia referencial y funciones como valores, cuyo modelo de cómputo es la reducción realizada mediante el reemplazo de iguales por iguales”

# Tipos

Toda expresión válida denota un valor

Todo valor pertenece a un conjunto

Los tipos denotan conjuntos

Entonces...

TODA EXPRESIÓN DEBERÍA TENER UN TIPO PARA SER VÁLIDA

(si una expresión no tiene tipo, es inválida)

# Asignación de Tipos

Notación: e :: A

→ se lee ''la expresión e tiene tipo A''

significa que el valor denotado por e pertenece al conjunto de valores denotado por A

Ejemplos:

2 :: Int False :: Bool

'a' :: Char doble :: Int -> Int

[ sqr, doble ] :: [ Int -> Int ]

# Asignación de tipos

Se puede deducir el tipo de una expresión a partir de su constitución

Algunas reglas

si e1 :: A y e2 :: B, entonces (e1,e2) :: (A,B) si m, n :: Int, entonces (m+n) :: Int si f :: A->B y e :: A, entonces f e :: B si d = e y e :: A, entonces d :: A

# Asignación de tipos

Se puede deducir el tipo de una expresión a partir de su constitución (cont.)

La regla más importante es

![](images/198aeb20e3eb25b8e4718d1db867bc4d64a5e5ec1b8e1bf24a0352c07d81420d.jpg)

![](images/9f9eed20edfceeb5d2e1b86ea26bd3ba4970b8c88f7e21304db1b31935c4a0e8.jpg)

Dice que si tenemos una aplicación, la parte izquierda debe ser una función, y el tipo del parámetro debe coincidir con el tipo del argument

# Asignación de tipos

Ejemplo: doble x = x+x

![](images/f1a17be8ccc7641f876cdf4949f6a2003c189180123d641a6ee76ac5071e46bb.jpg)

Por la primera parte

![](images/d3340a1565fd3902b53c78fb0e049de492365428cb7db6cccae3df98da53e7b2.jpg)

![](images/8b4d57fb0de80289de82ef061ac8fab2d9b2ee3d57b1b527238644de2bc6fdfc.jpg)

y por la segunda parte x+x :: Int, y eso solamente si x :: Int

Además, doble x y x+x tienen el mismo tipo.

# Asignación de tipos

Ejemplo: doble x = x+x

Entonces, continuando y volcando lo inferido

![](images/e5cab4be6094c11d996b41163f8d119b9de041f9dad5a55b9734c65f5f7c701e.jpg)

De esto puedo deducir que

doble :: Int -> Int

# Asignación de tipos

Ejemplo: doble x = x+x $\mathsf { t w i c e } ^ { \prime } \left( \mathsf { f } , \mathsf { y } \right) = \mathsf { f } \left( \mathsf { f } \ \mathsf { y } \right)$

x+x :: Int, y entonces sólo puede ser que x :: Int

doble x :: Int y x :: Int, entonces sólo puede ser que doble :: Int -> Int

si y :: A y f :: A -> A, entonces f y :: A, f (f y) :: A

como twice’ (f,y) :: A, y (f,y) :: (A->A, A), sólo puede ser que twice’ :: (A->A, A) -> A

# Asignación de tipos

Propiedades deseables

que sea automática (que haya un programa)

que le dé tipo al mayor número posible de expresiones con sentido

que no le dé tipo al mayor número posible de expresiones sin sentido

que se conserve por reducción

que los tipos sean descriptivos y razonablemente sencillos de leer

# Asignación de tipos

Inferencia de tipos

dada una expresión e, determinar si tiene tipo o no según las reglas, y cuál es ese tipo

Chequeo de tipos

→ dada una expresión e y un tipo A, determinar si e :: A según las reglas, o no

Sistema de tipado fuerte (strong typing)

sistema que acepta una expresión si, y sólo si ésta tiene tipo según las reglas y tal que las expresiones aceptadas nunca fallan por problemas de tipos

# Sistema de tipos

¿Para qué sirven los tipos?

detección de errores comunes

+ documentación

especificación rudimentaria

oportunidades de optimización en compilación

![](images/f954f5634b2fa8f84d8741da09bed8ca4272870d9e4dfa5081b0263ca130b5a0.jpg)

![](images/5f3f6dd569c6f03378af59241375207d5035dbfb3fde684dab0fb8c8779e7174.jpg)

Es una buena práctica en programación empezar dando el tipo del programa que se quiere escribir.

# Sistema Hindley-Milner

Tipos básicos

enteros Int caracteres Char booleanos Bool

Tipos compuestos

tuplas (A,B) listas [A] funciones (A->B)

Variables (polimorfismo) a,b,c,...

![](images/108c6251e9aba0fee3ce4b97b3ca0377c5620cdcac241405fbcfc1e0945bd418.jpg)

# Polimorfismo

¿Qué tipo tendrá la siguiente función? twice :: ??

twice f = g where g x = f (f x) twice doble :: ?? twice not :: ??

¿Es una expresión con sentido?

¿Debería tener un tipo?

En realidad:

twice :: $\begin{array} { r l } { \textsf { A } \textsf { A } } & { { } \textsf { A } \textsf { A } } \end{array}$ , cualquiera sea A

# Polimorfismo paramétrico

Solución: ¡variables de tipo! twice :: (a -> a) -> (a -> a)

se lee: ''twice es una función que dado una función de algún tipo a->a, retorna otra función de ese mismo tipo''

Esta es una función polimórfica

el tipo de su argumento puede ser instanciado de diferentes maneras en diferentes usos

twice doble :: Int- $\cdot >$ Int y aquí twice :: (Int->Int) -> (Int->Int) twice not :: Bool- $>$ Bool y aquí twice :: (Bool->Bool) $_ { - > }$ (Bool->Bool)

# Polimorfismo paramétrico

Polimorfismo

Característica del sistema de tipos

Dada una expresión que puede ser tipada de infinitas maneras, el sistema puede asignarle un tipo que sea más general que todos ellos, y tal que en cada uso pueda transformarse en uno particular.

Ej: twice :: (a->a) -> (a->a) más general twice :: (Int->Int) -> (Int->Int) particulares twice :: (Bool->Bool) -> (Bool->Bool) ...

? Reemplazando a por Int, por ejemplo, se obtiene un tipo particular

Se llama “paramétrico” pues a es el parámetro.

# Polimorfismo paramétrico

¿Tienen tipo las siguientes expresiones?   
¿Cuáles?   
(Recordar: twice f = g where g x = f (f x) ) twice :: ?? (twice doble) 3 :: ?? (twice twice) doble :: ?? twice twice :: ?? (twice twice) twice :: ?? ((twice twice) twice) doble :: ??

![](images/aeebb07ca16237a1b880a67d13adb84794bfd4143d71bfc4cdd81adad157bd01.jpg)

![](images/663dcc75b068d9e1fa075bfd12e8db9d787f8e3de3e79c02f0f4f5744a63e11b.jpg)

# Aplicación del alto orden

Considere las siguientes definiciones suma’ :: ??

suma’ $( x , y ) = x + y$

suma :: ??

suma $x = f$ where f y = x+y

![](images/892c9bd750756f89bf5d405e8da285e1c3f81c69e1ef20291f188dea5b0ac460.jpg)

¿Qué tipo tienen las funciones?

¿Qué similitudes observa entre suma y suma’?

¿Qué diferencias observa entre ellas?

# Aplicación del alto orden

Similitudes

ambas retornan la suma de dos enteros: suma’ (x,y) = (suma x) y, para x e y cualesquiera

Diferencias

→ una toma un par y retorna un número; la otra toma un número y retorna una función

con suma se puede definir la función sucesor sin usar variables extra:

succ = suma 1

# Currificación

Correspondencia entre cada función de múltiples parámetros y una de alto orden que retorna una función intermedia que completa el trabajo.

Por cada f’ definida como $\begin{array} { l } { { { \sf f } ^ { \prime } : ( { \sf a } , { \sf b } )  { \sf c } } } \\ { { { \sf f } ^ { \prime } ( x , y ) = { \sf e } } } \end{array}$ siempre se puede escribir $\begin{array} { l } { f \mathrel { \mathop : } = \textsf { a } \to ( \mathsf { b } \to \mathsf { c } ) } \\ { ( \mathsf { f } \times ) \mathsf { y } = \mathsf { e } } \end{array}$

# Currificación

Correspondencia entre los tipos

(a,b) -> c y a -> (b -> c)

${ \mathsf { c u r r y } } : : ( ( { \mathsf { a } } , { \mathsf { b } } ) \to { \mathsf { c } } ) \to ( { \mathsf { a } } \to ( { \mathsf { b } } \to { \mathsf { c } } ) )$ curry …

uncurry :: (a -> (b -> c)) -> ((a,b) -> c) uncurry …

Se puede demostrar que

curry (uncurry f) = f uncurry (curry f') = f'

# Currificación Sintaxis

¿Cómo escribimos una función currificada y su aplicación?

Considerar las siguientes definiciones twice :: (Int->Int) -> (Int -> Int) twice1 f = g where g x = f (f x) $\mathsf { t w i c e } _ { 2 } \mathsf { f } = \mathsf { \backslash x } \to \mathsf { f } \left( \mathsf { f } \mathsf { x } \right)$ $( \mathrm { t w i c e } _ { 3 } \mathsf { f } ) \mathsf { x } = \mathsf { f } ( \mathsf { f } \mathsf { x } )$

![](images/6b53b1ca210dde9069bc9206020034096d8449e2e3298bda41125d51f84fe7dd.jpg)

¿Son equivalentes? ¿Cuál es preferible? ¿Por qué?

# Currificación

¿Qué pasa con un ejemplo más grande?

? Consideremos una función para sumar 5 números

sum5' :: (Int, Int, Int, Int, Int) -> Int sum5' $( \mathsf { x } , \mathsf { y } , \mathsf { Z } , \mathsf { v } , \mathsf { w } ) = \mathsf { x } + \mathsf { y } + \mathsf { Z } + \mathsf { v } + \mathsf { w }$

vs.

sum5 :: ??

sum5 = ??

# Currificación

¿Qué pasa con un ejemplo más grande? (cont.)

Con nombres intermedios...

sum5 :: Int -> (Int -> (Int -> (Int -> (Int -> Int))))   
sum5 x = sum4 where sum4 y = sum3 where sum3 z = sum2 where sum2 v = sum1 where sum1 w = x+y+z+v+w

# Currificación

¿Qué pasa con un ejemplo más grande? (cont.)

Con aplicación reiterada...

sum5 :: Int -> (Int -> (Int -> (Int -> (Int -> Int)))) ((((sum5 x) y) z) v) w = x+y+z+v+w

vs.

sum5' :: (Int, Int, Int, Int, Int) -> Int sum5' $( \mathsf { x } , \mathsf { y } , \mathsf { Z } , \mathsf { v } , \mathsf { w } ) = \mathsf { x } + \mathsf { y } + \mathsf { Z } + \mathsf { v } + \mathsf { w }$

# Currificación

¿Cómo podemos evitar usar paréntesis? Convenciones de notación

La aplicación de funciones asocia a izquierda

El tipo de las funciones asocia a derecha

# Currificación

Por abuso de lenguaje

suma :: Int ->Int ->Int

suma x y = x+y

suma es una función que toma dos enteros y retorna otro entero.

en lugar de

suma :: Int -> (Int -> Int)

(suma x) y = x+y

suma es una función que toma un entero y devuelve una función, la cual toma un entero y devuelve otro entero.

![](images/f0ca47542323e037f7587e091faa1ce42ba3a8a46442c9ebc42e97f9e25ae65d.jpg)

![](images/8df8e438c89fc5447b16f8af7483bc4180fa17e46b8e6a7ede80b0de800de2fa.jpg)

# Currificación

Ventajas.

Mayor expresividad derive :: (Int -> Int) -> (Int -> Int) derive f x = (f (x+h) - f x) / h where h = 0.0001

Aplicación parcial derive f $( = | x - > ( f ( x + h ) - f ( x ) / h )$

Modularidad para tratamiento de código

Al inferir tipos

Al transformar programas

# Aplicación Parcial

Definir un función que calcule la derivada nésima de una función

deriveN :: Int -> (Int -> Int) -> (Int -> Int) deriveN 0 f = f deriveN n f = deriveN (n-1) (derive f)

![](images/252e2d3271f96634e3df5f4be105488c6c0735824313cca17ab6316d7c614235.jpg)

Aplicación parcial de derive.

¿Cómo lo haría con derive'?

# Expresividad

Definir un función que calcule la aplicación n veces de una función

$$
\begin{array} { l } { \mathsf { m a n y \ldots } \mathsf { m t \ldots } \mathsf { ( a - s \mathtt { a ) \ldots } s } \mathsf { ( a - s \mathtt { a ) \ldots } s } \mathsf { ( a - s \mathtt { a ) \ldots } s } } \\ { \mathsf { m a n y 0 \mathtt { f } x = x } } \\ { \mathsf { m a n y n f \ x = m a n y ( n - 1 ) \mathtt { f } ( f \ x ) } } \end{array}
$$

Se pueden probar (o definir) muchas ideas ya vistas...

twice = many 2 deriveN n = many n derive

# Currificación

Decir que algo está currificado es una CUESTIÓN DE INTERPRETACIÓN

movePoint :: (Int, Int) -> (Int, Int) movePoint $( x , y ) = ( x + 1 , y + 1 )$

distance :: (Int, Int) -> Int distance $( \mathsf { x } , \mathsf { y } ) = \mathsf { s q }$ rt (sqr x + sqr y)

¿Están currificadas? ¿Por qué?

![](images/b50fed9090be90baa382c897459f6fdf5e88a2eb078b098d9b7477c211fa6cbf.jpg)

# Otros conjuntos

Los tipos definidos hasta ahora, ¿son suficientes para la tarea de programar?

por ejemplo, si estuvieramos programando un intérprete para un lenguaje de programación, ¿cómo representaríamos un programa?

¿Cómo definimos conjuntos con infinitos elementos?

¿Cómo definimos funciones recursivas que no se cuelguen?

¿Cómo probamos propiedades de estos conjuntos?

# Inducción/Recursión

Para solucionar los tres problemas, usaremos INDUCCIÓN

La inducción es un mecanismo que nos permite:

![](images/7fb2da18f26ab1ba90b868f95ec18923fc33aa84ec76303d56dfb6a83f21dde5.jpg)

Definir conjuntos infinitos

Probar propiedades sobre sus elementos

Definir funciones recursivas sobre ellos, con garantía de terminación

# Inducción estructural

Una definición inductiva de un conjunto consiste en dar condiciones de dos tipos:

reglas base $( z \in \Re )$

+ que afirman que algún elemento simple $x$ pertenece a 

reglas inductivas $( y _ { I } \in \mathfrak { R } , . . . , y _ { n } \in \mathfrak { R } \Rightarrow y \in \mathfrak { R } )$

+ que afirman que un elemento compuesto $y$ pertenece a  siempre que sus partes $y _ { I } , . . . , y _ { n }$ pertenezcan a  (e y no satisface otra regla de las dadas)

y pedir que  sea el menor conjunto (en sentido de la inclusión) que satisfaga todas las reglas dadas.

# Funciones recursivas

Sea S un conjunto inductivo, y T uno cualquiera. Una definición recursiva estructural de una función f :: S -> T es una definición de la siguiente forma:

por cada elemento base z, el valor de (f z) se da directamente usando valores previamente definidos

por cada elemento inductivo y, con partes inductivas y1, ..., yn, el valor de (f y) se da usando valores previamente definidos y los valores (f y1), ..., (f yn).

# Principio de inducción

Sea S un conjunto inductivo, y sea P una propiedad sobre los elementos de $\mathrm { S }$ . Si se cumple que:

para cada elemento $z { \in } \mathrm { S }$ tal que z cumple con una regla base, $\mathrm { P } ( z )$ es verdadero, y

para cada elemento $y \in \mathrm S$ construído en una regla inductiva utilizando los elementos $y _ { I } , . . . , y _ { n } ,$ si $\mathrm { P } ( y _ { I } ) , . . . , \mathrm { P } ( y _ { n } )$ son verdaderos entonces $\mathrm { P } ( y )$ lo es, entonces $\mathrm { P } ( x )$ se cumple para todos los $x \in \mathrm S$ $\forall x . \mathrm { P } ( x )$ se demostró por inducción estructural en x “...de más está decir que rehusarse a explotar este poder de las matemáticas concretas equivale a suicidio intelectual y tecnológico. La moraleja de la historia es: traten a todos los elementos de un conjunto ignorándolos y trabajando con la definición del conjunto.”

On the cruelty of really teaching computing science (EWD 1036) Edsger W. Dijkstra

![](images/defceef3a4f5b3390a3c9b422a152e0422522c0fabbf9f3821743691dd29beea.jpg)

# Ejemplo: LISTAS

Dado un tipo cualquiera a, definimos inductivamente al conjunto [a] con las siguientes reglas:

[] :: [a]

si x :: a y xs :: [a] entonces x:xs :: [a]

¿Qué elementos tiene [Bool]? ¿Y [Int]?

Notación: $[ \mathsf { x } _ { 1 } , \mathsf { x } _ { 2 } , \mathsf { x } _ { 3 } ] = ( \mathsf { x } _ { 1 } : ( \mathsf { x } _ { 2 } : ( \mathsf { x } _ { 3 } : [ \mathsf { J } ) ) )$

# Ejemplo: LISTAS

Definir por recursión una función len que cuente los elementos de una lista.

![](images/18741c945a232e21701e0bcf842dde48af1052bf18961a528439bf8ee6370913.jpg)

# Ejemplo: LISTAS

Definir por recursión una función len que cuente los elementos de una lista.

![](images/ea3dfb31a2c01edf1d699b099d165db71b5d18afc592c6eddb7519b52084a0e4.jpg)

# Funciones sobre listas

Siguiendo el patrón de recursión

len len $\begin{array} { l } { \displaystyle \because \lfloor \mathsf { a } \rfloor \to \mathsf { i n t } } \\ { \displaystyle \qquad = 0 } \\ { \displaystyle ( \mathsf { x } \times \mathsf { s } ) = 1 + \mathsf { i e n } \times \mathsf { s } } \end{array}$ len

append :: [a] -> [a] -> [a]   
append [ ] ys = ys   
append (x:xs) ys = x : (append xs ys)

$( + + ) = \mathsf { a p p e n d }$

# Funciones sobre listas

Sin seguir el patrón de recursión

head :: [a] -> a head (x:xs) = x

![](images/75efcdee2ba7cfa7f9465a2512ee08e205146e31162fb1a99ca5e4fcef4a2dcf.jpg)

tail :: [a] -> [a] tail $( { \mathsf { X } } \times { \mathsf { S } } ) = { \mathsf { X } } { \mathsf { S } }$

null :: [a] -> Bool null [ ] = True null (x:xs) = False

# Funciones sobre listas

Más funciones siguiendo el patrón de recursión

sum :: [Int] -> Int   
sum [ ]   
sum (n:ns) ... n ... sum ns

prod :: [ Int ] -> Int prod [ ] prod (n:ns) ... n ... prod ns

¿Cómo definir (sum [ ]) y (prod [ ])?

![](images/4e03e5b85f454cdb21f8e2f9fbe33c6962d79b977650f9ee60cf80a0d187bcaf.jpg)

# Funciones sobre listas

Más funciones siguiendo el patrón de recursión

sum :: [Int] -> Int sum [ ] = 0 sum (n:ns) = n + sum ns

prod :: [ Int ] -> Int prod [ ] 二 = 1 prod (n:ns) = n \* prod ns

![](images/1a653f87e7e7aaa3950a507e2441b5ee325dd24f129fe7535706c953e009dbc9.jpg)

¿Por qué se puede definir (sum [ ]) y (prod [ ]) de esta manera?

# Funciones sobre listas

Más funciones siguiendo el patrón de recursión

upperl :: [Char] -> [Char] upper l [ ] = upperl (c:cs) = ... c ... (upperl cs)

novacias :: [ [ a ] ] -> [ [ a ] ]   
novacias [ ]   
novacias (xs:xss) = ... xs ... novacias xss

![](images/c2c01fa55562720275de130d7f4c48a20643350baa169e4880e050852bbb9cc1.jpg)

# Funciones sobre listas

Más funciones siguiendo el patrón de recursión

upperl :: [Char] -> [Char]   
upperl [ ] = [ ]   
upperl (c:cs) = (upper c) : (upperl cs)   
novacias :: [ [ a ] ] -> [ [ a ] ]   
novacias [ ] = [ ]   
novacias (xs:xss) = if null xs then novacias xss else xs : novacias xss

# Funciones sobre listas

Siguiendo otro patrón de recursión   
maximum :: [ a ] -> a   
maximum [ x ] = x   
maximum (x:xs) = x \`max\` maximum xs   
last $\begin{array} { l } { \cdots [ \textsf { a } ] \to \textsf { a } } \\ { \textsf { x } = \textsf { x } } \\ { ( \textsf { x } \times \mathsf { s } ) = \mathsf { i a s t } \times \mathsf { s } } \end{array}$   
last   
last

![](images/dd841753fe1795e40e669f0785f7de53fda14713326fa9dad749d39c74be4281.jpg)

¿puede establecer cuál es el patrón? ¿por qué (maximum [ ]) no está definida?

# Funciones sobre listas

Otras funciones   
reverse :: [ a ] -> [ a ]   
reverse [ ] =   
reverse (x:xs) = ... reverse xs ... x ...   
insert :: a -> [ a ] -> [ a ]   
insert x [ ] = ...   
insert x (y:ys) = ... y ... x ... ys ... (insert x ys) ...

# Funciones sobre listas

Otras funciones   
reverse :: [ a ] -> [ a ]   
reverse [ ] = [ ]   
reverse (x:xs) = reverse xs ++ [ x ]   
insert :: a -> [ a ] -> [ a ]   
insert x [ ] = [ x ]   
insert $x \left( y ; y \mathsf { s } \right) = \mathsf { i f } \mathsf { x } < = \mathsf { y }$ then x : (y : ys) else y : (insert x ys)

“'Detrás de cada acontecimiento se esconde un truco de espejos. Nada es, todo parece. Escóndase, si quiere. Espíe por las ranuras. Alguien estará preparando otra ilusión. Las diferencias entre las personas son las diferencias entre las ilusiones que perciben.'

(Consejero, 121:6:33)”

El Fondo del Pozo Eduardo Abel Giménez

# Parametrización

¿Qué es un parámetro? Consideremos

$$
\begin{array} { r l r l } & { \mathfrak { c } = \mathsf { x } + \boxed { 1 } } & & { ( \mathfrak { d } \quad \mathfrak { f } = \mathsf { W } \to \mathsf { x } + \boxed { 1 } ) } \\ & { \mathsf { x } = \mathsf { x } + \boxed { 1 7 } } & & { ( \mathfrak { d } \quad \mathfrak { g } = \mathsf { W } \to \mathsf { x } + \boxed { 1 7 } ) } \\ & { \mathsf { x } = \mathsf { x } + \boxed { 4 2 } } & & { ( \mathfrak { d } \quad \mathfrak { h } = \mathsf { W } \to \mathsf { x } + \boxed { 4 2 } ) } \end{array}
$$

Sólo las partes recuadradas son distintas ¿podremos aprovechar ese hecho?

# Parametrización

¿Qué es un parámetro?

![](images/cbcfe598c35e3d3f1d8a5d6629baf19375799a75670c453faa80a43e54d7d1a2.jpg)

Sólo las partes recuadradas son distintas ¿podremos aprovechar ese hecho?

Técnica de los “recuadros”

Parámetro: valor que cambia en cada uso

# Esquemas de funciones

Probemos con funciones sobre listas

+ Escribir las siguientes funciones:   
succl :: [ Int ] -> [ Int ]   
-- suma uno a cada elemento de la lista   
upperl :: [ Char ] -> [ Char ]   
-- pasa a mayúsculas cada carácter de la lista   
test :: [ Int ] -> [ Bool ]   
-- cambia cada número por un booleano que   
-- dice si el mismo es cero o no   
→ ¿Observa algo en común entre ellas?

# Esquemas de funciones

Solución:

succl [ ]   
succl (n:ns) = ... n ... succl ns ... upperl [ ]   
upperl (c:cs) = ... c ... upperl cs ... test [ ]   
test (x:xs) = ... x ... test xs

Usamos el esquema de recursión estructural sobre listas

# Esquemas de funciones

Solución:

succl [ ] = [ ]   
succl (n:ns) = ( n +1) : succl ns   
upperl [ ] = [ ]   
upperl (c:cs) = upper c upperl cs   
test [ ] = [ ]   
test (x:xs) = ( x ==0) : test xs

Sólo las partes recuadradas son distintas... pero los círculos rojos “molestan”

# Esquemas de funciones

Solución:

succl [ ] [ ]   
succl (n:ns) ( n +1) : succl ns   
upperl [ ] [ ]   
upperl (c:cs) upper c upperl cs   
test [ ] ]   
test (x:xs) ( x ==0) : test xs

Sólo las partes recuadradas son distintas... pero los círculos rojos “molestan”

# Esquemas de funciones

Técnica de los “recuadros” (extendida)

succl [ ] [ ]   
succl (n:ns) (\n' -> n'+1) n : succl ns   
upperl [ ]   
upperl (c:cs) (\c' -> upper c') c : upperl cs   
test [ ]   
test (x:xs) (\n -> n ==0) x : test xs

→ Reescribimos los recuadros (azules) para que no dependan del contexto (círculos rojos)

# Esquema de map

Procedemos con la abstracción: map :: ?? map [ ] map (x:xs) = x : map xs

![](images/f5d7942a8ece90fde80347e6a8d0b15ea2325566420b9485f8d912e5d2f588b9.jpg)

# Esquema de map

Completamos la definición map :: ?? map f [ ] = [ ] map f (x:xs) = x : map f xs

![](images/d5a70e149b5a19b10b74b0b57c1ede1d59f3acae703fdcf9e306d73ace3edc56.jpg)

# Esquema de map

Completamos la definición map :: ?? map f [ ] = [ ] map f (x:xs) x : map f xs

Y entonces succl' = map (\n' -> n'+1) upperl' = map upper test' = map (==0)

![](images/cb3fa55408643437439cac96747343d072534e36fc65a7fa991e03d8ebeba22c.jpg)

# Esquema de map

Agregamos el tipo map :: (a -> b) -> [a] -> [b] map f [ ] = [ ] map f (x:xs) x : map f xs

Y entonces succl' = map (\n' -> n'+1) upperl' = map upper test' = map (==0)

![](images/da207edc9137cdc45ea8959286dd01209db16e7b9bea11671059ac3a24609f35.jpg)

# Esquema de map

Agregamos el tipo map :: (a -> b) -> ([a] -> [b]) map f [ ] = [ ] map f (x:xs) F x : map f xs

Y entonces succl' = map (\n' -> n'+1) upperl' = map upper test' = map (==0)

¿Podría probar que succl' = succl? ¿Cómo?

![](images/2b9074b9a8263667895bb976d3b80e9d2dc52a31ffb729e143741fa733ffc466.jpg)

# Esquema de map

# Demostración

Por principio de extensionalidad, probamos que para toda lista finita xs, succl' xs = succl xs por inducción en la estructura de la lista.

Caso base: xs = [ ]

Usar succl', map.1, y succl.1

Caso inductivo: xs = x:xs'

3 Usar succl', map.2, succl', HI, y succl.2

¡Observar que no estamos contemplando el caso  ni el de listas no finitas, o con elementos !

# Esquemas de funciones

Una vez más, con otras funciones

Escribir las siguientes funciones: masQueCero :: [ Int ] -> [ Int ] -- retorna la lista que sólo contiene los números -- mayores que cero, en el mismo orden digitos :: [ Char ] -> [ Char ] -- retorna los caracteres que son dígitos noVacias :: [ [a] ] -> [ [a] ] -- retorna sólo las listas no vacías + ¿Observa algo en común entre ellas?

# Esquemas de funciones

Solución:

digitos [ ]   
digitos (c:cs) = c digitos cs   
noVacias [ ]   
noVacias (xs:xss) = ... xs ... noVacias xss .

Siempre recursión estructural

![](images/3002b0266d2eb552a4ced1e5d8dae9a7521a63917e5cceebb58eda3c9f297cc9.jpg)

# Esquemas de funciones

Solución:

digitos [ ] = [ ]   
digitos (c:cs) = if (isDigit c ) then c : digitos cs else digitos cs   
noVacias [ ] = [ ]   
noVacias (xs:xss) = if (null xs ) then noVacias xss else xs : noVacias xs

→ Otra vez, técnica de los “recuadros” extendida

# Esquemas de funciones

Solución:

digitos [ ] = [ ]   
digitos (c:cs) = if (isDigit c ) then c : digitos cs else digitos cs   
noVacias [ ] = [ ]   
noVacias (xs:xss) = if (null xs ) then noVacias xss else xs : noVacias xss

? Otra vez, técnica de los “recuadros” extendida

# Esquemas de funciones

Solución:

digitos [ ] [ ]   
digitos (c:cs) = if (\c' -> isDigit c') c then c : digitos cs else digitos cs   
noVacias [ ] [ ]   
noVacias (xs:xss) = if (\xs' -> not (null xs')) xs then xs : noVacias xss

else noVacias xss

Observar el cambio en el if de noVacias para que ambas funciones se parezcan

# Esquema de filter

Procedemos con la abstracción filter :: ?? filter [ ] = [ ] filter (x:xs) = if (

then x : filter xs else filter xs

![](images/e06eee478b67ffd63ffc185dad4cefe4bc09c6864f575432fd3439a7ce488868.jpg)

![](images/03a3e86472a33964e5c53fb939582f3d166c3ed89c66a1332e88811806c936d5.jpg)

# Esquema de filter

Completamos la definición filter :: ?? filter p [ ] = [ ] filter p (x:xs) = if ( p x then x : filter p xs else filter p xs

![](images/993b6a6bac0970301e6361ad19fe4409c8e92086b345aa51e9d5fd66ce4b13be.jpg)

Y entonces masQueCero' = filter $( > 0 )$ digitos' = filter isDigit noVacias' = filter (not . null)

![](images/f69daea2fd2c5cf44f0a45fa80784750b411f4483105582810cfd01e0d046b5b.jpg)

# Esquema de filter

Agregamos el tipo

filter :: (a->Bool) -> [a] -> [a]   
filter p [ ] [ ]   
filter p (x:xs) = if ( p x then x : filter p xs else filter p xs

Y entonces masQueCero' = filter $( > 0 )$ digitos' = filter isDigit noVacias' = filter (not . null)

# Esquema de filter

![](images/a552e5f3101a858dcb6da61308a1f5a10d8fcd151c3aade314ab0a32910b4e75.jpg)

Agregamos el tipo

filter :: (a->Bool) -> ([a] -> [a])   
filter p [ ] [ ]   
filter p (x:xs) = if ( p x ) then x : filter p xs else filter p xs

Y entonces masQueCero' = filter $( > 0 )$ digitos' = filter isDigit noVacias' = filter (not . null)

¿Podría probar que noVacias' = noVacias?

# Esquemas de funciones

Una vez más, con más complejidad

Escribir las siguientes funciones: sonCincos :: [ Int ] -> Bool -- dice si todos los elementos son 5 cantTotal :: [ [a] ] -> Int -- dice cuántos elementos de tipo a hay en total concat :: [ [a] ] -> [ a ] -- hace el append de todas las listas en una

¿Observa algo en común entre ellas? ¿Qué es?

# Esquemas de funciones

Solución:

sonCincos [ ] =   
sonCincos (n:ns) = … n ... sonCincos ns ...   
concat [ ]   
concat (xs:xss) xs . concat xss

Recursión estructural

# Esquemas de funciones

Aplicando la técnica de las cajas sonCincos [ ] = True sonCincos (n:ns) = n ==5 && sonCincos ns   
concat [ ] [ ] concat (xs:xss) xs ++ concat xss

Los “recuadros” son más complicadas, pero la técnica es la misma

![](images/b53ae4d4977f1ee04c8628c526c54f2b249946f5a73a3e3472e4e0df09b5144e.jpg)

# Esquemas de funciones

![](images/18c4244bcbb1a82baf85965bfa773ed19d9ecae42ab10da7dfd1b03f8d3d3e54.jpg)

![](images/a2dc9b91a54ffb1e8a9a7fb0b229286fb6b9d0f0546f87b864b5e737c8e9a784.jpg)

Los “recuadros” son más complicadas, pero la técnica es la misma

![](images/2159ede12e686f0cf66e7148b48611521139cdf0d01972bd71349c9c0a674819.jpg)

# Esquemas de funciones

![](images/a32104c33a04e3a8c51a8693df410f5684597b7278183acd6d0420bb51fbd92b.jpg)

Los “recuadros” son más complicadas, pero la técnica es la misma

# Esquema de recursión (fold)

Procedemos con la abstracción foldr :: ?? foldr [ ] foldr (x:xs) = x ( foldr xs )

![](images/58b1f2045fe89b81ca9106787e482087ecd4230b5c0f146d5358bb6b22242f3f.jpg)

# Esquema de recursión (fold)

Completamos la definición foldr :: ?? foldr f z [ ] z foldr f z (x:xs) f x ( foldr f z xs )

![](images/51189f399e8630e68f8fccb165cd8eb82d4ca9ea9185920fb1a631ee075729c4.jpg)

# Esquema de recursión (fold)

Completamos la definición foldr :: ?? foldr f z [ ] z foldr f z (x:xs) f x

![](images/9830d6784029f1410f7af9819a2f50fa472d9ef0930bb91e13a941476ed50d66.jpg)

Y entonces sonCincos' = foldr check True where check x b = (x==5) && b cantTotal' = foldr $( ( + )$ . len) 0 concat' = foldr (++) [ ]

![](images/068b8c3473ba8ef966f7261b7571394d2626d5549038b051f5f8512eb89771bf.jpg)

# Esquema de recursión (fold)

Agregamos el tipo

foldr :: (a->b->b) -> b -> [a] -> b foldr f z [ ] z foldr f z (x:xs) = f x ( foldr f z xs )

Y entonces sonCincos' = foldr check True where check x b = (x==5) && b cantTotal' = foldr $( ( + )$ . len) 0 concat' = foldr (++) [ ]

![](images/9f75b8ec0656383a8d725c2a176dce486572e8bdd13aa14aba9986d8beb91502.jpg)

# Esquema de recursión (fold)

Agregamos el tipo

foldr :: (a->b->b) -> b -> ([a] -> b) foldr f z [ ] z foldr f z (x:xs) f x ( foldr f z xs )

Y entonces sonCincos' = foldr check True where check x b = (x==5) && b cantTotal' = foldr $( ( + )$ . len) 0 concat' = foldr (++) [ ]

¿Podría probar que concat' = concat?

![](images/486d44b27d582a7f79db640a76c7cedb1a5d439c624dbe51976897a060038550.jpg)

# Esquemas de funciones

¿Qué ventajas tiene trabajar con esquemas?

Permite

+ definiciones más concisas y modulares reutilizar código demostrar propiedades generales

![](images/da24f3a22fe20921977ba9d64509c3ec57abc2eb9b439f0c8ac8c47c2dbd6e73.jpg)

¿Qué requiere trabajar con esquemas?

Familiaridad con funciones de alto orden Detección de características comunes (¡ABSTRACCIÓN!)

# Propiedades de esquemas

Propiedades de los esquemas

Analicemos el ejemplo de cantTotal

cantTotal :: [ [a] ] -> Int

-- dice cuántos elementos de tipo a hay en total

-- canTotal $[ \mathbf { \Psi } ] = 0$ -- cantTotal (xs:xss) = length xs + cantTotal xss

cantTotal = foldr (\zs n -> length zs + n) 0 cantTotal = foldr ((+) . length) 0

¿Hay otra forma de pensarlo?

# Propiedades de esquemas

Alternativa para cantTotal cantTotal' :: [ [a] ] -> Int cantTotal' xss = sum (map length xss) sum = foldr (+) 0

¿Será cierto que cantTotal es igual a cantTotal'?

Sugiere una propiedad, que para todo xs

# foldr f z (map g xs) = foldr (f . g) z xs

O sea, procesar primero cada elemento y luego unir los resultados da lo mismo que unir los resultados procesando cada elemento al unirlo

¡Demostración por inducción estructural!

# Esquemas y alto orden

¿Cómo definir append con foldr? append :: [a] -> ([a] -> [a]) append [] \ys -> ys append (x:xs) = \ys -> x : append xs

Expresado así, es rutina: \ys -> x : append xs ys = (\x' h -> \ys -> x' : h ys) x (append xs)   
y entonces append = foldr (\x h ys -> x : h ys) id = foldr (\x h -> (x:) . h) id = foldr ((.) . (:)) id

# Esquemas y alto orden

¿Cómo definir take con foldr?

take :: Int -> [a] -> [a]   
take _ [] = []   
take 0 (x:xs) = []   
take n (x:xs) = x : take (n-1) xs

¡El n cambia en cada paso!

Primero debo cambiar el orden de los argumentos take' :: [a] -> (Int -> [a]) take' [] \_ -> [] take' (x:xs) = \n -> case n of 0 -> [ -> x take' xs (n-1)

# Esquemas y alto orden

¿Cómo definir take con foldr? (Cont.)

$$
{ \mathrm { t a k e } } ^ { \prime } \because [ a ]  ( \ln ( - ) [ a ] )
$$

take' = foldr g (const []) $\begin{array} { c } { { \mathsf { w h e r e ~ g \_ - - } 0 = \prod } } \\ { { \mathsf { g } \times \mathsf { h } \mathsf { n } = \mathsf { x } : \mathsf { h } ( \mathsf { n } - \bot ) } } \end{array}$

y entonces

$\mathrm { t a k e } \because \vert \boldsymbol { \mathsf { n } } \boldsymbol { \mathsf { t } } - \boldsymbol { \mathsf { > } } [ \mathsf { a } ]  [ \mathsf { a } ]$ take = flip take'

flip f x y = f y x

# Esquemas y alto orden

Un ejemplo más: la función de Ackerman (¡con notación unaria!)

data One = One   
ack :: Int -> Int -> Int   
ack n m = u2i (ack' (i2u n) (i2u m)) where i2u n = repeat n One u2i = length   
ack' :: [ One ] -> [ One ] -> [ One ]   
ack' [] ys = One : ys   
ack' (x:xs) [] = ack' xs [ One ]   
ack' (x:xs) (y:ys) = ack' xs (ack' (x:xs) ys)

# Esquemas y alto orden

La función de Ackerman (cont.)

$\mathsf { a c k } ^ { \star } \mathrel { \mathop : } [ \mathsf { O n e } ] \mathrel { \mathop  } [ \mathsf { O n e } ] \mathrel { \mathop  } [ \mathsf { O n e } ]$ ack' [] = \ys -> One : ys ack' (x:xs) = g where g [] = ack' xs [ One ] g (y:ys) = ack' xs (g ys)

Reescribimos ack' (x:xs) = g como un foldr ack' (x:xs) = foldr (\_ -> ack' xs) (ack' xs [ One ])

# Esquemas y alto orden

Y finalmente podemos definir ack' con foldr

$\mathsf { a c k } ^ { \star } \mathrel { \mathop : } [ \mathsf { O n e } ] \mathrel { \mathop  } [ \mathsf { O n e } ] \mathrel { \mathop  } [ \mathsf { O n e } ]$ ack' = foldr (const g) (One :) where g h = foldr (const h) (h [ One ])

Con esto podemos ver que la función de Ackerman termina para todo par de números naturales.

# Esquemas en otros tipos

Los esqumas de recursión también se pueden definir para otros tipos.

Los naturales son un tipo inductivo. foldNat :: (b -> b) -> b -> Nat -> b foldNat $\textsf { S Z O } = Z$ foldNat s z n = s (foldNat s z (n-1))

Los casos de la inducción son cero y el sucesor de un número, y por eso los argumentos del foldNat.

# Recursión Primitiva (Listas)

No toda función sobre listas es definible con foldr.

Ejemplos:

tail :: [a] -> [a] tail (x:xs) = xs

![](images/37b257a1d162c5f8ec2b57da5b67e31e62089bb9c6a0d789782b839e528b0891.jpg)

insert :: a -> [a] -> [a]   
insert x [] = [x]   
insert x (y:ys) = if x<y then (x:y:ys) else (y:insert x ys)

(Nota: en listas es complejo de observar. La recursión primitiva se observa mejor en árboles.)

# Recursión Primitiva (Listas)

El problema es que, además de la recursión sobre la cola, ¡utilizan la misma cola de la lista!

Solución

$$
\begin{array} { l } { { \tt c r \ " . b . > ( a  [ a ]  b . > b ) . > [ a ] . > b } } \\ { { \tt c r \ " z \ " f } \qquad = \tt z } \\ { { \tt c r \ " z \ " f } ( x \times s ) = \tt f \times x s ( r e c r \vee z \dagger \times s ) } \end{array}
$$

![](images/1252821d556459d80425af8df52a96cb2836c6703b1b72ace09d9ae9d47e119d.jpg)

![](images/2f06714cca8018d80b96eb926f34598ac545d713168dd7d9b837aea9abf2b0ad.jpg)

¡Observar el parámetro adicional de f!

# Recursión Primitiva (Listas)

El problema es que, además de la recursión sobre la cola, ¡utilizan la misma cola de la lista!

Solución

$$
\begin{array} { r l } & { \mathsf { r e c r } \cdots \mathsf { b } \to ( \mathsf { a } \to \mathsf { \left[ a \right] } \to \mathsf { b } \to \mathsf { b } ) \to \mathsf { \left[ a \right] } \mathsf { - } \mathsf { \hat { \mathscr { s } } } } \\ & { \mathsf { r e c r } \mathsf { z } \textsf { f } \prod \qquad = \mathsf { z } } \\ & { \mathsf { r e c r } \mathsf { z } \textsf { f } ( \mathsf { x } ; \mathsf { x } \mathsf { s } ) = \mathsf { f } \mathsf { x } \times \mathsf { s } ( \mathsf { r e c r } \textsf { z } \textsf { f } \times \mathsf { s } ) } \end{array}
$$

Entonces

tail = recr (error “Lista vacía”) (\_ xs _ -> xs) insert x = recr [x] (\y ys zs -> if x<y then (x:y:ys) else (y:zs))

# Recursión Primitiva (Listas)

Otras funciones que se pueden definir con recr.

init :: [a] -> [a] init = recr …

![](images/55d3a223ae5be4615fe78af54f1cd3646d4f4ed4b0ebbd3c7fe88ecfa28b617c.jpg)

maximum :: [a] -> a maximum = recr ...

# Recursión Primitiva (Listas)

Otras funciones que se pueden definir con recr.

init :: [a] -> [a]   
init = recr (error “No definida”) (\x xs rs -> if null xs then [] else x:rs)   
maximum :: [a] -> a   
maximum = recr (error “No definida”) (\x xs m -> if null xs then x else max x m)

# Recursión Primitiva (Nats)

Recursión primitiva sobre naturales

recNat :: b -> (Nat -> b -> b) -> Nat -> b recNat z f 0 = z recNat z f n = f (n-1) (recNat z f (n-1))

Ejemplos (no definibles como foldNat)

![](images/19f5c8cdda1bf74c90e7a7fb3bb519730e6fdf991c12c84e2c56db284f10b37d.jpg)

$\begin{array} { c } { { \mathrm { f a c t } = \mathrm { r e c N a t 1 } ( \mathrm { i n ~ p } \to ( \mathsf { n } + 1 ) ^ { \star } \mathsf { p } ) } } \\ { { \ldots \mathrm { f a c t } \mathsf { n } = \prod _ { i = 1 } ^ { \mathsf { n } } \mathrm { i } } } \end{array}$ sumatoria f = recNat 0 (\x y -> f (x+1) + y) -- sumatoria f $n = \sum \limits _ { i = 1 } ^ { n } f _ { i }$

# Otros esquemas de listas

En el caso de maximum o minimum, podemos identificar otro esquema:

el de fold de listas no vacías (foldr1) maximum, minimum :: [a] -> a maximum = foldr1 (\x m -> max x m) minimum = foldr1 min

![](images/c2535f67b66eac06e2688a06f9b427dc5dc90d39b060b5f7d7f38adaf4870e31.jpg)

foldr1 :: (a->a->a) -> [a] -> a foldr1 f (x:xs) = foldr f x xs “We claim that advanced data structures and algorithms can be better taught at the functional paradigm than at the imperative one.”

![](images/b6399f74f92cc8bc5ee96b870f1c67aa4821c9ae34dc5f6775c014b5c2a0fe09.jpg)

"A Second Year Course on Data Structures Based on Functional Programming" M. Núñez, P. Palao y R. Peña Functional Programming Languages in Education, LNCS 1022

# Definición de Tipos 1

Para definir un tipo de datos podemos:

establecer qué forma tendrá cada elemento, y

dar un mecanismo único para inspeccionar cada elemento

entonces: TIPO ALGEBRAICO ó

determinar cuáles serán las operaciones que manipularán los elementos, SIN decir cuál será la forma exacta de éstos o aquéllas

entonces: TIPO ABSTRACTO

# Tipos Algebraicos

¿Cómo damos en Haskell la forma de un elemento de un tipo algebraico?

Mediante constantes llamadas constructores

nombres con mayúsculas

![](images/5a004f6e77d479a3c362f70bf07d89080684d92c5295add8b3b2e642a439a79d.jpg)

no tienen asociada una regla de reducción

pueden tener argumentos

Ejemplos:

False :: Bool

True :: Bool

# Tipos Algebraicos

La cláusula data

P introduce un nuevo tipo algebraico introduce los nombres de los constructores define los tipos de los argumentos de los constructores

Ejemplos:   
data Sensacion = Frio | Calor   
data Shape = Circle Float | Rect Float Float

![](images/adc6598210a00f5579b8a831bd76f74f62c526e3a985810ce99f6756a208806e.jpg)

![](images/ef89b14982eac833ebf0171cd8d8b02206030f230858600ac9413885c3eec53a.jpg)

# Tipos Algebraicos

data Shape = Circle Float | Rect Float Float Ejemplos de elementos:

c1 = Circle 1.0 c2 = Circle (4.0-3.0) r1 = Rect 2.5 3.0

![](images/d9a5c8d30b84a0d020ab4f164403d8e4ebdfeed44977f5e12ce41fb7f15e34c6.jpg)

Ejemplos de funciones que arman Shapes:

circuloPositivo x = Circle (abs x) cuadrado x = Rect x x

# Tipos Algebraicos

data Shape = Circle Float | Rect Float Float

Ejemplo de alto orden:

construyeShNormal :: (Float -> Shape) -> Shape construyeShNormal c = c 1.0

Uso de funciones de alto orden:

c3 = construyeShNormal circuloPositivo c4 = construyeShNormal cuadrado c5 = construyeShNormal (Rect 2.0)

¿Cuál es el tipo de Circle? ¿Y el de Rect?

# Pattern Matching

¿Cuál es el mecanismo único de acceso?

Pattern matching (correspondencia de patrones (?))

Pattern: expresión especial

sólo con constructores y variables sin repetir argumento en el lado izquierdo de una ecuación

Matching: operación asociada a un pattern

inspecciona el valor de una expresión

puede fallar o tener éxito

si tiene éxito, liga las variables del pattern

# Pattern Matching

Ejemplos:

area :: Shape -> Float area (Circle radio) = pi \* radio^2 area (Rect base altura) = base \* altura

isCircle :: Shape -> Bool   
--isCircle1 (Circle radio) = True   
--isCircle1 (Rectangle base altura) = False   
isCircle (Circle _) = True   
isCircle _ = False

# Pattern Matching

Uso de pattern matching:

Al evaluar (area (circuloPositivo (-3.0)))

+ se reduce (circuloPositivo (-3.0)) a (Circle 3.0)

luego se verifica cada ecuación, para hacer el matching

si lo hace, la variable toma el valor correspondiente

radio se liga a 3.0, y la expresión retorna 28.2743

¿Cuánto valdrá (area (cuadrado 2.5))?

¿Y (area c2)?

# Tuplas

Son tipos algebraicos con sintaxis especial

fst :: (a,b) -> a   
fst $( \mathsf { x } , \mathsf { y } ) = \mathsf { x }$   
snd :: (a,b) -> b   
snd $( \mathsf { x } , \mathsf { y } ) = \mathsf { y }$   
distance :: (Float, Float) -> Float   
distance $\mathsf { X } \mathsf { y } ^ { \mathrm { ~ } } = \mathsf { s q }$ rt $( \mathsf { x } ^ { \wedge } 2 + \mathsf { y } ^ { \wedge } 2 )$

¿Cómo definir distance sin usar pattern matching? distance p = sqrt ((fst p)^2 + (snd p)^2)

# Tipos Algebraicos

Pueden tener argumentos de tipo

Ejemplo: data Maybe a = Nothing | Just a

¿Qué elementos tiene (Maybe Bool)? ¿Y (Maybe Int)?

En general:

![](images/cf8321851f428939b92a68f03d903e454dfbef9a3ce9c1eba3896cea5986b69d.jpg)

→ tiene los mismos elementos que el tipo a (pero con Just adelante) más uno adicional (Nothing)

# Tipos Algebraicos

¿Para qué se usa el tipo Maybe?

Ejemplo: buscar :: clave -> [(clave,valor)] -> valor buscar k [] = error ''La clave no se encontró'' -- Única elección posible con polimorfismo! buscar k $( ( k ^ { \prime } , \vee ) ; k \vee \mathbb { S } ) = \mathsf { i f ~ } k = = k ^ { \prime }$ then v else buscar k kvs   
¿La función buscar es total o parcial?

# Tipos Algebraicos

¿Para qué se usa el tipo Maybe?

Ejemplo:

lookup :: clave -> [(clave,valor)] -> Maybe valor lookup k [] = Nothing lookup k ((k',v):kvs) = if k==k' then Just v else lookup k kvs ¿La función lookup es total o parcial?

# Tipos Algebraicos

El tipo Maybe

permite expresar la posibilidad de que el resultado sea erróneo, sin necesidad de usar 'casos especiales'

evita el uso de  hasta que el programador decida, permitiendo controlar los errores

sueldo :: Nombre -> [Empleado] -> Int sueldo nombre empleados

= analizar (lookup nombre empleados) analizar Nothing = error ''No es de la empresa!'' analizar (Just s) = s

# Tipos Algebraicos

El tipo Maybe (cont.)

evita el uso de  hasta que el programador decida, permitiendo controlar los errores

sueldoGUI :: Nombre -> [Empleado] -> GUI Int   
sueldoGUI nombre empleados = case (lookup nombre empleados) of Nothing -> ventanaError ''No es de la empresa!' Just s -> mostrarInt “El sueldo es ” s

# Tipos Algebraicos

Otro ejemplo:

data Either a b = Left a | Right b

¿Qué elementos tiene (Either Int Bool)?

En general:

representa la unión disjunta de dos conjuntos (los elementos de uno se identifican con Left y los del otro con Right)

# Tipos Algebraicos

¿Para qué sirve Either?

Para mantener el tipado fuerte y poder devolver elementos de distintos tipos

Ejemplo: [Left 1, Right True] :: [Either Int Bool]

Para representar el origen de un valor

Ejemplo: lectora de temperaturas

data Temperatura = Celsius Int | Fahrenheit Int

convertir :: Either Int Int -> Temperatura

convertir (Left t) = Celsius t

convertir (Right t) = Fahrenheit t

# Tipos Algebraicos

¿Por qué se llaman tipos algebraicos?

Por sus características:

toda combinación válida de constructores y valores es elemento de un tipo algebraico (y sólo ellas lo son)

dos elementos de un tipo algebraico son iguales si y sólo si están construídos utilizando los mismos constructores aplicados a los mismos valores

# Tipos Algebraicos

Expresividad: números complejos

Toda combinación de dos flotantes es un complejo

Dos complejos son iguales si tienen las mismas partes real e imaginaria

data Complex = C Float Float

realPart, imagePart :: Complex -> Float   
realPart $( \boldsymbol { C } r \boldsymbol { \mathsf { i } } ) = \boldsymbol { r }$   
imagePart $( \mathrm { ~ \bf ~ \underline { ~ } { ~ r ~ i ~ } ~ } | ) = |$

mkPolar :: Float -> Float -> Complex mkPolar r theta = C (r \* cos theta) (r \* sin theta)

# Tipos Algebraicos

Expresividad: números racionales ? No todo par de enteros es un número racional (R 1 0)

Hay racionales iguales con distinto numerador y denominador $\left( \begin{array} { r l } { 4 2 = { } } & { 2 1 } \end{array} \right)$

data NoRacional = R Int Int   
numerador, denominador :: NoRacional -> Int   
numerador (R n d) = n   
denominador (R n d) = d

¡No se puede representar a los racionales como tipo algebraico!

# Tipos Algebraicos

Expresividad: ejemplos

Se pueden armar tipos ad-hoc, combinando las ideas

data Helado = Vasito Gusto

Cucurucho Gusto Gusto (Maybe Baño) | Capelina Gusto Gusto [Agregado] | Pote Gusto Gusto Gusto

data Gusto = Chocolate | …

data Agregado $\underline { { \underline { { \mathbf { \delta \pi } } } } }$ Almendras | Rocklets

Así se pueden expresar elementos de dominios específicos

# Tipos Algebraicos

Expresividad: ejemplos

Se pueden armar funciones por pattern matching precio :: Helado -> Float precio $\mathsf { h } = \mathsf { c o s t o } \mathsf { h } \star 0 . 3 + 5$

costo :: Helado -> Float   
costo $\begin{array} { r l r } { ( } & { { } } & { \mathrm { g } ) = 1 + \cos \mathrm { t o G u s t o ~ g } } \end{array}$   
costo (Cucurucho g1 g2 mb) = 2 + costoGusto g1 + costoGusto g2 + costoBaño mb

# Tipos Algebraicos

Expresividad: ejemplos + Se pueden armar funciones por pattern matching (cont.)

costoGusto :: Gusto -> Float costoGusto Chocolate = 2

costoBaño :: Maybe Baño - > Float costoBaño Nothing = 0 costoBaño (Just Negro) = 2 costoBaño (Just Blanco) = 1

# Tipos Algebraicos

Podemos clasificarlos en:

Enumerativos (Sensacion, Bool) Sólo constructores sin argumentos

Productos (Complex, Tuplas)

→ Un único constructor con varios argumentos

Sumas (Shape, Maybe, Either)

\$ Varios constructores con argumentos

Recursivos (Listas)

Utilizan el tipo definido como argumento

# Tipos de Datos Recursivos

Un tipo algebraico recursivo

tiene al menos uno de los constructores con el tipo que se define como argumento

es la concreción en Haskell de un conjunto definido inductivamente

Ejemplos: data $N = 1 N$ data BE = TT | FF | AA BE BE | NN BE

¿Qué elementos tienen estos tipos?

![](images/e36a2cee02cdcf470cffb8cf9cd96455d7a17db3724e559ba2edf1c9467c54a6.jpg)

# Tipos de Datos Recursivos

Cada constructor define un caso de una definición inductiva de un conjunto.

Si tiene al tipo definido como argumento, es un caso inductivo, si no, es un caso base.

El pattern matching

![](images/b1296b489998ce5d9af0176c9bbb0ee0af485cd8e1ae8d21cd239c44a677a9b4.jpg)

provee análisis de casos

permite acceder a los elementos inductivos que forman a un elemento dado

Por ello, se pueden definir funciones recursivas

# Tipos de Datos Recursivos

Ejemplo: data N = Z | S N

Asignación de significado

evalN :: N -> Int evalN Z evalN (S x) = . evalN x

¡Usamos recursión estructural!

![](images/1145b311c49146487085993ef950e381e99c7bdca519aa9c4857e0f30928cf6f.jpg)

# Tipos de Datos Recursivos

Ejemplo: data N = Z | S N (cont.)

Asignación de significado

evalN :: N -> Int  
evalN Z = 0  
evalN $( \mathsf { S } \mathsf { x } ) = 1 + \mathsf { e v a l N } \mathsf { x }$

El tipo N es notación unaria para expresar números enteros (Int)

# Tipos de Datos Recursivos

Ejemplo: data N = Z | S N (cont.)

Manipulación simbólica   
$\mathrm { a d d N } \mathrel { \mathop { : } { \sim } } \mathsf { N } \mathrel { \mathop { - } { > } } \mathsf { N } \mathrel { \mathop { - } { > } } \mathsf { N }$   
addN Z m =   
addN (S n) m = ... (addN n m) ..

Otra vez usamos recursión estructural

![](images/3f431c32f3cdd012190b66afb5adaa72424d55d338bce0c3f1e2b0b7379c30af.jpg)

# Tipos de Datos Recursivos

Ejemplo: data N = Z | S N (cont.)

Manipulación simbólica $\mathrm { a d d N } \mathrel { \mathop { : } { \sim } } \mathsf { N } \mathrel { \mathop { - } { > } } \mathsf { N } \mathrel { \mathop { - } { > } } \mathsf { N }$ addN Z m = m addN (S n) m = S (addN n m)

![](images/745206a3442f98ca7e4ca8e238500e9806f23c937f9fe41fe31660d9e1f9c9aa.jpg)

No hay significado en sí mismo en esta manipulación

# Tipos de Datos Recursivos

Ejemplo: data N = Z | S N (cont.)

Coherencia de significación con manipulación ¿Puede probarse la siguiente propiedad? Sean n,m::N finitos, cualesquiera; entonces evalN (addN n m) = evalN n + evalN m

¿Cómo? ...

La propiedad captura el vínculo entre el significado y la manipulación simbólica

# Tipos de Datos Recursivos

Por inducción estructural (pues el tipo representa a un conjunto inductivo)

Demostración: por inducción en la estructura de n

Caso base: n = Z

Usar addN.1, 0 neutro de (+) y evalN.1

Caso inductivo: n = S n'

HI: size (addN n' m) = size n' + size m

Usar addN.2, evalN.2, HI, asociatividad de $( + )$ , y evalN.2

# Tipos de Datos Recursivos

Ejemplo: data N = Z | S N (cont.)

Más manipulación simbólica

prodN :: N -> N -> N   
prodN Z m = Z   
prodN (S n) m = addN (prodN n m) m

![](images/3cec2babd419e201603c1dc1cb4de33a1c467ca88ce88aa8c4da54f83566e449.jpg)

¿Puede probar la siguiente propiedad? Sean n,m::N finitos, cualesquiera; entonces

evalN (prodN n m) = evalN n \* evalN m

![](images/ec6240b8098f91ef850e5f79af783887ee9e1dd309aa7d4ed072dd1a748f3da4.jpg)

# Listas

Una definición equivalente a la de listas data List a = Nil | Cons a (List a)

La sintaxis de listas es equivalente a la de esta definición:

[ ] es equivalente a Nil

→ (x:xs) es equivalente a (Cons x xs)

Sin embargo, (List a) y [a] son tipos distintos

# Listas

![](images/a4985164fd517d24c87d03dae5e4b18fad86f8d62e79c6a56f29fadd263f5c69.jpg)

Considerar las definiciones

sum :: [Int] -> Int -- Significado sum [ ] = 0 sum (n:ns) = n + sum ns

![](images/bd51876dd3f4bbc4c3316ebfe654271088e70bc5b4190c6b09e4c6444dbfc09c.jpg)

(++) :: [a] -> [a] -> [a] -- Manipulación simbólica   
[ ] ++ ys = ys   
(x:xs) ++ ys = x : (xs ++ ys)

Coherencia entre significado y manipulación: Demostrar que para todas xs, ys listas finitas vale que: sum (xs ++ ys) = sum xs + sum ys

# Árboles

Un árbol es un tipo algebraico tal que al menos un elemento compuesto tiene dos componentes inductivas

Se pueden usar TODAS las técnicas vistas para tipos algebraicos y recursivos

Ejemplo: data Arbol a = Hoja a | Nodo a (Arbol a) (Arbol a)

¿Qué elementos tiene el tipo (Arbol Int)?

# Árboles

Si representamos elementos de tipo Arbol Int mediante diagramas jerárquicos

aej = Nodo 1 (Hoja 0) (Nodo 3 (Hoja 2) (Hoja 0))

![](images/973bc0d7d933507ff60450795e22d7b3ecd50d2b4ae0c5d39ee15e10b604402c.jpg)

# Árboles

¿Cuántas hojas tiene un (Arbol a)? hojas :: Arbol a -> Int hojas (Hoja x) = hojas (Nodo x t1 t2) = ... hojas t1 ... hojas t2 ..

¿Y cuál es la altura de un (Arbol a)? altura :: Arbol a -> Int altura (Hoja x) = altura (Nodo x t1 t2) = ... altura t1 ... altura t2

Observar el uso de recursión estructural

# Árboles

![](images/0b96cfde8e741e5a36bdd2edd1797059a14501b11ad1a09642b56c76910176d3.jpg)

¿Cuántas hojas tiene un (Arbol a)?

hojas :: Arbol a -> Int   
hojas (Hoja x) = 1   
hojas (Nodo x t1 t2) = hojas t1 + hojas t2

¿Y cuál es la altura de un (Arbol a)?

altura :: Arbol a -> Int   
altura (Hoja x) = 0   
altura (Nodo x t1 t2) = 1+ (altura t1 \`max\` altura t2)

¿Puede mostrar que para todo árbol finito a, hojas a  2^(altura a)? ¿Cómo?

# Árboles

![](images/4949c99fa03fc353eeff6a76bb62dcdb4d0fdf385fc94c75eaa2c59cbdf221aa.jpg)

¿Cómo reemplazamos una hoja?

Ej: Cambiar los 2 en las hojas por 3. cambiar2 :: Arbol Int -> Arbol Int cambiar2 (Hoja n) =

cambiar2 (Nodo n t1 t2) = (cambiar2 t1) … (cambiar2 t2)

¡Más recursión estructural!

# Árboles

¿Cómo reemplazamos una hoja?

Ej: Cambiar los 2 en las hojas por 3. cambiar2 :: Arbol Int -> Arbol Int cambiar2 (Hoja n) = if n==2 then Hoja 3 else Hoja n cambiar2 (Nodo n t1 t2) = Nodo n (cambiar2 t1) (cambiar2 ¿Cómo trabaja cambiar2? Reducir (cambiar2 aej)

# Árboles

![](images/0ac43fefe6e42fa7b6a1d397afbdd498175487be59a0cfd948bb911e2a7d7e8d.jpg)

Más funciones sobre árboles duplA :: Arbol Int -> Arbol Int duplA (Hoja n) = ... n . duplA (Nodo n t1 t2) = n ... (duplA t1) ... (duplA t2) sumA :: Arbol Int -> Int sumA (Hoja n) = ... n . sumA (Nodo n t1 t2) = . n ... sumA t1 ... sumA t2 ...

¡Recursión estructural!

![](images/dab9dccddaae9470ea3c279df6926460a9c7233e01c4c22d29d5a4eece8ad618.jpg)

# Árboles

Más funciones sobre árboles

duplA :: Arbol Int -> Arbol Int

Nodo $( n ^ { \star } 2 )$ (duplA t1) (duplA t2)

sumA :: Arbol Int -> Int   
sumA (Hoja n) = n   
sumA (Nodo n t1 t2) = n + sumA t1 + sumA t2

¿Cómo evalúa la expresión (duplA aej)?

¿Y (sumA aej)?

# Árboles

Recorridos de árboles

Transformación de un árbol en una lista (estructura no lineal a estructura lineal)

inOrder, preOrder :: Arbol a -> [ a ]   
inOrder (Hoja n) = ... n .   
inOrder (Nodo n t1 t2) = inOrder t1 ... n … inOrder t2

preOrder (Hoja n) = . n preOrder (Nodo n t1 t2) = … n … preOrder t1 ... preOrder t2 ¿Cómo sería posOrder?

# Árboles

Recorridos de árboles

Transformación de un árbol en una lista (estructura no lineal a estructura lineal)

inOrder, preOrder :: Arbol a -> [ a ]   
inOrder (Hoja n) = [ n ]   
inOrder (Nodo n t1 t2) = inOrder t1 ++ [ n ] ++ inOrder t2   
preOrder (Hoja n) = [ n ]   
preOrder (Nodo n t1 t2) = n : (preOrder t1 ++ preOrder t2)

¿Cómo sería posOrder?

# Expresiones Aritméticas

Definimos expresiones aritméticas constantes numéricas sumas y productos de otras expresiones data ExpA = Cte Int | Suma ExpA ExpA | Mult ExpA ExpA

![](images/46acf156b9a17821dc49ccd7602754899bdbb4adc88c6bda22a99800b3565fc9.jpg)

Ejemplos:

2 se representa (Cte 2)   
(4\*4) se representa (Mult (Cte 4) (Cte 4))   
$\Rightarrow ( ( 2 ^ { \star } 3 ) ^ { + } 4 )$ se representa Suma (Mult (Cte 2) (Cte 3)) (Cte 4)

![](images/63a94a0588f4270b34b675bb98587d4f5c5586cd55c01daf8cc9449d6c12885f.jpg)

# Expresiones Aritméticas

Definimos expresiones aritméticas

alternativa más simbólica... data ExpS = CteS N | SumaS ExpS ExpS MultS ExpS ExpS

Ejemplos:

2 se representa (CteS (S (S Z)))

comparar con $\left( \mathsf { C t e 2 } \right)$ , donde Int representa números como semántica y no como símbolos (como lo hace N)

# Expresiones Aritméticas

¿Cómo dar el significado de una ExpA?

evalEA :: ExpA -> Int   
evalEA (Cte n)   
evalEA (Suma e1 e2) = evalEA e1 ... evalEA e2 evalEA (Mult e1 e2) = evalEA e1 ... evalEA e2

→ Observar el uso de recursión estructural

# Expresiones Aritméticas

¿Cómo dar el significado de una ExpA?

evalEA :: ExpA -> Int   
evalEA (Cte n) = n   
evalEA (Sum e1 e2) = evalEA e1 + evalEA e2 evalEA (Mult e1 e2) = evalEA e1 \* evalEA e2

Reduzca:

evalEA (Suma (Mult (Cte 2) (Cte 3)) (Cte 4)) evalEA (Mult (Cte 2) (Suma (Cte 3) (Cte 4)))

# Expresiones Aritméticas

Comparar con la versión más simbólica

evalES :: ExpS -> Int   
evalES (CteS n) evalN n   
evalES (SumaS e1 e2) = evalES e1 + evalES e2 evalES (MultS e1 e2) = evalES e1 \* evalES e2

Se observa el uso de la función de asignación semántica (evalN) a los números representados como N (símbolos)

# Expresiones Aritméticas

¿Cómo simplificar una ExpA? Manipulación simbólica

simplEA :: ExpA -> ExpA   
simplEA (Cte n) = .   
simplEA (Suma e1 e2) = ... (simplEA e1) (simplEA e2) ...   
simplEA (Mult e1 e2) = ... (simplEA e1) (simplEA e2)

Observar otra vez el uso de recursión estructural

# Expresiones Aritméticas

¿Cómo simplificar una ExpA? Manipulación simbólica

simplEA :: ExpA -> ExpA   
simplEA (Cte n) = Cte n   
simplEA (Suma e1 e2) = armarSuma (simplEA e1) (simplEA e2)   
simplEA (Mult e1 e2) = Mult (simplEA e1) (simplEA e2)

armarSuma (Cte 0) e = e armarSuma e (Cte 0) = e armarSuma e1 e2 = Sum e1 e2

# Expresiones Aritméticas

¿La manipulación es correcta?

Coherencia entre significado y manipulación simbólica

Expresado mediante la siguiente propiedad

![](images/4066059b342bd35da4603e8b99168b4d183ffae99bfeda54390848418d4aca05.jpg)

para todo e se cumple que

evalEA (simplEA e) = evalEA e

# Expresiones con variables

¿Cómo agregar variables a las expresiones?

Nuevo constructor type Variable = String data NExp = Vble Variable

NCte Int   
Add NExp NExp | Sub NExp NExp Mul NExp NExp   
Div NExp NExp | Mod NExp NExp

Además agregamos nuevas operaciones

# Expresiones con variables

¿Y para asignarles significado?

Necesitamos conocer el valor de las variables evalNExp :: NExp -> (Memoria -> Int)

¡El significado es una función!

Observar el uso del alto orden y la currificación

¿Qué es la memoria?

# Expresiones con variables

Tipo abstracto para representar la memoria data Memoria -- Tipo abstracto de datos enBlanco :: Memoria -- Una memoria vacía, que no recuerda nada cuantoVale :: Memoria -> Variable -> Maybe Int -- Retorna el valor recordado para la variable dada recordar :: Memoria -> Variable -> Int -> Memoria -- Recuerda un valor paraa una variable variables :: Memoria -> [ Variable ] -- Retorna las variables que recuerda

# Expresiones con variables

Semántica de expresiones con variables evalN :: NExp -> (Memoria -> Int) evalN (Vble x) mem = mem … x ...

evalN (NCte n) mem = ... n ...   
evalN (Add e1 e2) mem = evalN e1 mem … evalN e2 mem

Observar

que las variables complican la semántica el uso de la currificación para pasar la memoria

![](images/22876a7a7fe967548cd51f04f22d27f634d2105fb692d018040c46fef6f1f26a.jpg)

# Expresiones con variables

Semántica de expresiones con variables   
evalN :: NExp -> (Memoria -> Int)   
evalN (Vble x) mem = case (cuantoVale mem x) of Nothing -> error ("variable "++x++" indefinida") Just v -> v   
evalN (NCte n) mem = n   
evalN (Add e1 e2) mem = evalN e1 mem + evalN e2 m ■

Observar

Lo mejor es fallar si la variable está indefinida Algunos lenguajes dan otras cosas (0, o “basura”)

# Definición de LIS

Definimos un Lenguaje Imperativo Simple

asignación de expresiones numéricas sentencias if y while sobre expresiones booleanas secuencia de sentencias

Ejemplo:

a := n; facn := 1   
while $( \mathsf { a } > 0 )$ { facn := a \* facn; a := a – 1 }

¡Solo sintaxis!

# Definición de LIS (cont.)

Definimos tipos algebraicos para representar un programa LIS

data Program = P Bloque   
type Bloque = [Comando]   
data Comando = Skip Assign Variable NExp | If BExp Bloque Bloque | While BExp Bloque

![](images/68b0f8405bb170319c15db89dfa56c87af8bf9335fbd220d5bc0862cd359690c.jpg)

# Definición de LIS (cont.)

Definimos tipos algebraicos para representar un programa LIS

Los constructores carecen de significado

Una definición “equivalente” sería

![](images/974980ef2ee05f09e3c4b2e0ab6332034afa6757909308c03475529afa332e96.jpg)

data $\mathsf { A } = \mathsf { \Gamma } \mathsf { C }$ type ${ \mathsf C } = [ { \mathsf D } ]$ data D = E

| F Variable NExp | G BExp C C | H BExp C

# Definición de LIS (cont.)

Usamos las NExp anteriores, y agregamos expresiones booleanas

data BExp = BCte Bool | Not BExp | And BExp BExp | Or BExp BExp | RelOp ROp NExp NExp

data ROp = Equal | NotEqual | Greater | Lower GreaterEqual | LowerEqual

# Definición de LIS (cont.)

Usamos las NExp anteriores, y agregamos expresiones booleanas

Continuando con la definición “equivalente”

data BExp = I Bool | J BExp | K BExp BExp | L BExp BExp | M ROp NExp NExp

data ROp = N | O | P | Q S R

![](images/98db90dc2ad6c42bdd05fc65a1993053133f046e8e4ca913a89e3bc3ddd60c88.jpg)

# Definición de LIS

¿Cómo queda el programa de ejemplo?

a := n; facn := 1   
while $( a > 0 )$ { facn := a \* facn; a := a – 1 }

se expresa como

P [ Assign “a” (Vble “n”) , Assign “facn” (NCte 1) While (RelOp Greater (Vble “a”) (NCte 0)) [ Assign “facn” (Mul (Vble “a”) (Vble “facn”)) Assign “a” (Sub (Vble “a”) (NCte 1))

# Definición de LIS

¿Cómo queda el programa de ejemplo?

a := n; facn := 1   
while $\cdot$ { facn := a \* facn; a := a – 1 }

se expresa “equivalentemente” como

B [ F “a” (Vble “n”) F “facn” (NCte 1) , H (M P (Vble “a”) (NCte 0)) [ F “facn” (Mul (Vble “a”) (Vble “facn”)) F “a” (Sub (Vble “a”) (NCte 1))

# Evaluador de LIS (cont.)

Semántica de expresiones booleanas

evalB :: BExp -> (Memoria -> Bool)   
evalB (BCte b) mem = .   
evalB (RelOp rop e1 e2) mem = ... rop ... (evalN e1 mem) ... (evalN e2 mem) ...   
evalB (And e1 e2) mem = ... evalB e1 mem ... evalB e2 mem ...   
■

¿Por qué hace falta la memoria para dar significado a una expresión booleana?

# Evaluador de LIS (cont.)

Semántica de expresiones booleanas

evalB :: BExp -> (Memoria -> Bool)   
evalB (BCte b) mem = b   
evalB (RelOp rop e1 e2) mem = evalROp rop (evalN e1 mem) (evalN e2 mem)   
evalB (And e1 e2) mem = evalB e1 mem && evalB e2 mem

Nuevamente, observar el uso de currificación ¿Y la función auxiliar evalROp?

# Evaluador de LIS (cont.)

Semántica de expresiones booleanas (cont.)

evalROp :: ROp -> (Int -> Int -> Bool) evalROp Equal = (==) evalROp NotEqual (!=) evalROp Greater (>)

¡Observar que el significado se define directamente como una función!

# Evaluador de LIS (cont.)

Semántica de programas LIS evalP :: Program $_ - >$ (Memoria -> Memoria) evalP (P bloque) = evalBloque bloque

evalBloque [ ] = \mem $_ - >$ mem   
evalBloque (c:cs) = \mem -> let mem' = evalCom c mem in evalP cs mem'

![](images/dc9fd419e2a2f1020cff6775e347670dc45ae45eba7ad4f4fbe2c574b4416178.jpg)

¡¡El significado es una función!!

¡Observar cómo la secuencia de comandos ALTERA la memoria antes de proseguir!

# Evaluador de LIS (cont.)

Semántica de sentencias LIS   
evalCom :: Comando -> (Memoria -> Memori   
evalCom Skip =   
evalCom (Assign x ne) = ... (evalN ne mem)   
evalCom (If be bl1 bl2) = ... (evalB be mem) (evalBloque bl1 mem) ... (evalBloque bl2 mem)   
evalCom (While be p) = ...??

# Evaluador de LIS (cont.)

Semántica de sentencias LIS

evalCom :: Comando $\scriptscriptstyle - >$ (Memoria -> Memoria)

evalCom Skip = \mem $\scriptscriptstyle - >$ mem

evalCom (Assign x ne) 二 \mem -> recordar mem x (evalN ne mem)

= evalCom (If be (p ++ [While be p]) [Skip])

# Manipulacion simbólica

¿Qué pasa con programas como éste?

p :: Program   
p = P [ Assign “x” (Add (NCte 10) (NCte 7)) , Assign “y” (Add (Sub (NCte 59) (Var “x”)) (Sub (NCte 2) (NCte 2)) ]

¿Se podría hacer más eficiente ANTES de ejecutarlo?

? Constant folding, simplification p = P [ Assign “x” (NCte 17)) , Assign “y” (Sub (NCte 59) (Var “x”)) ]

# Manipulación simbólica (cont.)

Expresiones sin variables groundNExp :: NExp -> Bool

Simplificación y evaluación simplifyNExp :: NExp -> NExp evalGroundNExp :: NExp -> Int PRECOND: el argumento es ground ¡simplify debería usar evalGroundNExp!

![](images/1ddac06d91761ef4151147538f1fda02543d74e730efe72de5dc332fcafc5c78.jpg)

Análisis simbólico del programa optimize :: Program -> Program

# Manipulación simbólica (cont.)

Expresiones sin variables groundNExp :: NExp -> Bool groundNExp ...

![](images/2f209c86c4f549e56de62d514fafd338df9c5ea5213d208e12284479426282f4.jpg)

# Manipulación simbólica (cont.)

Simplificación y evaluación simplifyNExp :: NExp -> NExp simplifyNExp … -- OBS: usa evalGroundNExp evalGroundNExp :: NExp -> Int -- PRECOND: el argumento es ground evalGroundNExp

![](images/d0c296f1b883a2ace3cef1b7fd95c9867cefdf168b3f96aa05a4ca552064129a.jpg)

# Manipulación simbólica (cont.)

Análisis simbólico del programa optimize :: Program -> Program optimize ...

![](images/43a0c9541b2c558f4add11e5403074c3c306568a7cd2ace3333136fe164d560c.jpg)

“'Todo es pasajero. La verdad depende del momento. Baje los ojos. Incline la cabeza. Cuente hasta diez. Descubrirá otra verdad.'

(Consejero, 74:96:3)”

El Fondo del Pozo Eduardo Abel Giménez

# Esquemas en árboles

Esquema de map en árboles:

data Arbol a = Hoja a | Nodo a (Arbol a) (Arbol a)

mapArbol :: (a -> b) -> Arbol a -> Arbol b mapArbol f (Hoja x) = Hoja (f x) mapArbol f (Nodo x t1 t2)

Nodo (f x) (mapArbol f t1) (mapArbol f t2)

¿Cómo definiría la función que multiplica por 2 cada elemento de un árbol? ¿Y la que los eleva al cuadrado?

# Esquemas en árboles

Solución:

dupArbol :: Arbol Int -> Arbol Int dupArbol = mapArbol $( ^ { \star } 2 )$

cuadArbol :: Arbol Int -> Arbol Int cuadArbol = mapArbol (^2)

¿Podría definir, usando mapArbol, una función que aplique dos veces una función dada a cada elemento de un árbol? ¿Cómo?

![](images/2effd739959722efda9f312bc2b9d25ed7f1d374610a983186089d43cf73ff88.jpg)

# Esquemas en árboles

La función foldr expresa el patrón de recursión estructural sobre listas como función de alto orden

Todo tipo algebraico recursivo tiene asociado un patrón de recursión estructural

¿Existirá una forma de expresar cada uno de esos patrones como una función de alto orden?

¡Sí, pero los argumentos dependen de los casos de la definición!

# Esquemas en árboles

Ejemplo:

foldArbol :: (a->b) -> (a->b->b->b) -> Arbol a -> b   
foldArbol f g (Hoja x) = f x   
foldArbol f g (Nodo x t1 t2) =

g x (foldArbol f g t1) (foldArbol f g t2)

¿Cuál es el tipo de los constructores? Hoja :: a -> Arbol a Nodo :: a -> Arbol a -> Arbol a -> Arbol a

¿Qué similitudes observa con el tipo de foldArbol?

# Esquemas en árboles

Defina una función que sume todos los elementos de un árbol

sumArbol :: Arbol Int -> Int sumArbol = foldArbol id (\n n1 n2 -> n1 + n + n2)

¿Podría identificar las llamadas recursivas?

¿Y si expandimos la definición de foldArbol?

sumArbol (Hoja x) = id x sumArbol (Nodo x t1 t2) =

sumArbol t1 + x + sumArbol t2

# Esquemas en árboles

Defina, usando foldArbol una función que:

→ cuente el número de elementos de un árbol sizeArbol = foldArbol (\x->1) (\x s1 s2 -> 1+s1+s2)

cuente el número de hojas de un árbol hojas = foldArbol (const 1) (\x h1 h2 -> h1+h2)

→ calcule la altura de un árbol altura = foldArbol (\x->0) (\x a1 a2 -> 1 + max a1 a2)

¿Puede identificar los llamados recursivos?

¿Por qué el primer argumento es una función?

# Esquemas en ExpA

Recordando que data ExpA = Cte Int | Sum ExpA ExpA | Mult ExpA ExpA ¿Cómo sería la función que representa la recursión estructural sobre ExpA?

foldExpA :: (Int->b) -> (b->b->b) -> (b->b->b) -> ExpA -> b   
foldExpA fc fs fm (Cte n) = fc n   
foldExpA fc fs fm (Sum e1 e2) = fs (foldExpA fc fs fm e1) (foldExpA fc fs fm e2)   
foldExpA fc fs fm (Mult e1 e2) = fm (foldExpA fc fs fm e1) (foldExpA fc fs fm e2)

# Esquemas en ExpA

¿Por qué tiene 3 parámetros?

¿Por qué esos parámetros tienen esos tipos?

Comparar con los tipos de los constructores

Cte :: Int -> ExpA Sum :: ExpA -> ExpA -> ExpA Mult :: ExpA -> ExpA -> ExpA

¡Cada parámetro coincide con un constructor, pero reemplazando ExpA por b!

# Esquemas en ExpA

Recordando que data ExpA = Cte Int | Sum ExpA ExpA | Mult ExpA ExpA

¿Cómo hacer la evaluación usando foldExpA?   
evalExpA :: ExpA -> Int   
evalExpA = foldExpA id (+) (\*)   
¿Y la simplificación?   
simplificar :: ExpA -> ExpA   
simplificar = foldExpA Cte armarSuma Mult

# Esquemas en otros tipos

data A = B | C A Char A | D A A A | E A Char | F Int A

Función de recursión estructural sobre A

foldA :: b -> (b->Char->b->b) -> (b->b->b->b) -> (b->Char->b) -> (Int->b->b) -> A -> b   
foldA b fc fd fe ff B = b   
foldA b fc fd fe ff (C a1 c a2) = fc (foldA b fc fd fe ff a1) c (foldA b fc fd fe ff a2)   
foldA b fc fd fe ff (D a1 a2 a3) = fd (foldA b fc fd fe ff a1) (foldA b fc fd fe ff a2) (foldA b fc fd fe ff a3)   
foldA b fc fd fe ff (E a c) = fe (foldA b fc fd fe ff a) c   
foldA b fc fd fe ff (F n a) = ff n (foldA b fc fd fe ff a)

# Esquemas en otros tipos

data A = B | C A Char A | D A A A | E A Char | F Int A

Contar los caracteres que aparecen en un A

contarChar :: A -> Int

contarChar = foldA 0 (\n1 c n2 -> n1+1+n2) (\n1 n2 n3 -> n1+n2+n3) (\n c -> n+1) (\_ n -> n)

![](images/7121d3754963ff085172583621924ac527cbe47de771b45d1a3691d4b5a99e75.jpg)

Observar que solamente el 2do y el 4to argumentos suman 1 (porque esos constructores tienen un Char)

# Esquemas en otros tipos

Resumiendo:

La función fold expresa la recursión sobre un tipo recursivo T (regular)

Su resultado es una función T -> b

Tiene tantos parámetros como constructores tenga el tipo

El tipo de cada parámetro depende del tipo del constructor correspondiente, reemplazando T por b

# Árboles alfa-beta

Considere la siguiente definición data AB a b = Leaf b | Branch a (AB a b) (AB a b)

Defina una función que cuente el número de   
bifurcaciones de un árbol   
bifs :: AB a b -> Int   
bifs (Leaf x) =   
bifs (Branch y t1 t2) = ... bifs t1 ... bifs t2

Completamos con el significado...

# Árboles alfa-beta

Considere la siguiente definición data AB a b = Leaf b | Branch a (AB a b) (AB a b)

Defina una función que cuente el número de bifurcaciones de un árbol

bifs :: AB a b -> Int   
bifs (Leaf x) = 0   
bifs (Branch y t1 t2) = 1 + bifs t1 + bifs t2

¿Cómo sería el esquema de recursión asociado a un árbol AB?

# Árboles alfa-beta

¡Utilizamos el esquema de recursión!

foldAB :: ??   
foldAB f g (Leaf x) = f x   
foldAB f g (Branch y t1 t2) = g y (foldAB f g t1) (foldAB f g t2)

¿Cómo representaría la función bifs?

bifs' = foldAB (const 0) (\x n1 n2 -> 1+n1+n2)

¿Puede probar que bifs' = bifs?

# Árboles alfa-beta

Ejemplo de uso type AExp = AB BOp Int data BOp = Suma | Producto ¿Cómo definimos una expresión aritmética usando AExp?

exEj = Branch Suma (Branch Producto (Leaf 3) (Leaf 4)) (Leaf 5)   
-- Representa a $\cdot$

# Árboles alfa-beta

Recordando que data ExpA = Cte Int | Sum ExpA ExpA | Mult ExpA ExpA

Comparar el ejemplo anterior con la representación equivalente en ExpA

exEjEA = Sum (Mult (Cte 3) (Cte 4)) (Cte 5)   
-- Representa a $( 3 ^ { \star } 4 ) + 5$

¿En qué se diferencian? ¿Cuál elegir?

# Árboles alfa-beta

Ejemplo de uso type AExp = AB BOp Int data BOp = Suma | Producto ¿Cómo definimos la semántica de AExp usando foldAB?

evalAE :: AExp -> Int evalAE = foldAB id binOp binOp :: BOp -> Int -> Int -> Int binOp Suma = (+) binOp Producto = (\*)

# Árboles alfa-beta

Ejemplo de uso type Decision s a = AB (s->Bool) a

Definamos una función que dada una situación, decida qué acción tomar basada en el árbol

decide :: situation -> Decision situation action -> action decide s = foldAB id (\f a1 a2 -> if (f s) then a1 else a2)

ej = Branch f1 (Leaf ''Huya'') (Branch f2 (Leaf ''Trabaje'') (Leaf ''Quédese manso'')) where f1 s = (s==Fuego) || (s==AtaqueExtraterrestre) f2 s = (s==VieneElJefe)

# Árboles Generales

¿Cómo representar un árbol con un número variable de hijos?

Ejemplo:

![](images/09c984a1a6220342677e47b8f121d22dadaf01c4ddf76edae3784995684e6374.jpg)

Idea: ¡usar una lista de hijos!

# Árboles Generales

Ello nos lleva a la siguiente definición: data AG a = GNode a [ AG a ]

Pero, ¿tiene caso base? ¿cuál?

Un árbol sin hijos...

¡Se basa en el esquema de recursión de listas!

O sea, el caso base es (GNode x [ ]); por ejemplo:

GNode 1

GNode 2 [ GNode 5 [ ], GNode 6 [ ] ]   
GNode 3 [ GNode 7 [ ] ]   
GNode 4 [ ]

# Árboles Generales

Definir una función que sume los elementos sumAG :: AG Int -> Int

¿Cómo la definimos?

¡Usando funciones sobre listas! sumAG (GNode x ts) = x + sum (map sumAG ts)

Y esto, ¿es estructural?

Sí, pues se basa en la estructura de las listas

Se ve la utilidad de funciones de alto orden...

# Árboles Generales

¿Cómo sería el esquema de recursión? Hay varias posibilidades

Según la receta de una función por constructor foldAG0 :: (a->[b]->b) -> AG a -> b foldAG0 h (GNode x ts) = h x (map (foldAG0 h) ts) y entonces, la función sumAG queda sumAG0 = foldAG0 (\x ns -> x + sum ns)

¡El problema es que no es recursión estructural!

# Árboles Generales

¿Cómo sería el esquema de recursión? (2)

Completamente estructural   
foldAG1 :: (a->c->b) -> (b->c->c) -> c -> AG a -> b   
foldAG1 g f z (GNode x ts) = g x (foldr f z (map (foldAG1 g f z) ts))

y entonces, la función sumAG queda sumAG1 = foldAG1 (+) (+) 0 -- sum = foldr (+) 0

Siempre termina, porque es estructural ¡El problema es que es difícil de pensar!

# Árboles Generales

¿Cómo sería el esquema de recursión? (3)

Opción intermedia entre ambas   
foldAG :: (a->c->b) -> ([b]->c) -> AG a -> b   
foldAG g k (GNode x ts) = g x (k (map (foldAG g k) ts)) y entonces, la función sumAG queda sumAG = foldAG (+) sum

No es estructural, pero es bastante clara

# Árboles Generales

¿Cuál es mejor? Depende del uso y el gusto sumAG0 = foldAG0 $( \backslash \times \mathsf { n s \to x } + \mathsf { s u m \ n s } )$

sumAG1 = foldAG1 (+) (+) 0 -- sum = foldr (+) 0 sumAG' = foldAG $( + )$ sum

Otras funciones sobre árboles generales:

depthAG = foldAG (\x d -> 1+d) (maxWith 0) where maxWith x [] = x maxWith x xs = maximum xs

mirrorAG = foldAG GNode reverse “La tarea de un pensador no consistía para Shevek en negar una realidad a expensas de otra, sino en integrar y relacionar. No era una tarea fácil.”

Los Desposeídos Úrsula K. Le Guin

“Enseñen a los niños a ser preguntones para que pidiendo el por qué de lo que se les manda, se acostumbren a obedecer a la razón, no a la autoridad como los limitados, ni a la costumbre como los estúpidos.”

Simón Rodríguez, maestro del Libertador, Simón Bolívar.

“La persona que toma lo banal y lo ordinario y lo ilumina de una nueva forma, puede aterrorizar. No deseamos que nuestras ideas sean cambiadas. Nos sentimos amenazados por tales demandas. «¡Ya conocemos las cosas importantes!», decimos. Luego aparece el Cambiador y echa a un lado todas nuestras ideas.

# -El Maestro Zensunni”

Casa Capitular: Dune Frank Herbert

“Un mago sólo puede dominar lo que está cerca, lo que puede nombrar con la palabra exacta.”

Un mago de Terramar Úrsula K. Le Guin

“ - Maestro - dijo Ged -, no soy tan vigoroso como para arrancarte el nombre por la fuerza, ni tan sabio como para sacártelo por la astucia. Me contento pues, con quedarme aquí y aprender o servir, lo que tú prefieras; a menos que consintieras, por ventura, a responder a una pregunta mía.

- Hazla.   
- ¿Qué nombre tienes?   
El Portero sonrió, y le dijo el nombre.”

Un mago de Terramar Úrsula K. Le Guin