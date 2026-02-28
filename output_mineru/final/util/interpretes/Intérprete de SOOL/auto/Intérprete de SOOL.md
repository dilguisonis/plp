# Eduardo Bonelli

Departamento de Computación FCEyN UBA

7 de noviembre de 2006

• Vamos a introducir los conceptos fundamentales del paradigma

。 Objetos,clases,modelo de cómputo, herencia Polimorfismo de subclase y dynamic method dispatch • Super y static method dispatch

• llustraremos estos ejemplos con el lenguaje SOOL • Es una extensión de SFLA con orientación a objetos • Vamos a implementar un intérprete para SOOL

• Vamos a presentar los problemas principales asociados a los sistemas de tipos para lenguajes orientados a objetos

· Algunos conceptos relevantes son:

• Sistema de tipos invariantes Subsumption como subclassing Covarianza y contravarianza ， Falla de Type Safety para Java • El “Binary Method Problem"

• Completaremos la visión del paradigma usando Smalltalk (Präctica)

• Entre los temas más destacados de este eje se encuentra el de desarrollo de sistemas de tipos y semántica para lenguajes OO

· Dos textos sobre el tema:

A THEORY OF OBJECTS, Martin Abadi y Luca Cardelli, Monographs in Computer Science, David Gries and Fred B. Schneider ed., Springer-Verlag，1996   
FOUNDATIONS OF OBJECT-ORIENTED PROGRAMMING LANGUAGES: TYPES AND SEMANTICS, Kim B. Bruce, The MIT Press, 2002

• Un survey (no tan reciente pero relevante) sobre sistemas de tipos para lenguajes OO:

THE DEVELOPMENT OF TYPE SYSTEMS FOR OBJECT-ORIENTED LANGUAGES, Kathleen Fisher y John C.Mitchell,Theory and Practice of Object Systems,1(3): 189-220, 1996

• Disponible en la pägina personal del primer autor

ObjetosyClases   
Modelo de computo   
Herenciay polimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding

Un sistema orientado a objetos es un conjunto de objetos que interactuan entre si para lograr algun objetivo predefinido

+ Lenguajes orientados a objetos se usan para implementar sistemas orientados a objetos

Para poder estudiar estos lenguajes: . Debemos comprender qué son los objetos,cómo se especifican y cómo se clasifican Debemos,asimismo,conocer el modelo de cómputo: iDe qué manera pueden interactuar los objetos?

ObjetosyClases   
Modelo de computo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding

Un objeto se especifica a través de:

● Un conjunto de funciones (usualmente llamadas métodos) que determinan su interfase o protocolo

• Un conjunto de campos o atributos que representan su estado

Principio bäsico heredado de los Tipos Abstractos de Datos, antecesores de los Objetos y Clases:

# Principio de ocultamiento de la informacion

El estado de un objeto es privado y solamente puede ser consultado o modificado a traves de los métodos provistos por su interfase

ObjetosyClases   
Modelo de computo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding

Para facilitar compartir métodos entre objetos de la misma naturaleza, los objetos se suelen especificar a traveés de clases.

La clases son estructuras que especifican los campos y   
métodos de los objetos (llamados variables de instancia y   
métodos de instancia, resp.)   
Cada objeto es una instancia de alguna clase   
Las clases pueden verse como “moldes” de objetos, cada uno   
de los cuales es creado a su semejanza   
Las clases también pueden tener sus propios campos (variables   
de clase o estaticas) y métodos (métodos de clase)   
ObjetosyClases   
Modelo de computo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding

class point extends object field x field y method initialize (initx,inity) begin set $\mathrm { ~ \tt ~ { ~ x ~ } ~ } =$ initx; set $\textrm { y } =$ inity end method move (dx,dy) begin set set $\begin{array} { r } { \mathrm { \bf ~ x } = + ( \mathrm { \bf x } , \mathrm { d } \mathrm { \bf x } ) ; } \\ { \mathrm { \bf ~ y } = + ( \mathrm { \bf y } , \mathrm { d } \mathrm { \bf y } ) } \end{array}$ end method get_location () list(x,y)

ObjetosyClases   
Modelo de computo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding

Cada clase consiste de

un nombre y el nombre de la clase que extiende O una lista de declaraciones de campos ● una lista de declaraciones de métodos · por cada método se especifica

• su nombre • parämetros formales

● initialize es un método especial que se invoca cuando un objeto es creado

ObjetosyClases   
Modelo de computo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding   
class point extends object field x field y method initialize (initx,inity) begin set $\mathrm { ~ \tt ~ { ~ x ~ } ~ } =$ initx; set $\textrm { y } =$ inity end method move (dx,dy) begin set $\begin{array} { r } { \mathrm { \bf ~ x } = + ( \mathrm { \bf x } , \mathrm { d } \mathrm { \bf x } ) ; } \\ { \mathrm { \bf ~ y } = + ( \mathrm { \bf y } , \mathrm { d } \mathrm { \bf y } ) } \end{array}$ set end method get_location () list(x,y)   
let $\mathrm { ~ p ~ } =$ new point(3,4) in p

indice tematico Nociones basicas SOOL

Objetos y Clases   
Modelo decomputo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding

# Pasaje de mensajes como modelo de computo

• La interaccion entre objetos se lleva a cabo a través de pasaje de mensajes

• Llamar al método de un objeto se interpreta como enviar un mensaje a ese objeto que consiste en:

• el nombre del método • los argumentos o parámetros reales

• Por ejemplo, en la expresión

send pump depress(5)

· pump es el objeto receptor · depress(5) es el mensaje que se envia

。 En este caso, el mensaje consiste en un nombre de método (depress) y argumentos (5)

Supongamos que un objeto envia el mensaje: send o m(e1,e2)

Para poder realizar procesar este mensaje es necesario hallar la declaración del método que se pretende ejecutar

# Method Dispatch

El proceso de establecer la asociación entre el mensaje y el método a ejecutar se llama method dispatch

。 Si el method dispatch se hace en tiempo de compilación (i.e. el método a ejecutar se puede determinar a partir del código fuente): se habla de method dispatch estätico ejecución: se habla de method dispatch dinämico

Objetosy Clases   
Modelodecomputo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding   
class interior_node extends object   
field left,right   
method initialize (l,r) begin set left = 1; set right = r end   
method sum() $^ +$ (send left sum(), send right sum())   
class leaf_node extends object   
field value   
method initialize (v) set value = v   
method sum (） value   
Objetosy Clases   
Modelodecomputo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding   
class interior_node let o1 = new interior_node( extends object new interior_node(   
field left,right new leaf_node(3),   
method initialize (l,r) new leaf_node(4)), begin new leaf_node(5)) set left = 1; in send o1 sum() set right = r; end   
method sum() $^ +$ (send left sum(), send right sum())   
class leaf_node extends object   
field value   
method initialize (v) set value = v   
method sum () value   
Objetosy Clases   
Modelo decomputo   
Herenciaypolimorfismo   
Super y Method Dispatch Estatico   
Overloadingyoverriding

# Jerarquia de clases

• Es comun que nuevas clases aparezcan como resultado de la extensión de otras existentes a través de la

● adición o cambio del comportamiento de un método • adición de nuevos campos

• Una clase puede heredar de o extender una clase pre-existente (la superclase)

• Si una clase c2 hereda de otra c1, todos los campos y métodos de c1 serán visibles desde c2, salvo que sean redeclarados

· Por ello, la herencia promueve el reuso de código • La transitividad de la herencia da origen a las nociones de ancestros y descendientes

Objetosy Clases   
Modelo decomputo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding

• Hay dos tipos de herencia

· Simple: una clase tiene una unica clase padre (salvo la clase raiz object) • Multiple: una clase puede tener más de una clase padre

• La gran mayoria de los lenguajes OO utilizan herencia simple Si bien en algunas situaciones puede ser itil, el mayor inconveniente con herencia multiple es que una clase puede tener dos o más superclases con métodos del mismo nombre Determinar cual de los métodos se heredan es, en el mejor de los casos, arbitrario

class point extends object field x, y method initialize (initx,inity) begin set $\begin{array} { r l } { \mathbf { x } } & { { } = } \end{array}$ initx; set $\mathtt { y } =$ inity end method move (dx,dy) begin set $\textbf { x } = \mathbf { \kappa } + ( \mathbf { x } _ { \mathbf { \kappa } } , \mathbf { d } \mathbf { x } )$ ； set $\tt { y } = \tt { + } ( \tt { y } , \tt { d } \tt { y } )$ end method get_location () list(x,y)   
class colorpoint extends point field color method set_color (c） set color = c method get_color (） color   
Objetosy Clases   
Modelo de computo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding   
Objetosy Clases   
Modelodecomputo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding   
class point extends object field x, y method initialize (initx,inity) begin let $\tt { p } =$ new point(3,4); set $\begin{array} { r l } { \mathbf { x } } & { { } = } \end{array}$ initx; $\tt c p =$ new colorpoint(10,20) set $\mathtt { y } =$ inity in begin end send p move(3,4); method move (dx,dy) send cp set_color(87); begin send cp move(10,20); set $\textbf { x } = \mathbf { \kappa } + ( \mathbf { x } _ { \mathbf { \kappa } } , \mathbf { d } \mathbf { x } )$ ； list (send p get_location (), set $\tt { y } = \tt { + } ( \tt { y } , \tt { d } \tt { y } )$ send cp get_location (), end send cp get_color ())） method get_location () list(x,y) end   
class colorpoint extends point field color method set_color (c) set color = c method get_color (） color   
Objetosy Clases   
Modelo decomputo   
Herenciaypolimorfismo   
Super y Method Dispatch Estatico   
Overloadingyoverriding   
class c1 extends object field x,y method initialize () 1 method setx1 (v） set $\mathrm { ~ \bf ~ x ~ } = \mathrm { ~ \bf ~ v ~ }$ method sety1 (v） set $\texttt { y } = \texttt { v }$ method getx1 () x method gety1 () y   
class c2 extends c1 field y method sety2 (v) set $\texttt { y } = \texttt { v }$ method getx2 () x method gety2 () y   
let $\scriptscriptstyle { 0 . 2 } =$ new c2()   
in begin send o2 setx1(100); send o2 sety1(102); send o2 sety2(999); list(send o2 getx1(); send o2 gety1(); send o2 getx2(); send o2 gety2()) end

indice tematico Nocionesbasicas SOOL

Objetosy Clases   
Modelo decomputo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding

# Polimorfismode subclase

Una instancia de cualquier descendiente de una clase puede utilizarse en lugar de una instancia de la clase misma

Polimorfismo de subclase se implementa a través de method dispatch dinämico

esto es consecuencia de que el método a ejecutar no puede ser determinado sin conocer el objeto receptor del mensaje . esto ültimo solo puede conocerse en tiempo de ejecución

Objetosy Clases   
Modelo de computo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding

<table><tr><td>method initialize () 1</td><td>class c1 extends object</td></tr><tr><td>method m1 () 1</td><td></td></tr><tr><td>method m2 () send self m1()</td><td></td></tr><tr><td>class c2 extends c1</td><td></td></tr><tr><td>method m1 () 2</td><td></td></tr><tr><td>let o1 = new c1()</td><td></td></tr><tr><td>02 = new c2()</td><td></td></tr><tr><td>in list(send o1 m1(),</td><td></td></tr><tr><td>send o2 m1(),</td><td></td></tr><tr><td>send o2 m2())</td><td></td></tr><tr><td></td><td></td></tr></table>

Nota: el identificador self se liga al objeto receptor del mensaje

class c1 extends object method intialize () 1 method m1 (） 1 method m2 (） 100 method m3 () send self m2()   
class c2 extends c1 method initialize () 1 method m2 (） 2   
let o1 $=$ new c1() 02 = new c2()   
in list(send o1 m1(), send o1 m2(), send o1 m3(), send o2 m1(), send o2 m2(), send o2 m3())   
Objetosy Clases   
Modelodecomputo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding   
Objetosy Clases   
Modelo de computo   
Herenciaypolimorfismo   
SuperyMethod Dispatch Estatico   
Overloadingyoveriding   
. Method dispatch dinämico es uno de los pilares de la POO (junto con la noción de clase y de herencia) Por cuestiones de eficiencia (o diseno,como el caso de C++) muchos lenguajes también cuentan con method dispatch estatico   
. Sin embargo,hay algunas situaciones donde method dispatch estätico se requerido,más allä de cuestiones de eficiencia La sentencia que ejemplifica esto es el super   
Objetosy Clases   
Modelo de computo   
Herenciay polimorfismo   
SuperyMethod Dispatch Estatico   
Overloadingyoveriding

Supongamos que queremos extender la clase point del siguiente modo:

class colorpoint extends point field color method initialize (initx, inity,initc) begin set $\mathrm { ~ x ~ } =$ initx; set $\mathtt { y } =$ inity; set color $=$ initc end method set_color (c) ... method get_color () ...

ObjetosyClases   
Modelo de computo   
Herenciaypolimorfismo   
SuperyMethodDispatch Estatico   
Overloadingyoverriding

• jEl cuerpo de initialize duplica código innecesariamente!

Esto es un ejemplo claro de mala präctica de programación en   
función a la presencia de herencia   
Deberiamos recurrir al código ya existente del método   
initialize de point para que se encargue de la   
inicialización de x e y   
iLa siguiente variante funciona?   
class colorpoint extends point field color method initialize (initx,inity) begin send self initialize(initx,inity); set color $=$ "azul" end method set_color (c） .. method get_color ()   
Objetosy Clases   
Modelo de computo   
Herenciay polimorfismo   
SuperyMethodDispatch Estatico   
Overloadingyoveriding   
clase anfitriona de un método: clase donde se declara el   
método   
Una expresión de la forma super s(...） que aparece en el   
cuerpo de un método m invoca el método s del padre de la   
clase anfitriona de m   
El código correcto deberia ser   
class colorpoint extends point field color method initialize (initx, inity) begin super initialize(initx,inity); set color $=$ "azul" end method set_color (c) ... method get_color (） ...   
Objetosy Clases   
Modelo de computo   
Herenciay polimorfismo   
SuperyMethodDispatch Estatico   
Overloadingyoveriding   
? Una expresión de la forma super s(...） se dice llamado super Un llamado super es similar a un llamado a self en el sentido que el objeto receptor es self en ambos casos Sin embargo，method dispatch es estatico en el primero caso y dinämico en el ultimo   
• Vamos a ver un ejemplo que ilustre esta diferencia   
Objetosy Clases   
Modelo de computo   
Herenciay polimorfismo   
SuperyMethodDispatch Estatico   
Overloadingyoveriding   
class c1 extends object method initialize () 1 method m1 () send self m2() method m2 (） 13   
class c2 extends c1 method m1 (） 22 method m2 (） 23 method m3 (） super m1 ()   
class c3 extends c2 method m1 (） 32 method m2 (） 33   
let 03 $=$ new c3()   
in send o3 m3()

# Method Overloading (Sobrecarga de Métodos)

Facilidad que le permite a una clase tener multiples métodos con el mismo nombre, siempre y cuando tengan diferente signaturas

. La signatura de un método tipicamente consiste en • el nombre del método · el numero de parámetros • el tipo de los parámetros y del resultado

Esta noción tambien existe en lenguajes imperativos y funcionales

A veces lleva el nombre de ad-hoc polymorphism

Objetosy Clases indice tematico Modelo de computo Nociones basicas Herenciaypolimorfismo SOOL Supery Method Dispatch Estatico Overloadingyoverriding

# Method Overloading (Sobrecarga de Métodos)

class colorpoint extends point field color method initialize (initx,inity，initc) begin super initialize(initx,inity); set color $=$ initc end method initialize (initx,inity) begin super initialize(initx,inity); set color $=$ "azul" end

Objetosy Clases   
Modelo de computo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding

# Main

A x;   
x=new B();   
System.out.print(x.m(5));

# Output

20

public class A { public int m(float x) { return 10; }；   
}   
public class B extends A { public int m(float x) { return 20; }；   
}   
Objetosy Clases   
Modelo de computo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding

# Main

A x;   
x=new B();   
System.out.print(x.m(5));

# Output

public class A { public int m(int x) { return 10; }；   
}   
public class B extends A { public int m(float x) { return 20; }；   
}

# Method Overide (Redefinicionde Métodos)

Facilidad que le permite a una clase redefinir un método o   
campo heredado   
El método redefinido,en general,agrega comportamiento   
especifico de la subclase   
Es aconsejable que el método redefinido tenga relacion l6gica   
con el método que se redefine   
En la presencia de sistemas de tipos,la signatura del método   
redefinido debe“parecerse"a la del método a redefinir   
(veremos mäs detalles en la clase de sistemas de tipos para   
lenguajes OO)

indice tematico Nociones basicas SOOL

Objetosy Clases   
Modelodecomputo   
Herenciaypolimorfismo   
Supery Method Dispatch Estatico   
Overloadingyoverriding

# Method Overide (Redefinicionde Métodos)

![](images/6001f03f8f561431427b5ee029a591a0b9d13dca001ac1a6debf99dec9ef4696.jpg)

• Introduciremos el lenguaje SOOL • Es una extensión de SFLA con orientación a objetos • En particular agrega primitivas para

declarar clases, atributos y métodos crear nuevas instancias de una clase ● mandar mensajes a objetos ● referirse a super y self

• La clase que viene vamos a implementar un intérprete para SOOL

Extendemos SFL con las siguientes producciones:

Observar que la nueva gramatica:

· Incluye una sentencia begin-end <expr> :: $=$ begin <expr> ; <expr>(\*) end Las expresiones se evaluan en orden y se retorna el valor de la ultima de ellas   
Incluye primitivas de procesamiento de listas <primitive> ::= ... | list | cons | nil l head | tail | null?

Recordar

Valores expresados: valores que pueden resultar de la evaluación de las expresiones del lenguaje

Valores denotados: valores que se pueden asignar a las variables

En SOOL tenemos

Valores Expr. = Number + ProcVal + Obj + List(Valores   
Expr.)   
Valores Den. = Ref(Expressed Value)