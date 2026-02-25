# ¿Por qué X := I en la Unificación?

## Contexto del Ejemplo

En la imagen proporcionada, vemos un árbol de ejecución de Prolog con el siguiente código:

```prolog
zombie(juan).
zombie(valeria).

tomo_mate_despues(juan,carlos).
tomo_mate_despues(clara,juan).

infectade(ernesto).
infectade(X) :- zombie(X).
infectade(X) :- zombie(Y), tomo_mate_despues(Y,X).
```

Y la consulta: `?- infectade(I).`

## Análisis del Árbol de Resolución

En el árbol de ejecución podemos ver:

```
?- infectade(I).
   |__ ✓ ...................................................{I := ernesto}
   |__ ?- zombie(I). .............................................{X := I}
       |__ ✓ ......................................................{I := juan}
       |__ ✓ ......................................................{I := valeria}
```

## ¿Por qué X := I?

La unificación `X := I` ocurre porque:

### 1. **Regla de Resol ución con Variables**

Cuando Prolog intenta resolver `?- infectade(I)`, busca en las cláusulas definidas:

```prolog
infectade(X) :- zombie(X).
```

### 2. **Unificación de Términos**

Según la teoría de resolución de primer orden (páginas 30-32 del PDF):

- La **regla de resolución** requiere unificar las fórmulas atómicas
- Se calcula el **MGU (Most General Unifier)** entre los términos

En este caso:
- Consulta: `infectade(I)`
- Cabeza de la regla: `infectade(X)`

### 3. **Cálculo del MGU**

Para unificar `infectade(I)` con `infectade(X)`:

```
mgu(infectade(I) ?= infectade(X))
```

El MGU más general es: **`{X := I}`**

Esto significa: "La variable `X` se unifica con la variable `I`"

### 4. **Sustitución en el Cuerpo de la Regla**

Una vez obtenida la unificación `{X := I}`, se aplica al cuerpo de la regla:

```prolog
infectade(X) :- zombie(X).
```

Con la sustitución `{X := I}`:

```prolog
infectade(I) :- zombie(I).
```

Por eso el siguiente objetivo es: `?- zombie(I)` con la anotación `{X := I}`

## Principio Teórico (del PDF)

Según la **página 32** del PDF, la regla de resolución de primer orden es:

```
{σ₁, ..., σₚ, ℓ₁, ..., ℓₙ}    {¬τ₁, ..., ¬τq, ℓ'₁, ..., ℓ'ₘ}
────────────────────────────────────────────────────────────
  S = mgu({σ₁ ?= σ₂ ?= ... ?= σₚ ?= τ₁ ?= τ₂ ?= ... ?= τq})

           S({ℓ₁, ..., ℓₙ, ℓ'₁, ..., ℓ'ₘ})
```

En nuestro caso:
- **Objetivo:** `infectade(I)` (lo que queremos probar)
- **Regla:** `infectade(X) :- zombie(X)` (lo que tenemos)
- **MGU:** `{X := I}` (unificación más general)
- **Nuevo objetivo:** `zombie(I)` (después de aplicar la sustitución)

## Resumen

`X := I` indica que:

1. La variable `X` de la regla se **unifica** con la variable `I` de la consulta
2. Ambas variables ahora representan el **mismo valor**
3. Cuando `I` tome un valor concreto (como `ernesto`, `juan`, o `valeria`), `X` también lo tendrá
4. Esta es la forma en que Prolog **propaga las unificaciones** a través de las reglas

## Concepto Clave: Unificación

La **unificación** es el mecanismo fundamental de Prolog que:
- Encuentra sustituciones de variables
- Hace que dos términos sean iguales
- Permite que las variables compartan valores

En este caso, `X := I` establece que ambas variables se refieren al mismo objeto lógico durante la resolución.
