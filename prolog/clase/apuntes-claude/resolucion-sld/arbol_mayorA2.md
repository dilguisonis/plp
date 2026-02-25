# Árbol de Resolución: `?- mayorA2(X)`

## Programa Prolog

```prolog
mayorA2(suc(suc(suc(cero)))).        % Regla 1 (caso base)
mayorA2(suc(X)) :- mayorA2(X).       % Regla 2 (caso recursivo)
```

## Árbol de Ejecución hasta el Tercer Caso

```
?- mayorA2(X).
|
├─ Intenta unificar con Regla 1: mayorA2(suc(suc(suc(cero))))
|  |
|  └─ mgu(mayorA2(X) ?= mayorA2(suc(suc(suc(cero)))))
|     |
|     └─ X := suc(suc(suc(cero)))  ✓ ÉXITO
|        |
|        └─ Primera solución: X = suc(suc(suc(cero)))  [3]
|
├─ Intenta unificar con Regla 2: mayorA2(suc(X)) :- mayorA2(X)
   |
   └─ mgu(mayorA2(X) ?= mayorA2(suc(X₁)))
      |
      └─ X := suc(X₁)  {renombramos X de la regla a X₁}
         |
         └─ Nuevo objetivo: ?- mayorA2(X₁)
            |
            ├─ Intenta unificar con Regla 1: mayorA2(suc(suc(suc(cero))))
            |  |
            |  └─ mgu(mayorA2(X₁) ?= mayorA2(suc(suc(suc(cero)))))
            |     |
            |     └─ X₁ := suc(suc(suc(cero)))  ✓ ÉXITO
            |        |
            |        └─ Aplicando X := suc(X₁):
            |           X = suc(suc(suc(suc(cero))))  [4]
            |           |
            |           └─ Segunda solución: X = suc(suc(suc(suc(cero))))
            |
            └─ Intenta unificar con Regla 2: mayorA2(suc(X)) :- mayorA2(X)
               |
               └─ mgu(mayorA2(X₁) ?= mayorA2(suc(X₂)))
                  |
                  └─ X₁ := suc(X₂)  {renombramos X de la regla a X₂}
                     |
                     └─ Nuevo objetivo: ?- mayorA2(X₂)
                        |
                        ├─ Intenta unificar con Regla 1: mayorA2(suc(suc(suc(cero))))
                        |  |
                        |  └─ mgu(mayorA2(X₂) ?= mayorA2(suc(suc(suc(cero)))))
                        |     |
                        |     └─ X₂ := suc(suc(suc(cero)))  ✓ ÉXITO
                        |        |
                        |        └─ Aplicando sustituciones:
                        |           X₁ = suc(X₂) = suc(suc(suc(suc(cero))))
                        |           X = suc(X₁) = suc(suc(suc(suc(suc(cero)))))  [5]
                        |           |
                        |           └─ Tercera solución: X = suc(suc(suc(suc(suc(cero)))))
                        |
                        └─ ... (continúa infinitamente)
```

## Análisis Detallado de Cada Solución

### **Primera Solución: X = suc(suc(suc(cero))) [3]**

**Unificación:**
```
mayorA2(X) ?= mayorA2(suc(suc(suc(cero))))
```

**MGU:**
```
{X := suc(suc(suc(cero)))}
```

**Resultado:** ✓ Éxito inmediato (caso base)

---

### **Segunda Solución: X = suc(suc(suc(suc(cero)))) [4]**

**Primera unificación:**
```
mayorA2(X) ?= mayorA2(suc(X₁))
MGU: {X := suc(X₁)}
```

**Nuevo objetivo:**
```
?- mayorA2(X₁)
```

**Segunda unificación:**
```
mayorA2(X₁) ?= mayorA2(suc(suc(suc(cero))))
MGU: {X₁ := suc(suc(suc(cero)))}
```

**Sustitución final:**
```
X = suc(X₁) = suc(suc(suc(suc(cero))))
```

**Resultado:** ✓ Éxito (un paso recursivo)

---

### **Tercera Solución: X = suc(suc(suc(suc(suc(cero))))) [5]**

**Primera unificación:**
```
mayorA2(X) ?= mayorA2(suc(X₁))
MGU: {X := suc(X₁)}
```

**Nuevo objetivo:**
```
?- mayorA2(X₁)
```

**Segunda unificación:**
```
mayorA2(X₁) ?= mayorA2(suc(X₂))
MGU: {X₁ := suc(X₂)}
```

**Nuevo objetivo:**
```
?- mayorA2(X₂)
```

**Tercera unificación:**
```
mayorA2(X₂) ?= mayorA2(suc(suc(suc(cero))))
MGU: {X₂ := suc(suc(suc(cero)))}
```

**Sustituciones encadenadas:**
```
X₂ = suc(suc(suc(cero)))                    [3]
X₁ = suc(X₂) = suc(suc(suc(suc(cero))))     [4]
X = suc(X₁) = suc(suc(suc(suc(suc(cero))))) [5]
```

**Resultado:** ✓ Éxito (dos pasos recursivos)

---

## Visualización Compacta

```
?- mayorA2(X).
|
├─ [Regla 1] → X = suc(suc(suc(cero)))                    ✓ [3]
|
└─ [Regla 2] X := suc(X₁) → ?- mayorA2(X₁)
   |
   ├─ [Regla 1] → X₁ = suc(suc(suc(cero)))
   |              X = suc(suc(suc(suc(cero))))            ✓ [4]
   |
   └─ [Regla 2] X₁ := suc(X₂) → ?- mayorA2(X₂)
      |
      ├─ [Regla 1] → X₂ = suc(suc(suc(cero)))
      |              X₁ = suc(suc(suc(suc(cero))))
      |              X = suc(suc(suc(suc(suc(cero)))))    ✓ [5]
      |
      └─ [Regla 2] → ... (continúa infinitamente)
```

## Patrón General

Cada solución adicional aplica la **Regla 2** una vez más antes de llegar al **caso base (Regla 1)**:

| Solución | Aplicaciones de Regla 2 | Valor de X | Número |
|----------|-------------------------|------------|--------|
| 1ª       | 0                       | `suc(suc(suc(cero)))`                    | 3 |
| 2ª       | 1                       | `suc(suc(suc(suc(cero))))`               | 4 |
| 3ª       | 2                       | `suc(suc(suc(suc(suc(cero)))))`          | 5 |
| ...      | n                       | `suc^(n+3)(cero)`                        | n+3 |

## Conclusión

El predicado `mayorA2(X)` genera **infinitas soluciones** mediante backtracking:
- Cada vez que el usuario presiona `;` (buscar más soluciones)
- Prolog aplica la regla recursiva una vez más
- Construye números cada vez más grandes (3, 4, 5, 6, ...)
- Este proceso continúa indefinidamente porque siempre puede aplicar la regla recursiva

Esto es un ejemplo de **generación infinita mediante recursión** en Prolog.
