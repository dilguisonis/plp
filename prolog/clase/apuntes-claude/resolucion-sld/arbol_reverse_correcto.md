# Árbol de Resolución: `?- reverse([1,2,3], X)` (Versión Correcta)

## Programa Prolog

```prolog
reverse([], []).
reverse(XS, YS) :-
      length(H,1),           % 1. Restringe H a longitud 1
      append(H,L1,XS),       % 2. Separa XS en H y L1
      reverse(L1, L2),       % 3. Invierte L1 recursivamente
      append(L2,H,YS).       % 4. Construye YS = L2 ++ H
```

## Consulta: `?- reverse([1,2,3], X).`

---

## Árbol de Resolución SLD Completo

```
?- reverse([1,2,3], X).
|
├─ [Intenta Regla 1] reverse([],[])
│  |
│  └─ mgu(reverse([1,2,3], X) ?= reverse([],[]))
│     |
│     └─ [1,2,3] ?= []  ✗ FALLA
|
└─ [Intenta Regla 2] reverse(XS, YS) :- length(H,1), append(H,L1,XS), reverse(L1,L2), append(L2,H,YS)
   |
   └─ mgu(reverse([1,2,3], X) ?= reverse(XS₁, YS₁))
      |
      └─ {XS₁ := [1,2,3], YS₁ := X}
         |
         └─ Objetivos: ?- length(H₁,1), append(H₁,L1₁,[1,2,3]), reverse(L1₁,L2₁), append(L2₁,H₁,X).
            |
            ├─ [Meta 1] ?- length(H₁,1)
            │  |
            │  └─ H₁ = [_A₁]  ✓ (lista de exactamente 1 elemento)
            |
            ├─ [Meta 2] ?- append([_A₁],L1₁,[1,2,3])
            │  |
            │  └─ mgu: {_A₁ := 1, L1₁ := [2,3]}  ✓
            │     |
            │     └─ H₁ = [1], L1₁ = [2,3]
            |
            ├─ [Meta 3] ?- reverse([2,3], L2₁)
            │  |
            │  └─ ═══════════════════════════════════════════
            │     │           LLAMADA RECURSIVA - NIVEL 2
            │     ═══════════════════════════════════════════
            │     |
            │     ├─ [Intenta Regla 1] reverse([],[])
            │     │  |
            │     │  └─ [2,3] ?= []  ✗ FALLA
            │     |
            │     └─ [Intenta Regla 2]
            │        |
            │        └─ {XS₂ := [2,3], YS₂ := L2₁}
            │           |
            │           └─ ?- length(H₂,1), append(H₂,L1₂,[2,3]), reverse(L1₂,L2₂), append(L2₂,H₂,L2₁).
            │              |
            │              ├─ [Meta 1] ?- length(H₂,1)
            │              │  |
            │              │  └─ H₂ = [_A₂]  ✓
            │              |
            │              ├─ [Meta 2] ?- append([_A₂],L1₂,[2,3])
            │              │  |
            │              │  └─ {_A₂ := 2, L1₂ := [3]}  ✓
            │              │     |
            │              │     └─ H₂ = [2], L1₂ = [3]
            │              |
            │              ├─ [Meta 3] ?- reverse([3], L2₂)
            │              │  |
            │              │  └─ ═══════════════════════════════════════════
            │              │     │           LLAMADA RECURSIVA - NIVEL 3
            │              │     ═══════════════════════════════════════════
            │              │     |
            │              │     ├─ [Intenta Regla 1] reverse([],[])
            │              │     │  |
            │              │     │  └─ [3] ?= []  ✗ FALLA
            │              │     |
            │              │     └─ [Intenta Regla 2]
            │              │        |
            │              │        └─ {XS₃ := [3], YS₃ := L2₂}
            │              │           |
            │              │           └─ ?- length(H₃,1), append(H₃,L1₃,[3]), reverse(L1₃,L2₃), append(L2₃,H₃,L2₂).
            │              │              |
            │              │              ├─ [Meta 1] ?- length(H₃,1)
            │              │              │  |
            │              │              │  └─ H₃ = [_A₃]  ✓
            │              │              |
            │              │              ├─ [Meta 2] ?- append([_A₃],L1₃,[3])
            │              │              │  |
            │              │              │  └─ {_A₃ := 3, L1₃ := []}  ✓
            │              │              │     |
            │              │              │     └─ H₃ = [3], L1₃ = []
            │              │              |
            │              │              ├─ [Meta 3] ?- reverse([], L2₃)
            │              │              │  |
            │              │              │  └─ ═══════════════════════════════════════════
            │              │              │     │           LLAMADA RECURSIVA - NIVEL 4
            │              │              │     │                   (CASO BASE)
            │              │              │     ═══════════════════════════════════════════
            │              │              │     |
            │              │              │     └─ [Intenta Regla 1] reverse([],[])
            │              │              │        |
            │              │              │        └─ mgu(reverse([], L2₃) ?= reverse([],[]))
            │              │              │           |
            │              │              │           └─ {L2₃ := []}  ✓ ÉXITO
            │              │              │              |
            │              │              │              └─ ════════════════════════════════════
            │              │              │                 │    L2₃ = []  ← PRIMERA INSTANCIACIÓN
            │              │              │                 ════════════════════════════════════
            │              │              |
            │              │              └─ [Meta 4] ?- append([],H₃,L2₂)
            │              │                 |
            │              │                 └─ append([],[3],L2₂)
            │              │                    |
            │              │                    └─ L2₂ = [3]  ✓
            │              │                       |
            │              │                       └─ ════════════════════════════════════
            │              │                          │    L2₂ = [3]  ← SEGUNDA INSTANCIACIÓN
            │              │                          ════════════════════════════════════
            │              |
            │              └─ [Meta 4] ?- append(L2₂,H₂,L2₁)
            │                 |
            │                 └─ append([3],[2],L2₁)
            │                    |
            │                    └─ L2₁ = [3,2]  ✓
            │                       |
            │                       └─ ════════════════════════════════════
            │                          │    L2₁ = [3,2]  ← TERCERA INSTANCIACIÓN
            │                          ════════════════════════════════════
            |
            └─ [Meta 4] ?- append(L2₁,H₁,X)
               |
               └─ append([3,2],[1],X)
                  |
                  └─ X = [3,2,1]  ✓
                     |
                     └─ ════════════════════════════════════════════════════════
                        │    X = [3,2,1]  ← SOLUCIÓN FINAL
                        ════════════════════════════════════════════════════════
```

---

## Análisis Detallado por Niveles

### Nivel 1: `reverse([1,2,3], X)`

**Estado inicial:**
```
XS = [1,2,3]
YS = X (no instanciada)
```

**Metas:**
```
1. length(H₁,1)           → H₁ = [_A₁]
2. append([_A₁],L1₁,[1,2,3]) → _A₁=1, L1₁=[2,3]
   |
   └─ H₁ = [1], L1₁ = [2,3]
3. reverse([2,3], L2₁)    → ??? (llamada recursiva)
4. append(L2₁,[1],X)      → X = L2₁ ++ [1]
```

**Observación:** `append` en Meta 2 es **determinístico** porque [1,2,3] está instanciado.

---

### Nivel 2: `reverse([2,3], L2₁)`

**Estado inicial:**
```
XS = [2,3]
YS = L2₁ (no instanciada)
```

**Metas:**
```
1. length(H₂,1)           → H₂ = [_A₂]
2. append([_A₂],L1₂,[2,3]) → _A₂=2, L1₂=[3]
   |
   └─ H₂ = [2], L1₂ = [3]
3. reverse([3], L2₂)      → ??? (llamada recursiva)
4. append(L2₂,[2],L2₁)    → L2₁ = L2₂ ++ [2]
```

---

### Nivel 3: `reverse([3], L2₂)`

**Estado inicial:**
```
XS = [3]
YS = L2₂ (no instanciada)
```

**Metas:**
```
1. length(H₃,1)           → H₃ = [_A₃]
2. append([_A₃],L1₃,[3])   → _A₃=3, L1₃=[]
   |
   └─ H₃ = [3], L1₃ = []
3. reverse([], L2₃)       → ??? (llamada recursiva)
4. append(L2₃,[3],L2₂)    → L2₂ = L2₃ ++ [3]
```

---

### Nivel 4: `reverse([], L2₃)` (CASO BASE)

**Unificación con Regla 1:**
```
reverse([], L2₃) ?= reverse([], [])
```

**MGU:**
```
{L2₃ := []}
```

**Resultado:**
```
L2₃ = []  ✓ INSTANCIADA
```

---

## Propagación de Valores (Bottom-Up)

```
Nivel 4:  L2₃ = []
          |
          └─ append([],[3],L2₂)
             |
             └─ L2₂ = [3]  ✓

Nivel 3:  L2₂ = [3]
          |
          └─ append([3],[2],L2₁)
             |
             └─ L2₁ = [3,2]  ✓

Nivel 2:  L2₁ = [3,2]
          |
          └─ append([3,2],[1],X)
             |
             └─ X = [3,2,1]  ✓

Nivel 1:  X = [3,2,1]  ← SOLUCIÓN FINAL
```

---

## Visualización: Flujo de Datos

```
┌─────────────────────────────────────────────────────────────┐
│                    LLAMADA (Top-Down)                       │
└─────────────────────────────────────────────────────────────┘

reverse([1,2,3], X)
    │
    ├─ H₁=[1], L1₁=[2,3]
    │
    └─ reverse([2,3], L2₁)
           │
           ├─ H₂=[2], L1₂=[3]
           │
           └─ reverse([3], L2₂)
                  │
                  ├─ H₃=[3], L1₃=[]
                  │
                  └─ reverse([], L2₃)
                         │
                         └─ CASO BASE: L2₃ = []

┌─────────────────────────────────────────────────────────────┐
│                    RETORNO (Bottom-Up)                       │
└─────────────────────────────────────────────────────────────┘

reverse([], L2₃)
    │
    └─ L2₃ = []
       │
       └─ append([],[3],L2₂)
          │
          └─ L2₂ = [3]
             │
             └─ append([3],[2],L2₁)
                │
                └─ L2₁ = [3,2]
                   │
                   └─ append([3,2],[1],X)
                      │
                      └─ X = [3,2,1]  ✓ SOLUCIÓN
```

---

## Tabla: Resumen por Nivel

| Nivel | Llamada | H | L1 | L2 (retorno) | Construcción |
|-------|---------|---|----|--------------|--------------|
| 4 | `reverse([], L2₃)` | - | - | `[]` | Caso base |
| 3 | `reverse([3], L2₂)` | `[3]` | `[]` | `[3]` | `[] ++ [3] = [3]` |
| 2 | `reverse([2,3], L2₁)` | `[2]` | `[3]` | `[3,2]` | `[3] ++ [2] = [3,2]` |
| 1 | `reverse([1,2,3], X)` | `[1]` | `[2,3]` | `[3,2,1]` | `[3,2] ++ [1] = [3,2,1]` |

---

## Pila de Ejecución (Stack Frames)

```
╔═══════════════════════════════════════════════════════════════╗
║  Frame 1: reverse([1,2,3], X)                                 ║
║  H₁=[1], L1₁=[2,3]                                            ║
║  Esperando: L2₁ de reverse([2,3], L2₁)                        ║
╠═══════════════════════════════════════════════════════════════╣
║  Frame 2: reverse([2,3], L2₁)                                 ║
║  H₂=[2], L1₂=[3]                                              ║
║  Esperando: L2₂ de reverse([3], L2₂)                          ║
╠═══════════════════════════════════════════════════════════════╣
║  Frame 3: reverse([3], L2₂)                                   ║
║  H₃=[3], L1₃=[]                                               ║
║  Esperando: L2₃ de reverse([], L2₃)                           ║
╠═══════════════════════════════════════════════════════════════╣
║  Frame 4: reverse([], L2₃)                                    ║
║  CASO BASE: L2₃ = []  ✓                                       ║
╚═══════════════════════════════════════════════════════════════╝
                              │
                              ▼
╔═══════════════════════════════════════════════════════════════╗
║  Frame 3: append([],[3],L2₂)                                  ║
║  L2₂ = [3]  ✓                                                 ║
╠═══════════════════════════════════════════════════════════════╣
║  Frame 2: append([3],[2],L2₁)                                 ║
║  L2₁ = [3,2]  ✓                                               ║
╠═══════════════════════════════════════════════════════════════╣
║  Frame 1: append([3,2],[1],X)                                 ║
║  X = [3,2,1]  ✓                                               ║
╚═══════════════════════════════════════════════════════════════╝
```

---

## Traza de Ejecución (Estilo Debugger)

```prolog
?- reverse([1,2,3], X).

[1] Call: reverse([1,2,3], X)
[2]  Call: length(H, 1)
[2]  Exit: length([_A], 1)
[3]  Call: append([_A], L1, [1,2,3])
[3]  Exit: append([1], [2,3], [1,2,3])
[4]  Call: reverse([2,3], L2)

    [5]  Call: length(H, 1)
    [5]  Exit: length([_B], 1)
    [6]  Call: append([_B], L1, [2,3])
    [6]  Exit: append([2], [3], [2,3])
    [7]  Call: reverse([3], L2)

        [8]  Call: length(H, 1)
        [8]  Exit: length([_C], 1)
        [9]  Call: append([_C], L1, [3])
        [9]  Exit: append([3], [], [3])
        [10] Call: reverse([], L2)
        [10] Exit: reverse([], [])    ← CASO BASE, L2₃=[]
        [11] Call: append([], [3], L2)
        [11] Exit: append([], [3], [3])    ← L2₂=[3]

    [7]  Exit: reverse([3], [3])
    [12] Call: append([3], [2], L2)
    [12] Exit: append([3], [2], [3,2])    ← L2₁=[3,2]

[4]  Exit: reverse([2,3], [3,2])
[13] Call: append([3,2], [1], X)
[13] Exit: append([3,2], [1], [3,2,1])    ← X=[3,2,1]
[1]  Exit: reverse([1,2,3], [3,2,1])

X = [3,2,1].  ✓
```

---

## ¿Por qué NO hay Bucle Infinito?

### Clave: Todos los `append` son DETERMINÍSTICOS

En cada nivel, cuando se ejecuta `append(L2,H,YS)`:

| Nivel | Llamada | Estado de L2 | Comportamiento |
|-------|---------|--------------|----------------|
| 3 | `append([],[3],L2₂)` | `L2₃=[]` (instanciada) | ✓ Determinístico |
| 2 | `append([3],[2],L2₁)` | `L2₂=[3]` (instanciada) | ✓ Determinístico |
| 1 | `append([3,2],[1],X)` | `L2₁=[3,2]` (instanciada) | ✓ Determinístico |

**L2 siempre está instanciada porque `reverse(L1,L2)` se ejecuta ANTES.**

### Comparación con Versión Problemática

**Versión MALA:**
```prolog
append(L2,H,YS),    % L2 = ? (LIBRE) → ∞ opciones
reverse(L1,L2)      % Demasiado tarde
```

**Versión BUENA:**
```prolog
reverse(L1,L2),     % L2 = [valor] (INSTANCIADA)
append(L2,H,YS)     % L2 conocida → 1 opción
```

---

## Backtracking Correcto

Cuando el usuario presiona `;`:

```prolog
?- reverse([1,2,3], X).
X = [3,2,1] ;

[Usuario presiona ';']
    |
    └─ BACKTRACKING al último choice point
       |
       └─ ¿Dónde está?
          |
          └─ En append([1],L1₁,[1,2,3])
             |
             └─ Ya probó: [1] ++ [2,3] = [1,2,3]
                ¿Hay más opciones?
                |
                └─ NO, append es determinístico aquí
       |
       └─ Intenta buscar en reverse([],[])
          |
          └─ NO hay más opciones (solo Regla 1)
       |
       └─ NO HAY MÁS SOLUCIONES

false.  ✓ TERMINA CORRECTAMENTE
```

---

## Patrón de Construcción

El predicado construye la lista invertida de la siguiente manera:

```
[1,2,3]
   ↓
H=[1], L1=[2,3]
   ↓
reverse([2,3]) → [3,2]
   ↓
append([3,2],[1]) → [3,2,1]
```

**Visualmente:**

```
Lista original:    [1, 2, 3]
                    ↑
                    H=[1], L1=[2,3]

Paso 1: Tomar H=[1], procesar L1=[2,3]
Paso 2: reverse([2,3]) = [3,2]
Paso 3: [3,2] ++ [1] = [3,2,1]

Resultado:         [3, 2, 1]
```

---

## Complejidad

### Temporal: O(n²)

Cada nivel:
- `length(H,1)`: O(1)
- `append(H,L1,XS)`: O(n) para encontrar la división
- `reverse(L1,L2)`: O(n-1) llamada recursiva
- `append(L2,H,YS)`: O(n-1) para concatenar

Total: O(1) + O(n) + O(n-1) + O(n-1) = O(n) por nivel × n niveles = **O(n²)**

### Espacial: O(n)

La pila de recursión tiene profundidad n (un frame por elemento).

---

## Conclusión

El predicado funciona correctamente porque:

1. **`length(H,1)`** restringe H a exactamente 1 elemento
2. **`append(H,L1,XS)`** es determinístico (XS instanciada)
3. **`reverse(L1,L2)`** instancia L2 **ANTES** de usarla
4. **`append(L2,H,YS)`** es determinístico (L2 ya instanciada)

No hay bucles infinitos porque **ningún `append` tiene argumentos libres que generen infinitas opciones**. Cada `append` recibe al menos 2 argumentos instanciados, lo que lo hace determinístico.

Este es un ejemplo perfecto de cómo el **orden de las metas** en Prolog determina si un predicado termina correctamente o entra en un bucle infinito.
