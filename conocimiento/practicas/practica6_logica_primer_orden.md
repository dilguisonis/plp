# Practica N° 6 - Logica de primer orden

**Paradigmas de Programacion (PLP) - 2do Cuatrimestre de 2025**

---

**Aclaraciones:**

Los ejercicios marcados con el simbolo ★ constituyen un subconjunto minimo de ejercitacion. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

---

## Sintaxis de la Logica de Primer Orden

### Ejercicio 1

Dados F = {d, f, g}, donde d tiene aridad 0, f aridad 2 y g aridad 3. ¿Cuales de las siguientes cadenas son terminos sobre F?

I. `g(d, d)`

II. `f(X, g(Y, Z), d)`

III. `g(X, f(d, Z), d)`

IV. `g(X, h(Y, Z), d)`

V. `f(f(g(d, X), f(g(d, X), Y, g(Y, d)), g(d, d)), g(f(d, d, X), d), Z)`

### Ejercicio 2

Sean c una constante, f un simbolo de funcion de aridad 1 y S y B, dos simbolos de predicado binarios. ¿Cuales de las siguientes cadenas son formulas?

I. `S(c, X)`

II. `B(c, f(c))`

III. `f(c)`

IV. `B(B(c, X), Y)`

V. `S(B(c), Z)`

VI. `(B(X, Y) ⇒ (∃Z.S(Z, Y)))`

VII. `(S(X, Y) ⇒ S(Y, f(f(X))))`

VIII. `B(X, Y) ⇒ f(X)`

IX. `S(X, f(Y)) ∧ B(X, Y)`

X. `∀X.B(X, f(X))`

XI. `∃X.B(Y, X(c))`

### Ejercicio 3

Sea σ = ∃X.P(Y, Z) ∧ ∀Y.¬Q(Y, X) ∨ P(Y, Z)

I. Identificar todas las variables libres y ligadas.

II. Calcular σ{X := W}, σ{Y := W}, σ{Y := f(X)} y σ{Z := g(Y, Z)}.

### Ejercicio 4

Dada σ = ¬∀X.(∃Y.P(X, Y, Z)) ∧ ∀Z.P(X, Y, Z)

I. Identificar todas las variables libres y ligadas.

II. Calcular σ{X := t}, σ{Y := t} y σ{Z := t} con t = g(f(g(Y, Y)), Y).

III. Calcular σ{X := t, Y := t, Z := t} con t = g(f(g(Y, Y)), Y).

IV. Calcular σ({X := t} ∘ {Y := t} ∘ {Z := t}) con t = g(f(g(Y, Y)), Y).

---

## Unificacion

### Ejercicio 5 ★

Unir con flechas las expresiones que unifican entre si (entre una fila y la otra). Para cada par unificable, exhibir el *mgu* ("most general unifier"). Asumir que a es una constante, X, Y, Z son variables, f y g son simbolos de funcion, y P y Q predicados.

```
P(f(X))    P(a)    P(Y)    Q(X, f(Y))    Q(X, f(Z))    Q(X, f(a))    X        f(X)

P(X)       P(f(a)) P(g(Z)) Q(f(Y), X)    Q(f(Y), f(X)) Q(f(Y), Y)   f(f(c))  f(g(Y))
```

### Ejercicio 6 ★

Determinar, para cada uno de los siguientes pares de terminos de primer orden, si son unificables o no. En cada caso justificar su respuesta exhibiendo una secuencia exitosa o fallida (segun el caso) del algoritmo de Martelli-Montanari. Asimismo, en caso de que los terminos sean unificables indicar el *mgu* ("most general unifier").

Notacion: X, Y, Z variables; a, b, c constantes; f, g simbolos de funcion.

I. `f(X, X, Y)` y `f(a, b, Z)`

II. `Y` y `f(X)`

III. `f(g(c, Y), X))` y `f(Z, g(Z, a))`

IV. `f(a)` y `g(Y)`

V. `f(X)` y `X`

VI. `g(X, Y)` y `g(f(Y), f(X))`

### Ejercicio 7

Preguntas para pensar.

I. La relacion entre terminos *unifica con*, ¿es reflexiva? ¿Es simetrica? ¿Es transitiva?

II. ¿Existe algun termino t tal que todo termino s unifique con el?

III. ¿Como aplicaria el algoritmo de unificacion al problema de determinar si, dado un conjunto finito de terminos, existe un unificador comun a todos?

### Ejercicio 8 ★

Sean las constantes Nat y Bool y la funcion binaria → (representada como un operador infijo), determinar el resultado de aplicar el algoritmo MGU ("most general unifier") sobre las ecuaciones planteadas a continuacion. En caso de tener exito, mostrar la sustitucion resultante.

I. MGU {T₁ → T₂ ≐ Nat → Bool}

II. MGU {T₁ → T₂ ≐ T₃}

III. MGU {T₁ → T₂ ≐ T₂}

IV. MGU {(T₂ → T₁) → Bool ≐ T₂ → T₃}

V. MGU {T₂ → T₁ → Bool ≐ T₂ → T₃}

VI. MGU {T₁ → Bool ≐ Nat → Bool, T₁ ≐ T₂ → T₃}

VII. MGU {T₁ → Bool ≐ Nat → Bool, T₂ ≐ T₁ → T₁}

VIII. MGU {T₁ → T₂ ≐ T₃ → T₄, T₃ ≐ T₂ → T₁}

---

## Deduccion natural

### Ejercicio 9 ★

Demostrar en deduccion natural que vale ⊢ σ para cada una de las siguientes formulas, **sin usar principios de razonamiento clasicos**, salvo que se indique lo contrario:

I. Intercambio (∀): ∀X.∀Y.P(X, Y) ⟺ ∀Y.∀X.P(X, Y).

II. Intercambio (∃): ∃X.∃Y.P(X, Y) ⟺ ∃Y.∃X.P(X, Y).

III. Intercambio (∃/∀): ∃X.∀Y.P(X, Y) ⟹ ∀Y.∃X.P(X, Y).

IV. Universal implica existencial: ∀X.P(X) ⟹ ∃X.P(X).

V. Diagonal (∀): ∀X.∀Y.P(X, Y) ⟹ ∀X.P(X, X).

VI. Diagonal (∃): ∃X.P(X, X) ⟹ ∃X.∃Y.P(X, Y).

VII. de Morgan (I): ¬∃X.P(X) ⟺ ∀X.¬P(X).

VIII. de Morgan (II): ¬∀X.P(X) ⟺ ∃X.¬P(X).
Para la direccion ⇒ es necesario usar principios de razonamiento clasicos.

IX. Universal/conjuncion: ∀X.(P(X) ∧ Q(X)) ⟺ (∀X.P(X) ∧ ∀X.Q(X)).

X. Universal/disyuncion: ∀X.(P(X) ∨ σ) ⟺ (∀X.P(X)) ∨ σ, asumiendo que X ∉ fv(σ).
Para la direccion ⇒ es necesario usar principios de razonamiento clasicos.

XI. Existencial/disyuncion: ∃X.(P(X) ∨ Q(X)) ⟺ (∃X.P(X) ∨ ∃X.Q(X)).

XII. Existencial/conjuncion: ∃X.(P(X) ∧ σ) ⟺ (∃X.P(X) ∧ σ), asumiendo que X ∉ fv(σ).

XIII. Principio del bebedor: ∃X.(P(X) ⟹ ∀X.P(X)).
En este item es necesario usar principios de razonamiento clasicos.

### Ejercicio 10 ★

Demostrar en deduccion natural: (∀X.∀Y.R(X, f(Y))) ⇒ (∀X.R(X, f(f(X)))).

### Ejercicio 11

Una formula σ esta en *forma normal negada* (f.n.n.) si se puede producir con la siguiente gramatica:

```
σ ::= P(t₁, ..., tₙ) | ¬P(t₁, ..., tₙ) | σ ∧ σ | σ ∨ σ | ∀X. σ | ∃X. σ
```

Es decir, una formula esta en f.n.n. si no tiene ocurrencias del conectivo de la implicacion (⇒) y todas las ocurrencias del conectivo de la negacion (¬) acompanan a formulas atomicas (es decir, la negacion solo puede encontrarse en las "hojas" de la formula). Demostrar que toda formula σ es equivalente a una formula en forma normal negada. Es decir, para cada formula σ existe una formula σ' en f.n.n. tal que ⊢ σ ⟺ σ'.

### Ejercicio 12

Una formula σ esta en *forma normal prenexa* (f.n.p.) si es de la forma Q₁X₁ ... QₙXₙ. τ donde cada Qᵢ es un cuantificador (∀ o ∃) y τ es una formula en forma normal negada sin ocurrencias de cuantificadores. Demostrar que toda formula σ es equivalente a una formula en forma normal prenexa. Es decir, para cada formula σ existe una formula σ' en f.n.p. tal que ⊢ σ ⟺ σ'.

---

## Semantica

### Ejercicio 13 ★

Sea L el lenguaje de primer orden que incluye (junto con las variables, conectivos y cuantificadores) la constante a₁, el simbolo de funcion f de aridad 2 y el simbolo de predicado P de aridad 2. Sea σ la formula

```
∀X₁.∀X₂.(P(f(X₁, X₂), a₁) ⇒ P(X₁, X₂))
```

Definamos una interpretacion I para L como sigue. D_I es Z, a₁ es 0, f(X, Y) es X - Y, P(X, Y) es X < Y.

Escribir la interpretacion de σ en castellano. ¿El enunciado es verdadero o falso? Hallar una interpretacion de σ en la cual el enunciado tenga el valor de verdad opuesto.

### Ejercicio 14 ★

Sea N la interpretacion aritmetica donde D_I = N y

```
c⁰    es el 0,
P²    es =,
f₁¹   es la funcion sucesor,
f₂²   es +,
f₃²   es ×
```

Hallar, si es posible, asignaciones que satisfagan y que no satisfagan las siguientes formulas.

I. `P(f₂(X₁, X₁), f₃(f₁(X₁), f₁(X₁)))`

II. `P(f₂(X₁, c), X₂) ⇒ P(f₂(X₁, X₂), X₃)`

III. `¬P(f₃(X₁, X₂), f₃(X₂, X₃))`

IV. `∀X₁.P(f₃(X₁, X₂), X₃)`

V. `∀X₁.(P(f₃(X₁, c), X₁) ⇒ P(X₁, X₂))`

### Ejercicio 15

Demostrar que ninguna de las siguientes formulas es logicamente valida.

I. `∀X₁.∃X₂.P(X₁, X₂) ⇒ ∃X₂.∀X₁.P(X₁, X₂)`

II. `∀X₁.∀X₂.(P(X₁, X₂) ⇒ P(X₂, X₁))`

III. `∀X₁.¬Q(X₁) ⇒ Q(c)`

IV. `(∀X₁.P(X₁, X₁)) ⇒ ∃X₂.∀X₁.P(X₁, X₂)`

---

## Ejercicios extra de deduccion natural (opcional)

### Ejercicio 16

Dar derivaciones en DN de las siguientes formulas.

I. `(∀X.P(X)) ⇒ P(a)`

II. `P(a) ⇒ ∃X.P(X)`

III. `(∀X.∀Y.(R(X, Y) ⇒ ¬R(Y, X))) ⇒ ∀X.¬R(X, X)`

IV. `(∀X.∀Y.R(X, Y)) ⇒ ∀X.R(X, X)`

V. `(∃X.P(X)) ⇒ (∀Y.Q(Y)) ⇒ ∀X.∀Y.(P(X) ⇒ Q(Y))`

VI. `(∀X.(P(X) ⇒ Q(X))) ∧ (∃X.P(X)) ⇒ ∃X.Q(X)`

VII. `(¬∀X.(P(X) ∨ Q(X))) ⇒ ¬∀X.P(X)`

VIII. `(∃X.(P(X) ⇒ Q(X))) ⇒ (∀X.P(X)) ⇒ ∃X.Q(X)`

IX. `(∀X.(P(X) ⇒ Q(X))) ∧ (¬∃X.Q(X)) ⇒ ∀X.¬P(X)`

X. `(∀X.(∃Y.R(Y, X) ⇒ P(X))) ⇒ (∃X.∃Y.R(X, Y)) ⇒ ∃X.P(X)`

XI. `(∃X.(P(X) ∨ Q(X))) ⇒ (∀X.¬Q(X)) ⇒ ∃X.P(X)`

XII. `(¬∀X.∃Y.R(X, Y)) ⇒ ¬∀X.R(X, X)`

XIII. `(¬∃X.∀Y.R(Y, X) ⇒ ∃X.∃Y.¬R(X, Y))`

XIV. `¬(∀X.P(X) ∧ ∃X.¬P(X))`

XV. `(∃X.(R(X, X) ∧ P(X))) ⇒ ¬∀X.(P(X) ⇒ ¬∃Y.R(X, Y))`

XVI. `(∃X.P(X) ⇒ ∀X.Q(X)) ⇒ ∀Y.(P(Y) ⇒ Q(Y))`

XVII. `¬(∀X.(P(X) ∧ Q(X))) ∧ ∀X.P(X) ⇒ ¬∀X.Q(X)`

XVIII. `(∀X.(R(X, X) ⇒ Q(X))) ∧ ∃X.∀Y.R(X, Y) ⇒ ∃X.Q(X)`
