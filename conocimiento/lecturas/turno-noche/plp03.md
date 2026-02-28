# Paradigmas de Programaci´on

Razonamiento ecuacional Inducci´on estructural

2do cuatrimestre de 2025 Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

Introducci´on

Inducci´on estructural

Extensionalidad

Isomorfismos de tipos

Casos de estudio

$$
2
$$

# Motivaci´on

Queremos demostrar que ciertas expresiones son equivalentes. ¿Para qu´e?

Para justificar que un algoritmo es correcto

Por ejemplo, si logramos demostrar que:

∀xs :: [Int]. quickSort xs = insertionSort xs esto nos da confianza relativa de un algoritmo con respecto al otro

Para posibilitar optimizaciones

¿Siempre es correcto hacer las siguientes optimizaciones?

f x + f x ⇝ 2 \* f x map f (map g xs) ⇝ map (f . g) xs

En un lenguaje funcional s´ı.

En un lenguaje imperativo no, ya que f y g pueden tener efectos.

# Hip´otesis de trabajo

Para razonar sobre equivalencia de expresiones vamos a asumir:

1. Que trabajamos con estructuras de datos finitas.

T´ecnicamente: con tipos de datos inductivos.

2. Que trabajamos con funciones totales.

Las ecuaciones deben cubrir todos los casos.   
La recursi´on siempre debe terminar.

3. Que el programa no depende del orden de las ecuaciones.

$$
4
$$

vacia [] $=$ True vacia [] $=$ True ⇝ vacia _ $=$ False vacia (_ : _) = False

Relajar estas hip´otesis es posible pero m´as complejo.

# Igualdades por definici´on

# Principio de reemplazo

Sea e1 = e2 una ecuaci´on incluida en el programa. Las siguientes operaciones preservan la igualdad de expresiones:

1. Reemplazar cualquier instancia de e1 por e2.   
2. Reemplazar cualquier instancia de e2 por e1.

Si una igualdad se puede demostrar usando s´olo el principio de reemplazo, decimos que la igualdad vale por definici´on.

Ejemplo: principio de reemplazo

Le damos nombre a las ecuaciones del programa:

sucesor :: Int -> Int {SUC} sucesor n = n + 1

sucesor (factorial 10) + 1 = (factorial 10 + 1) + 1 por SUC = sucesor (factorial 10 + 1) por SUC

5

# Igualdades por definici´on

# Ejemplo: principio de reemplazo

$$
\begin{array} { l c l } { { \mathrm { \bf ~ l e n g t h } } } & { { \mathrm { \bf ~ [ ] } } } & { { = ~ 0 } } \\ { { \mathrm { \bf ~ l e n g t h } ~ \mathrm { \bf ~ ( \underline { ~ } { ~ \bf ~ \cdot ~ } ~ { \bf ~ x s } ) } ~ = ~ 1 ~ + ~ \mathrm { \bf ~ l e n g t h } ~ { \bf ~ x s } } } \\ { { \mathrm { \bf ~ s u m a } ~ \mathrm { \bf ~ [ ] } } } & { { = ~ 0 } } \\ { { \mathrm { \bf ~ s u m a } ~ \mathrm { \bf ~ ( \bf ~ x ~ : ~ \ x s ) } ~ = ~ { \bf ~ x } ~ + ~ \mathrm { \bf ~ s u m a } ~ { \bf ~ x s } } } \end{array}
$$

Veamos que length ["a", "b"] = suma [1, 1]:

length ["a", "b"]   
1 + length ["b"] por L1   
1 + (1 + length []) por L1   
1 + (1 + 0) por L0   
1 + (1 + suma []) por S0   
1 + suma [1] por S1   
= suma [1, 1] por S1

Introducci´on

Inducci´on estructural

Extensionalidad

Isomorfismos de tipos

Casos de estudio

7

# Inducci´on sobre booleanos

El principio de reemplazo no alcanza para probar todas las equivalencias que nos interesan.

# Ejemplo

{NT} not True $=$ False {NF} not False $=$ True

¿Podemos probar $\forall \mathbf { x }$ :: Bool. not (not x) = x?

El problema es que la expresi´on

est´a “trabada”: no se puede aplicar ninguna ecuaci´on.

# Inducci´on sobre booleanos

# Principio de inducci´on sobre booleanos

Si P(True) y P(False) entonces $\forall \mathbf { x }$ :: Bool. ${ \mathcal { P } } ( { \mathbf { x } } )$

# Ejemplo

{NT} not True $=$ False {NF} not False $=$ True

Para probar ∀x :: Bool. not (not x) = x basta probar:

1. not (not True) $=$ True.

not (not True) = not False = True ↑ ↑ NT NF

2. not (not False) $=$ False.

not (not False) = not True = False ↑ ↑ NF NT

# Inducci´on sobre pares

Cada tipo de datos tiene su propio principio de inducci´on.

# Ejemplo

$$
\begin{array} { l l l l } { { \{ \mathrm { F S T } \} } } & { { \mathrm { f s t ~ ( x , \Omega _ { - } ) ~ \mathrm { ~ \Omega ~ = ~ x ~ } ~ } } } & { { \mathrm { ~ \Omega ~ } } } \\ { { \{ \mathrm { S N D } \} } } & { { \mathrm { s n d ~ ( \Omega _ { - } , \Omega _ { \mathrm { ~  ~ } } ) ~ \mathrm { ~ \Omega ~ = ~ y ~ } ~ } } } & { { \mathrm { ~ \Omega ~ } } } \\ { { \{ \mathrm { S W A P } \} } } & { { \mathrm { s w a p ~ ( x , \Omega _ { \mathrm { ~ , ~  ~ } } y ) ~ = ~ ( y , \Omega _ { \mathrm { ~  ~ } } ) ~ } } } & { { \mathrm { ~ \Omega ~ } } } \end{array}
$$

¿Podemos probar ∀p :: (a, b). fst p = snd (swap p)?

Las expresiones (fst p) y (snd (swap p)) est´an “trabadas”

# Inducci´on sobre pares

# Principio de inducci´on sobre pares

Si ∀x :: a. ∀y :: b. P((x, y)) entonces ∀p :: (a, b). ${ \mathcal { P } } ( { \mathfrak { p } } )$ .

# Ejemplo

{FST} fst (x, _) = x {SND} snd (_, y) = y {SWAP} swap (x, y) = (y, x)

Para probar ∀p :: (a, b). fst $\mathtt { p } \ =$ snd (swap p) basta probar:

∀x :: a. ∀y :: b. fst (x, y) = snd (swap (x, y))   
fst (x, y) = x = snd (y, x) = snd (swap (x, y)) ↑ ↑ ↑ FST SND

# Inducci´on sobre naturales

# 12

data Nat $=$ Zero | Suc Nat

# Principio de inducci´on sobre naturales

Si P(Zero) y ∀n :: Nat. ( P(n) ⇒ P(Suc n) ), | {z }hip´otesis inductiva | {z }tesis inductiva entonces ∀n :: Nat. ${ \mathcal { P } } ( { \mathfrak { n } } )$ .

# Inducci´on sobre naturales

# Ejemplo

{S0} suma Zero m = m {S1} suma (Suc n) m = Suc (suma n m)

Para probar ∀n :: Nat. suma n Zero = n basta probar:

1 suma Zero Zero = Zero. Inmediato por S0.

2 suma n Zero = n ⇒ suma (Suc n) Zero = Suc n. {zH.I. {zT.I.

suma (Suc n) Zero = Suc (suma n Zero) = Suc n ↑ ↑ S1 H.I.

# Inducci´on estructural

En el caso general, tenemos un tipo de datos inductivo:

data T = CBase1 ⟨par´ametros⟩ | CBasen ⟨par´ametros⟩ | CRecursivo1 ⟨par´ametros⟩ | CRecursivom ⟨par´ametros⟩

# Principio de inducci´on estructural

Sea $\mathcal { P }$ una propiedad acerca de las expresiones tipo T tal que:

▶ $\mathcal { P }$ vale sobre todos los constructores base de T, ▶ $\mathcal { P }$ vale sobre todos los constructores recursivos de T, asumiendo como hip´otesis inductiva que vale para los par´ametros de tipo T, entonces $\forall \mathbf { x }$ :: T. ${ \mathcal { P } } ( { \mathbf { x } } )$ .

# Inducci´on estructural

# Ejemplo: principio de inducci´on sobre listas

data [a] = [] | a : [a] Sea $\mathcal { P }$ una propiedad sobre expresiones de tipo [a] tal que:

P([]) ∀x :: a. ∀xs :: [a]. (P(xs) ⇒ P(x : xs)) {zH.I. {z T.I.

Entonces ∀xs :: [a]. P(xs).

Ejemplo: principio de inducci´on sobre ´arboles binarios

data AB a $=$ Nil | Bin (AB a) a (AB a) Sea $\mathcal { P }$ una propiedad sobre expresiones de tipo AB a tal que:

▶ P(Nil) ▶ ∀i :: AB a. ∀r :: a. ∀d :: AB a. $( \underbrace { ( \mathcal { P } ( \mathrm { i } ) \wedge \mathcal { P } ( \mathrm { d } ) ) } _ { \mathrm { H . l . } } \Rightarrow \underbrace { \mathcal { P } ( \mathtt { B i n } \mathrm { ~ i ~ } \mathrm {  ~ r ~ } \mathrm { \ d } ) } _ { \mathrm { T . l . } } )$

Entonces $\forall \mathbf { x }$ :: AB a. ${ \mathcal { P } } ( { \mathbf { x } } ) .$

# Inducci´on estructural

Ejemplo: principio de inducci´on sobre polinomios data Poli a = X | Cte a | Suma (Poli a) (Poli a) | Prod (Poli a) (Poli a)

Sea $\mathcal { P }$ una propiedad sobre expresiones de tipo Poli a tal que:

▶ P(X)   
▶ ∀k :: a. P(Cte k) ▶ ∀p :: Poli a. ∀q :: Poli a. $\begin{array} { r } { \underset { \mathbb { H } . 1 . \mathbb { H } . 1 . \mathbb { H } . 1 . } { ( \underbrace { \left( \mathcal { P } ( \mathfrak { p } ) \wedge \mathcal { P } ( \mathfrak { q } ) \right) } } \Rightarrow \underset { \mathbb { T } . 1 . } { \underbrace { \mathcal { P } ( \mathtt { S u m a } \texttt { p } \mathfrak { q } ) } } ) } \\ { * \forall \mathfrak { p } : : \mathtt { P o l i a . } \forall \mathfrak { q } : : \mathtt { P o l i a . } \ a . } \end{array}$ $( \underbrace { ( \mathcal { P } ( \mathfrak { p } ) \wedge \mathcal { P } ( \mathfrak { q } ) ) } _ { \mathrm { H . l . } } \Rightarrow \underbrace { \mathcal { P } ( \mathtt { P r o d } \texttt { p } \mathfrak { q } ) } _ { \mathrm { T . l . } } )$   
Entonces $\forall \mathbf { x }$ :: Poli a. ${ \mathcal { P } } ( { \mathbf { x } } )$ .

# 16

# Ejemplo: inducci´on sobre listas

$$
\begin{array} { l l l l } { \texttt { m a p  f } [ ] } & { = } & { [ ] } \\ { \texttt { m a p  f } ( \texttt x : \texttt { x s } ) } & { = \texttt { f x : \texttt { m a p f } x s } } \\ { [ ] } & { + + \texttt { y s } = } & { \texttt y \texttt { s } } \\ { ( \texttt x : \texttt { x s } ) } & { + + \texttt { y s } = \texttt { x : \texttt { ( x s + \texttt { y s } ) } } } \end{array}
$$

Propiedad. Si f :: a -> b, xs :: [a], ys :: [a], entonces:

map f (xs ++ ys) = map f xs ++ map f ys

Por inducci´on en la estructura de xs, basta ver:

1. Caso base, P([]).   
2. Caso inductivo, ∀x :: a. ∀xs :: [a]. (P(xs) ⇒ P(x : xs)).   
con ${ \mathcal { P } } ( \mathbf { x } \mathbf { s } ) : \equiv ( \mathrm { m a p }$ f (xs ++ ys) = map f xs ++ map f ys).

$$
^ { 1 7 }
$$

# Ejemplo: inducci´on sobre listas

Caso base:

map f ([] ++ ys) = map f ys por A0 = [] ++ map f ys por A0 = map f [] ++ map f ys por M0

Caso inductivo:

map f ((x : xs) ++ ys)   
= map f (x : (xs ++ ys)) por A1 f x : map f (xs ++ ys) por M1   
= f x : (map f xs ++ map f ys) por H.I.   
= (f x : map f xs) ++ map f ys por A1   
= map f (x : xs) ++ map f ys por M1

# Ejemplo: relaci´on entre foldr y foldl

Propiedad. Si f :: a -> b -> b, z :: b, xs :: [a], entonces:

fold erse xs)

$$
\frac { \texttt { l f z x s } = \texttt { f o l d l } \texttt { ( f l i p f ) z } \texttt { ( r e v } } { \mathcal { P } \texttt { ( x s ) } }
$$

Por inducci´on en la estructura de xs. El caso base P([]) es f´acil. Caso inductivo, ∀x :: a. ∀xs :: [a]. $( \mathcal { P } ( \bf { x } { \bf { s } } ) \Rightarrow \mathcal { P } ( \bf { x } _ { \alpha } : \lambda { \bf { x } } { \bf { s } } ) ) \colon$ :

foldr f z (x : xs) f x (foldr f z xs) (Def. foldr)   
$=$ f x (foldl (flip f) z (reverse xs)) (H.I.)   
$=$ flip f (foldl (flip f) z (reverse xs)) x (Def. flip)   
$=$ foldl (flip f) z (reverse xs ++ [x]) (???)   
$=$ foldl (flip f) z (reverse (x : xs)) (Def. reverse

Para justificar el paso faltante (???), se puede demostrar: Lema. Si g :: b -> a -> b, z :: b, x :: a, xs :: [a], entonces:

# Lemas de generaci´on

Usando el principio de inducci´on estructural, se puede probar:

Lema de generaci´on para pares

Si p :: (a, b), entonces ∃x :: a. ∃y :: b. p = (x, y).

data Either a b = Left a | Right b

Lema de generaci´on para sumas

Si e :: Either a b, entonces:

▶ o bien ∃x :: a. e = Left x ▶ o bien ∃y :: b. e = Right y

Introducci´on

# 21

Inducci´on estructural

Extensionalidad

Isomorfismos de tipos

Casos de estudio

# Puntos de vista intensional vs. extensional

¿Vale la siguiente equivalencia de expresiones?

quickSort $=$ insertionSort

Depende del punto de vista:

# Punto de vista intensional.

(va con “s”)

Dos valores son iguales si est´an construidos de la misma manera.

# Punto de vista extensional.

Dos valores son iguales si son indistinguibles al observarlos.

# Ejemplo

quickSort e insertionSort

no son intensionalmente iguales;

s´ı son extensionalmente iguales: computan la misma funci´on.

Principio de extensionalidad funcional

Sean f, g :: a -> b.

Propiedad inmediata

Si f = g entonces (∀x :: a. f $\textbf { x } = \textbf { g } \textbf { x } )$ .

Principio de extensionalidad funcional

Si (∀x :: a. f $\textbf { x } = \textbf { g } \textbf { x } )$ entonces $\mathbf { f } ~ = ~ \mathbf { g }$

# Principio de extensionalidad funcional

Ejemplo: extensionalidad funcional {I} id x = x {S} swap (x, y) = (y, x)

Veamos que swap . swap $=$ id :: (a, b) -> (a, b). Por extensionalidad funcional, basta ver:

∀p :: (a, b). (swap . swap) p = id p

Por inducci´on sobre pares, basta ver:

∀x :: a. ∀y :: b. (swap . swap) (x, y) = id (x, y)

En efecto:

(swap . swap) (x, y) swap (swap (x, y)) (por C) swap (y, x) (por S)   
= (x, y) (por S)   
= id (x, y) (por I)

# Resumen: razonamiento ecuacional

Razonamos ecuacionalmente usando tres principios:

# 1. Principio de reemplazo

Si el programa declara que e1 = e2, cualquier instancia de e1 es igual a la correspondiente instancia de e2, y viceversa.

# 2. Principio de inducci´on estructural

Para probar $\mathcal { P }$ sobre todas las instancias de un tipo T, basta probar $\mathcal { P }$ para cada uno de los constructores (asumiendo la H.I. para los constructores recursivos).

# 3. Principio de extensionalidad funcional

Para probar que dos funciones son iguales, basta probar que son iguales punto a punto.

# Correcci´on del razonamiento ecuacional

Supongamos que logramos demostrar que e1 = e2. ¿Qu´e nos asegura eso sobre e1 y e2?

Cuidado: no necesariamente resultan en el mismo “dato” Por ejemplo, se puede demostrar que extensionalmente:

pero quickSort e insertionSort son “datos” diferentes.

Son c´odigos distintos que representan la misma funci´on matem´atica.

Correcci´on con respecto a observaciones

Si demostramos e1 = e2 :: A, entonces:

obs e1 ⇝ True si y s´olo si obs e2 ⇝ True para toda posible “observaci´on” obs :: A -> Bool.

# Demostraci´on de desigualdades

¿C´omo demostramos que no vale una igualdad e1 = e2 :: A?

Por la contrarrec´ıproca de la anterior, basta con encontrar una observaci´on obs :: A -> Bool que las distinga.

# Ejemplo

Demostrar que no vale la igualdad:

id $=$ swap :: (Int, Int) -> (Int, Int)

obs :: ((Int, Int) -> (Int, Int)) -> Bool obs f = fst (f (1, 2)) == 1

$$
^ { 2 7 }
$$

Introducci´on

Inducci´on estructural

Extensionalidad

Isomorfismos de tipos

Casos de estudio

$$
^ { 2 8 }
$$

# Misma informaci´on, distinta forma

¿Qu´e relaci´on hay entre los siguientes valores?

("hola", (1, True)) :: (String, (Int, Bool)) ((True, "hola"), 1) :: ((Bool, String), Int)

Representan la misma informaci´on, pero escrita de distinta manera.

Podemos transformar los valores de un tipo en valores del otro:

f :: (String, (Int, Bool)) -> ((Bool, String), Int) f (s, (i, b)) = ((b, s), i)

g :: ((Bool, String), Int) -> (String, (Int, Bool)) g ((b, s), i) = (s, (i, b))

Se puede demostrar que:

# Isomorfismos de tipos

# Definici´on

Decimos que dos tipos de datos A y B son isomorfos si:

1. Hay una funci´on f :: A -> B total.   
2. Hay una funci´on g :: B -> A total.   
3. Se puede demostrar que g . f = id :: A -> A.   
4. Se puede demostrar que f . g = id :: B -> B.

Escribimos A ≃ B para indicar que A y B son isomorfos.

# Ejemplo de isomorfismo: currificaci´on

# Ejemplo

Veamos que ((a, b) $\Sigma > \mathtt { c } ) \simeq ( \mathtt { a } \to \mathtt { b } \to \mathtt { c } ) .$

curry :: ((a, b) -> c) -> a -> b -> c curry f x y = f (x, y)

uncurry :: (a -> b -> c) -> (a, b) -> c uncurry f (x, y) = f x y

# Ejemplo de isomorfismo: currificaci´on

Veamos que   
uncurry . curry = id :: ((a, b) -> c) -> (a, b) ->   
Por extensionalidad funcional, basta ver que si f :: (a, b) ->   
(uncurry . curry) f = id f :: (a, b) -> c   
Por extensionalidad funcional, basta ver que si p :: (a, b):   
(uncurry . curry) f p = id f p :: c   
Por inducci´on sobre pares, basta ver que si x :: a, y :: b:   
(uncurry . curry) f (x, y) = id f (x, y) :: c   
En efecto:

(uncurry . curry) f (x, y) uncurry (curry f) (x, y) (Def. (.)) curry f x y (Def. uncurry) = f (x, y) (Def. curry) id f (x, y) (Def. id)

(Y vale tambi´en curry . uncurry = id).

# M´as isomorfismos de tipos

Introducci´on

Inducci´on estructural

Extensionalidad

Isomorfismos de tipos

Casos de estudio

$$
3 4
$$

# Ejemplo — Necesidad de usar lemas auxiliares

Asumimos las definiciones usuales para (.) y (++) y la siguiente para reverse:

$\{ { \tt R O } \}$ reverse [] = [] {R1} reverse (x : xs) $=$ reverse xs ++ [x]

Consideremos adem´as la siguiente definici´on:

ceros :: [a] -> [Int]   
{Z0} ceros [] = []   
{Z1} ceros (_ : xs) = 0 : ceros xs

Demostremos que ceros . reverse $=$ reverse . ceros.

# ¿Qu´e ocurre?

Necesitamos un lema auxiliar:

∀xs ys :: [a]. ceros (xs ++ ys) $=$ ceros xs ++ ceros ys

# Ejemplo — Necesidad de generalizar el predicado inductivo

Consideremos la siguiente definici´on, usando recursi´on iterativa:

suma :: Int -> [Int] -> Int {S0} suma k [] = k {S1} suma k (x : xs) = suma (x + k) xs

Demostremos que para k :: Int y xs :: [Int] vale:

suma k (xs ++ ys) $=$ suma (suma k xs) ys

# ¿Qu´e ocurre?

Necesitamos generalizar el predicado inductivo de $\mathcal { P }$ a Q:

P(xs) ≡ suma k (xs ++ ys) = suma (suma k xs) ys

Q(xs) ≡ ∀k’ :: Int. suma k’ (xs ++ ys) = suma (suma k’ xs) ys

# Ejemplo — Necesidad de generalizar el predicado inductivo

Definimos funciones para acumular una lista, usando recursi´on iterativa y estructural:

$\{ \mathtt { L O } \}$ acumL k [] $= ~ [ ]$ {L1} acumL k (x : xs) = (x + k) : acumL (x + k) xs $\{ { \tt R O } \}$ $\begin{array}{c} \begin{array} { l } { { \mathrm { a c u m R } } } \\ { { \mathrm { a c u m R } } } \end{array} { \left[ \begin{array} { l l } { { \mathrm {  ~ \ l s ~ \unboldmath } } } & { { = } } \end{array} \begin{array} { l } { { \mathrm {  ~ \ l ~ \unboldmath } } } \\ { { \mathrm {  ~ \ l s ~ \unboldmath } } } \end{array} \right] } { \mathrm {  ~ \ c a c u m R ~ \ t \ t \ t \ t \ t \ t \ t \ t \ t \ t \ t \ t } }  \end{array}$ {R cumR xs)

Demostremos que acumL $0 \ =$ acumR.

# ¿Qu´e ocurre?

Necesitamos generalizar el predicado inductivo de $\mathcal { P }$ a Q:

P(xs) ≡ acumL 0 xs = acumR xs

Q(xs) ≡ ∀k :: Int. acumL k xs = map (+ k) (acumR xs)

(La demostraci´on completa requiere algunos lemas auxiliares m´as).

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

# Lectura recomendada

# Cap´ıtulo 6 del libro de Bird.

Richard Bird. Thinking functionally with Haskell Cambridge University Press, 2015.