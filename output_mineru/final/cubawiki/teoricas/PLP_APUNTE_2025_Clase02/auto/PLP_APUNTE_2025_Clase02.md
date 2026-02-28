# Paradigmas de Programaci´on

Esquemas de recursi´on Tipos de datos inductivos

2do cuatrimestre de 2025 Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

# 1

# Breve repaso

Esquemas de recursi´on sobre listas

Tipos de datos algebraicos

$$
2
$$

Esquemas de recursi´on sobre otras estructuras

# Las funciones map y filter

La clase pasada vimos las siguientes funciones:

map :: (a -> b) -> [a] -> [b] map f [] = [] map f (x : xs) = f x : map f xs

filter :: (a -> Bool) -> [a] -> [a] filter p [] = [] filter p (x : xs) = if p x

¿Qu´e tipo tiene la expresi´on map filter? ¿C´omo la podr´ıamos usar?

# 3

# Funciones an´onimas

# Notaci´on “lambda”

Una expresi´on de la forma:

\ x -> e

representa una funci´on que recibe un par´ametro x y devuelve e.

$$
4
$$

# Ejemplo

map (\ x -> (x, x)) [1, 2, 3] [(1, 1), (2, 2), (3, 3)]

# Funciones de orden superior

¿Qu´e relaci´on hay entre las siguientes funciones?

suma :: Int -> Int -> Int suma x $\texttt { y } = \texttt { x } + \texttt { y }$

suma’ :: (Int, Int) -> Int suma’ (x, y) = x + y

Est´an relacionadas del siguiente modo:

curry :: ((a, b) -> c) -> a -> b -> c curry f x y = f (x, y)

uncurry :: (a -> b -> c) -> (a, b) -> c uncurry f (x, y) = f x y

Dentro de algunas clases, veremos que se puede demostrar:

suma $=$ curry suma’ suma’ $=$ uncurry suma

# 5

# Breve repaso

Esquemas de recursi´on sobre listas

Tipos de datos algebraicos

Esquemas de recursi´on sobre otras estructuras

# 6

# Esquemas sobre listas

Pensemos algunas funciones sobre listas

sumaL : la suma de todos los valores de una lista de enteros concatena : la concatenaci´on de todos los elementos de una lista de listas   
reverso : el reverso de una lista

# 7

# Recursi´on estructural

Sea g :: [a] -> b definida por dos ecuaciones:

$$
\begin{array} { l c l } { \mathrm { ~ g ~ } \left[ \right] ~ } & { = } & { \langle c a s o ~ b a s e \rangle } \\ { \mathrm { ~ g ~ } \left( \mathbf { x } ~ : ~ \mathbf { x } \mathbf { s } \right) } & { = } & { \langle c a s o ~ r e c u r s i v o \rangle } \end{array}
$$

g est´a dada por recursi´on estructural si:

1. El caso base devuelve un valor z “fijo” (no depende de g).

2. El caso recursivo no puede usar las variables g ni xs, salvo en la expresi´on (g xs).

g [] = zg (x : xs) = . . . x . . . (g xs) . . .

# Recursi´on estructural

# Ejemplos de recursi´on estructural

suma :: [Int] -> Int suma [] = 0 suma (x : xs) = x + suma xs

(++) :: [a] -> [a] -> [a] [] ++ ys = ys (x : xs) ++ ys = x : (xs ++ ys)

# Recursi´on estructural

# Ejemplo:

-- Selection sort   
ssort :: Ord a $\Rightarrow$ [a] -> [a]   
ssort [] $= ~ [ ]$   
ssort (x : xs) $=$ minimo (x : xs) : ssort (sacarMinimo (x : xs))

¿Es recursi´on estructural? No.

# Plegado de listas a derecha

La funci´on foldr abstrae el esquema de recursi´on estructural:

<table><tr><td>foldr</td></tr><tr><td></td></tr><tr><td>foldr f z [] =z</td></tr><tr><td>foldr f z (x : xs) = f x (foldr f z xs)</td></tr></table>

¿Cu´al es su tipo?

foldr :: (a -> b -> b) -> b -> [a] -> b

Toda recursi´on estructural es una instancia de foldr.

# Plegado de listas a derecha

# Ejemplo — suma con foldr

suma :: [Int] -> Int suma $=$ foldr (+) 0

⇝ foldr (+) 0 [1, 2]   
⇝ (+) 1 (foldr (+) 0 [2])   
⇝ (+) 1 ((+) 2 (foldr (+) 0 []))   
(+) 1 ((+) 2 0)   
⇝∗ 3

An´alogamente:

producto :: [Int] -> Int producto $=$ foldr (\*) 1 and, or :: [Bool] -> Bool and $=$ foldr (&&) True or $=$ foldr (||) False

# Plegado de listas a derecha

# Ejemplo — reverso con foldr

reverso :: [a] -> [a]   
reverso [] = []   
reverso (x : xs) = reverso xs ++ [x]

Es recursiva estructural. ¿C´omo la escribir´ıamos usando foldr?

reverso $=$ foldr (\ x rec -> rec ++ [x]) []

Otras formas equivalentes:

reverso $=$ foldr (\ x rec -> flip (++) [x] rec) [] reverso $=$ foldr (\ x -> flip (++) [x]) [] reverso $=$ foldr (\ x -> flip (++) ((: []) x)) [] reverso $=$ foldr (\ x -> (flip (++) . (: [])) x) [] reverso $=$ foldr (flip (++) . (: [])) []

# 13

# Plegado de listas a derecha

# Ilustraci´on gr´afica del plegado a derecha

![](images/da30af6aaf3aec6a49795fd7f37ae3ae114ffd0e5e20ea5c5303a652b54f6dea.jpg)

$$
^ { 1 4 }
$$

En particular, se puede demostrar que:

foldr (:) [] = id foldr ((:) . f) [] $=$ map f foldr (const (+ 1)) 0 = length

# Recursi´on primitiva

Sea g :: [a] -> b definida por dos ecuaciones:

$$
\begin{array} { l c l } { \mathrm { ~ g ~ } \left[ \right] ~ } & { = } & { \langle c a s o ~ b a s e \rangle } \\ { \mathrm { ~ g ~ } \left( \mathbf { x } ~ : ~ \mathbf { x } \mathbf { s } \right) } & { = } & { \langle c a s o ~ r e c u r s i v o \rangle } \end{array}
$$

Decimos que la definici´on de g est´a dada por recursi´on primitiva si:

1. El caso base devuelve un valor z “fijo” (no depende de g).   
2. El caso recursivo no puede usar la variable g, salvo en la expresi´on (g xs). (S´ı puede usar la variable xs).

g [] = z g (x : xs) = . . . x . . . xs . . . (g xs) . . .

Similar a la recursi´on estructural, pero permite referirse a xs.

# Recursi´on primitiva

# Observaci´on

Todas las definiciones dadas por recursi´on estructural tambi´en est´an dadas por recursi´on primitiva. Hay definiciones dadas por recursi´on primitiva que no est´an dadas por recursi´on estructural.

# Ejemplo

Dado un texto, borrar todos los espacios iniciales.

trim :: String -> String >> trim = Hola PLP" "Hola PLP"

trim [] = []trim (x : xs) = if x == ’ ’ then trim xs else x : xs

Intenten escribirla con foldr. ¿Est´an haciendo recursi´on estructural?

# Recursi´on primitiva

Escribamos una funci´on recr para abstraer el esquema de recursi´on primitiva:

recr f z [] = z recr f z (x : xs) = f x xs (recr f z xs)

¿Cu´al es su tipo?

recr :: (a -> [a] -> b -> b) -> b -> [a] -> b

Toda recursi´on primitiva es una instancia de recr.

Escribamos trim ahora usando recr:

trim = recr (\ x xs rec -> if x == ’ ’ then rec else x : xs)

$$
^ { 1 7 }
$$

# Recursi´on iterativa

Sea g :: b -> [a] -> b definida por dos ecuaciones:

$$
\begin{array} { l c l } { \mathrm {  ~ g ~ } { \sf a c } } & { [ ] } & { = } & { \langle c a s o \ b a s e \rangle } \\ { \mathrm {  ~ g ~ } { \sf a c } } & { ( { \bf x } \ : \ { \bf x } { \bf s } ) } & { = } & { \langle c a s o \ r e c u r s i v o \rangle } \end{array}
$$

# Recursi´on iterativa

Decimos que la definici´on de g est´a dada por recursi´on iterativa si:

1. El caso base devuelve el acumulador ac.   
2. El caso recursivo invoca inmediatamente a (g ac’ xs), donde ac’ es el acumulador actualizado en funci´on de su valor anterior y el valor de x.

# Recursi´on iterativa

-- Reverso con acumulador.   
reverso’ :: [a] -> [a] -> [a]   
reverso’ ac [] = ac   
reverso’ ac (x : xs) = reverso’ (x : ac) xs -- Pasaje de binario a decimal con acumulador. -- Precondici´on: recibe una lista de 0s y 1s. bin2dec’ :: Int -> [Int] -> Int   
bin2dec’ ac [] = ac   
bin2dec’ ac (b : bs) $=$ bin2dec’ (b + 2 \* ac) bs -- Insertion sort con acumulador.   
isort’ :: Ord a $\Rightarrow$ [a] -> [a] -> [a]   
isort’ ac [] = ac   
isort’ ac (x : xs) $=$ isort’ (insertarOrdenado x ac)

# Plegado de listas a izquierda

Escribamos una funci´on foldl para abstraer el esquema de recursi´on iterativa:

foldl f ac [] = ac foldl f ac (x : xs) = foldl f (f ac x) xs

¿Cu´al es su tipo?

Toda recursi´on iterativa es una instancia de foldl.

# Plegado de listas a izquierda

En general foldr y foldl tienen comportamientos diferentes:

foldr (⋆ $\begin{array} { r l r } { ) \textrm {  { z } } [ \mathsf { a } , \mathsf { b } , \mathsf { c } ] } & { { } = } & { \mathsf { a } \star ( \mathsf { b } \star ( \mathsf { c } \star ) } \\ { ) \textrm {  { z } } [ \mathsf { a } , \mathsf { b } , \mathsf { c } ] } & { { } = } & { ( ( \mathsf { z } \star \mathsf { a } ) \star \mathsf { b } ) } \end{array}$ z)) foldl (⋆ ⋆ c

Si (⋆) es un operador asociativo y conmutativo, foldr y foldl definen la misma funci´on. Por ejemplo:

suma $=$ foldr (+) 0 $=$ foldl (+) 0 producto $=$ foldr (\*) 1 $=$ foldl (\*) 1 and $=$ foldr (&&) True $=$ foldl (&&) True or $=$ foldr (||) False $=$ foldl (||) False

# Plegado de listas a izquierda

# Ejemplo — pasaje de binario a decimal

bin2decbin2dec $=$ : [Int] -> Int foldl (\ ac b -> b + 2 \* ac) 0

bin2dec [1, 0, 0]   
foldl (\ ac b -> b + 2 \* ac) 0 [1, 0, 0]   
foldl (\ ac b -> b + 2 \* ac) $( 1 ~ + ~ 0 )$ [0, 0]   
foldl (\ ac b $- > { \textsf { b } } + \ 2 \ * \ \mathsf { a c } ;$ ) $( 0 ~ + ~ 2 ~ * ~ ( 1 ~ + ~ 0 ) )$ [0]   
foldl (\ ac b $\ l \to \mathrm { ~ b ~ + ~ 2 ~ } \ast$ ac) $( 0 ~ + ~ 2 ~ * ~ ( 0 ~ + ~ 2 ~ * ~ ( 1 ~ + ~ 0 ) ) )$ []   
$0 ~ + ~ 2 ~ * ~ ( 0 ~ + ~ 2 ~ * ~ ( 1 ~ + ~ 0 ) )$   
4

# Plegado de listas a izquierda

La funci´on foldl es un operador de iteraci´on.

Pseudoc´odigo imperativo:

funci´on foldl f ac xs $\{$ mientras xs no es vac´ıa { ac := f ac (head xs) xs := tail xs } devolver ac   
}

# Plegado de listas a izquierda

# Ilustraci´on gr´afica del plegado a izquierda

![](images/a2f808e6a30b18fa1a30871a8bbb0db38877b136295e8edcef2d77356ba55526.jpg)

$$
2 4
$$

En particular, se puede demostrar que:

foldl (flip (:)) [] = reverse

# Resumen: esquemas de recursi´on sobre listas

Vimos los siguientes esquemas de recursi´on sobre listas:

1. Recursi´on estructural. . foldr   
2. Recursi´on primitiva. recr   
3. Recursi´on iterativa. . foldl

# Para pensar

# Recursi´on en simult´aneo sobre m´as de una estructura

Definir la siguiente funci´on usando foldr.

(No tan f´acil).

zip :: [a] -> [b] -> [(a, b)]   
zip [] [] = []   
zip (x : xs) (y : ys) = (x, y) : zip xs ys

# Relaci´on entre recursi´on estructural y primitiva

1. Definir foldr en t´erminos de recr. (F´acil).   
2. Definir recr en t´erminos de foldr. (No tan f´acil). Idea: devolver una tupla con una copia de la lista original.

# Relaci´on entre recursi´on estructural e iterativa

1. Definir foldl en t´erminos de foldr.   
2. Definir foldr en t´erminos de foldl.

# Breve repaso

Esquemas de recursi´on sobre listas

Tipos de datos algebraicos

Esquemas de recursi´on sobre otras estructuras

$$
^ { 2 7 }
$$

# Tipos de datos algebraicos

Conocemos algunos tipos de datos “primitivos”:

Char Int Float (a -> b) (a, b) [a]

String (sin´onimo de [Char])

Se pueden definir nuevos tipos de datos con la cl´ausula data:

data Tipo = ⟨declaraci´on de los constructores⟩

# Tipos de datos algebraicos

# Ejemplo — tipos enumerados

Muchos constructores sin par´ametros:

data Dia $=$ Dom | Lun | Mar | Mie | Jue | Vie | Sab Declara que existen constructores:

Dom :: Dia Lun :: Dia . . . Sab :: Dia

Declara adem´as esos son los ´unicos constructores del tipo Dia.

esFinDeSemana :: Dia -> Bool esFinDeSemana Sab $=$ True esFinDeSemana Dom $=$ True esFinDeSemana _ $=$ False >> esFinDeSemana Vie ⇝ False

# Tipos de datos algebraicos

# Ejemplo — tipos producto (tuplas/estructuras/registros/. . .)

Un solo constructor con muchos par´ametros:

data Persona = LaPersona String String Int

Declara que el tipo Persona tiene un constructor (y s´olo ese):

LaPersona :: String -> String -> Int -> Persona nombre, apellido :: Persona -> String nombre (LaPersona n _ _) = n apellido (LaPersona _ a _) = a fechaNacimiento :: Persona -> Int fechaNacimiento (LaPersona _ _ f) = f rebecaGuber $=$ LaPersona "Rebeca" "Guber" 1926

apellido rebecaGuber "Guber"

# Tipos de datos algebraicos

# Ejemplo

Un tipo puede tener muchos constructores con muchos par´ametros:

data Forma $=$ Rectangulo Float Float | Circulo Float

Declara que el tipo Forma tiene dos constructores (y s´olo esos):

Rectangulo :: Float -> Float -> Forma Circulo :: Float -> Forma

area :: Forma -> Float area (Rectangulo ancho alto) $=$ ancho \* alto area (Circulo radio) $=$ radio \* radio \* pi

# Tipos de datos algebraicos

# Ejemplo

Algunos constructores pueden ser recursivos:

data Nat $=$ Zero | Succ Nat

Declara que el tipo Nat tiene dos constructores (y s´olo esos):

Zero :: Nat Succ :: Nat -> Nat ¿Qu´e forma tienen los valores de tipo Nat?

Zero   
Succ Zero   
Succ (Succ Zero)   
Succ (Succ (Succ Zero))

$$
3 2
$$

# Tipos de datos algebraicos

# Naturales

Podemos definir alguna funci´on usando los Nats:

isZero :: Nat -> Bool isZero Zero $=$ True isZero _ = False

Otra funci´on con Nat usando recursi´on:

doble :: Nat -> Nat   
doble Zero $=$ Zero   
doble (Succ n) $=$ Succ (Succ (doble n))

# Tipos de datos algebraicos

# Naturales

La siguiente ecuaci´on, ¿define un valor de tipo Nat o es un error?

infinito :: Nat infinito $=$ Succ infinito

¿Qu´e pasa cuando hacemos isZero(infinito)?

Que se cuelgue o no depende de c´omo se interpreten las definiciones recursivas.

En Haskell se permite trabajar con estructuras infinitas.

▶ En vez de exigir que termine la evaluaci´on (visi´on inductiva), entiende que se pueden seguir obteniendo resultados sin terminar (visi´on coinductiva).

En la materia hablaremos de estructuras finitas e infinitas.

# Tipos de datos algebraicos

# Tipos de datos algebraico — caso general

En general un tipo de datos algebraico tiene la siguiente forma:

data T = CBase1 ⟨par´ametros⟩ CBasen ⟨par´ametros⟩ CRecursivo1 ⟨par´ametros⟩ CRecursivom ⟨par´ametros⟩

Los constructores base no reciben par´ametros de tipo T.

Los constructores recursivos reciben al menos un par´ametro de tipo T.

Los valores de tipo T son los que se pueden construir aplicando constructores base y recursivos un n´umero finito de veces y s´olo esos.

(Entendemos la definici´on de T de forma inductiva).

# Ejemplo: cuentas corrientes

type Cuenta $=$ String data Banco $=$ Iniciar | Depositar Cuenta Int Banco | Extraer Cuenta Int Banco | Transferir Cuenta Cuenta Int Banco bancoPLP $=$ Transferir "A" "B" 3 (Depositar "A" 10 Iniciar)

saldo :: Cuenta -> Banco -> Int saldo cuenta Iniciar $\qquad = \ 0$ saldo cuenta (Depositar cuenta’ monto banco) | cuenta $= =$ cuenta’ $=$ saldo cuenta banco + monto | otherwise $=$ saldo cuenta banco saldo cuenta (Extraer cuenta’ monto banco) | cuenta $= =$ cuenta’ $=$ saldo cuenta banco - monto | otherwise $=$ saldo cuenta banco saldo cuenta (Transferir origen destino monto banco) | cuenta $= =$ origen $=$ saldo cuenta banco - monto | cuenta $= =$ destino $=$ saldo cuenta banco $^ +$ monto | otherwise $=$ saldo cuenta banco

# Ejemplo: listas

Las listas son un caso particular de tipo algebraico: data Lista a = Vacia | Cons a (Lista a) O, con la notaci´on ya conocida:

data [a] = [] | a : [a]   
productoCartesiano :: [a] -> [b] -> [(a, b)]   
productoCartesiano xs ys = concat (map (\ x -> map (\ y -> (x, y)) ys)

# Ejemplo: ´arboles binarios

data AB a = Nil | Bin (AB a) a (AB a)

Definamos las siguientes funciones:

preorder :: AB a -> [a] postorder :: AB a -> [a] inorder :: AB a -> [a]

$$
3 8
$$

preorder t ${ \stackrel {  } {  } } { ^ * }$ [1, 2, 3, 4, 5, 6, 7] postorder t ${ \stackrel {  } {  } } { ^ * }$ [3, 4, 2, 6, 7, 5, 1] inorder t ${ \stackrel {  } {  } } { ^ * }$ [3, 2, 4, 1, 6, 5, 7]

# Ejemplo: ´arboles binarios

Pre: el ´arbol de entrada es un ABB (sin repetidos).

Post: el ´arbol resultante es un ABB que contiene a los elementos del ABB de entrada y al elemento dado.

insertar x Nil $=$ Bin Nil x Nil   
insertar x (Bin izq y der) | x < y $=$ Bin (insertar x izq) y der | x > y = Bin izq y (insertar x der) | otherwise $=$ Bin izq y der

# Breve repaso

Esquemas de recursi´on sobre listas

Tipos de datos algebraicos

Esquemas de recursi´on sobre otras estructuras

$$
4 0
$$

# Recursi´on estructural

En el caso de las listas, dada una funci´on g :: [a] -> b:

$$
\begin{array} { l c l } { \mathrm { ~ g ~ } \left[ \right] ~ } & { = } & { \langle c a s o ~ b a s e \rangle } \\ { \mathrm { ~ g ~ } \left( \mathbf { x } ~ : ~ \mathbf { x } \mathbf { s } \right) } & { = } & { \langle c a s o ~ r e c u r s i v o \rangle } \end{array}
$$

dec´ıamos que g estaba dada por recursi´on estructural si:

▶ El caso base devuelve un valor z “fijo” (no depende de g). ▶ El caso recursivo no puede usar las variables g ni xs, salvo en la expresi´on (g xs).

# Recursi´on estructural

La recursi´on estructural se generaliza a tipos algebraicos en general.

Supongamos que T es un tipo algebraico.

Dada una funci´on g :: T -> Y definida por ecuaciones:

g (CBase1 ⟨par´ametros⟩) = ⟨caso base1⟩ g (CBasen ⟨par´ametros⟩) = ⟨caso basen⟩ g (CRecursivo1 ⟨par´ametros⟩) = ⟨caso recursivo1⟩ g (CRecursivom ⟨par´ametros⟩) = ⟨caso recursivom⟩

Decimos que g est´a dada por recursi´on estructural si:

1. Cada caso base se escribe combinando los par´ametros.

2. Cada caso recursivo se escribe combinando:

▶ Los par´ametros del constructor que no son de tipo T.   
▶ El llamado recursivo sobre cada par´ametro de tipo T.

# Pero:

▶ Sin usar los par´ametros del constructor que son de tipo T.   
▶ Sin hacer a otros llamados recursivos.

# Recursi´on estructural

Definamos una funci´on foldAB que abstraiga el esquema de recursi´on estructural sobre ´arboles binarios.

foldAB :: b -> (b -> a -> b -> b) -> AB a -> b

cBin (foldAB cNil cBin i) r (foldAB cNil cBin d)

# Recursi´on estructural

1. ¿A qu´e es igual (foldAB Nil Bin)?   
2. Definir mapAB :: (a -> b) -> AB a -> AB b usando foldAB.   
3. Definir maximo :: Ord a => AB a -> Maybe a usando foldAB.   
4. Definir altura :: AB a -> Int usando foldAB.   
5. ¿Se puede definir la funci´on esABB :: Ord a => AB a -> Bool usando foldAB?   
6. ¿Se puede definir la funci´on caminoMasLargo :: AB a -> [a] usando foldAB?

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

# Lectura recomendada

# Art´ıculo de Hutton.

Graham Hutton. A tutorial on the universality and expressiveness of fold.

J. Functional Programming 9 (4): 355–372, julio de 1999.

# Comentarios: recursi´on estructural

# Casos degenerados de recursi´on estructural

Es recursi´on estructural (no usa la cabeza):

length :: [a] -> Int   
length [] = 0   
length (_ : xs) = 1 + length xs

Es recursi´on estructural (no usa el llamado recursivo sobre la cola):

head :: [a] -> a   
head [] = error "No tiene cabeza."   
head (x : _) = x