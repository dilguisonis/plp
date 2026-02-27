data Indice = I1 | I2 | I3
data AT a = Hoja a | Nodo (Indice → AT a)

En donde AT a representa el tipo de dato "Árbol Trébol", dar:

  a. Dar el tipo e implementar foldAT


foldAT :: ((Indice -> b) -> b) -> (a -> b) -> AT a -> b
foldAT cNodo cHoja t = case t of 
    (Hoja x) -> cHoja x
    (Nodo f) -> cNodo (\i -> rec (f i))
  where rec = foldAT cNodo cHoja

cHoja recibe una x de tipo a y devuelve b.
El tipo Nodo almacena una función, en el tipo de cNodo recibimos una funcion que consiste en el indice, pero tenemos que hacer recursión sobre lo que devueve la f de nodo, ya que f i devuelve un arbol AT. 


Ejemplo de arbol:
  arbol :: AT Int
  arbol = Nodo (\i -> case i of
      I1 -> Hoja 5
      I2 -> Hoja 3
      I3 -> Nodo (\j -> case j of
          I1 -> Hoja 1
          I2 -> Hoja 2
          I3 -> Hoja 7))

b. Definir la función altura :: AT a → Int

  altura :: AT a -> Int                        
  altura = foldAT cNodo cHoja                                                   
    where                                                                       
      cHoja _ = 0
      cNodo g = 1 + max (g I1) (max (g I2) (g I3))

---

## Tips

1. **Tipo del fold**: el fold reemplaza constructores por funciones. Donde hay tipo recursivo (`AT a`) en un constructor, se convierte en `b`.
2. **Recursión en el fold**: si un constructor almacena algo que contiene `AT a` (ej: `Indice -> AT a`), el fold recursa ahí y lo convierte (ej: `Indice -> b`). Por eso `\i -> rec (f i)`.
3. **cNodo recibe resultados, no árboles**: `cNodo` nunca recibe `AT a` — recibe `b` (o `Indice -> b`). El fold ya hizo la recursión.
4. **`max` en Haskell**: toma 2 argumentos, no 3. No usar paréntesis con comas (eso es tupla).
5. **Simplificación eta**: si `cNodo g = Nodo (\i -> g i)`, se simplifica a `cNodo g = Nodo g`.
6. **`where`**: define funciones auxiliares locales; las variables como `x` en `cHoja x = ...` son parámetros de esas funciones.
7. **`Hoja a` no es un tipo**: `Hoja` es un constructor, el tipo es `AT a`.
8. **Los constructores pueden almacenar cualquier tipo**, incluyendo funciones. En `Nodo (Indice -> AT a)`, Nodo guarda una función. En un Rose Tree (`Rose a [RoseTree a]`), Rose guarda un valor y una lista de subárboles. Si la recursión está dentro de una lista, el fold usa `map` para recursar (ej: `foldRose f (Rose x hijos) = f x (map (foldRose f) hijos)`).


Ejercicio 2
Cálculo Lambda

Se extiende el Cálculo Lambda con el operador ∆. Funciona de la siguiente manera:

Sean M, N términos, entonces M∆N reduce M y N de manera intercalada. Primero reduce en un paso a M, luego reduce en un paso a N, luego reduce en otro paso a M, y así sucesivamente.

Cuando M o N lleguen a un valor, entonces ese valor es el resultado de reducir M∆N.

  a. Extender los términos y reglas de tipado.

  Terminos: ... | M∆N

  Y no extendemos los valores. 



  Reglas de tipado:

  Sea que M es de tipo sigma y N tambien, M∆N tiene tipo sigma. 
  
  Reglas de reducción:

  v∆N → v
  M∆v → v
  M∆N → N∆M'
  v1∆v2 -> v1

  c. Solución (requiere CBN):

  F  = λm:Bool. m ∆ false
  M1 = true
  M2 = (λx:Bool. x) true

  F : Bool → Bool ✓
  M1 : Bool ✓, M2 : Bool ✓
  M1 →→ true ✓ (ya es valor)
  M2 →→ true ✓ (1 paso: (λx:Bool. x) true → true)

  F M1 = (λm. m ∆ false) true → true ∆ false → true ✓
    (true es valor, v∆N → v)

  F M2 = (λm. m ∆ false) M2 → M2 ∆ false → false ✓
    (M2 no es valor, false sí es valor, M∆v → v)
    (bajo CBN, M2 se sustituye SIN reducir)


  Tips ej 2:
  - M y N deben tener el mismo tipo en M∆N. Justificación (Clase05, slides 12, 14, 25):
    - Por T-IF (slide 12): es el mismo patrón que if M then N else P, donde N y P deben tener el mismo tipo τ porque no sabés cuál rama se ejecuta.
    - Por Unicidad de tipos (slide 14): todo término tiene UN solo tipo. M∆N tiene que tener un tipo concreto.
    - Por Preservación (slide 25): si ⊢ M∆N : τ y M∆N → N∆M', entonces ⊢ N∆M' : τ. El tipo se mantiene en cada paso. Si M y N tuvieran tipos distintos, el valor final podría tener un tipo distinto al declarado, violando preservación.
    - Slogan: "Well typed programs cannot go wrong" (Robin Milner, slide 26).
  - CBV vs CBN (Clase05, slide 20):
    - CBV (call-by-value): el argumento se reduce a valor ANTES de sustituir. Regla E-APPABS: (λx:τ.M) V → M{x:=V} requiere V valor. Es lo que usa la materia.
    - CBN (call-by-name): el argumento se sustituye SIN reducir.
    - Delta permite observar el camino de reducción (cuántos pasos tarda un término). Bajo CBV, F siempre recibe el valor final (true), no puede distinguir M1 de M2. Bajo CBN sí, porque el argumento entra sin reducir al delta y la "carrera" funciona.

---

## Ejercicio 4 — Unificación

### Conceptos previos

**Tipos con incógnitas** (slide 7, Unificación/Inferencia):

Los tipos se forman con incógnitas (variables de tipo) y constructores:

  τ ::= X_n | C(τ1, ..., τn)

Tipos constantes: Bool, Int, ...
Constructores: (• → •), (• × •), (List •), (Maybe •), ...

Las incógnitas (X1, X2, X3, ...) representan tipos parcialmente conocidos.


**Sustitución** (slide 8):

Una sustitución S es una función que a cada incógnita le asocia un tipo:

  S = {X_k1 := τ1, ..., X_kn := τn}

S(X_ki) = τi para cada 1 ≤ i ≤ n, y S(X_k) = X_k para cualquier otra incógnita.

Si τ es un tipo, S(τ) es el resultado de reemplazar cada incógnita de τ por el valor que le otorga S.

Ejemplo: si S = {X1 := Bool, X3 := (X2 → X2)}, entonces:
  S((X1 → Bool) → X3) = ((Bool → Bool) → (X2 → X2))


**Problema de unificación** (slide 9):

Un problema de unificación es un conjunto finito E de ecuaciones entre tipos:

  E = {τ1 =? σ1, τ2 =? σ2, ..., τn =? σn}

Un **unificador** para E es una sustitución S tal que S(τi) = S(σi) para todo i.

Un problema puede tener infinitos unificadores (slide 10). Por ejemplo:
  E = {X1 =? X2}
tiene como unificadores {X1 := X2}, {X2 := X1}, {X1 := Bool, X2 := Bool}, ...


**Relación "más general"** (slide 11):

Una sustitución S_A es **más general** que S_B si existe una sustitución S_C tal que:

  S_B = S_C ∘ S_A

Es decir, S_B se obtiene instanciando (especializando) las incógnitas de S_A.
Intuitivamente, S_A "deja más libertad" que S_B.

Ejemplo (slide 11): para E = {(X1 → Bool) =? X2}, los unificadores son:
  S1 = {X1 := Bool, X2 := (Bool → Bool)}
  S2 = {X1 := Int, X2 := (Int → Bool)}
  S3 = {X1 := X3, X2 := (X3 → Bool)}
  S4 = {X2 := (X1 → Bool)}

S4 es más general que S3 (instanciar X1 := X3), S3 es más general que S1 (instanciar X3 := Bool), etc. S1 y S2 son incomparables.


**MGU — Unificador más general** (slide 14):

El MGU de E (mgu(E)) es un unificador que es más general que todos los demás unificadores de E.

El algoritmo de Martelli-Montanari (slide 12-13) calcula el MGU si existe, o falla si no. Sus 6 reglas son:
  - **Delete**: elimina ecuaciones triviales (τ =? τ)
  - **Decompose**: descompone ecuaciones entre constructores: C(τ1,...,τn) =? C(σ1,...,σn) → {τ1 =? σ1, ..., τn =? σn}
  - **Swap**: orienta la ecuación poniendo la incógnita a la izquierda
  - **Elim**: sustituye una incógnita resuelta en el resto del sistema
  - **Clash**: falla si los constructores no coinciden (C ≠ C')
  - **Occurs-Check**: falla si X_n =? τ con X_n ≠ τ y X_n ocurre en τ (Baader, Lemma 4.6.9: la ecuación no tiene solución porque |σ(X)| ≤ |σ(t_i)| < |σ(t)|)

Propiedad fundamental (slide 14): el MGU es único **salvo renombre de incógnitas**.


### Resolución

En el ejercicio: S1 ≤ S2 significa "S1 es más general que S2", es decir, ∃S_C: S2 = S_C ∘ S1.


**a) ¿Vale siempre S1 ≤ S2 o S2 ≤ S1?**

**FALSO.** La relación ≤ no es un orden total: existen sustituciones incomparables.

Contraejemplo:
  S1 = {X := Bool}
  S2 = {X := Int}

  S1 ≤ S2 requiere S_C tal que S_C(S1(X)) = S2(X), es decir S_C(Bool) = Int.
  Pero Bool es una constante de tipo (no una incógnita), así que S_C(Bool) = Bool ≠ Int.

  S2 ≤ S1 requiere S_D tal que S_D(Int) = Bool. Mismo problema: Int es constante.

  S1 y S2 son incomparables. (Igual que S1 y S2 del ejemplo de la slide 11.)


**b) ¿Si S1 ≤ S2 y S2 ≤ S1, entonces S1 = S2?**

**FALSO.** Solo se puede concluir que S1 y S2 son iguales **salvo renombre de incógnitas**, no literalmente iguales.

Contraejemplo:
  S1 = {X := Y}
  S2 = {X := Z}    (con Y ≠ Z)

  S1 ≤ S2: tomar S_C = {Y := Z}. Entonces S_C(S1(X)) = S_C(Y) = Z = S2(X). ✓
  S2 ≤ S1: tomar S_D = {Z := Y}. Entonces S_D(S2(X)) = S_D(Z) = Y = S1(X). ✓

  Pero S1 ≠ S2 porque S1(X) = Y ≠ Z = S2(X).

S1 y S2 difieren solo en un renombre de incógnitas (Y ↔ Z). Esto es consistente con la propiedad del MGU: es único "salvo renombre de incógnitas" (slide 14). La relación ≤ no distingue entre sustituciones que solo difieren en los nombres de las incógnitas libres.


**c) ¿Existe siempre T tal que T ≤ S1 y T ≤ S2?**

**VERDADERO.** Tomar T = Id (la sustitución identidad: Id(X) = X para toda incógnita X).

  T ≤ S1 requiere S_C tal que S1 = S_C ∘ Id.
  Tomar S_C = S1: S1(Id(X)) = S1(X) para toda X. ✓

  T ≤ S2 requiere S_D tal que S2 = S_D ∘ Id.
  Tomar S_D = S2: S2(Id(X)) = S2(X) para toda X. ✓

La identidad no instancia ninguna incógnita, dejando máxima libertad. Es la sustitución más general posible: para toda sustitución S vale Id ≤ S (basta tomar S_C = S).
