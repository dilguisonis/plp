# Paradigmas de Programaci´on

Programaci´on orientada a objetos

2do cuatrimestre de 2025 Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

# 1

Introducci´on

# Conceptos fundamentales de POO

$$
2
$$

# Introducci´on a la POO en Smalltalk

# Distintos modos de concebir la programaci´on

Los paradigmas que hemos visto se fundamentan en la l´ogica:

Programaci´on funcional los programas son demostraciones.   
Programaci´on l´ogica los programas son f´ormulas.

# Programaci´on orientada a objetos

Se inspira en otras varias disciplinas. Por ejemplo:

Biolog´ıa: adaptabilidad y resiliencia de los organismos vivos.   
Arquitectura: dise˜no de “catedrales en lugar de pir´amides”.

Los programas est´an conformados por componentes, llamadas objetos, que interact´uan intercambiando mensajes.

Las entidades f´ısicas o conceptuales del dominio del problema que se quiere modelar se representan como objetos.

El comportamiento de los objetos debe reflejar fielmente aquellos aspectos que nos interesan de las entidades de la “realidad”.

# Breve perspectiva hist´orica

La POO surgi´o alrededor de 1970 para abstraer t´ecnicas comunes de la programaci´on procedural:

1. Pasaje de registros1 para permitir c´odigo reentrante. (Alternativa superadora a las variables globales).   
2. Agrupamiento de las funciones en m´odulos.   
3. Polimorfismo por indirecci´on: un registro contiene punteros a funciones que lo manipulan.

Algunos lenguajes orientados a objetos muy influyentes:

Simula . Dahl & Nygaard, ∼1967   
Smalltalk . Kay, ∼1972   
▶ Self Ungar & Smith, ∼1987

$$
4
$$

Introducci´on

Conceptos fundamentales de POO

Introducci´on a la POO en Smalltalk

# 5

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

Cada clase es subclase de alguna otra clase. Las clases se estructuran en una jerarqu´ıa. Por ejemplo:

![](images/1108e56c8664deb3e8f184a65159d5b29570f24f07c251976b48ed08d50410fd.jpg)

Una clase hereda todos los m´etodos de su superclase.

Una clase puede elegir reemplazar4 un m´etodo definido en la superclase por otro m´as espec´ıfico.

Hay clases que est´an destinadas a abstraer el comportamiento de sus subclases, pero no tienen instancias (p. ej. la clase Number). Estas se llaman clases abstractas.

Introducci´on

Conceptos fundamentales de POO

Introducci´on a la POO en Smalltalk

# 12

# Ejemplos b´asicos

Evaluemos los siguientes comandos:

1. 1 + 2   
2. 1 + 2 \* 3   
3. 1 class   
4. 1 class superclass   
5. 3 squared / 2 squared   
6. a := Array new: 10   
7. a at: 1 put: ’hola’   
8. a at: 1

(Cuidado con la precedencia)

(Juguemos un poco con el entorno)

Definamos una clase Par y los siguientes m´etodos:

1. Par x: unObjeto y: otroObjeto — construye un par.   
2. par x, par y — proyectan las componentes.   
3. par + otroPar — suma dos pares   
4. ¿Qu´e sucede si anidamos pares y usamos la suma?

# Ejercicios

1. Agregar a la clase Collection un m´etodo map: aBlock. Devuelve una colecci´on, de la misma “especie”, que resulta de aplicar el bloque a cada elemento de la colecci´on receptora. 2. Agregar a la clase Collection un m´etodo minimo: aBlock. Devuelve el m´ınimo valor de evaluar el bloque en los elementos de la colecci´on receptora.

# Sintaxis de expresiones y comandos

Smalltalk es un entorno orientado a objetos.   
No es tan apropiado pensarlo como un lenguaje.   
Pero necesitamos una sintaxis concreta para describir los m´etodos.

Sintaxis “m´ınima” de expresiones y comandos

Expr ::= x nombre local | X nombre global Expr msg mensaje unario Expr ⟨op⟩ Expr mensaje binario Expr msg1:Expr1 . . . msgN:ExprN mensaje keyword x := Expr asignaci´on   
Cmd ::= Expr expresi´on | ∧Expr retorno 1 Expr. Cmd secuencia Los nombres locales se refieren a variables, atributos y par´ametros.   
Precedencia: mensajes unarios > binarios > keyword.

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

3. Modifiquemos el condicional para que opere con bloques.

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

1. robot undo — deshace el ´ultimo desplazamiento5.

Nos vemos obligados a reemplazar6 los m´etodos initialize y posicion. Pero no queremos copiar y pegar el c´odigo.

# Super

La palabra reservada super se refiere al mismo objeto que self. Pero super m indica que la b´usqueda del m´etodo que implementa el mensaje m debe comenzar desde la superclase de la clase actual.

$$
^ { 2 2 }
$$

# Algoritmo de resoluci´on de m´etodos (method dispatch)

# Entrada

O: objeto al que se le desea enviar un mensaje. S: selector del mensaje que se desea enviar. (P.ej.: at:put:) C : clase en la que se desea buscar el m´etodo.

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

# Ejercicio — Streams

Un stream es un objeto que representa una sucesi´on infinita. Acepta un mensaje prox, que devuelve el elemento actual y avanza al siguiente elemento. Definimos una jerarqu´ıa de clases:

![](images/cea015b7e8d8b58aad6a8be58a3f0522f7333055f79beacc6cbdcc2f2204ffc9.jpg)

1. Progresi´on desde: x aplicando: bloque — construye un stream que tiene a x como primer elemento y calcula el siguiente elemento usando el bloque.

2. Cons cabeza: unElemento cola: unStream — extiende al stream dado con un elemento en la cabeza.

3. Intercalaci´on entre: s1 y: s2 — construye un stream que alterna entre los elementos de s1 y los de s2.

4. (M´as dif´ıcil). Definir un m´etodo para implementar el mensaje dividir, que devuelve dos streams que intercalados resultar´ıan en el stream original.

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

# Lectura recomendada

Cap´ıtulos 1–4 del libro de Goldberg y Robson.

Adele Goldberg y David Robson. Smalltalk-80: the language and its implementation.

Addison-Wesley, 1983.