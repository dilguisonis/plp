# Final PLP — 28/02/2026

- **Fecha:** 28 de febrero de 2026

> Fuente: reconstrucción por estudiantes.

---

## Ejercicio 1 (Programación funcional) — 5 puntos

```haskell
data AbbCompr a = Nil | Compr [a] | Nodo a (AbbCompr a) (AbbCompr a)
```

ABB con ramas comprimidas en listas ordenadas.

**1.1)** `foldAbbCompr`

```haskell
foldAbbCompr :: b -> ([a] -> b) -> (a -> b -> b -> b) -> AbbCompr a -> b
foldAbbCompr cNil cCompr cNodo t = case t of
    Nil        -> cNil
    Compr xs   -> cCompr xs
    Nodo r i d -> cNodo r (rec i) (rec d)
  where rec = foldAbbCompr cNil cCompr cNodo
```

**1.2)** `mapAbbCompr`

```haskell
mapAbbCompr :: (a -> b) -> AbbCompr a -> AbbCompr b
mapAbbCompr f = foldAbbCompr Nil (map f) (\r rec1 rec2 -> Nodo (f r) rec1 rec2)
```

**1.3)** `recAbbCompr`

```haskell
recAbbCompr :: b -> ([a] -> b) -> (a -> AbbCompr a -> b -> AbbCompr a -> b -> b) -> AbbCompr a -> b
recAbbCompr cNil cCompr cNodo t = case t of
    Nil        -> cNil
    Compr xs   -> cCompr xs
    Nodo r i d -> cNodo r i (rec i) d (rec d)
  where rec = recAbbCompr cNil cCompr cNodo
```

**1.4)** `ordenado`

```haskell
aplanarArbol :: AbbCompr a -> [a]
aplanarArbol = foldAbbCompr [] id (\r ri rd -> ri ++ [r] ++ rd)

ordenado :: Ord a => AbbCompr a -> Bool
ordenado t = aplanarArbol t == sort (aplanarArbol t)
```

**1.5)** `iguales`

```haskell
iguales :: Ord a => AbbCompr a -> AbbCompr a -> Bool
iguales t1 t2 = sort (aplanarArbol t1) == sort (aplanarArbol t2)
```

> Nota: `Compr [0,1,2]` es igual a `Nodo 1 (Nodo 0 Nil Nil) (Nodo 2 Nil Nil)` porque representan los mismos elementos.

---

## Ejercicio 2 (Cálculo lambda tipado) — 3 puntos

Se extiende con `ganador[M₁, ..., Mₙ]` (n >= 1). Reduce de a un paso de izquierda a derecha. El resultado es el primer término que llega a valor.

- **(a)** Extender términos, valores, reglas de tipado y semántica operacional.
- **(b)** ¿Qué pasaría si agregamos `perdedor[M₁, ..., Mₙ]`? (resultado = último en llegar a valor).

---

## Ejercicio 3 (Programación lógica) — 3 puntos

Listas de enteros comprimidas. `[2,1,1,1,1,5]` → `[2, (1,4), 5]` o `[2, (1,3), 1, 5]`.

> No se recuerdan los predicados exactos.
