# Árbol de Búsqueda en Prolog - Ejemplo Garfield

## Código

```prolog
% Base de conocimiento
gato(gardfield).

tieneMascota(john, edie).
tieneMascota(john, gardfield).

amaALosGatos(X) :- tieneMascota(X,Y), gato(Y).
```

## Consulta: `?- amaALosGatos(Z).`

## Árbol de Búsqueda (como lo hace Prolog)

```
?- amaALosGatos(Z).
│
│ [Busca cláusulas que unifiquen con amaALosGatos(Z)]
│ [Encuentra: amaALosGatos(X) :- tieneMascota(X,Y), gato(Y)]
│ [Unifica: Z = X]
│
└─→ Call: tieneMascota(Z,Y), gato(Y)
    │
    ├─→ Call: tieneMascota(Z,Y)
    │   │
    │   │ [Busca cláusulas que unifiquen con tieneMascota(Z,Y)]
    │   │ [Primera cláusula: tieneMascota(john, edie)]
    │   │
    │   └─→ Exit: tieneMascota(john, edie)
    │       │ Unificaciones: Z = john, Y = edie
    │       │
    │       └─→ Call: gato(edie)
    │           │
    │           │ [Busca cláusulas que unifiquen con gato(edie)]
    │           │ [Única cláusula disponible: gato(gardfield)]
    │           │ [NO UNIFICA: edie ≠ gardfield]
    │           │
    │           └─→ Fail: gato(edie)
    │               │
    │               │ ⬅ BACKTRACKING
    │               │ [Deshace: Z = john, Y = edie]
    │               │ [Vuelve a: tieneMascota(Z,Y)]
    │               │
    ├─→ Call: tieneMascota(Z,Y)  [SEGUNDA VEZ]
    │   │
    │   │ [Busca la SIGUIENTE cláusula que unifique]
    │   │ [Segunda cláusula: tieneMascota(john, gardfield)]
    │   │
    │   └─→ Exit: tieneMascota(john, gardfield)
    │       │ Unificaciones: Z = john, Y = gardfield
    │       │
    │       └─→ Call: gato(gardfield)
    │           │
    │           │ [Busca cláusulas que unifiquen con gato(gardfield)]
    │           │ [Encuentra: gato(gardfield)]
    │           │ [UNIFICA: gardfield = gardfield ✓]
    │           │
    │           └─→ Exit: gato(gardfield)
    │               │
    │               └─→ Exit: amaALosGatos(john)
    │
    ✓ SUCCESS: Z = john
```

## Explicación Paso a Paso

### 1. **Call inicial**
```prolog
?- amaALosGatos(Z).
```
Prolog busca reglas o hechos que unifiquen con `amaALosGatos(Z)`.

Encuentra la regla:
```prolog
amaALosGatos(X) :- tieneMascota(X,Y), gato(Y).
```

Unifica: `Z = X` (aún sin instanciar)

### 2. **Resuelve el cuerpo de la regla**
Ahora debe resolver: `tieneMascota(Z,Y), gato(Y)`

### 3. **Primera meta: `tieneMascota(Z,Y)`**
Busca el primer hecho que unifique:
```prolog
tieneMascota(john, edie).  % ✓ Primera opción
```

**Unificaciones:**
- `Z = john`
- `Y = edie`

### 4. **Segunda meta: `gato(Y)` con Y = edie**
Ahora debe resolver: `gato(edie)`

Busca hechos:
```prolog
gato(gardfield).  % ✗ gardfield ≠ edie
```

**¡FALLA!** No existe `gato(edie)`

### 5. **BACKTRACKING**
Prolog deshace las unificaciones:
- Libera: `Z = john`, `Y = edie`
- Vuelve al último punto de elección: `tieneMascota(Z,Y)`
- Busca la **siguiente** cláusula

### 6. **Segunda opción: `tieneMascota(Z,Y)` [intento 2]**
```prolog
tieneMascota(john, gardfield).  % ✓ Segunda opción
```

**Unificaciones:**
- `Z = john`
- `Y = gardfield`

### 7. **Segunda meta (otra vez): `gato(Y)` con Y = gardfield**
Ahora debe resolver: `gato(gardfield)`

Busca hechos:
```prolog
gato(gardfield).  % ✓ gardfield = gardfield
```

**¡ÉXITO!** Existe el hecho `gato(gardfield)`

### 8. **Resultado final**
```prolog
Z = john
```

## Tabla de Estados

| Paso | Meta | Unificaciones | Estado |
|------|------|---------------|--------|
| 1 | `amaALosGatos(Z)` | - | Call |
| 2 | `tieneMascota(Z,Y)` | - | Call |
| 3 | `tieneMascota(john, edie)` | Z=john, Y=edie | Exit |
| 4 | `gato(edie)` | Z=john, Y=edie | Call |
| 5 | - | - | **Fail** |
| 6 | `tieneMascota(Z,Y)` | [deshecho] | **Backtrack** |
| 7 | `tieneMascota(john, gardfield)` | Z=john, Y=gardfield | Exit |
| 8 | `gato(gardfield)` | Z=john, Y=gardfield | Call |
| 9 | `gato(gardfield)` | Z=john, Y=gardfield | Exit |
| 10 | `amaALosGatos(john)` | Z=john | **Success** |

## Conceptos Clave

### Backtracking
Cuando una meta falla, Prolog:
1. Deshace las unificaciones del último paso
2. Busca alternativas en el último punto de elección
3. Continúa desde ahí con la siguiente opción

### Puntos de Elección (Choice Points)
Se crean cuando hay **múltiples cláusulas** que pueden unificar:
- `tieneMascota(Z,Y)` tiene 2 opciones → punto de elección
- `gato(gardfield)` tiene 1 opción → sin punto de elección

### Orden de Evaluación
Prolog evalúa las metas de **izquierda a derecha** y las cláusulas de **arriba hacia abajo**.

## Ejecución con `trace`

Si ejecutas con trace en Prolog:
```prolog
?- trace, amaALosGatos(Z).
   Call: (10) amaALosGatos(_2476)
   Call: (11) tieneMascota(_2476, _2508)
   Exit: (11) tieneMascota(john, edie)
   Call: (12) gato(edie)
   Fail: (12) gato(edie)
   Redo: (11) tieneMascota(_2476, _2508)
   Exit: (11) tieneMascota(john, gardfield)
   Call: (12) gato(gardfield)
   Exit: (12) gato(gardfield)
   Exit: (10) amaALosGatos(john)
Z = john.
```

**Leyenda:**
- `Call`: Intenta resolver una meta
- `Exit`: Resuelve exitosamente una meta
- `Fail`: Falla al resolver una meta
- `Redo`: Backtracking, busca alternativas
