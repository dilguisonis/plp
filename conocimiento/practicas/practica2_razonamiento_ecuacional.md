# Practica N° 2 - Razonamiento ecuacional e induccion estructural

**Paradigmas de Programacion (PLP) - 2do Cuatrimestre de 2025**

---

Para resolver esta practica se recomienda tener a mano las soluciones de los ejercicios de la practica 1, asi como tambien los apuntes de las clases teoricas y practicas de Programacion Funcional.

En las demostraciones por induccion estructural, justifique **todos** los pasos: por que axioma, por que lema, por que puede aplicarse la hipotesis inductiva, etc. Es importante escribir el **esquema de induccion**, planteando claramente los casos base e inductivos, e identificando la hipotesis inductiva y la tesis inductiva.

El alcance de todos los cuantificadores que se utilicen debe estar claramente definido (si no hay parentesis, se entiende que llegan hasta el final).

Demuestre todas las propiedades auxiliares (lemas) que utilice.

Los ejercicios marcados con el simbolo ★ constituyen un subconjunto minimo de ejercitacion. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

---

## Extensionalidad y lemas de generacion

### Ejercicio 1 ★

Sean las siguientes definiciones de funciones:

```haskell
intercambiar (x,y) = (y,x)

espejar (Left x)  = Right x
espejar (Right x) = Left x

asociarI (x,(y,z)) = ((x,y),z)

asociarD ((x,y),z) = (x,(y,z))

flip f x y = f y x

curry f x y = f (x,y)

uncurry f (x,y) = f x y
```

Demostrar las siguientes igualdades usando los lemas de generacion cuando sea necesario:

i. ∀ p::(a,b) . intercambiar (intercambiar p) = p

ii. ∀ p::(a,(b,c)) . asociarD (asociarI p) = p

iii. ∀ p::Either a b . espejar (espejar p) = p

iv. ∀ f::a→b→c . ∀ x::a . ∀ y::b . flip (flip f) x y = f x y

v. ∀ f::a→b→c . ∀ x::a . ∀ y::b . curry (uncurry f) x y = f x y

### Ejercicio 2 ★

Demostrar las siguientes igualdades utilizando el principio de extensionalidad funcional:

i. flip . flip = id

ii. ∀ f::(a,b)→c . uncurry (curry f) = f

iii. flip const = const id

iv. ∀ f::a→b . ∀ g::b→c . ∀ h::c→d . ((h . g) . f) = (h . (g . f))

con la definicion usual de la composicion:

```haskell
(.) f g x = f (g x)
```

---

## Induccion sobre listas

En esta seccion usaremos las siguientes definiciones (y las de `elem`, `foldr`, `foldl`, `map` y `filter` vistas en clase):

```haskell
length :: [a] -> Int
{L0} length []     = 0
{L1} length (x:xs) = 1 + length xs

duplicar :: [a] -> [a]
{D0} duplicar []     = []
{D1} duplicar (x:xs) = x : x : duplicar xs

(++) :: [a] -> [a] -> [a]
{++0} []     ++ ys = ys
{++1} (x:xs) ++ ys = x : (xs ++ ys)

append :: [a] -> [a] -> [a]
{A0} append xs ys = foldr (:) ys xs

reverse :: [a] -> [a]
{R0} reverse = foldl (flip (:)) []
```

### Ejercicio 3 ★

Demostrar las siguientes propiedades:

i. ∀ xs::[a] . length (duplicar xs) = 2 * length xs

ii. ∀ xs::[a] . ∀ ys::[a] . length (xs ++ ys) = length xs + length ys

iii. ∀ xs::[a] . ∀ x::a . [x] ++ xs = x:xs

iv. ∀ xs::[a] . xs ++ [] = xs

v. ∀ xs::[a] . ∀ ys::[a] . ∀ zs::[a] . (xs ++ ys) ++ zs = xs ++ (ys ++ zs)

vi. ∀ xs::[a] . ∀ f::(a→b) . length (map f xs) = length xs

vii. ∀ xs::[a] . ∀ p::a→Bool . ∀ e::a . (elem e (filter p xs) ⇒ elem e xs) (si vale Eq a)

### Ejercicio 4 ★

Demostrar las siguientes propiedades:

i. reverse = foldr (\x rec → rec ++ (x:[])) []

ii. ∀ xs::[a] . ∀ ys::[a] . reverse (xs ++ ys) = reverse ys ++ reverse xs

iii. ∀ xs::[a] . ∀ x::a . reverse (xs ++ [x]) = x:reverse xs

**Nota:** en adelante, siempre que se necesite usar `reverse`, se podra utilizar cualquiera de las dos definiciones, segun se considere conveniente.

### Ejercicio 5

Demostrar las siguientes propiedades utilizando induccion estructural sobre listas, lemas de generacion y el principio de extensionalidad funcional.

i. reverse . reverse = id

ii. append = (++)

iii. map id = id

iv. ∀ f::a→b . ∀ g::b→c . map (g . f) = map g . map f

v. ∀ f::a→b . ∀ p::b→Bool . map f . filter (p . f) = filter p . map f

vi. ∀ f::a→b . ∀ e::a . ∀ xs::[a] . (elem e xs ⇒ elem (f e) (map f xs)) (con Eq a y Eq b)

vii. ∀ xs::[a] . ∀ e::a . (elem e xs ⇒ e ≤ maximum xs) (si vale Ord a), donde:

```haskell
maximum :: Ord a => [a] -> a
{M0} maximum [x]      = x
{M1} maximum (x:y:xs) = max x (maximum (y:xs))
```

**Ayuda:** usar ∀ w::Int . ∀ x::Int . ∀ y::Int . ∀ z::Int . w ≤ x ∧ y ≤ z ⇒ max w y ≤ max x z

### Ejercicio 6 ★

Dadas las siguientes funciones:

```haskell
zip :: [a] -> [b] -> [(a,b)]
{Z0} zip = foldr (\x rec ys ->
                    if null ys
                    then []
                    else (x, head ys) : rec (tail ys))
              (const [])

zip' :: [a] -> [b] -> [(a,b)]
{Z'0} zip' []     ys = []
{Z'1} zip' (x:xs) ys = if null ys then [] else (x, head ys):zip' xs (tail ys)
```

Demostrar que `zip = zip'` utilizando induccion estructural y el principio de extensionalidad.

### Ejercicio 7 ★

Dadas las siguientes funciones:

```haskell
nub :: Eq a => [a] -> [a]
{N0} nub []     = []
{N1} nub (x:xs) = x : filter (\y -> x /= y) (nub xs)

union :: Eq a => [a] -> [a] -> [a]
{U0} union xs ys = nub (xs++ys)

intersect :: Eq a => [a] -> [a] -> [a]
{I0} intersect xs ys = filter (\e -> elem e ys) xs
```

Y la siguiente propiedad que vale para todos los tipos `a` y `b` pertenecientes a la clase `Eq`:

```
{CONGRUENCIA ==} ∀ x::a . ∀ y::a . ∀ f::a→b . (a == b ⇒ f a == f b)
```

Indicar si las siguientes propiedades son verdaderas o falsas. Si son verdaderas, realizar una demostracion. Si son falsas, presentar un contraejemplo.

i. Eq a ⇒ ∀ xs::[a] . ∀ e::a . ∀ p::a → Bool . elem e xs && p e = elem e (filter p xs)

ii. Eq a ⇒ ∀ xs::[a] . ∀ e::a . elem e xs = elem e (nub xs)

iii. Eq a ⇒ ∀ xs::[a] . ∀ ys::[a] . ∀ e::a . elem e (union xs ys) = (elem e xs) || (elem e ys)

iv. Eq a ⇒ ∀ xs::[a] . ∀ ys::[a] . ∀ e::a . elem e (intersect xs ys) = (elem e xs) && (elem e ys)

v. Eq a ⇒ ∀ xs::[a] . ∀ ys::[a] . length (union xs ys) = length xs + length ys

vi. Eq a ⇒ ∀ xs::[a] . ∀ ys::[a] . length (union xs ys) ≤ length xs + length ys

### Ejercicio 8

Dadas las definiciones usuales de `foldr` y `foldl`, demostrar las siguientes propiedades:

i. ∀ f::a→b→b . ∀ z::b . ∀ xs, ys::[a] . foldr f z (xs ++ ys) = foldr f (foldr f z ys) xs

ii. ∀ f::b→a→b . ∀ z::b . ∀ xs, ys::[a] . foldl f z (xs ++ ys) = foldl f (foldl f z xs) ys

---

## Otras estructuras de datos

### Ejercicio 9

Demostrar que la funcion `potencia` definida en la practica 1 usando `foldNat` funciona correctamente mediante induccion en el exponente.

### Ejercicio 10 ★

Dadas las funciones `altura` y `cantNodos` definidas en la practica 1 para arboles binarios, demostrar la siguiente propiedad:

∀ x::AB a . altura x ≤ cantNodos x

### Ejercicio 11

Dada la siguiente funcion:

```haskell
truncar :: AB a -> Int -> AB a
{T0} truncar Nil _           = Nil
{T1} truncar (Bin i r d) n   = if n == 0 then Nil else Bin (truncar i (n-1)) r (truncar d (n-1))
```

Y los siguientes lemas:

1. ∀ x::Int . ∀ y::Int . ∀ z::Int . max (min x y) (min x z) = min x (max y z)
2. ∀ x::Int . ∀ y::Int . ∀ z::Int . z + min x y = min (z+x) (z+y)

Demostrar las siguientes propiedades:

i. ∀ t::AB a . altura t ≥ 0

ii. ∀ t::AB a . ∀ n::Int . (n ≥ 0 ⇒ (altura (truncar t n) = min n (altura t)))

### Ejercicio 12

Considerar las siguientes funciones:

```haskell
inorder :: AB a -> [a]
{I0} inorder = foldAB [] (\ri x rd -> ri ++ (x:rd))

elemAB :: Eq a => a -> AB a -> Bool
{A0} elemAB e = foldAB False (\ri x rd -> (e == x) || ri || rd)

elem :: Eq a => a -> [a] -> Bool
{E0} elem e = foldr (\x rec -> (e == x) || rec) False
```

Demostrar la siguiente propiedad:

Eq a ⇒ ∀ e::a . elemAB e = elem e . inorder

### Ejercicio 13 ★

Dados el tipo `Polinomio` y su esquema de recursion estructural `foldPoli` definidos en la practica 1, y las siguientes funciones:

```haskell
evaluar :: Num a => a -> Polinomio a -> a
{E} evaluar n = foldPoli n id (+) (*)

derivado :: Num a => Polinomio a -> Polinomio a
{D} derivado poli = case poli of
      X         -> Cte 1
      Cte _     -> Cte 0
      Suma p q  -> Suma (derivado p) (derivado q)
      Prod p q  -> Suma (Prod (derivado p) q) (Prod (derivado q) p)

sinConstantesNegativas :: Num a => Polinomio a -> Bool
{S} sinConstantesNegativas = foldPoli True (>=0) (&&) (&&)

esRaiz :: Num a => a -> Polinomio a -> Bool
{ER} esRaiz n p = evaluar n p == 0
```

Demostrar las siguientes propiedades:

i. Num a ⇒ ∀ p::Polinomio a . ∀ q::Polinomio a . ∀ r::a . (esRaiz r p ⇒ esRaiz r (Prod p q))

ii. Num a ⇒ ∀ p::Polinomio a . ∀ k::a . ∀ e::a .
   evaluar e (derivado (Prod (Cte k) p)) = evaluar e (Prod (Cte k) (derivado p))

iii. Num a ⇒ ∀ p::Polinomio a . (sinConstantesNegativas p ⇒ sinConstantesNegativas (derivado p))

La recursion utilizada en la definicion de la funcion `derivado` ¿es estructural, primitiva o ninguna de las dos?

### Ejercicio 14

Considerar las siguientes definiciones:

```haskell
data AIH a = Hoja a | Bin (AIH a) (AIH a)

hojas :: AIH a -> [a]
{H0} hojas (Hoja h) = [h]
{H1} hojas (Bin i d) = hojas i ++ hojas d

espejo :: AIH a -> AIH a
{E0} espejo (Hoja h) = Hoja h
{E1} espejo (Bin i d) = Bin (espejo d) (espejo i)
```

Demostrar las siguientes propiedades:

i. ∀ x::AIH a . ∀ y::AIH a . ∀ z::AIH a . hojas (Bin x (Bin y z)) = hojas (Bin (Bin x y) z)

ii. espejo . espejo = id

iii. ∀ x::AIH a . hojas (espejo x) = reverse (hojas x)
