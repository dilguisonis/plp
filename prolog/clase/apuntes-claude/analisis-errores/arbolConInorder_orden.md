# Árbol de Resolución: Error en `arbolConInorder` - Recursión antes de Instanciación

## Código Problemático

```prolog
arbolConInorder([], nil).
arbolConInorder(Lista, bin(I, R, D)) :-
    arbolConInorder(LI, I),        % ❌ LI no instanciada
    inorder(I, LI),
    arbolConInorder(LD, D),        % ❌ LD no instanciada
    inorder(D, LD),
    append(LI, [R|LD], Lista).     % ← Debería ir PRIMERO
```

## Consulta: `?- arbolConInorder([4, 2, 1, 3], A).`

---

## Árbol de Resolución SLD

```
?- arbolConInorder([4, 2, 1, 3], A).
|
├─ [Regla 1] arbolConInorder([], nil)
│  |
│  └─ [4,2,1,3] ?= []  ✗ FALLA
|
└─ [Regla 2] arbolConInorder(Lista, bin(I, R, D)) :-
             arbolConInorder(LI, I), inorder(I, LI),
             arbolConInorder(LD, D), inorder(D, LD),
             append(LI, [R|LD], Lista)
   |
   └─ Lista := [4,2,1,3], A := bin(I₁, R₁, D₁)
      |
      └─ Nuevas metas:
         ?- arbolConInorder(LI₁, I₁),    % ⚠️ LI₁ LIBRE
            inorder(I₁, LI₁),
            arbolConInorder(LD₁, D₁),
            inorder(D₁, LD₁),
            append(LI₁, [R₁|LD₁], [4,2,1,3]).
         |
         └─ [Meta 1] ?- arbolConInorder(LI₁, I₁)
            |
            └─ ⚠️ LI₁ ES VARIABLE LIBRE
               |
               ├─ [Intenta Regla 1] arbolConInorder([], nil)
               │  |
               │  └─ LI₁ ?= [], I₁ ?= nil
               │     |
               │     └─ {LI₁ := [], I₁ := nil}  ✓
               │        |
               │        └─ Primera opción: LI₁=[], I₁=nil
               |
               ├─ [Intenta Regla 2] arbolConInorder(LI₁, bin(I₂, R₂, D₂))
               │  |
               │  └─ I₁ := bin(I₂, R₂, D₂)
               │     |
               │     └─ ?- arbolConInorder(LI₂, I₂), ...
               │        |
               │        └─ ⚠️ LI₂ también es LIBRE → RECURSIÓN INFINITA
               │           |
               │           └─ ... puede generar árboles infinitamente profundos
               |
               └─ ... ∞ INFINITAS OPCIONES
```

---

## El Problema: Recursión sin Restricción

Cuando llamás `arbolConInorder(LI, I)` con LI **libre**, Prolog puede:

1. **LI = []** → I = nil ✓
2. **LI = variable libre** → I = bin(...) y hace otra recursión
3. Cada recursión genera más opciones infinitas

```
arbolConInorder(LI₁, I₁) con LI₁ libre:
  ├─ LI₁=[], I₁=nil                    ← Opción 1
  ├─ LI₁=?, I₁=bin(I₂,R₂,D₂)          ← Opción 2
  │  └─ arbolConInorder(LI₂, I₂)
  │     ├─ LI₂=[], I₂=nil             ← Opción 2.1
  │     ├─ LI₂=?, I₂=bin(I₃,R₃,D₃)   ← Opción 2.2
  │     │  └─ ... ∞
  │     └─ ...
  └─ ...
```

**El árbol genera infinitas estructuras** porque no hay restricción sobre qué tan grande puede ser LI.

---

## Trace de Primera Solución

La primera solución **sí funciona** porque toma la opción más simple:

```prolog
?- arbolConInorder([4, 2, 1, 3], A).

[1] arbolConInorder(LI₁, I₁)
    LI₁=[], I₁=nil                    ← Toma opción 1

[2] inorder(nil, [])
    ✓

[3] arbolConInorder(LD₁, D₁)
    LD₁=[], D₁=nil                    ← Toma opción 1

[4] inorder(nil, [])
    ✓

[5] append([], [R₁|[]], [4,2,1,3])
    [R₁] ?= [4,2,1,3]  ✗ FALLA

[6] BACKTRACKING a paso 3
    LD₁=?, D₁=bin(...)                ← Toma opción 2
    ...

Eventualmente encuentra:
A = bin(nil, 4, bin(nil, 2, bin(nil, 1, bin(nil, 3, nil))))
```

---

## ¿Por qué se traba en backtracking?

Después de encontrar la primera solución, al presionar `;`:

```
BACKTRACKING
    ↓
Vuelve a arbolConInorder(LI₁, I₁)
    ↓
Intenta LI₁=?, I₁=bin(I₂,R₂,D₂)
    ↓
arbolConInorder(LI₂, I₂) con LI₂ libre
    ↓
Intenta LI₂=?, I₂=bin(I₃,R₃,D₃)
    ↓
... RECURSIÓN INFINITA
```

El problema es que **no hay límite** sobre qué tan profundo puede ser el árbol que construye, porque LI nunca tiene una longitud fija.

---

## Solución Correcta

```prolog
arbolConInorder([], nil).
arbolConInorder(Lista, bin(I, R, D)) :-
    append(LI, [R|LD], Lista),    % ✓ PRIMERO: divide Lista
    arbolConInorder(LI, I),       % ✓ DESPUÉS: LI ya instanciada
    arbolConInorder(LD, D).       % ✓ DESPUÉS: LD ya instanciada
```

**Por qué funciona:**

1. `append(LI, [R|LD], Lista)` divide Lista en partes de tamaño **finito**
2. LI y LD son **sublistas de Lista**, por lo tanto más chicas
3. Las recursiones terminan porque las listas se achican

---

## Árbol de Resolución (Versión Correcta)

```
?- arbolConInorder([4, 2, 1, 3], A).
|
└─ [Regla 2]
   |
   └─ append(LI, [R|LD], [4,2,1,3])   % ← PRIMERO divide
      |
      ├─ Opción 1: LI=[], R=4, LD=[2,1,3]
      │  |
      │  ├─ arbolConInorder([], I₁) → I₁=nil
      │  ├─ arbolConInorder([2,1,3], D₁)
      │  │  |
      │  │  └─ append(LI₂, [R₂|LD₂], [2,1,3])
      │  │     ├─ Opción: LI₂=[], R₂=2, LD₂=[1,3]
      │  │     │  ... continúa
      │  │     └─ ...
      │  └─ A = bin(nil, 4, D₁)
      |
      ├─ Opción 2: LI=[4], R=2, LD=[1,3]
      │  ... (otra solución)
      |
      └─ ... (más opciones, pero FINITAS)
```

**Cada opción de append es finita** (hay exactamente N opciones donde N es la longitud de Lista).

---

## Comparación

| Versión | ¿LI instanciada antes de recursión? | Resultado |
|---------|-------------------------------------|-----------|
| ❌ MALA | NO - LI es libre | Recursión infinita |
| ✓ BUENA | SÍ - append la instancia | Termina correctamente |

---

## Patrón del Error

```prolog
% ❌ MALO: Recursión antes de división
predicado(Input, Resultado) :-
    predicado(ParteA, SubResultadoA),  % ParteA libre → infinitas opciones
    predicado(ParteB, SubResultadoB),  % ParteB libre → más infinitas opciones
    dividir(ParteA, ParteB, Input).    % Demasiado tarde

% ✓ BUENO: División antes de recursión
predicado(Input, Resultado) :-
    dividir(ParteA, ParteB, Input),    % Input instanciado → partes finitas
    predicado(ParteA, SubResultadoA),  % ParteA instanciada
    predicado(ParteB, SubResultadoB).  % ParteB instanciada
```

---

## Moraleja

> **Cuando construyas una estructura desde una entrada (lista, etc.), primero DIVIDÍ la entrada, después RECURSÁ sobre las partes.**
>
> No hagas recursión con variables libres esperando que "alguien las instancie después".

El append es tu amigo para dividir, pero debe ir **ANTES** de las llamadas recursivas, no después. 🎯
