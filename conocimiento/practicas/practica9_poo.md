# Practica N° 9 - Programacion Orientada a Objetos (v1.1)

**Paradigmas de Programacion (PLP) - 2do Cuatrimestre de 2025**

Para resolver esta practica, recomendamos usar el entorno *Pharo*, que puede bajarse del sitio web indicado en la seccion *Enlaces* de la pagina de la materia.

Los ejercicios marcados con el simbolo ★ constituyen un subconjunto minimo de ejercitacion. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

---

## Introduccion

A continuacion se incluyen algunos ejercicios que buscan comprender algunas diferencias de Smalltalk con otros de los lenguajes de los paradigmas anteriores.

### Ejercicio 1

Dado el siguiente codigo de Smalltalk, se pide responder:

```smalltalk
var1 := 'un texto' copy.
var2 := 'un texto' copy.
var3 := var1.

var1 = var2
var1 == var2
var1 == var3
```

i. ¿Cual es resultado de la ejecucion de las ultimas tres lineas? ¿Por que es asi?

ii. ¿Que ocurriria si se escribe y ejecuta un codigo similar en Haskell o Prolog? ¿En que se diferencian los tres lenguajes? Listar los operadores similares que hay en ellos.

iii. Listar los operadores de comparacion por igualdad de cada uno de los tres lenguajes, e identificar similitudes y diferencias entre ellos.

### Ejercicio 2

Dado el siguiente codigo para un modelo de una jerarquia de figuras geometricas, donde ambas clases tienen definido el mensaje `dibujar`:

```smalltalk
(Circulo new radio: 5) dibujar.
(Rectangulo new base: 4 altura: 3) dibujar.
```

i. ¿Como podria modelarse esto mismo en Haskell? Pensarlo en detalle.

ii. Que cambios habria que hacer en el codigo de Smalltalk y en el Haskell si se agregara un nuevo tipo de figura (e.g., Triangulo)?

iii. ¿Como podria resolverse esto mismo usando Prolog? ¿Que diferencias habria con lo anterior?

### Ejercicio 3

Dado el siguiente codigo, en el contexto de un modelo de datos personales, se pide:

```smalltalk
persona1 := Persona new nombre: 'Pedro'; edad: 35.
persona2 := Persona new nombre: 'Raffaella'; edad: 38.
persona1 nombre
persona2 edad
```

i. Si modelaramos algo similar en Prolog, usariamos un conjunto de hechos para denotar los datos de las dos personas. ¿Que ventajas y desventajas tendrian ambas implementaciones?

ii. ¿Como podria modelarse algo similar en Haskell? ¿Cual seria el codigo para definir los tipos y funciones necesarias?

### Ejercicio 4

Anteriormente trabajamos con Haskell y Prolog, y ahora con Smalltalk.

i. ¿Te parece que los tres lenguajes son igualmente 'potentes'?

ii. ¿En estos lenguajes se pueden modelar los mismos tipos de problemas?

iii. ¿Hay ventajas o desventajas en usar un lenguaje u otro de acuerdo a diferentes situaciones/problemas? ¿Cuales serian?

---

## Objetos y mensajes

### Ejercicio 5 ★

En las siguientes expresiones, identificar mensajes, el objeto receptor y los colaboradores para cada caso.

a) `10 numberOfDigitsInBase: 2.`

b) `10 factorial.`

c) `20 + 3 * 5.`

d) `20 + (3 * 5).`

e) `December first, 1985.`

f) `1 = 2 ifTrue: [ 'what!?' ].`

g) `1@1 insideTriangle: 0@0 with: 2@0 with: 0@2.`

h) `'Hello World' indexOf: $o startingAt: 6.`

i) `(OrderedCollection with: 1) add: 25; add: 35; yourself.`

j)
```smalltalk
Object subclass: #SnakesAndLadders
    instanceVariableNames: 'players squares turn die over'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'SnakesAndLadders'.
```

### Ejercicio 6

Para cada una de las expresiones del punto anterior, indicar cual es el resultado de su evaluacion. Para este punto se recomienda utilizar el Workspace de *Pharo* para corroborar las respuestas.

### Ejercicio 7

Dar ejemplos de expresiones validas en el lenguaje *Smalltalk* que contengan los siguientes conceptos entre sus sub-expresiones. En cada caso indicar por que se adapta a la categoria y describir que devuelve su evaluacion.

a) Objeto

b) Mensaje unario

c) Mensaje binario

d) Mensaje keyword

e) Colaborador

f) Variable local

g) Asignacion

h) Simbolo

i) Caracter

j) Array

---

## Bloques, metodos y colecciones

### Ejercicio 8 ★

Para cada una de las siguientes expresiones, indicar que valor devuelve o explicar por que se produce un error al ejecutarlas. Recomendamos pensar que resultado deberia obtenerse y luego corroborarlo en Pharo.

a) `[:x | x + 1] value: 2`

b) `[|x| x := 10. x + 12] value`

c) `[:x :y | |z| z := x + y] value: 1 value: 2`

d) `[:x :y | x + 1] value: 1`

e) `[:x | [:y | x + 1]] value: 2`

f) `[[:x | x + 1]] value`

g) `[:x :y :z | x + y + z] valueWithArguments: #(1 2 3)`

h) `[ |z| z := 10. [:x | x + z]] value value: 10`

### Ejercicio 9

Responder las siguientes preguntas sobre los closures y los lenguajes vistos anteriormente:

i. ¿Que diferencia hay entre `[|x y z| x + 1]` y `[:x :y :z| x + 1]`?

ii. ¿Que diferencia hay entre `[:x| [:y| [:z| x + y + z + 1]]]` y `[:x :y :z| x + y + z + 1]`?

iii. ¿Que diferencias se identifican hasta el momento entre *closures* de Smalltalk y *lambdas* de *Haskell*?

iv. ¿En Prolog existe algo parecido a *lambdas* y *closures*?

### Ejercicio 10

Nombrar las diferencias, entre las siguientes colecciones en *Smalltalk*, dar un ejemplo de uso de cada una.

- OrderedCollection
- SortedCollection
- Bag
- Dictionary
- Array
- Set
- Matrix

### Ejercicio 11

Dada la siguiente implementacion:

```smalltalk
Integer << factorialsList
    | list |
    list := OrderedCollection with: 1.
    2 to: self do: [ :aNumber | list add: (list last) * aNumber].
    ^list.
```

Donde `UnaClase << unMetodo` indica que se estara definiendo el metodo `#unMetodo` en la clase `UnaClase`.

¿Cual es el resultado de evaluar las siguientes expresiones? ¿Quien es el receptor del mensaje `#factorialsList` en cada caso?

a) `factorialsList: 10.`

b) `Integer factorialsList: 10.`

c) `3 factorialsList.`

d) `5 factorialsList at: 4.`

e) `5 factorialsList at: 6.`

### Ejercicio 12 ★

Mostrar un ejemplo por cada uno de los siguientes mensajes que pueden enviarse a las colecciones en el lenguaje Smalltalk. Indicar a que evaluan dichos ejemplos.

a) `#collect:`

b) `#select:`

c) `#inject: into:`

d) `#reduce:` (o `#fold:`)

e) `#reduceRight:`

f) `#do:`

### Ejercicio 13 ★

Suponiendo que tenemos un objeto `obj` que tiene el siguiente metodo definido en su clase

```smalltalk
SomeClass << foo: x
    | aBlock y z |
    z := 10.
    aBlock := [x > 5 ifTrue: [z := z + x. ^0] ifFalse: [z := z - x. 5]].
    y := aBlock value.
    y := y + z.
    ^y.
```

¿Cual es el resultado de evaluar las siguientes expresiones?

a) `obj foo: 4.`

b) `Message selector: #foo: argument: 5.`

c) `obj foo: 10.` (Ayuda: el resultado no es 20).

### Ejercicio 14 ★

Implementar metodos para los siguientes mensajes:

a) `#curry`, cuyo objeto receptor es un bloque de dos parametros, y su resultado es un bloque similar al original pero currificado.

Por ejemplo, la siguiente ejecucion evalua a 12.

```smalltalk
| curried new |
curried := [:x :res | x + res] curry.
new := curried value: 10.
new value: 2.
```

b) `#flip`, que al enviarse a un bloque de dos parametros, devuelve un bloque similar al original, pero con los parametros en el orden inverso.

c) `#repetirVeces:`, cuyo objeto receptor es un numero natural y recibe como colaborador un bloque, el cual se evaluara tantas veces como el numero lo indique.

Por ejemplo, luego de la siguiente ejecucion, `count` vale 20 y `copy` 18.

```smalltalk
| count copy |
count := 0.
10 repetirVeces: [copy := count. count := count + 2].
```

### Ejercicio 15 ★

Agregar a la clase `BlockClosure` el metodo de clase `generarBloqueInfinito` que devuelve un bloque `b1` tal que:

- `b1 value` devuelve un arreglo de 2 elementos `#(1 b2)`.
- `b2 value` devuelve un arreglo de 2 elementos `#(2 b3)`.
- ...
- `bi value` devuelve un arreglo de 2 elementos `#(i b_{i+1})`.

---

## Method Dispatch, self y super

### Ejercicio 16

Indique en cada caso si la frase es cierta o falsa en *Smalltalk*. Si es falsa, ¿como podria corregirse?

i. Todo objeto es instancia de alguna clase y a su vez, estas son objetos.

ii. Cuando un mensaje es enviado a un objeto, el metodo asociado en la clase del receptor es ejecutado.

iii. Al mandar un mensaje a una clase, por ejemplo `Object new`, se busca en esa clase el metodo correspondiente. A este metodo lo clasificamos como metodo de instancia.

iv. Una *Variable de instancia* es una variable compartida por todas las instancias vivas de una clase, en caso de ser modificada por alguna de ellas, la variable cambia.

v. Las *Variables de clase* son accesibles por el objeto clase, pero al mismo tiempo tambien son accesibles y compartidas por todas las instancias de la clase; es decir, si una instancia modifica el valor de dicha variable, dicho cambio afecta a todas las instancias.

vi. Al ver el codigo de un metodo, podemos determinar a que objeto representara la pseudo-variable *self*.

vii. Al ver el codigo de un metodo, podemos determinar a que objeto representara la pseudo-variable *super*.

viii. Un *Metodo de clase* puede acceder a las variables de clase pero no a las de instancia, y por otro lado, siempre devuelven un objeto instancia de la clase receptora.

ix. Los metodos y variables de clase son los metodos y variables de instancia del objeto clase.

### Ejercicio 17 ★

Suponiendo que `anObject` es una instancia de la clase `OneClass` que tiene definido el metodo de instancia `aMessage`. Al ejecutar la siguiente expresion: `anObject aMessage`

i. ¿A que objeto queda ligada (hace referencia) la pseudo-variable *self* en el contexto de ejecucion del metodo que es invocado?

ii. ¿A que objeto queda ligada la pseudo-variable *super* en el contexto de ejecucion del metodo que es invocado?

iii. ¿Es cierto que `super == self`? ¿es cierto en cualquier contexto de ejecucion?

### Ejercicio 18

Se cuenta con la clase `Figura`, que tiene los siguientes metodos:

```smalltalk
perimetro
    ^self lados sumarTodos.

lados
    ^self subclassResponsibility.
```

donde `sumarTodos` es un metodo de la clase `Collection`, que suma todos los elementos de la coleccion receptora. El metodo `lados` debe devolver un `Bag` (subclase de `Collection`) con las longitudes de los lados de la figura.

`Figura` tiene dos subclases: `Cuadrado` y `Circulo`. `Cuadrado` tiene una variable de instancia `lado`, que representa la longitud del lado del cuadrado modelado; `Circulo` tiene una variable de instancia `radio`, que representa el radio del circulo modelado.

Se pide que las clases `Cuadrado` y `Circulo` tengan definidos su metodo `perimetro`. Implementar los metodos que sean necesarios para ello, respetando el modelo (incompleto) recien presentado.

Observaciones: el perimetro de un circulo se obtiene calculando: 2 * π * radio, y el del cuadrado: 4 * lado. Consideramos que un circulo no tiene lados. Aproximar π por 3,14.

### Ejercicio 19

Implementar el metodo `mcm: aNumber` en la clase `Integer` para poder calcular el minimo comun multiplo entre dos numeros.

Recordar que el mismo se calcula como mcm(a, b) = (a * b) / gcd(a, b).

Asumir que cuenta con el mensaje `gcd: aNumber` implementado.

i. Realizar un seguimiento de la expresion `6 mcm: 10` y hacer el diagrama de secuencia correspondiente.

ii. Con esa informacion, completar la siguiente tabla:

| Mensaje | Receptor | Colaboradores | Clase del metodo | Resultado |
|---------|----------|---------------|------------------|-----------|
| mcm:    | 6        | 10            | ...              | ...       |
| ...     | ...      | ...           | ...              | ...       |
| ...     | ...      | ...           | ...              | ...       |

### Ejercicio 20 ★

Sean las siguientes clases:

```smalltalk
Object subclass: Counter
    instanceVariableNames: "count"

Counter class << new
    ^super new initialize: 0.

Counter << initialize: aValue
    count := aValue.
    ^self.

Counter << next
    self initialize: count + 1.
    ^count.

Counter << nextIf: condition
    ^condition ifTrue: [self next]
              ifFalse: [count]
```

```smalltalk
Counter subclass: FlexibleCounter
    instanceVariableNames: "block"

FlexibleCounter class << new: aBlock
    ^super new useBlock: aBlock.

FlexibleCounter << useBlock: aBlock
    block := aBlock.
    ^self.

FlexibleCounter << next
    self initialize: (block value: count).
    ^count.
```

Y se ejecuta el siguiente codigo:

```smalltalk
aCounter := FlexibleCounter new: [:v | v + 2].
aCounter nextIf: true.
```

i. Se desea saber que mensajes se envian, a que objetos, donde esta definido el metodo usado, e identificar cual es la respuesta a cada mensaje.

ii. Armar un diagrama de secuencia donde queden claros los objetos involucrados, el envio de mensajes y las respuestas obtenidas.

iii. Completar la siguiente tabla de acuerdo a los mensajes enviados.

| Mensaje | Receptor         | Colaboradores | Clase del metodo | Resultado                          |
|---------|------------------|---------------|------------------|------------------------------------|
| new:    | FlexibleCounter  | [:v \| v + 2] | FlexibleCounter  | un contador flexible (unCF)        |
| ...     | ...              | ...           | ...              | ...                                |

### Ejercicio 21

Dado el siguiente modelo:

```smalltalk
Object subclass: #X

"Metodos de X:"

action1
    ^[self compute] value.

compute
    ^10.

baseValue
    ^self value + 5.

value
    ^1.
```

```smalltalk
X subclass: #Y

"Metodos de Y:"

action2
    ^super baseValue.

baseValue
    ^20.

value
    ^3.
```

Para cada una de las siguientes expresiones se pide hacer un diagrama de secuencia con los mensajes y objetos. Con ello, se pide completar una tabla donde se indique, en orden, cada mensaje que se envia, que objeto lo recibe, en que clase esta el metodo respectivo, y cual es el resultado final de cada colaboracion:

i. `Y new action1`

ii. `Y new action2`

### Ejercicio 22 ★

Considerar las siguientes definiciones:

```smalltalk
Object subclass: A [
    a: x b: y
        ^ x a: (y c) b: self.

    c
        ^ 2.
]

A subclass: B [
    a: x b: y
        ^ y c + x value.

    c
        ^ 1.
]

B subclass: C [
    a: x b: y
        ^ x.

    c
        ^ [self a: super c b: self].
]
```

Hacer una tabla donde se indique, en orden, cada mensaje que se envia, que objeto lo recibe, con que colaboradores, en que clase esta el metodo respectivo, y cual es el resultado final de cada colaboracion tras ejecutar el siguiente codigo:

```smalltalk
(A new) a: (B new) b: (C new)
```

### Ejercicio 23

Se desea agregar la posibilidad de trabajar con monedas en Smalltalk. Para lograrlo, agregaremos la clase `Moneda`, con la variable de instancia (colaborador interno) `cantidad` y los metodos de instancia `cantidad` y `cantidad:` para acceder a dicho valor, y tres subclases: `Pesos`, `Dolares` y `Reales`, cada una de ellas con la variable de clase `conversiones`, que representara un diccionario con la tasa de cambio a cada una de las otras monedas.

Se extiende la clase `Number` con los metodos `pesos`, `dolares` y `reales`, los cuales crean una instancia de la subclase correspondiente de `Moneda`, cuya cantidad es el objeto receptor. Por ejemplo:

```smalltalk
Number >> pesos
    ^Pesos new cantidad: self

Moneda >> cantidad
    ^cantidad

Moneda >> cantidad: aNumber
    cantidad := aNumber
```

Para cada metodo que se escriba debe quedar **bien claro** en que clase y que tipo de metodo (de instancia o de clase) se esta implementando. Tambien, si se agregan variables de instancia o clase, debe quedar explicitado. Se considerara un error el uso de codigo repetido o innecesario. **No** esta permitida la creacion de nuevas clases.

i. Para la siguiente expresion hacer una tabla donde se indique, en orden, cada mensaje que se envia, que objeto lo recibe, y cual es el resultado final de cada colaboracion:

```smalltalk
2000 pesos cantidad.
```

ii. Agregar en la clase que corresponda el metodo `cambioDe:a:`, que guarde en el diccionario de conversiones de cada moneda involucrada la tasa de cambio a la otra moneda. Por ejemplo, si se indica que la tasa de cambio de la moneda A a B es 2, entonces la clase A debe guardar la informacion de que el valor de conversion a B es 2, y la clase B debe guardar el valor de conversion a A de 1/2.

iii. Agregar en la clase que corresponda el metodo `=`, que tome una instancia de alguna subclase de `Moneda` y la compare con la moneda receptora, teniendo en cuenta el nombre de la moneda recibida, la tasa de cambio y las cantidades de ambas monedas.

El codigo definido debe permitir que el siguiente test funcione correctamente:

```smalltalk
testUnidadesConvertibles
    Moneda cambioDe: #dolar a: #peso es: 1295
    Moneda cambioDe: #dolar a: #reales es: 2.65

    self assert: 20 dolares = 25900 pesos
    self assert: 20 pesos = 6.20 reales
```
