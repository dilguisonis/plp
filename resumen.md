# Resumen

## Sustituciones y Unificación (clases 07, 09 — guía p5)

**Sustitución:** función que asigna tipos a incógnitas. Ej: S = {X₁ := Bool, X₂ := Nat → Nat}

**Aplicar S a un tipo:** reemplazar cada incógnita por lo que dice S.
- S = {X₁ := Nat}  →  S(X₁ → Bool) = Nat → Bool

**Composición T ∘ S:** primero aplico S, después aplico T al resultado.
- S = {X₁ := X₂ → X₂}, T = {X₂ := Bool}
- (T ∘ S)(X₁) = T(X₂ → X₂) = Bool → Bool
- (T ∘ S)(X₂) = T(X₂) = Bool
- Resultado: T ∘ S = {X₁ := Bool → Bool, X₂ := Bool}

**Problema de unificación (E):** conjunto de ecuaciones entre tipos. Ej: E = {(X₁ → Bool) =? X₂}

**Unificador de E:** sustitución S tal que S iguala ambos lados de cada ecuación.

**S más general que S':** existe T tal que **S' = T ∘ S** (clase 07).
La más general deja más variables libres; las demás se obtienen instanciando.

**mgu(E):** el unificador más general de E. Todo otro unificador se obtiene componiendo algo con el mgu.

### Ejemplo de la teórica (clase 07)

E = { (X₁ → Bool) =? X₂ }. Unificadores:
- S₁ = {X₁ := Bool, X₂ := Bool → Bool}
- S₂ = {X₁ := Int, X₂ := Int → Bool}
- S₃ = {X₁ := X₃, X₂ := X₃ → Bool}
- S₄ = {X₂ := X₁ → Bool}

S₄ es más general que S₁: con T = {X₁ := Bool}, S₁ = T ∘ S₄.
S₄ es más general que S₂: con T = {X₁ := Int}, S₂ = T ∘ S₄.
S₁ y S₂ no son comparables (una fija Bool, otra Int, ninguna se obtiene de la otra).
S₃ ≈ S₄ (salvo renombre de incógnitas).

### Propiedades del orden de generalidad

**Orden parcial vs total:**
- **Orden total:** siempre puedo comparar. Ej: naturales con ≤.
- **Orden parcial:** puede haber incomparables. Ej: conjuntos con ⊆ ({1,2} y {3,4}).

**(a) ¿Es orden total? NO.** Existen sustituciones incomparables.
- S₁ = {X₁ := Bool, X₂ := Bool → Bool} y S₂ = {X₁ := Int, X₂ := Int → Bool}
- No existe T tal que S₁ = T ∘ S₂ ni S₂ = T ∘ S₁ (una fija Bool, otra Int).

**(b) Si S ≤ S' y S' ≤ S, ¿entonces S = S'? NO** (no vale antisimetría estricta).
- S₃ = {X₁ := X₃, X₂ := X₃ → Bool} y S₄ = {X₂ := X₁ → Bool}
- S₄ ≤ S₃: con T = {X₁ := X₃}, S₃ = T ∘ S₄
- S₃ ≤ S₄: con T = {X₃ := X₁}, S₄ = T ∘ S₃
- Son equivalentes (salvo renombre de incógnitas) pero **no iguales**.

**(c) ¿Existe siempre T tal que T ≤ S₁ y T ≤ S₂? (¿hay ínfimo?)** Depende.
- Si S₁ y S₂ no se contradicen en ninguna variable, sí (ej: T = Id si tocan variables distintas, o T renombra a una variable fresca).
- Si se contradicen en la misma variable, puede que sí con un renombre: S₁ = {X₁ := Bool}, S₂ = {X₁ := Int}. Con T = {X₁ := X₃} se obtiene S₁ = {X₃ := Bool} ∘ T y S₂ = {X₃ := Int} ∘ T. Entonces T es más general que ambas.
- **En general sí existe:** la identidad o un renombre a variables frescas siempre es más general que cualquier sustitución, ya que S = S ∘ Id para toda S.

---

## Tipos de datos recursivos y fold (clases 01, 02 — guía p1)

### Leer un `data` en Haskell

En `data AbbCompr a = Nil | Compr [a] | Nodo a (AbbCompr a) (AbbCompr a)`:
- `a` es una variable de tipo (ej: Int, Bool). Se respeta en toda la estructura.
- `|` separa constructores: un `AbbCompr a` es **uno** de los tres: `Nil`, `Compr [a]`, o `Nodo a (AbbCompr a) (AbbCompr a)`.
- Donde aparece `AbbCompr a` dentro de un constructor, ahí hay **recursión**: puede ser cualquiera de los tres constructores otra vez.

Ejemplo válido:
```haskell
Nodo 5 (Compr [1,3]) (Nodo 8 Nil (Compr [9,10]))
```
Hijo izq es `Compr`, hijo der es `Nodo` con un `Nil` y un `Compr`.

### Fold: reemplazar constructores por funciones

El fold recibe una función por cada constructor. Donde hay tipo recursivo (`AbbCompr a`), el fold ya hizo la recursión y entrega `b`.

Para `AbbCompr a`:
- `Nil` no tiene argumentos → se reemplaza por un valor de tipo `b`
- `Compr [a]` tiene una lista → función `[a] -> b`
- `Nodo a (AbbCompr a) (AbbCompr a)` → función `a -> b -> b -> b` (los `AbbCompr a` ya se convirtieron en `b`)

### Equivalencia semántica (no estructural)

`Compr [0,1,2]` representa los mismos elementos que `Nodo 1 (Nodo 0 Nil Nil) (Nodo 2 Nil Nil)`. Para comparar igualdad hay que comparar los **elementos** que representan, no la estructura.
