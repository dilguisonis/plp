# Final PLP — 01/08/2025

- **Materia:** Paradigmas de Programación (plan 2023)
- **Profesor:** Pablo Barenbaum
- **Fecha:** 1 de agosto de 2025

---

## Ejercicio 1 (Razonamiento ecuacional)

Consideramos el tipo de datos de los árboles binarios:

```haskell
data AB a = Nil | Bin (AB a) a (AB a)
```

y las siguientes funciones:

```haskell
{P0} post Nil           = []
{P1} post (Bin i x d)   = post d ++ post i ++ [x]

{M0} map f []            = []
{M1} map f (x : xs)      = f x : map f xs

{A0} mapA f Nil           = []
{A1} mapA f (Bin i x d)  = [f x] ++ mapA f i ++ mapA f d

{R0} rev ac []            = ac
{R1} rev ac (x : xs)      = rev (x : ac) xs
```

Demostrar que para toda `f :: a -> b` vale `map f . post = rev [] . mapA f`.

---

## Ejercicio 2 (Programación funcional / resolución)

Suponemos que contamos con los siguientes tipos de datos y funciones en Haskell para modelar la resolución SLD:

- `CláusulaDeDefinición` — tipo de las cláusulas de definición.
- `CláusulaObjetivo` — tipo de las cláusulas objetivo.
- `esVacía :: CláusulaObjetivo -> Bool` — función que indica si una cláusula es □.
- `resolvente :: CláusulaObjetivo -> CláusulaDeDefinición -> CláusulaObjetivo` — función que calcula la resolvente entre dos cláusulas.

Definir una función:

```haskell
existeRefutaciónSLD :: [CláusulaDeDefinición] -> CláusulaObjetivo -> Bool
```

que indique si existe una refutación SLD. En caso de que la refutación exista, la función debe devolver `True`. En caso de que la refutación no exista, la función debe devolver `False`, o posiblemente indefinirse (por no terminación).

---

## Ejercicio 3 (Deducción natural)

Extendemos las fórmulas de la lógica de primer orden con un nuevo cuantificador ⊙x.τ con las siguientes reglas de introducción y eliminación:

**Introducción (⊙ᵢ):**

```
  Γ, ¬τ{x := t} ⊢ ⊥
  ──────────────────── ⊙ᵢ
      Γ ⊢ ⊙x.τ
```

**Eliminación (⊙ₑ):**

```
  Γ ⊢ ⊙x.τ    Γ ⊢ ¬τ    x ∉ fv(Γ)
  ──────────────────────────────────── ⊙ₑ
                Γ ⊢ ⊥
```

Demostrar que ⊢ (⊙x.P(f(x))) ⇒ ⊙x.P(x).

**Ayuda:** el significado intuitivo del nuevo cuantificador es equivalente al del cuantificador existencial usual.

---

## Ejercicio 4 (Programación lógica)

Representamos en Prolog las fórmulas de la lógica proposicional con los símbolos de función binarios `and` (conjunción), `or` (disyunción), `imp` (implicación); el símbolo unario `neg` (negación), y el símbolo de función unario `prop` de tal modo que `prop(n)` representa la n-ésima variable proposicional. Se puede asumir que en una fórmula `prop(n)` el valor de n siempre es positivo. Por ejemplo, la fórmula P₁ ∨ ¬(P₂ ∧ ¬P₂) se representa como:

```prolog
or(prop(1), neg(and(prop(2), neg(prop(2)))))
```

Definir un predicado `esTautologia(+Form)` que, dada una fórmula `Form`, sea verdadero si todas las valuaciones la satisfacen.
