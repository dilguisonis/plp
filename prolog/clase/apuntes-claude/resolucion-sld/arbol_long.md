# Árbol de Resolución: `?- long([1,2,3], X)`

## Programa Prolog

```prolog
long([], 0).                              % Regla 1 (caso base)
long([H|T], N) :- long(T, N1), N is N1 + 1.  % Regla 2 (caso recursivo)
```

## Árbol de Ejecución Completo

```
?- long([1,2,3], X)
|
└─ Intenta Regla 2: long([H|T], N) :- long(T, N1), N is N1 + 1
   |
   └─ Unificación: long([1,2,3], X) ?= long([H|T], N)
      |
      └─ MGU: {H := 1, T := [2,3], N := X}
         |
         └─ Nuevos objetivos: long([2,3], N1), X is N1 + 1
            |
            └─ Primero resuelve: long([2,3], N1)
               |
               └─ Intenta Regla 2: long([H|T], N) :- long(T, N1), N is N1 + 1
                  |
                  └─ Unificación: long([2,3], N1) ?= long([H₂|T₂], N₂)
                     |  (renombramos variables para evitar conflictos)
                     |
                     └─ MGU: {H₂ := 2, T₂ := [3], N₂ := N1}
                        |
                        └─ Nuevos objetivos: long([3], N1₂), N1 is N1₂ + 1
                           |
                           └─ Primero resuelve: long([3], N1₂)
                              |
                              └─ Intenta Regla 2: long([H|T], N) :- long(T, N1), N is N1 + 1
                                 |
                                 └─ Unificación: long([3], N1₂) ?= long([H₃|T₃], N₃)
                                    |
                                    └─ MGU: {H₃ := 3, T₃ := [], N₃ := N1₂}
                                       |
                                       └─ Nuevos objetivos: long([], N1₃), N1₂ is N1₃ + 1
                                          |
                                          └─ Primero resuelve: long([], N1₃)
                                             |
                                             └─ Intenta Regla 1: long([], 0)
                                                |
                                                └─ Unificación: long([], N1₃) ?= long([], 0)
                                                   |
                                                   └─ MGU: {N1₃ := 0} ✓ ÉXITO
                                                      |
                                                      └─ Ahora se resuelven las operaciones aritméticas
                                                         (de adentro hacia afuera):

                                                         N1₂ is N1₃ + 1
                                                         N1₂ is 0 + 1
                                                         N1₂ = 1 ✓

                                                         N1 is N1₂ + 1
                                                         N1 is 1 + 1
                                                         N1 = 2 ✓

                                                         X is N1 + 1
                                                         X is 2 + 1
                                                         X = 3 ✓
```

## Paso a Paso Detallado

### **Llamada 1: `long([1,2,3], X)`**

**Unificación con Regla 2:**
```
long([1,2,3], X) ?= long([H|T], N)
```

**MGU:**
```
{H := 1, T := [2,3], N := X}
```

**Objetivos generados:**
```
long([2,3], N1), X is N1 + 1
```

**Estado:** Pendiente de resolver `long([2,3], N1)`

---

### **Llamada 2: `long([2,3], N1)`**

**Unificación con Regla 2:**
```
long([2,3], N1) ?= long([H₂|T₂], N₂)
```

**MGU:**
```
{H₂ := 2, T₂ := [3], N₂ := N1}
```

**Objetivos generados:**
```
long([3], N1₂), N1 is N1₂ + 1
```

**Estado:** Pendiente de resolver `long([3], N1₂)`

---

### **Llamada 3: `long([3], N1₂)`**

**Unificación con Regla 2:**
```
long([3], N1₂) ?= long([H₃|T₃], N₃)
```

**MGU:**
```
{H₃ := 3, T₃ := [], N₃ := N1₂}
```

**Objetivos generados:**
```
long([], N1₃), N1₂ is N1₃ + 1
```

**Estado:** Pendiente de resolver `long([], N1₃)`

---

### **Llamada 4: `long([], N1₃)`** ← CASO BASE

**Unificación con Regla 1:**
```
long([], N1₃) ?= long([], 0)
```

**MGU:**
```
{N1₃ := 0}
```

**Estado:** ✓ **ÉXITO** - Se alcanzó el caso base

---

## Fase de Retorno (Backtracking con valores)

Ahora se resuelven las operaciones aritméticas **de abajo hacia arriba**:

### **Retorno de Llamada 3:**
```
N1₂ is N1₃ + 1
N1₂ is 0 + 1
N1₂ = 1
```

### **Retorno de Llamada 2:**
```
N1 is N1₂ + 1
N1 is 1 + 1
N1 = 2
```

### **Retorno de Llamada 1:**
```
X is N1 + 1
X is 2 + 1
X = 3
```

## Resultado Final

```
X = 3
```

---

## Diagrama de Pila de Llamadas

```
┌─────────────────────────────────┐
│ long([1,2,3], X)                │ ← X = 3
│   ↓ long([2,3], N1)             │ ← N1 = 2
│     ↓ long([3], N1₂)            │ ← N1₂ = 1
│       ↓ long([], N1₃)           │ ← N1₃ = 0 (caso base)
│       ↑ N1₃ = 0                 │
│     ↑ N1₂ = 0 + 1 = 1           │
│   ↑ N1 = 1 + 1 = 2              │
│ ↑ X = 2 + 1 = 3                 │
└─────────────────────────────────┘
```

---

## ¿Por Qué Funciona Esta Versión?

### **Orden Correcto:**
```prolog
long([H|T], N) :- long(T, N1), N is N1 + 1.
```

1. **Primero:** Calcula recursivamente la longitud de la cola `T` → obtiene `N1`
2. **Después:** Suma 1 a ese resultado → obtiene `N`

### **Versión Incorrecta (tu código original):**
```prolog
long([H|T], N) :- N1 is N+1, long(T, N1).
```

**Problema:** Intenta usar `N` antes de que tenga un valor:
- `N1 is N+1` → ERROR: `N` es una variable sin instanciar
- Prolog no puede hacer `N+1` si no sabe cuánto vale `N`

---

## Concepto Clave: Recursión de Cola vs Recursión Tradicional

### **Versión actual (recursión tradicional):**
```prolog
long([H|T], N) :- long(T, N1), N is N1 + 1.
```
- Baja hasta el final (lista vacía)
- Acumula resultados al subir
- Calcula: 0 → 1 → 2 → 3

### **Versión con acumulador (más eficiente):**
```prolog
long(L, N) :- longAcc(L, 0, N).
longAcc([], Acc, Acc).
longAcc([H|T], Acc, N) :- Acc1 is Acc + 1, longAcc(T, Acc1, N).
```
- Lleva el conteo mientras baja
- No necesita acumular al subir
- Es más eficiente en memoria

---

## Resumen Visual

```
Lista: [1, 2, 3]

Bajada (recursión):          Subida (cálculo):
long([1,2,3], X)     →       ← X = 2 + 1 = 3
  long([2,3], N1)    →       ← N1 = 1 + 1 = 2
    long([3], N1₂)   →       ← N1₂ = 0 + 1 = 1
      long([], N1₃)  →       ← N1₃ = 0 (caso base)
```

¡La clave está en el orden: primero resuelve la recursión, **después** hace la aritmética! 🎯
