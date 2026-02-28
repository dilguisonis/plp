# Práctica N $\cup$ 5 - Inferencia de tipos

Aclaraciones:

Los ejercicios marcados con el símbolo $\star$ constituyen un subconjunto mínimo de ejercitación. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

Gramáticas a tener en cuenta:

Términos anotados $M : : = x \mid \lambda x : \sigma . M \mid M M \mid$ True | False $|$ if $M$ then $M$ else $M$ $\mid \mathsf { z e r o } \mid \mathsf { s u c c } ( M ) \mid \mathsf { p r e d } ( M ) \mid \mathsf { i s Z e r o } ( M )$ Donde la letra $x$ representa un nombre de variable arbitrario. Tales nombres se toman de un conjunto infinito dado ${ \mathfrak { X } } = \{ w , w _ { 1 } , w _ { 2 } , \dotsc , x , x _ { 1 } , x _ { 2 } , \dotsc , y , y _ { 1 } , y _ { 2 } , \dotsc , f , f _ { 1 } , f _ { 2 } , \dotsc \}$   
Términos sin anotaciones $U : : = x \mid \lambda x . U \mid U \ U \mid$ True | False $\mid$ if $U$ then $U$ else $U$ | zero | succ(U ) | pred(U ) | isZero(U )   
Tipos $\tau : : = { \mathsf { B o o l } } \mid { \mathsf { N a t } } \mid \tau  \tau \mid X _ { n }$ Donde $n$ es un número natural, de tal modo que $X _ { n }$ representa una variable de tipos arbitraria tomada de un conjunto ${ \mathfrak { T } } = \{ X _ { 1 } , X _ { 2 } , X _ { 3 } , . . . \}$ .

Nota: también podemos referirnos a las variables de tipos como incógnitas.

# Ejercicio 1

Determinar qué expresiones son sintácticamente válidas $_ \mathrm { y }$ , para las que lo sean, indicar a qué gramática pertenecen (tipos, términos anotados o términos sin anotaciones).

i. λx : Bool.succ(x) ii. λx.isZero $( x )$ iii. $X _ { 1 }  \sigma$ iv. erase(f y)

v. $X _ { 1 }$   
vi. $X _ { 1 }  ( \mathsf { B o o l }  X _ { 2 } )$   
vii. $\lambda x \colon X _ { 1 } \to X _ { 2 }$ . if zero then True else zero succ(True)   
viii. $e r a s e ( \lambda f \colon \mathsf { B o o l } \to \mathsf { B o o l } . \lambda y \colon \mathsf { B o o l } . f \ y )$

# Ejercicio 2

Determinar el resultado de aplicar la sustitución $S$ a las siguientes expresiones

$$
\begin{array} { r l r } & { S = \{ X _ { 1 } : = \mathsf { N a t } \} } & { S ( \{ x : X _ { 1 } \to \mathsf { B o o l } \} ) } \\ & { S = \{ X _ { 1 } : = X _ { 2 } \to X _ { 3 } , \ X _ { 4 } : = \mathsf { B o o l } \} } & { S ( \{ x : X _ { 4 } \to \mathsf { B o o l } \} ) \vdash S ( \lambda x : X _ { 1 } \to \mathsf { B o o l } . x ) : S ( \mathsf { N a t } \to X _ { 2 } ) } \end{array}
$$

# Ejercicio 3

Unir con flechas los tipos que unifican entre sí (entre una fila y la otra). Para cada par unificable, exhibir el mgu (“most general unifier”).

$$
\begin{array} { r l r } { X _ { 1 }  X _ { 2 } } & { { } \mathrm { N a t } } & { X _ { 2 }  \mathsf { B o o l } \quad \quad \quad X _ { 3 }  X _ { 4 }  X _ { 5 } } \\ { X _ { 1 } } & { { } \mathrm { N a t }  \mathsf { B o o l } \quad ( \mathrm { N a t }  X _ { 2 } )  \mathsf { B o o l } \quad \mathsf { N a t }  X _ { 2 }  \mathsf { B o o l } } \end{array}
$$

# Ejercicio 4

Decidir, utilizando el algoritmo de inferencia, cuáles de las siguientes expresiones son tipables. Mostrar qué reglas y sustituciones se aplican en cada paso y justificar por qué no son tipables aquéllas que fallan.

i. $\lambda z$ . if z then zero else succ(zero) ii. λy. succ $\left( \left( \lambda x . x \right) y \right)$ iii. $\lambda x$ . if $\mathsf { i s Z e r o } ( \mathsf { x } )$ then $x$ else (if $x$ then $x$ else $x$ ) iv. $\lambda x . \lambda y$ . if $x$ then $y$ else succ(zero)

v. if True then (λx.zero)zero else (λx.zero)False vi. ( $\lambda f$ . if True then $f$ zero else $f$ False) ( $\lambda x$ . zero) vii. $\lambda x . \lambda y . \lambda z$ . if $z$ then $y$ else succ $( x )$

# Ejercicio 5 ⋆

Utilizando el algoritmo de inferencia, inferir el tipo de las siguientes expresiones o demostrar que no son tipables. En cada paso donde se realice una unificación, mostrar el conjunto de ecuaciones a unificar y la sustitución obtenida como resultado de la misma.

$\begin{array} { l } { = \ \lambda x . \ \lambda y . \ \lambda z . \ z \ x \ y \ z } \\ { = \ \lambda x . \ x \ ( w \ ( \lambda y . w \ y ) ) } \\ { = \lambda x . \lambda y . \ x y } \\ { = \ \lambda x . \lambda y . \ y x } \end{array}$

$$
\begin{array} { r l } { \mathbf { \lambda } } & { \lambda x . ( \lambda x . \ x ) } \\ { \mathbf { \textsf { = } } } & { \lambda x . ( \lambda y . \ y ) x } \\ { \mathbf { \textsf { = } } } & { ( \lambda z . \lambda x . \ x \ ( z \ ( \lambda y . \ z ) ) ) \ \mathsf { T r u e } } \end{array}
$$

Ejercicio 6 (Numerales de Church)

Indicar tipos $\sigma$ y $\tau$ apropiados de modo que los términos de la forma $\lambda y : \sigma . \lambda x : \tau . y ^ { n } ( x )$ resulten tipables para todo $n$ natural. El par $( \sigma , \tau )$ debe ser el mismo para todos los términos. Observar si tienen todos el mismo tipo. Notación: $M ^ { 0 } ( N ) = N , M ^ { n + 1 } ( N ) = M ( M ^ { n } ( N ) )$ . Sugerencia: empezar haciendo inferencia para $n = 2 \mathrm { ~ - ~ }$ es decir, calcular el juicio de tipado más general para $\lambda y . \lambda x . y ( y x ) \mathrm { ~ - ~ y ~ }$ generalizar el resultado.

# Ejercicio 7

i. Utilizar el algoritmo de inferencia sobre la siguiente expresión: $\lambda y . ( x \ y ) \ ( \lambda z . x _ { 2 } )$

ii. Una vez calculado, demostrar (utilizando chequeo de tipos) que el juicio encontrado es correcto.

iii. ¿Qué ocurriría si $x _ { 2 }$ fuera $x$ ?

# Ejercicio 8

Tener en cuenta el tipo de los pares definido como: $\tau : : = \dots | \tau \times \tau$

Con expresiones nuevas definidas como: $M : : = \dots \mid \langle M , M \rangle \mid \pi _ { 1 } ( M ) \mid \pi _ { 2 } ( M )$

Y las siguientes reglas de tipado:

$$
\frac { \Gamma \vdash M : \tau \vdash N : \sigma } { \Gamma \vdash \langle M , N \rangle : \tau \times \sigma } \qquad \begin{array} { c c } { { \Gamma \vdash M : \tau \times \sigma } } & { { \mathrm { ~ \Gamma ~ \vdash ~ M : \tau \times \sigma ~ } } } & { { \mathrm { ~ \Gamma ~ \vdash ~ M : \tau \times \sigma ~ } } } \\ { { \Gamma \vdash \pi _ { 1 } ( M ) : \tau } } & { { \mathrm { ~ \vdash ~ \sigma ~ } } } & { { \mathrm { ~ \Gamma ~ \vdash ~ \pi _ { 2 } ( M ) : \sigma ~ } } } \end{array} \qquad \begin{array} { c c } { { \Gamma \vdash M : \tau \times \sigma } } & { { \mathrm { ~ \dotsc ~ \sigma ~ } } } \\ { { \Gamma \vdash \pi _ { 2 } ( M ) : \sigma } } & { { \mathrm { ~ \dotsc ~ \sigma ~ } } } \end{array}
$$

Se extiende el algoritmo $\mathcal { L }$ con las siguientes reglas:

${ \mathcal { T } } ( \Gamma \mid \langle M _ { 1 } , M _ { 2 } \rangle ) = ( \tau \times \sigma \mid E _ { 1 } \cup E _ { 2 } )$ donde:

${ \mathcal { I } } ( \Gamma \mid M _ { 1 } ) = ( \tau \mid E _ { 1 } )$ ■ $\mathcal { I } ( \Gamma \mid M _ { 2 } ) = ( \sigma \mid E _ { 2 } )$

${ \mathcal { I } } ( \Gamma \mid \pi _ { 1 } ( M ) ) = ( \sigma \mid \{ \tau \stackrel { ? } { = } \sigma \times \rho \} \cup E )$ donde ${ \mathcal { I } } ( \Gamma \mid M ) = ( \tau \mid E )$

$$
{ \begin{array} { r l } & { { \mathcal { T } } ( \Gamma \mid \pi _ { 2 } ( M ) ) = ( \rho \mid \{ \tau \stackrel { ? } { = } } \sigma \times \rho \} \cup E ) } \\ & { { \mathrm { d o n d e ~ } } { \mathcal { T } } ( \Gamma \mid M ) = ( \tau \mid E ) } \end{array} 
$$

i. Tipar la expresión (λf.⟨f,2⟩) (λx.x 1) utilizando la versión extendida del algoritmo.

ii. Intentar tipar la siguiente expresión utilizando la versión extendida del algoritmo. $( \lambda f . \langle f \ 2 , \ f \ \mathsf { T r u e } \rangle ) \ ( \lambda x . x )$ Mostrar en qué punto la inferencia falla y por qué motivo.

# Ejercicio 9 ⋆

Se extienden el Cálculo Lambda y algoritmo de inferencia para soportar uniones disjuntas de la siguiente manera:

$$
\begin{array} { r l } { \tau } & { : : = \mathrm { ~ \dots ~ } | \mathrm { ~ } \tau + \tau } \\ { M } & { : : = \mathrm { ~ \dots ~ } | \mathrm { ~ } | \mathsf { e f t } _ { \tau } ( M ) \mathrm { ~ } | \mathrm { ~ } \mathsf { r i g h t } _ { \tau } ( M ) \mathrm { ~ } | \mathrm { ~ } \mathsf { c a s e } M \mathsf { o f } \mathrm { ~ } | \mathsf { e f t } ( x ) \rrangle  M \mathrm { ~ } | \mathrm { ~ r i g h t } ( y ) \rrangle  M } \end{array}
$$

${ \mathcal { T } } ( \Gamma \mid \mathsf { l e f t } _ { \sigma } ( M ) ) = ( \tau + \sigma \mid E )$ donde ${ \mathcal { I } } ( \Gamma \mid M ) = ( \tau \mid E )$

$$
\begin{array} { r l } & { \mathcal { T } ( \Gamma \mid \mathrm { r i g h t } _ { \sigma } ( M ) ) = ( \sigma + \tau \mid E ) } \\ & { \mathrm { d o n d e } \mathcal { T } ( \Gamma \mid M ) = ( \tau \mid E ) } \end{array}
$$

$\scriptstyle { \mathcal { T } } ( \Gamma \ )$ $| \mathbf { \Omega } { \mathrm { c a s e ~ } } M _ { 1 } \mathbf { \Omega } { \mathrm { o f ~ } } | \mathbf { e f t } ( x ) \sim M _ { 2 } | \mathbf { \Omega } | { \mathrm { r i g h t } } ( y ) \sim M _ { 3 } ) = ( \tau _ { 2 } \mid \{ \tau _ { 1 } \overset { 2 } { = }  X _ { x } + X _ { y } , \tau _ { 2 } \overset { 2 } { = } \tau _ { 3 } \} \cup E _ { 1 } \cup E _ { 2 } \cup E _ { 3 } )$ donde:

${ \mathcal { I } } ( \Gamma \mid M _ { 1 } ) = ( \tau _ { 1 } \mid E _ { 1 } )$ $\mathcal { T } ( \Gamma , x : X _ { x } \mid M _ { 2 } ) = ( \tau _ { 2 } \mid E _ { 2 } )$ ■ $\begin{array} { r } { \mathcal { I } ( \Gamma , y : X _ { y } \mid M _ { 3 } ) = ( \tau _ { 3 } \mid E _ { 3 } ) } \end{array}$ ■ $X _ { x }$ y $X _ { y }$ variables frescas.

Utilizando esta extensión del algoritmo, encontrar los juicios de tipado más generales para los siguientes términos o indicar por qué no es posible:

i. case left $( \underline { { { 1 } } } )$ of l $\mathsf { s f t } ( x ) \sim \mathsf { i s Z e r o } ( x ) \mathbb { I } \mathsf { r i g h t } ( y ) \sim$ True ii. case right $( z )$ of lef $\mathsf { t } ( x ) \sim \mathsf { i s Z e r o } ( x ) \parallel \mathsf { r i g h t } ( y ) \sim y$ iii. case right(zero) of $\mathsf { l e f t } ( x ) \sim \mathsf { i s Z e r o } ( x ) \parallel \mathsf { r i g h t } ( y ) \sim y$ iv. case $x$ of lef $\mathsf { t } ( x ) \sim \mathsf { i s Z e r o } ( x ) \parallel \mathsf { r i g h t } ( y ) \sim y$ v. case left $( z )$ of $\mathsf { l e f t } ( x ) \sim z \parallel \mathsf { r i g h t } ( y ) \sim y$ vi. case $z$ of $\mathsf { l e f t } ( x ) \sim z \parallel \mathsf { r i g h t } ( y ) \sim y$

# Ejercicio 10

Se extienden el Cálculo Lambda y algoritmo de inferencia para soportar listas de la siguiente manera:

$$
\begin{array} { l } { \tau } \\ { M \ \mathrel { \ : } = \ \dots \ \middle | \ \left[ \begin{array} { l } { { \lceil \tau \rceil } } \\ { { \lceil \tau \rceil } } \end{array} \right| \ M \mathrel { \ : } \colon M \ \middle | \ \mathrm { f o l d r } \ M \mathrm { b a s e } \ \longrightarrow M ; \ \mathrm { r e c } ( h , r ) \hookrightarrow M } \end{array}
$$

$\mathcal { I } ( \Gamma \mid [ ] _ { \tau } ) = ( [ \tau ] \mid \emptyset )$

${ \mathcal { T } } ( \Gamma \mid M _ { 1 } : : M _ { 2 } ) = ( \tau _ { 2 } \mid \{ \tau _ { 2 } { \stackrel { ? } { = } } [ \tau _ { 1 } ] \} \cup E _ { 1 } \cup E _ { 2 } )$ donde:

${ \mathcal { I } } ( \Gamma \mid M _ { 1 } ) = ( \tau _ { 1 } \mid E _ { 1 } )$ $\begin{array} { r } { { \cal Z } ( \Gamma \mid M _ { 2 } ) = ( \tau _ { 2 } \mid E _ { 2 } ) } \end{array}$

$\scriptstyle { \mathcal { T } } ( \Gamma \ )$ ${ \tiny \begin{array} { r l } & { \colon \hfill \mathrm { I ~ o l d r } \ : M _ { 1 } \mathrm { ~ b a s e }  M _ { 2 } ; \mathrm { ~ r e c } ( h , r ) \hookrightarrow M _ { 3 } ) = ( \tau _ { 2 } \middle \vert \{ \tau _ { 1 } \stackrel { 2 } { = } [ X _ { h } ] , \tau _ { 2 } \stackrel { 2 } { = } \tau _ { 3 } , \tau _ { 3 } \stackrel { 2 } { = } X _ { r } \} \cup E _ { 1 } \cup E _ { 2 } \cup E _ { 3 } ) } \end{array} }$ donde:

■ ${ \mathcal { I } } ( \Gamma \mid M _ { 1 } ) = ( \tau _ { 1 } \mid E _ { 1 } )$ $\begin{array} { r } { { \cal Z } ( \Gamma \mid M _ { 2 } ) = ( \tau _ { 2 } \mid E _ { 2 } ) } \end{array}$ ■ $\mathcal { T } ( \Gamma , h : X _ { h } , r : X _ { r } \mid M _ { 3 } ) = ( \tau _ { 3 } \mid E _ { 3 } )$ ■ $X _ { h }$ y $X _ { r }$ variables frescas.

Utilizando esta extensión del algoritmo, encontrar los juicios de tipado más generales para los siguientes términos o indicar por qué no es posible:

i. foldr $x : : [ \ ] \ { \mathsf { b a s e } } \hookrightarrow [ \ ] ; \ { \mathsf { r e c } } ( h , r ) \hookrightarrow { \mathsf { i s } } { \mathsf { Z e r o } } ( h ) : : r$   
ii. foldr $( \lambda x . s u c c ( x ) ) : : [ ]$ base $\hookrightarrow [ \ ]$ ; $\mathsf { r e c } ( x , r ) \hookrightarrow$ if $p ~ x$ then $x : : r$ else $r$ iii. foldr $x$ base $\hookrightarrow x$ ; $\mathsf { r e c } ( h , r ) \hookrightarrow \mathsf { i s Z e r o } ( h ) \mathrel { \mathop : } r$   
iv. foldr $x$ base $\hookrightarrow$ True; $\mathsf { r e c } ( h , x ) \hookrightarrow x$