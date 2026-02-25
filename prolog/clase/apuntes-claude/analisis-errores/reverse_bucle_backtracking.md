# Árbol de Resolución: Por qué `reverse([1,2,3],X)` da una solución y luego buclea

## Código Problemático

```prolog
reverse([], []).
reverse(XS, YS) :-
      length(H,1),           % 1. Restringe H
      append(H,L1,XS),       % 2. Separa XS
      append(L2,H,YS),       % 3. ❌ L2 NO INSTANCIADA
      reverse(L1, L2).       % 4. Instanciaría L2, pero viene tarde
```

## Consulta: `?- reverse([1,2,3], X).`

**Resultado observado:**
```prolog
?- reverse([1,2,3], X).
X = [3,2,1] ;    ← Primera solución ✓
(buclea)         ← Backtracking → ∞
```

---

## Árbol de Resolución SLD Completo

### Nivel 0: Consulta Inicial

```
?- reverse([1,2,3], X).
|
├─ [Intenta Regla 1] reverse([],[])
│  |
│  └─ mgu(reverse([1,2,3], X) ?= reverse([],[]))
│     |
│     └─ ✗ FALLA ([1,2,3] ≠ [])
|
└─ [Intenta Regla 2] reverse(XS, YS) :- length(H,1), append(H,L1,XS), append(L2,H,YS), reverse(L1,L2)
   |
   └─ mgu(reverse([1,2,3], X) ?= reverse(XS₁, YS₁))
      |
      └─ {XS₁ := [1,2,3], YS₁ := X}
         |
         └─ Objetivos: ?- length(H₁,1), append(H₁,L1₁,[1,2,3]), append(L2₁,H₁,X), reverse(L1₁,L2₁).
```

---

### Nivel 1: Primera Llamada Recursiva

```
?- length(H₁,1), append(H₁,L1₁,[1,2,3]), append(L2₁,H₁,X), reverse(L1₁,L2₁).
|
├─ [Meta 1] ?- length(H₁,1)
│  |
│  └─ ✓ H₁ = [_A]  (lista de exactamente 1 elemento)
|
├─ [Meta 2] ?- append([_A],L1₁,[1,2,3])
│  |
│  └─ Opciones generadas (choice points):
│     ├─ Opción 1: _A=1, L1₁=[2,3]    ← TOMA ESTA PRIMERO
│     ├─ Opción 2: _A=2, L1₁=[1,3]
│     └─ Opción 3: _A=3, L1₁=[1,2]
|  |
|  └─ Toma Opción 1: H₁=[1], L1₁=[2,3]
|
├─ [Meta 3] ?- append(L2₁,[1],X)
│  |
│  └─ ⚠️ L2₁ y X NO INSTANCIADAS → genera infinitas opciones
│     |
│     └─ Opciones posibles:
│        ├─ Opción 1: L2₁=[], X=[1]                      ← TOMA ESTA PRIMERO
│        ├─ Opción 2: L2₁=[_B], X=[_B,1]
│        ├─ Opción 3: L2₁=[_B,_C], X=[_B,_C,1]
│        ├─ Opción 4: L2₁=[_B,_C,_D], X=[_B,_C,_D,1]
│        └─ ... ∞
|     |
|     └─ Toma Opción 1: L2₁=[], X=[1]
|
└─ [Meta 4] ?- reverse([2,3], [])
   |
   └─ ❌ FALLA (reverse de [2,3] no puede ser [])
      |
      └─ BACKTRACKING a Meta 3 (append(L2₁,[1],X))
```

---

### Backtracking 1: Segunda Opción de append(L2₁,[1],X)

```
[Meta 3 - Opción 2] ?- append(L2₁,[1],X)
|
└─ L2₁=[_B], X=[_B,1]
   |
   └─ [Meta 4] ?- reverse([2,3], [_B])
      |
      └─ ❌ FALLA (reverse de [2,3] no puede tener longitud 1)
         |
         └─ BACKTRACKING a Meta 3 (append(L2₁,[1],X))
```

---

### Backtracking 2: Tercera Opción de append(L2₁,[1],X)

```
[Meta 3 - Opción 3] ?- append(L2₁,[1],X)
|
└─ L2₁=[_B,_C], X=[_B,_C,1]
   |
   └─ [Meta 4] ?- reverse([2,3], [_B,_C])
      |
      └─ ✓ Posible, continúa...
         |
         └─ Llamada recursiva: reverse([2,3], [_B,_C])
            |
            ├─ length(H₂,1) → H₂=[_D]
            ├─ append([_D],L1₂,[2,3])
            │  └─ Opción 1: _D=2, L1₂=[3] ← TOMA ESTA
            ├─ append(L2₂,[_D],[_B,_C])  ⚠️ L2₂ NO INSTANCIADA
            │  └─ Opción 1: L2₂=[], [_D]=[_B,_C]
            │     └─ ❌ FALLA (no unifica: [2] ≠ [_B,_C] con 2 elementos)
            │  └─ Opción 2: L2₂=[_E], [_E,_D]=[_B,_C]
            │     └─ _E=_B, _D=_C, entonces _D=2 → _C=2, L2₂=[_B]
            │     └─ reverse([3], [_B])
            │        |
            │        └─ ... continúa probando opciones...
```

**Este proceso NUNCA TERMINA** porque `append(L2₂,[_D],[_B,_C])` con L2₂ no instanciada genera infinitas opciones.

---

### ¿Por qué la Primera Solución Funciona?

Veamos el **camino exitoso completo**:

```
?- reverse([1,2,3], X).
|
└─ length(H₁,1) → H₁=[_A]
   append([_A],L1₁,[1,2,3]) → _A=1, L1₁=[2,3]
   append(L2₁,[1],X)
   |
   └─ En este punto hay choice points, pero el primero que se prueba eventualmente funciona
      |
      └─ Por "coincidencia" (por el orden de búsqueda), Prolog encuentra:
         L2₁=[2,3], X=[2,3,1] ← Eventualmente en alguna opción
         |
         └─ reverse([2,3], [2,3])... NO, esto falla

   ⚠️ ESPERA, déjame recalcular...
```

Necesito analizar el **camino exitoso real**:

---

## Análisis Correcto: Camino de la Primera Solución

```
?- reverse([1,2,3], X).
|
└─ Nivel 1: reverse([1,2,3], X)
   |
   ├─ length(H₁,1) → H₁=[_A]
   ├─ append([_A],L1₁,[1,2,3]) → _A=1, L1₁=[2,3]  (opción 1)
   ├─ append(L2₁,[1],X) → CHOICE POINT (múltiples opciones)
   |  |
   |  └─ Prolog prueba opciones hasta encontrar una que funcione con reverse([2,3], L2₁)
   |
   └─ reverse([2,3], L2₁)
      |
      └─ Nivel 2: reverse([2,3], L2₁)
         |
         ├─ length(H₂,1) → H₂=[_B]
         ├─ append([_B],L1₂,[2,3]) → _B=2, L1₂=[3]  (opción 1)
         ├─ append(L2₂,[2],L2₁) → CHOICE POINT
         |
         └─ reverse([3], L2₂)
            |
            └─ Nivel 3: reverse([3], L2₂)
               |
               ├─ length(H₃,1) → H₃=[_C]
               ├─ append([_C],L1₃,[3]) → _C=3, L1₃=[]  (opción 1)
               ├─ append(L2₃,[3],L2₂) → CHOICE POINT
               |
               └─ reverse([], L2₃)
                  |
                  └─ Nivel 4: reverse([], L2₃)
                     |
                     └─ [Regla 1] reverse([],[])
                        |
                        └─ L2₃ = []  ✓
```

Ahora **propagamos hacia arriba**:

```
Nivel 4: L2₃ = []
         ↓
Nivel 3: append(L2₃,[3],L2₂) con L2₃=[]
         append([],[3],L2₂) → L2₂=[3]  ✓
         ↓
Nivel 2: reverse([3], L2₂) = reverse([3], [3])  ✓
         append(L2₂,[2],L2₁) con L2₂=[3]
         append([3],[2],L2₁) → L2₁=[3,2]  ✓
         ↓
Nivel 1: reverse([2,3], L2₁) = reverse([2,3], [3,2])  ✓
         append(L2₁,[1],X) con L2₁=[3,2]
         append([3,2],[1],X) → X=[3,2,1]  ✓

SOLUCIÓN: X = [3,2,1]  ✓
```

---

## ¿Por qué funciona la primera vez?

**Respuesta:** Por **SUERTE** en el orden de búsqueda.

Cuando Prolog llega a `append(L2₁,[1],X)` con L2₁ no instanciada:
1. Genera infinitas opciones: L2₁=[], L2₁=[_], L2₁=[_,_], ...
2. Para cada opción, prueba `reverse([2,3], L2₁)`
3. **Por suerte**, la recursión eventualmente instancia L2₁ correctamente
4. Cuando todo termina, L2₁=[3,2] es la respuesta correcta
5. Entonces `append([3,2],[1],X)` con L2₁ **ya instanciada** da X=[3,2,1]

**Pero esto solo funciona una vez.**

---

## ¿Por qué BUCLEA después del primer `;`?

Cuando el usuario presiona `;` (buscar más soluciones):

```
Usuario presiona ';'
    ↓
BACKTRACKING al choice point más reciente
    ↓
En Nivel 3: append(L2₃,[3],L2₂)
    |
    └─ Ya probó L2₃=[], ahora prueba L2₃=[_]
       |
       └─ append([_],[3],L2₂) → L2₂=[_,3]
          |
          └─ reverse([], [_])
             |
             └─ ❌ FALLA ([] ≠ [_])
       |
       └─ Backtracking, prueba L2₃=[_,_]
          |
          └─ append([_,_],[3],L2₂) → L2₂=[_,_,3]
             |
             └─ reverse([], [_,_])
                |
                └─ ❌ FALLA
          |
          └─ Backtracking, prueba L2₃=[_,_,_]
             |
             └─ ... ∞ BUCLE INFINITO
```

**El problema:** `append(L2₃,[3],L2₂)` con L2₃ no instanciada genera infinitas opciones, y `reverse([],L2₃)` solo acepta L2₃=[].

---

## Árbol Completo: Primera Solución + Backtracking

```
?- reverse([1,2,3], X).
|
└─ [R2] length(H₁,1), append(H₁,L1₁,[1,2,3]), append(L2₁,[1],X), reverse(L1₁,L2₁)
   |
   ├─ H₁=[_], L1₁=[2,3]
   |
   └─ append(L2₁,[1],X), reverse([2,3],L2₁)
      |
      └─ reverse([2,3],L2₁)
         |
         ├─ H₂=[_], L1₂=[3]
         |
         └─ append(L2₂,[2],L2₁), reverse([3],L2₂)
            |
            └─ reverse([3],L2₂)
               |
               ├─ H₃=[_], L1₃=[]
               |
               └─ append(L2₃,[3],L2₂), reverse([],L2₃)
                  |
                  ├─ reverse([],L2₃) → L2₃=[]  ✓
                  |  |
                  |  └─ append([],[3],L2₂) → L2₂=[3]
                  |     |
                  |     └─ append([3],[2],L2₁) → L2₁=[3,2]
                  |        |
                  |        └─ append([3,2],[1],X) → X=[3,2,1]  ✓
                  |           |
                  |           └─ ✓ PRIMERA SOLUCIÓN: X = [3,2,1]
                  |
                  └─ [Usuario presiona ';']
                     |
                     └─ BACKTRACKING a append(L2₃,[3],L2₂)
                        |
                        ├─ [Opción 2] L2₃=[_G1], L2₂=[_G1,3]
                        │  |
                        │  └─ reverse([],[_G1])
                        │     |
                        │     └─ ✗ FALLA
                        |
                        ├─ [Opción 3] L2₃=[_G1,_G2], L2₂=[_G1,_G2,3]
                        │  |
                        │  └─ reverse([],[_G1,_G2])
                        │     |
                        │     └─ ✗ FALLA
                        |
                        ├─ [Opción 4] L2₃=[_G1,_G2,_G3], L2₂=[_G1,_G2,_G3,3]
                        │  |
                        │  └─ reverse([],[_G1,_G2,_G3])
                        │     |
                        │     └─ ✗ FALLA
                        |
                        └─ ... ∞ BUCLE INFINITO
```

---

## Tabla: Flujo de Ejecución

| Evento | Acción | Estado | Resultado |
|--------|--------|--------|-----------|
| Consulta inicial | `reverse([1,2,3], X)` | X libre | Comienza búsqueda |
| Nivel 1 | `append(L2₁,[1],X)` | L2₁ libre, X libre | ⚠️ Choice point creado |
| Recursión | `reverse([2,3],L2₁)` | Instancia L2₁=[3,2] | ✓ L2₁ instanciada |
| Vuelta | `append([3,2],[1],X)` | L2₁=[3,2] | X=[3,2,1] ✓ |
| Usuario `;` | Backtracking | Busca más soluciones | Retrocede |
| Nivel 3 | `append(L2₃,[3],L2₂)` | L2₃ libre | Genera ∞ opciones |
| Recursión | `reverse([],L2₃)` | L2₃ debe ser [] | Falla para L2₃≠[] |
| Bucle | Backtracking infinito | Prueba L2₃=[_], [_,_], ... | ∞ Nunca termina |

---

## Diagrama de Choice Points

```
                      reverse([1,2,3], X)
                              |
                    ┌─────────┴─────────┐
                    │                   │
                [Regla 1]           [Regla 2]
                 FALLA                  |
                              ┌─────────┴────────┐
                              |                  |
                      append(L2₁,[1],X)    reverse([2,3],L2₁)
                         ⚠️ CHOICE POINT          |
                         |                 ┌─────┴─────┐
                    ┌────┼────┬────┬...    |           |
                    |    |    |    |    append(L2₂,[2],L2₁)  reverse([3],L2₂)
                   []   [_]  [_,_] ∞       ⚠️ CHOICE POINT     |
                   |                       |              ┌────┴────┐
                   └─→ reverse([2,3],[])   |              |         |
                        FALLA         append(L2₃,[3],L2₂)  reverse([],L2₃)
                                       ⚠️ CHOICE POINT       |
                                       |                  [Regla 1]
                                  ┌────┼────┬────┬...     L2₃=[]
                                  |    |    |    |          ✓
                                 []   [_]  [_,_] ∞
                                 |     |    |
                                 ✓    ✗    ✗
                          PRIMERA    BACKTRACKING
                          SOLUCIÓN   (bucle ∞)
```

---

## Comparación con Versión Correcta

### ❌ Versión Problemática (orden malo)

```prolog
reverse(XS, YS) :-
      length(H,1),
      append(H,L1,XS),
      append(L2,H,YS),       % ❌ L2 libre → choice points infinitos
      reverse(L1, L2).       % Instancia L2 tarde
```

**Comportamiento:**
- Primera solución: ✓ Funciona (por suerte)
- Backtracking: ∞ Bucle infinito

### ✓ Versión Correcta (orden bueno)

```prolog
reverse(XS, YS) :-
      length(H,1),
      append(H,L1,XS),
      reverse(L1, L2),       % ✓ Instancia L2 primero
      append(L2,H,YS).       % ✓ L2 ya instanciada → determinístico
```

**Comportamiento:**
- Primera solución: ✓ Funciona
- Backtracking: ✓ Termina correctamente (sin bucles)

**Trace de la versión correcta:**
```prolog
?- reverse([1,2,3], X).
X = [3,2,1] ;    ← Primera solución
false.           ← Termina correctamente (no hay más soluciones)
```

---

## Conclusión

El código **funciona para la primera solución** porque:
1. La recursión eventualmente instancia las variables
2. Por el orden de búsqueda de Prolog, encuentra la solución correcta primero

Pero **buclea en backtracking** porque:
1. `append(L2,H,YS)` con L2 no instanciada crea choice points infinitos
2. Cuando Prolog busca más soluciones, explora esos choice points
3. Cada opción falla, pero hay infinitas opciones que probar
4. **Nunca termina** de explorar todas las opciones

**Solución:** Mover `reverse(L1,L2)` ANTES de `append(L2,H,YS)` para que L2 esté instanciada cuando se use en append.

---

## Regla Fundamental

> **append(L2,H,YS) DEBE tener L2 instanciada.**
>
> Si L2 está libre, append genera infinitas listas y nunca termina de explorarlas en backtracking.

Este es un ejemplo perfecto de cómo el **orden procedimental** de Prolog afecta la terminación, aunque el **significado declarativo** sea correcto.
