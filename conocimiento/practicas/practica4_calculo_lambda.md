# Práctica N° 4 - Cálculo-λ: Tipado y Semántica Operacional

**Paradigmas de Programación (PLP) — 2do Cuatrimestre de 2025**

---

Los ejercicios marcados con el símbolo ★ constituyen un subconjunto mínimo de ejercitación. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

A menos que se especifiquen las extensiones a utilizar, trabajaremos con el cálculo λ con los tipos Bool, Nat y funciones.

**Notación para este segmento de la materia:**

- Las letras M, N, O, P, ... denotan términos.
- Las letras V, W, ... denotan valores.
- Las letras griegas ρ, σ, τ, ... denotan tipos.

**Gramáticas a tener en cuenta:**

- **Términos**

  ```
  M ::= x | λx: τ. M | M M | true | false | if M then M else M
       | zero | succ(M) | pred(M) | isZero(M)
  ```

  Donde la letra x representa un *nombre de variable* arbitrario. Dichos nombres se toman de un conjunto infinito numerable dado X = {w, w₁, w₂, ..., x, x₁, x₂, ..., y, y₁, y₂, ..., z, z₁, z₂, ...}

- **Tipos**

  ```
  τ ::= Bool | Nat | τ → τ
  ```

---

## Sintaxis

### Ejercicio 1 ★

Determinar qué expresiones son sintácticamente válidas (es decir, pueden ser generadas con las gramáticas presentadas) y determinar a qué categoría pertenecen (expresiones de términos o expresiones de tipos):

a) x

b) x x

c) M

d) M M

e) true false

f) true succ(false true)

g) λx.isZero(x)

h) λx: σ. succ(x)

i) λx: Bool. succ(x)

j) λx: if true then Bool else Nat. x

k) σ

l) Bool

m) Bool → Bool

n) Bool → Bool → Nat

ñ) (Bool → Bool) → Nat

o) succ true

p) λx: Bool. if zero then true else zero succ(true)

### Ejercicio 2

Mostrar un término que utilice al menos una vez **todas** las reglas de generación de la gramática de los términos y exhibir su *árbol sintáctico*.

### Ejercicio 3 ★

a) Marcar las ocurrencias del término x como subtérmino en λx: Nat. succ((λx: Nat. x) x).

b) ¿Ocurre x₁ como subtérmino en λx₁: Nat. succ(x₂)?

c) ¿Ocurre x (y z) como subtérmino en u x (y z)?

---

### Ejercicio 4 ★

Para los siguientes términos:

a) u x (y z) (λv: Bool. v y)

b) (λx: Bool → Nat → Bool. λy: Bool → Nat. λz: Bool. x z (y z)) u v w

c) w (λx: Bool → Nat → Bool. λy: Bool → Nat. λz: Bool. x z (y z)) u v

Se pide:

  i. Insertar todos los paréntesis de acuerdo a la convención usual.

  ii. Dibujar el árbol sintáctico de cada una de las expresiones.

  iii. Indicar en el árbol cuáles ocurrencias de variables aparecen ligadas y cuáles libres.

  iv. ¿En cuál o cuáles de los términos anteriores ocurre la siguiente expresión como subtérmino?

  (λx: Bool → Nat → Bool. λy: Bool → Nat. λz: Bool. x z (y z)) u

---

## Tipado

### Ejercicio 5

Mostrar un término que no sea tipable y que no tenga variables libres ni abstracciones.

### Ejercicio 6 (Derivaciones) ★

Dar una derivación —o explicar por qué no es posible dar una derivación— para cada uno de los siguientes juicios de tipado:

a) ⊢ if true then zero else succ(zero) : Nat

b) x : Nat, y : Bool ⊢ if true then false else (λz: Bool. z) true : Bool

c) ⊢ if λx: Bool. x then zero else succ(zero) : Nat

d) x : Bool → Nat, y : Bool ⊢ x y : Nat

### Ejercicio 7 ★

Se modifica la regla de tipado de la abstracción y se la cambia por la siguiente regla:

```
    Γ ⊢ M : τ
─────────────────────── →i2
Γ ⊢ λx: σ. M : σ → τ
```

Exhibir un juicio de tipado que sea derivable en el sistema original pero que no lo sea en el sistema actual.

### Ejercicio 8

Determinar qué tipo representa σ en cada uno de los siguientes juicios de tipado.

a) ⊢ succ(zero) : σ

b) ⊢ isZero(succ(zero)) : σ

c) ⊢ if (if true then false else false) then zero else succ(zero) : σ

### Ejercicio 9 (Tipos habitados) ★

Decimos que un tipo τ está *habitado* si existe un término M tal que el juicio ⊢ M : τ es derivable. En ese caso, decimos que M es un *habitante* de τ. Por ejemplo, dado un tipo σ, la identidad λx: σ. x es un habitante del tipo σ → σ. Demostrar que los siguientes tipos están habitados (para cualquier σ, τ y ρ):

a) σ → τ → σ

b) (σ → τ → ρ) → (σ → τ) → σ → ρ

c) (σ → τ → ρ) → τ → σ → ρ

d) (τ → ρ) → (σ → τ) → σ → ρ

*Para pensar:* el tipo b es el de la función conocida como *Combinador S*. ¿Con qué función ya conocida de Haskell se corresponden los habitantes de los otros tipos? ¿Hay tipos que no estén habitados? ¿Si se reemplaza → por ⇒, las fórmulas habitadas son siempre tautologías? ¿Las tautologías son siempre fórmulas habitadas?

### Ejercicio 10 ★

Determinar qué tipos representan σ y τ en cada uno de los siguientes juicios de tipado. Si hay más de una solución, o si no hay ninguna, indicarlo.

a) x: σ ⊢ isZero(succ(x)) : τ

b) ⊢ (λx: σ. x)(λy: Bool. zero) : σ

c) y: τ ⊢ if (λx: σ. x) then y else succ(zero) : σ

d) x: σ ⊢ x y : τ

e) x: σ, y: τ ⊢ x y : τ

f) x: σ ⊢ x true : τ

g) x: σ ⊢ x true : σ

h) x: σ ⊢ x x : τ

### Ejercicio 11 (Debilitamiento y fortalecimiento)

Demostrar las siguientes propiedades, procediendo por inducción en la derivación del juicio correspondiente:

1. Si Γ ⊢ M : σ es un juicio de tipado derivable y x es una variable que no aparece en Γ, entonces Γ, x : τ ⊢ M : σ es derivable para todo tipo τ. Esta regla se conoce como *debilitamiento* o *weakening*.

2. Si Γ, x : τ ⊢ M : σ es un juicio de tipado derivable tal que x no aparece libre en M, entonces Γ ⊢ M : σ es derivable para todo tipo τ. Esta regla se conoce como *fortalecimiento* o *strengthening*.

3. Dar un contraejemplo para fortalecimiento en el caso en el que x aparece libre en M.

### Ejercicio 12 (Lema de sustitución) ★

Demostrar que si valen Γ, x : σ ⊢ M : τ y Γ ⊢ N : σ entonces vale Γ ⊢ M{x := N} : τ.

*Sugerencia:* proceder por inducción en la estructura del término M.

---

## Semántica

### Ejercicio 13 ★

Sean σ, τ, ρ tipos. Según la definición de sustitución, calcular:

a) (λy: σ. x (λx: τ. x)){**x** := (λy: ρ. x y)}

b) (y (λv: σ. x v)){**x** := (λy: τ. v y)}

Renombrar variables en ambos términos para que las sustituciones no cambien su significado.

### Ejercicio 14 (Conmutación de sustituciones)

Sean M, N y P términos del cálculo-λ.

a) Por inducción en la estructura del término M, demostrar que si x no aparece libre en P y x ≠ y, entonces:

```
M{x := N}{y := P} = M{y := P}{x := N{y := P}}
```

b) Dar un contraejemplo para la ecuación de arriba cuando x aparece libre en P.

### Ejercicio 15 (Valores) ★

Dado el conjunto de valores visto en clase:

```
V := λx: τ. M | true | false | zero | succ(V)
```

Determinar si cada una de las siguientes expresiones es o no un valor:

a) (λx: Bool. x) true

b) λx: Bool. 2

c) λx: Bool. pred(2)

d) λy: Nat. (λx: Bool. pred(2)) true

e) x

f) succ(succ(zero))

### Ejercicio 16 (Programa, Forma Normal) ★

Para el siguiente ejercicio, considerar el cálculo **sin** la regla pred(zero) → zero

Un **programa** es un término que tipa en el contexto vacío (es decir, no puede contener variables libres).

Para cada una de las siguientes expresiones,

a) Determinar si puede ser considerada un **programa**.

b) Si es un programa, ¿Cuál es el resultado de su evaluación? Determinar si se trata de una forma normal, y en caso de serlo, si es un **valor** o un **error**.

  i. (λx: Bool. x) true

  ii. λx: Nat. pred(succ(x))

  iii. λx: Nat. pred(succ(y))

  iv. (λx: Bool. pred(isZero(x))) true

  v. (λf: Nat → Bool. f zero) (λx: Nat. isZero(x))

  vi. (λf: Nat → Bool. x) (λx: Nat. isZero(x))

  vii. (λf: Nat → Bool. f pred(zero)) (λx: Nat. isZero(x))

  viii. fix λy: Nat. succ(y)

### Ejercicio 17 (Determinismo)

a) ¿Es cierto que la relación definida → está determinada (es una función parcial)?
Más precisamente, ¿pasa que si M → N y M → N' entonces también vale N = N'?

b) ¿Vale lo mismo con muchos pasos? Es decir, ¿es cierto que si M →→ M' y M →→ M'' entonces M' = M''?

c) ¿Acaso es cierto que si M → M' y M →→ M'' entonces M' = M''?

### Ejercicio 18

a) ¿Da lo mismo evaluar succ(pred(M)) que pred(succ(M))? ¿Por qué?

b) ¿Es verdad que para todo término M vale isZero(succ(M)) →→ false? Si no lo es, ¿para qué términos vale?

c) ¿Para qué términos M vale isZero(pred(M)) →→ true? (Hay infinitos).

### Ejercicio 19

Al agregar la siguiente regla para las abstracciones:

> **Si** M → M', **entonces:** λx: τ. M → λx: τ. M'    (ξ)

a) Repensar el conjunto de valores para respetar esta modificación, pensar por ejemplo si (λx: Bool. (λy: Bool. y) true) es o no un valor.

b) ¿Qué reglas deberían modificarse para no perder el determinismo?

c) Utilizando el cálculo modificado y los valores definidos, reducir la siguiente expresión:
(λx: Nat → Nat. x 23) (λx: Nat. pred(succ(zero)))
¿Qué se puede concluir entonces? ¿Es una buena idea agregar esta regla?

---

## Extensiones

En esta sección puede asumirse, siempre que sea necesario, que el cálculo ha sido extendido con la suma de números naturales (M + N), con las siguientes reglas de tipado y semántica:

```
Γ ⊢ M : Nat    Γ ⊢ N : Nat
─────────────────────────────── +
      Γ ⊢ M + N : Nat
```

```
Si M → M', entonces:  M + N → M' + N          (+c1)
Si N → N', entonces:  V + N → V + N'          (+c2)
V + zero → V                                   (+₀)
V₁ + succ(V₂) → succ(V₁) + V₂                (+succ)
```

### Ejercicio 20 (Pares, o productos) ★

Este ejercicio extiende el cálculo-λ tipado con **pares**. Las gramáticas de los tipos y los términos se extienden de la siguiente manera:

```
τ ::= ... | τ × τ
M ::= ... | ⟨M, M⟩ | π₁(M) | π₂(M)
```

donde σ × τ es el tipo de los pares cuya primera componente es de tipo σ y cuya segunda componente es de tipo τ, ⟨M, N⟩ construye un par y π₁(M) y π₂(M) proyectan la primera y la segunda componente de un par, respectivamente.

a) Definir reglas de tipado para los nuevos constructores de términos.

b) Usando las reglas de tipado anteriores, y dados los tipos σ, τ y ρ, exhibir habitantes de los siguientes tipos:

  i. Constructor de pares: σ → τ → (σ × τ)

  ii. Proyecciones: (σ × τ) → σ y (σ × τ) → τ

  iii. Conmutatividad: (σ × τ) → (τ × σ)

  iv. Asociatividad: ((σ × τ) × ρ) → (σ × (τ × ρ)) y (σ × (τ × ρ)) → ((σ × τ) × ρ).

  v. Currificación: ((σ × τ) → ρ) → (σ → τ → ρ) y (σ → τ → ρ) → ((σ × τ) → ρ).

c) ¿Cómo se extiende el conjunto de los valores?

d) Definir reglas de semántica operacional manteniendo el determinismo y la preservación de tipos. **Importante:** no olvidar las reglas de congruencia.

e) Demostrar el determinismo de la relación de reducción definida. ¿Se verifica la propiedad de preservación de tipos? ¿Se verifica la propiedad de progreso?

### Ejercicio 21 (Uniones disjuntas, también conocidas como co-productos o sumas)

Este ejercicio extiende el cálculo-λ tipado con **uniones disjuntas**. Las gramáticas de los tipos y los términos se extienden de la siguiente manera:

```
τ ::= ... | τ + τ
M ::= ... | left_τ(M) | right_τ(M) | case M of left(x) ⇝ M ‖ right(y) ⇝ M
```

donde σ + τ representa el tipo de la unión disjunta entre σ y τ, similar al tipo `Either σ τ` de Haskell, left_σ(M) y right_τ(M) inyectan un valor en la unión y `case M of left(x) ⇝ M₁ ‖ right(y) ⇝ M₂` efectúa un análisis de casos del término M comparándolo con los patrones left_σ(x) y right_τ(y).

a) Definir reglas de tipado para los nuevos constructores de términos.

b) Usando las reglas de tipado anteriores, y dados los tipos σ, τ y ρ, exhibir habitantes de los siguientes tipos:

  i. Inyecciones: σ → (σ + τ) y τ → (σ + τ).

  ii. Análisis de casos: (σ + τ) → (σ → ρ) → (τ → ρ) → ρ.

  iii. Conmutatividad: (σ + τ) → (τ + σ).

  iv. Asociatividad: ((σ + τ) + ρ) → (σ + (τ + ρ)) y (σ + (τ + ρ)) → ((σ + τ) + ρ).

  v. Distributividad del producto sobre la suma: (σ × (τ + ρ)) → ((σ × τ) + (σ × ρ)) y ((σ × τ) + (σ × ρ)) → (σ × (τ + ρ)).

  vi. Ley de los exponentes¹: ((σ + τ) → ρ) → ((σ → ρ) × (τ → ρ)) y ((σ → ρ) × (τ → ρ)) → ((σ + τ) → ρ).

c) ¿Cómo se extiende el conjunto de los valores?

d) Definir reglas de semántica operacional manteniendo el determinismo y la preservación de tipos. ¿Se verifica la propiedad de progreso?

e) Demostrar que la relación de reducción definida tiene la propiedad de preservación de tipos.

> ¹ Notemos que si escribimos σ → τ como τ^σ, las dos expresiones nos dicen que ρ^(σ+τ) ⟷ ρ^σ × ρ^τ.

### Ejercicio 22 ★

Este ejercicio extiende el Cálculo Lambda tipado con **listas**. Comenzamos ampliando el conjunto de tipos:

```
τ ::= ... | [τ]
```

donde [τ] representa el tipo de las listas cuyas componentes son de tipo τ. El conjunto de términos ahora incluye:

```
M, N, O ::= ... | [ ]_τ | M :: N | case M of {[ ] ⇝ N | h :: t ⇝ O}
           | foldr M base ⇝ N; rec(h, r) ⇝ O
```

donde

- `[ ]_σ` es la lista vacía cuyos elementos son de tipo σ;
- `M :: N` agrega M a la lista N;
- `case M of {[ ] ⇝ N | h :: t ⇝ O}` es el observador de listas. Por su parte, los nombres de variables que se indiquen luego del | (h y t en este caso) son variables que pueden aparecer libres en O y deberán ligarse con la cabeza y cola de la lista respectivamente;
- `foldr M base ⇝ N; rec(h, r) ⇝ O` es el operador de recursión estructural (no currificado). Los nombres de variables indicados entre paréntesis (h y r en este caso) son variables que pueden aparecer libres en O y deberán ser ligadas con la cabeza y el resultado de la recursión respectivamente.

Por ejemplo,

```
case zero :: succ(zero) :: [ ]_Nat of {[ ] ⇝ false | x :: xs ⇝ isZero(x)} →→ true
```

```
foldr 1 :: 2 :: 3 :: (λx: [Nat]. x) [ ]_Nat base ⇝ zero; rec(head, rec) ⇝ head + rec →→ 6
```

a) Mostrar el árbol sintáctico para los dos ejemplos dados.

b) Agregar reglas de tipado para las nuevas expresiones.

c) Demostrar el siguiente juicio de tipado (recomendación: marcar variables libres y ligadas en el término antes de comenzar).

```
x : Bool, y : [Bool] ⊢ foldr x :: x :: y  base ⇝ y; rec(y, x) ⇝ if y then x else [ ]_Bool : [Bool]
```

d) Mostrar cómo se extiende el conjunto de valores. Estos deben reflejar la forma de las listas que un programa podría devolver.

e) Agregar las reglas de reducción asociadas a las nuevas expresiones.

### Ejercicio 23 ★

A partir de la extensión del ejercicio 22, definir una nueva extensión que incorpore expresiones de la forma map(M, N), donde N es una lista y M una función que se aplicará a cada uno de los elementos de N.

**Importante:** tener en cuenta las anotaciones de tipos al definir las reglas de tipado y semántica.

### Ejercicio 24 ★

A partir de la extensión del ejercicio 22, agregaremos términos para representar listas por comprensión, con un selector y una guarda, de la siguiente manera: `[M | x ← S, P]`, donde x es el nombre de una variable que puede aparecer libre en los términos M y P. La semántica es análoga a la de Haskell: para cada valor de la lista representada por el término S, se sustituye x en P y, de resultar verdadero, se agrega M con x sustituido al resultado. Definir las reglas de tipado, el conjunto de valores y las reglas de semántica para esta extensión.

### Ejercicio 25 (Conectivos booleanos)

Definir como macros (azúcar sintáctica) los términos **Not**, **And**, **Or**, **Xor**, que simulen desde la reducción los conectivos clásicos usuales, por ej. And M N →→ true ⇔ M →→ true y N →→ true.

Notar que definir una macro no es lo mismo que hacer una extensión. Por ejemplo, definir el término I_σ ≝ λx: σ. x, que es la función identidad del tipo σ, es distinto de extender la sintaxis del lenguaje con términos de la forma I(M), lo cual además requeriría agregar nuevas reglas de tipado y de evaluación.

### Ejercicio 26

Definir las siguientes funciones en Cálculo Lambda con Listas (visto en el ejercicio 22). Pueden definirse como macros o como extensiones al cálculo.

**Nota:** en este ejercicio usamos la notación M : σ para decir que la expresión M a definir debe tener tipo σ en cualquier contexto.

a) head_σ : [σ] → σ y tail_σ : [σ] → [σ] (asumir que ⊥_σ ≝ fix λx: σ. x).

b) iterate_σ : (σ → σ) → σ → [σ] que dadas f y x genera la lista infinita x :: f x :: f(f x) :: f(f(f x)) :: ...

c) zip_{ρ,σ} : [ρ] → [σ] → [ρ × σ] que se comporta como la función homónima de Haskell.

d) take_σ : Nat → ([σ] → [σ]) que se comporta como la función homónima de Haskell.

### Ejercicio 27 ★

Se desea extender el Cálculo Lambda tipado con **colas bidireccionales** (también conocidas como *deque*). Se extenderán los tipos y términos de la siguiente manera:

```
τ ::= ··· | Cola_τ

M ::= ··· | ⟨⟩_τ | M • M | próximo(M) | desencolar(M)
     | case M of ⟨⟩ ⇝ M; c • x ⇝ M
```

donde ⟨⟩_τ es la cola vacía en la que se pueden encolar elementos de tipo τ; M₁ • M₂ representa el agregado del elemento M₂ al **final** de la cola M₁; los observadores próximo(M₁) y desencolar(M₁) devuelven, respectivamente, el primer elemento de la cola (el primero que se encoló), y la cola sin el primer elemento (estos dos últimos solo tienen sentido si la cola no es vacía); y el observador `case M₁ of ⟨⟩ ⇝ M₂; c • x ⇝ M₃` permite operar con la cola en sentido contrario, accediendo al último elemento encolado (cuyo valor se ligará a la variable x en M₃) y al resto de la cola (que se ligará a la variable c en el mismo subtérmino).

1. Introducir las reglas de tipado para la extensión propuesta.

2. Definir el conjunto de valores y las nuevas reglas de reducción. Pueden usar los conectivos booleanos de la guía. **No es necesario escribir las reglas de congruencia**, basta con indicar cuántas son.

   **Pista:** puede ser necesario mirar más de un nivel de un término para saber a qué reduce.

3. Mostrar paso por paso cómo reduce la expresión:

   ```
   case ⟨⟩_Nat • 1 • 0 of ⟨⟩ ⇝ próximo(⟨⟩_Bool); c • x ⇝ isZero(x)
   ```

4. Definir como macro la función último_τ, que dada una cola devuelve el último elemento que se encoló en ella. Si la cola es vacía, puede colgarse o llegar a una forma normal bien tipada que no sea un valor. Dar un juicio de tipado válido para esta función (no es necesario demostrarlo).
