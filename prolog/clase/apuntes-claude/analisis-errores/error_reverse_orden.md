# Error: Orden Incorrecto de Metas en `reverse/2`

## Problema Identificado

El predicado `reverse/2` con orden incorrecto de metas causa **bucles infinitos** por usar predicados generadores con variables no instanciadas.

---

## Versiones del Código

### ❌ Versión Problemática (NO termina)

```prolog
reverse(X, X) :- length(X,1).
reverse(XS, YS) :-
    append(H,L1,XS),
    append(L2,H,YS),      % ❌ L2 no instanciada!
    length(H,1),
    reverse(L1, L2).
```

### ✓ Versión Correcta (Termina correctamente)

```prolog
reverse([], []).
reverse(XS, YS) :-
    length(H,1),          % 1. Restringe primero
    append(H,L1,XS),      % 2. Separa XS
    reverse(L1, L2),      % 3. INSTANCIA L2
    append(L2,H,YS).      % 4. Usa L2 instanciada
```

---

## Análisis SLD: Por qué NO Termina

### Consulta: `?- reverse([1,2], R).`

#### Árbol de Resolución (Versión Problemática)

```
?- reverse([1,2], R).
|
├─ [Intenta Regla 1] reverse(X, X) :- length(X,1)
│  |
│  └─ mgu(reverse([1,2], R) ?= reverse(X₁, X₁))
│     |
│     └─ [1,2]/X₁, R/X₁ → R := [1,2], X₁ := [1,2]
│        |
│        └─ Nuevo objetivo: ?- length([1,2], 1).
│           |
│           └─ ✗ FALLA (length([1,2], N) → N = 2, no 1)
|
└─ [Intenta Regla 2] reverse(XS, YS) :- append(H,L1,XS), append(L2,H,YS), length(H,1), reverse(L1,L2)
   |
   └─ mgu(reverse([1,2], R) ?= reverse(XS₁, YS₁))
      |
      └─ XS₁ := [1,2], YS₁ := R
         |
         └─ Nuevos objetivos: ?- append(H₁,L1₁,[1,2]), append(L2₁,H₁,R), length(H₁,1), reverse(L1₁,L2₁).
            |
            ├─ [Meta 1] ?- append(H₁,L1₁,[1,2])
            │  |
            │  └─ Genera múltiples opciones (choice points):
            │     ├─ Opción 1: H₁ = [],      L1₁ = [1,2]
            │     ├─ Opción 2: H₁ = [1],     L1₁ = [2]
            │     ├─ Opción 3: H₁ = [1,2],   L1₁ = []
            │     └─ Opción 4: H₁ = [1,2,3], L1₁ = ... (no unifica, descartada)
            |
            ├─ [Tomando Opción 1: H₁=[], L1₁=[1,2]]
            │  |
            │  └─ [Meta 2] ?- append(L2₁,[],R)
            │     |
            │     └─ ⚠️ PROBLEMA CRÍTICO: L2₁ NO INSTANCIADA, R NO INSTANCIADA
            │        |
            │        └─ append/3 con dos argumentos no instanciados genera INFINITAS soluciones:
            │           |
            │           ├─ Solución 1: L2₁ = [],        R = []
            │           │  |
            │           │  └─ [Meta 3] ?- length([],1)
            │           │     |
            │           │     └─ ✗ FALLA
            │           |
            │           ├─ Solución 2: L2₁ = [_],       R = [_]
            │           │  |
            │           │  └─ [Meta 3] ?- length([],1)
            │           │     |
            │           │     └─ ✗ FALLA (todavía)
            │           |
            │           ├─ Solución 3: L2₁ = [_,_],     R = [_,_]
            │           │  |
            │           │  └─ [Meta 3] ?- length([],1)
            │           │     |
            │           │     └─ ✗ FALLA (todavía)
            │           |
            │           ├─ Solución 4: L2₁ = [_,_,_],   R = [_,_,_]
            │           │  |
            │           │  └─ ... NUNCA llega a length(H₁,1) que descartaría esta rama
            │           |
            │           ├─ Solución 5: L2₁ = [_,_,_,_], R = [_,_,_,_]
            │           |
            │           └─ ... ∞ BUCLE INFINITO
            │              |
            │              └─ NUNCA alcanza reverse(L1₁,L2₁) que instanciaría L2₁
```

---

## Explicación Detallada del Problema

### Paso 1: Primera Unificación

```
Consulta:     reverse([1,2], R)
Regla 2:      reverse(XS, YS) :- append(H,L1,XS), append(L2,H,YS), length(H,1), reverse(L1,L2)
Renombrada:   reverse(XS₁, YS₁) :- append(H₁,L1₁,XS₁), append(L2₁,H₁,YS₁), length(H₁,1), reverse(L1₁,L2₁)
```

**MGU:**
```
{XS₁ := [1,2], YS₁ := R}
```

**Nuevos objetivos:**
```
?- append(H₁,L1₁,[1,2]), append(L2₁,H₁,R), length(H₁,1), reverse(L1₁,L2₁).
```

### Paso 2: Ejecutar `append(H₁,L1₁,[1,2])`

`append/3` es un **predicado generador** que con el tercer argumento instanciado genera múltiples soluciones:

```prolog
append([], L, L).
append([X|L1], L2, [X|L3]) :- append(L1, L2, L3).
```

**Soluciones generadas:**
```
H₁ = [],      L1₁ = [1,2]     (primera opción)
H₁ = [1],     L1₁ = [2]       (segunda opción)
H₁ = [1,2],   L1₁ = []        (tercera opción)
```

### Paso 3: Tomar primera opción: `H₁ = [], L1₁ = [1,2]`

**Estado actual:**
```
H₁ = []
L1₁ = [1,2]
R = ? (no instanciada)
L2₁ = ? (no instanciada)
```

**Siguiente meta:** `append(L2₁, [], R)`

### Paso 4: Ejecutar `append(L2₁, [], R)` ← ⚠️ PROBLEMA CRÍTICO

Con **L2₁ y R no instanciadas**, `append/3` genera **infinitas soluciones**:

```
Solución 1:  L2₁ = [],              R = []
Solución 2:  L2₁ = [_G1],           R = [_G1]
Solución 3:  L2₁ = [_G1,_G2],       R = [_G1,_G2]
Solución 4:  L2₁ = [_G1,_G2,_G3],   R = [_G1,_G2,_G3]
...
∞
```

### Paso 5: Tomar primera opción de append: `L2₁ = [], R = []`

**Siguiente meta:** `length([], 1)`

**Resultado:** ✗ **FALLA** (length([],N) → N=0, no 1)

### Paso 6: Backtracking a siguiente opción de append

**Segunda opción:** `L2₁ = [_G1], R = [_G1]`

**Siguiente meta:** `length([], 1)`

**Resultado:** ✗ **FALLA** (todavía chequea length(H₁,1) donde H₁=[])

**Observación crítica:** El problema es que `length(H₁,1)` chequea la longitud de **H₁** (que es `[]`), no de L2₁.

### Paso 7: Análisis del Bucle

El bucle ocurre porque:

1. `append(H₁,L1₁,[1,2])` genera la opción `H₁=[]`
2. `append(L2₁,[],R)` con L2₁ y R no instanciadas genera **infinitas opciones**
3. `length([],1)` falla para cada opción
4. Prolog hace backtracking a `append(L2₁,[],R)` y genera más opciones
5. Este proceso **nunca termina** porque:
   - Nunca alcanza `reverse(L1₁,L2₁)` que **instanciaría L2₁**
   - `append` puede generar infinitas listas para L2₁

---

## Comparación: Por qué la Versión Correcta Termina

### Árbol de Resolución (Versión Correcta)

```
?- reverse([1,2], R).
|
├─ [Intenta Regla 1] reverse([],[])
│  |
│  └─ mgu(reverse([1,2], R) ?= reverse([],[]))
│     |
│     └─ ✗ FALLA ([1,2] ≠ [])
|
└─ [Intenta Regla 2] reverse(XS, YS) :- length(H,1), append(H,L1,XS), reverse(L1,L2), append(L2,H,YS)
   |
   └─ XS₁ := [1,2], YS₁ := R
      |
      └─ Nuevos objetivos: ?- length(H₁,1), append(H₁,L1₁,[1,2]), reverse(L1₁,L2₁), append(L2₁,H₁,R).
         |
         ├─ [Meta 1] ?- length(H₁,1)
         │  |
         │  └─ ✓ H₁ = [_G1]  (una lista de exactamente 1 elemento)
         │     |
         │     └─ **RESTRINGE H₁ antes de usarla**
         |
         ├─ [Meta 2] ?- append([_G1],L1₁,[1,2])
         │  |
         │  └─ Con H₁ ya restringida a longitud 1, solo genera 2 opciones:
         │     ├─ Opción 1: _G1=1, L1₁=[2]     ✓ (correcta)
         │     └─ Opción 2: _G1=2, L1₁=[1]     (también válida, pero no la primera)
         │  |
         │  └─ Toma Opción 1: H₁=[1], L1₁=[2]
         |
         ├─ [Meta 3] ?- reverse([2], L2₁)
         │  |
         │  └─ ✓ L2₁ = [2]  **← L2₁ QUEDA INSTANCIADA**
         |
         └─ [Meta 4] ?- append([2],[1],R)
            |
            └─ Con L2₁=[2] y H₁=[1] **INSTANCIADOS**:
               |
               └─ ✓ R = [2,1]  **← Determinístico, no genera infinitas opciones**

SOLUCIÓN: R = [2,1]  ✓ ÉXITO
```

---

## Diferencias Clave

### Versión Problemática

```prolog
reverse(XS, YS) :-
    append(H,L1,XS),      % H puede ser cualquier longitud
    append(L2,H,YS),      % ❌ L2 NO INSTANCIADA → genera ∞ opciones
    length(H,1),          % Nunca se alcanza (o se alcanza tarde)
    reverse(L1, L2).      % Nunca se alcanza
```

**Flujo de ejecución:**
1. `append(H,L1,XS)` → H=[] es válido
2. `append(L2,H,YS)` con L2 no instanciada → **∞ opciones**
3. Nunca llega a las siguientes metas

### Versión Correcta

```prolog
reverse([], []).
reverse(XS, YS) :-
    length(H,1),          % ✓ Restringe H PRIMERO
    append(H,L1,XS),      % ✓ H ya restringida → pocas opciones
    reverse(L1, L2),      % ✓ INSTANCIA L2
    append(L2,H,YS).      % ✓ L2 ya instanciada → determinístico
```

**Flujo de ejecución:**
1. `length(H,1)` → H debe tener longitud 1
2. `append(H,L1,XS)` con H restringida → solo 2-3 opciones
3. `reverse(L1,L2)` → **instancia L2**
4. `append(L2,H,YS)` con L2 instanciada → **determinístico**

---

## Tabla Comparativa

| Aspecto | Versión Problemática | Versión Correcta |
|---------|---------------------|------------------|
| **Primer paso** | `append(H,L1,XS)` - genera varias opciones | `length(H,1)` - restringe H |
| **H₁=[] es opción?** | ✓ Sí, es válida inicialmente | ✗ No, length(H,1) lo previene |
| **Estado de L2 en append(L2,H,YS)** | ❌ No instanciada | ✓ Instanciada por reverse |
| **Opciones generadas** | ∞ infinitas | Finitas (determinístico) |
| **Termina?** | ❌ No | ✓ Sí |
| **Resultado** | Bucle infinito | R = [2,1] |

---

## Principios Generales

### Regla de Oro: Orden de Metas

**Orden correcto:**
1. **RESTRINGIR** primero (length, guardas, condiciones)
2. **INSTANCIAR** variables (recursión, cálculos)
3. **USAR** variables instanciadas en predicados generadores

### Predicados Generadores Peligrosos

Predicados que generan infinitas soluciones con argumentos no instanciados:

- `append(X, Y, Z)` - con 2+ argumentos no instanciados
- `length(L, N)` - con L no instanciada
- Predicados recursivos sin restricciones

### Checklist para Evitar Bucles Infinitos

Al escribir predicados con múltiples metas:

1. ✓ **¿Las restricciones van primero?** (length, is, <, >, etc.)
2. ✓ **¿Las variables se instancian antes de usarse?**
3. ✓ **¿Los predicados generadores reciben variables instanciadas?**
4. ✓ **¿Puedo reordenar las metas para mejorar eficiencia?**
5. ✓ **¿El caso base está completo?** (evita backtracking innecesario)

---

## Traza Completa (Versión Problemática)

```prolog
?- reverse([1,2], R).

[1] Call: reverse([1,2], R)
[2]  Try: reverse(X, X) :- length(X,1)
[2]  Unify: X=[1,2], R=[1,2]
[3]  Call: length([1,2], 1)
[3]  Fail: length([1,2], 1)  % length([1,2],N) → N=2
[2]  Fail: reverse([1,2], [1,2])

[2]  Retry: reverse(XS, YS) :- append(H,L1,XS), append(L2,H,YS), length(H,1), reverse(L1,L2)
[2]  Unify: XS=[1,2], YS=R
[3]  Call: append(H, L1, [1,2])
[3]  Exit: append([], [1,2], [1,2])  % Primera solución: H=[], L1=[1,2]

[4]  Call: append(L2, [], R)  % ← L2 y R no instanciadas!
[4]  Exit: append([], [], [])  % L2=[], R=[]

[5]  Call: length([], 1)
[5]  Fail: length([], 1)  % length([],N) → N=0

[4]  Redo: append(L2, [], R)
[4]  Exit: append([_G1], [], [_G1])  % L2=[_G1], R=[_G1]

[5]  Call: length([], 1)
[5]  Fail: length([], 1)  % Todavía falla (H es [], no L2)

[4]  Redo: append(L2, [], R)
[4]  Exit: append([_G1,_G2], [], [_G1,_G2])  % L2=[_G1,_G2], R=[_G1,_G2]

[5]  Call: length([], 1)
[5]  Fail: length([], 1)

[4]  Redo: append(L2, [], R)
[4]  Exit: append([_G1,_G2,_G3], [], [_G1,_G2,_G3])

... ∞ BUCLE INFINITO
```

---

## Traza Completa (Versión Correcta)

```prolog
?- reverse([1,2], R).

[1] Call: reverse([1,2], R)
[2]  Try: reverse([], [])
[2]  Fail: unify([1,2], [])

[2]  Retry: reverse(XS, YS) :- length(H,1), append(H,L1,XS), reverse(L1,L2), append(L2,H,YS)
[2]  Unify: XS=[1,2], YS=R

[3]  Call: length(H, 1)
[3]  Exit: length([_G1], 1)  % H=[_G1] (lista de 1 elemento)

[4]  Call: append([_G1], L1, [1,2])
[4]  Exit: append([1], [2], [1,2])  % _G1=1, L1=[2]

[5]  Call: reverse([2], L2)
[6]   Call: length(H2, 1)
[6]   Exit: length([_G2], 1)
[7]   Call: append([_G2], L12, [2])
[7]   Exit: append([2], [], [2])  % _G2=2, L12=[]
[8]   Call: reverse([], L22)
[8]   Exit: reverse([], [])  % L22=[]
[9]   Call: append([], [2], L2)
[9]   Exit: append([], [2], [2])  % L2=[2]
[5]  Exit: reverse([2], [2])  % ← L2 INSTANCIADA = [2]

[10] Call: append([2], [1], R)
[10] Exit: append([2], [1], [2,1])  % R=[2,1]

[2]  Exit: reverse([1,2], [2,1])
[1]  Exit: reverse([1,2], [2,1])

R = [2,1].  ✓ ÉXITO
```

---

## Conclusión

El orden de las metas en Prolog es **crítico** para evitar bucles infinitos. La regla fundamental es:

> **INSTANCIAR variables ANTES de usarlas en predicados generadores**

Este error es común y difícil de detectar sin analizar el árbol de resolución SLD completo. Siempre verifica:
1. ¿Qué variables están instanciadas en cada paso?
2. ¿Los predicados generadores reciben todas las variables necesarias?
3. ¿Puedo reordenar las metas para instanciar primero?
