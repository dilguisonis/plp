# Final PLP — 16/12/2024

- **Materia:** Paradigmas de Programación (plan 2023)
- **Profesor:** Hernán Melgratti
- **Fecha:** 16 de diciembre de 2024

> Fuente: CubaWiki (reconstrucción por estudiantes).

---

## Ejercicio 1 (Programación funcional)

Dada la estructura:

```haskell
data Dato a b = C1 | C2 a | C3 b (Dato a b) (Dato a b)
```

Se solicita:

a) Definir recursión primitiva para `Dato a b`.

b) Definir recursión estructural basada en recursión primitiva.

c) Definir una función `split` que extraiga dos listas (una con valores de tipo `a`, otra con tipo `b`) usando `fold` o `rec`.

---

## Ejercicio 2 (Cálculo lambda tipado)

Sobre una extensión λ* con ∅ ⊢ M : σ y clausura transitivo-reflexiva →*.

Tres afirmaciones de verdadero/falso sobre progreso y preservación de tipos.

---

## Ejercicio 3 (Inferencia de tipos)

Análisis de variantes en la regla de inferencia de aplicación de términos, identificando errores en dos versiones alternativas sobre unificación de contextos y asignación de variables de tipo.

---

## Ejercicio 4 (Programación lógica)

Programa Prolog con predicados `p`, `q`, `r`, `s`.

a) Dibujar el árbol de búsqueda para la consulta `s(X, Y)`.

b) Análisis de cláusulas `{P(X, X)}` y `{¬P(X, f(Y))}` con unificación.

---

## Ejercicio 5 (Programación lógica)

Representación de grafos como listas de aristas. Definir:

a) `caminosSimples` — caminos sin repetir nodos.

b) `aciclico` — determinar si un grafo es acíclico.

c) `caminos` — encontrar todos los caminos (con manejo de ciclos).

d) Analizar reversibilidad sobre los parámetros.

---

## Ejercicio 6 (Deducción natural)

Prueba mediante deducción natural:

```
∀X(P(X) ∨ Q(X)) → ¬(∃Z(¬P(Z) ∧ ¬Q(Z)))
```

Análisis de correspondencia Curry-Howard con término lambda sobre unión disjunta.

---

## Ejercicio 7 (Smalltalk)

Jerarquía de clases Smalltalk: A → B → C → D, con métodos `n` y `m`.

Evaluación de `(D new) n` y `(D new) m` con `new` sobrescrito.
