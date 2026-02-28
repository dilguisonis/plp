# Practica N° 5 - Inferencia de tipos

**Paradigmas de Programacion (PLP) - 2do Cuatrimestre de 2025**

---

## Aclaraciones

Los ejercicios marcados con el simbolo ★ constituyen un subconjunto minimo de ejercitacion. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

## Gramaticas a tener en cuenta

- **Terminos anotados**

  ```
  M ::= x | λx:σ.M | M M | True | False | if M then M else M
       | zero | succ(M) | pred(M) | isZero(M)
  ```

  Donde la letra *x* representa un *nombre de variable* arbitrario. Tales nombres se toman de un conjunto infinito dado X = {w, w₁, w₂, ..., x, x₁, x₂, ..., y, y₁, y₂, ..., f, f₁, f₂, ...}

- **Terminos sin anotaciones**

  ```
  U ::= x | λx.U | U U | True | False | if U then U else U
       | zero | succ(U) | pred(U) | isZero(U)
  ```

- **Tipos**

  ```
  τ ::= Bool | Nat | τ → τ | Xₙ
  ```

  Donde *n* es un numero natural, de tal modo que Xₙ representa una *variable de tipos* arbitraria tomada de un conjunto T = {X₁, X₂, X₃, ...}.

  **Nota:** tambien podemos referirnos a las variables de tipos como *incognitas*.

---

## Ejercicio 1

Determinar que expresiones son sintacticamente validas y, para las que lo sean, indicar a que gramatica pertenecen (tipos, terminos anotados o terminos sin anotaciones).

```
I.    λx : Bool.succ(x)                  V.    X₁
II.   λx.isZero(x)                       VI.   X₁ → (Bool → X₂)
III.  X₁ → σ                             VII.  λx : X₁ → X₂. if zero then True else zero succ(True)
IV.   erase(f y)                          VIII. erase(λf : Bool → Bool.λy : Bool.f y)
```

---

## Ejercicio 2

Determinar el resultado de aplicar la sustitucion *S* a las siguientes expresiones

```
I.  S = {X₁ := Nat}                  S({x : X₁ → Bool})

II. S = {X₁ := X₂ → X₃, X₄ := Bool}   S({x : X₄ → Bool}) ⊢ S(λx : X₁ → Bool.x) : S(Nat → X₂)
```

---

## Ejercicio 3

Unir con flechas los tipos que unifican entre si (entre una fila y la otra). Para cada par unificable, exhibir el *mgu* ("most general unifier").

```
Fila 1:    X₁ → X₂        Nat        X₂ → Bool        X₃ → X₄ → X₅

Fila 2:    X₁          Nat → Bool   (Nat → X₂) → Bool   Nat → X₂ → Bool
```

---

## Ejercicio 4

Decidir, utilizando el algoritmo de inferencia, cuales de las siguientes expresiones son tipables. Mostrar que reglas y sustituciones se aplican en cada paso y justificar por que no son tipables aquellas que fallan.

```
I.    λz. if z then zero else succ(zero)
II.   λy. succ((λx.x) y)
III.  λx. if isZero(x) then x else (if x then x else x)
IV.   λx.λy. if x then y else succ(zero)
V.    if True then (λx.zero)zero else (λx.zero)False
VI.   (λf. if True then f zero else f False) (λx. zero)
VII.  λx.λy.λz. if z then y else succ(x)
```

---

## Ejercicio 5 ★

Utilizando el algoritmo de inferencia, inferir el tipo de las siguientes expresiones o demostrar que no son tipables. En cada paso donde se realice una unificacion, mostrar el conjunto de ecuaciones a unificar y la sustitucion obtenida como resultado de la misma.

- λx. λy. λz. z x y z
- λx. x (w (λy.w y))
- λx.λy. xy
- λx.λy. yx
- λx.(λx. x)
- λx.(λy. y)x
- (λz.λx. x (z (λy. z))) True

---

## Ejercicio 6 *(Numerales de Church)*

Indicar tipos σ y τ apropiados de modo que los terminos de la forma λy : σ.λx : τ.yⁿ(x) resulten tipables para todo *n* natural. El par (σ, τ) debe ser el mismo para todos los terminos. Observar si tienen todos el mismo tipo. Notacion: M⁰(N) = N, Mⁿ⁺¹(N) = M(Mⁿ(N)). *Sugerencia:* empezar haciendo inferencia para n = 2 -- es decir, calcular el juicio de tipado mas general para λy.λx.y(yx) -- y generalizar el resultado.

---

## Ejercicio 7

I. Utilizar el algoritmo de inferencia sobre la siguiente expresion: λy.(x y) (λz.x₂)

II. Una vez calculado, demostrar (utilizando chequeo de tipos) que el juicio encontrado es correcto.

III. Que ocurriria si x₂ fuera x?

---

## Ejercicio 8

Tener en cuenta el tipo de los pares definido como:

```
τ ::= ... | τ × τ
```

Con expresiones nuevas definidas como:

```
M ::= ... | ⟨M, M⟩ | π₁(M) | π₂(M)
```

Y las siguientes reglas de tipado:

```
  Γ ⊢ M : τ    Γ ⊢ N : σ             Γ ⊢ M : τ × σ             Γ ⊢ M : τ × σ
 ─────────────────────────           ───────────────            ───────────────
   Γ ⊢ ⟨M, N⟩ : τ × σ               Γ ⊢ π₁(M) : τ             Γ ⊢ π₂(M) : σ
```

Se extiende el algoritmo I con las siguientes reglas:

```
I(Γ | ⟨M₁, M₂⟩) = (τ × σ | E₁ ∪ E₂)
```
donde:
- I(Γ | M₁) = (τ | E₁)
- I(Γ | M₂) = (σ | E₂)

```
I(Γ | π₁(M)) = (σ | {τ =? σ × ρ} ∪ E)        I(Γ | π₂(M)) = (ρ | {τ =? σ × ρ} ∪ E)
```
donde I(Γ | M) = (τ | E)

I. Tipar la expresion (λf.⟨f,2⟩) (λx.x 1) utilizando la version extendida del algoritmo.

II. Intentar tipar la siguiente expresion utilizando la version extendida del algoritmo.

   (λf.⟨f 2, f True⟩) (λx.x)

   Mostrar en que punto la inferencia falla y por que motivo.

---

## Ejercicio 9 ★

Se extienden el Calculo Lambda y algoritmo de inferencia para soportar uniones disjuntas de la siguiente manera:

```
τ  ::=  ... | τ + τ
M  ::=  ... | leftτ(M) | rightτ(M) | case M of left(x) ⇝ M ‖ right(y) ⇝ M
```

```
I(Γ | leftσ(M)) = (τ + σ | E)              I(Γ | rightτ(M)) = (σ + τ | E)
donde I(Γ | M) = (τ | E)                   donde I(Γ | M) = (τ | E)
```

```
I(Γ | case M₁ of left(x) ⇝ M₂ ‖ right(y) ⇝ M₃) = (τ₂ | {τ₁ =? Xₓ + X_y, τ₂ =? τ₃} ∪ E₁ ∪ E₂ ∪ E₃)
```
donde:
- I(Γ | M₁) = (τ₁ | E₁)
- I(Γ, x : Xₓ | M₂) = (τ₂ | E₂)
- I(Γ, y : X_y | M₃) = (τ₃ | E₃)
- Xₓ y X_y variables frescas.

Utilizando esta extension del algoritmo, encontrar los juicios de tipado mas generales para los siguientes terminos o indicar por que no es posible:

```
I.    case left(1) of left(x) ⇝ isZero(x) ‖ right(y) ⇝ True

II.   case right(z) of left(x) ⇝ isZero(x) ‖ right(y) ⇝ y

III.  case right(zero) of left(x) ⇝ isZero(x) ‖ right(y) ⇝ y

IV.   case x of left(x) ⇝ isZero(x) ‖ right(y) ⇝ y

V.    case left(z) of left(x) ⇝ z ‖ right(y) ⇝ y

VI.   case z of left(x) ⇝ z ‖ right(y) ⇝ y
```

---

## Ejercicio 10

Se extienden el Calculo Lambda y algoritmo de inferencia para soportar listas de la siguiente manera:

```
τ  ::=  ... | [τ]
M  ::=  ... | [ ]τ | M :: M | foldr M base ↪ M; rec(h, r) ↪ M
```

```
I(Γ | [ ]τ) = ([τ] | ∅)
```

```
I(Γ | M₁ :: M₂) = (τ₂ | {τ₂ =? [τ₁]} ∪ E₁ ∪ E₂)
```
donde:
- I(Γ | M₁) = (τ₁ | E₁)
- I(Γ | M₂) = (τ₂ | E₂)

```
I(Γ | foldr M₁ base ↪ M₂; rec(h, r) ↪ M₃) = (τ₂ | {τ₁ =? [Xₕ], τ₂ =? τ₃, τ₃ =? Xᵣ} ∪ E₁ ∪ E₂ ∪ E₃)
```
donde:
- I(Γ | M₁) = (τ₁ | E₁)
- I(Γ | M₂) = (τ₂ | E₂)
- I(Γ, h : Xₕ, r : Xᵣ | M₃) = (τ₃ | E₃)
- Xₕ y Xᵣ variables frescas.

Utilizando esta extension del algoritmo, encontrar los juicios de tipado mas generales para los siguientes terminos o indicar por que no es posible:

```
I.    foldr x :: [ ] base ↪ [ ]; rec(h, r) ↪ isZero(h) :: r

II.   foldr (λx.succ(x)) :: [ ] base ↪ [ ]; rec(h, r) ↪ if p x then x :: r else r

III.  foldr x base ↪ x; rec(h, r) ↪ isZero(h) :: r

IV.   foldr x base ↪ True; rec(h, x) ↪ x
```
