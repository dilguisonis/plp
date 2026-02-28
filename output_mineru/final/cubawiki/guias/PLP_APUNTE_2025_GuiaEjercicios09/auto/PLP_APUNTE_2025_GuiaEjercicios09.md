# Práctica No 9 - Programación Orientada a Objetos (v1.1)

Para resolver esta práctica, recomendamos usar el entorno Pharo, que puede bajarse del sitio web indicado en la sección Enlaces de la página de la materia.

Los ejercicios marcados con el símbolo $\star$ constituyen un subconjunto mínimo de ejercitación. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

# Introducción

A continuación se incluyen algunos ejercicios que buscan comprender algunas diferencias de Smalltalk con otros de los lenguajes de los paradigmas anteriores.

# Ejercicio 1

Dado el siguiente código de Smalltalk, se pide responder:

v a r 1 : $=$ ' un t e x t o ' c o p y .   
v a r 2 : $=$ ' un t e x t o ' c o p y .   
$\mathsf { v a r 3 } : = \mathsf { v a r 1 }$ .

$\mathsf { v a r 1 } \ = \ \mathsf { v a r 2 }$ $\mathsf { v a r 1 } = \mathsf { v a r 2 }$ $\mathsf { v a r } 1 = \mathsf { v a r } 3$

i. $\dot { \downarrow } ^ { \mathrm { C u } \acute { \mathrm { a l } } }$ es resultado de la ejecución de las últimas tres líneas? ¾Por qué es así?

ii. $\dot { \downarrow } \mathrm { Q u } \dot { \mathrm { e } }$ ocurriría si se escribe y ejecuta un código similar en Haskell o Prolog? ¾En qué se diferencian los tres lenguajes? Listar los operadores similares que hay en ellos.

iii. Listar los operadores de comparación por igualdad de cada uno de los tres lenguajes, e identicar similitudes y diferencias entre ellos.

# Ejercicio 2

Dado el siguiente código para un modelo de una jerarquía de guras geométricas, donde ambas clases tienen denio el mensaje dibujar:

( C í r c u l o new r a d i o : 5 ) d i b u j a r .   
( R e c t á n g u l o new b a s e : 4 a l t u r a : 3 ) d i b u j a r .   
i. ¾Cómo podría modelarse esto mismo en Haskell? Pensarlo en detalle.   
ii. Qué cambios habría que hacer en el código de Smalltalk y en el Haskell si se agregara un nuevo tipo de gura (e.g., Triángulo)?   
iii. ¾Cómo podría resolverse esto mismo usando Prolog? ¾Qué diferencias habría con lo anterior?

# Ejercicio 3

Dado el siguiente código, en el contexto de un modelo de datos personales, se pide:

p e r s o n a 1 : $=$ P e r s o n a new nombre : ' Pedro ' ; e d a d : 3 5 . p e r s o n a 2 : $=$ P e r s o n a new no mbr e : ' R a f f a e l l a ' ; e d a d : 3 8 . p e r s o n a 1 nombre   
p e r s o n a 2 edad

i. Si modeláramos algo similar en Prolog, usaríamos un conjunto de hechos para denotar los datos de las dos personas. $\dot { \downarrow } \mathrm { Q u } \dot { \mathrm { e } }$ ventajas y desventajas tendrían ambas implementaciones?

ii. $\dot { \iota }$ Cómo podría modelarse algo similar en Haskell? $\dot { \iota }$ Cuál sería el código para denir los tipos y funciones necesarias?

# Ejercicio 4

Anteriormente trabajamos con Haskell y Prolog, y ahora con Smalltalk.

i. $\dot { \iota }$ Te parece que los tres lenguajes son igualmente 'potentes' ?   
ii. ¾En estos lenguajes se pueden modelar los mismos tipos de problemas?   
iii. ¾Hay ventajas o desventajas en usar un lenguaje u otro de acuerdo a diferentes situaciones/problemas? ¾Cuáles serían?

# Objetos y mensajes

# Ejercicio $\textbf { 5 } \star$

En las siguientes expresiones, identicar mensajes, el objeto receptor y los colaboradores para cada caso.

a) 10 numberOfDigitsInBase: 2.   
b) 10 factorial.   
c) $2 0 \ + \ 3 \ * \ 5$ .   
d) $2 0 ~ + ~ ( 3 ~ * ~ 5 )$ .   
e) December first, 1985.   
f) $1 ~ = ~ 2$ ifTrue: [ \`what!?' ].   
g) 1@1 insideTriangle: 0@0 with: 2@0 with: 0@2.   
h) \`Hello World' indexOf: \$o startingAt: 6.   
i) (OrderedCollection with: 1) add: 25; add: 35; yourself.   
j) Object subclass: #SnakesAndLadders instanceVariableNames: \`players squares turn die over' classVariableNames: \`' poolDictionaries: \`' category: \`SnakesAndLadders'.

# Ejercicio 6

Para cada una de las expresiones del punto anterior, indicar cuál es el resultado de su evaluación. Para este punto se recomienda utilizar el Workspace de Pharo para corraborar las respuestas.

# Ejercicio 7

Dar ejemplos de expresiones válidas en el lenguaje Smalltalk que contengan los siguientes conceptos entre sus sub-expresiones. En cada caso indicar por qué se adapta a la categoría y describir que devuelve su evaluación.

a) Objeto e) Colaborador i) Carácter b) Mensaje unario f) Variable local j) Array c) Mensaje binario g) Asignación   
d) Mensaje keyword h) Símbolo

# Bloques, métodos y colecciones

# Ejercicio $^ \mathrm { ~ 8 ~ } \star$

Para cada una de las siguientes expresiones, indicar qué valor devuelve o explicar por qué se produce un error al ejecutarlas. Recomendamos pensar qué resultado debería obtenerse y luego corraborarlo en Pharo.

a) $[ : { \bf x } | { \bf x } + 1 ]$ value: 2   
b) $[ | { \textbf { x } } | { \textbf { x } } : = 1 0 \cdot { \textbf { x } } + 1 2 ]$ value   
c) $\begin{array} { r } { \mathsf {  { ~ \mathsf { L } : x ~ } } : \mathsf { y } \mid \mathsf {  { z } } \mid \mathsf {  { z } } : = \textsf { x } + \mathsf {  { y } } } \end{array}$ value: 1 value: 2   
d) $[ : { \bf x } \ : { \bf y } | \ { \bf x } \ + \ 1 ]$ value: 1   
e) $[ : \mathbf { x } | [ : \mathbf { y } | \textbf { x } + \ : 1 ] ]$ value: 2   
f) $[ [ : { \bf x } | { \mathrm { ~ \bf ~ x ~ } } + { \mathrm { ~ \bf ~ 1 } } ] ]$ value   
g) $[ : { \bf x } \ : { \bf y } : { \bf z } \ | \ { \bf x } \ + \ { \bf y } \ + \ { \bf z } ]$ valueWithArguments: #(1 2 3)   
h) $[ \begin{array} { l } { { \mathbf { \sigma } } | \mathbf { z } | { \mathbf { \sigma } } ~ \mathbf { z } } \end{array} : = \begin{array} { l } { 1 0 } \end{array}$ . $[ : { \textbf { x } } | { \textbf { x } } + { \textbf { z } } ] ]$ value value: 10

# Ejercicio 9

Responder las siguientes preguntas sobre los closures y los lenguajes vistos anteriormente:

i. $\dot { \downarrow } \mathrm { Q u } \dot { \mathrm { e } }$ diferencia hay entre $[ | \texttt { x y z } | \texttt { x + 1 } ] \texttt { y } [ : \texttt { x : y } : \texttt { z } | \texttt { x + 1 } ] \texttt { \xi }$   
ii. ¾Qué diferencia hay entre $[ : { \bf x } | \mathrm { ~  ~ \bar { ~ } { ~ \cal ~ L ~ } ~ } : { \bf y } | \mathrm { ~  ~ \bar { ~ } { ~ \cal ~ L ~ } ~ } : { \bf z } | \mathrm { ~  ~ \bar { ~ } { ~ \bf ~ x ~ } ~ } + \mathrm { ~  ~ \bar { ~ y ~ } ~ } + \mathrm { ~  ~ \bar { ~ z ~ } ~ } + \mathrm { ~  ~ \bar { ~ } { ~ \bf ~ 1 } ~ } ] ] \mathrm { ~  ~ \cal ~ y ~ } [ : { \bf x } \mathrm { ~  ~ : ~ \bf y ~ } : { \bf z } | \mathrm { ~  ~ \bar { ~ x ~ } ~ } + \mathrm { ~  ~ \bar { ~ y ~ } ~ } + \mathrm { ~  ~ \bar { ~ z ~ } ~ } + \mathrm { ~  ~ \bar { ~ 1 } ~ } ] \mathrm { ~  ~ \bar { ~ z ~ } ~ } .$ iii. $\dot { \downarrow } \mathrm { Q u } \dot { \mathrm { e } }$ diferencias se identican hasta el momento entre closures de Smalltalk y lambdas de Haskell? iv. ¾En Prolog existe algo parecido a lambdas y closures?

# Ejercicio 10

Nombrar las diferencias, entre las siguientes colecciones en Smalltalk, dar un ejemplo de uso de cada una.

OrderedCollection   
SortedCollection   
Bag   
Dictionary   
Array   
Set   
Matrix

# Ejercicio 11

Dada la siguiente implementación:

I n t e g e r << f a c t o r i a l s L i s t | l i s t | l i s t : $=$ O r d e r e d C o l l e c t i o n w i t h : 1 . 2 t o : s e l f do : [ : aNumber | l i s t a d d : ( l i s t l a s t ) \* aNumber ] . ^ l i s t .

Donde UnaClase << unMetodo indica que se estará deniendo el método #unMetodo en la clase UnaClase.

$\dot { \downarrow } ^ { \mathrm { C u } \acute { \mathrm { a l } } }$ es el resultado de evaluar las siguientes expresiones? ¾Quién es el receptor del mensaje #factorialsList en cada caso?

a) factorialsList: 10.   
b) Integer factorialsList: 10.   
c) 3 factorialsList.   
d) 5 factorialsList at: 4.   
e) 5 factorialsList at: 6.

# Ejercicio $\mathbf { 1 2 ~ \star }$

Mostrar un ejemplo por cada uno de los siguientes mensajes que pueden enviarse a las colecciones en el lenguaje Smalltalk. Indicar a qué evalúan dichos ejemplos.

a) #collect: c) #inject: into: e) #reduceRight: b) #select: d) #reduce: (o #fold:) f) #do:

# Ejercicio $\mathbf { 1 3 ~ \star }$

Suponiendo que tenemos un objeto obj que tiene el siguiente método denido en su clase

S o m e C l a s s << f o o : x | a B l o c k y z | $z : = 1 0$ . a B l o c k : $= ~ [ \times ~ > ~ 5$ i f T r u e : [ z := z + x . ^ 0 ] i f F a l s e : [ z := z = x . 5 ] ] . y := a B l o c k v a l u e . $y ~ : = ~ y ~ + ~ z$ . ^ y .

$\dot { \downarrow } ^ { \mathrm { C u } \acute { \mathrm { a l } } }$ es el resultado de evaluar las siguientes expresiones?

a) obj foo: 4.   
b) Message selector: #foo: argument: 5.   
c) obj foo: 10. (Ayuda: el resultado no es 20).

# Ejercicio $^ { 1 4 \star }$

Implementar métodos para los siguientes mensajes:

a) #curry, cuyo objeto receptor es un bloque de dos parámetros, y su resultado es un bloque similar al original pero curricado. Por ejemplo, la siguiente ejecución evalúa a 12. | c u r r i e d new c u r r i e d : = [ : x : r e s | x + r e s ] c u r r y . new : $=$ c u r r i e d v a l u e : 1 0 . new v a l u e : 2 .   
b) #flip, que al enviarse a un bloque de dos parámetros, devuelve un bloque similar al original, pero con los parámetros en el orden inverso.   
c) #repetirVeces:, cuyo objeto receptor es un número natural y recibe como colaborador un bloque, el cual se evaluará tantas veces como el número lo indique. Por ejemplo, luego de la siguiente ejecución, count vale 20 y copy 18. | c o u n t copy c o u n t : $\qquad = \ 0$ . 10 r e p e t i r V e c e s : [ c o p y : $=$ c o u n t . c o u n t : $=$ c o u n t + 2 ] .

# Ejercicio $\mathbf { 1 5 ~ \star }$

Agregar a la clase BlockClosure el método de clase generarBloqueInfinito que devuelve un bloque b1 tal que:

b1 value devuelve un arreglo de 2 elementos #(1 b2).   
b2 value devuelve un arreglo de 2 elementos #(2 b3). . . .   
bi value devuelve un arreglo de 2 elementos #(i $b _ { i + 1 } .$ ).

# Method Dispatch, self y super

# Ejercicio 16

Indique en cada caso si la frase es cierta o falsa en Smalltalk. Si es falsa, ¾cómo podría corregirse?

i. Todo objeto es instancia de alguna clase y a su vez, estas son objetos.   
ii. Cuando un mensaje es enviado a un objeto, el método asociado en la clase del receptor es ejecutado.   
iii. Al mandar un mensaje a una clase, por ejemplo Object new, se busca en esa clase el método correspondiente. A este método lo clasicamos como método de instancia.   
iv. Una Variable de instancia es una variable compartida por todas las instancias vivas de una clase, en caso de ser modicada por alguna de ellas, la variable cambia.   
v. Las Variables de clase son accesibles por el objeto clase, pero al mismo tiempo también son accesibles y compartidas por todas las instancias de la clase; es decir, si una instacia modica el valor de dicha variable, dicho cambio afecta a todas las instancias.   
vi. Al ver el código de un método, podemos determinar a qué objeto representará la pseudo-variable self.   
vii. Al ver el código de un método, podemos determinar a qué objeto representará la pseudo-variable super.

viii. Un Método de clase puede acceder a las variables de clase pero no a las de instancia, y por otro lado, siempre devuelven un objeto instancia de la clase receptora.

ix. Los métodos y variables de clase son los métodos y variables de instancia del objeto clase.

# Ejercicio 17 ⋆

Suponiendo que anObject es una instancia de la clase OneClass que tiene denido el método de instancia aMessage. Al ejecutar la siguiente expresión: anObject aMessage

i. ¾A qué objeto queda ligada (hace referencia) la pseudo-variable self en el contexto de ejecución del método que es invocado?   
ii. ¾A qué objeto queda ligada la pseudo-variable super en el contexto de ejecución del método que es invocado?   
iii. ¾Es cierto que super $= =$ self? ¾es cierto en cualquier contexto de ejecución?

# Ejercicio 18

Se cuenta con la clase Figura, que tiene los siguientes métodos:   
p e r i m e t r o ^ s e l f l a d o s s u m a r T o d o s .   
l a d o s ^ s e l f s u b c l a s s R e s p o n s i b i l i t y .

donde sumarTodos es un método de la clase Collection, que suma todos los elementos de la colección receptora. El método lados debe devolver un Bag (subclase de Collection) con las longitudes de los lados de la gura.

Figura tiene dos subclases: Cuadrado y Círculo. Cuadrado tiene una variable de instancia lado, que representa la longitud del lado del cuadrado modelado; Círculo tiene una variable de instancia radio, que representa el radio del círculo modelado.

Se pide que las clases Cuadrado y Círculo tengan denidos su método perímetro. Implementar los métodos que sean necesarios para ello, respetando el modelo (incompleto) recién presentado.

Observaciones: el perímetro de un círculo se obtiene calculando: $2 \cdot \pi \cdot r a d i o$ , y el del cuadrado: 4 · lado. Consideramos que un círculo no tiene lados. Aproximar $\pi$ por 3,14.

# Ejercicio 19

Implementar el método mcm: aNumber en la clase Integer para poder calcular el mínimo común múltiplo entre dos números.

Recordar que el mismo se calcula cómo $\begin{array} { r } { m c m ( a , b ) = \frac { a * b } { g c d ( a , b ) } } \end{array}$ . Asumir que cuenta con el mensaje gcd: aNumber implementado.

i. Realizar un seguimiento de la expresión 6 mcm: $1 0 \mathrm { ~ y ~ }$ hacer el diagrama de secuencia correspondiente.

ii. Con esa información, completar la siguiente tabla:

<table><tr><td rowspan=1 colspan=1>Mensaje</td><td rowspan=1 colspan=1>Recept or</td><td rowspan=1 colspan=1>Colaboradores</td><td rowspan=1 colspan=1>Clase del método</td><td rowspan=1 colspan=1>Resultado</td></tr><tr><td rowspan=1 colspan=1>mcm:</td><td rowspan=1 colspan=1>6</td><td rowspan=1 colspan=1>10</td><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1></td></tr><tr><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1>：</td><td rowspan=1 colspan=1>：</td><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1></td></tr><tr><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1></td></tr></table>

# Ejercicio $\mathbf { 2 0 \star }$

Sean las siguientes clases:

O b j e c t s u b c l a s s : C o u n t e r i n s t a n c e V a r i a b l e N a m e s : " c o u n t " C o u n t e r s u b c l a s s : F l e x i b l e C o u n t e r i n s t a n c e V a r i a b l e N a m e s : " b l o c k " C o u n t e r c l a s s << new ^ s u p e r new i n i t i a l i z e : 0 . F l e x i b l e C o u n t e r c l a s s << new : a B l o c k ^ s u p e r new u s e B l o c k : a B l o c k . C o u n t e r << i n i t i a l i z e : a V a l u e c o u n t : $=$ a V a l u e . F l e x i b l e C o u n t e r << u s e B l o c k : a B l o c k ^ s e l f . b l o c k : $=$ a B l o c k . ^ s e l f . C o u n t e r << n e x t s e l f i n i t i a l i z e : c o u n t + 1 . F l e x i b l e C o u n t e r << n e x t ^ c o u n t . s e l f i n i t i a l i z e : ( b l o c k v a l u e : c o u n t ) . ^ c o u n t . C o u n t e r << n e x t I f : c o n d i t i o n ^ c o n d i t i o n i f T r u e : [ s e l f n e x t ] i f F a l s e : [ c o u n t ]

Y se ejecuta el siguiente código: aCounter : $=$ FlexibleCounter new: [:v | v+2 ]. aCounter nextIf: true.

i. Se desea saber qué mensajes se envían, a qué objetos, dónde está denido el método usado, e identicar cuál es la respuesta a cada mensaje.   
ii. Armar un diagrama de secuencia donde queden claros los objetos involucrados, el envío de mensajes y las respuestas obtenidas.

iii. Completar la siguiente tabla de acuerdo a los mensajes enviados.

<table><tr><td rowspan=1 colspan=1>Mensaje</td><td rowspan=1 colspan=1>Receptor</td><td rowspan=1 colspan=1>Colaboradores</td><td rowspan=1 colspan=1>Clase del método</td><td rowspan=1 colspan=1>Resultado</td></tr><tr><td rowspan=1 colspan=1>new:</td><td rowspan=1 colspan=1>FlexibleCounter</td><td rowspan=1 colspan=1>[:v| v+2]：</td><td rowspan=1 colspan=1>FlexibleCounter</td><td rowspan=1 colspan=1>un contador flexible (unCF)</td></tr></table>

# Ejercicio 21

Dado el siguiente modelo:

Object subclass: #X action1 ^[self compute] value. compute $\sim 1 0$ . baseValue ^self value + 5. value ^1.

X subclass: #Y action2 ^super baseValue. baseValue ^20. value ^3.

Para cada una de las siguientes expresiones se pide hacer un digrama de secuencia con los mensajes y objetvos. Con ello, se pide completar una tabla donde se indique, en orden, cada mensaje que se envía, qué objeto lo recibe, en qué clase está el método respectivo, y cuál es el resultado nal de cada colaboración:

i. Y new action1   
ii. Y new action2

# Ejercicio $\mathbf { 2 2 \star }$

Considerar las siguientes deniciones:

Object subclass: A [ a: x b: y ^ x a: (y c) b: self. c ^ 2.   
]   
B subclass: C [ a: x b: y ^ x. c ^ [self a: super c b: self].   
]   
A subclass: B [ a: x b: y ^ y c + x value. c ^ 1.   
]

Hacer una tabla donde se indique, en orden, cada mensaje se envía, qué objeto lo recibe, con qué colaboradores, en qué clase está el método respectivo, y cuál es el resultado nal de cada colaboración tras ejecutar el siguiente código:

(A new) a: (B new) b: (C new)

# Ejercicio 23

Se desea agregar la posibilidad de trabajar con monedas en Smalltalk. Para lograrlo, agregaremos la clase Moneda, con la variable de instancia (colaborador interno) cantidad y los métodos de instancia cantidad y cantidad: para acceder a dicho valor, y tres subclases: Pesos, Dolares y Reales, cada una de ellas con la variable de clase conversiones, que representará un diccionario con la tasa de cambio a cada una de las otras monedas.

Se extiende la clase Number con los métodos pesos, dolares y reales, los cuales crean una instancia de la subclase correspondiente de Moneda, cuya cantidad es el objeto receptor. Por ejemplo:

Number $\gg$ pesos Moneda  cantidad Moneda  cantidad: aNumber ^Pesos new cantidad: self ^cantidad ^cantidad $=$ aNumber

Para cada método que se escriba debe quedar bien claro en qué clase y qué tipo de método (de instancia o de clase) se está implementando. También, si se agregan variables de instancia o clase, debe quedar explicitado. Se considerará un error el uso de código repetido o innecesario. No está permitida la creación de nuevas clases.

i. Para la siguiente expresión hacer una tabla donde se indique, en orden, cada mensaje que se envía, qué objeto lo recibe, y cuál es el resultado nal de cada colaboración: 2000 pesos cantidad.   
ii. Agregar en la clase que corresponda el método cambioDe:a:, que guarde en el diccionario de conversiones de cada moneda involucrada la tasa de cambio a la otra moneda. Por ejemplo, si se indica que la tasa de cambio de la moneda A a B es 2, entonces la clase A debe guardar la información de que el valor de conversión a B es 2, y la clase B debe guardar el valor de conversión a A de 1/2.   
iii. Agregar en la clase que corresponda el método $=$ , que tome una instancia de alguna subclase de Moneda y la compare con la moneda receptora, teniendo en cuenta el nombre de la moneda recibida, la tasa de cambio y las cantidades de ambas monedas. El código denido debe permitir que el siguiente test funcione correctamente: testUnidadesConvertibles Moneda cambioDe: #dolar a: #peso es: 1295 Moneda cambioDe: #dolar a: #reales es: 2.65 self assert: 20 dolares $=$ 25900 pesos self assert: 20 pesos $=$ 6.20 reales