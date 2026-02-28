# Cálculo (λx.Lxmbdx) a

Paradigmas de Lenguajes de Programación

Departamento de Ciencias de la Computación Universidad de Buenos Aires

26 de septiembre de 2025

# Dada la siguiente expresión:

$\lambda x$ : Bool. λy : Bool Bool. y $( y \ x )$ ) ( $\lambda z$ : Bool. true) false) (λw : Bool. w)

¿Qué significa esto? ¿Significa algo? ¿Es válido? ¿Es un valor? ¿Cómo nos damos cuenta?

# Vamos a ver

Sintaxis del cálculo lambda   
Tipado   
Semántica operacional, estrategias de reducción   
Extensión de números naturales

Los tipos del cálculo lambda simplemente tipado con booleanos se definen mediante la siguiente gramática:

$$
\sigma : : = { \mathsf { B o o l } } \mid \sigma \to \sigma
$$

# Sintaxis

Los tipos del cálculo lambda simplemente tipado con booleanos se definen mediante la siguiente gramática:

$$
\sigma : : = { \mathsf { B o o l } } \mid \sigma \to \sigma
$$

y sus términos son los siguientes:

$M : : = x \mid \lambda x : \sigma . M \mid M M \mid { \mathsf { t r u e } } \mid { \mathsf { f a l s e } } \mid { \mathsf { i f } } \ N$ $M$ then $M$ else $M$

donde $x \in \mathcal { X }$ , el conjunto de todas las variables. Llamamos $\tau$ al conjunto de todos los términos.

# Sintaxis

Los tipos del cálculo lambda simplemente tipado con booleanos se definen mediante la siguiente gramática:

$$
\sigma : : = { \mathsf { B o o l } } \mid \sigma \to \sigma
$$

y sus términos son los siguientes:

$M : : = x \mid \lambda x : \sigma . M \mid M M \mid { \mathrm { t r u e } } \mid { \mathsf { f a l s e } } \mid { \mathsf { i f } } \ N$ $M$ then $M$ else $M$

donde $x \in \mathcal { X }$ , el conjunto de todas las variables. Llamamos $\tau$ al conjunto de todos los términos.

# Variables libres y ligadas

Las variables libres son todas aquellas fuera del alcance de las λs. Se define la función $\mathsf { f v } : { \mathcal T } \to { \mathcal P } ( { \mathcal X } )$ , que dado un término devuelve un conjunto de las variables libres en él.

# Sintaxis

Los tipos del cálculo lambda simplemente tipado con booleanos se definen mediante la siguiente gramática:

$$
\sigma : : = { \mathsf { B o o l } } \mid \sigma \to \sigma
$$

y sus términos son los siguientes:

$M : : = x \mid \lambda x : \sigma . M \mid M M \mid { \mathrm { t r u e } } \mid { \mathsf { f a l s e } } \mid { \mathsf { i f } } \ N$ $M$ then $M$ else $M$

donde $x \in \mathcal { X }$ , el conjunto de todas las variables. Llamamos $\tau$ al conjunto de todos los términos.

# Variables libres y ligadas

Las variables libres son todas aquellas fuera del alcance de las $\lambda s$ . Se define la función $\mathsf { f v } : { \mathcal T } \to { \mathcal P } ( { \mathcal X } )$ , que dado un término devuelve un conjunto de las variables libres en él.

$$
\begin{array} { c } { \mathsf { f v } ( x ) = \mathsf { \{ x \} } } \\ { \mathsf { f v } ( \lambda x : \sigma . M ) = \mathsf { f v } ( M ) \backslash \{ x \} } \\ { \mathsf { f v } ( M N ) = \mathsf { f v } ( M ) \cup \mathsf { f v } ( N ) } \end{array}
$$

$$
\begin{array} { r } { \mathsf { f v } ( \mathsf { t r u e } ) = \emptyset } \\ { \mathsf { f v } ( \mathsf { f a l s e } ) = \emptyset } \end{array}
$$

fv(if M then $N$ else $O ) = { \mathsf { f v } } ( M ) \cup { \mathsf { f v } } ( N ) \cup { \mathsf { f v } } ( O )$

Los tipos del cálculo lambda simplemente tipado con booleanos se definen mediante la siguiente gramática:

$$
\sigma : : = { \mathsf { B o o l } } \mid \sigma \to \sigma
$$

y sus términos son los siguientes:

$M : : = x \mid \lambda x : \sigma . M \mid M M \mid { \mathrm { t r u e } } \mid { \mathsf { f a l s e } } \mid { \mathsf { i f } } \ N$ $M$ then $M$ else $M$

donde $x \in \mathcal { X }$ , el conjunto de todas las variables. Llamamos $\tau$ al conjunto de todos los términos.

# Variables libres y ligadas

Las variables libres son todas aquellas fuera del alcance de las λs. Se define la función $\mathsf { f v } : { \mathcal T } \to { \mathcal P } ( { \mathcal X } )$ , que dado un término devuelve un conjunto de las variables libres en él.

$$
\begin{array} { c } { \mathsf { f v } ( x ) = \mathsf { \{ x \} } } \\ { \mathsf { f v } ( \lambda x : \sigma . M ) = \mathsf { f v } ( M ) \backslash \{ x \} } \\ { \mathsf { f v } ( M N ) = \mathsf { f v } ( M ) \cup \mathsf { f v } ( N ) } \end{array}
$$

$$
\begin{array} { r } { \mathsf { f v } ( \mathsf { t r u e } ) = \emptyset } \\ { \mathsf { f v } ( \mathsf { f a l s e } ) = \emptyset } \end{array}
$$

fv(if M then N else $O ) = { \mathsf { f v } } ( M ) \cup { \mathsf { f v } } ( N ) \cup { \mathsf { f v } } ( O )$

Un término se llama cerrado si no tiene variables libres, es decir, $M$ es cerrado si y sólo si ${ \mathfrak { f v } } ( M ) = \emptyset$ .

Asociatividad y precedencia $\sigma  \tau  \rho = \sigma  ( \tau  \rho ) \neq ( \sigma  \tau )  \rho$ $M N O = ( M N ) O \neq M ( N O )$ $\lambda x : \sigma . M N = \lambda x : \sigma . ( M N ) \neq ( \lambda x : \sigma . M ) N$

Las flechas en los tipos asocian a derecha. La aplicación asocia a izquierda. El cuerpo de la lambda se extiende hasta el final del término, excepto que haya paréntesis.

Asociatividad y precedencia

$\sigma  \tau  \rho = \sigma  ( \tau  \rho ) \neq ( \sigma  \tau )  \rho$ Las flechas en los tipos asocian a derecha. $M N O = ( M N ) O \neq M ( N O )$ La aplicación asocia a izquierda.   
$\lambda x : \sigma . M N = \lambda x : \sigma . ( M N ) \neq ( \lambda x : \sigma . M ) N$ El cuerpo de la lambda se extiende hasta el final del término, excepto que haya paréntesis.

Ejercicio: ¿Cuáles de las siguientes expresiones son términos del cálculo lambda? En los casos que sí lo sean, dibujar su árbol sintáctico y marcar las ocurrencias libres de las variables.

a) $\lambda x : \mathsf { B o o l } \to \mathsf { B o o l } . x$ true   
b) $x \ y \ \lambda x : \mathsf { B o o l } \to \mathsf { B o o l } . x \ y$   
c) $( \lambda x : { \mathsf { B o o l } } \to { \mathsf { B o o l } } . x \ y ) ( \lambda y : { \mathsf { B o o l } } . x )$   
d) λx : Bool   
e) λx.x   
f ) if $x$ then $y$ else $\lambda z : \mathsf { B o o l } . z$   
g) $\lambda y : \sigma . y$   
h) true false   
i) $\textit { x M }$   
j) if $x$ then $\lambda x : \mathsf { B o o l } . x$

# Tipado

Tipos: La gramática que define los tipos del cálculo lambda simplemente tipado con booleanos es:

$$
\sigma : : = { \mathsf { B o o l } } \mid \sigma \to \sigma
$$

# Tipado

Tipos: La gramática que define los tipos del cálculo lambda simplemente tipado con booleanos es:

$$
\sigma : : = { \mathsf { B o o l } } \mid \sigma \to \sigma
$$

Los contextos son conjuntos finitos de asociaciones entre tipos y variables. Por ejemplo:

$$
\Gamma _ { 1 } = y { \mathrm { : } } { \mathrm { B o o l } } \to { \mathrm { B o o l } } \qquad \Gamma _ { 2 } = y { \mathrm { : } } { \mathrm { B o o l } } \to { \mathrm { B o o l } } , x { \mathrm { : } } { \mathrm { B o o l } }
$$

son contextos válidos,

# Tipado

Tipos: La gramática que define los tipos del cálculo lambda simplemente tipado con booleanos es:

$$
\sigma : : = { \mathsf { B o o l } } \mid \sigma \to \sigma
$$

Los contextos son conjuntos finitos de asociaciones entre tipos y variables. Por ejemplo:

$$
\Gamma _ { 1 } = y { \mathrm { : } } { \mathrm { B o o l } } \to { \mathrm { B o o l } } \qquad \Gamma _ { 2 } = y { \mathrm { : } } { \mathrm { B o o l } } \to { \mathrm { B o o l } } , x { \mathrm { : } } { \mathrm { B o o l } }
$$

son contextos válidos, pero

$$
\Gamma _ { 3 } = y { \mathrm { : B o o l } } \to { \mathsf { B o o l } } , y { \mathrm { : B o o l } }
$$

no lo es.

# Tipado

Tipos: La gramática que define los tipos del cálculo lambda simplemente tipado con booleanos es:

$$
\sigma : : = { \mathsf { B o o l } } \mid \sigma \to \sigma
$$

Los contextos son conjuntos finitos de asociaciones entre tipos y variables. Por ejemplo:

$$
\Gamma _ { 1 } = y { \mathrm { : } } { \mathrm { B o o l } } \to { \mathrm { B o o l } } \qquad \Gamma _ { 2 } = y { \mathrm { : } } { \mathrm { B o o l } } \to { \mathrm { B o o l } } , x { \mathrm { : } } { \mathrm { B o o l } }
$$

son contextos válidos, pero

$$
\Gamma _ { 3 } = y { \mathrm { : B o o l } } \to { \mathsf { B o o l } } , y { \mathrm { : B o o l } }
$$

no lo es.

Juicios de tipado: Un juicio de tipado es la relación $\Gamma \vdash M : \tau$ y se lee “en el contexto $\Gamma$ , $M$ es de tipo $\tau$ ”.

# Tipado

Tipos: La gramática que define los tipos del cálculo lambda simplemente tipado con booleanos es:

$$
\sigma : : = { \mathsf { B o o l } } \mid \sigma \to \sigma
$$

Los contextos son conjuntos finitos de asociaciones entre tipos y variables. Por ejemplo:

$$
\Gamma _ { 1 } = y { \mathrm { : } } { \mathrm { B o o l } } \to { \mathrm { B o o l } } \qquad \Gamma _ { 2 } = y { \mathrm { : } } { \mathrm { B o o l } } \to { \mathrm { B o o l } } , x { \mathrm { : } } { \mathrm { B o o l } }
$$

son contextos válidos, pero

$$
\Gamma _ { 3 } = y { \mathrm { : B o o l } } \to { \mathsf { B o o l } } , y { \mathrm { : B o o l } }
$$

no lo es.

Juicios de tipado: Un juicio de tipado es la relación $\Gamma \vdash M : \tau$ y se lee “en el contexto $\Gamma$ , $M$ es de tipo $\tau$ ”. Por ejemplo:

$$
\begin{array} { c } { { \{ x { : } \mathsf { B o o l } \to \mathsf { B o o l } \} \vdash x : \mathsf { B o o l } \to \mathsf { B o o l } } } \\ { { \vdash \mathsf { t r u e } : \mathsf { B o o l } } } \end{array}
$$

$$
\{ f \colon \mathsf { B o o l } \to \mathsf { B o o l } , x \colon \mathsf { B o o l } \} \vdash f x : \mathsf { B o o l }
$$

son juicios de tipado válidos.

# Sistema de tipado

Los juicios de tipado $\Gamma \vdash M : \tau$ válidos se pueden derivar mediante el siguiente sistema de reglas de deducción:

$$
\frac { \Gamma , x : \tau \vdash M : \sigma } { \Gamma \vdash \lambda x : \tau . M : \tau  \sigma } \ T . A b s \qquad \frac { \Gamma \vdash M : \tau  \sigma \quad \Gamma \vdash \sigma } { \Gamma \vdash M N : \sigma }
$$

Ejercicio: chequeo de tipos Derivar los siguientes juicios de tipado, o explicar por qué no son válidos. a) ⊢ (λx : Bool.λy : Bool.if $x$ then true else $y$ ) false : Bool Bool

Ejercicio: chequeo de tipos   
Derivar los siguientes juicios de tipado, o explicar por qué no son válidos. a) ⊢ (λx : Bool.λy : Bool.if $x$ then true else $y$ ) false : Bool Bool b) $\{ x : \mathsf { B o o l } \} \vdash$ true : Bool

Ejercicio: chequeo de tipos Derivar los siguientes juicios de tipado, o explicar por qué no son válidos.

a) $\vdash ( \lambda x : \mathsf { B o o l } . \lambda y : \mathsf { B o o l }$ .if $x$ then true else $y$ ) false : Bool Bool   
b) $\{ x : \mathsf { B o o l } \} \vdash$ true : Bool   
${ \mathsf { c } } ) \vdash$ if $x$ then $x$ else $z$ : Bool

Ejercicio: chequeo de tipos Derivar los siguientes juicios de tipado, o explicar por qué no son válidos.

a) ⊢ (λx : Bool.λy : Bool.if $x$ then true else $y$ ) false : Bool Bool   
b) $\{ x : { \mathsf { B o o l } } \} \vdash \mathsf { t r u e } : { \mathsf { B o o l } }$   
${ \mathsf { c } } ) \vdash { \mathsf { i f } } \ x$ then $x$ else $z$ : Bool   
d) $\{ x : \mathsf { B o o l } \} \vdash$ if $x$ then $x$ else $( \lambda y : \mathsf { B o o l } . y ) : \mathsf { B o o l } \to \mathsf { B o o l }$   
Ejercicio: chequeo de tipos con incógnitas   
Derivar un juicio de tipado para el siguiente término:   
$\lambda x : \rho . \lambda y : \sigma . \lambda z : \tau . x ( x y z )$ (identificando qué tipos pueden ser $\tau$ , $\sigma$ y $\rho$ )   
Ejercicio: chequeo de tipos con incógnitas   
Derivar un juicio de tipado para el siguiente término:   
$\lambda x : \rho . \lambda y : \sigma . \lambda z : \tau . x ( x y z )$ (identificando qué tipos pueden ser $\tau$ , $\sigma$ y $\rho$ )

Ejercicio: tipos habitados

Decimos que un tipo $\tau$ está habitado si existe un término $M$ tal que el juicio $\vdash M : \tau$ es derivable.

Ejercicio: chequeo de tipos con incógnitas

Derivar un juicio de tipado para el siguiente término:

$\lambda x : \rho . \lambda y : \sigma . \lambda z : \tau . x ( x y z )$ (identificando qué tipos pueden ser $\tau$ , $\sigma$ y $\rho$ )

Ejercicio: tipos habitados

Decimos que un tipo $\tau$ está habitado si existe un término $M$ tal que el juicio $\vdash M : \tau$ es derivable.

Demostrar si los siguientes tipos están habitados (para cualquier $\sigma , \tau , \rho )$

a) $\sigma  \tau  \sigma$

Ejercicio: chequeo de tipos con incógnitas   
Derivar un juicio de tipado para el siguiente término:   
$\lambda x : \rho . \lambda y : \sigma . \lambda z : \tau . x ( x y z )$ (identificando qué tipos pueden ser $\tau$ , $\sigma$ y $\rho$ )

Ejercicio: tipos habitados

Decimos que un tipo $\tau$ está habitado si existe un término $M$ tal que el juicio $\vdash M : \tau$ es derivable.

Demostrar si los siguientes tipos están habitados (para cualquier $\sigma , \tau , \rho )$

a) $\sigma  \tau  \sigma$ b) $( \tau  \rho )  ( \sigma  \tau )  ( \sigma  \rho )$

Ejercicio: chequeo de tipos con incógnitas   
Derivar un juicio de tipado para el siguiente término:   
$\lambda x : \rho . \lambda y : \sigma . \lambda z : \tau . x ( x y z )$ (identificando qué tipos pueden ser $\tau$ , $\sigma$ y $\rho$ )

Ejercicio: tipos habitados

Decimos que un tipo $\tau$ está habitado si existe un término $M$ tal que el juicio $\vdash M : \tau$ es derivable.

Demostrar si los siguientes tipos están habitados (para cualquier $\sigma , \tau , \rho )$

a) $\sigma  \tau  \sigma$   
b) $( \tau  \rho )  ( \sigma  \tau )  ( \sigma  \rho )$   
c) $\sigma \to \tau$

# Semántica operacional

Consiste en un conjunto de reglas que definen la relación de reducción entre términos.   
Cuando $M  N$ , decimos que $M$ reduce o reescribe a $N$ .

# Semántica operacional

Consiste en un conjunto de reglas que definen la relación de reducción entre términos.   
Cuando $M  N$ , decimos que $M$ reduce o reescribe a $N$ .

# Formas normales

Un término es o está en forma normal cuando no existe ninguna regla que lo reduzca a otro.

# Semántica operacional

Consiste en un conjunto de reglas que definen la relación de reducción entre términos.   
Cuando $M  N$ , decimos que $M$ reduce o reescribe a $N$ .

# Formas normales

n término es o está en forma normal cuando no existe ninguna regla que lo reduzca a otro.

# Determinismo

Decimos que la reducción está determinada (hay determinismo) cuando cada término que no está en forma normal tiene una única forma de reducir.

# Semántica operacional

Consiste en un conjunto de reglas que definen la relación de reducción entre términos.   
Cuando $M  N$ , decimos que $M$ reduce o reescribe a $N$ .

# Formas normales

n término es o está en forma normal cuando no existe ninguna regla que lo reduzca a otro.

# Determinismo

Decimos que la reducción está determinada (hay determinismo) cuando cada término que no está en forma normal tiene una única forma de reducir.

# Estrategias de reducción

Para implementar un lenguaje, necesitamos una relación de reducción que esté determinada. Existen estrategias call-by-name y call-by-value. En la parte práctica de la materia vamos a usar la estrategia call-by-value, y en particular nos va a interesar mantener el determinismo de las reglas de reducción.

# Semántica operacional

La siguiente gramática de valores y las reglas de reducción definen la estrategia call-by-value.

$$
V : : = \mathsf { t r u e } \mid \mathsf { f a l s e } \mid \lambda x : \sigma . M
$$

La siguiente gramática de valores y las reglas de reducción definen la estrategia call-by-value.

$$
V : : = \mathsf { t r u e } \mid \mathsf { f a l s e } \mid \lambda x : \sigma . M
$$

$( \lambda x : \sigma . M ) V \to M \{ x : = V \}$ if true then $M$ else $N  M$ if false then $M$ else $N  N$

(E-AppAbs o β) (E-IfTrue) (E-IfFalse)

# Semántica operacional

La siguiente gramática de valores y las reglas de reducción definen la estrategia call-by-value.

$$
V : : = \mathsf { t r u e } \mid \mathsf { f a l s e } \mid \lambda x : \sigma . M
$$

$( \lambda x : \sigma . M ) V \to M \{ x : = V \}$ (E-AppAbs o β) if true then $M$ else $N  M$ (E-IfTrue) if false then $M$ else $N  N$ (E-IfFalse)

Si $M  N$ , entonces:

$$
\begin{array} { c } { { M O  N O } } \\ { { { } } } \\ { { V M  V N } } \end{array}
$$

(E-App1 o µ)

(E-App2 o ν)

if $M$ then $O$ else $P $ if $N$ then $O$ else $P$

# Semántica operacional

# Valores

Los valores son los resultados esperados de los programas. Se definen como los términos cerrados y bien tipados $V$ producidos por la gramática de valores.

# Semántica operacional

Valores

Los valores son los resultados esperados de los programas. Se definen como los términos cerrados y bien tipados $V$ producidos por la gramática de valores.

Ejercicio: ¿Cuáles de los siguientes términos son valores?

a) if true then $( \lambda x : \mathsf { B o o l } . x )$ else (λx : Bool.false)

# Semántica operacional

Valores

Los valores son los resultados esperados de los programas. Se definen como los términos cerrados y bien tipados $V$ producidos por la gramática de valores.

Ejercicio: ¿Cuáles de los siguientes términos son valores?

a) if true then $( \lambda x : \mathsf { B o o l } . x )$ else (λx : Bool.false) b) λx : Bool.false

# Semántica operacional

Valores

Los valores son los resultados esperados de los programas. Se definen como los términos cerrados y bien tipados $V$ producidos por la gramática de valores.

Ejercicio: ¿Cuáles de los siguientes términos son valores?

a) if true then $( \lambda x : \mathsf { B o o l } . x )$ else (λx : Bool.false)   
b) $\lambda x : \mathsf { B o o l }$ .false   
c) $( \lambda x : \mathsf { B o o l } . x )$ false

# Semántica operacional

Valores

Los valores son los resultados esperados de los programas. Se definen como los términos cerrados y bien tipados $V$ producidos por la gramática de valores.

Ejercicio: ¿Cuáles de los siguientes términos son valores?

a) if true then $( \lambda x : \mathsf { B o o l } . x )$ else $( \lambda x : \mathsf { B o o l . f a l s e } )$ d) true   
b) $\lambda x : \mathsf { B o o l }$ .false   
c) $( \lambda x : \mathsf { B o o l } . x )$ false

# Semántica operacional

# Valores

Los valores son los resultados esperados de los programas. Se definen como los términos cerrados y bien tipados $V$ producidos por la gramática de valores.

Ejercicio: ¿Cuáles de los siguientes términos son valores?

a) if true then $( \lambda x : \mathsf { B o o l } . x )$ else (λx : Bool.false)   
b) $\lambda x : \mathsf { B o o l }$ .false   
c) $( \lambda x : \mathsf { B o o l } . x )$ false

d) true e) if $x$ then true else false

# Semántica operacional

# Valores

Los valores son los resultados esperados de los programas. Se definen como los términos cerrados y bien tipados $V$ producidos por la gramática de valores.

Ejercicio: ¿Cuáles de los siguientes términos son valores?

a) if true then $( \lambda x : \mathsf { B o o l } . x )$ else (λx : Bool.false)   
b) $\lambda x : \mathsf { B o o l }$ .false   
c) $( \lambda x : \mathsf { B o o l } . x )$ false

d) true e) if $x$ then true else false f) λx : Bool. $( \lambda y : \mathsf { B o o l } . x )$ false

# Semántica operacional

# Valores

Los valores son los resultados esperados de los programas. Se definen como los términos cerrados y bien tipados $V$ producidos por la gramática de valores.

Ejercicio: ¿Cuáles de los siguientes términos son valores?

a) if true then $( \lambda x : \mathsf { B o o l } . x )$ else (λx : Bool.false)   
b) $\lambda x : \mathsf { B o o l }$ .false   
c) $( \lambda x : \mathsf { B o o l } . x )$ false

d) true e) if $x$ then true else false f ) λx : Bool. $( \lambda y : \mathsf { B o o l } . x )$ false g) $\lambda x : \mathsf { B o o l } \to \mathsf { B o o l } . x$ true

# Semántica operacional

# Valores

Los valores son los resultados esperados de los programas. Se definen como los términos cerrados y bien tipados $V$ producidos por la gramática de valores.

Ejercicio: ¿Cuáles de los siguientes términos son valores?

a) if true then $( \lambda x : \mathsf { B o o l } . x )$ else (λx : Bool.false)   
b) λx : Bool.false   
c) $( \lambda x : \mathsf { B o o l } . x )$ false

d) true e) if $x$ then true else false f ) λx : Bool. $( \lambda y : \mathsf { B o o l } . x )$ false g) $\lambda x : \mathsf { B o o l } \to \mathsf { B o o l } . x$ true

Ejercicio: ¿Cuál es el resultado de evaluar las siguientes expresiones? ¿El resultado es siempre un valor? Escribir la reducción paso por paso.

a) $( \lambda x : \mathsf { B o o l } . \lambda y : \mathsf { B o o l }$ .if $x$ then true else $y$ ) false) true

# Semántica operacional

# Valores

Los valores son los resultados esperados de los programas. Se definen como los términos cerrados y bien tipados $V$ producidos por la gramática de valores.

Ejercicio: ¿Cuáles de los siguientes términos son valores?

a) if true then $( \lambda x : \mathsf { B o o l } . x )$ else (λx : Bool.false)   
b) λx : Bool.false   
c) $( \lambda x : \mathsf { B o o l } . x )$ false

d) true e) if $x$ then true else false f ) λx : Bool. $( \lambda y : \mathsf { B o o l } . x )$ false g) $\lambda x : \mathsf { B o o l } \to \mathsf { B o o l } . x$ true

Ejercicio: ¿Cuál es el resultado de evaluar las siguientes expresiones? ¿El resultado es siempre un valor? Escribir la reducción paso por paso.

a) $( \lambda x : \mathsf { B o o l } . \lambda y : \mathsf { B o o l }$ .if $x$ then true else $y$ ) false) true b) (λx : Bool.λy : Bool → Bool.y(yx))(( $\lambda z$ : Bool.true) false)(λw : Bool.w)

Ejercicio: Probar que la semántica operacional de cálculo lambda con booleanos, con la estrategia call-by-value, está determinada.

Es decir, probar que si $M  M _ { 1 }$ y $M  M _ { 2 }$ , entonces $M _ { 1 } = M _ { 2 }$

# Extensión con números naturales

Sintaxis y tipado

Se extienden las gramáticas de términos y tipos de la siguiente manera:

$$
\begin{array} { r l } & { \sigma : : = \dots \mid \mathsf { N a t } } \\ & { M : : = \dots \mid \mathsf { z e r o } \mid \mathsf { s u c c } ( M ) \mid \mathsf { p r e d } ( M ) \mid \mathsf { i s Z e r o } ( M ) } \end{array}
$$

# Extensión con números naturales

Sintaxis y tipado

Se extienden las gramáticas de términos y tipos de la siguiente manera:

$$
\begin{array} { r l } & { \sigma : : = \dots \mid \mathsf { N a t } } \\ & { M : : = \dots \mid \mathsf { z e r o } \mid \mathsf { s u c c } ( M ) \mid \mathsf { p r e d } ( M ) \mid \mathsf { i s Z e r o } ( M ) } \end{array}
$$

Se extiende el sistema de tipado con las siguientes reglas:

# Extensión con números naturales

Semántica operacional

Se extienden los valores de la siguiente manera:

$$
V : : = \dots | \mathsf { z e r o } | \mathsf { s u c c } ( V )
$$

Además, usamos la notación $\underline { n }$ para succn(zero) con $n \geq 0$

# Extensión con números naturales

Semántica operacional

Se extienden los valores de la siguiente manera:

$$
V : : = \dots | \mathsf { z e r o } | \mathsf { s u c c } ( V )
$$

Además, usamos la notación $\underline { n }$ para succn(zero) con $n \geq 0$ . Se extiende la semántica operacional con las siguientes reglas:

$\mathsf { p r e d } ( \mathsf { s u c c } ( V ) ) \to V$ (E-PredSucc) $\mathsf { i s Z e r o } ( \mathsf { z e r o } ) \to \mathsf { t r u e }$ (E-IsZero0) $\mathsf { i s Z e r o } ( \mathsf { s u c c } ( V ) ) \to \mathsf { f a l s e }$ (E-IsZeron)

# Extensión con números naturales

Semántica operacional

Se extienden los valores de la siguiente manera:

$$
V : : = \dots | \mathsf { z e r o } | \mathsf { s u c c } ( V )
$$

Además, usamos la notación $\underline { n }$ para succn(zero) con $n \geq 0$ . Se extiende la semántica operacional con las siguientes reglas:

$\begin{array} { r } { \mathsf { p r e d } ( \mathsf { s u c c } ( V ) ) \to V } \\ { \mathsf { i s Z e r o } ( \mathsf { z e r o } ) \to \mathsf { t r u e } } \\ { \mathsf { i s Z e r o } ( \mathsf { s u c c } ( V ) ) \to \mathsf { f a l s e } } \end{array}$ (E-PredSucc) (E-IsZero0) (E-IsZeron)

Si $M  N$ , entonces:

$\mathsf { s u c c } ( M ) \to \mathsf { s u c c } ( N )$ (E-Succ)

$\mathsf { p r e d } ( M ) \to \mathsf { p r e d } ( N )$ (E-Pred)

$\mathsf { i s Z e r o } ( M ) \to \mathsf { i s Z e r o } ( N )$ (E-IsZero)

# Extensión con números naturales

# Ejercicio

a) Esta extensión ¿mantiene las propiedades de determinismo, preservación de tipos y progreso?

# Extensión con números naturales

# Ejercicio

a) Esta extensión ¿mantiene las propiedades de determinismo, preservación de tipos y progreso? b) ¿Qué términos representan las expresiones $\underline { { 0 } } , \underline { { 1 } }$ y 2? ¿Cómo reducen?

# Extensión con números naturales

# Ejercicio

a) Esta extensión ¿mantiene las propiedades de determinismo, preservación de tipos y progreso?   
b) ¿Qué términos representan las expresiones 0, 1 y 2? ¿Cómo reducen?   
c) Demostrar los siguientes juicios de tipado, o explicar por qué no son válidos: $\mathbf { \mu } _ { * } \vdash ( \lambda x : \mathsf { N a t . s u c c } ( x ) )$ zero : Nat

# Extensión con números naturales

# Ejercicio

a) Esta extensión ¿mantiene las propiedades de determinismo, preservación de tipos y progreso?   
b) ¿Qué términos representan las expresiones 0, 1 y 2? ¿Cómo reducen?   
c) Demostrar los siguientes juicios de tipado, o explicar por qué no son válidos: $\ast \vdash ( \lambda x : \mathsf { N a t . s u c c } ( x ) )$ zero : Nat ∗ x : Bool ⊢ succ(zero) : Nat

# Extensión con números naturales

# Ejercicio

a) Esta extensión ¿mantiene las propiedades de determinismo, preservación de tipos y progreso?

b) ¿Qué términos representan las expresiones 0, 1 y 2? ¿Cómo reducen?

c) Demostrar los siguientes juicios de tipado, o explicar por qué no son válidos:

$\ast \vdash ( \lambda x : \mathsf { N a t . s u c c } ( x ) )$ zero : Nat ∗ $x : { \mathsf { B o o l } } \vdash \mathsf { s u c c } ( z \in \mathsf { r o } ) : { \mathsf { N a t } }$ ∗ $x : { \mathsf { B o o l } } \vdash$ if $x$ then $x$ else zero : Nat

# Extensión con números naturales

# Ejercicio

a) Esta extensión ¿mantiene las propiedades de determinismo, preservación de tipos y progreso?   
b) ¿Qué términos representan las expresiones 0, 1 y 2? ¿Cómo reducen?   
c) Demostrar los siguientes juicios de tipado, o explicar por qué no son válidos: $\mathbf { \mu } _ { * } \vdash ( \lambda x : \mathsf { N a t . s u c c } ( x ) )$ zero : Nat ∗ $x : { \mathsf { B o o l } } \vdash \mathsf { s u c c } ( z \in \mathsf { r o } ) : { \mathsf { N a t } }$ ∗ $x : { \mathsf { B o o l } } \vdash$ if $x$ then $x$ else zero : Nat   
d) Escribir la reducción paso por paso de los siguientes términos: $^ *$ isZero(succ(pred(succ(zero))))

# Extensión con números naturales

# Ejercicio

a) Esta extensión ¿mantiene las propiedades de determinismo, preservación de tipos y progreso?   
b) ¿Qué términos representan las expresiones 0, 1 y 2? ¿Cómo reducen?   
c) Demostrar los siguientes juicios de tipado, o explicar por qué no son válidos: $\mathbf { \mu } _ { * } \vdash ( \lambda x : \mathsf { N a t . s u c c } ( x ) )$ zero : Nat ∗ $x : { \mathsf { B o o l } } \vdash \mathsf { s u c c } ( z \in \mathsf { r o } ) : { \mathsf { N a t } }$ ∗ $x : { \mathsf { B o o l } } \vdash$ if $x$ then $x$ else zero : Nat

d) Escribir la reducción paso por paso de los siguientes términos: $^ *$ isZero(succ(pred(succ(zero)))) $^ *$ isZero(pred(succ(pred(zero))))

# Extensión con números naturales

# Ejercicio

a) Esta extensión ¿mantiene las propiedades de determinismo, preservación de tipos y progreso?   
b) ¿Qué términos representan las expresiones 0, 1 y 2? ¿Cómo reducen?   
c) Demostrar los siguientes juicios de tipado, o explicar por qué no son válidos: $\ast \vdash ( \lambda x : \mathsf { N a t . s u c c } ( x ) )$ zero : Nat $^ *$ $x : { \mathsf { B o o l } } \vdash \mathsf { s u c c } ( z \in \mathsf { r o } ) : { \mathsf { N a t } }$ ∗ $x : { \mathsf { B o o l } } \vdash$ if $x$ then $x$ else zero : Nat

d) Escribir la reducción paso por paso de los siguientes términos: $^ *$ isZero(succ(pred(succ(zero)))) $^ *$ isZero(pred(succ(pred(zero)))) $^ *$ isZero(pred(succ(pred $( x )$ )))

# Extensión con números naturales

# Ejercicio

a) Esta extensión ¿mantiene las propiedades de determinismo, preservación de tipos y progreso?   
b) ¿Qué términos representan las expresiones 0, 1 y 2? ¿Cómo reducen?   
c) Demostrar los siguientes juicios de tipado, o explicar por qué no son válidos: $\ast \vdash ( \lambda x : \mathsf { N a t . s u c c } ( x ) )$ zero : Nat $^ *$ $x : { \mathsf { B o o l } } \vdash \mathsf { s u c c } ( z \in \mathsf { r o } ) : { \mathsf { N a t } }$ ∗ $x : { \mathsf { B o o l } } \vdash$ if $x$ then $x$ else zero : Nat

d) Escribir la reducción paso por paso de los siguientes términos: $^ *$ $\begin{array} { r l } & { \mathsf { i s Z e r o } ( \mathsf { s u c c } ( \mathsf { p r e d } ( \mathsf { s u c c } ( \mathsf { z e r o } ) ) ) ) } \\ & { \mathsf { i s Z e r o } ( \mathsf { p r e d } ( \mathsf { s u c c } ( \mathsf { p r e d } ( \mathsf { z e r o } ) ) ) ) } \\ & { \mathsf { i s Z e r o } ( \mathsf { p r e d } ( \mathsf { s u c c } ( \mathsf { p r e d } ( \boldsymbol { x } ) ) ) ) } \end{array}$ $^ *$ $^ *$

Regla opcional si queremos recuperar la propiedad de Progreso:

$$
\mathsf { p r e d } ( z \mathsf { e r o } ) \to z \mathsf { e r o }
$$

Notar que esto cambia la semántica.

# Simplificando la escritura

Podemos definir macros para expresiones que vayamos a utilizar con frecuencia. Por ejemplo:

Idτ def=

# Simplificando la escritura

Podemos definir macros para expresiones que vayamos a utilizar con frecuencia. Por ejemplo:

$I d _ { \tau } \overset { d e f } { = } \lambda x : \tau . x$ and def=

Podemos definir macros para expresiones que vayamos a utilizar con frecuencia. Por ejemplo:

$$
I d _ { \tau } \overset { d e f } { = } \lambda x : \tau . x
$$

and ${ \stackrel { d e f } { = } } \lambda x$ : Bool.λy : Bool.if $x$ then $y$ else false

# Cambiando reglas semánticas

Supongamos que agregamos la siguiente regla para las abstracciones: Si $M  N$ , entonces:

$$
\lambda x \colon \tau . M \to \lambda x \colon \tau . N
$$

# Cambiando reglas semánticas

Supongamos que agregamos la siguiente regla para las abstracciones: Si $M  N$ , entonces:

$$
\lambda x \colon \tau . M \to \lambda x \colon \tau . N
$$

# Ejercicio

1. Repensar el conjunto de valores para respetar esta modificación, pensar por ejemplo si λx : Bool.IdBool true es o no un valor.

# Cambiando reglas semánticas

Supongamos que agregamos la siguiente regla para las abstracciones: Si $M  N$ , entonces:

$$
\lambda x \colon \tau . M \to \lambda x \colon \tau . N
$$

# Ejercicio

1. Repensar el conjunto de valores para respetar esta modificación, pensar por ejemplo si λx : Bool.IdBool true es o no un valor. $i ^ { \textsf { Y } \lambda x : \mathsf { B o o l } . x ? }$

# Cambiando reglas semánticas

Supongamos que agregamos la siguiente regla para las abstracciones: Si $M  N$ , entonces:

$$
\lambda x \colon \tau . M \to \lambda x \colon \tau . N
$$

# Ejercicio

1. Repensar el conjunto de valores para respetar esta modificación, pensar por ejemplo si $\lambda x \colon \mathsf { B o o l } J d _ { \mathsf { B o o l } }$ true es o no un valor. $\therefore \mathsf { Y } \lambda x : \mathsf { B o o l } . x ?$

$V : : = \mathsf { t r u e } \mid \mathsf { f a l s e } \mid \lambda x : \sigma . F \mid \mathsf { z e r o } \mid \mathsf { s u c c } ( V ) ,$ donde $\digamma$ es una forma normal.

2. ¿Qué reglas deberían modificarse para no perder el determinismo?

# Cambiando reglas semánticas

Supongamos que agregamos la siguiente regla para las abstracciones: Si $M  N$ , entonces:

$$
\lambda x \colon \tau . M \to \lambda x \colon \tau . N
$$

# Ejercicio

1. Repensar el conjunto de valores para respetar esta modificación, pensar por ejemplo si $\lambda x \colon \mathsf { B o o l } J d _ { \mathsf { B o o l } }$ true es o no un valor. $\therefore \mathsf { Y } \lambda x : \mathsf { B o o l } . x ?$

$V : : = \mathsf { t r u e } \mid \mathsf { f a l s e } \mid \lambda x : \sigma . F \mid \mathsf { z e r o } \mid \mathsf { s u c c } ( V ) ,$ donde $\digamma$ es una forma normal.

2. ¿Qué reglas deberían modificarse para no perder el determinismo?

$$
\begin{array} { r } { \left( \lambda x : \sigma . F \right) \to F \{ x : = \ \ u \} } \end{array}
$$

3. Utilizando la nueva regla y los valores definidos, reducir la expresión: λz : Nat Nat. $( \lambda x \colon \mathsf { N a t } \to \mathsf { N a t . } x \ \underline { { 2 3 } } ) \lambda z \colon \mathsf { N a t . }$ 0

# Cambiando reglas semánticas

Supongamos que agregamos la siguiente regla para las abstracciones: Si $M  N$ , entonces:

$$
\lambda x \colon \tau . M \to \lambda x \colon \tau . N
$$

# Ejercicio

3. Utilizando la nueva regla y los valores definidos, reducir la expresión:

$$
\begin{array} { r l } & { \lambda z : \mathsf { N a t } \to \mathsf { N a t . } ( \lambda x : \mathsf { N a t } \to \mathsf { N a t . } x \xrightarrow { \mathrm { 2 3 } } ) \lambda z : \mathsf { N a t . } \underline { { \mathrm { 0 } } } } \\ & { \to _ { \zeta , \beta } \lambda z : \mathsf { N a t } \to \mathsf { N a t . } ( \lambda z : \mathsf { N a t . } \underline { { \mathrm { 0 } } } ) \ \underline { { \mathrm { 2 3 } } } } \\ & { \to _ { \zeta , \beta } \lambda z : \mathsf { N a t } \to \mathsf { N a t . } \underline { { \mathrm { 0 } } } } \end{array}
$$

¿Qué se puede concluir? ¿Tiene sentido o no agregar esta regla?

# Para la próxima clase: extensiones

Intenten hacer los ejercicios $2 0 \ y \ 2 1$ de la guía 4 (extensiones con pares y uniones disjuntas) para la próxima clase práctica.

Continuará...

# ¿? ¿? ¿? ¿? ¿? ¿? ¿? ¿? ¿? ¿? ¿? ¿? ¿?

(λx: Clase.fin x) (Cálculo Lambda I)