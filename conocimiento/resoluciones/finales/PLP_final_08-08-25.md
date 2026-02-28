# Final PLP — 08/08/2025

- **Materia:** Paradigmas de Programación (plan 2023)
- **Profesor:** Pablo Barenbaum
- **Fecha:** 8 de agosto de 2025

---

## Ejercicio 1 (Programación funcional)

Dos tipos son **isomorfos** si existen 2 funciones:

- `f :: a -> b`
- `g :: b -> a`

tales que `f . g = id` y `g . f = id`.

Teniendo los siguientes tipos de dato:

```haskell
Either a b = left a | right b
AB a = nil | bin a (AB a) (AB a)
AX a b = vacio | nodoA a (AX a b) (AX a b) | nodoAB a b (AX a) (AX a)
```

Demostrar que los tipos `(AX a b)` y `AB (either a (a,b))` son isomorfos.

---

## Ejercicio 2 (Cálculo lambda tipado)

Se cuenta con cálculo lambda extendido con booleanos y pares.

Se quiere extender para introducir **pattern matching**.

El patrón **P** puede tomar las siguientes formas:

```
P ::= x | V | <P, P>
```

Que representan una variable, un valor, y un par de patrones respectivamente.

Se agrega el siguiente término:

```
Match P ~ M1 then M2 else M3
```

El comportamiento esperado es el siguiente:

- Se evalúa M1 hasta obtener un valor.
- Si ese valor "concuerda" con P, se procede a evaluar M2.
- De lo contrario se evalúa M3.

P y M1 "concuerdan" de la siguiente manera:

- Si P es una variable **x**, concuerda con cualquier valor ligándose a ese valor.
- Si P es un valor **V**, solo concuerda con el mismo valor.
- Si P es un par **<P1, P2>**, concuerda con otro valor si ese valor es un par <x, y> donde P1 concuerda con x y P2 concuerda con y.

**a)** Extender las reglas de tipado para que los patrones estén tipados correctamente.

**b)** Dar una derivación de tipo para la siguiente expresión:

```
Match <x,y> ~ p then <y, x> else p
```

**c)** Extender el conjunto de valores y dar las nuevas reglas de semántica.

**d)** Reducir la siguiente expresión:

```
Match <x, y> ~ <1,2> then <y, x> else <0,0>
```

---

## Ejercicio 3 (Programación lógica)

Dos listas l1 y l2 son **componibles** si tienen un elemento en común que los permite "concatenar".

- Por ejemplo, `[1,2,3]` es componible con `[3,4,5]` y la concatenación de esas dos listas es `[1,2,3,4,5]`.

Se extiende de manera obvia a n listas, [l1, ..., ln]:

- Por ejemplo, `[1,2]` `[2,3]` `[3,4]` `[4,5]` son componibles y resulta en la lista `[1,2,3,4,5]`.

Un **rompecabezas** es una lista de listas tal que son componibles para algún orden:

- Ej: la solución `[1,2,3,4,5]` tiene como rompecabezas la lista `[[2,3,4],[1,2],[4,5]]` (en este caso es la única solución).

Implementar el predicado:

```prolog
generarRompecabezas(+S, -R)
```

que dado una lista solución S, instancia en R todos los rompecabezas que tienen a S como solución.

---

## Ejercicio 4 (Deducción natural)

Se extiende deducción natural con las siguientes reglas:

**Introducción (Θᵢ):**

```
  Γ ⊢ α    Γ, τ ⊢ ⊥
  ──────────────────── Θᵢ
     Γ ⊢ α Θ τ
```

**Eliminación (Θₑ):**

```
  Γ ⊢ α Θ τ    Γ, α ⊢ τ
  ──────────────────────── Θₑ
          Γ ⊢ ρ
```

Demostrar que:

a) ¬(α ⇒ τ) ⊢ α Θ τ

b) ¬(α Θ τ) ⊢ α ⇒ τ
