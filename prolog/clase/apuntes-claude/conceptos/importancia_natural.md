# Importancia de agregar `natural(X)` en predicados generadores

## Problema

Cuando definimos predicados que deben generar infinitas soluciones, necesitamos asegurarnos de que realmente **generen** los valores en lugar de solo **verificarlos**.

## Ejemplo: Predicado `menor/2`

### ❌ Versión INCORRECTA (solo verifica)

```prolog
menor(cero, suc(X)).
menor(suc(X), suc(Y)) :- menor(X, Y).
```

**Consulta:**
```prolog
?- menor(cero, X).
X = suc(_).
```

**Problema:** Solo retorna `suc(_)` con una variable no instanciada. No genera los números naturales.

### ✅ Versión CORRECTA (genera)

```prolog
menor(cero, suc(X)) :- natural(X).
menor(suc(X), suc(Y)) :- menor(X, Y).
```

**Consulta:**
```prolog
?- menor(cero, X).
X = suc(cero) ;
X = suc(suc(cero)) ;
X = suc(suc(suc(cero))) ;
X = suc(suc(suc(suc(cero)))) ;
X = suc(suc(suc(suc(suc(cero))))) ;
...
```

**Solución:** Genera infinitos números naturales porque `natural(X)` es un predicado generador.

## ¿Por qué funciona?

### Predicado `natural/1` generador:

```prolog
natural(cero).
natural(suc(X)) :- natural(X).
```

Este predicado **genera** infinitas soluciones:
```prolog
?- natural(X).
X = cero ;
X = suc(cero) ;
X = suc(suc(cero)) ;
X = suc(suc(suc(cero))) ;
...
```

### Comparación:

| Versión | Comportamiento | Tipo |
|---------|----------------|------|
| `menor(cero, suc(X)).` | Solo unifica `X` con cualquier cosa | **Verificador** |
| `menor(cero, suc(X)) :- natural(X).` | Genera todos los naturales | **Generador** |

## Regla general

Cuando quieras que un predicado **genere** valores en lugar de solo verificarlos:

1. **No uses solo hechos** con variables libres
2. **Agrega condiciones** que fuercen la generación (como `natural(X)`)
3. **Asegúrate** de que las subcondiciones también sean generadoras

## Otro ejemplo

### ❌ Incorrecto:
```prolog
par(suc(suc(X))).
```

Consulta:
```prolog
?- par(X).
X = suc(suc(_)).  % Solo una solución con variable libre
```

### ✅ Correcto:
```prolog
par(cero).
par(suc(suc(X))) :- par(X).
```

Consulta:
```prolog
?- par(X).
X = cero ;
X = suc(suc(cero)) ;
X = suc(suc(suc(suc(cero)))) ;
...
```

## Conclusión

**Siempre que necesites generar infinitas soluciones, asegúrate de que tu predicado base llame a otro predicado generador en lugar de simplemente unificar con una variable libre.**
