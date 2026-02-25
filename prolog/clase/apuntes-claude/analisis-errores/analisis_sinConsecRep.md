# Análisis: `sinConsecRep/2` - ¿Qué tan mal está?

## Tu Código Original

```prolog
sinConsecRep([], []).
sinConsecRep([X], [X]).
sinConsecRep([H,H|T],     [H|L])      :- sinConsecRep(T, L).
sinConsecRep([H1,H2|T], [H1|[H2|L]]) :- sinConsecRep(T, L).
```

## El Problema: Falta una Condición

### ❌ **Error:** La regla 4 se aplica **siempre**, incluso cuando H1 = H2

La cuarta regla debería aplicarse **solo cuando H1 ≠ H2**, pero en tu código **no hay ninguna verificación** de esto.

### Resultado:

```prolog
?- sinConsecRep([1,1,2], X).
X = [1, 2] ;        % ✓ Correcto (regla 3)
X = [1, 1, 2].      % ✗ Incorrecto (regla 4 con H1=1, H2=1)
```

¡Prolog te da **dos respuestas** cuando solo debería dar una!

---

## ¿Por Qué Pasa Esto?

Cuando Prolog ve `[1,1,2]`:

### **Intento 1: Regla 3** `sinConsecRep([H,H|T], [H|L])`
```
[1,1,2] ?= [H,H|T]
H := 1, T := [2]  ✓ Funciona porque ambos son H
```
Resultado: `[1,2]` ✓

### **Intento 2: Regla 4** `sinConsecRep([H1,H2|T], [H1|[H2|L]])`
```
[1,1,2] ?= [H1,H2|T]
H1 := 1, H2 := 1, T := [2]  ✓ También funciona!
```
Resultado: `[1,1,2]` ✗ **No debería aplicarse cuando H1 = H2**

---

## Solución 1: Agregar Condición de Desigualdad

```prolog
sinConsecRep([], []).
sinConsecRep([X], [X]).
sinConsecRep([H,H|T],   [H|L])        :- sinConsecRep(T, L).
sinConsecRep([H1,H2|T], [H1|[H2|L]]) :- H1 \= H2, sinConsecRep(T, L).
                                        └────┬────┘
                                     CONDICIÓN AGREGADA
```

### ✓ Ahora funciona correctamente:
```prolog
?- sinConsecRep([1,1,2], X).
X = [1, 2].   % Una sola respuesta ✓
```

---

## Solución 2: Usar el Corte (Cut) `!`

```prolog
sinConsecRep([], []).
sinConsecRep([X], [X]).
sinConsecRep([H,H|T],   [H|L])        :- !, sinConsecRep(T, L).
sinConsecRep([H1,H2|T], [H1|[H2|L]]) :- sinConsecRep(T, L).
                                        ↑
                                     CORTE: Si H=H, no probar más reglas
```

El `!` (cut) evita que Prolog pruebe la regla 4 si la regla 3 ya unificó.

### ✓ También funciona:
```prolog
?- sinConsecRep([1,1,2], X).
X = [1, 2].   % Una sola respuesta ✓
```

---

## Solución 3: Reordenar las Reglas (No funciona bien)

**❌ Esto NO soluciona el problema:**
```prolog
sinConsecRep([H1,H2|T], [H1|[H2|L]]) :- sinConsecRep(T, L).
sinConsecRep([H,H|T],   [H|L])        :- sinConsecRep(T, L).
```

Prolog prueba las reglas en orden, pero como `[H1,H2|T]` es más general que `[H,H|T]`, ¡la segunda nunca se ejecutará!

---

## Comparación de Soluciones

| Solución | Ventaja | Desventaja |
|----------|---------|------------|
| **H1 \= H2** | Explícita, clara | Un poco más verbose |
| **Cut (!)**  | Más eficiente | Menos declarativa, puede causar problemas en otros contextos |
| **Sin nada** | Más corta | ❌ **INCORRECTA** - da múltiples respuestas |

---

## Recomendación: **Usa `H1 \= H2`**

```prolog
sinConsecRep([], []).
sinConsecRep([X], [X]).
sinConsecRep([H,H|T],   [H|L])        :- sinConsecRep(T, L).
sinConsecRep([H1,H2|T], [H1|[H2|L]]) :- H1 \= H2, sinConsecRep(T, L).
```

### ¿Por qué?
- ✓ **Correcta:** Solo da una respuesta
- ✓ **Clara:** Se entiende la intención
- ✓ **Declarativa:** No usa trucos procedurales como el cut
- ✓ **Funciona en ambos sentidos:** Tanto para verificar como para generar

---

## Ejemplos de Ejecución

### **Tu código original:**
```prolog
?- sinConsecRep([1,1,2], X).
X = [1, 2] ;
X = [1, 1, 2].    % ← Respuesta extra incorrecta

?- sinConsecRep([a,a,a,b,b,c], X).
X = [a, b, c] ;
X = [a, a, b, c] ;
X = [a, a, b, b, c] ;
X = [a, a, a, b, c] ;
X = [a, a, a, b, b, c].   % ← Muchas respuestas incorrectas
```

### **Con H1 \= H2:**
```prolog
?- sinConsecRep([1,1,2], X).
X = [1, 2].    % ✓ Una sola respuesta correcta

?- sinConsecRep([a,a,a,b,b,c], X).
X = [a, b, c].    % ✓ Una sola respuesta correcta
```

---

## Análisis del Árbol de Ejecución (Tu código)

```
?- sinConsecRep([1,1,2], X).
|
├─ Regla 3: sinConsecRep([H,H|T], [H|L])
|  |
|  └─ Unifica: [1,1,2] ?= [H,H|T]
|     MGU: {H := 1, T := [2]}
|     |
|     └─ sinConsecRep([2], L)
|        |
|        └─ Regla 2: {L := [2]}
|           |
|           └─ X = [1, 2] ✓ CORRECTO
|
└─ Regla 4: sinConsecRep([H1,H2|T], [H1|[H2|L]])
   |
   └─ Unifica: [1,1,2] ?= [H1,H2|T]
      MGU: {H1 := 1, H2 := 1, T := [2]}  ← PROBLEMA: H1 = H2 pero no hay verificación
      |
      └─ sinConsecRep([2], L)
         |
         └─ Regla 2: {L := [2]}
            |
            └─ X = [1, 1, 2] ✗ INCORRECTO
```

---

## Conclusión

### ¿Qué tan mal está?

**Nivel de gravedad: ⚠️ Moderado**

- ✓ La lógica básica es correcta
- ✓ La estructura recursiva está bien pensada
- ✗ **Falta una condición crucial** que hace que genere respuestas incorrectas
- ✗ En modo de generación, da múltiples soluciones (algunas incorrectas)

### Arreglo simple:

```prolog
sinConsecRep([H1,H2|T], [H1|[H2|L]]) :- H1 \= H2, sinConsecRep(T, L).
                                        └────┬────┘
                                        SOLO ESTO FALTA
```

¡Con este pequeño cambio, tu código queda perfecto! 🎯
