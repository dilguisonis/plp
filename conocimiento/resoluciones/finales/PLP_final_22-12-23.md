# Final PLP — 22/12/2023

- **Materia:** Paradigmas de Lenguajes de Programación (plan viejo)
- **Profesor:** Pablo Barenbaum
- **Fecha:** 22 de diciembre de 2023

> Fuente: CubaWiki (reconstrucción por estudiantes).

---

## Ejercicio 1 (Lógica de primer orden)

Determinar si las siguientes fórmulas son válidas o no (justificar):

**a)** ∀x ∃y : x + y = x

**b)** (∃x P(x)) ∨ (∃x P(¬x))

---

## Ejercicio 2 (Programación lógica — Prolog)

Se define la **descomposición en 1 paso** de una lista: se reemplaza un elemento por dos elementos que sumen el original, ambos ≥ 1.

Ejemplo: `[2, 3, 1]` → `[2, 2, 1, 1]` (se descompuso el 3 en 2 + 1).

Se define la **descomposición en N pasos** aplicando N descomposiciones de 1 paso sucesivamente.

Ejemplo con N = 2: `[2, 3, 1]` → `[2, 1, 1, 1, 1]`.

Implementar una función que, dada una lista, devuelva todas las descomposiciones posibles.

---

## Ejercicio 3 (Programación funcional — Haskell)

Se define el tipo de los números naturales:

```haskell
data Nat = Zero | Succ Nat
```

Dada una función `F :: [Nat] -> Nat` que es total y biyectiva, implementar `F⁻¹` (la inversa de F) en Haskell si es posible, o justificar por qué no.

---

## Ejercicio 4 (Cálculo sigma)

Implementar un objeto M que reciba el mensaje `memoizar` y un objeto `o` que sabe responder al mensaje `f`. El objeto debe cachear el valor computado: si `o.f` no fue calculado previamente, calcularlo y guardarlo; si ya existe el resultado, devolverlo sin recomputar.

---

## Ejercicio 5 (Cálculo lambda)

Definir las reglas de tipado y las reglas de reducción para `Rec` sobre listas (recursión sobre listas en el cálculo lambda tipado).
