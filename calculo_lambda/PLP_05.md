# Paradigmas de Programación - Cálculo-λ

**2do cuatrimestre de 2025**
Departamento de Computación
Facultad de Ciencias Exactas y Naturales
Universidad de Buenos Aires

---

## Índice

1. [Introducción](#introducción)
2. [Cálculo-λᵇ: sintaxis y tipado](#cálculo-λᵇ-sintaxis-y-tipado)
3. [Cálculo-λᵇ: semántica operacional](#cálculo-λᵇ-semántica-operacional)
4. [Cálculo-λᵇⁿ: extensión con números naturales](#cálculo-λᵇⁿ-extensión-con-números-naturales)

---

## Introducción

### ¿Qué es el cálculo-λ?

Lenguaje de programación definido de manera rigurosa.
Se basa sólo en dos operaciones: construir funciones y aplicarlas.

#### Históricamente
- Concebido en la década de 1930 por Alonzo Church para formalizar la noción de función efectivamente computable.
- Usado desde la década de 1960 para estudiar semántica formal de lenguajes de programación.

#### Actualmente
- Núcleo de lenguajes de programación funcionales y asistentes de demostración.
  **Lisp**, **OCaml**, **Haskell**, **Coq**, **Agda**, **Lean**, ...
- Laboratorio para investigar nuevas características de lenguajes.
- Fuertemente conectado con la teoría de la demostración, matemática constructiva, teoría de categorías, ...

---

## Cálculo-λᵇ: sintaxis y tipado

### Sintaxis de los tipos

```
τ, σ, ρ, ... ::= bool
               | τ → σ
```

Asumimos que el constructor de tipos "→" es asociativo a derecha:
```
τ → σ → ρ = τ → (σ → ρ) ≠ (τ → σ) → ρ
```

#### Ejemplos complejos de asociatividad a derecha en tipos

**Caso 1: Funciones currificadas vs funciones de orden superior**
```
bool → bool → bool = bool → (bool → bool)
```
Esto representa una función que toma un `bool` y devuelve una función `bool → bool`.

**Diferente de:**
```
(bool → bool) → bool
```
Que representa una función que toma como argumento una función `bool → bool` y devuelve un `bool`.

**Caso 2: Composición de funciones anidadas**
```
nat → nat → nat → bool = nat → (nat → (nat → bool))
```
Una función que toma tres números naturales de forma currificada.

**Vs el caso confuso:**
```
(nat → nat) → (nat → bool)
```
Una función que toma una función `nat → nat` y devuelve una función `nat → bool`.

### Sintaxis de los términos

Suponemos dado un conjunto infinito numerable de variables:
```
𝒳 = {x, y, z, ...}
```

```
M, N, P, ... ::= x                      variable
               | λx : τ. M              abstracción
               | M N                    aplicación
               | true                   verdadero
               | false                  falso
               | if M then N else P     condicional
```

Asumimos que la aplicación es asociativa a izquierda:
```
M N P = (M N) P ≠ M (N P)
```

#### Ejemplos complejos de asociatividad a izquierda en aplicaciones

**Caso 1: Aplicación de funciones currificadas**
```
add 3 5 7 = ((add 3) 5) 7 ≠ add (3 (5 7))
```
Donde `add` es una función que suma tres números de forma currificada.

**Caso 2: Composición que puede confundir**
```
f g h x = (((f g) h) x) ≠ f (g (h x))
```
La primera aplica `f` a `g`, luego el resultado a `h`, luego el resultado a `x`.
La segunda sería composición matemática tradicional.

**Caso 3: Funciones de orden superior**
```
map filter isEven numbers = ((map filter) isEven) numbers
```
No es `map (filter (isEven numbers))`.

#### Ejemplos de precedencia: abstracción e if vs aplicación

La abstracción y el "if" tienen menor precedencia que la aplicación:
```
λx : τ. M N = λx : τ.(M N) ≠ (λx : τ. M) N
```

**Caso 1: Abstracción con aplicación compleja**
```
λf : bool → bool. f true false = λf : bool → bool. (f true false)
```
**NO es:** `(λf : bool → bool. f) true false`

**Caso 2: If con aplicaciones anidadas**
```
if p then f g else h = if p then (f g) else h
```
**NO es:** `(if p then f) g else h`

**Caso 3: Mezcla confusa de abstracción y aplicación**
```
λx : bool. if x then f g h else k = λx : bool. (if x then (f g h) else k)
```
**NO es:** `((λx : bool. if x then f) g h) else k`

**Caso 4: Abstracción anidada con aplicaciones**
```
λf : nat → nat. λx : nat. f x zero = λf : nat → nat. (λx : nat. (f x zero))
```
La aplicación `f x zero` se asocia como `(f x) zero` dentro de cada abstracción.

### Ejemplos de términos

- `λx : bool. x`
- `λx : bool → bool. x`
- `(λx : bool. x) false`
- `(λx : bool → bool. x) (λy : bool. y)`
- `(λx : bool. λy : bool → bool. y x) true`
- `λx : bool. if x then false else true`
- `true true`
- `if λx : bool. x then false else true`

#### Análisis de un término problemático

**Término con errores:** `(λf : bool → bool. x)(y:boool.y)`

Este término **NO es válido** por varias razones:

1. **Errores de sintaxis:**
   - `y:boool.y` tiene errores tipográficos: `boool` debería ser `bool`
   - Falta el `λ` al inicio: debería ser `λy : bool. y`

2. **Problemas de tipado:**
   - En `λf : bool → bool. x`, la variable `x` aparece libre
   - Sin contexto que declare `x`, el término no es tipable

**Versión corregida y tipable:**
```
(λf : bool → bool. f true)(λy : bool. y)
```

**Tipos:**
- `λy : bool. y` tiene tipo `bool → bool`
- `λf : bool → bool. f true` tiene tipo `(bool → bool) → bool`
- La aplicación es válida

**Evaluación:**
```
(λf : bool → bool. f true)(λy : bool. y)
→ (λy : bool. y) true     [E-APPABS]
→ true                    [E-APPABS]
```

### Variables libres y ligadas

Una ocurrencia de x está **ligada** si aparece adentro de una abstracción "λ x". Una ocurrencia de x está **libre** si no está ligada.

#### Ejemplo
Marcar ocurrencias de variables libres y ligadas:
```
(λx : bool → bool. λy : bool. x y) (λy : bool. x y) y
```

**Solución paso a paso:**

1. **Identificar las abstracciones y sus variables ligadas:**
   - Primera abstracción: `λx : bool → bool. λy : bool. x y`
     - `x` está ligada por la primera λ
     - `y` está ligada por la segunda λ
   - Segunda abstracción: `λy : bool. x y`
     - `y` está ligada por esta λ
     - `x` NO está ligada aquí

2. **Aplicar alfa-equivalencia para claridad:**
   ```
   (λa : bool → bool. λb : bool. a b) (λc : bool. x c) y
   ```

3. **Marcar variables libres y ligadas:**
   ```
   (λa : bool → bool. λb : bool. a͟ b͟) (λc : bool. x̲ c͟) y̲
   ```
   - Variables ligadas (subrayadas): `a`, `b`, `c`
   - Variables libres (con línea): `x`, `y`

4. **Variables libres del término completo:**
   ```
   fv((λx : bool → bool. λy : bool. x y) (λy : bool. x y) y) = {x, y}
   ```

**Observaciones importantes:**
- La `y` del segundo término `(λy : bool. x y)` es diferente de la `y` libre al final
- La aplicación asocia a izquierda: `M N P = (M N) P`, pero aquí no afecta el análisis de variables libres
- La alfa-equivalencia ayuda a evitar confusiones entre variables con el mismo nombre

#### Ejercicio
Definir el conjunto de variables libres fv(M) de M.

#### Alfa equivalencia
Los términos que difieren sólo en el nombre de variables ligadas se consideran iguales:
```
λx : τ. λy : σ. x = λy : τ. λx : σ. y = λa : τ. λb : σ. a
λx : τ. λy : σ. x ≠ λx : τ. λy : σ. y = λx : τ. λx : σ. x
```

### Sistema de tipos

La noción de "tipabilidad" se formaliza con un sistema deductivo.

**Principio fundamental:** Hay una regla de tipado por cada forma de construir un término.

Recordando la sintaxis de términos:
```
M, N, P, ... ::= x                      variable
               | λx : τ. M              abstracción
               | M N                    aplicación
               | true                   verdadero
               | false                  falso
               | if M then N else P     condicional
```

El sistema de tipos tendrá exactamente 6 reglas correspondientes:
- **T-VAR** para variables
- **T-ABS** para abstracciones
- **T-APP** para aplicaciones
- **T-TRUE** para el verdadero
- **T-FALSE** para el falso
- **T-IF** para condicionales

**Problema:** ¿Qué tipo tiene x?

#### Contextos de tipado
Un **contexto de tipado** es un conjunto finito de pares (xᵢ: τᵢ):
```
{x₁ : τ₁, ..., xₙ : τₙ}
```
sin variables repetidas (i ≠ j ⇒ xᵢ ≠ xⱼ).
Se nota con letras griegas mayúsculas (Γ, Δ, ...).
A veces notamos dom(Γ) = {x₁, ..., xₙ}.

#### Juicios de tipado
El sistema de tipos predica sobre **juicios de tipado**, de la forma:
```
Γ ⊢ M : τ
```

### Reglas de tipado

```
                T-TRUE                              T-FALSE
Γ ⊢ true : bool                    Γ ⊢ false : bool

Γ ⊢ M : bool    Γ ⊢ N : τ    Γ ⊢ P : τ
─────────────────────────────────────── T-IF
Γ ⊢ if M then N else P : τ

              T-VAR                     Γ, x : τ ⊢ M : σ
Γ, x : τ ⊢ x : τ                       ─────────────────── T-ABS
                                       Γ ⊢ λx : τ. M : τ → σ

Γ ⊢ M : τ → σ    Γ ⊢ N : τ
─────────────────────────── T-APP
Γ ⊢ M N : σ
```

### Ejemplo — derivaciones de juicios de tipado

Derivar, si es posible, juicios de tipado para los siguientes términos:

1. `λx : bool. if x then false else x`
2. `λy : bool → bool → bool. λz : bool. y (y x z)`
3. `x z (y z)`
4. `λx : bool → bool. λx : bool. x`
5. `true (λx : bool. x)`
6. `x x`

### Propiedades del sistema de tipos

#### Teorema (Unicidad de tipos)
Si Γ ⊢ M : τ y Γ ⊢ M : σ son derivables, entonces τ = σ.

#### Teorema (Weakening + Strengthening)
Si Γ ⊢ M : τ es derivable y fv(M) ⊆ dom(Γ ∩ Γ') entonces Γ' ⊢ M : τ es derivable.

---

## Cálculo-λᵇ: semántica operacional

### Semántica formal

El sistema de tipos indica cómo se construyen los programas.
Queremos además darles **significado** (semántica).

#### Distintas maneras de dar semántica formal

1. **Semántica operacional.**
   Indica cómo se ejecuta el programa hasta llegar a un resultado.
   - Semántica *small-step*: ejecución paso a paso.
   - Semántica *big-step*: evaluación directa al resultado.

2. **Semántica denotacional.**
   Interpreta los programas como objetos matemáticos.

3. **Semántica axiomática.**
   Establece relaciones lógicas entre el estado del programa antes y después de la ejecución.

4. ...

Vamos a trabajar con semántica operacional *small-step*.

### Semántica operacional small-step

#### Programas
Un **programa** es un término M tipable y cerrado (fv(M) = ∅):
- El juicio de tipado ⊢ M : τ debe ser derivable para algún τ.

#### Juicios de evaluación
La semántica operacional predica sobre **juicios de evaluación**:
```
M → N
```
donde M y N son programas.

#### Valores
Los **valores** son los posibles resultados de evaluar programas:
```
V ::= true | false | λx : τ. M
```

### Reglas de evaluación para expresiones booleanas

```
                                        E-IFTRUE                               E-IFFALSE
if true then M else N → M              if false then M else N → N

M → M'
────────────────────────────────────── E-IF
if M then N else P → if M' then N else P
```

#### Ejemplo

1. Derivar el siguiente juicio:
   ```
   if (if false then false else true) then false else true
   → if true then false else true
   ```

2. ¿Para qué términos M vale que true → M?

3. ¿Es posible derivar el siguiente juicio?
   ```
   if true then (if false then false else false) else true
   → if true then false else true
   ```

### Reglas de evaluación para funciones (abstracción y aplicación)

```
M → M'                                N → N'
────────── E-APP1                     ──────────────────────── E-APP2
M N → M' N                            (λx : τ. M) N → (λx : τ. M) N'

                                      E-APPABS
(λx : τ. M) V → M{x := V}
```

### Sustitución

La operación de **sustitución**:
```
M{x := N}
```
denota el término que resulta de reemplazar todas las ocurrencias libres de x en M por N.

#### Definición de sustitución

```
x{x := N}                    ≝ N
a{x := N}                    ≝ a si a ∈ {true, false} ∪ 𝒳 \ {x}
(if M then P else Q){x := N} ≝ if M{x := N} then P{x := N} else Q{x := N}
(M₁ M₂){x := N}              ≝ M₁{x := N} M₂{x := N}
(λy : τ. M){x := N}          ≝ ⎧ λy : τ. M                           si x = y
                               ⎨ λy : τ. M{x := N}                    si x ≠ y, y ∉ fv(N)
                               ⎩ λz : τ. M{y := z}{x := N}           si x ≠ y, y ∈ fv(N),
                                                                     z ∉ {x, y} ∪ fv(M) ∪ fv(N)
```

#### Definición de sustitución (alternativa)

```
x{x := N}                    ≝ N
a{x := N}                    ≝ a si a ∈ {true, false} ∪ 𝒳 \ {x}
(if M then P else Q){x := N} ≝ if M{x := N} then P{x := N} else Q{x := N}
(M₁ M₂){x := N}              ≝ M₁{x := N} M₂{x := N}
(λy : τ. M){x := N}          ≝ λy : τ. M{x := N}
                               asumiendo y ∉ {x} ∪ fv(N)
```

La asunción se puede cumplir siempre, renombrando la variable ligada "y" en caso de conflicto.

### Evaluación en muchos pasos

Definimos un **juicio de evaluación en muchos pasos**:
```
M ↠ N
```
donde M y N son programas.

#### Reglas de evaluación en muchos pasos

```
────────       M → N    N ↠ P
M ↠ M          ─────────────────
               M ↠ N
```

#### Ejemplo — evaluación

Reducir repetidamente el siguiente término hasta llegar a un valor:
```
(λx : bool. λf : bool → bool. f (f x)) true (λx : bool. x)
```

### Propiedades de la evaluación

#### Teorema (Determinismo)
Si M → N₁ y M → N₂ entonces N₁ = N₂.

#### Teorema (Preservación de tipos)
Si ⊢ M : τ y M → N entonces ⊢ N : τ.

#### Teorema (Progreso)
Si ⊢ M : τ entonces:
1. O bien M es un valor.
2. O bien existe N tal que M → N.

#### Teorema (Terminación)
Si ⊢ M : τ, entonces no hay una cadena infinita de pasos:
```
M → M₁ → M₂ → ...
```

#### Corolario (Canonicidad)
1. Si ⊢ M : bool es derivable, entonces la evaluación de M termina y el resultado es true o false.
2. Si ⊢ M : τ → σ es derivable, entonces la evaluación de M termina y el resultado es una abstracción.

#### Slogan
*Well typed programs cannot go wrong.* (Robin Milner)

---

## Cálculo-λᵇⁿ: extensión con números naturales

### Sintaxis: tipos
```
τ, σ, ... ::= ... | nat
```

### Sintaxis: términos

```
M ::= ...
    | zero              el número cero
    | succ(M)           el sucesor del número que representa M
    | pred(M)           el predecesor del número que representa M
    | isZero(M)         representa un booleano true/false,
                        dependiendo de si M representa al cero o no
```

### Reglas de tipado

```
                T-ZERO                          Γ ⊢ M : nat
Γ ⊢ zero : nat                                  ─────────────── T-SUCC
                                                Γ ⊢ succ(M) : nat

Γ ⊢ M : nat                                     Γ ⊢ M : nat
─────────────── T-PRED                          ──────────────────── T-ISZERO
Γ ⊢ pred(M) : nat                               Γ ⊢ isZero(M) : bool
```

### Valores

Extendemos el conjunto de **valores**:
```
V ::= ... | zero | succ(V)
```

### Semántica operacional

```
M → M'                                          M → M'
──────────────── E-SUCC                         ──────────────── E-PRED
succ(M) → succ(M')                              pred(M) → pred(M')

                E-PREDSUCC
pred(succ(V)) → V

M → M'                                          E-ISZEROZERO
────────────────────── E-ISZERO                isZero(zero) → true
isZero(M) → isZero(M')

                       E-ISZEROSSUCC
isZero(succ(V)) → false
```

#### Ejemplo

1. Evaluar `isZero(succ(pred(succ(zero))))`.
2. Evaluar `isZero(pred(pred(succ(zero))))`. (¿Qué ocurre?)

#### Forma normal ("f.n.")
Un programa M es una **f.n.** si no existe M' tal que M → M'.

¿Todas las f.n.'s cerradas y tipables son valores?
- En el cálculo-λᵇ **sí**.
- En el cálculo-λᵇⁿ **no**. (¿Qué propiedad deja de valer?)

Las f.n.'s que no son valores se llaman **términos de error**.

---

## Lectura recomendada

Capítulos 5 y 9 del libro de Pierce.
Benjamin C. Pierce. *Types and Programming Languages*
The MIT Press, 2002.