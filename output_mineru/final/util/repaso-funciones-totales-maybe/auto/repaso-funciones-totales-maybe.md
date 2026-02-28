# Repaso de Funciones Totales y Maybe

Paradigmas (de Lenguajes) de Programaci´on

26 de Agosto de 2025

# 1 Funciones Totales

Las funciones transforman un valor de entrada a un valor de salida. Cuando caracterizamos los valores como conjuntos, por ejemplo usando tipos de datos, podemos hablar de funciones totales y parciales. Llamamos totales a las funciones cuyo dominio coincide con el conjunto de partida, y parciales a las funciones cuyo dominio es un subconjunto propio de dicho conjunto.

Las funciones totales siempre devuelven un valor. Esto es muy conveniente a la hora de analizar c´odigo porque no tenemos que preocuparnos si los argumentos son correctos.

Muchas veces analizamos los programas con la mentalidad de que “si termina entonces ...”. Ese “si termina” contempla la precondici´on. Si no satisfacemos la precondici´on, entonces perdemos las garant´ıas de c´omo se puede comportar el programa.

La funci´on suma es total:

Si x , y :: Int sabemos que $\mathrm { ~ \texttt ~ { ~ x ~ + ~ y ~ } ~ }$ :: Int sin importar el valor de x e y y sabemos que el programa $\mathrm { ~ \texttt ~ { ~ x ~ + ~ y ~ } ~ }$ va a terminar.

La funci´on de divisi´on entera es parcial

<table><tr><td>div ::I Integral a =&gt; a -&gt; a -&gt; a</td></tr></table>

Su precondici´on es que el segundo argumento sea distinto de 0. Si x , y :: Int entonces div x y no tiene comportamiento definido si $\texttt { y } = = \texttt { 0 }$ , en particular da error deteniendo la ejecuci´on de todo el programa.

Otra funci´on que ya conocen es head :: [a ] -> a . $\begin{array} { r } { \dot { \iota } } \end{array}$ Ser´a total o parcial? $\begin{array} { r } { \boldsymbol { \dot { \lambda } } } \end{array}$ Tiene alguna precondici´on no trivial? ¡Es Parcial! la lista tiene que no ser vac´ıa.

Sigamos analizando $( + )$ y div como ejemplos m´as sencillos. Pero las herramientas sirven tambi´en para otras estructuras de datos.

Supongamos que queremos hacer un programa que calcula $x / y + z$

1 programa :: Int -> Int -> Int -> Int   
2 programa x y z = div x y + z

En principio, si no sabemos los detalles de la implementaci´on, viendo solo el tipo podr´ıamos pensar que cualquier valor es v´alido. Pero la precondici´on (que no siempre est´a expl´ıcita) nos dice que $y \ne 0$ . De hecho, como programadores del programa podr´ıamos no darnos cuenta porque la divisi´on bien podr´ıa estar siendo llamada dentro de otras funciones en lugar de estar directamente a la vista.

En definitiva, mientras m´as informaci´on nos provean los tipos de datos, mejor. Porque el chequeo de tipos no sabe de precondiciones, solo de tipos.

# Importante

Trabajar con funciones totales empuja m´as informaci´on al sistema de tipos.

# 2 ¿C´omo obtener una funci´on total?

Dada una funci´on parcial, a veces puede obtenerse una funci´on total que se comporte de la misma forma para los valores definidos. Esto se logra modificando el dominio o la imagen de la funci´on.

Veamos c´omo ser´ıa un ejemplo de safeDiv para Int.

# 2.1 Modificando la imagen

Si modificamos la imagen de la funci´on, su resultado, podemos hacer que en lugar de calcular un Int calculemos si la operaci´on tuvo ´exito y en tal caso tener un int. El tipo Maybe puede usarse para tal fin.

1 data Maybe a $=$ Just a | Nothing   
2   
3 safeDiv :: Int -> Int -> Maybe Int   
4 safeDiv $=$ _

No nos importa la implementaci´on, sino analizar la consecuencia del cambio en la funci´on: safeDiv puede ser total! safeDiv x y va a ser un Maybe Int y terminar sin importar los valores de los argumentos. Cuando $\texttt { y } = = \texttt { 0 }$ obtendremos un Nothing y en otro caso un Just con el resultado de la divisi´on.

Ahora bien, si tratamos de usar safeDiv en nuestro programa vamos a tener un problema.

<table><tr><td>programa :: Int -&gt; Int -&gt; Int -&gt;</td><td></td><td></td><td></td><td></td><td></td><td>Int</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td>programa x y z = safeDiv x y + z</td><td></td></tr></table>

No compila. Porque $( + )$ no puede sumar un Maybe Int con un Int.

Termina siendo tarea de quien usa safeDiv decidir qu´e hacer ante la condici´on de error. ¡Pero al menos es un error que no detiene todo el programa!

# 2.1.1 Resolviendo el problema

En principio podr´ıamos resolver la situaci´on dando alg´un resultado que tenga sentido. Suponiendo que 0 es la respuesta que queremos dar en caso de error, podr´ıamos escribir un case.

1 programa :: Int -> Int -> Int -> Int   
2 programa x y z =   
3 case safeDiv x y of   
4 Just r -> r + z   
5 Nothing -> 0

# 2.1.2 Avisando del problema

O bien podr´ıamos querer indicar que hubo un error al evaluar programa (usando Maybe).

1 programa :: Int -> Int -> Int -> Maybe Int   
2 programa x y z =   
3 case safeDiv x y of   
4 Just r -> Just r + z   
5 Nothing -> Nothing

Conocer o armar algunas funciones sobre Maybe es ´util para lidiar con estas situaciones en forma m´as c´omoda.

# 2.2 Modificando el dominio

Otra alternativa es tener un tipo de dato que represente a los enteros sin el cero, por ejemplo NonZero. De esta forma podemos modificar el dominio, los argumentos de safeDiv para que quede de la siguiente forma.

1 safeDiv :: Int -> NonZero -> Int   
2 safeDiv = _

El tipo de dato NonZero estar´ıa declarado en otro m´odulo y tendr´a alguna forma de obtener un valor NonZero. La siguiente podr´ıa ser su interfaz.

1 module NonZero where ( NonZero , maybeNonZero , toInt )   
2   
3 data NonZero   
4   
5 maybeNonZero :: Int -> Maybe NonZero   
6   
7 toInt :: NonZero -> Int

Nuevamente, si reemplazamos div por safeDiv, el programa va a tener un problema de tipos, ya que y deber´ıa ser NonZero en esta versi´on de safeDiv. Como usuarios de safeDiv nos vemos obligados a realizar la verificaci´on sobre y. Usando maybeNonZero podemos hacer dicha verificaci´on y decidir qu´e resultado deber´ıamos dar en tal caso.

1 programa :: Int -> Int -> Int -> Int   
2 programa x y z =   
3 case maybeNonZero y of'   
4 Just y -> safeDiv x y + z   
5 Nothing -> 0

O, si preferimos, indicar el error a los usuarios de programa .

1 programa :: Int -> Int -> Int -> Maybe Int   
2 programa x y z =   
3 case maybeNonZero y of'   
4 Just y -> Just ( safeDiv x y  + z )   
5 Nothing -> Nothing

Nuevamente estamos en control de c´omo resolver la situaci´on que antes era un error que frenar´ıa todo el programa.

# 3 Maybe

# Tip En otros lenguajes...

A Maybe se lo suele comparar con null, nil, None de lenguajes como Java, Ruby o Python. Pero hay una diferencia importante. En muchos lenguajes es usual que una variable de tipo String pueda tener un valor no inicializado null. En estos lenguajes entonces null es un posible valor del tipo String. Expresiones como append("hola", null) pasan el chequeo de tipos, pero pueden no evaluar satisfactoriamente.

En Haskell, lo equivalente, " hola " ++ Nothing no tipa. " hola " :: String y Nothing :: Maybe a, la funci´on $( + + )$ no est´a definida. Una funci´on que opere con String no puede operar con Maybe String, hay que adaptarla. Esto hace que a veces tengamos:

 Que aplicar Just a un string para pasarlo por par´ametro,  O que necesitemos ”desarmar” un Maybe para saber qu´e tiene adentro,  O que usemos alguna funci´on que nos resuelva la fricci´on que puede introducir el Maybe

El tipo Maybe puede ser ´util en muchos contextos y conocer algunos patrones usuales puede ayudar.

# 3.1 Valor por defecto

Cuando tenemos un Maybe a y queremos s´ı o s´ı un a hay dos opciones:

 O bien usamos una funci´on parcial fromJust :: Maybe a -> a que se va a indefinir si el argumento es Nothing,   
 o bien usamos una funci´on total fromMaybe :: a -> Maybe a -> a que devuelve el primer argumento si el segundo es Nothing.

Ambas funciones est´an ya definidas en Data . Maybe del paquete base, pero su definici´on

es muy sencilla:

1 fromJust :: Maybe a -> a   
2 fromJust ( Just v ) = v   
-- Funci ´on parcial , no hay " fromJust Nothing   
4   
5 fromMaybe :: a -> Maybe a -> a   
6 fromMaybe _ ( Just v ) = v   
7 fromMaybe d Nothing $=$ d   
8 -- Funci ´on total !

# 3.2 Transformar

Hay veces que necesitamos transformar el valor dentro de un Maybe y mantener el Nothing . En las versiones de programa :: Int -> Int -> Int -> Maybe Int, esto mismo fue lo que termin´o pasando.

Podemos definir mapMaybe, que aplique la transformaci´on de a a b.

1 mapMaybe :: ( a -> b ) -> Maybe a -> Maybe b   
2 mapMaybe _ Nothing $=$ Nothing   
3 mapMaybe f ( Just a ) $=$ Just ( f a )

Luego reescribimos el programa con safeDiv :: Int -> Int -> Maybe Int evitando el case.

1 programa :: Int -> Int -> Int -> Maybe Int   
2 programa x y z =   
3 ( safeDiv x y ) mapMaybe  (\ r -> r + z )

# Tip

Lo c´omodo de las funciones de alto orden como mapMaybe es que aplicar varias de estas suele ser m´as c´omodo que anidar case.

La funci´on mapMaybe ya est´a definida como fmap en Prelude. Si bien tiene un tipo m´as general fmap :: Functor f $= >$ ( a -> b ) -> f a -> f b puede usarse con Maybe.

# 3.3 Promover

Supongamos queremos hacer un programa que use dos divisiones $a / b + x / y$ . Si alguna de las divisiones falla, el programa entero debe fallar.

Hay varias formas de hacerlo. Un intento directo de usar safeDiv por como divisi´on nos dar´ıa un problema de tipos nuevamente.

<table><tr><td></td><td>programa :: Int -&gt; Int -&gt; Int -&gt; Int -&gt; Maybe Int</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>2</td><td>programa a b x y = (safeDiv a b) + (safeDiv x y)</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>3</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>error</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table>

Podemos pensar en promover la suma $( + )$ de Int a Maybe Int y si algunos de los argumentos es Nothing entonces el resultado es Nothing. Esta idea puede aplicar a cualquier operaci´on de dos argumentos, incluso para distintos tipos de argumentos.

Definiendo lift2 de la siguiente manera:

1 lift2 :: ( a -> b -> c ) -> Maybe a -> Maybe b -> Maybe c   
2 lift2 _ Nothing _ $=$ Nothing   
3 lift2 _ _ Nothing $=$ Nothing   
4 lift2 f ( Just a ) ( Just b) $=$ Just ( f a b )

Podemos escribir:

<table><tr><td></td><td></td><td></td><td></td><td></td><td></td><td> programa :: Int -&gt; Int -&gt; Int -&gt; Int -&gt; Maybe Int</td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>programa a b x y = lift2 (+) (safeDiv a b) (safeDiv x y)</td></tr></table>

La funci´on lift2 ya est´a definida como liftA2 en Prelude. Si bien tiene un tipo m´as general liftA2 :: Applicative f $= >$ ( a -> b -> c ) -> f a -> f b -> f c puede usarse con Maybe.

# 3.4 Encadenar

Otra opci´on que sirve en el caso anterior es pensar el programa como una secuencia de c´omputos m´as peque˜nos y tratar de encadenar dichos c´omputos. Si alguno falla, entonces el conjunto tambi´en lo hace. De esta forma un c´omputo toma un valor como entrada y puede o no tener ´exito.

Un c´omputo entonces ser´ıa de la forma a -> Maybe b.

Dado el resultado de un primer c´omputo (de tipo Maybe a), vamos a querer encadenar un segundo c´omputo (de tipo a -> Maybe b) y obtener su el resultado, que puede fallar.

Notar que estamos suponiendo que el segundo c´omputo solo va a ser ejecutado si el primero tiene ´exito, ya que toma un a en lugar de un Maybe a.

A la funci´on que necesitamos podemos llamarla andThen.

1 andThen :: Maybe a -> ( a -> Maybe b ) -> Maybe b   
2 andThen Nothing _ $=$ Nothing   
3 andThen ( Just a ) f = f a

# Tip

Se parece a mapMaybe pero no es igual.

Al usarla podemos ver que hay tres c´omputos: $a / b$ , $x / y$ y la suma de ambos. Cada andThen nos permite darle un nombre al resultado del c´omputo anterior y dicho valor va ser en este caso un Int, no un Maybe Int, quitando la necesidad de promover la suma.

1 programa :: Int -> Int -> Int -> Int -> Maybe Int   
2 programa a b x y $=$ \`   
3 ( safeDiv a b ) andThen (\ aDivB ->\` \`   
4 ( safeDiv x y ) andThen  (\ xDivY ->   
5 Just ( aDivB $^ +$ xDivY )   
6 )   
)

Notar que por como se encadenan los c´omputos, el ´ultimo tiene acceso al resultado de todos los c´omputos anteriores.

La funci´on andThen ya est´a definida como $( > > = )$ ) en Prelude, se le dice bind. Si bien tiene un tipo m´as general $( > > = )$ :: Monad $\mathrm { ~ \mathfrak ~ { ~ m ~ } ~ } = >$ m a $- >$ ( a - > m b ) - > m b , puede usarse con Maybe.

Alineando el c´odigo un poco distinto puede dar la sensaci´on de “asignaci´on”. De hecho al usar $( > > = )$ se puede usar tambi´en la funci´on pure, que en este contexto tendra tipo a $- >$ Maybe a y equivale a Just.

1 programa :: Int -> Int -> Int -> Int -> Maybe Int   
2 programa a b x y =   
3 ( safeDiv a b ) > >= (\ aDivB ->   
4 ( safeDiv x y ) $> > =$ (\ xDivY ->   
5 pure ( aDivB $^ +$ xDivY )   
6 ) )

En Haskell la clase Monad, con las funciones $( > > = )$ y pure, permite usar la notaci´on do. El siguiente c´odigo es equivalente $1 0 0 \%$ al anterior pero se lee m´as f´acil.

1 programa :: Int -> Int -> Int -> Int -> Maybe Int   
2 programa a b x y = do   
3 aDivB <- safeDiv a b   
4 xDivY <- safeDiv x y   
5 pure ( aDivB $^ +$ xDivY )   
6

# 3.5 Alternativa

Otro patr´on ´util se usa cuando tenemos dos Maybe a y queremos el primero que no sea un Nothing.

1 orMaybe :: Maybe a -> Maybe a -> Maybe a   
2 orMaybe ( Just a ) _ = ( Just a )   
3 orMaybe Nothing mb $=$ m b

Notemos que es muy similar al or de Bool, (||). Por eso el nombre orMaybe.

1 (||) :: Bool -> Bool -> Bool   
2 (||) True _ = True   
3 (||) False z = z

Si tenemos que determinar el primero de tres valores que no sea Nothing, podemos simplemente escribir lo siguiente sin necesidad de case y otras funciones auxiliares.

$^ { 1 }$ ( a orMaybe  b ) orMaybe  c

# 3.6 Otros

Hay m´as patrones ´utiles que pueden aparecer dependiendo de c´omo pensemos los problemas. Definir funciones auxiliares para abstraer el comportamiento deseado en cada situaci´on es un recurso v´alido para lograr un programa m´as f´acil de entender.

# 4 Chequeando precondiciones

Volvamos al programa del principio: $x / y + z$

1 programa :: Int -> Int -> Int -> Int programa x y z = div x y + z

Podr´ıamos hacerlo total tambi´en si tenemos cuidado con cu´ando usamos div.

1 programa :: Int -> Int -> Int -> Maybe Int   
2 programa x y z =   
3 if y /= 0   
4 then Just ( div x y + z )   
5 else Nothing

Pero no estamos aprovechando al informaci´on de tipos para asegurarnos de que programa sea total. Al usar una funci´on parcial debemos analizar el programa cuidadosamente. Este programa es corto, pero se puede volver un an´alisis complicado muy r´apido.

Distinto es cuando usamos funciones totales. La composici´on de funciones totales siempre es total. En el siguiente programa, al usar todas funciones totales, estamos seguros de que el programa va a terminar para toda entrada. No hay ning´un an´alisis necesario.

1 programa :: Int -> Int -> Int -> Maybe Int   
2 programa x y z =   
3 ( safeDiv x y ) andThen  (\ xDivY ->   
4 Just ( xDivY + z)   
5 )

# Importante

La composici´on de funciones totales da una funci´on total. La composici´on de funciones parciales puede dar como resultado una funci´on total, pero requiere un an´alisis manual. Distintos sistemas de tipos corren el l´ımite, pero con los tipos vistos hasta ahora el an´alisis queda a cargo de la persona.

# 5 Ejemplo: Recorriendo ´arboles

Supongamos que dado un ´arbol binario de enteros (sin orden) queremos saber si alg´un Int que cumpla cierta condici´on est´a o no definido (contenido) en dicho ´arbol.

La condici´on pues est´a representada como Int -> Bool.

Si encontramos un elemento, queremos obtener cu´al fue dicho Int. El resultado pues de la funci´on podr´ıa ser Maybe Int para indicar si lo encontramos o no y en tal caso cu´al es.

1 data ABInt $=$ Bin ABInt Int ABInt | Nil   
2   
3 definido :: ABInt -> ( Int -> Bool ) -> Maybe Int   
4 definido ab f = _

Una versi´on directa de tal funci´on podr´ıa ser:

![](images/4015c905b3a9343f138e20836eb276a38fb3fa4c88c5ab9d81ca1037697998a1.jpg)

Mucho anidamiento. El ´ultimo case no hace falta en rigor, igual: eval´ua al valor de definido d f.

<table><tr><td rowspan=1 colspan=2>definido :: ABInt -&gt; (Int -&gt; Bool） -&gt; Maybe Intdefinido Nil f = Nothing</td></tr><tr><td rowspan=1 colspan=1>definido （Bin i n d） f =if fn</td><td></td></tr></table>

Igual entender que realiza una b´usqueda preorder (primero la ra´ız, luego en rama izquierda y luego en rama derecha) no es trivial de ver.

Reescrib´amoslo usando algunas de las operaciones de Maybe vistas antes.

<table><tr><td>definido :: ABInt -&gt; (Int -&gt; Bool） -&gt; Maybe Int 2 definido Nil f = Nothing</td></tr></table>

Sabiendo que orMaybe eval´ua al primer argumento si este no es Nothing podemos leer (y cambiar) el orden en que se recorre el ´arbol con mayor facilidad.