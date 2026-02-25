# Árbol de Resolución: `?- menorOIgual(0, X)`

## Programa Prolog

```prolog
% Definición de números naturales
natural(0).                          % Regla N1 (caso base)
natural(suc(X)) :- natural(X).       % Regla N2 (caso recursivo)

% Definición de menor o igual
menorOIgual(X, X) :- natural(X).     % Regla 1 (igualdad)
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).  % Regla 2 (menor estricto)
```

## Consulta Inicial

```
?- menorOIgual(0, X).
```

**Objetivo:** Encontrar todos los valores de X tales que 0 ≤ X

---

## Árbol de Resolución Completo (Primeras 4 Soluciones)

```
?- menorOIgual(0, X).
|
├─ [Intenta Regla 1] menorOIgual(X₁, X₁) :- natural(X₁)
│  |
│  └─ mgu(menorOIgual(0, X) ?= menorOIgual(X₁, X₁))
│     |
│     └─ Sustitución: {0/X₁, X/X₁}
│        |
│        └─ Composición: {X₁ := 0, X := 0}
│           |
│           └─ Nuevo objetivo: ?- natural(0).
│              |
│              ├─ [Intenta Regla N1] natural(0)
│              │  |
│              │  └─ mgu(natural(0) ?= natural(0))
│              │     |
│              │     └─ {} (unificación trivial)  ✓ ÉXITO
│              │        |
│              │        └─ ✓ Primera solución: X = 0
│              |
│              └─ [Intenta Regla N2] natural(suc(X₂)) :- natural(X₂)
│                 |
│                 └─ mgu(natural(0) ?= natural(suc(X₂)))
│                    |
│                    └─ ✗ FALLA (0 ≠ suc(X₂))
│
└─ [Intenta Regla 2] menorOIgual(X₃, suc(Y₁)) :- menorOIgual(X₃, Y₁)
   |
   └─ mgu(menorOIgual(0, X) ?= menorOIgual(X₃, suc(Y₁)))
      |
      └─ Sustitución: {0/X₃, X/suc(Y₁)}
         |
         └─ Composición: {X₃ := 0, X := suc(Y₁)}
            |
            └─ Nuevo objetivo: ?- menorOIgual(0, Y₁).
               |
               ├─ [Intenta Regla 1] menorOIgual(X₄, X₄) :- natural(X₄)
               │  |
               │  └─ mgu(menorOIgual(0, Y₁) ?= menorOIgual(X₄, X₄))
               │     |
               │     └─ Sustitución: {0/X₄, Y₁/X₄}
               │        |
               │        └─ Composición: {X₄ := 0, Y₁ := 0}
               │           |
               │           └─ Nuevo objetivo: ?- natural(0).
               │              |
               │              ├─ [Intenta Regla N1] natural(0)
               │              │  |
               │              │  └─ mgu(natural(0) ?= natural(0))
               │              │     |
               │              │     └─ {} ✓ ÉXITO
               │              │        |
               │              │        └─ Aplicando sustituciones:
               │              │           Y₁ = 0
               │              │           X = suc(Y₁) = suc(0)
               │              │           |
               │              │           └─ ✓ Segunda solución: X = suc(0)
               │              |
               │              └─ [Intenta Regla N2] (falla como antes)
               |
               └─ [Intenta Regla 2] menorOIgual(X₅, suc(Y₂)) :- menorOIgual(X₅, Y₂)
                  |
                  └─ mgu(menorOIgual(0, Y₁) ?= menorOIgual(X₅, suc(Y₂)))
                     |
                     └─ Sustitución: {0/X₅, Y₁/suc(Y₂)}
                        |
                        └─ Composición: {X₅ := 0, Y₁ := suc(Y₂)}
                           |
                           └─ Nuevo objetivo: ?- menorOIgual(0, Y₂).
                              |
                              ├─ [Intenta Regla 1] menorOIgual(X₆, X₆) :- natural(X₆)
                              │  |
                              │  └─ mgu(menorOIgual(0, Y₂) ?= menorOIgual(X₆, X₆))
                              │     |
                              │     └─ Composición: {X₆ := 0, Y₂ := 0}
                              │        |
                              │        └─ Nuevo objetivo: ?- natural(0).
                              │           |
                              │           └─ [Regla N1] ✓ ÉXITO
                              │              |
                              │              └─ Aplicando sustituciones:
                              │                 Y₂ = 0
                              │                 Y₁ = suc(Y₂) = suc(0)
                              │                 X = suc(Y₁) = suc(suc(0))
                              │                 |
                              │                 └─ ✓ Tercera solución: X = suc(suc(0))
                              |
                              └─ [Intenta Regla 2] menorOIgual(X₇, suc(Y₃)) :- menorOIgual(X₇, Y₃)
                                 |
                                 └─ mgu(menorOIgual(0, Y₂) ?= menorOIgual(X₇, suc(Y₃)))
                                    |
                                    └─ Composición: {X₇ := 0, Y₂ := suc(Y₃)}
                                       |
                                       └─ Nuevo objetivo: ?- menorOIgual(0, Y₃).
                                          |
                                          ├─ [Intenta Regla 1] ...
                                          │  |
                                          │  └─ ✓ Cuarta solución: X = suc(suc(suc(0)))
                                          |
                                          └─ [Intenta Regla 2] ...
                                             |
                                             └─ ... (continúa infinitamente)
```

---

## Análisis Detallado de Cada Solución

### **Primera Solución: X = 0**

#### Paso 1: Unificación con Regla 1

```
Objetivo:     menorOIgual(0, X)
Regla 1:      menorOIgual(X₁, X₁) :- natural(X₁)
```

**Proceso de unificación:**
```
menorOIgual(0, X) ?= menorOIgual(X₁, X₁)
```

**Igualando argumentos:**
- Primer argumento: `0 ?= X₁` → **X₁ := 0**
- Segundo argumento: `X ?= X₁` → **X := X₁**

**Composición de sustituciones:**
```
{X₁ := 0, X := X₁} = {X₁ := 0, X := 0}
```

#### Paso 2: Nuevo objetivo

```
?- natural(0).
```

#### Paso 3: Verificación con natural

```
Objetivo:     natural(0)
Regla N1:     natural(0)
```

**Unificación:**
```
natural(0) ?= natural(0)  →  {} (unificación trivial)
```

**Resultado:** ✓ **ÉXITO**

**Solución final:**
```
X = 0
```

---

### **Segunda Solución: X = suc(0)**

#### Paso 1: Backtracking y unificación con Regla 2

Después de encontrar la primera solución, Prolog hace backtracking e intenta la **Regla 2**.

```
Objetivo:     menorOIgual(0, X)
Regla 2:      menorOIgual(X₃, suc(Y₁)) :- menorOIgual(X₃, Y₁)
```

**Proceso de unificación:**
```
menorOIgual(0, X) ?= menorOIgual(X₃, suc(Y₁))
```

**Igualando argumentos:**
- Primer argumento: `0 ?= X₃` → **X₃ := 0**
- Segundo argumento: `X ?= suc(Y₁)` → **X := suc(Y₁)**

**Sustitución obtenida:**
```
{X₃ := 0, X := suc(Y₁)}
```

#### Paso 2: Nuevo objetivo

```
?- menorOIgual(0, Y₁).
```

**Observación:** Este es el **mismo patrón** que la consulta original, pero con Y₁ en lugar de X.

#### Paso 3: Aplicar Regla 1 recursivamente

```
Objetivo:     menorOIgual(0, Y₁)
Regla 1:      menorOIgual(X₄, X₄) :- natural(X₄)
```

**Unificación:**
```
menorOIgual(0, Y₁) ?= menorOIgual(X₄, X₄)
```

**Sustituciones:**
```
{X₄ := 0, Y₁ := 0}
```

#### Paso 4: Verificar natural(0)

```
?- natural(0).  →  ✓ ÉXITO
```

#### Paso 5: Composición de sustituciones hacia arriba

```
Y₁ = 0                    (de la regla 1)
X = suc(Y₁)               (de la regla 2)
X = suc(0)                (sustituyendo Y₁)
```

**Solución final:**
```
X = suc(0)
```

**Representación visual de sustituciones:**
```
Nivel 1: menorOIgual(0, X) con X := suc(Y₁)
         |
         └─ Nivel 2: menorOIgual(0, Y₁) con Y₁ := 0
                     |
                     └─ Retorna: Y₁ = 0
         |
         └─ Retorna: X = suc(0)
```

---

### **Tercera Solución: X = suc(suc(0))**

#### Paso 1: Backtracking desde la segunda solución

Prolog hace backtracking desde `?- menorOIgual(0, Y₁)` y aplica la **Regla 2**.

```
Objetivo:     menorOIgual(0, Y₁)
Regla 2:      menorOIgual(X₅, suc(Y₂)) :- menorOIgual(X₅, Y₂)
```

**Unificación:**
```
menorOIgual(0, Y₁) ?= menorOIgual(X₅, suc(Y₂))
```

**Sustituciones:**
```
{X₅ := 0, Y₁ := suc(Y₂)}
```

#### Paso 2: Nuevo objetivo

```
?- menorOIgual(0, Y₂).
```

#### Paso 3: Aplicar Regla 1 a este nuevo objetivo

```
Objetivo:     menorOIgual(0, Y₂)
Regla 1:      menorOIgual(X₆, X₆) :- natural(X₆)
```

**Unificación:**
```
{X₆ := 0, Y₂ := 0}
```

#### Paso 4: Verificar natural(0)

```
?- natural(0).  →  ✓ ÉXITO
```

#### Paso 5: Composición de sustituciones (cadena completa)

```
Y₂ = 0                        (del nivel más profundo)
Y₁ = suc(Y₂) = suc(0)         (del nivel intermedio)
X = suc(Y₁) = suc(suc(0))     (del nivel original)
```

**Solución final:**
```
X = suc(suc(0))
```

**Representación visual de sustituciones:**
```
Nivel 1: menorOIgual(0, X) con X := suc(Y₁)
         |
         └─ Nivel 2: menorOIgual(0, Y₁) con Y₁ := suc(Y₂)
                     |
                     └─ Nivel 3: menorOIgual(0, Y₂) con Y₂ := 0
                                 |
                                 └─ Retorna: Y₂ = 0
                     |
                     └─ Retorna: Y₁ = suc(0)
         |
         └─ Retorna: X = suc(suc(0))
```

---

### **Cuarta Solución: X = suc(suc(suc(0)))**

Siguiendo el mismo patrón:

1. Backtracking desde `?- menorOIgual(0, Y₂)`
2. Aplicar **Regla 2**: `Y₂ := suc(Y₃)`
3. Nuevo objetivo: `?- menorOIgual(0, Y₃)`
4. Aplicar **Regla 1**: `Y₃ := 0`
5. Verificar: `natural(0)` ✓

**Cadena de sustituciones:**
```
Y₃ = 0
Y₂ = suc(Y₃) = suc(0)
Y₁ = suc(Y₂) = suc(suc(0))
X = suc(Y₁) = suc(suc(suc(0)))
```

**Solución final:**
```
X = suc(suc(suc(0)))
```

---

## Visualización del Patrón de Generación

### Estructura de Árbol Simplificada

```
?- menorOIgual(0, X).
│
├─ [R1] X := 0, ?- natural(0) → ✓ X = 0
│
└─ [R2] X := suc(Y₁), ?- menorOIgual(0, Y₁)
   │
   ├─ [R1] Y₁ := 0, ?- natural(0) → ✓ X = suc(0)
   │
   └─ [R2] Y₁ := suc(Y₂), ?- menorOIgual(0, Y₂)
      │
      ├─ [R1] Y₂ := 0, ?- natural(0) → ✓ X = suc(suc(0))
      │
      └─ [R2] Y₂ := suc(Y₃), ?- menorOIgual(0, Y₃)
         │
         ├─ [R1] Y₃ := 0 → ✓ X = suc(suc(suc(0)))
         │
         └─ [R2] Y₃ := suc(Y₄), ?- menorOIgual(0, Y₄)
            │
            └─ ... (continúa infinitamente)
```

### Tabla de Soluciones

| Solución | Aplicaciones de R2 | Profundidad | Valor de X | Número Natural |
|----------|-------------------|-------------|------------|----------------|
| 1ª       | 0                 | 1           | `0`                          | 0 |
| 2ª       | 1                 | 2           | `suc(0)`                     | 1 |
| 3ª       | 2                 | 3           | `suc(suc(0))`                | 2 |
| 4ª       | 3                 | 4           | `suc(suc(suc(0)))`           | 3 |
| n-ésima  | n-1               | n           | `suc^n(0)`                   | n-1 |

---

## Mecanismo de Resolución: Backtracking

### Estados del Sistema durante la Ejecución

#### Estado 1: Primera Solución
```
Pila de objetivos: [menorOIgual(0, X)]
Regla aplicada:    Regla 1
Sustitución:       {X := 0}
Nuevo objetivo:    [natural(0)]
Resultado:         ÉXITO → X = 0
```

#### Estado 2: Backtracking a Segunda Solución
```
Prolog deshace la Regla 1 y prueba Regla 2

Pila de objetivos: [menorOIgual(0, X)]
Regla aplicada:    Regla 2
Sustitución:       {X := suc(Y₁)}
Nuevo objetivo:    [menorOIgual(0, Y₁)]
  |
  └─ Aplica Regla 1
     Sustitución:  {Y₁ := 0}
     Nuevo objetivo: [natural(0)]
     Resultado:    ÉXITO → Y₁ = 0, X = suc(0)
```

#### Estado 3: Backtracking a Tercera Solución
```
Pila de objetivos: [menorOIgual(0, Y₁)]  ← punto de backtracking
Regla aplicada:    Regla 2
Sustitución:       {Y₁ := suc(Y₂)}
Nuevo objetivo:    [menorOIgual(0, Y₂)]
  |
  └─ Aplica Regla 1
     Sustitución:  {Y₂ := 0}
     Resultado:    ÉXITO → Y₂ = 0, Y₁ = suc(0), X = suc(suc(0))
```

---

## Diagrama de Flujo de Decisiones

```
┌─────────────────────────────┐
│ ?- menorOIgual(0, X)        │
└──────────┬──────────────────┘
           │
           ├─────────────────────────┬─────────────────────────┐
           │                         │                         │
    ┌──────▼──────┐          ┌───────▼───────┐        (No hay más reglas)
    │   Regla 1   │          │   Regla 2     │
    │   X := 0    │          │ X := suc(Y₁)  │
    └──────┬──────┘          └───────┬───────┘
           │                         │
    ┌──────▼──────┐          ┌───────▼────────────┐
    │ natural(0)? │          │ menorOIgual(0, Y₁)?│
    └──────┬──────┘          └───────┬────────────┘
           │                         │
         ✓ SÍ                  (Se repite el patrón)
           │                         │
    ┌──────▼──────┐                  │
    │   X = 0     │                  ├──────────────┬─────────────
    │  SOLUCIÓN 1 │                  │              │
    └─────────────┘          ┌───────▼────┐  ┌──────▼──────┐
                             │  Y₁ := 0   │  │Y₁ := suc(Y₂)│
                             └───────┬────┘  └──────┬──────┘
                                     │              │
                                   ✓ SÍ           (recursión)
                                     │              │
                              ┌──────▼──────┐       │
                              │ X = suc(0)  │       └─→ ...
                              │ SOLUCIÓN 2  │
                              └─────────────┘
```

---

## Conceptos Clave de Resolución

### 1. **Unificación (MGU - Most General Unifier)**

La unificación es el proceso de igualar dos términos mediante sustituciones.

**Ejemplo de la Primera Solución:**
```
menorOIgual(0, X) ?= menorOIgual(X₁, X₁)

Paso a paso:
1. Igualar functores: menorOIgual = menorOIgual ✓
2. Igualar primer argumento: 0 ?= X₁
   → Sustitución: X₁ := 0
3. Igualar segundo argumento: X ?= X₁
   → Como X₁ ya es 0, entonces X := 0

MGU resultante: {X₁ := 0, X := 0}
```

### 2. **Renombramiento de Variables**

Cada vez que se aplica una regla, sus variables se renombran para evitar conflictos.

**Ejemplo:**
```
Consulta original:  menorOIgual(0, X)

Primera aplicación de Regla 2:
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
renombrada a:
menorOIgual(X₃, suc(Y₁)) :- menorOIgual(X₃, Y₁).

Segunda aplicación de Regla 2 (en recursión):
renombrada a:
menorOIgual(X₅, suc(Y₂)) :- menorOIgual(X₅, Y₂).
```

### 3. **Composición de Sustituciones**

Las sustituciones se propagan desde los niveles más profundos hacia arriba.

**Ejemplo de la Tercera Solución:**
```
Nivel 3: Y₂ := 0
         ↓ (aplicar a nivel 2)
Nivel 2: Y₁ := suc(Y₂) = suc(0)
         ↓ (aplicar a nivel 1)
Nivel 1: X := suc(Y₁) = suc(suc(0))
```

### 4. **Backtracking (Búsqueda con Retroceso)**

Cuando se encuentra una solución, Prolog guarda el estado y puede volver atrás para buscar más soluciones.

**Puntos de elección (choice points):**
```
menorOIgual(0, X) tiene 2 opciones:
├─ Regla 1 (explorada primero)
└─ Regla 2 (explorada después en backtracking)

menorOIgual(0, Y₁) tiene 2 opciones:
├─ Regla 1 (explorada primero)
└─ Regla 2 (explorada después en backtracking)

... y así sucesivamente
```

---

## Comparación con la Versión Problemática

### Versión Original (NO reversible en Y):

```prolog
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).  % Regla 1
menorOIgual(X, X) :- natural(X).               % Regla 2
```

**Problema con `?- menorOIgual(0, Y)`:**

```
?- menorOIgual(0, Y).
|
└─ [Regla 1] Y := suc(Y₁), ?- menorOIgual(0, Y₁)
   |
   └─ [Regla 1] Y₁ := suc(Y₂), ?- menorOIgual(0, Y₂)
      |
      └─ [Regla 1] Y₂ := suc(Y₃), ?- menorOIgual(0, Y₃)
         |
         └─ ... (NUNCA llega al caso base)
```

**Razón:** La Regla 1 siempre se prueba primero, y siempre puede unificar `Y` con `suc(Y₁)`, creando un bucle infinito SIN GENERAR SOLUCIONES.

### Versión Correcta (reversible):

```prolog
menorOIgual(X, X) :- natural(X).               % Regla 1 (caso base PRIMERO)
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).  % Regla 2 (recursión DESPUÉS)
```

**Por qué funciona:**
- La Regla 1 se prueba primero y genera una solución inmediata
- Luego en backtracking, la Regla 2 genera soluciones adicionales
- Cada aplicación de la Regla 2 eventualmente llega al caso base (Regla 1)

---

## Traza de Ejecución Paso a Paso (Estilo Debugger)

### Sesión Completa de Prolog

```prolog
?- menorOIgual(0, X).

[1] Call: menorOIgual(0, X)
[2]  Try: menorOIgual(0, X) with menorOIgual(X₁, X₁) :- natural(X₁)
[2]  Unify: X₁=0, X=0
[3]  Call: natural(0)
[3]  Exit: natural(0)  ✓
[2]  Exit: menorOIgual(0, 0)
[1]  Exit: menorOIgual(0, 0)

X = 0 ;    ← Usuario presiona ';' para buscar más soluciones

[2]  Redo: menorOIgual(0, 0)
[2]  Try: menorOIgual(0, X) with menorOIgual(X₃, suc(Y₁)) :- menorOIgual(X₃, Y₁)
[2]  Unify: X₃=0, X=suc(Y₁)
[3]  Call: menorOIgual(0, Y₁)
[4]   Try: menorOIgual(0, Y₁) with menorOIgual(X₄, X₄) :- natural(X₄)
[4]   Unify: X₄=0, Y₁=0
[5]   Call: natural(0)
[5]   Exit: natural(0)  ✓
[4]   Exit: menorOIgual(0, 0)
[3]  Exit: menorOIgual(0, 0)
[2]  Exit: menorOIgual(0, suc(0))
[1]  Exit: menorOIgual(0, suc(0))

X = suc(0) ;    ← Usuario presiona ';'

[4]   Redo: menorOIgual(0, 0)
[4]   Try: menorOIgual(0, Y₁) with menorOIgual(X₅, suc(Y₂)) :- menorOIgual(X₅, Y₂)
[4]   Unify: X₅=0, Y₁=suc(Y₂)
[5]   Call: menorOIgual(0, Y₂)
[6]    Try: menorOIgual(0, Y₂) with menorOIgual(X₆, X₆) :- natural(X₆)
[6]    Unify: X₆=0, Y₂=0
[7]    Call: natural(0)
[7]    Exit: natural(0)  ✓
[6]    Exit: menorOIgual(0, 0)
[5]   Exit: menorOIgual(0, 0)
[4]   Exit: menorOIgual(0, suc(0))
[3]  Exit: menorOIgual(0, suc(0))
[2]  Exit: menorOIgual(0, suc(suc(0)))
[1]  Exit: menorOIgual(0, suc(suc(0)))

X = suc(suc(0)) ;    ← Usuario presiona ';'

... (continúa infinitamente)
```

**Leyenda:**
- `Call`: Se invoca un objetivo
- `Try`: Se intenta unificar con una regla
- `Unify`: Resultado de la unificación
- `Exit`: El objetivo tiene éxito
- `Redo`: Backtracking para buscar más soluciones

---

## Patrón General de Soluciones

### Fórmula

Para la n-ésima solución (comenzando desde n=0):

```
X = suc^n(0)
```

Donde `suc^n(0)` significa aplicar el constructor `suc` n veces a `0`.

### Ejemplos:

| n | Aplicaciones de suc | Valor de X |
|---|---------------------|------------|
| 0 | 0                   | `0` |
| 1 | 1                   | `suc(0)` |
| 2 | 2                   | `suc(suc(0))` |
| 3 | 3                   | `suc(suc(suc(0)))` |
| n | n                   | `suc^n(0)` |

### Profundidad del Árbol

La profundidad del árbol para obtener la n-ésima solución es:
```
Profundidad = n + 1
```

- Solución 1 (n=0): profundidad 1
- Solución 2 (n=1): profundidad 2
- Solución 3 (n=2): profundidad 3
- etc.

---

## Conclusión

El predicado `menorOIgual(0, X)` genera **infinitas soluciones** mediante el siguiente proceso:

1. **Primera solución inmediata:** La Regla 1 produce X = 0
2. **Backtracking infinito:** La Regla 2 se aplica recursivamente
3. **Generación incremental:** Cada backtracking añade un nivel más de `suc`
4. **Terminación del caso base:** Cada rama recursiva termina en `natural(0)`

**Ventajas del orden de las reglas:**
- El caso base está primero, garantizando al menos una solución
- Las soluciones se generan en orden ascendente (0, 1, 2, 3, ...)
- El predicado es reversible: funciona para `menorOIgual(0, X)` y `menorOIgual(X, 0)`

**Conceptos de resolución aplicados:**
- **Unificación:** Igualar términos mediante sustituciones
- **MGU:** Encontrar el unificador más general
- **Renombramiento:** Evitar conflictos de variables
- **Backtracking:** Búsqueda sistemática de todas las soluciones
- **Composición de sustituciones:** Propagar valores desde niveles profundos

Este es un ejemplo perfecto de cómo Prolog utiliza **resolución SLD (Selective Linear Definite clause resolution)** con **backtracking** para explorar sistemáticamente el espacio de soluciones.
