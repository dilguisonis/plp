# Práctica No 2 - Razonamiento ecuacional e inducción estructural

Para resolver esta práctica se recomienda tener a mano las soluciones de los ejercicios de la práctica 1, así como también los apuntes de las clases teóricas y prácticas de Programación Funcional.

En las demostraciones por inducción estructural, justique todos los pasos: por qué axioma, por qué lema, por qué puede aplicarse la hipótesis inductiva, etc. Es importante escribir el esquema de inducción, planteando claramente los casos base e inductivos, e identicando la hipótesis inductiva y la tesis inductiva.

El alcance de todos los cuanticadores que se utilicen debe estar claramente denido (si no hay paréntesis, se entiende que llegan hasta el nal).

Demuestre todas las propiedades auxiliares (lemas) que utilice.

Los ejercicios marcados con el símbolo $\star$ constituyen un subconjunto mínimo de ejercitación. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

# Extensionalidad y lemas de generación

# Ejercicio 1 ⋆

Sean las siguientes deniciones de funciones:

- intercambiar $( { \bf x } , { \bf y } ) \ = \ ( { \bf y } , { \bf x } )$ - espejar (Left x) = Right $\mathtt { x }$ espejar (Right $\mathtt { x }$ ) $=$ Left $\mathtt { x }$ - asociarI $( { \bf x } , ( { \bf y } , { \bf z } ) ) = ( ( { \bf x } , { \bf y } ) , { \bf z } )$

$$
\begin{array} { l l l l l } { - } & { \mathbf { a s o c i a r D } } & { ( ( \mathbf { x } , \mathbf { y } ) , \mathbf { z } ) ) } & { = } & { ( \mathbf { x } , ( \mathbf { y } , \mathbf { z } ) ) } \\ { - } & { \mathbf { f l i p } \texttt { f x y } } & { \mathbf { y } \texttt { = f y x } } \\ { - } & { \mathbf { c u r r y } \texttt { f x y } } & { = \texttt { f } ( \mathbf { x } , \mathbf { y } ) } \\ { - } & { \mathbf { u n c u r r y } \texttt { f } ( \mathbf { x } , \mathbf { y } ) } & { = \texttt { f x y } } \end{array}
$$

Demostrar las siguientes igualdades usando los lemas de generación cuando sea necesario:

i. $\forall \ \mathtt { p } : : ( \mathtt { a } , \mathtt { b } )$ . intercambiar (intercambiar ${ \mathfrak { p } } ) = { \mathfrak { p } }$   
ii. $\forall \mathtt { p } : : ( \mathtt { a } , ( \mathtt { b } , \mathtt { c } ) )$ . asociarD (asociarI p) = p   
iii. $\forall \ : \mathtt { p }$ ::Either a b . espejar (espejar p) = p   
iv. ∀ f::a->b->c . ∀ x::a . ∀ y::b . flip (flip f) $\texttt { x y } = \texttt { f x y }$   
v. ∀ f::a->b->c . ∀ x::a . ∀ y::b . curry (uncurry f) $\texttt { x y } = \texttt { f x y }$

# Ejercicio $\mathbf { 2 } ~ \star$

Demostrar las siguientes igualdades utilizando el principio de extensionalidad funcional:

i. flip . $\mathtt { f } 1 \mathtt { i p } = \mathtt { i d }$   
ii. $\forall ~ \mathbf { f } : : ( \mathtt { a } , \mathtt { b } )  \mathtt { c }$ . uncurry (curry f) = f   
iii. flip const $=$ const id   
iv. $\begin{array} { r l } & { \forall \textup { f } \colon \colon \colon \mathsf { a } \mathrm { - } > \flat \ \cdot \forall \ \mathsf { g } \colon \colon \flat \mathrm { - } > \mathsf { c } \ . \ \cdot \forall \ \mathrm { h } \colon \colon \mathsf { c } \mathrm { - } > \mathsf { d } \ \cdot \ \left( \mathrm { (  ~ h ~ \cdot ~ } \ \textup { g } ) \ \mathrm { \texttt { . } f } \right) \ = \ \mathrm { ( \mathrm { h } ~ \cdot ~ } \ \textup { ( \mathsf { g } . ~ f ) } \ ) } \\ & { \mathrm { c o n ~ l a ~ d e f i n i c i o n ~ u s u a l ~ d e ~ l a ~ c o m p o s i c i o n } \ \cdot \mathrm { ( \cdot , ~ ) } \ \textup { f } \ \mathsf { g } \ \textup { x } = \textup { f } \ \textup { ( \ ' \textup { g } x ) } . } \end{array}$

# Inducción sobre listas

En esta sección usaremos las siguientes deniciones (y las de elem, foldr, foldl, map y lter vistas en clase):

length :: [a] -> Int {L0} length $\ \left[ \begin{array} { l l } { \right] } & { = \ 0 } \end{array}$ {L1} length $\mathrm { { ( \mathbf { x } : \mathbf { x } s ) \ = \ \mathbf { 1 } \ + \ \mathbf { 1 } e n g t h \ x s } }$

duplicar :: [a] -> [a] {D0} duplicar $\begin{array} { l l } { \left[ \begin{array} { l l l } \end{array} \right] } \end{array} =  &  \left[ \begin{array} { l l l } \end{array} \right]$ {D1} duplicar $( { \bf { x } } : { \bf { x } } { \bf { s } } ) \ = \ { \bf { x } }$ : x : duplicar xs $\begin{array} { l } { { ( + + ) \quad : : \quad [ { \mathsf { a } } ] \quad - > \quad [ { \mathsf { a } } ] \quad - > \quad [ { \mathsf { a } } ] } } \\ { { \{ + + 0 \} \quad [ ] \quad + + \mathrm {  ~ \ y s ~ } = \mathrm {  ~ \ y s ~ } } } \\ { { \{ + + 1 \} \quad ( \mathrm {  ~ x : x s } ) \quad + + \mathrm {  ~ \ y s ~ } = \mathrm {  ~ x ~ } : \quad ( \mathrm { \bf x s } + + \mathrm {  ~ \ y s } ) } } \end{array}$ append :: [a] -> [a] -> [a] {A0} append xs ys $=$ foldr (:) ys xs reverse :: [a] -> [a] {R0} reverse $=$ foldl (flip (:)) []

# Ejercicio 3 ⋆

Demostrar las siguientes propiedades:

i. ∀ xs::[a] . length (duplicar xs) = 2 \* length xs   
ii. ∀ xs::[a] . $\forall$ ys::[a] . length $( \bf { x } \ l { s } + \bf { y } { s } ) \ l { \tau } = \mathrm { ~ 1 ~ }$ ength xs $^ +$ length ys   
iii. ∀ xs::[a] . ∀ x::a . [x] ++ xs = x:xs   
iv. ∀ xs::[a] . xs ++ [] = xs   
v. ∀ xs::[a] . ∀ ys::[a] . ∀ zs::[a] . (xs ++ ys) ++ zs = xs ++ (ys ++ zs)   
vi. ∀ xs::[a] . ∀ f::(a->b) . length (map f xs) $=$ length xs   
vii. ∀ xs::[a] . ∀ p::a->Bool . ∀ e::a . (elem e (filter p xs) $\Rightarrow$ elem e xs) (si vale Eq a)

# Ejercicio $^ { 4 \star }$

Demostrar las siguientes propiedades:

i. reverse $=$ foldr (\x rec -> rec ++ (x:[])) [] ii. ∀ xs::[a] . ∀ ys::[a] . reverse (xs ++ ys) = reverse ys $^ { + + }$ reverse xs iii. ∀ xs::[a] . ∀ x::a . reverse $\mathbf { \bar { x } s } \ \mathbf { \eta } + + \mathbf { \eta } \left[ \mathbf { x } \right] \mathbf { \eta } ) \ = \ \mathbf { x }$ :reverse xs

Nota: en adelante, siempre que se necesite usar reverse, se podrá utilizar cualquiera de las dos deniciones, según se considere conveniente.

# Ejercicio 5

Demostrar las siguientes propiedades utilizando inducción estructural sobre listas, lemas de generación y el principio de extensionalidad funcional.

i. reverse . reverse $=$ id ii. append $= ( + + )$ iii. map $\mathrm { i d } \ = \ \mathrm { i d }$ iv. ∀ f::a->b . ∀ g::b->c . map (g . f) = map g . map f v. ∀ f::a->b . ∀ p::b->Bool . map f . filter (p . f) $=$ filter p . map f vi. ∀ f::a->b . ∀ e::a . $\forall$ xs::[a] . (elem e xs $\Rightarrow$ elem (f e) (map f xs)) (con Eq a y Eq b) vii. ∀ xs::[a] . ∀ e::a . (elem e $\mathbf { x s } \Rightarrow \textsf { e }$ $\leq$ maximum xs) (si vale Ord a), donde: maximum :: Ord a $= >$ [a] -> a {M0} maximum $[ \mathbf { x } ] ~ = ~ \mathbf { x }$ {M1} maximum (x:y:xs) = max x (maximum (y:xs))

Ayuda: usar $\forall \mathtt { w } : : \mathtt { m t }$ . ∀ x::Int . ∀ y::Int . ∀ z::Int . w ≤ x ∧ y ≤ z ⇒ max w $\textrm { y } \leq$ max x z

# Ejercicio $\textbf { 6 } \star$

Dadas las siguientes funciones:

zip :: [a] -> [b] -> [(a,b)] {Z0} zip $=$ foldr (\x rec ys -> if null ys then [] else (x, head ys) : rec (tail ys)) (const [])

$\mathbf { z i p } ^ { \prime } : : [ \mathbf { a } ] \ - > [ \mathbf { b } ] \ - > [ ( \mathbf { a } , \mathbf { b } ) ]$   
{Z'0} zip' [] $\tt y s = \tt [ \tt ]$   
{Z'1} zip' (x:xs) $\mathrm { ~ y ~ s ~ } = \mathrm { ~ i f ~ }$ null ys then [] else (x, head ys):zip' xs (tail ys)

Demostrar que $\mathsf { z i p } = \mathsf { z i p } ^ { \mathsf { , } }$ utilizando inducción estructural y el principio de extensionalidad.

# Ejercicio 7 ⋆

Dadas las siguientes funciones:

nub :: Eq a $= >$ [a] -> [a]   
{N0} nub $\begin{array} { l l } { \left[ \begin{array} { l l l } \end{array} \right] } \end{array} =  &  \left[ \begin{array} { l l l } \end{array} \right]$   
{N1} nub $( { \bf { x } } : { \bf { x } } { \bf { s } } ) \ = \ { \bf { x } }$ : filter (\y -> x /= y) (nub xs)

union :: Eq a $= >$ [a] -> [a] -> [a] {U0} union xs ys $=$ nub ( $\bf { \sigma } _ { x s + + y s } ,$ )

intersect :: Eq a $= >$ [a] -> [a] -> [a] {I0} intersect xs ys $=$ filter (\e -> elem e ys) xs

Y la siguiente propiedad que vale para todos los tipos a y b pertenecientes a la clase Eq: {CONGRUENCIA $= = \}$ ∀ x::a . $\forall$ y::a . ∀ f::a->b . $( \texttt { a } = \texttt { b } \Rightarrow \texttt { f } \texttt { a } = \texttt { f b } )$

Indicar si las siguientes propiedades son verdaderas o falsas. Si son verdaderas, realizar una demostración. Si son falsas, presentar un contraejemplo.

i. Eq a $= >$ ∀ xs::[a] . ∀ e::a . ∀ p::a -> Bool . elem e xs && p $\begin{array} { r l } { \mathsf { a } } & { { } = } \end{array}$ elem e (filter p xs) ii. Eq a $\Rightarrow \forall$ xs::[a] . $\forall$ e::a . elem e xs = elem e (nub xs) iii. Eq a $\Rightarrow \forall$ xs::[a] . $\forall$ ys::[a] . $\forall$ e::a . elem e (union xs ys) $=$ (elem e xs) || (elem e ys) iv. Eq a $\Rightarrow \forall$ xs::[a]. ∀ ys::[a]. ∀ e::a . elem e (intersect xs ys) $=$ (elem e xs) && (elem e ys) v. Eq a $\Rightarrow \forall$ xs::[a] . $\forall$ ys::[a] . length (union xs ys) $=$ length xs $^ +$ length ys vi. Eq a $= >$ ∀ xs::[a] . ∀ ys::[a] . length (union xs ys) $\leq$ length xs $^ +$ length ys

# Ejercicio 8

Dadas las deniciones usuales de foldr y foldl, demostrar las siguientes propiedades:

i. ∀ f::a->b->b . ∀ z::b . ∀ xs, ys::[a] . foldr f z (xs ++ ys) $=$ foldr f (foldr f z ys) xs ii. ∀ f::b->a->b . ∀ z::b . ∀ xs, ys::[a] . foldl f z (xs ++ ys) $=$ foldl f (foldl f z xs) ys

# Otras estructuras de datos

# Ejercicio 9

Demostrar que la función potencia denida en la práctica 1 usando foldNat funciona correctamente mediante inducción en el exponente.

# Ejercicio $\mathbf { 1 0 ~ \star }$

Dadas las funciones altura y cantNodos denidas en la práctica 1 para árboles binarios, demostrar la siguiente propiedad:

∀ x::AB a . altura $\texttt { x } \leq$ cantNodos x

# Ejercicio 11

Dada la siguiente función:

truncar :: AB a $^ { - > }$ Int $^ { - > }$ AB a   
{T0} truncar $\mathbb { N } \mathrm { i } \mathrm { 1 ~ \Omega ~ } \setminus \mathrm { ~ \Omega ~ } = \mathrm { ~ \mathbb { N } i \mathrm { 1 } ~ }$   
{T1} truncar (Bin i r d) n = if $\texttt { n } = = \texttt { 0 }$ then Nil else Bin (truncar i (n-1)) r (truncar d (n-1))

Y los siguientes lemas:

1. ∀ x:: 2. ∀ x:: ${ \begin{array} { r l } & { \colon { \mathrm { I n t ~ . ~ } } \forall : \colon { \mathrm { I n t ~ . ~ } } \forall z : \colon { \mathrm { I n t ~ . ~ } } { \mathrm { ~ m a x ~ } } ( { \mathrm { m i n ~ x ~ y } } ) \ ( { \mathrm { m i n ~ x ~ z } } ) = { \mathrm { m i n ~ x ~ } } ( { \mathrm { m a x ~ y ~ z } } ) } \\ & { \colon { \mathrm { I n t ~ . ~ } } \forall : \colon { \mathrm { I n t ~ . ~ } } \forall z : \colon { \mathrm { I n t ~ . ~ z } } + { \mathrm { m i n ~ x ~ y } } = { \mathrm { m i n ~ } } ( \mathbf { z } + \mathbf { x } ) \ ( \mathbf { z } + \mathbf { y } ) } \end{array} }$ Demostrar las siguientes propiedades: i. ∀ t::AB a . altura $\mathrm { ~ t ~ } \geq 0$   
ii. ∀ t::AB a . ∀ n::Int . $\left( \mathbf { n } \geq \ 0 \Rightarrow \right.$ (altura (truncar t n) = min n (altura t)))

# Ejercicio 12

Considerar las siguientes funciones:

inorder :: AB a -> [a] {I0} inorder $=$ foldAB [] (\ri x rd -> ri ++ (x:rd)) elemAB :: Eq a => a -> AB a -> Bool {A0} elemAB e $=$ foldAB False (\ri x rd -> ( $\mathbf { \Psi } _ { \mathbf { { e } } } \ = \mathbf { \Psi } \mathbf { x } .$ ) || ri || rd) elem :: Eq a $= >$ a $^ { - > }$ [a] -> Bool {E0} elem e $=$ foldr (\x rec $^ { - > }$ ( $\mathbf { \Psi } _ { \mathbf { e } } \ = \ \mathbf { x } .$ ) || rec) False

Demostrar la siguiente propiedad: Eq $\textsf { a } = > \forall$ e::a . elemAB $\begin{array} { r l } { \mathtt { e } } & { { } = } \end{array}$ elem e . inorder

# Ejercicio $\mathbf { 1 3 ~ \star }$

Dados el tipo Polinomio y su esquema de recursión estructural foldPoli denidos en la práctica 1, y las siguientes funciones:

evaluar :: Num a $= >$ a -> Polinomio a -> a {E} evaluar n $=$ foldPoli n id $( + )$ (\*)

derivado :: Num a $= >$ Polinomio a -> Polinomio a   
{D} derivado poli $=$ case poli of X $^ { - > }$ Cte 1 Cte _ $^ { - > }$ Cte 0 Suma p q $^ { - > }$ Suma (derivado p) (derivado q) Prod p q -> Suma (Prod (derivado p) q) (Prod (derivado q) p)

sinConstantesNegativas :: Num a $= >$ Polinomio a $^ { - > }$ Bool {S} sinConstantesNegativas $=$ foldPoli True ( $\scriptstyle \cdot > = 0$ ) (&&) (&&)

esRaiz :: Num a $= >$ a $^ { - > }$ Polinomio a $^ { - > }$ Bool {ER} esRaiz n p $=$ evaluar n $\texttt { p } = = \texttt { 0 }$

Demostrar las siguientes propiedades:

i. Num a $\Rightarrow \forall$ p::Polinomio a . $\forall$ q::Polinomio a . $\forall$ r::a . (esRaiz r p $\Rightarrow$ esRaiz r (Prod p q)) ii. Num a $\Rightarrow \forall$ p::Polinomio a . ∀ k::a . $\forall$ e::a . evaluar e (derivado (Prod (Cte k) p)) $=$ evaluar e (Prod (Cte k) (derivado p)) iii. Num a $\Rightarrow \forall$ p::Polinomio a. (sinConstantesNegativas $\mathtt { p } \Rightarrow$ sinConstantesNegativas (derivado p))

La recursión utilizada en la denición de la función derivado ¾es estructural, primitiva o ninguna de las dos?

# Ejercicio 14

Considerar las siguientes deniciones:

data AIH a $=$ Hoja a | Bin (AIH a) (AIH a)

hojas :: AIH a -> [a] espejo :: AIH a -> AIH a {H0} hojas (Hoja h) = [h] {E0} espejo (Hoja h) $=$ Hoja h {H1} hojas (Bin i d) $=$ hojas a $^ { + + }$ hojas d {E1} espejo (Bin i d) $=$ Bin (espejo d) (espejo i)

Demostrar las siguientes propiedades:

i. $\forall ~ \mathbf { x } : : \mathsf { A I H }$ a . $\forall ~ \mathtt { y } : \mathtt { A I H }$ a . ∀ z::AIH a . hojas (Bin x (Bin y z)) $=$ hojas (Bin (Bin x y) z)   
ii. espejo . espejo = id   
iii. ∀ x::AIH a . hojas (espejo x) $=$ reverse (hojas x)