# Final PLP — 25/07/2025

- **Materia:** Paradigmas de Programación (plan 2023)
- **Profesor:** Pablo Barenbaum
- **Fecha:** 25 de julio de 2025

---

## Ejercicio 1 (Programación funcional)

Considerar la siguiente función:

```haskell
foldu z f []       = z
foldu z f (x : xs) = f (x (foldu z f xs)) (foldu z f xs)
```

a) Dar el tipo de `foldu`.

b) Definir `foldr` sin usar recursión explícita, usando `foldu`.

c) Definir `foldu` sin usar recursión explícita, usando `foldr`.

---

## Ejercicio 2 (Razonamiento ecuacional)

Notamos `Nat` al tipo de los naturales (enteros no negativos). Contamos con la operación que devuelve el máximo entre dos naturales:

```haskell
max :: Nat -> Nat -> Nat
max x y = if x > y then x else y
```

Se asume ya demostrado que la operación `max` es conmutativa, asociativa y que `0` es el elemento neutro, es decir:

- **Conmutatividad:** ∀x y :: Nat. `max x y = max y x`.
- **Asociatividad:** ∀x y z :: Nat. `max x (max y z) = max (max x y) z`.
- **Elemento neutro:** ∀x :: Nat. `max 0 x = x`.

Se definen además dos funciones `maxr` y `maxl` para calcular el máximo elemento de una lista de números naturales:

```haskell
maxr :: [Nat] -> Nat
{MR0} maxr []       = 0
{MR1} maxr (x : xs) = max x (maxr xs)

maxl :: Nat -> [Nat] -> Nat
{ML0} maxl ac []       = ac
{ML1} maxl ac (x : xs) = maxl (max x ac) xs
```

Las funciones `(++)` y `reverse` son las usuales:

```haskell
(++) :: [a] -> [a] -> [a]
{A0} []       ++ ys = ys
{A1} (x : xs) ++ ys = x : (xs ++ ys)

reverse :: [a] -> [a]
{R0} reverse []       = []
{R1} reverse (x : xs) = reverse xs ++ [x]
```

Demostrar que ∀xs :: [Nat]. `maxr (reverse xs) = maxl 0 xs`

---

## Ejercicio 3 (Programación lógica)

Un **árbol general** es o bien el símbolo `x` o bien una lista de árboles generales.
Por ejemplo, los siguientes son árboles generales:

```
x    []    [x,x]    [[x,x],x,[x,x]]    [x,[x,x,[x,[],[x,x]],x],[x,[]]]
```

Definir en Prolog un predicado `arbolGeneral(-A)` que genere todos los posibles árboles generales.

---

## Ejercicio 4 (Deducción natural)

Se define un nuevo conectivo binario ⊕, con las siguientes reglas de introducción y eliminación:

**Introducción (⊕ᵢ):**

```
  Γ, ¬τ, ¬σ ⊢ ⊥
  ──────────────── ⊕ᵢ
    Γ ⊢ τ ⊕ σ
```

**Eliminación (⊕ₑ):**

```
  Γ ⊢ τ ⊕ σ    Γ, τ ⊢ ⊥    Γ, σ ⊢ ⊥
  ──────────────────────────────────────── ⊕ₑ
                 Γ ⊢ ⊥
```

Dar derivaciones para los siguientes secuentes:

a) τ ∨ σ ⊢ τ ⊕ σ

b) τ ⊕ σ ⊢ τ ∨ σ

---

## Ejercicio 5 (Resolución)

Dar ejemplos de fórmulas que producen el siguiente comportamiento en el método de resolución.

a) Hay secuencias de aplicaciones de la regla de resolución que producen infinitas cláusulas distintas. **Hay** una refutación que conduce a la cláusula vacía.

b) Hay secuencias de aplicaciones de la regla de resolución que producen infinitas cláusulas distintas. **No hay** una refutación que conduce a la cláusula vacía.
