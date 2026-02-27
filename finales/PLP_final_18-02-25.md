# Final PLP — 18/02/2025

- **Materia:** Paradigmas de Programación (plan 2023)
- **Profesor:** Pablo Barenbaum
- **Fecha:** 18 de febrero de 2025

> Fuente: CubaWiki (reconstrucción por estudiantes).

---

## Ejercicio 1 (Programación funcional — Haskell)

Definición de tipos:

```haskell
data Form = Prop String | And Form Form | Or Form Form | Neg Form
```

**(a)** Definir `foldForm` con su tipo.

**(b)** Implementar `fnn :: Form -> Bool -> Form` usando `foldForm` que convierte una fórmula a **forma normal negada** (si el booleano es `True`) o su negación a forma normal negada (si es `False`).

---

## Ejercicio 2 (Inducción estructural)

Dados:

```haskell
{A0} alt f g []     = []
{A1} alt f g (x:xs) = f x : alt g f xs
```

**Demostrar:** `alt g1 g2 . alt f1 f2 = alt (g1 . f1) (g2 . f2)`

---

## Ejercicio 3 (Deducción natural)

Con nuevas reglas Δi (introducción) y Δe (eliminación).

**Demostrar:**

**(a)** ⊢ τ ⇒ Δτ

**(b)** Δτ ⊢ Δ¬¬τ (sin asumir que ¬¬¬τ = ¬τ)

**(c)** Δτ, Δ¬τ ⊢ σ (sugerencia: usar ⊥ₑ e ítem anterior)

---

## Ejercicio 4 (Programación lógica — Prolog)

Representación de λ-términos: `var(X)`, `lam(X, M)`, `app(M, N)`.

**(a)** Definir `variablesLibres(+M, -L)` que instancia en L las variables libres del término M.

**(b)** Definir `tamano(+M, -T)` que calcula el tamaño del término.

**(c)** Definir `generarLambdaTerminos(+Xs, -M)` que genera λ-términos infinitos basado en tamaño, usando las variables de la lista Xs.
