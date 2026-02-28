# Paradigma de Objetos:

# Objetos que colaboran entre sí enviándose mensajes

# Objetos en Smalltalk

Un objeto expone un protocolo de mensajes, que conforma el conjunto de operaciones que realiza el objeto. La forma de interactuar con un objeto es enviándole mensajes. Un objeto oculta sus datos propios, que sólo son accesibles desde las operaciones del objeto.

![](images/fd84b580beba15d6b165f641fb61389830e688c685a64f1cbb5a51ace334f067.jpg)

# Objetos elementales

En Smalltalk todo es un objeto.

Muchos elementos que en otros lenguajes son valores de tipos de datos primitivos, están implementados en Smalltalk como objetos. Pertenecen a esta categoría, entre otros, los números, los strings, los caracteres, los booleanos y los arrays.

No obstante, hay ciertas construcciones sintácticas (del lenguaje) que denotan objetos. Estas construcciones, denominadas literales, permiten crear los objetos elementales de manera sencilla. Éstos son algunos objetos elementales:

<table><tr><td rowspan=1 colspan=1>Objeto</td><td rowspan=1 colspan=1>Descripcion</td></tr><tr><td rowspan=1 colspan=1>37</td><td rowspan=1 colspan=1>El entero 37</td></tr><tr><td rowspan=1 colspan=1>‘Ser o no ser&#x27;</td><td rowspan=1 colspan=1>Un string con el texto“Ser o no ser&quot;</td></tr><tr><td rowspan=1 colspan=1>2.71828</td><td rowspan=1 colspan=1>El punto flotante 2.71828</td></tr><tr><td rowspan=1 colspan=1>$p</td><td rowspan=1 colspan=1>El caracterp</td></tr><tr><td rowspan=1 colspan=1>true</td><td rowspan=1 colspan=1>El valorbooleano trae</td></tr><tr><td rowspan=1 colspan=1>#(123)</td><td rowspan=1 colspan=1>Unarray con los numeros1,2y 3</td></tr><tr><td rowspan=1 colspan=1>#new</td><td rowspan=1 colspan=1>El simbolo new</td></tr></table>

Un símbolo en Smalltalk es una secuencia de 1 o más caracteres que comienza con un #. A diferencia de los strings, no existen dos símbolos con la misma secuencia de caracteres.

# Variables y asignación

 Una variable es un puntero o referencia a un objeto o instancia.

![](images/ae55589696c3cba0c5adea87f15192ebf7edad07bdbded4fb0f80eaa0bb87e30.jpg)

Las variables son un nombre que empieza con minúscula (los identificadores que empiezan con mayúscula son variables globales, reservadas para el ambiente).   
Las variables en Smalltalk no tienen tipo. Ejemplos: anObject   
a   
x   
miConjunto trulala112

La asignación de la referencia a un objeto a una variable se hace con el símbolo := Sintaxis:

variable := objeto

Ejemplos:

a := #(1 2 3) unNúmero := 23.3

 Las variables sin asignar apuntan al objeto elemental nil.

Variables globales. Las variables globales son accesibles desde cualquier scope. Se identifican porque empiezan con mayúscula.

A := 1

¡Atención!: no es una buena práctica usar variables globales para almacenar datos de programas. Tienen ciertos usos específicos relacionados con el ambiente (como mantener las referencias a las clases, que veremos luego).

# Mensajes

Cuando se le pide a un objeto que haga algo, se le está enviando un mensaje. Un mensaje tiene un nombre de operación o selector y un conjunto de argumentos. Sintáxis de la invocación de mensajes:

# Tipos de mensajes:

<table><tr><td rowspan=1 colspan=1>Tipo demensaje</td><td rowspan=1 colspan=1>Ejemplo</td><td rowspan=1 colspan=1>Selector</td></tr><tr><td rowspan=1 colspan=1>unario</td><td rowspan=1 colspan=1>&#x27;pitufo&#x27;reverse</td><td rowspan=1 colspan=1>reverse</td></tr><tr><td rowspan=1 colspan=1>binarios</td><td rowspan=1 colspan=1>17&lt;= 14</td><td rowspan=1 colspan=1>&lt;=</td></tr><tr><td rowspan=1 colspan=1>keyword</td><td rowspan=1 colspan=1>miCuenta transferir: 3o0 a: otraCuenta</td><td rowspan=1 colspan=1>transferir:a:</td></tr></table>

<table><tr><td>Nota： minusculas!</td></tr></table>

# Precedencia de mensajes:

 primero unarios, depués binarios y por último keyword  asociatividad de izquierda a derecha

Ejemplos:   

<table><tr><td rowspan=1 colspan=1>Expresion</td><td rowspan=1 colspan=1>Evaluacion</td></tr><tr><td rowspan=1 colspan=1>5+6*2</td><td rowspan=1 colspan=1>(5 + 6)*2 = 22</td></tr><tr><td rowspan=1 colspan=1>#(6 5432 1) at: 2*3</td><td rowspan=1 colspan=1>#(6 5 4 3 2 1) at: (2* 3) = 1</td></tr><tr><td rowspan=1 colspan=1>‘iglu de mijo&#x27; size * 4 between: 6 negated and: 3factorial * 5</td><td rowspan=1 colspan=1>((iglu de mijo&#x27; size) *4) between: (6 negated) and:(3 factorial) *5) = false</td></tr></table>

# “Todo es un objeto” (I)

 Los enteros son objetos

7 + 4

El mensaje $^ { 6 } +$ 4” es enviado al objeto 7. Eventualmente, cuando finaliza la ejecución de la operación, se devuelve otro objeto, el objeto 11.

Todos los argumentos y los objetos respuesta de los mensajes son objetos  Los mensajes son objetos

Nota: los enteros, así como otros valores numéricos, son inmutables, es decir no cambian nunca. Otros objetos como las cuentas bancarias son mutables.

# Efecto y respuesta de enviar un mensaje

En Smalltalk, el resultado normal de mandar un mensaje a un objeto es obtener otro objeto como respuesta.

Enviar un mensaje tienen dos consecuencias: 1) Algo ocurre, es decir, la operación tiene un efecto 2) Un objeto se devuelve como respuesta

# Effect vs. return

En ciertos mensajes es más importante el efecto que producen que el objeto que devuelven como resultado

Ejemplo:

7 storeOn: someFile

El mensaje tiene el efecto de guardar el objeto 7 en algún archivo en el disco al que hace referencia someFile. El efecto es el propósito del mensaje.

 En otros mensajes el efecto no tiene importancia y lo que realmente interesa es el resultado.

Ejemplo:

7 factorial

En este caso lo que nos interesa es lo que devuelve el mensaje.

# Print it vs. Do it

Al evaluar una expresión en Smalltalk se puede explicitar si sólo interesa el efecto de un mensaje o si también interesa la respuesta.

Print it: el efecto del mensaje ocurre y Smalltalk muestra la respuesta en la pantalla Do it: el efecto del mensaje ocurre pero Smalltalk descarta el objeto obtenido como respuesta

Ejemplos:

<table><tr><td>a := #(1 2 3) copy.</td><td>Crea un arreglo con los numeros 1, 2 y 3.</td></tr><tr><td>a at: 1 put: 5.</td><td>Pone en la primera posicion de A el entero 5. Nos importa el efecto</td></tr><tr><td></td><td></td></tr><tr><td>a at: 1.</td><td>Pide la primera posicion de A. Nos importa lo que devuelve</td></tr></table>

Nota: Los literales de Arrays generan arreglos inmutables. Por eso usamos copy, que crea otro arreglo con el mismo contenido, pero mutable.

# Cascada de mensajes:

 Para enviar varios mensajes al mismo objeto.   
 Se separan con ;

Sintaxis:

![](images/1c2cd9dffed659ec0f001f8fc2a86b416c4e32f242bac81943b673cb6f04ed81.jpg)

Ejemplos:

Transcript cr; show: 'Ser '; show: 'o no '; show: 'ser...'; cr.

'salt' copy at: 1 put: \$m; yourself.

yourself pide al objeto receptor que se devuelva a sí mismo.

# Definición de Objetos en Smalltalk

Vimos cómo se opera con objetos.   
Programar en Smalltalk consiste en definir nuevos objetos. Estas definiciones de objetos son las clases.

# Clases

 Los objetos se crean a partir de una clase. La clase define el comportamiento de los objetos de esa clase. Los objetos construidos a partir de la misma clase tienen el mismo comportamiento La clase también define los datos propios de los objetos de esa clase. A los objetos de una clase A se los llama instancias de A. Los datos propios de un objeto se almacenan en variables de instancia. Los datos compartidos por todas las instancias de una clase se almacenan en variables de clase. Son accesibles por cualquier operación de la clase y de la instancia.

# “Todo es un objeto” (II)

Las clases son objetos. String es una variable global que apunta al objeto que define la clase String. Reciben mensajes como cualquier objeto. new es un mensaje que pueden recibir las clases y cuyo objetivo es pedir que se construya una nueva instancia (i.e. construyen un objeto de la clase receptora). Los mensajes sin el receptor son instancias de la clase Message.  Los mensajes, incluyendo el receptor, son instancias de la clase MessageSend.

# Métodos y mensajes

Un método es el código que define el comportamiento del objeto cuando recibe un mensaje.   
El nombre de un método se llama selector (en otros lenguajes signatura).   
El selector sirve para encontrar la implementación (método) correspondiente a un mensaje.

![](images/1e785dff985b2af29f17a22811677203f92903e6e1aac23fec01a6a9cf94bce0.jpg)

# Ejemplo de un método

![](images/d142f81fc4c8a053965a90893d0f942e6f7ec38f92e69948685d445ff39da3ab.jpg)

La primera línea contiene el selector más un nombre para los argumentos.   
La segunda línea contiene un comentario que describe el método.   
La siguiente línea declara una variable local. Se pueden declarar varias variables locales, separadas por espacios.   
self se refiere al objeto receptor del mensaje.   
Los puntos son separadores de instrucciones.   
^ indica el objeto que se devuelve. finaliza el método.

Todos los métodos devuelven algo. Por defecto, self.

<table><tr><td>Objeto</td><td>Mensaje</td><td>Selector</td><td>Efecto o respuesta</td></tr><tr><td>MiCuenta 195</td><td>MiCuenta withdraw:250 195 -34</td><td>withdraw: 1</td><td>Se realiza una extraccion en MiCuenta Devuelve 161</td></tr><tr><td>`hola</td><td>‘hola mundo!&#x27; size</td><td>size</td><td>Devuelve 11</td></tr><tr><td>mundo!&#x27; MiConjunto</td><td>MiConjunto add:‘hola&#x27;</td><td>add:</td><td>Agrega el objeto &#x27;hola&#x27;a MiConjunto</td></tr></table>

 Los “nombres” de los métodos que ve el usuario de un objeto pueden denominarse:

$\bigcirc$ protocolo   
$\bigcirc$ comportamiento   
$\bigcirc$ interfaz   
$\bigcirc$ servicios   
$\bigcirc$ public member functions $( C ^ { + + } )$

 Las variables de instancia también pueden ser llamadas:

$\bigcirc$ atributos   
$\bigcirc$ características   
$\bigcirc$ memoria   
o estado   
o private member data $( C ^ { + + } )$

# Métodos de instancia y de clase

Las clases son objetos. Hay métodos de clase, que se definen de manera similar. Por ejemplo, new.   
Puede haber datos propios de cada clase. Estos se almacenan en variables de instancia de clase, y son sólo accesibles por métodos de clase.   
Puede haber datos compartidos por todas las instancias de una clase. Éstos se almacenan en variables de clase, y son accesibles por los métodos de instancia y de clase.

# Herencia

 Se pueden estructurar las clases diciendo que una es un tipo especial (kind of) de otra.

![](images/d5280a59e1ff532bfbf1fb184e79b586abeab63a2aed33a2744b75fe11be2b50.jpg)

Una Mariposa es una subclase de Insecto. Insecto es la superclase de Mariposa y de Cucaracha Se dice que Mariposa hereda de Insecto.   
La relación entre una clase y una subclase es la relación Es-un (también A-Kind-Of en otros dominios como IA).   
Idea: si conecto de alguna manera a las mariposas con los insectos, se establece una agrupación mental que me permite reusar conocimiento que ya tengo sobre los insectos y aplicarlos a las mariposas. Todo lo que es cierto sobre los insectos, automáticamente también es cierto para las mariposas (6 patas, distribución de las patas, metamorfosis, etc.)

![](images/60dacb4dd4915edbe3b28ccda8d6e544bdeaafb22906e1ec71a0daca1faa648f.jpg)

Float es un tipo especial de Number

Todo lo que es cierto sobre los números (se pueden multiplicar, etc) es cierto también para los puntos flotantes y para los enteros.

A su vez todo es subclase de Object en Smalltalk.

 Magnitude tiene el comportamiento común entre fechas, horas y números (relación de orden total).

# Intuición:

los objetos de una subclase tienen más cualidades que los objetos de su superclase los objetos de una subclase son más específicos que los de su superclase, los objetos de una superclase son más generales que los de sus subclases.

Sintaxis en Smalltalk para definir una subclase (a mano):

# Herencia y mensajes

Smalltalk ejecuta el primer método, con el selector correspondiente al mensaje, que encuentra en la jerarquía empezando desde la clase a la cual pertenece el objeto y subiendo por las superclases. Esta búsqueda (que se denomina method lookup) se hace en tiempo de ejecución (binding dinámico/late binding/dispatch dinámico).   
De este modo una subclase hereda el comportamiento de sus superclases.   
En otros lenguajes OO tipados, las clases determinan el tipo de sus instancias. Hay reglas de verificación de tipos que dependen de la jerarquía de clases. No es el caso del Smalltalk, porque no es tipado.

# Ejercicio (Jerarquías)

![](images/fe45dc5968ed5d11ccead062e0447144b27baf4231515a6bab76ff2cc7c92abe.jpg)

Para cada una de estas jerarquías, decidir si es razonable decir que representa una relación de herencia.

# Discusión:

# Jerarquía 1:

Definitivamente no es herencia: los motores no son casos particulares de autos. Es una jerarquía de partes (part-of, aggregation, assembly, whole-part, composite, has-a). Este tipo de jerarquías es todavía más importante que la de herencia (en algunos casos se lo toma como elemento principal de los lenguajes de objetos).

# Jerarquía 2:

 Claro ejemplo de herencia. Las Pick-ups son un tipo especial de Camionetas, que a su vez son Automóviles.

# Jerarquía 3:

Charles no es un Reina Elizabeth. El problema fundamental es que la herencia es entre clases y en la jerarquía 3 hay objetos.

# Jerarquía 4:

 Tampoco es herencia.   
 Otro ejemplo de aggregation.   
 En este caso, un mismo nodo aparece más de una vez.

# Ejemplo: herencia en Smalltalk

![](images/302347ee1ff16bc6e1594341993be4291647f741779196407fc6dcb23d3dd079.jpg)

<table><tr><td rowspan=1 colspan=1>PerronewdeciAlgo</td><td rowspan=1 colspan=1>new crea una nueva Perro. Smalltalk responde‘No tengo nada para deci...</td></tr><tr><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1>Buscamosel método deciAlgo en Perro</td></tr><tr><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1>Buscamosel metodo deciAlgo enMamifero</td></tr><tr><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1>Buscamos el metodo deciAlgo en Vertebrado-&gt;ahi esta la implementacion</td></tr><tr><td rowspan=1 colspan=1>DelfinnewdeciAlgo</td><td rowspan=1 colspan=1>Responde‘jGraciaspor lospescados!&#x27;</td></tr><tr><td rowspan=1 colspan=1>VertebradonewdeciAlgo</td><td rowspan=1 colspan=1>Sigue respondiendo ‘No tengo nada para decir...&#x27;</td></tr></table>

Ejercicios:

 Agregar una clase Loro y hacer que diga siempre la misma frase aprendida.

deciAlgo self display: frase

 Hacer que Humano diga “Mi nombre es

Humano superclass: Mamifero deciAlgo self display: ‘Mi nombre es ‘, nombre

 Hacer que Humano diga “Mi nombre es....” , después de lo que dicen los vertebrados.

deciAlgo super deciAlgo. self display: ‘Mi nombre es ‘, nombre

super altera el orden en que se búscan los métodos, comenzando a buscar por la superclase de la clase donde está definido el método que hace referencia a super.

Predecir el resultado de:

<table><tr><td>‘iglu de mijo&#x27; class</td><td>ByteString</td></tr><tr><td>Kiwi new class superclass</td><td>Ave</td></tr><tr><td>(2/7)class superclass superclass</td><td>ArithmeticValue</td></tr><tr><td>P := Paloma new. P isKindOf: Vertebrado</td><td>true</td></tr><tr><td>PisMemberOf:Vertebrado PisMemberOf:Paloma</td><td>false true</td></tr><tr><td>K := Kiwi new.</td><td></td></tr><tr><td>K class == Kiwi</td><td>true</td></tr><tr><td>K respondsTo: #deciAlgo</td><td>true</td></tr><tr><td>K respondsTo: #vola</td><td>false</td></tr><tr><td>Paloma alllnstances size</td><td>1</td></tr></table>

<table><tr><td>isKindOf: dice si un objeto es instancia de la clase o alguna subclase isMemberOf: dice si el objeto es exactamente de esa clase</td></tr></table>

# Creación e Inicialización de objetos

 Un objeto o instancia se crea enviándole un mensaje a la clase correpondiente. Ejemplo: Perro new.

 Se pueden definir métodos que creen instancias y reciban parámetros.

Humano conNombre: ‘Pepe’ (metodo de clase) ^ (self new) nombre: ‘Pepe’.

Para inicializar instancias se estila crear un método de instancia (por ej. initialize) al que llaman los métodos de clase.

# Re-uso:

# Desafío:

 Escribir un método pepe en una clase AAA con el código: “... un monton de código importante...” Transcript show: ‘To be or not to be’. “... otro monton de codigo super importante...” Crear una subclase BBB que en el método pepe haga exactamente lo mismo que AAA, pero en lugar de escribir ‘To be or not to be’, escriba ‘My kingdom for a horse’.

 No debe quedar código repetido.

AAA $> >$ pepe “...un monton de código importante...” Transacript show: (self miFrase). “... otro monton de codigo super importante...”   
AAA $> >$ miFrase ^ ‘To be or not to be’   
BBB superclass: AAA   
BBB $> >$ miFrase ^ ‘My kingdom for a horse’

# Smalltalk

# Imagen:

Contiene todos los objetos que se crearon y se usaron, así como todos los objetos que son críticos para Smalltalk.   
Cuando se carga una imagen, todos los objetos vuelven a estar disponibles   
En VisualWorks, las imágenes son archivos con extensión .im. La imagen por defecto se llama visualnc.im y está en el subdirectorio images del directorio de instalación de VisualWorks.   
Hay que generar copias de la imagen.   
Smalltalk distingue mayúsculas y minúsculas.   
Es importante respetar la convención de nombres de variables y de métodos.   
Las variables no tienen tipo pero los objetos son fuertemente tipados.   
Todas las clases (como Delfín) son instancias de otra clase, que se llama la metaclase. Cada clase es la única instancia de su metaclase. Todas las metaclases son instancias de la misma clase, Metaclass.