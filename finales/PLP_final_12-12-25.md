# Final PLP — 12/12/2025

- **Materia:** Paradigmas de Programación (plan 2023)
- **Profesor:** Christian Cossio Mercado
- **Fecha:** 12 de diciembre de 2025

> Fuente: CubaWiki (reconstrucción por estudiantes).

---

## Ejercicio 1 (Programación funcional)

Se definen tipos para un "Árbol Trébol":

```haskell
data Indice = I1 | I2 | I3
data AT a = Hoja a | Nodo (Indice -> AT a)
```

> **Nota:** Todo nodo SIEMPRE tiene 3 árboles trébol asociados (uno por cada valor de `Indice`).

**a)** Dar el tipo e implementar `foldAT`.

**b)** Definir la función `altura :: AT a -> Int`.

**c)** Dar el tipo e implementar `mapAT` que, dada una función, se la aplica a todas las hojas.

---

## Ejercicio 2 (Cálculo lambda tipado)

Se extiende el cálculo lambda con un operador ∆. La expresión M∆N reduce M y N de manera intercalada: primero reduce en un paso a M, luego reduce en un paso a N, luego reduce en otro paso a M, y así sucesivamente, hasta que ambos sean valores.

**a)** Extender los términos y las reglas de tipado.

**b)** Extender los valores y la semántica operacional. Decidir qué ocurre si M y N ya son valores.

**c)** Proporcionar tres términos cerrados F, M1, M2 tales que:
- `F :: Bool → Bool`
- `M1 :: Bool`, `M2 :: Bool`
- `M1 →* true`, `M2 →* true`
- `F M1 →* true`, `F M2 →* false`

---

## Ejercicio 3 (Programación lógica)

Implementar el predicado:

```prolog
generarRompecabezas(+S, -R)
```

basado en el ejercicio de "rompecabezas" de parciales anteriores (ver también ejercicio 3 del final 08/08/2025).

---

## Ejercicio 4 (Unificación)

Verdadero o falso (justificar). Dada la relación S1 ≤ S2 (S1 es más general que S2):

**a)** ¿Vale siempre S1 ≤ S2 o S2 ≤ S1 para dos sustituciones cualesquiera?

**b)** ¿Si S1 ≤ S2 y S2 ≤ S1, entonces S1 = S2?

**c)** ¿Existe siempre una sustitución T tal que T ≤ S1 y T ≤ S2?
