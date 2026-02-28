# Pre-Practica de Programacion Funcional

**Paradigmas de Programacion (PLP) -- 2do Cuatrimestre de 2025**

Para resolver esta practica, recomendamos usar el interprete "GHCI", de distribucion gratuita, que puede bajarse de [https://www.haskell.org/ghc/download](https://www.haskell.org/ghc/download).

---

## Ejercicio 1

Dar el tipo y describir el comportamiento de las siguientes funciones del modulo `Prelude` de Haskell:

```
null    head    tail    init    last    take    drop    (++)    concat    reverse    elem
```

---

## Ejercicio 2

Definir las siguientes funciones:

**a.** `valorAbsoluto :: Float → Float`, que dado un numero devuelve su valor absoluto.

**b.** `bisiesto :: Int → Bool`, que dado un numero que representa un ano, indica si el mismo es bisiesto.

**c.** `factorial :: Int → Int`, definida unicamente para enteros positivos, que computa el factorial.

**d.** `cantDivisoresPrimos :: Int → Int`, que dado un entero positivo devuelve la cantidad de divisores primos.

---

## Ejercicio 3

Contamos con los tipos `Maybe` y `Either` definidos como sigue:

```haskell
data Maybe a = Nothing | Just a
data Either a b = Left a | Right b
```

**a.** Definir la funcion `inverso :: Float → Maybe Float` que dado un numero devuelve su inverso multiplicativo si esta definido, o `Nothing` en caso contrario.

**b.** Definir la funcion `aEntero :: Either Int Bool → Int` que convierte a entero una expresion que puede ser booleana o entera. En el caso de los booleanos, el entero que corresponde es 0 para `False` y 1 para `True`.

---

## Ejercicio 4

Definir las siguientes funciones sobre listas:

**a.** `limpiar :: String → String → String`, que elimina todas las apariciones de cualquier caracter de la primera cadena en la segunda. Por ejemplo, `limpiar "susto" "puerta"` evalua a `"pera"`. Nota: `String` es un renombre de `[Char]`. La notacion `"hola"` es equivalente a `['h','o','l','a']` y a `'h':'o':'l':'a':[]`.

**b.** `difPromedio :: [Float] → [Float]` que dada una lista de numeros devuelve la diferencia de cada uno con el promedio general. Por ejemplo, `difPromedio [2, 3, 4]` evalua a `[-1, 0, 1]`.

**c.** `todosIguales :: [Int] → Bool` que indica si una lista de enteros tiene todos sus elementos iguales.

---

## Ejercicio 5

Dado el siguiente modelo para arboles binarios:

```haskell
data AB a = Nil | Bin (AB a) a (AB a)
```

definir las siguientes funciones:

**a.** `vacioAB :: AB a → Bool` que indica si un arbol es vacio (i.e. no tiene nodos).

**b.** `negacionAB :: AB Bool → AB Bool` que dado un arbol de booleanos construye otro formado por la negacion de cada uno de los nodos.

**c.** `productoAB :: AB Int → Int` que calcula el producto de todos los nodos del arbol.
