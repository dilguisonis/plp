# Programaci´on Funcional en Haskell Demostraciones

Paradigmas de Lenguajes de Programaci´on

Departamento de Ciencias de la Computaci´on Universidad de Buenos Aires

9 de septiembre de 2025

Tipos algebraicos en Haskell Esquemas de recursi´on Currificaci´on Aplicaci´on parcial Alto orden Generaci´on infinita

Razonamiento ecuacional Extensionalidad Lemas de generaci´on Inducci´on estructural Ejercicios m´as dif´ıciles

B´asicamente, vamos a ver c´omo demostrar propiedades sobre nuestros programas.

Sean las siguiente definiciones:

doble :: Integer $- >$ Integer doble $\textbf { x } = \textbf { 2 } * \textbf { x }$

cuadrado :: Integer $- >$ Integer cuadrado $\textbf { x } = \textbf { x } * \textbf { x }$

¿C´omo probamos que doble $2 =$ cuadrado 2?

# Soluci´on:

doble $2 =$ doble $2 ~ * ~ 2 =$ cuadrado cuadrado 2 ✷

Queremos ver que:

curry . uncurry $=$ id

Tenemos:

curry :: ((a, b) -> c) -> (a -> b -> c)   
curry $\textbf { f } = \mathbf { \Theta } ( \backslash \textbf { x } \textrm { y } \xrightarrow { } \textbf { f } \mathbf { \Theta } ( \mathbf { x } , \textbf { y } ) )$   
uncurry :: $\because ( a - > b - > c ) - > ( ( a , \ b )$ -> c)   
uncurry $\textbf { f } = \mathbf { \Omega } ( \mathbf { \Omega } ) \mathbf { \Omega } ( \mathbf { x } , \textbf { y } ) \mathbf { \Omega } \to \textbf { f } \textbf { x } \mathbf { y } )$   
$[ . ) \vdots \ \vdots ( { \bf b } \ {  } \ { \mathsf c } ) \ {  } \ ( { \mathsf a } \ {  } \ { \mathsf b } ) \ {  } \ ( { \mathsf a } \ {  } \ { \mathsf c } )$   
(f . g) $\mathrm { ~ x ~ } = \mathrm { ~ f ~ }$ (g x)   
id :: a $^ { - > }$ a   
id $\mathrm { ~ \tt ~ x ~ } = \mathrm { ~ \tt ~ x ~ }$

¿C´omo hacemos?

Dadas f, g :: a $- > b$ , probar ${ \mathfrak { f } } = { \mathfrak { g } }$ se reduce a probar:

Estas son algunas propiedades que podemos usar en nuestras demostraciones:

∀F :: a -> b . ∀G :: a -> b . ∀Y :: b . ∀Z :: a . $\begin{array}{c} \begin{array} { r l } & { \mathrm { \bf ~ F } = \tt G } \\ & { \mathrm { \bf ~ F } = \{ { \bf ~ x _ \tau }  \tt ~ Y } \quad \Leftrightarrow \quad \forall { \bf x } : : { \tt a } \mathrm {  ~ . ~ F ~ } { \bf x } = { \tt G } \mathrm {  ~ x ~ }  \\ & { ( \backslash { \bf x }  \mathrm {  ~ Y } ) \mathrm {  ~ \sf ~ Z } } \\ & { \backslash { \bf x }  \mathrm {  ~ F ~ } { \bf x } } \\ & { \mathrm { \bf ~ V }  \mathrm {  ~ F ~ } { \bf x } } \end{array} \quad \Longrightarrow \quad \mathrm { \bf ~ Y } \mathrm {  ~ r e e m p l a z a n d o ~ x ~ p o r ~ } { \sf Z }  \\ & { \mathrm { \bf ~ V } } \end{array}$

F, G, Y y Z pueden ser expresiones complejas, siempre que la variable x no aparezca libre en F, G, ni Z (m´as detalles cuando veamos C´alculo Lambda).

Ahora probemos:

curry . uncurry $=$ id

# Tenemos:

curry :: ((a, b) -> c) -> (a -> b -> c)   
$\{ { \tt C } \}$ curry $\textbf { f } = \mathbf { \Theta } ( \backslash \textbf { x } \textrm { y } \xrightarrow { } \textbf { f } \mathbf { \Theta } ( \mathbf { x } , \textbf { y } ) )$   
uncurry :: $( a ~  ~ b ~  ~ c ) ~  ~ ( ~ ( a , ~ b ) ~  ~ c$ )   
$\{ \mathtt { U } \}$ uncurry $\textbf { f } = \mathbf { \Omega } ( \mathbf { \Omega } ) \mathbf { \Omega } ( \mathbf { x } , \textbf { y } ) \mathbf { \Omega } \to \textbf { f } \textbf { x } \textbf { y }$   
$[ . ) \vdots \ \vdots ( { \bf b } \ {  } \ { \mathsf c } ) \ {  } \ ( { \mathsf a } \ {  } \ { \mathsf b } ) \ {  } \ ( { \mathsf a } \ {  } \ { \mathsf c } )$   
$\{ { \tt C O M P } \}$ (f . g) x = f (g x)   
id :: a $^ { - > }$ a   
$\{ \mathtt { I } \}$ id $\mathrm { ~ \tt ~ x ~ } = \mathrm { ~ \tt ~ x ~ }$

Dado el tipo de la uni´on disjunta:

data Either a b $=$ Left a | Right b

Se define la siguiente funci´on, que permite multiplicar pares y enteros entre s´ı (usando producto escalar entre pares).

prod :: Either Int (Int, Int) $- >$ Either Int (Int, Int) $- >$ Either Int (Int, Int)   
$\{ \mathtt { P 0 } \}$ prod (Left x) (Left y) $=$ Left $( { \textbf { x } } * { \textbf { y } } )$   
$\{ \mathtt { P 1 } \}$ prod (Left x) (Right (y, z)) $=$ Right $\texttt { \textbf { x * y } }$ , x \* z)   
$\{ \mathtt { P 2 } \}$ prod (Right (y, z)) (Left x) $=$ Right (y \* x, z \* x)   
$\{ \mathtt { P 3 } \}$ prod (Right (w, x)) (Right (y, z)) $=$ Left $( { \texttt { w } } * { \texttt { y } } + { \texttt { x } } * { \texttt { z } } )$

¿Podemos probar esto?

∀ p::Either Int (Int, Int) . $\forall$ q::Either Int (Int, Int) . prod p q $=$ prod q p

Recordemos los lemas de generaci´on para pares y sumas.

Dado p :: (a, b), siempre podemos usar el hecho de que existen x :: a, y :: b tales que $\texttt { p } = \texttt { ( x , y ) }$ .

De la misma manera, dado e :: Either a b, siempre podemos usar el hecho de que:

$\theta =$ Left x con x :: a, o e = Right y con y :: b.

Probemos enconces...

∀ p::Either Int (Int, Int) . $\forall$ q::Either Int (Int, Int) . prod p q $=$ prod q p

Tenemos:

prod :: Either Int (Int, Int) $- >$ Either Int (Int, Int) $- >$ Either Int (Int, Int)   
$\{ \mathtt { P 0 } \}$ prod (Left x) (Left y) $=$ Left $( { \textbf { x } } * { \textbf { y } } )$   
$\{ \mathtt { P 1 } \}$ prod (Left x) (Right (y, z)) $=$ Right $( { \texttt { x * y } }$ , x \* z)   
$\{ \mathtt { P 2 } \}$ prod (Right (y, z)) (Left x) $=$ Right (y \* x, z \* x)   
$\{ \mathtt { P 3 } \}$ prod (Right (w, x)) (Right (y, z)) $=$ Left $( { \texttt { w } } * { \texttt { y } } + { \texttt { x } } * { \texttt { z } } )$

Se cuenta con la siguiente representaci´on de conjuntos:

type Conj a $=$ (a->Bool) representados por su funci´on caracter´ıstica. De este modo, si c es un conjunto y e un elemento, la expresi´on c e devuelve True si e pertenece a c y False en caso contrario.

Contamos con las siguientes definiciones:

vac´ıo :: Conj a   
$\{ \mathtt { V } \}$ vac´ıo $= \mathrm { \backslash . . } - >$ False   
intersecci´on :: Conj a-> Conj a-> Conj a $\{ \mathtt { I } \}$ intersecci´on c $\textsf { d } = \ \backslash \textsf { e } \to \ \mathsf { c }$ e && d e

agregar :: Eq a $\Rightarrow$ a $- >$ Conj a $- >$ Conj a $\{ { \tt A } \}$ agregar x $\textsf { c } = \ \left. \textsf { e } \to \textsf { e } = \pmb { \mu } \right.$ || c e diferencia :: Conj a $- >$ Conj a-> Conj a $\{ \mathtt { D } \}$ diferencia c $\textsf { d } = \textsf { \backslash e } \to \textsf { \prime }$ c e && not (d e)

Demostrar la siguiente propiedad:

∀ c::Conj a . $\forall$ d::Conj a . intersecci´on d (diferencia c d) $=$ vac´ıo

Pruebo $P ( 0 )$

Pruebo que si vale $P ( n )$ entonces vale $P ( n + 1 )$ .

Pruebo $P ( [ ] )$ Pruebo que si vale $P ( { \bf x } { \bf s } )$ entonces para todo elemento x vale $P ( { \bf x } ; { \bf x } { \bf s } )$ .

# En el caso general (inducci´on estructural)

Pruebo $P$ para el o los caso(s) base (para los constructores no recursivos).

Pruebo que si vale $P ( A r g _ { 1 } ) , \ldots , P ( A r g _ { k } )$ entonces vale $P ( C { \cal A } r g _ { 1 } \ldots { \cal A } r g _ { k } )$ para cada constructor $C$ y sus argumentos recursivos $A r g _ { 1 }$ , . . . , $A r g _ { k }$ . (Los argumentos no recursivos quedan cuantificados universalmente).

Leer la propiedad, entenderla y convencerse de que es verdadera.   
Plantear la propiedad como predicado unario.   
Plantear el esquema de inducci´on.   
Plantear y resolver el o los caso(s) base.   
Plantear y resolver el o los caso(s) inductivo(s).

Veamos que estas dos definiciones de length son equivalentes:

length1 :: [a] $- >$ Int   
$\{ \mathtt { L 1 0 } \}$ length1 $\ [ \mathsf { \Lambda } ] \ = \ 0$   
{L11} length1 ${ \bf \ ( \mathrm {  ~ \cdot ~ } x s ) \ = \ 1 _ { \Sigma } + \mathrm { \bf ~ l e n g t h 1 } }$ xs

length2 :: [a] -> Int $\{ \mathtt { L 2 } \}$ length2 $=$ foldr ( $\begin{array}{c} \ifmmode : \\\ . \textperiodcentered \fi { } \\\ { \textmd { . } } \end{array}$ res -> 1 + res) 0

Recordemos:

foldr :: (a -> b -> b) -> b -> [a] -> b $\left\{ \ F 0 \right\}$ foldr $\texttt { f z } [ ] = \texttt { z }$ $\{ \mathtt { F } 1 \}$ foldr f $_ { z }$ $\mathbf { \chi } _ { \mathbf { x } : \mathbf { x } \mathbf { s } } ^ { } ) ~ = { \textbf { f } } ~ \mathbf { x }$ (foldr f z xs)

Dados dos tipos a y b tales que valen Eq a y Eq b, queremos probar que:

∀ f::a->b . ∀ e::a . $\forall$ xs::[a] . elem e xs $\Rightarrow$ elem (f e) (map f xs)

Antes que nada, ¿qui´en es $P ?$

¿En qu´e estructura vamos a hacer inducci´on?

$P ( \mathfrak { y s } ) = \forall$ f::a->b . ∀ e::a . elem e ys $\Rightarrow$ elem (f e) (map f ys)

Tenemos:

elem :: Eq a $\Rightarrow$ a $- >$ [a] -> Bool $\left\{ \tt E O \right\}$ elem e [] $=$ False $\{ \mathtt { E 1 } \}$ elem e $( { \bf { x } } : { \bf { x } } { \bf { s } } ) = ( { \bf { e } } \ = { \bf { x } } )$ || elem e xs map :: (a -> b) => [a] -> [b] $\{ \mathtt { M O } \}$ map f $\left[ \begin{array} { l l l } \end{array} \right] ~ = ~ \left[ \begin{array} { l l l } \end{array} \right]$ $\{ \mathtt { M } 1 \}$ map f (y:ys) = f y : map f ys

Podemos usar:

{Congruencia $\scriptstyle = = \left. \begin{array} { r l } \end{array} \right\}$ ∀ f::a->b . ∀ x::a . $\forall$ y::a . x == y ⇒ f x == f y

Sabemos que valen Eq a y Eq b. Queremos ver que, para toda lista ys, vale:

∀ f::a->b . ∀ e::a . elem e ys $\Rightarrow$ elem (f e) (map f ys)

Seguimos en el pizarr´on.

Dadas las siguientes definiciones:   
length :: [a] $- >$ Int   
$\{ \mathtt { L O } \}$ length $\ [ \ ] \ = \ 0$   
$\{ \mathtt { L 1 } \}$ length $\mathbf { \left( x : x s \right) \ = \ 1 \ + \ \left( 1 e n g t h \ x s \right) }$

$\mathtt { f o l d 1 } \ : : \ ( { \mathtt { b } } \ \to \ { \mathtt { a } } \ \to \ { \mathtt { b } } ) \ \to \ { \mathtt { b } } \ \to \ [ { \mathtt { a } } ] \ \to \ { \mathtt { b } }$ $\left\{ \mathbf { F } 0 \right\}$ foldl f ac $\left[ \begin{array} { l l } { \mathbf { \bar { \mathbf { \Lambda } } } } \end{array} \right] \mathbf { \Lambda } = \mathbf { \Lambda }$ ac $\{ \mathtt { F } 1 \}$ foldl f ac $\mathbf { \delta } ( \mathbf { x } : \mathbf { x } \mathbf { s } ) \ = \ \mathbf { f } { \mathrm { o 1 d 1 } } \ \mathbf { f } \ \mathbf { \delta } ( \mathbf { f } { \mathrm { ~ \ a c ~ \ x } } )$ xs reverse :: [a] $- >$ [a] $\{ { \tt R } \}$ reverse $=$ foldl (flip (:)) [] flip :: (a -> b -> c) -> (b -> a -> c) $\{ \mathtt { F L } \}$ flip f $\texttt { x y } = \texttt { f }$ y x

Queremos probar que: $\forall$ ys::[a] . length ys $=$ length (reverse ys) ...que, por reverse, es lo mismo que:

$\forall$ ys::[a] . length ys = length (foldl (flip (:)) [] ys)

Avancemos hasta que nos trabemos.

P(ys) = length ys = length (foldl (flip (:)) [] ys)

En el caso inductivo $\left( \mathbf { y } \mathbf { s } \ = \ \mathbf { x } : \mathbf { x } \mathbf { s } \right)$ nuestra Hip´otesis Inductiva es:

length xs = length (foldl (flip (:)) [] xs)

Pero lo que necesitamos es:

1 + length xs = length (foldl (flip (:)) (x:[]) xs)

¿Qu´e podemos hacer?

Respuesta: demostrar una propiedad m´as general.

Probemos: $\forall$ ys::[a]. $\forall$ zs::[a].length zs $+ .$ length ys $=$ length (foldl (flip (:)) zs ys)

flipTake :: [a] -> Int -> [a]   
$\{ \mathtt { F T } \}$ flipTake $=$ foldr (\x rec n -> if $\mathtt { n } = = 0$ then [] else x : rec (n-1)) (const [])   
Dada esta versi´on alternativa con recursi´on expl´ıcita:   
take’ :: [a] -> Int -> [a]   
$\left\{ \mathrm { T 0 } \right\}$ take’ [] = []   
$\{ \mathtt { T } 1 \}$ take’ (x:xs) $\mathrm { ~ \textbar ~ { ~ n ~ } ~ } =$ if $\mathtt { n } = = 0$ then [] else x : take’ xs (n-1)   
¿Podemos probar que take’ $=$ flipTake?

Tenemos:

take’ :: [a] -> Int -> [a]   
$\left\{ \mathrm { T 0 } \right\}$ take’ [] $\mathrm { ~ \underline { ~ } { ~ } ~ } = \mathrm { ~ \underline { ~ } { ~ } { ~ } ~ } [ ]$   
$\{ \mathtt { T } 1 \}$ take’ (x:xs) ${ \mathrm { ~ n ~ } } = { \mathrm { ~ i f ~ } }$ $\mathtt { n } = = 0$ then [] else x : take’ xs (n-1)   
flipTake :: [a] $- >$ Int -> [a]   
$\{ \mathtt { F T } \}$ flipTake $=$ foldr (\x rec n $- >$ if $\mathtt { n } = = 0$ then [] else x : rec (n-1)) (const [])   
foldr :: (a -> b -> b) -> b -> [a] -> b   
$\left\{ \ F 0 \right\}$ foldr $\texttt { f z } \left[ \begin{array} { l } { } \\ { } \end{array} \right] = \texttt { z }$   
$\{ \mathtt { F } 1 \}$ foldr f $_ { z }$ $\mathbf { \chi } _ { \mathbf { x } : \mathbf { x } \mathbf { s } } ^ { } ) ~ = { \textbf { f } } ~ \mathbf { x }$ (foldr f z xs)   
const :: (a -> b -> a)   
$\{ { \tt C } \}$ const $= ( \backslash \mathrm { \bf ~ x ~ } - > \backslash _ { - } - > \mathrm { \bf ~ x } )$

Probemos que take $^ { \circ } =$ flipTake.

Dadas las siguientes funciones:   
cantNodos :: AB a $- >$ Int   
$\{ { \tt C N O } \}$ cantNodos $\mathbb { N } \mathrm { i } 1 ~ = ~ 0$   
$\{ \mathtt { C N 1 } \}$ cantNodos (Bin $. \textbf { r d } = \textbf { 1 } +$ (cantNodos i) $^ +$ (cantNodos d)   
inorder :: AB a $- >$ [a]   
$\left\{ \tt T O \right\}$ inorder $\mathbb { N } \mathrm { i } 1 ~ = ~ \left[ \begin{array} { r l r l } \end{array} \right]$   
$\{ \mathtt { I } 1 \}$ inorder (Bin i r d) $=$ (inorder i) $^ { + + }$ (r:inorder d)   
length :: [a] $- >$ Int   
$\{ \mathtt { L O } \}$ length $\ [ \ ] \ = \ 0$   
$\{ \mathtt { L 1 } \}$ length $\mathbf { \left( x : x s \right) \ = \ 1 \ + \ ( 1 e n g t h \ x s ) }$

Queremos probar:

∀ t::AB a . cantNodos t $=$ length (inorder t)

¡Necesitamos un lema!

∀ xs::[a] . ∀ ys::[a] . length (xs++ys) $=$ length xs $^ +$ length ys

# Una propiedad sobe ´arboles... y un lema sobre listas

Ahora s´ı:

cantNodos :: AB a $- >$ Int   
$\{ { \tt C N O } \}$ cantNodos $\mathbb { N } \mathrm { i } 1 ~ = ~ 0$   
$\{ \mathtt { C N 1 } \}$ cantNodos (Bin i $\textbf { r } { \dot { \textbf { d } } } = \textbf { 1 } +$ (cantNodos i) $^ +$ (cantNodos d)   
inorder :: AB a $- >$ [a]   
$\left\{ \tt T O \right\}$ inorder $\mathbb { N } \mathrm { i } 1 ~ = ~ \left[ \begin{array} { r l r l } \end{array} \right]$   
$\{ \mathtt { I } 1 \}$ inorder (Bin i r d) $=$ (inorder i) $^ { + + }$ (r:inorder d)   
length :: [a] $- >$ Int   
$\{ \mathtt { L O } \}$ length $\ [ \ ] \ = \ 0$   
$\{ \mathtt { L 1 } \}$ length $\mathbf { \left( x : x s \right) } ~ = ~ 1 ~ + ~ \mathbf { \left( 1 e n g t h { \begin{array} { l } { x s } \end{array} } \right) }$

Lema: $\forall$ xs::[a] . $\forall$ ys::[a] . length (xs++ys) $=$ length xs $^ +$ length ys Queremos probar:

∀ t::AB a . cantNodos t $=$ length (inorder t)

¡No nos olvidemos de probar el lema!

$( + + )$ :: [a] -> [a] -> [a] $\{ { \mathsf { C } } 0 \} ~ [ ] ~ + + ~ { \mathsf { y } } { \mathsf { s } } ~ = ~ { \mathsf { y } } { \mathsf { s } }$ $\{ { \tt C } 1 \}$ (x:xs) ++ ys = x : (xs ++ ys)

length :: [a] $- >$ Int   
$\{ \mathtt { L O } \}$ length $\ [ \ ] \ = \ 0$   
$\{ \mathtt { L 1 } \}$ length $\mathbf { \left( x : x s \right) \ = \ 1 \ + \ \left( 1 e n g t h \ x s \right) }$

Lema: $\forall$ xs::[a] . $\forall$ ys::[a] . length (xs++ys) $=$ length xs $^ +$ length ys

Si quisi´eramos demostrar una propiedad sobre el tipo ´Arbol23 a b mediante inducci´on estructural:

data ´Arbol23 a b $=$ Hoja a | Dos b (´Arbol23 a b) (´Arbol23 a b) | Tres b b (´Arbol23 a b) (´Arbol23 a b) (´Arbol23 a b)

Para demostrar que vale ∀ q::´Arbol23 a b . $P ( { \mathfrak { q } } )$ :

¿Cu´al es o cu´ales son los casos base? ¿Cu´al es o cu´ales son los casos inductivos? $\therefore Y \mid \mathsf { a } ( \mathsf { s } )$ hip´otesis inductiva(s)?

“Ejemplo de inducci´on estructural con implicaci´on” Disponible en la secci´on Util´ del campus.

¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?