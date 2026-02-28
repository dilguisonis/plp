# Paradigmas de Programaci´on

Interpretaci´on

2do cuatrimestre de 2025 Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

# 1

Introducci´on

Int´erpretes b´asicos

Caracter´ısticas imperativas

$$
2
$$

Caracter´ısticas funcionales

# Int´erpretes

¿Qu´e es un int´erprete?

Un int´erprete es un programa que ejecuta programas.

# 3

¿Qu´e es un int´erprete?

Un int´erprete es un programa que ejecuta programas.

Involucra dos lenguajes de programaci´on:

# 3

¿Qu´e es un int´erprete?

Un int´erprete es un programa que ejecuta programas.

Involucra dos lenguajes de programaci´on:

Lenguaje de implementaci´on

Lenguaje en el que est´a definido el int´erprete.

# 3

# Int´erpretes

¿Qu´e es un int´erprete?

Un int´erprete es un programa que ejecuta programas.

Involucra dos lenguajes de programaci´on:

Lenguaje de implementaci´on

Lenguaje en el que est´a definido el int´erprete.

Lenguaje fuente

Lenguaje en el que est´an escritos los programas que se interpretan.

¿Qu´e es un int´erprete?

Un int´erprete es un programa que ejecuta programas.

Involucra dos lenguajes de programaci´on:

Lenguaje de implementaci´on

Lenguaje en el que est´a definido el int´erprete.

Lenguaje fuente

Lenguaje en el que est´an escritos los programas que se interpretan.

Pregunta frecuente ¿Podr´ıa ser que estos dos lenguajes coincidan?

¿Qu´e es un int´erprete?

Un int´erprete es un programa que ejecuta programas.

Involucra dos lenguajes de programaci´on:

Lenguaje de implementaci´on

Lenguaje en el que est´a definido el int´erprete.

# Lenguaje fuente

Lenguaje en el que est´an escritos los programas que se interpretan.

Pregunta frecuente   
¿Podr´ıa ser que estos dos lenguajes coincidan?   
S´ı, puede haber int´erpretes capaces de interpretarse a s´ı mismos. No es algo que tenga especial inter´es en la materia.

# Lenguajes que usaremos

En la clase de hoy vamos a definir varios int´erpretes.

$$
4
$$

# Lenguajes que usaremos

En la clase de hoy vamos a definir varios int´erpretes.

Lenguaje de implementaci´on

$$
4
$$

Vamos a definir int´erpretes en Haskell.

# Lenguajes que usaremos

En la clase de hoy vamos a definir varios int´erpretes.

Lenguaje de implementaci´on

Vamos a definir int´erpretes en Haskell.

$$
4
$$

# Lenguaje fuente

Vamos a definir int´erpretes para distintos lenguajes fuente (p. ej. lenguajes imperativos y funcionales).

# Lenguajes que usaremos

$$
4
$$

En la clase de hoy vamos a definir varios int´erpretes.

Lenguaje de implementaci´on

Vamos a definir int´erpretes en Haskell.

# Lenguaje fuente

Vamos a definir int´erpretes para distintos lenguajes fuente (p. ej. lenguajes imperativos y funcionales).

Nota

Vamos a trabajar con lenguajes fuente minimalistas (“de juguete”).   
Nos alcanzan para ilustrar los conceptos importantes.

# Sintaxis concreta vs. sintaxis abstracta

El int´erprete recibe como entrada un dato que representa un programa escrito en el lenguaje fuente.

# 5

# Sintaxis concreta vs. sintaxis abstracta

El int´erprete recibe como entrada un dato que representa un programa escrito en el lenguaje fuente.

¿C´omo se representa un programa?

# 5

# Sintaxis concreta vs. sintaxis abstracta

El int´erprete recibe como entrada un dato que representa un programa escrito en el lenguaje fuente.

¿C´omo se representa un programa?

# Sintaxis concreta

Se puede representar un programa como una cadena de texto.

# 5

# Sintaxis concreta vs. sintaxis abstracta

El int´erprete recibe como entrada un dato que representa un programa escrito en el lenguaje fuente.

¿C´omo se representa un programa?

# Sintaxis concreta

Se puede representar un programa como una cadena de texto. Por ejemplo:

"while (true) { x = x + 1; }" :: String

# 5

# Sintaxis concreta vs. sintaxis abstracta

El int´erprete recibe como entrada un dato que representa un programa escrito en el lenguaje fuente.

¿C´omo se representa un programa?

# Sintaxis concreta

Se puede representar un programa como una cadena de texto. Por ejemplo:

"while (true) { x = x + 1; }" :: String

# Sintaxis abstracta

Se puede representar un programa como un ´arbol de sintaxis.

# Sintaxis concreta vs. sintaxis abstracta

El int´erprete recibe como entrada un dato que representa un programa escrito en el lenguaje fuente.

¿C´omo se representa un programa?

# Sintaxis concreta

Se puede representar un programa como una cadena de texto. Por ejemplo:

"while (true) { x = x + 1; }" :: String

# Sintaxis abstracta

Se puede representar un programa como un ´arbol de sintaxis. Por ejemplo:

EWhile ETrue (EAssign "x" (EAdd (EVar "x") (EConstNum 1))) :: Programa

Sintaxis concreta vs. sintaxis abstracta

# En la clase de hoy

Representaremos los programas como ´arboles de sintaxis abstracta.

# 6

Sintaxis concreta vs. sintaxis abstracta

# En la clase de hoy

Representaremos los programas como ´arboles de sintaxis abstracta.

Convertir la sintaxis concreta (texto) en sintaxis abstracta (´arbol) es un problema de an´alisis sint´actico.

Queda fuera del alcance de esta materia.

Introducci´on

Int´erpretes b´asicos

Caracter´ısticas imperativas

Caracter´ısticas funcionales

# 7

# Lenguaje de expresiones aritm´eticas

Consideremos un lenguaje de expresiones aritm´eticas construidas inductivamente de la siguiente manera:

1. Una constante entera es una expresi´on.   
2. La suma de dos expresiones es una expresi´on.

# 8

# Lenguaje de expresiones aritm´eticas

Consideremos un lenguaje de expresiones aritm´eticas construidas inductivamente de la siguiente manera:

1. Una constante entera es una expresi´on.   
2. La suma de dos expresiones es una expresi´on.

Las expresiones se pueden representar con un tipo de datos:

data Expr $=$ EConstNum Int -- 1, 2, 3, ... | EAdd Expr Expr -- e1 + e2

# Lenguaje de expresiones aritm´eticas

Consideremos un lenguaje de expresiones aritm´eticas construidas inductivamente de la siguiente manera:

1. Una constante entera es una expresi´on.   
2. La suma de dos expresiones es una expresi´on.

Las expresiones se pueden representar con un tipo de datos:

data Expr $=$ EConstNum Int -- 1, 2, 3, ... | EAdd Expr Expr -- e1 + e2

Por ejemplo, $" 1 + ( 2 + 3 ) $ ” se representa con:

EAdd (EConstNum 1) (EAdd (EConstNum 2) (EConstNum 3))

# Lenguaje de expresiones aritm´eticas

Consideremos un lenguaje de expresiones aritm´eticas construidas inductivamente de la siguiente manera:

1. Una constante entera es una expresi´on.   
2. La suma de dos expresiones es una expresi´on.

Las expresiones se pueden representar con un tipo de datos:

data Expr $=$ EConstNum Int -- 1, 2, 3, ... | EAdd Expr Expr -- e1 + e2

Por ejemplo, $" 1 + ( 2 + 3 ) $ ” se representa con:

EAdd (EConstNum 1) (EAdd (EConstNum 2) (EConstNum 3))

# Ejercicio (1)

Definir un int´erprete:

eval :: Expr -> Int

# 8

# Extensi´on con constantes booleanas

¿Podr´ıamos extender el lenguaje con constantes booleanas?

$$
9
$$

# Extensi´on con constantes booleanas

¿Podr´ıamos extender el lenguaje con constantes booleanas?

data Expr $=$ EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False | EAdd Expr Expr -- e1 + e2

$$
9
$$

# Extensi´on con constantes booleanas

¿Podr´ıamos extender el lenguaje con constantes booleanas?

data Expr $=$ EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False | EAdd Expr Expr -- e1 + e2

# Problema

El int´erprete ya no es una funci´on eval :: Expr -> Int.

$$
9
$$

# Extensi´on con constantes booleanas

¿Podr´ıamos extender el lenguaje con constantes booleanas?

data Expr $=$ EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False | EAdd Expr Expr -- e1 + e2

# Problema

El int´erprete ya no es una funci´on eval :: Expr -> Int.

# Valores

Definimos un tipo de datos Val para representar los valores (posibles resultados de los c´omputos):

data Val $=$ VN Int | VB Bool

# Extensi´on con constantes booleanas

¿Podr´ıamos extender el lenguaje con constantes booleanas?

data Expr $=$ EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False | EAdd Expr Expr -- e1 + e2

# Problema

El int´erprete ya no es una funci´on eval :: Expr -> Int.

# Valores

Definimos un tipo de datos Val para representar los valores (posibles resultados de los c´omputos):

data Val $=$ VN Int | VB Bool

# Ejercicio (2)

Definir un int´erprete:

eval :: Expr -> Val

$$
9
$$

# Definiciones locales y entornos

Queremos extender el lenguaje con definiciones locales:

let x = 3 in (let y = x + x in 1 + y)

# Definiciones locales y entornos

Queremos extender el lenguaje con definiciones locales:

let x = 3 in (let y = x + x in 1 + y)

Necesitamos mantener registro del valor que tiene cada variable.

# Definiciones locales y entornos

Queremos extender el lenguaje con definiciones locales:

let x = 3 in (let y = x + x in 1 + y)

Necesitamos mantener registro del valor que tiene cada variable.

# Entornos

Un entorno es un diccionario que asocia identificadores a valores.

# Definiciones locales y entornos

Queremos extender el lenguaje con definiciones locales:

let x = 3 in (let y = x + x in 1 + y)

Necesitamos mantener registro del valor que tiene cada variable.

# Entornos

Un entorno es un diccionario que asocia identificadores a valores.

Vamos a suponer que contamos con tipos:   
Id identificadores (nombres de variables) (Env a) entornos que asocian identificadores a valores de tipo a

# Definiciones locales y entornos

Queremos extender el lenguaje con definiciones locales:

let x = 3 in (let y = x + x in 1 + y)

Necesitamos mantener registro del valor que tiene cada variable.

# Entornos

Un entorno es un diccionario que asocia identificadores a valores.

Vamos a suponer que contamos con tipos:   
Id identificadores (nombres de variables) (Env a) entornos que asocian identificadores a valores de tipo a

y la siguiente interfaz:

emptyEnv :: Env a lookupEnv :: Env a -> Id -> a extendEnv :: Env a -> Id -> a -> Env a

# Extensi´on con variables y definiciones locales

Extendemos el lenguaje de expresiones:

data Expr $=$ EConstNum Int $\begin{array} { l } { { \mathrm { --- } ~ 1 , ~ 2 , ~ 3 , ~ . . . } } \\ { { \mathrm { --- } ~ T r u e , ~ F a l s e } } \\ { { \mathrm { --- } ~ e 1 ~ + ~ e 2 } } \\ { { \mathrm { --- } ~ x } } \\ { { \mathrm { --- } ~ l e t ~ x ~ = ~ e 1 ~ i n ~ e 2 } } \end{array}$ | EConstBool Bool | EAdd Expr Expr | EVar Id | ELet Id Expr Expr

# Extensi´on con variables y definiciones locales

Extendemos el lenguaje de expresiones:

data Expr $=$ EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False | EAdd Expr Expr -- e1 + e2 | EVar Id -- x | ELet Id Expr Expr -- let $\textit { \textbf { x } } = \textit { \textbf { e } } 1$ in

# Problema

¿Cu´al es el resultado de evaluar (EVar "x")?

# Extensi´on con variables y definiciones locales

Extendemos el lenguaje de expresiones:

data Expr $=$ EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False | EAdd Expr Expr -- e1 + e2 | EVar Id -- x | ELet Id Expr Expr -- let x = e1 in

# Problema

¿Cu´al es el resultado de evaluar (EVar "x")? El int´erprete ya no es una funci´on eval :: Expr -> Val.

# Ejercicio (3)

Definir un int´erprete:

eval :: Expr -> Env Val -> Val

# Extensi´on con variables y definiciones locales

# 12

# Comentario

En el lenguaje con declaraciones locales, una expresi´on no denota un valor, sino una funci´on que devuelve un valor en funci´on del entorno dado:

eval :: Expr -> (Env Val -> Val)

Introducci´on

Int´erpretes b´asicos

Caracter´ısticas imperativas

# 13

Caracter´ısticas funcionales

Int´erprete con memoria para un lenguaje imperativo

Queremos extender el lenguaje con caracter´ısticas imperativas:

1. Asignaciones: x := e   
2. Composici´on secuencial: e1; e2

$$
^ { 1 4 }
$$

# Int´erprete con memoria para un lenguaje imperativo

Queremos extender el lenguaje con caracter´ısticas imperativas:

1. Asignaciones: x := e

2. Composici´on secuencial: e1; e2

Vamos a suponer que:

1. El valor de la asignaci´on es 0. (No es muy importante, s´olo una convenci´on).

2. La sem´antica de la composici´on e1; e2 corresponde a evaluar primero e1, descartando su valor, y a continuaci´on evaluar e2.

# Int´erprete con memoria para un lenguaje imperativo

Queremos extender el lenguaje con caracter´ısticas imperativas:

1. Asignaciones: x := e

2. Composici´on secuencial: e1; e2

Vamos a suponer que:

1. El valor de la asignaci´on es 0. (No es muy importante, s´olo una convenci´on).

2. La sem´antica de la composici´on e1; e2 corresponde a evaluar primero e1, descartando su valor, y a continuaci´on evaluar e2.

Por ejemplo, el siguiente programa deber´ıa resultar en el entero 4:

let $\texttt { x } = \texttt { 1 }$ in x := x + 1; x + x

# Int´erprete con memoria para un lenguaje imperativo

# Variables inmutables

En un lenguaje puramente funcional, las variables son inmutables.

# Int´erprete con memoria para un lenguaje imperativo

# Variables inmutables

En un lenguaje puramente funcional, las variables son inmutables.

El entorno asocia cada variable directamente a un valor.

# Int´erprete con memoria para un lenguaje imperativo

# Variables inmutables

En un lenguaje puramente funcional, las variables son inmutables.

El entorno asocia cada variable directamente a un valor.

# Variables mutables

En un lenguaje imperativo, las variables son t´ıpicamente mutables.

# Int´erprete con memoria para un lenguaje imperativo

# Variables inmutables

En un lenguaje puramente funcional, las variables son inmutables.

El entorno asocia cada variable directamente a un valor.

# Variables mutables

En un lenguaje imperativo, las variables son t´ıpicamente mutables.

El entorno no asocia cada variable a un valor.

# Int´erprete con memoria para un lenguaje imperativo

# Variables inmutables

En un lenguaje puramente funcional, las variables son inmutables.

El entorno asocia cada variable directamente a un valor.

# Variables mutables

En un lenguaje imperativo, las variables son t´ıpicamente mutables.

▶ El entorno no asocia cada variable a un valor.   
▶ El entorno asocia cada variable a una direcci´on de memoria.

# Int´erprete con memoria para un lenguaje imperativo

# Variables inmutables

En un lenguaje puramente funcional, las variables son inmutables.

El entorno asocia cada variable directamente a un valor.

# Variables mutables

En un lenguaje imperativo, las variables son t´ıpicamente mutables.

El entorno no asocia cada variable a un valor.   
El entorno asocia cada variable a una direcci´on de memoria.   
Adem´as, hay una memoria que asocia direcciones a valores.

# Int´erprete con memoria para un lenguaje imperativo

# Variables inmutables

En un lenguaje puramente funcional, las variables son inmutables.

El entorno asocia cada variable directamente a un valor.

# Variables mutables

En un lenguaje imperativo, las variables son t´ıpicamente mutables.

El entorno no asocia cada variable a un valor.   
El entorno asocia cada variable a una direcci´on de memoria.   
Adem´as, hay una memoria que asocia direcciones a valores.   
La evaluaci´on de un programa puede modificar la memoria.

# Int´erprete con memoria para un lenguaje imperativo

# Memorias

Una memoria es un diccionario que asocia direcciones a valores.

# Int´erprete con memoria para un lenguaje imperativo

# Memorias

Una memoria es un diccionario que asocia direcciones a valores.

Vamos a suponer que contamos con tipos:   
Addr direcciones de memoria (Mem a) memorias que asocian direcciones a valores de tipo a

# Int´erprete con memoria para un lenguaje imperativo

# Memorias

Una memoria es un diccionario que asocia direcciones a valores.

Vamos a suponer que contamos con tipos:   
Addr direcciones de memoria (Mem a) memorias que asocian direcciones a valores de tipo a

y la siguiente interfaz:

emptyMem :: Mem a   
freeAddress :: Mem a -> Addr   
load :: Mem a -> Addr -> a   
store :: Mem a -> Addr -> a -> Mem a

# Extensi´on con asignaci´on y composici´on secuencial

Extendemos el lenguaje con caracter´ısticas imperativas:

r $=$ EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False EAdd Expr Expr -- e1 + e2 EVar Id -- x 1 ELet Id Expr Expr let x = e1 in e2 ESeq Expr Expr -- e1; e2 EAssign Id Expr -- x := e

$$
^ { 1 7 }
$$

# Extensi´on con asignaci´on y composici´on secuencial

Extendemos el lenguaje con caracter´ısticas imperativas:

xpr $=$ EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False EAdd Expr Expr -- e1 + e2 EVar Id -- x ELet Id Expr Expr -- let x = e1 in e2 ESeq Expr Expr -- e1; e2 EAssign Id Expr -- x := e

# Problema

El resultado de evaluar una asignaci´on ${ \bf \Xi } ( \textbf { x } : = { \bf \Xi } _ { \bf e } )$ no puede ser s´olo un valor (considerar p. ej. let $\texttt { x } = \texttt { 1 }$ in $\textbf { x } : = \ 2 ; \ \textbf { x } )$ .

$$
^ { 1 7 }
$$

# Extensi´on con asignaci´on y composici´on secuencial

Extendemos el lenguaje con caracter´ısticas imperativas:

xpr $=$ EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False EAdd Expr Expr -- e1 + e2 EVar Id -- x ELet Id Expr Expr -- let x = e1 in e2 ESeq Expr Expr -- e1; e2 EAssign Id Expr -- x := e

# Problema

El resultado de evaluar una asignaci´on ${ \bf \Xi } ( \textbf { x } : = { \bf \Xi } _ { \bf e } )$ no puede ser s´olo un valor (considerar p. ej. let $\texttt { x } = \texttt { 1 }$ in $\textbf { x } : = \ 2 ; \ \textbf { x } )$ .

¿Cu´al deber´ıa ser el tipo del int´erprete?

$$
^ { 1 7 }
$$

# Extensi´on con asignaci´on y composici´on secuencial

Extendemos el lenguaje con caracter´ısticas imperativas:

xpr $=$ EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False EAdd Expr Expr -- e1 + e2 1 EVar Id -- x 1 ELet Id Expr Expr -- let x = e1 in e2 ESeq Expr Expr -- e1; e2 | EAssign Id Expr -- x := e

# Problema

El resultado de evaluar una asignaci´on ${ \bf \Xi } ( \textbf { x } : = { \bf \Xi } _ { \bf e } )$ no puede ser s´olo un valor (considerar p. ej. let $\texttt { x } = \texttt { 1 }$ in $\textbf { x } : = \ 2 ; \ \textbf { x } )$ .

¿Cu´al deber´ıa ser el tipo del int´erprete?

# Ejercicio (4)

Definir un int´erprete:

eval :: Expr -> Env Addr -> Mem Val -> (Val, Mem Val)

# Extensi´on con estructuras de control

Extendamos ahora el int´erprete con estructuras de control:

data Expr = EConstNum Int -- 1, 2, 3, ... | EConstBool Bool True, False EAdd Expr Expr e1 + e2 1 EVar Id x ELet Id Expr Expr -- let x = e1 in e2 ESeq Expr Expr -- e1; e2 EAssign Id Expr -- x := e ELtNum Expr Expr -- e1 < e2 EIf Expr Expr Expr -- if e1 then e2 else EWhile Expr Expr while e1 do e2

# Extensi´on con estructuras de control

Extendamos ahora el int´erprete con estructuras de control:

data Expr = EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False | EAdd Expr Expr -- e1 + e2 1 EVar Id -- x 1 ELet Id Expr Expr -- let x = e1 in e2 ESeq Expr Expr -- e1; e2 EAssign Id Expr -- x := e ELtNum Expr Expr -- e1 < e2 EIf Expr Expr Expr -- if e1 then e2 else e EWhile Expr Expr -- while e1 do e2

# Ejercicio (5)

Definir un int´erprete:

eval :: Expr -> Env Addr -> Mem Val -> (Val, Mem Val)

Introducci´on

Int´erpretes b´asicos

Caracter´ısticas imperativas

Caracter´ısticas funcionales

# 19

# Int´erpretes para lenguajes funcionales

Casi todos los lenguajes funcionales est´an basados en el c´alculo-λ.

$$
^ { 2 0 }
$$

# Int´erpretes para lenguajes funcionales

Casi todos los lenguajes funcionales est´an basados en el c´alculo-λ.

El c´alculo- $\lambda$ es un lenguaje que tiene s´olo tres construcciones:

data Expr $=$ EVar Id -- x | ELam Id Expr -- \ x -> e | EApp Expr Expr -- e1 e2

# Int´erpretes para lenguajes funcionales

Casi todos los lenguajes funcionales est´an basados en el c´alculo-λ.

El c´alculo- $\lambda$ es un lenguaje que tiene s´olo tres construcciones:

data Expr $=$ EVar Id -- x | ELam Id Expr -- \ x -> e | EApp Expr Expr -- e1 e2

Es posible programar usando s´olo estas construcciones.

# Int´erpretes para lenguajes funcionales

Casi todos los lenguajes funcionales est´an basados en el c´alculo-λ.

El c´alculo- $\lambda$ es un lenguaje que tiene s´olo tres construcciones:

data Expr = EVar Id -- x | ELam Id Expr -- \ x -> e | EApp Expr Expr -- e1 e2

Es posible programar usando s´olo estas construcciones.

Pero vamos a extender el c´alculo- $\lambda$ para que sea m´as c´omodo y se asemeje a un lenguaje realista.

# Int´erpretes para lenguajes funcionales

¿Cu´al ser´a el resultado de evaluar (\ x -> x + x)?

# 21

# Int´erpretes para lenguajes funcionales

¿Cu´al ser´a el resultado de evaluar (\ x -> x + x)?

Necesitamos extender el tipo de los valores para incluir funciones.

# Int´erpretes para lenguajes funcionales

¿Cu´al ser´a el resultado de evaluar (\ x -> x + x)?

Necesitamos extender el tipo de los valores para incluir funciones.

# Primer intento

El valor de una funci´on es su “c´odigo fuente”.

# Int´erpretes para lenguajes funcionales

¿Cu´al ser´a el resultado de evaluar (\ x -> x + x)?

Necesitamos extender el tipo de los valores para incluir funciones.

# Primer intento

El valor de una funci´on es su “c´odigo fuente”.

data Val $=$ VN Int | VB Bool VFunction Id Expr

# Int´erpretes para lenguajes funcionales

¿Cu´al ser´a el resultado de evaluar (\ x -> x + x)?

Necesitamos extender el tipo de los valores para incluir funciones.

# Primer intento

El valor de una funci´on es su “c´odigo fuente”.

data Val = VN Int | VB Bool VFunction Id Expr

Por ejemplo, el resultado de evaluar (\ x -> x + x) ser´ıa:

VFunction "x" (EAdd (EVar "x") (EVar "x"))

# Int´erpretes para lenguajes funcionales

¿Cu´al ser´a el resultado de evaluar (\ x -> x + x)?

Necesitamos extender el tipo de los valores para incluir funciones.

# Primer intento

El valor de una funci´on es su “c´odigo fuente”.

data Val = VN Int | VB Bool VFunction Id Expr

Por ejemplo, el resultado de evaluar (\ x -> x + x) ser´ıa:

VFunction "x" (EAdd (EVar "x") (EVar "x"))

Veremos en breve que esto no es correcto.

# Int´erprete funcional (primer intento)

Considerar el c´alculo- $\lambda$ extendido con enteros y booleanos: data Expr = EVar Id -- x ELam Id Expr -- \ x -> e EApp Expr Expr -- e1 e2 EConstNum Int -- 1, 2, 3, ... EConstBool Bool -- True, False EAdd Expr Expr -- e1 + e2 | ELet Id Expr Expr -- let x = e1 in e2 | EIf Expr Expr Expr -- if e1 then e2 else e3

# Int´erprete funcional (primer intento)

Considerar el c´alculo- $\lambda$ extendido con enteros y booleanos:

data Expr = EVar Id -- x | ELam Id Expr -- \ x -> e EApp Expr Expr -- e1 e2 EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False EAdd Expr Expr -- e1 + e2 | ELet Id Expr Expr -- let x = e1 in e2 | EIf Expr Expr Expr -- if e1 then e2 else e3

# Ejercicio (6)

Definir un int´erprete:

eval :: Expr -> Env Val -> Val

# Int´erprete funcional (primer intento)

# Ejercicio

Evaluar el siguiente programa con el int´erprete reci´en definido:

let suma = \ x -> \ y -> x + y in   
let f = suma 5 in   
let $\mathrm { ~ \tt ~ x ~ } = \mathrm { ~ 0 ~ }$ in f 3

# Int´erprete funcional (primer intento)

# Ejercicio

Evaluar el siguiente programa con el int´erprete reci´en definido:

let suma = \ x -> \ y -> x + y in   
let f = suma 5 in   
let $\mathrm { ~ \tt ~ x ~ } = \mathrm { ~ 0 ~ }$ in f 3

Problema: captura de variables

Querr´ıamos que el resultado sea 8 pero es 3.

# Int´erprete funcional (primer intento)

# Ejercicio

Evaluar el siguiente programa con el int´erprete reci´en definido:

let suma = \ x -> \ y -> x + y in   
let f = suma 5 in   
let $\mathrm { ~ \tt ~ x ~ } = \mathrm { ~ 0 ~ }$ in f 3

# Problema: captura de variables

Querr´ıamos que el resultado sea 8 pero es 3.

El problema es que la variable f queda ligada al valor:

VFunction "y" (EAdd (EVar "x") (EVar "y")) La variable x est´a libre.

Int´erprete funcional (segundo intento: con clausuras)

# Segundo intento

El valor de una funci´on es una clausura.

Una clausura es un valor que incluye:

1. El c´odigo fuente de la funci´on.   
2. Un entorno que le da valor a todas sus variables libres.

$$
2 4
$$

Int´erprete funcional (segundo intento: con clausuras)

# Segundo intento

El valor de una funci´on es una clausura.

Una clausura es un valor que incluye:

1. El c´odigo fuente de la funci´on.   
2. Un entorno que le da valor a todas sus variables libres.

data Val $=$ VN Int | VB Bool | VClosure Id Expr (Env Val)

# Int´erprete funcional (segundo intento: con clausuras)

Recordemos las expresiones del c´alculo- $\lambda$ con enteros y booleanos:

data Expr = EVar Id -- x | ELam Id Expr -- \ x -> e | EApp Expr Expr -- e1 e2 EConstNum Int -- 1, 2, 3, ... 1 EConstBool Bool -- True, False EAdd Expr Expr -- e1 + e2 | ELet Id Expr Expr -- let x = e1 in e2 | EIf Expr Expr Expr -- if e1 then e2 else e3

# Int´erprete funcional (segundo intento: con clausuras)

Recordemos las expresiones del c´alculo- $\lambda$ con enteros y booleanos:

data Expr = EVar Id -- x | ELam Id Expr -- \ x -> e | EApp Expr Expr -- e1 e2 EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False EAdd Expr Expr -- e1 + e2 | ELet Id Expr Expr -- let x = e1 in e2 | EIf Expr Expr Expr -- if e1 then e2 else e3

# Ejercicio (7)

Definir un int´erprete usando clausuras:

eval :: Expr -> Env Val -> Val

# Estrategias de evaluaci´on

Hay distintas t´ecnicas para evaluar una aplicaci´on (e1 e2).

# Estrategias de evaluaci´on

Hay distintas t´ecnicas para evaluar una aplicaci´on (e1 e2).   
Estas t´ecnicas se conocen como estrategias de evaluaci´on.

# Estrategias de evaluaci´on

Hay distintas t´ecnicas para evaluar una aplicaci´on (e1 e2).   
Estas t´ecnicas se conocen como estrategias de evaluaci´on.

El int´erprete que hicimos reci´en usa la siguiente estrategia:

1. Llamada por valor (call-by-value): Se eval´ua e1 hasta que sea una clausura. Se eval´ua e2 hasta que sea un valor. Se procede con la evaluaci´on del cuerpo de la funci´on. El par´ametro queda ligado al valor de e2.

# Estrategias de evaluaci´on

Hay distintas t´ecnicas para evaluar una aplicaci´on (e1 e2).   
Estas t´ecnicas se conocen como estrategias de evaluaci´on.

El int´erprete que hicimos reci´en usa la siguiente estrategia:

1. Llamada por valor (call-by-value):

Se eval´ua e1 hasta que sea una clausura.

Se eval´ua e2 hasta que sea un valor.

Se procede con la evaluaci´on del cuerpo de la funci´on.

El par´ametro queda ligado al valor de e2. Hay otras estrategias de evaluaci´on; por ejemplo:

2. Llamada por nombre (call-by-name):

Se eval´ua e1 hasta que sea una clausura.   
Se procede directamente a evaluar el cuerpo de la funci´on.   
El par´ametro queda ligado a la expresi´on e2 sin evaluar.   
Cada vez que se usa el par´ametro, se eval´ua la expresi´on e2.

# Estrategias de evaluaci´on

Hay distintas t´ecnicas para evaluar una aplicaci´on (e1 e2).   
Estas t´ecnicas se conocen como estrategias de evaluaci´on.

El int´erprete que hicimos reci´en usa la siguiente estrategia:

1. Llamada por valor (call-by-value):

Se eval´ua e1 hasta que sea una clausura.

Se eval´ua e2 hasta que sea un valor.

Se procede con la evaluaci´on del cuerpo de la funci´on.

El par´ametro queda ligado al valor de e2. Hay otras estrategias de evaluaci´on; por ejemplo:

# 2. Llamada por nombre (call-by-name):

Se eval´ua e1 hasta que sea una clausura.   
Se procede directamente a evaluar el cuerpo de la funci´on.   
El par´ametro queda ligado a la expresi´on e2 sin evaluar.   
Cada vez que se usa el par´ametro, se eval´ua la expresi´on e2.

# 3. Llamada por necesidad (call-by-need):

$$
^ { 2 6 }
$$

(La veremos en un rato).

# Int´erprete call-by-name

En la estrategia de evaluaci´on call-by-name:

Al evaluar (let $\texttt { x } = \texttt { e 1 }$ in e2) se eval´ua directamente e2.   
La variable x queda ligada a una copia no evaluada de e1.

$$
^ { 2 7 }
$$

# Int´erprete call-by-name

En la estrategia de evaluaci´on call-by-name:

Al evaluar (let $\texttt { x } = \texttt { e 1 }$ in e2) se eval´ua directamente e2.   
La variable x queda ligada a una copia no evaluada de e1.   
Los entornos no asocian identificadores a valores. Los entornos asocian identificadores a thunks.

$$
^ { 2 7 }
$$

# Int´erprete call-by-name

En la estrategia de evaluaci´on call-by-name:

Al evaluar (let $\texttt { x } = \texttt { e 1 }$ in e2) se eval´ua directamente e La variable x queda ligada a una copia no evaluada de e1. Los entornos no asocian identificadores a valores. Los entornos asocian identificadores a thunks.

# Thunks

Un thunk es un dato que incluye:

1. Una expresi´on no evaluada.   
2. Un entorno que le da valor a todas sus variables libres.

# Int´erprete call-by-name

En la estrategia de evaluaci´on call-by-name:

Al evaluar (let $\texttt { x } = \texttt { e 1 }$ in e2) se eval´ua directamente e La variable x queda ligada a una copia no evaluada de e1. Los entornos no asocian identificadores a valores. Los entornos asocian identificadores a thunks.

# Thunks

Un thunk es un dato que incluye:

1. Una expresi´on no evaluada.   
2. Un entorno que le da valor a todas sus variables libres.

Los thunks y valores se definen del siguiente modo:

data Thunk $=$ TT Expr (Env Thunk)

data Val $=$ VN Int

$$
^ { 2 7 }
$$

# Int´erprete call-by-name

Recordemos las expresiones del c´alculo- $\lambda$ con enteros y booleanos:

data Expr = EVar Id -- x | ELam Id Expr -- \ x -> e | EApp Expr Expr -- e1 e2 EConstNum Int -- 1, 2, 3, ... 1 EConstBool Bool -- True, False EAdd Expr Expr -- e1 + e2 | ELet Id Expr Expr -- let x = e1 in e2 | EIf Expr Expr Expr -- if e1 then e2 else e3

# Int´erprete call-by-name

Recordemos las expresiones del c´alculo- $\lambda$ con enteros y booleanos:

data Expr = EVar Id -- x | ELam Id Expr -- \ x -> e | EApp Expr Expr -- e1 e2 1 EConstNum Int -- 1, 2, 3, ... | EConstBool Bool -- True, False EAdd Expr Expr -- e1 + e2 | ELet Id Expr Expr -- let x = e1 in e2 | EIf Expr Expr Expr -- if e1 then e2 else e3

# Ejercicio (8)

Definir un int´erprete que use la estrategia call-by-name:

eval :: Expr -> Env Thunk -> Val

¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?