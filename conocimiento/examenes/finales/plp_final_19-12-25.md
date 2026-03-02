# Final PLP — 19/12/2025

- **Fecha:** 19 de diciembre de 2025 (primera fecha febrero 2026)

> Fuente: reconstrucción por estudiantes (chat).

---

## Ejercicio 1 (Programación funcional)

```haskell
data Dicc k v = Def k v (Dicc k v) | Vacío
```

Puede estar definida varias veces la misma clave. Las definiciones que no son la última forman la "historia" de k.

**a)** Dar `foldDicc`.

foldDicc :: (k -> v -> b -> b) -> b -> Dicc k v -> b
foldDicc cDef cVacio dicc = case dicc of 
    (Def k v dic) 	-> cDef k v (rec dic)
    (Vacio)			-> cVacio
  where rec = foldDicc cDef cVacio



**b)** Implementar `definicion :: Eq k => Dicc k v -> k -> Maybe v` — devuelve la definición más nueva de k, o `Nothing` si no existe.

definicion :: Eq k => Dicc k v -> k -> Maybe v
definicion dicc k2	= foldDicc cDef Nothing 
								where cDef = (\k1 v recdicc -> 	if 	k1 == k2 then Just v 
																	else recdicc	)
Def 1 a (Def 1 b (Def 2 b (Def 1 c (Vacio)))

Def 1 a (Def 2 b (Vacio))


**c)** Implementar `sinHistoria :: Eq k => Dicc k v -> k -> Dicc k v` — elimina las definiciones anteriores de k, dejando solo la más nueva.

sinHistoria :: Eq k => Dicc k v -> k -> Dicc k v
sinHistoria dicc k2  = foldDicc cDef Vacio 
								where cDef = (\k1 v recdicc ->  if (k1 == k2 
																&& (Just v) == (definicion dicc k2)) || (k1 == k2)
																then Def k1 v recdicc
																else recdicc) 


**d)** Implementar `mapDicc` que aplica una función a todos los valores del diccionario.

**e)** Implementar un map modificado que solo aplica la función a la última definición de cada clave.



---

## Ejercicio 2 (Cálculo lambda tipado)

Se define un nuevo operador `M₁ @ M₂`, que significa que `M₁ →→ V` y `M₂ →→ V` (ambos reducen al mismo valor).

Justificar en todas:

**a)** ¿Existe M₁, M₂ tal que M₁ y M₂ tienen tipos distintos y vale M₁ @ M₂?

**b)** ¿Existe M₁, M₂ tal que M₁ M₂ tipa, M₂ M₁ tipa, y vale M₁ @ M₂?

**c)** (parcialmente recordado) — ¿Existe un término M cerrado que no cumpla M @ M?

> Respuesta de un estudiante al (c): no, porque toda expresión se reduce a una sola cosa (determinismo de la reducción).

> Faltan otros incisos del ejercicio 2.

---

## Ejercicio 3 (Programación lógica)

Se da un predicado como hecho: `estaconectado(A, B)` — la ciudad A tiene un camino directo a B (bidireccional).

**a)** Implementar `camino_simple(?Inicio, ?Fin, -Camino)` — Camino es la lista de ciudades para ir de Inicio a Fin sin repetir.

**b)** Implementar `camino_mas_corto(?Inicio, ?Fin, -Camino)`. ¿Es reversible? Si no, explicar cómo hacerlo reversible.

**c)** Implementar `accesible(Ciudad1, Ciudad2)`.

**d)** Rehacer `camino_simple` asumiendo que `conectado(A, B)` ahora es unidireccional (A conectado a B no implica B conectado a A).
