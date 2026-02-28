# Paradigmas de Programaci´on

Introducci´on a la materia Programaci´on funcional b´asica

2do cuatrimestre de 2025 Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

# Presentaci´on de la materia

Tipos b´asicos y secuencias

Tipos de datos inductivos

Tipos abstractos de datos

Enumeraciones combinatorias

$$
2
$$

$$
\mathsf { D o c e n t e s } \ ( \mathsf { t u r n o \ n o c h e } )
$$

# Profesor

Pablo Barenbaum

Jefes de trabajos pr´acticos

Daniela Marottoli Gabriela Steren

# Ayudantes de segunda

Lautaro Bagnasco Muguillo   
Jonathan Bekenstein   
Lucas Di Salvo   
Sebasti´an Felgueras   
Dami´an Huaier   
Catalina Juarros   
Pablo Zaid

# 3

# D´ıas y horarios de cursada

$$
4
$$

Martes de 17:00 a 22:00

Viernes de 17:00 a 22:00

generalmente pr´actica generalmente te´orica

En general:

Consultas de 17:00 a 17:30.

▶ Consultas desde el final de la clase hasta las 22:00.

# Modalidad de evaluaci´on

# Parciales

Primer parcial martes 7 de octubre Segundo parcial martes 25 de noviembre Recuperatorio del primer parcial martes 2 de diciembre Recuperatorio del segundo parcial martes 9 de diciembre

# Trabajos pr´acticos

TP 1 (con su recuperatorio) TP 2 (con su recuperatorio)

Los TPs son en grupos de 4 integrantes.

# Examen final

(Con posibilidad de promoci´on).

# 5

# Materiales

Todo el material de la materia va a estar disponible en el campus: https://campus.exactas.uba.ar/course/view.php?id=737

Diapositivas de las clases   
Gu´ıas de ejercicios   
Apuntes   
Enunciados de los trabajos pr´acticos   
Calendario

Revisen la secci´on “´util”.

# V´ıas de comunicaci´on

Docentes alumnxs Avisos a trav´es del campus.

Alumnxs → docentes   
Lista de correo: plp-docentes@dc.uba.ar (para consultas administrativas)

Discusi´on entre estudiantes fuera del horario de la materia

Servidor de Discord: https://tinyurl.com/plpdiscord (con eventual participaci´on de docentes)

Tres aspectos de los lenguajes de programaci´on:

![](images/25e9d0dd04e3623dc89e3b829c1aabef9314935382efa1ddbef0398b8ac8aa1b.jpg)

# Cronograma

<table><tr><td rowspan=1 colspan=1>Programacion funcional                 2 semanas</td></tr><tr><td rowspan=1 colspan=1>Razonamiento ecuacional               1 semana</td></tr><tr><td rowspan=1 colspan=1>L6gica proposicional                      1 semana</td></tr><tr><td rowspan=1 colspan=1>Calculo-入                                   2 semanas</td></tr><tr><td rowspan=1 colspan=1>(Repaso /consultas)</td></tr><tr><td rowspan=1 colspan=1>Primerparcial</td></tr><tr><td rowspan=1 colspan=1>Intérpretes e inferencia de tipos       1 semana</td></tr><tr><td rowspan=1 colspan=1>Unificacion y l6gica de primer orden 1 semana</td></tr><tr><td rowspan=1 colspan=1>Resolucion                                  1 semana</td></tr><tr><td rowspan=1 colspan=1>Programacion l6gica                      1,5 semanas</td></tr><tr><td rowspan=1 colspan=1>Programacion orientada a objetos     1 semana</td></tr><tr><td rowspan=1 colspan=1>(Repaso /consultas)</td></tr><tr><td rowspan=1 colspan=1>Segundo parcial</td></tr></table>

# Motivaci´on: programaci´on

Los lenguajes de programaci´on tienen distintas caracter´ısticas.

Etiquetado din´amico vs. tipado est´atico.   
Administraci´on manual vs. autom´atica de memoria.   
Funciones de primer orden vs. funciones de orden superior.   
Mutabilidad vs. inmutabilidad.   
Alcance din´amico vs. est´atico.   
Resoluci´on de nombres temprana vs. tard´ıa.   
Inferencia de tipos.   
Determinismo vs. no determinismo.   
Pasaje de par´ametros por copia o por referencia.   
Evaluaci´on estricta (por valor) o diferida (por necesidad).   
Tipos de datos inductivos, co-inductivos, GADTs, familias dependientes.   
Pattern matching, unificaci´on.   
Polimorfismo param´etrico.   
Subclasificaci´on, polimorfismo de subtipos, herencia simple vs. m´ultiple.   
Estructuras de control no local.

# Motivaci´on: programaci´on

Distintas caracter´ısticas permiten abordar un mismo problema de distintas maneras.

# 11

$$
\{ ( x , y ) \mid x ^ { 2 } + y ^ { 2 } = r ^ { 2 } \} \quad C = \{ ( r \sin \theta ,
$$

$$
C = \{ ( r \sin \theta , r \cos \theta ) | 0 \leq \theta < 2 \pi \}
$$

r := 1   
while n > 0 { $\begin{array} { r } { \textbf { r } : = \textbf { r } * \textbf { n } } \\ { \textbf { n } : = \textbf { n } - \textbf { 1 } } \end{array}$   
}

# Motivaci´on: sem´antica

Dependemos del software en aplicaciones cr´ıticas.

Telecomunicaciones.   
Procesos industriales.   
Reactores nucleares.   
Equipamiento m´edico.   
Previsi´on meteorol´ogica.   
Aeron´autica.   
Veh´ıculos aut´onomos.   
Transacciones monetarias.   
An´alisis de datos en ciencia o toma de decisiones.

Las fallas cuestan recursos monetarios y vidas humanas.

# Motivaci´on: sem´antica

¿Podemos confiar en que un programa hace lo que queremos? ¿Y si el programa est´a escrito por el enemigo? ¿Y si el programa est´a escrito por una IA?

# Objetivo

Probar teoremas sobre el comportamiento de los programas. ¿C´omo darle significado matem´atico a los programas? En AED vimos una manera de hacerlo (triplas de Hoare). En PLP veremos otras maneras de dar sem´antica.

# Motivaci´on: implementaci´on

Una computadora f´ısica ejecuta programas escritos en un lenguaje. (El “c´odigo m´aquina”).

¿C´omo es capaz de ejecutar programas escritos en otros lenguajes?

Interpretaci´on (o evaluaci´on). Chequeo e inferencia de tipos.   
▶ Compilaci´on (traducci´on de un lenguaje a otro).

# Bibliograf´ıa (no exhaustiva)

L´ogica proposicional y de primer orden

Logic and Structure

D. van Dalen.

Sem´antica y fundamentos de la implementaci´on

Introduction to the Theory of Programming Languages

J.-J. L´evy, G. Dowek. Springer, 2010.

Types and Programming Languages

B. Pierce. The MIT Press, 2002.

Programaci´on funcional Introduction to Functional Programming using Haskell R. Bird. Prentice Hall, 1998.

# Programaci´on l´ogica

Logic Programming with Prolog

M. Bramer. Springer-Verlag, 2013.

# Programaci´on orientada a objetos

Smalltalk-80 the Language and its Implementation

A. Goldberg, D. Robson. Addison-Wesley, 1983.

# Presentaci´on de la materia

Tipos b´asicos y secuencias

Tipos de datos inductivos

Tipos abstractos de datos

Enumeraciones combinatorias

# 16

# Programaci´on con tipos b´asicos y secuencias

Definir las siguientes funciones:

factorial :: Int -> Int dado un entero $n \geq 0$ , devuelve n!.   
sumaN :: Int -> [Int] -> [Int] dado un entero $k$ y una lista xs, devuelve la lista que resulta de sumarle $k$ a cada elemento de xs. aparece :: Char -> String -> Bool   
dado un caracter c y un string s, devuelve un booleano que indica si c aparece en s.

M´as en general:

aparece :: Eq a => a -> [a] -> Bool

ordenar :: [Float] -> [Float]   
dada una lista, devuelve su permutaci´on ordenada. M´as en general:

$$
^ { 1 7 }
$$

ordenar :: Ord a => [a] -> Bool

# Presentaci´on de la materia

Tipos b´asicos y secuencias

Tipos de datos inductivos

Tipos abstractos de datos

Enumeraciones combinatorias

# 18

# Tipos enumerados

Dado el siguiente tipo de datos:

data Direccion $=$ Norte | Este | Sur | Oeste definir la funci´on

opuesta :: Direccion -> Direccion que dada una direcci´on $d$ , devuelve la direcci´on opuesta a $d$ .

# Tipos opcionales

Definir la funci´on

´ultimo´IndiceDe :: Eq a -> a -> [a] -> Int que dado un elemento $x \ y$ una lista de elementos xs, devuelve el ´ındice de la ´ultima ocurrencia de x en xs.

Es una funci´on parcial. ¿C´omo la podemos hacer total?

Podemos usar el siguiente tipo de datos:

data Maybe a $=$ Nothing | Just a

Redefinir ahora la funci´on para que sea total, con el siguiente tipo: ´ultimo´IndiceDe :: Eq a -> a -> [a] -> Maybe Int

Dado el siguiente tipo de datos:

data AB a $=$ Nil | Bin (AB a) a (AB a)

Dibujar y escribir en Haskell todos los ´arboles que tienen 3 nodos, en todos los cuales se encuentra el n´umero 0.

Definir las funciones:

1. preorder :: AB a -> [a]   
2. inorder :: AB a -> [a]   
3. postorder :: AB a -> [a]

# Presentaci´on de la materia

Tipos b´asicos y secuencias

Tipos de datos inductivos

Tipos abstractos de datos

Enumeraciones combinatorias

$$
^ { 2 2 }
$$

# Conjunto sobre listas

Implementemos un conjunto con la siguiente interfaz:

vac´ıo :: Conj a insertar :: Eq a => a -> Conj a -> Conj a pertenece :: Eq a => a -> Conj a -> Bool eliminar :: Eq a => a -> Conj a -> Conj a

Elegimos la siguiente estructura de representaci´on:

data Conj a = CConj [a] con el siguiente invariante:

La lista no debe contener elementos repetidos.

# Diccionario sobre ´arboles binarios de b´usqueda

Implementemos un diccionario con la siguiente interfaz:

vac´ıo :: Dict k v definir :: Ord k => k -> v -> Dict k v -> Dict k v buscar :: Ord k => k -> Dict k v -> Maybe v

Elegimos la siguiente estructura de representaci´on:

data Dict k $\begin{array} { r l } { \triangledown } & { { } = } \end{array}$ CDict (AB (k, v)) con el siguiente invariante:

El ´arbol binario debe ser un ´arbol binario de b´usqueda. Es decir, en cada sub´arbol:

Las claves del sub´arbol izquierdo son menores que la ra´ız.   
Las claves del sub´arbol derecho son mayores que la ra´ız.

# Presentaci´on de la materia

Tipos b´asicos y secuencias

Tipos de datos inductivos

Tipos abstractos de datos

Enumeraciones combinatorias

# 25

# Subsecuencias

Definir una funci´on: subsecuencias :: [a] -> [[a]] que dada una lista, devuelva la lista de todas sus posibles subsecuencias.

Por ejemplo, las subsecuencias de [1, 2, 3] son:

[[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]

# Permutaciones

Definir una funci´on: permutaciones :: [a] -> [[a]] que dada una lista, devuelva la lista de todas sus posibles permutaciones.

Por ejemplo, las permutaciones de [1, 2, 3] son:

[[1, 2, 3], [1, 3, 2], [2, 1, 3] [2, 3, 1], [3, 1, 2], [3, 2, 1]]

$$
^ { 2 7 }
$$

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

Lectura recomendada   
Cap´ıtulos 1–3 del libro de Bird.   
Richard Bird. Thinking functionally with Haskell. Cambridge University Press, 2015.