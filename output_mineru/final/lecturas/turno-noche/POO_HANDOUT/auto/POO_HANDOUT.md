# Paradigmas de Programaci´on (TM)

Programaci´on orientada a objetos

2do cuatrimestre de 2025 Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

# 1

Introducci´on

Conceptos fundamentales de POO

Introducci´on a la POO en Smalltalk

$$
2
$$

Un poco m´as de pr´actica ¿Por qu´e vamos a ver un paradigma m´as?

¿Qu´e conocen de la POO?   
¿Qu´e aporta con respecto a los paradigmas que vimos?   
¿Habr´a problemas que ser´an m´as f´aciles/claros/simples de   
resolver por medio de la POO?   
¿Pasaba algo parecido con los anteriores paradigmas?   
¿Qu´e implica aprender un paradigma nuevo?

# Distintos modos de concebir la programaci´on

$$
4
$$

Los paradigmas que hemos visto se fundamentan en la l´ogica:

Programaci´on funcional los programas son demostraciones.   
Programaci´on l´ogica los programas son f´ormulas.

Los programas est´an conformados por componentes, llamadas objetos, que interact´uan intercambiando mensajes.

Las entidades f´ısicas o conceptuales del dominio del problema que se quiere modelar se representan como objetos.

El comportamiento de los objetos debe reflejar fielmente aquellos aspectos que nos interesan de las entidades de la “realidad”.

# Breve perspectiva hist´orica

La POO surgi´o alrededor de 1970 para abstraer t´ecnicas comunes de la programaci´on procedural:

1. Pasaje de registros1 para permitir c´odigo reentrante. (Alternativa superadora a las variables globales).   
2. Agrupamiento de las funciones en m´odulos.   
3. Polimorfismo por indirecci´on: un registro contiene punteros a funciones que lo manipulan.

Algunos lenguajes orientados a objetos muy influyentes:

▶ Simula . O-J. Dahl & K. Nygaard, ∼1967   
▶ Smalltalk . A. Kay, D. Ingalls & A. Goldberg, ∼1972   
▶ Self . . D. Ungar & R. Smith, ∼1987

Introducci´on

Conceptos fundamentales de POO

Introducci´on a la POO en Smalltalk

Un poco m´as de pr´actica

# 6

# Objetos y mensajes

1. Un entorno OO est´a compuesto por objetos.

2. Un objeto puede enviar un mensaje a otro. Un mensaje representa una solicitud al objeto receptor, para que lleve a cabo una de sus operaciones.

3. La interfaz de un objeto es el conjunto de mensajes que es capaz de responder.

4. Un m´etodo es el procedimiento que usa un objeto para responder un mensaje. Es decir, es la implementaci´on efectiva de la operaci´on solicitada por el mensaje.

5. La forma en la que un objeto lleva a cabo una operaci´on puede depender de colaboradores externos2 as´ı como de su estado interno, dado por un conjunto de colaboradores internos3.

# Objetos y mensajes

# Ejemplo

Objeto que representa un rect´angulo de $5 \times 2$ :

<table><tr><td rowspan=1 colspan=1>Interfaz:</td><td rowspan=1 colspan=1>area</td></tr><tr><td rowspan=1 colspan=1>Atributos:</td><td rowspan=1 colspan=1>ancho....      (objeto que representa al 5)alto..           (objeto que representa al 2)</td></tr><tr><td rowspan=1 colspan=1>Metodos:</td><td rowspan=1 colspan=1>area^ ancho * alto</td></tr></table>

# Encapsulamiento

# Principio de encapsulamiento

S´olo se puede interactuar con un objeto a trav´es de su interfaz.   
El estado interno de un objeto es inaccesible desde el exterior.

# Consecuencias del encapsulamiento

1. Alternar entre dos representaciones de una misma entidad no modifica el comportamiento observable del sistema. Ejemplo. Un conjunto de enteros se puede representar con una lista enlazada o con un ´arbol binario balanceado, sin que el usuario pueda notar una diferencia de comportamiento.

2. “Duck typing”. Un objeto se puede intercambiar por otro que implemente la misma interfaz.

Ejemplo. Si espero interactuar con un buscador que responde el mensaje “buscar: texto”, me pueden suministrar un objeto que responde ese mensaje y adem´as mantiene estad´ısticas de uso.

$$
9
$$

# Variantes de la orientaci´on a objetos

Los entornos OO pueden tener distintas caracter´ısticas:

Env´ıo de mensajes sincr´onico vs. asincr´onico.   
Env´ıo de mensajes con respuesta vs. sin respuesta.   
Objetos mutables vs. inmutables.   
Clasificaci´on vs. prototipado.   
Herencia simple vs. herencia m´ultiple.

El entorno que usaremos (Smalltalk) tiene caracter´ısticas t´ıpicas.

# Clases e instancias

Todo objeto es instancia de alguna clase.

Una clase es un objeto que abstrae el comportamiento com´un de todas sus instancias. Ejemplo. (1 @ 2) es una instancia de la clase Point.

Todas las instancias de una clase tienen los mismos atributos.   
Ejemplo. Todas las instancias de Point tienen atributos x e y.

Todas las instancias de una clase usan el mismo m´etodo para responder un mismo mensaje.

Ejemplo. Los mensajes (1 @ 2) rho y (3 @ 4) rho se resuelven con un m´etodo implementado en la clase Point.

Veremos m´as sobre method dispatch m´as adelante.

# Subclasificaci´on y herencia

Cada clase es subclase de alguna otra clase.

Las clases se estructuran en una jerarqu´ıa. Por ejemplo:

![](images/8c7a8295bba589e8f99483531c8eb26853b0071cf462e172e3fdb03dbe350333.jpg)

Una clase hereda todos los m´etodos de su superclase.

Una clase puede elegir reemplazar (en ingl´es, override) un m´etodo definido en la superclase por otro m´as espec´ıfico.

Hay clases que est´an destinadas a abstraer el comportamiento de sus subclases, pero no tienen instancias (e.g., la clase Number). Estas se llaman clases abstractas.

Introducci´on

Conceptos fundamentales de POO

Introducci´on a la POO en Smalltalk

# 13

Un poco m´as de pr´actica

# Ejemplos b´asicos

Evaluemos los siguientes comandos:

(Cuidado con la precedencia)

1. 1 + 2   
2. 1 + 2 \* 3   
3. 1 class   
4. 1 class superclass   
5. 3 squared / 2 squared   
6. a := Array new: 10   
7. a at: 1 put: ’hola’   
8. a at: 1

(Juguemos un poco con el entorno)

Definamos una clase Par y los siguientes m´etodos:

1. Par x: unObjeto y: otroObjeto — construye un par.   
2. par x, par y — proyectan las componentes.   
3. par + otroPar — suma dos pares   
4. ¿Qu´e sucede si anidamos pares y usamos la suma?

$$
^ { 1 4 }
$$

# Sintaxis de expresiones y comandos

Smalltalk es un entorno orientado a objetos (no s´olo un lenguaje).

Pero necesitamos una sintaxis concreta para describir los m´etodos.

Sintaxis “m´ınima” de expresiones y comandos

Expr ::= x nombre local | X nombre global Expr msg mensaje unario Expr ⟨op⟩ Expr mensaje binario Expr msg1:Expr1 . . . msgN:ExprN mensaje keyword x := Expr asignaci´on   
Cmd ::= Expr expresi´on ∧Expr retorno Expr. Cmd secuencia Los nombres locales refieren a variables, atributos y par´ametros.   
Los globales refieren a clases, objetos singleton o variables globales.   
Precedencia: mensajes unarios $>$ binarios > keyword.

# Sintaxis de Smalltalk

Algunos otros elementos sint´acticos:

Las variables locales se declaran con |x1 ... xn|.   
Los mensajes se pueden encadenar con “;”.   
Hay seis palabras reservadas: nil true false self super thisContext

Se incluye notaci´on para diversos tipos de literales:

Constantes num´ericas: 29, -1.5, . . ..   
Caracteres: \$a, \$b, \$c, . . ..   
S´ımbolos: #hola, . . .   
Strings: ’hola’, . . .

# Polimorfismo

Una misma operaci´on puede operar con objetos que implementan la misma interfaz de distinta manera.

Esta caracter´ıstica de la POO se puede aprovechar para construir programas gen´ericos, que operan con objetos independientemente de sus caracter´ısticas espec´ıficas.

# Ejemplo

z := OrderedCollection new. z add: Gato new; add: Perro new; add: Pato new. z do: [:animal | animal hablar]. "miau guau cuac"

▶ No es necesario hacer un switch/case para analizar de qu´e especie de animal se trata. ▶ Cada objeto implementa su propio m´etodo para responder al mensaje “hablar” de forma correspondiente.

$$
^ { 1 7 }
$$

# Polimorfismo y estructuras de control

Smalltalk no tiene estructuras de control (if, for, while, etc.).   
Estos comportamientos se implementan con env´ıos de mensajes.

Veamos c´omo implementar manualmente un condicional.

1. Definamos la siguiente jerarqu´ıa de clases:

![](images/aa6ee7e1c2ce10aebed6a5c40853b086439407b667439fc69a454e8dea263de1.jpg)

2. Definamos m´etodos para implementar el mensaje: unValorDeVerdad siEsVerdadero: x siEsFalso: y

3. Definamos m´etodos para implementar el mensaje: unValorDeVerdad not aprovechando el polimorfismo.

4. ¿Qu´e sucede si evaluamos el siguiente comando?

Verdad new siEsVerdadero: 1 siEsFalso: Misil new lanzar

# Bloques

Un bloque o clausura es un objeto que representa un comando, es decir una secuencia de env´ıos de mensajes.

Se extiende la sintaxis:

Expr ::= . . [Cmd] bloque sin par´ametros [:x1 ... :xN |Cmd] bloque con par´ametros

Los bloques sin par´ametros se pueden evaluar con el mensaje:

bloque value

Los bloques con N par´ametros se pueden evaluar con el mensaje:

bloque value: arg1 value: arg2 ... value: argN

# Ejemplo

1. [1 + 1] value   
2. [:x :y | x + y] value: 1 value: 2   
3. [1 + 1. 3] value

# Ejemplo — recorrido sobre ´arboles

1. Definamos la siguiente jerarqu´ıa de clases:

![](images/52a022aebf5847968ed2bb64c05e868f2c300a184c500dc5eada1a45eab17cdc.jpg)

y los siguientes m´etodos, con la sem´antica esperable:

Nil new Bin izq: unArbol raiz: unDato der: otroArbol

2. Definamos m´etodos para implementar el siguiente mensaje, que recibe un bloque de un par´ametro y lo ejecuta sobre todos los elementos del ´arbol siguiendo el recorrido inorder:

arbol do: bloque

3. Definamos un m´etodo para implementar el mensaje: arbol size (implementarlo usando

Dos puntos interesantes:

Los bloques pueden mutar el estado de variables capturadas. El m´etodo size funciona para cualquier colecci´on que acepte el mensaje do:.

# Manejo de mensajes incomprendidos

¿Qu´e sucede si evaluamos el siguiente comando?

10 contarHasta: 20

El objeto 10 recibe un mensaje doesNotUnderstand: msg. msg es una instancia de la clase Message que reifica el mensaje “contarHasta: 20”.

# Herencia y reutilizaci´on de c´odigo

Definamos una clase Robot con la siguiente interfaz:

1. robot initialize — lo inicializa en la posici´on 0@0. 2. robot posicion — devuelve la posici´on actual. 3. robot desplazar: vector — modifica la posici´on actual sum´andole un vector (que acepta mensajes x e y).

Definamos ahora una subclase RobotConUndo:

1. robot undo — deshace el ´ultimo desplazamiento4.

Nos vemos obligados a reemplazar (override) los m´etodos initialize y posicion. Pero no queremos copiar y pegar el c´odigo.

#

La palabra reservada super se refiere al mismo objeto que self. Pero super m indica que la b´usqueda del m´etodo que implementa el mensaje m debe comenzar desde la superclase de la clase actual.

# Algoritmo de resoluci´on de m´etodos (method dispatch)

# Entrada

O: objeto al que se le desea enviar un mensaje. S: selector del mensaje que se desea enviar. (e.g., at:put:) C : clase en la que se desea buscar el m´etodo.

# Salida

M: m´etodo que se debe ejecutar para responder el mensaje, o NotUnderstood en caso de que no exista.

# Procedimiento

1. Si C define un m´etodo M para S, devolver M.   
2. Si no, sea $C ^ { \prime }$ la superclase de C .   
2.1 Si $C ^ { \prime }$ es nil, devolver NotUnderstood.   
2.2 Si no, asignar $C : = C ^ { \prime }$ y volver al paso 1.

# Algoritmo de resoluci´on de m´etodos (method dispatch)

En general, cuando se env´ıa un mensaje, se usa el algoritmo de resoluci´on de m´etodos tomando como C la clase del objeto O.

# Caso particular:

cuando se env´ıa un mensaje a self, O es el mismo objeto receptor.

# Excepci´on:

cuando se env´ıa un mensaje a super, O es el mismo objeto receptor mientras que C es la superclase de la clase del m´etodo que contiene el env´ıo de mensaje a super.

Introducci´on

Conceptos fundamentales de POO

Introducci´on a la POO en Smalltalk

# 25

Un poco m´as de pr´actica

# Conociendo Pharo

Algunas herramientas b´asicas:

Playground/Workspace: para interactuar con el sistema.

Transcript: para registrar lo que pasa.

System browser: para navegar las clases definidas.

Inspector: para inspeccionar un objeto.

Debugger: para ver si algo falla o ver en detalle la secuencia de mensajes.

Tip: Con shift+enter pueden navegar m´as r´apido

# Ejercicios Integer - Seguimiento

# Implementar

Implementar el m´etodo mcm: aNumber en la clase Integer para poder calcular el m´ınimo com´un m´ultiplo entre dos n´umeros.

Recordar que el mismo se calcula c´omo $\begin{array} { r } { m c m ( a , b ) = \frac { a * b } { g c d ( a , b ) } . } \end{array}$ Asumir que cuenta con el mensaje gcd: aNumber implementado.

# Seguimiento

Realizar un seguimiento de la expresi´on 6 mcm: 10 y hacer el diagrama de secuencia correspondiente.

Con esa informaci´on, completar la siguiente tabla:

<table><tr><td>Mensaje</td><td>Receptor</td><td>Colaboradores</td><td>Resultado</td></tr><tr><td>mcm:</td><td>6</td><td>10</td><td>：</td></tr><tr><td>：</td><td>：</td><td>：</td><td>：</td></tr><tr><td>：</td><td>：</td><td>：</td><td>：</td></tr></table>

$$
^ { 2 7 }
$$

# M´etodos de clase

¿Qu´e ocurre cuando mandamos un mensaje a una clase?

¡Lo mismo que siempre!   
Las clases son objetos.   
Como todo objeto, tienen sus colaboradores internos y su clase.

# C´omo funciona el new

Dada la siguiente implementaci´on:

Person class >> newWithName: nombre instancia := (self new). instancia firstName: nombre. nInstancias := nInstancias + 1. ∧ instancia.

¿Qu´e ocurre si ejecutamos la siguiente colaboraci´on? Person newWithName: 'roberto'

# Closures

Permiten representar un conjunto de colaboraciones. En definitiva, es segmento de c´odigo al cual no me importa ponerle un nombre (y tiene algunas caracter´ısticas m´as, que veremos luego).

# Sintaxis

¿Bloque, Lambda o Closure?

Bloque: t´ermino gen´erico, designa una porci´on de c´odigo. Expresi´on lambda: proveniente del mundo funcional (Lisp). Closure: bloque con un entorno capturado, que tambi´en es un objeto, ¡obviamente!

# Closures: Seguimiento

Los closures se ligan al contexto de ejecuci´on donde son creados.   
Tanto las variables como el return.

# Ejercicio

¿Qu´e retorna cada env´ıo de #value en el siguiente c´odigo si ejecutamos B new m2? ¿Qu´e devuelve?

$$
\begin{array} { r l } & { \gg \textnormal { m } 1 } \\ & { \left. \begin{array} { l } { \textnormal { x } \textnormal { y } \mid } \\ { \textnormal { y } : = \textnormal { 0 } . } \end{array} \right. } \\ & { \textnormal { x } : = \textnormal { [ y } : = \textnormal { y } + \textnormal { 1 } ] \textnormal { . } } \\ & { \land \textnormal { x } . } \end{array}
$$

B >> m2 | a aBlock anotherBlock a := A new. aBlock := a m1. aBlock value. aBlock value. anotherBlock := a m1. anotherBlock value. ∧ aBlock value.

# Closures: Ejercicios

Implementar los siguientes mensajes en donde corresponda:

#curry

#timesDo:

# Ejemplos

|currificado nuevo| currificado : $=$ [ :x :res | x + res ] curry.   
nuevo : $=$ currificado value: 10.   
nuevo value: 2.   
La ´ultima expresi´on debe evaluarse a 12. |count copy|   
count : $\qquad = \ 0$ .   
10 timesDo: [copy := count. count := count + 2]. Al terminar, count debe valer 20, y copy debe ser 18.

# Ejercicios Integer - Seguimiento

# Implementar

Implementar el m´etodo fact en donde corresponda para que los n´umeros sepan responder a este mensaje que obtiene el factorial del n´umero.

# Seguimiento

Realizar un seguimiento de la expresi´on 3 fact y hacer el diagrama de secuencia correspondiente.

Con esa informaci´on, completar la siguiente tabla:

<table><tr><td>Mensaje</td><td>Receptor</td><td>Colaboradores</td><td>Resultado</td></tr><tr><td>fact</td><td>3</td><td>：</td><td>·</td></tr><tr><td>：</td><td></td><td>·</td><td>：</td></tr><tr><td>：</td><td></td><td></td><td>：</td></tr></table>

# Colecciones

# Algunas conocidas

Bag (Multiconjunto)   
Set (Conjunto)   
Array (Arreglo)   
OrderedCollection (Lista)   
SortedCollection (Lista ordenada)   
Dictionary (Hash)

Los mensajes #with: with: ...

Forma de crear estas colecciones.

# Ejemplo

Bag with: 1 with: 2 with: 4   
#(1 2 4) $=$ (Array with: 1 with: 2 with: 4)   
Bag withAll: #(1 2 4)

$$
3 3
$$

# Mensajes m´as comunes

add: agrega un elemento.   
at: devuelve el elemento en una posici´on.   
at:put: agrega un elemento a una posici´on.   
includes: responde si un elemento pertenece o no.   
includesKey: responde si una clave pertenece o no.

# Colecciones

Mensajes m´as comunes

do: eval´ua un bloque con cada elemento de la colecci´on.

keysAndValuesDo: eval´ua un bloque con cada par clave-valor.

keysDo: eval´ua un bloque con cada clave.

select: devuelve los elementos de una colecci´on que cumplen un predicado (filter de funcional).

reject: la negaci´on del select:.

collect: devuelve una colecci´on que es resultado de aplicarle un bloque a cada elemento de la colecci´on original (map de funcional).

detect: devuelve el primer elemento que cumple un predicado.

detect:ifNone: como detect:, pero permite ejecutar un bloque si no se encuentra ning´un elemento.

reduce: toma un bloque de dos o m´as par´ametros de entrada y hace fold de los elementos de izquierda a derecha (foldl de funcional).

# Colecciones: Map

# El mensaje #do:

La forma de iterar queda definida por la colecci´on

# #map:

Implementemos el siguiente m´etodo en la clase Collection:

map: aBlock

Al ejecutarse, retorna la colecci´on resultante de aplicar ese bloque a cada elemento de la colecci´on original.

Ejemplo: res debe contener 6, 7 y 9 luego de ejecutar lo siguiente

| s res| s : $=$ Set with: 1 with: 2 with: 4. res := s map: [ :x | x + 5 ].

¿C´omo se decide qu´e clase de colecci´on usar para el resultado, si el receptor podr´ıa ser de cualquier subclase?

¿C´omo se logra acceder desde el bloque al resultado parcial?

# Colecciones: M´ınimo

# #minimo:

Agregar a la clase Collection un m´etodo con la siguiente interfaz:

minimo: aBlock

aBlock es un bloque con un par´ametro de entrada cuya evaluaci´on devuelve un n´umero.

El m´etodo debe evaluar el bloque en todos los elementos de la colecci´on receptora, y devolver el m´ınimo de todos los valores obtenidos.

Se asume que la colecci´on receptora no est´a vac´ıa.

¿C´omo inicializar un primer valor?

¿Funciona para Set?

# Colecciones: M´ınimo Posible soluci´on

minimo: aBlock | minElement minValue | self do: [:each | | val | minValue ifNotNil: [ (val : $=$ aBlock value: each) $<$ minValue ifTrue: [ minElement : $=$ each. minValue : $=$ val]] ifNil: ["first element" minElement : $=$ each. minValue : $=$ aBlock value: each]. ]. ^minElement

# El mensaje collect:

¿Qu´e devuelven las siguientes colaboraciones?

▶ #hola collect: [ :x | Unicode toUppercase: x ]. (Interval from: 1 to: 5) collect: [ :x | x\*2 ].

Pista: los s´ımbolos e intervalos son inmutables.

Ve´amoslo en el entorno.

# El mensaje species

Las clases Interval y ByteSymbol redefinen el m´etodo species para poder responder a collect:.

Interval >> species   
^Array.   
ByteSymbol >> species ^ByteString.

¿C´omo se implementa el ifTrue:?

Recordar: Boolean tiene dos subclases.

![](images/6ef85038d838125c848f2d88c47c16a7c0b71939316723836a936d2399de4c64.jpg)

True >> ifTrue: unBloque ^unBloque value.

False >> ifTrue: unBloque ^nil.

# Otros m´etodos de Boolean

ifFalse:   
ifTrue:ifFalse:   
&   
|   
and:   
or:   
not   
¿Por qu´e habr´ıa and: y or: si ya hay & y |?   
¿Por qu´e los booleanos no entienden el mensaje whileTrue:?   
¿Qu´e objetos lo entienden?   
¿D´onde est´a implementado el m´etodo?

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

# Lectura recomendada

Cap´ıtulos 1–4 del libro de Goldberg y Robson.

Adele Goldberg y David Robson. Smalltalk-80: the language and its implementation.

Addison-Wesley, 1983.