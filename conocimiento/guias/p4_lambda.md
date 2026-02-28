# Práctica No 4 - Cálculo- $\lambda$ : Tipado y Semántica Operacional

Los ejercicios marcados con el símbolo $\star$ constituyen un subconjunto mínimo de ejercitación. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

A menos que se especiquen las extensiones a utilizar, trabajaremos con el cálculo $\lambda$ con los tipos Bool, Nat y funciones.

Notación para este segmento de la materia:

las letras $M , N , O , P , \ldots$ denotan términos.   
$-$ las letras $V , W , \ldots$ denotan valores.   
las letras griegas $\rho , \sigma , \tau , \ldots$ denotan tipos.

Gramáticas a tener en cuenta:

Términos $M : : = x \mid \lambda x \colon \tau . \ M \mid M \ M \mid$ true | false $|$ if $M$ then $M$ else M | zero | succ(M ) | pred(M ) | isZero(M )

Donde la letra $x$ representa un nombre de variable arbitrario. Dichos nombres se toman de un conjunto innito numerable dado X = {w, w1, w2, . . . , x, x1, x2, . . . , y, y1, y2, . . . , z, z1, z2, . . . }

Tipos $\tau : = { \sf B o o l } \mid { \sf N a t } \mid \tau  \tau$

# Sintaxis

# Ejercicio 1 ⋆

Determinar qué expresiones son sintácticamente válidas (es decir, pueden ser generadas con las gramáticas presentadas) y determinar a qué categoría pertenecen (expresiones de términos o expresiones de tipos):

a) $x$   
b) x x   
c) M   
d) M M   
e) true false   
f) true succ(false true)   
g) λx.isZero(x)   
h) λx : σ. succ(x) i) λx : Bool. succ(x)   
j) $\lambda x$ : if true then Bool else Nat. $x$   
k) $\sigma$   
l) Bool   
m) $\mathsf { B o o l } \to \mathsf { B o o l }$   
n) $\mathsf { B o o l } \to \mathsf { B o o l } \to \mathsf { N a } ^ { \dag }$ t   
ñ) $( \mathsf { B o o l } \to \mathsf { B o o l } ) \to \mathsf { N a t }$   
o) succ true   
p) $\lambda x$ : Bool. if zero then true else zero succ(true)

# Ejercicio 2

Mostrar un término que utilice al menos una vez todas las reglas de generación de la gramática de los términos y exhibir su árbol sintáctico.

# Ejercicio $\textbf { 3 \star }$

a) Marcar las ocurrencias del término $x$ como subtérmino en $\lambda x$ : Nat. succ(( $\lambda x$ : Nat. x) x).

b) $\dot { \iota }$ Ocurre $x _ { 1 }$ como subtérmino en $\lambda x _ { 1 }$ : Nat. succ $\left( x _ { 2 } \right)$ ?

c) ¾Ocurre $x$ $( y \ z )$ como subtérmino en u x $( y \ z )$ ?

# Ejercicio 4 ⋆

Para los siguientes términos:

a) $u \ x \ ( y \ z ) \ ( \lambda v : \mathsf { B o o l . } \ v \ y )$   
b) (λx : Bool → Nat Bool. λy : Bool Nat. $\lambda z$ : Bool. x z (y z)) u v w   
c) w ( $\lambda x$ : Bool → Nat → Bool. λy : Bool Nat. $\lambda z$ : Bool. x z (y z)) u v Se pide: i Insertar todos los paréntesis de acuerdo a la convención usual.   
ii Dibujar el árbol sintáctico de cada una de las expresiones.   
iii Indicar en el árbol cuáles ocurrencias de variables aparecen ligadas y cuáles libres.   
iv $\mathrm { i } \operatorname { E n }$ cuál o cuáles de los términos anteriores ocurre la siguiente expresión como subtérmino ( $\lambda x \colon \mathsf { B o o l } \to \mathsf { N a t } \to \mathsf { B o o l }$ . λy : Bool Nat. $\lambda z$ : Bool. x z (y z)) $u$

# Tipado

# Ejercicio 5

Mostrar un término que no sea tipable y que no tenga variables libres ni abstracciones.

Ejercicio 6 (Derivaciones ⋆)

Dar una derivación $^ { - 0 }$ explicar por qué no es posible dar una derivación para cada uno de los siguientes juicios de tipado:

a) $\vdash$ if true then zero else succ(zero) : Nat   
b) x : Nat, $y : { \mathsf { B o o l } } \vdash$ if true then false else (λz : Bool. $z$ ) true : Bool   
c) $\vdash$ if $\lambda x$ : Bool. $x$ then zero else succ(zero) : Nat   
d) $x : { \mathsf { B o o l } } \to { \mathsf { N a t } }$ , $y : \mathsf { B o o l } \vdash x \ y : \mathsf { N }$ Nat

# Ejercicio $^ { 7 \star }$

Se modica la regla de tipado de la abstracción y se la cambia por la siguiente regla:

$$
\frac { \Gamma \vdash M : \tau } { \Gamma \vdash \lambda x : \sigma . \ M : \ \sigma  \tau }  _ { i \mathcal { Q } }
$$

Exhibir un juicio de tipado que sea derivable en el sistema original pero que no lo sea en el sistema actual.

# Ejercicio 8

Determinar qué tipo representa $\sigma$ en cada uno de los siguientes juicios de tipado.

a) ⊢ succ(zero) : σ   
b) $\vdash$ isZero(succ(zero)) : σ   
c) ⊢ if (if true then false else false) then zero else succ(zero) : $\sigma$

Ejercicio 9 (Tipos habitados) $\star$

Decimos que un tipo $\tau$ está habitado si existe un término $M$ tal que el juicio $\vdash M : \tau$ es derivable. En ese caso, decimos que $M$ es un habitante de $\tau$ . Por ejemplo, dado un tipo $\sigma$ , la identidad $\lambda x : \sigma . x$ es un habitante del tipo $\sigma \to \sigma$ . Demostrar que los siguientes tipos están habitados (para cualquier $\sigma , \tau \mathrm { ~ y ~ } \rho$ ):

a) $\sigma  \tau  \sigma$ b) $( \sigma  \tau  \rho )  ( \sigma  \tau )  \sigma  \rho$

c) $( \sigma \to \tau \to \rho ) \to \tau \to \sigma \to \rho$ d) $( \tau \to \rho ) \to ( \sigma \to \tau ) \to \sigma \to \rho$

Para pensar: el tipo b es el de la función conocida como Combinador S. $\dot { \iota }$ Con qué función ya conocida de Haskell se corresponden los habitantes de los otros tipos? $\dot { \iota }$ Hay tipos que no estén habitados? ¾Si se reemplaza → por $\Rightarrow$ , las fórmulas habitadas son siempre tautologías? $\dot { \iota }$ Las tautologías son siempre fórmulas habitadas?

# Ejercicio $\mathbf { 1 0 ~ \star }$

Determinar qué tipos representan $\sigma \mathrm { ~ y ~ } \tau$ en cada uno de los siguientes juicios de tipado. Si hay más de una solución, o si no hay ninguna, indicarlo.

a) $x \colon \sigma \vdash \mathsf { i s Z e r o } ( \mathsf { s u c c } ( x ) ) \ : \ \tau$   
b) $\vdash ( \lambda x : \sigma . \ x ) ( \lambda y : \mathsf { B o o l . \ z e r o } ) \ : \ \sigma$   
c) $y { : \tau \vdash }$ if $( \lambda x \colon \sigma . \ x )$ then $y$ else succ(zero) : $\sigma$   
d) $x : \sigma \vdash x \ y : \ \tau$   
e) $x : \sigma , y : \tau \vdash x \ y : \tau$   
f ) $x \colon \sigma \vdash x$ true : $\tau$   
g) $x \colon \sigma \vdash x$ true : $\sigma$   
h) $x \colon \sigma \vdash x \ x : \ \tau$

Ejercicio 11 (Debilitamiento $y$ fortalecimiento)

Demostrar las siguientes propiedades, procediendo por inducción en la derivación del juicio correspondiente:

1. Si $\Gamma \vdash M$ : $\sigma$ es un juicio de tipado derivable y $x$ es una variable que no aparece en $\Gamma$ , entonces $\Gamma , x : \tau \vdash M : \sigma$ es derivable para todo tipo $\tau$ . Esta regla se conoce como debilitamiento o weakening. 2. Si $\Gamma , x : \tau \vdash M : \sigma$ es un juicio de tipado derivable tal que $x$ no aparece libre en $M$ , entonces $\Gamma \vdash M : \sigma$ es derivable para todo tipo $\tau$ . Esta regla se conoce como fortalecimiento o strengthening. 3. Dar un contraejemplo para fortalecimiento en el caso en el que $x$ aparece libre en $M$ .

Ejercicio 12 (Lema de sustitución $\star$ )

Demostrar que si valen $\Gamma , x : \sigma \vdash M : \tau \textnormal { y } \Gamma \vdash N : \sigma$ entonces vale $\Gamma \vdash M \{ { \pmb x } : = { \bf N } \} : \tau$ Sugerencia: proceder por inducción en la estructura del término $M$ .

# Semántica

# Ejercicio $\mathbf { 1 3 ~ \star }$

Sean $\sigma , ~ \tau , ~ \rho$ tipos. Según la denición de sustitución, calcular:

a) $( \lambda y \colon \sigma . \ x \ ( \lambda x \colon \tau . \ x ) ) \{ x : = ( \lambda y \colon \rho . \ x \ y ) \}$ b) $( y \ ( \lambda v \colon \sigma . \ x \ v ) ) \{ x : = ( \lambda y \colon \tau . \ v \ y ) \}$

Renombrar variables en ambos términos para que las sustituciones no cambien su signicado.

Ejercicio 14 (Conmutación de sustituciones)

Sean $M$ , $N$ y $P$ términos del cálculo- $\lambda$ .

a) Por inducción en la estructura del término $M$ , demostrar que si $x$ no aparece libre en $P$ y $x \neq y$ , entonces:

$$
M \{ x : = \mathbf { N } \} \{ y : = \mathbf { P } \} = M \{ y : = \mathbf { P } \} \{ x : = \mathbf { N } \{ y : = \mathbf { P } \} \}
$$

b) Dar un contraejemplo para la ecuación de arriba cuando $x$ aparece libre en $P$ .

# Ejercicio 15 (Valores) ⋆

Dado el conjunto de valores visto en clase:

$$
V : = \lambda x : \tau . \ M \mid { \sf t r u e } \ | { \sf f a l s e } \ | \ z { \sf e r o } \ | \ { \sf s u c c } ( V )
$$

Determinar si cada una de las siguientes expresiones es o no un valor:

a) (λx : Bool. x) true b) λx : Bool. 2 c) λx : Bool. pred(2)

d) λy : Nat. (λx : Bool. pred(2)) true   
e) x   
f) succ(succ(zero))

Ejercicio 16 (Programa, Forma Normal) ⋆

Para el siguiente ejercicio, considerar el cálculo sin la regla pred(zero) zero

Un programa es un término que tipa en el contexto vacío (es decir, no puede contener variables libres). Para cada una de las siguientes expresiones,

a) Determinar si puede ser considerada un programa.

b) Si es un programa, $\dot { \downarrow } ^ { \mathrm { C u \acute { a } l } }$ es el resultado de su evaluación? Determinar si se trata de una forma normal, y en caso de serlo, si es un valor o un error.

i ( $\lambda x$ : Bool. x) true v ( $\lambda f \colon { \mathsf { N a t } }  { \mathsf { B o o l } } .$ f zero) (λx : Nat. isZero(x)) ii λx : Nat. pred(succ(x)) vi (λf : Nat → Bool. x) (λx : Nat. isZero(x)) iii $\lambda x$ : Nat. pred(succ(y)) vii (λf : Nat → Bool. $f$ pred(zero)) (λx : Nat. isZero(x)) iv ( $\lambda x$ : Bool. pred(isZero(x))) true viii x λy : Nat. succ(y)

Ejercicio 17 (Determinismo)

a) ¾Es cierto que la relación denida $ \mathrm { e s t \acute { a } }$ determinada (es una función parcial)? Más precisamente, ¾pasa que si $M  N$ y $M  N ^ { \prime }$ entonces también vale $N = N ^ { \prime }$ ?

b) $\Dot { \iota }$ Vale lo mismo con muchos pasos? Es decir, $\dot { \iota } ^ { \mathrm { e s } }$ cierto que si $M \twoheadrightarrow M ^ { \prime }$ y $M  M ^ { \prime \prime }$ entonces $M ^ { \prime } = M ^ { \prime \prime }$ ?

c) ¾Acaso es cierto que si $M  M ^ { \prime }$ y $M  M ^ { \prime \prime }$ entonces $M ^ { \prime } = M ^ { \prime \prime }$ ?

# Ejercicio 18

a) $\dot { \iota }$ Da lo mismo evaluar succ(pred $( M ) _ { ☉ }$ ) que pred $\left( \mathsf { s u c c } ( M ) \right)$ ? ¾Por qué?

b) ¾Es verdad que para todo término $M$ vale isZero(succ(M )) →→ false? Si no lo es, ¾para qué términos vale?

c) ¾Para qué términos $M$ vale isZero(pred $( M )$ ) $\twoheadrightarrow$ true? (Hay innitos).

# Ejercicio 19

Al agregar la siguiente regla para las abstracciones:

a) Repensar el conjunto de valores para respetar esta modicación, pensar por ejemplo si ( $\lambda x$ : Bool. ( $\lambda y$ : Bool. y) true) es o no un valor.

b) $\dot { \downarrow } \mathrm { Q u 6 }$ reglas deberían modicarse para no perder el determinismo?

c) Utilizando el cálculo modicado y los valores denidos, reducir la siguiente expresión ( $\lambda x \colon \mathsf { N a t } \to \mathsf { N a t . } \ x \ \underline { { 2 3 } } )$ ( $\lambda x$ : Nat. pred(succ(zero))) $\dot { \downarrow } \mathrm { Q u 6 }$ se puede concluir entonces? ¾Es una buena idea agregar esta regla?

# Extensiones

En esta sección puede asumirse, siempre que sea necesario, que el cálculo ha sido extendido con la suma de números naturales $( M + N )$ , con las siguiente reglas de tipado y semántica:

Γ ⊢ M : Nat Γ ⊢ N : Nat + Γ ⊢ M + N : Nat Si $M \to M ^ { \prime }$ entonces: $M + N  M ^ { \prime } + N$ (+c1) Si $N  N ^ { \prime }$ entonces: V + N → V + N ′ $\left( + _ { \mathrm { c 2 } } \right)$ $V + z e r o  V$ $\left( + _ { 0 } \right)$ $V _ { 1 } + { \mathsf { s u c c } } ( V _ { 2 } ) \to { \mathsf { s u c c } } ( V _ { 1 } ) + V _ { 2 }$ $( + \tt s u c c )$

Ejercicio 20 (Pares, o productos) ⋆

Este ejercicio extiende el cálculo- $\lambda$ tipado con pares. Las gramáticas de los tipos y los términos se extienden de la siguiente manera:

$$
\begin{array} { l c l } { \tau } & { \mathrel { \mathop : } = } & { \mathrm { ~ \dots ~ } \big | \mathrm { ~ } \tau \times \tau } \\ { M } & { \mathrel { \mathop : } = } & { \mathrm { ~ \dots ~ } \big | \mathrm { ~ } \langle M , M \rangle \mathrm { ~ } | \mathrm { ~ } \pi _ { 1 } ( M ) \mathrm { ~ } | \mathrm { ~ } \pi _ { 2 } ( M ) } \end{array}
$$

donde $\sigma \times \tau$ es el tipo de los pares cuya primera componente es de tipo $\sigma$ y cuya segunda componente es de tipo $\tau$ , $\langle M , N \rangle$ construye un par y $\pi _ { 1 } ( M )$ y $\pi _ { 2 } ( M )$ proyectan la primera y la segunda componente de un par, respectivamente.

a) Denir reglas de tipado para los nuevos constructores de términos.

b) Usando las reglas de tipado anteriores, $_ \mathrm { y }$ dados los tipos $\sigma , \tau \mathrm { ~ y ~ } \rho$ , exhibir habitantes de los siguientes tipos:

i) Constructor de pares: $\sigma \to \tau \to ( \sigma \times \tau )$   
ii) Proyecciones: $( \sigma \times \tau )  \sigma$ y $( \sigma \times \tau )  \tau$   
iii) Conmutatividad: $( \sigma \times \tau ) \to ( \tau \times \sigma )$ ,   
iv) Asociatividad: $( ( \sigma \times \tau ) \times \rho ) \to ( \sigma \times ( \tau \times \rho ) ) \mathrm { ~ y ~ } ( \sigma \times ( \tau \times \rho ) ) \to ( ( \sigma \times \tau ) \times \rho ) .$   
v) Curricación: $( ( \sigma \times \tau ) \to \rho ) \to ( \sigma \to \tau \to \rho )$ y $( \sigma \to \tau \to \rho ) \to ( ( \sigma \times \tau ) \to \rho )$ .

c) $\Dot { \iota }$ Cómo se extiende el conjunto de los valores?

d) Denir reglas de semántica operacional manteniendo el determinismo y la preservación de tipos. Importante: no olvidar las reglas de congruencia.   
e) Demostrar el determinismo de la relación de reducción denida. $\dot { \iota }$ Se verica la propiedad de preservación de tipos? $\mathcal { L }$ Se verica la propiedad de progreso?

Ejercicio 21 (Uniones disjuntas, también conocidas como co-productos o sumas)

Este ejercicio extiende el cálculo- $\lambda$ tipado con uniones disjuntas. Las gramáticas de los tipos y los términos se extienden de la siguiente manera:

$$
\begin{array} { r l } { \tau } & { : : = \mathrm { ~ \dots ~ } | \mathrm { ~ } \tau + \tau } \\ { M } & { : : = \mathrm { ~ \dots ~ } | \mathrm { ~ } | \mathsf { e f t } _ { \tau } ( M ) \mathrm { ~ } | \mathrm { ~ } \mathrm { r i g h t } _ { \tau } ( M ) \mathrm { ~ } | \mathrm { ~ } \mathsf { c a s e } M \mathsf { o f } \mathrm { ~ } | \mathsf { e f t } ( x ) \rrangle  M \mathrm { ~ } | \mathrm { ~ r i g h t } ( y ) \rrangle  M } \end{array}
$$

donde $\sigma + \tau$ representa el tipo de la unión disjunta entre $\sigma$ y $\tau$ , similar al tipo Either $\sigma \tau$ de Haskell, left $\mathbf { \Omega } _ { \sigma } ( M )$ y $\mathsf { r i g h t } _ { \tau } ( M )$ inyectan un valor en la unión y case $M$ of $\mathsf { l e f t } ( x ) \sim M _ { 1 } \parallel \mathsf { r i g h t } ( y ) \sim M _ { 2 }$ efectúa un análisis de casos del término $M$ comparándolo con los patrones left $\boldsymbol { \sigma } ^ { } ( \boldsymbol { x } )$ y $\mathfrak { r i g h t } _ { \tau } ( y )$ .

a) Denir reglas de tipado para los nuevos constructores de términos.

b) Usando las reglas de tipado anteriores, $_ \mathrm { y }$ dados los tipos $\sigma , \tau \mathrm { ~ y ~ } \rho$ , exhibir habitantes de los siguientes tipos:

i) Inyecciones: $\sigma  ( \sigma + \tau ) \mathrm { ~ y ~ } \tau  ( \sigma + \tau )$ .   
ii) Análisis de casos: $( \sigma + \tau )  ( \sigma  \rho )  ( \tau  \rho )  \rho$ .   
iii) Conmutatividad: $( \sigma + \tau )  ( \tau + \sigma )$ .   
iv) Asociatividad: $\displaystyle { \big ( ( \sigma + \tau ) + \rho \big ) \to \big ( \sigma + ( \tau + \rho ) \big ) \mathrm { ~ y ~ } \big ( \sigma + ( \tau + \rho ) \big ) \to ( ( \sigma + \tau ) + \rho ) . }$   
v) Distributividad del producto sobre la suma: $( \sigma \times ( \tau + \rho ) ) \to ( ( \sigma \times \tau ) + ( \sigma \times \rho ) )$ y $( ( \sigma \times \tau ) + ( \sigma \times \rho ) ) \to$ ${ \bf \chi } ^ { \prime } \sigma \times ( \tau + \rho ) )$ .

vi) Ley de los exponentes1: $( ( \sigma + \tau )  \rho )  ( ( \sigma  \rho ) \times ( \tau  \rho ) )$ y $( ( \sigma  \rho ) \times ( \tau  \rho ) )  ( ( \sigma + \tau )  \rho )$ .

c) $\dot { \iota }$ Cómo se extiende el conjunto de los valores?

d) Denir reglas de semántica operacional manteniendo el determinismo y la preservación de tipos. $\dot { \iota }$ Se verica la propiedad de progreso?

e) Demostrar que la relación de reducción denida tiene la propiedad de preservación de tipos.

# Ejercicio $\mathbf { 2 2 \star }$

Este ejercicio extiende el Cálculo Lambda tipado con listas. Comenzamos ampliando el conjunto de tipos:

$$
\tau \quad : : = \quad . . . \mid [ \tau ]
$$

donde $[ \tau ]$ representa el tipo de las listas cuyas componentes son de tipo $\tau$ . El conjunto de términos ahora incluye:

$M , N , O \quad : : = \quad . . . \mid [ ] _ { \tau } \mid M : : N \mid \mathsf { c a s e } M \mathsf { o f } \left\{ [ \mathbf { \Lambda } ] \mapsto N \mid h : t \mapsto O \right\} \mid \mathbf { f } \approx \mathsf { I } .$ oldr $M$ base ❀ N ; rec(h, r) ❀ O donde

■ $[ ] _ { \sigma }$ es la lista vacía cuyos elementos son de tipo $\sigma$ ;   
■ $M : : N$ agrega $M$ a la lista $N$ ;   
case $M$ of $\{ [ \ ] \sim N \ | \ h : : t \sim O \}$ es el observador de listas. Por su parte, los nombres de variables que se indiquen luego del | ( $h \ y \ t$ en este caso) son variables que pueden aparecer libres en $O$ y deberán ligarse con la cabeza $_ \mathrm { y }$ cola de la lista respectivamente;   
foldr $M$ base $ N$ ; $\operatorname { r e c } ( h , r ) \sim O$ es el operador de recursión estructural (no curricado). Los nombres de variables indicados entre paréntesis $\boldsymbol { h } \mathrm { ~ y ~ } \boldsymbol { r }$ en este caso) son variables que pueden aparecer libres en $O$ $_ \mathrm { y }$ deberán ser ligadas con la cabeza $_ \mathrm { y }$ el resultado de la recursión respectivamente.

Por ejemplo,

case zero :: $\mathsf { s u c c } ( \mathsf { z e r o } ) : : [ \mathbf { \tau } ] _ { \mathsf { N a t } }$ of $\{ [ ] \sim$ false | x :: xs ❀ isZero(x)} →→ true foldr $\underline { { 1 } } : : \underline { { 2 } } : : \underline { { 3 } } : : ( \lambda x : [ \mathsf { N a t } ] . ~ x ) ~ [ ~ ] \mathsf { N a t }$ base zero; rec(head, rec) ❀ head + rec →→ 6 a) Mostrar el árbol sintáctico para los dos ejemplos dados.

b) Agregar reglas de tipado para las nuevas expresiones.

c) Demostrar el siguiente juicio de tipado (recomendación: marcar variables libres y ligadas en el término antes de comenzar).

x : Bool, y : [Bool] ⊢ foldr x :: x :: y base $\sim y$ ; $\operatorname { r e c } ( y , x ) \sim$ if $y$ then $x$ else [ ]Bool : [Bool] d) Mostrar cómo se extiende el conjunto de valores. Estos deben reejar la forma de las listas que un programa podría devolver.

e) Agregar las reglas de reducción asociadas a las nuevas expresiones.

# Ejercicio $\mathbf { 2 3 \star }$

A partir de la extensión del ejercicio 22, denir una nueva extensión que incorpore expresiones de la forma $\mathtt { m a p } ( M , N )$ , donde $N$ es una lista y $M$ una función que se aplicará a cada uno de los elementos de $N$ .

Importante: tener en cuenta las anotaciones de tipos al denir las reglas de tipado y semántica.

# Ejercicio $\mathbf { 2 4 \star }$

A partir de la extensión del ejercicio 22, agregaremos términos para representar listas por comprensión, con un selector $_ \mathrm { y }$ una guarda, de la siguiente manera: $[ M \mid x  S , P ]$ , donde $x$ es el nombre de una variable que puede aparecer libre en los términos $M _ { \mathrm { ~ y ~ } } P$ . La semántica es análoga a la de Haskell: para cada valor de la lista representada por el término $S$ , se sustituye $x$ en $P$ y, de resultar verdadero, se agrega $M$ con $x$ sustituido al resultado. Denir las reglas de tipado, el conjunto de valores $_ \mathrm { y }$ las reglas de semántica para esta extensión.

# Ejercicio 25 (Conectivos booleanos)

Denir como macros (azúcar sintáctica) los términos Not, And, $\mathbf { O r }$ , Xor, que simulen desde la reducción los conectivos clásicos usuales, por ej. And M $N $ true $\Leftrightarrow M $ true y $N $ true.

Notar que denir una macro no es lo mismo que hacer una extensión. Por ejemplo, denir el término $I _ { \sigma } \ { \stackrel { \mathrm { d e f } } { = } } \ \lambda x : \sigma . x$ , que es la función identidad del tipo $\sigma$ , es distinto de extender la sintaxis del lenguaje con términos de la forma $I ( M )$ , lo cual además requeriría agregar nuevas reglas de tipado y de evaluación.

# Ejercicio 26

Denir las siguientes funciones en Cálculo Lambda con Listas (visto en el ejercicio 22). Pueden denirse como macros o como extensiones al cálculo.

Nota: en este ejercicio usamos la notación $M : \sigma$ para decir que la expresión $M$ a denir debe tener tipo $\sigma$ en cualquier contexto.

$$
h e a d _ { \sigma } : [ \sigma ]  \sigma \mathrm { ~ y ~ } t a i l _ { \sigma } : [ \sigma ]  [ \sigma ] \mathrm { ~ ( a s u m i r ~ q u e ~ \perp _ { \sigma } ~ } \stackrel { \mathrm { d e f } } { = } \mathrm { f i x ~ } \lambda x \colon \sigma . \mathrm { ~ } x ) .
$$

b) iterateσ: $( \sigma  \sigma )  \sigma  [ \sigma ]$ que dadas $f$ y $x$ genera la lista innita $x : : f \ x : : f ( f \ x ) : : f ( f ( f \ x ) ) : : . . .$

c) $z i p _ { \rho , \sigma } : [ \rho ] \to [ \sigma ] \to [ \rho \times \sigma ]$ que se comporta como la función homónima de Haskell.

d) $t a k e _ { \sigma } : { \mathsf { N a t } } \to ( [ \sigma ] \to [ \sigma ] )$ que se comporta como la función homónima de Haskell.

# Ejercicio $\mathbf { 2 7 \star }$

Se desea extender el Cálculo Lambda tipado con colas bidireccionales (también conocidas como deque). Se extenderán los tipos $_ \mathrm { y }$ términos de la siguiente manera:

$$
\begin{array} { r } { : = \cdots \mid \mathsf { C o l a } _ { \tau } \qquad M : = \cdots \mid \langle \rangle _ { \tau } \mid M \bullet M \mid \mathsf { p r o s i m o } ( M ) \mid \mathsf { d e s e n c o l a r } ( M ) \mid \mathsf { c a s e } M \mathsf { o f } \~ \langle \rangle  M ; c \bullet x } \end{array}
$$

donde $\langle \rangle _ { \tau }$ es la cola vacía en la que se pueden encolar elementos de tipo $\tau$ ; $M _ { 1 } \bullet M _ { 2 }$ representa el agregado del elemento $M _ { 2 }$ al nal de la cola $M _ { 1 }$ ; los observadores $\mathsf { p r } \acute { \boldsymbol { \circ } } \times \mathsf { i m o } ( M _ { 1 } ) \ ;$ y desencolar $\left( M _ { 1 } \right)$ devuelven, respectivamente, el primer elemento de la cola (el primero que se encoló), $_ \mathrm { y }$ la cola sin el primer elemento (estos dos últimos solo tienen sentido si la cola no es vacía); $_ \mathrm { y }$ el observador case $M _ { 1 }$ of $\langle \rangle \sim M _ { 2 } ; c \bullet x \sim M _ { 3 }$ permite operar con la cola en sentido contrario, accediendo al último elemento encolado (cuyo valor se ligará a la variable $_ x$ en $M _ { 3 }$ ) $_ \mathrm { y }$ al resto de la cola (que se ligará a la variable $c$ en el mismo subtérmino).

1. Introducir las reglas de tipado para la extensión propuesta.

2. Denir el conjunto de valores y las nuevas reglas de reducción. Pueden usar los conectivos booleanos de la guía. No es necesario escribir las reglas de congruencia, basta con indicar cuántas son.

Pista: puede ser necesario mirar más de un nivel de un término para saber a qué reduce.

3. Mostrar paso por paso cómo reduce la expresión: case $\left. \right. _ { \mathsf { N a t } } \bullet \underline { { { 1 } } } \bullet \underline { { { 0 } } }$ of $\langle \rangle \sim \mathsf { p r o x i m o } ( \langle \rangle _ { \mathsf { B o o l } } ) ; c \bullet x \sim \mathsf { i s Z e r o } ( x )$

4. Denir como macro la función último $\tau$ , que dada una cola devuelve el último elemento que se encoló en ella. Si la cola es vacía, puede colgarse o llegar a una forma normal bien tipada que no sea un valor. Dar un juicio de tipado válido para esta función (no es necesario demostrarlo).