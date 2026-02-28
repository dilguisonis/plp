Paradigmas (de Lenguajes) de Programaci´on

Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

17 de octubre de 2025

Inferencia de tipos

# Motivaci´on

Dada una expresi´on: ¿Tiene tipo? ¿Cu´al es el tipo? ¿Es el m´as general? ¿Qu´e necesitamos saber del contexto?

¿Tiene tipo? ¿Cu´al es el tipo? ¿Es el m´as general? ¿Qu´e necesitamos saber del contexto?

(λx. isZero(x)) true λx. succ(x) λx. succ(y ) ∅ ▷ λx : Nat. x : Nat → Nat ■ $\emptyset \ \triangleright \ \lambda x : X _ { 1 } . \ x : X _ { 1 } \to X _ { 1 }$

# Generalidad

¿Qu´e significa ser el juicio m´as general? Que todos los juicios derivables para λx. x son instancias de $\emptyset \ \triangleright \ \lambda x : X _ { 1 } . . . x : X _ { 1 } \to X _ { 1 }$ . Por ejemplo:

$$
\emptyset \triangleright \lambda x : N a t . x : N a t \to N a t
$$

$$
\emptyset \triangleright \lambda x : B o o I . x : B o o I \to B o o I
$$

■ $\{ y : B o o I \} \ \triangleright \ \lambda x : X _ { 2 } \to N a t . x : ( X _ { 2 } \to N a$ t) → X2 → Nat

Inferir el juicio de tipado de las siguientes expresiones:

1 λx . y   
2 1 $f$ true   
3 isZero $( x )$

# Algoritmo de Martelli Montanari

Determinar el resultado de aplicar el algoritmo MGU sobre las siguientes ecuaciones:

1 M ${ \mathfrak { I U } } \{ X _ { 2 } \to X _ { 1 } \to { \mathsf { B o o l } } { \overset { ? } { = } } X _ { 2 } \to X _ { 3 } \}$   
2 ${ \tt M G U } \{ ( X _ { 2 } \to X _ { 1 } ) \to { \tt N a t } \stackrel { ? } { = } X _ { 2 } \to X _ { 3 } \}$   
3 $\{ X _ { 1 } \to { \mathsf { B o o l } } { \overset { ? } { = } } { \mathsf { N a t } } \to { \mathsf { B o o l } } , X _ { 2 } { \overset { ? } { = } } X _ { 1 } \to X _ { 1 } \}$

# Algoritmo I — Inferencia de tipos

El algoritmo $\mathcal { T }$ recibe un t´ermino U sin anotaciones de tipos.

Consta de los siguientes pasos:

1 Rectificaci´on del t´ermino.   
2 Anotaci´on del t´ermino con variables de tipo frescas.   
3 Generaci´on de restricciones (ecuaciones entre tipos).   
4 Unificaci´on de las restricciones.

Decimos que un t´ermino est´a rectificado si:

1 No hay dos variables ligadas con el mismo nombre.   
2 No hay una variable ligada con el mismo nombre que una variable libre.

# Ejercicio: Rectificar los siguientes t´erminos

(λf . λx . f (f x ))(λf .f ) x (λx. succ(x))

Tenemos un t´ermino $U$ , que suponemos ya rectificado.

Producimos un contexto $\Gamma _ { 0 }$ y un t´ermino $M _ { 0 }$

1 El contexto $\Gamma _ { 0 }$ le da tipo a todas las variables libres de $U$ . El tipo de cada variable es una inc´ognita fresca.   
2 El t´ermino $M _ { 0 }$ est´a anotado de tal modo que erase(M0) = U. Todas las anotaciones son inc´ognitas frescas.

# Ejercicio: Anotar los siguientes t´erminos

λf . λx . f (f x ) x (λy . succ(y ))

# Algoritmo I — Paso 3: generaci´on de las restricciones

Tenemos un contexto Γ y un t´ermino M con anotaciones de tipos.

Recursivamente calculamos:

1 Un tipo $\tau$ , que corresponde al tipo de M.   
2 Un conjunto de ecuaciones $E$ . Representan restricciones para que $E$ est´e bien tipado.

Definimos un algoritmo recursivo:

$$
\underbrace { \mathcal { T } ( \underbrace { \Gamma } _ { \mathrm { \tiny ~  ~ ( ~ \sum ~ \epsilon ~ + ~ \epsilon ~ { ~ M ~ \epsilon ~ } ~ } ) } } _ { \mathrm { \normalfont ~ e n t e x t o } } ) \underbrace { M } _ { \mathrm { \normalfont ~ t e r m i n o } } ) = \underbrace { ( \underset { \mathrm { \tiny ~  ~ \sum ~ \epsilon ~ } } { \mathrm { \tiny ~ ( ~ \sum ~ \epsilon ~ } | }  \underbrace { E } _ { \mathrm { \tiny ~  ~ r e s t r i c c i o n e s } } ) } _ { \mathrm { \normalfont ~ s a l i d a } }
$$

con la precondici´on de que Γ le da tipo a todas las variables de M.

# Algoritmo I — Paso 3: generaci´on de las restricciones

$$
\mathcal { T } ( \Gamma \mid \mathsf { T r u e } ) = ( \mathsf { B o o l } \mid \emptyset )
$$

$$
\mathcal { I } ( \Gamma \mid \mathsf { F a l s e } ) = ( \mathsf { B o o l } \mid \emptyset )
$$

$$
{ \mathcal { T } } ( \Gamma \mid x ) = ( \tau \mid \emptyset ) \qquad { \mathsf { s i } } \left( x : \tau \right) \in \Gamma
$$

4 $\mathcal { T } ( \Gamma \mid$ if $M _ { 1 }$ then $M _ { 2 }$ else M3) = (τ2 | {τ1 ?= Bool, τ2 ?= τ3} ∪ E1 ∪ E2 ∪ E3) donde ${ \mathcal { I } } ( \Gamma \mid M _ { 1 } ) = ( \tau _ { 1 } \mid E _ { 1 } )$ ${ \mathcal { Z } } ( \Gamma \mid M _ { 2 } ) = \left( \tau _ { 2 } \mid E _ { 2 } \right)$ ${ \mathcal { Z } } ( \Gamma \mid M _ { 3 } ) = \left( \tau _ { 3 } \mid E _ { 3 } \right)$

5 ${ \mathcal { Z } } ( \Gamma ~ \mid ~ M _ { 1 } M _ { 2 } ) = ( X _ { k } ~ \mid ~ \{ \tau _ { 1 } \stackrel { ? } { = } ( \tau _ { 2 }  X _ { k } ) \} \cup E _ { 1 } \cup$ ∪ E2) donde $X _ { k }$ es una inc´ognita fresca $\begin{array} { r } { \mathcal { I } ( \Gamma \mid M _ { 1 } ) = ( \tau _ { 1 } \mid E _ { 1 } ) } \\ { \mathcal { I } ( \Gamma \mid M _ { 2 } ) = ( \tau _ { 2 } \mid E _ { 2 } ) } \end{array}$

6 ${ \mathcal { T } } ( \Gamma \mid \lambda x : \tau . M ) = ( \tau \to \sigma \mid E )$ donde $\mathcal { T } ( \Gamma , x : \tau \mid M ) = ( \sigma \mid E )$

7 $\mathcal { I } ( \Gamma \mid z \mathsf { e r o } ) = ( \mathsf { N a t } \mid \emptyset )$

8 ${ \mathcal { T } } ( \Gamma \mid { \mathsf { s u c c } } ( M ) ) = ( \mathsf { N a t } \mid \{ \tau \overset { ? } { = } \mathsf { N a t } \} \cup E )$ donde ${ \mathcal { T } } ( \Gamma \mid M ) = ( \tau \mid E )$

10 ${ \mathcal { Z } } ( \Gamma \mid \mathsf { i s Z e r o } ( M ) ) = ( { \mathsf { B o o l } } \mid \{ \tau \overset { ? } { = } { \mathsf { N a t } } \} \cup E )$ donde ${ \mathcal { T } } ( \Gamma \mid M ) = ( \tau \mid E )$

${ \mathcal { T } } ( \Gamma \mid \mathsf { p r e d } ( M ) ) = ( \mathsf { N a t } \mid \{ \tau \overset { ? } { = } \mathsf { N a t } \} \cup E )$ donde ${ \mathcal { T } } ( \Gamma \mid M ) = ( \tau \mid E )$

# Algoritmo I — Paso 4: unificaci´on de las restricciones

Recordemos: $\Gamma _ { 0 } \times M _ { 0 }$ resultan de anotar un t´ermino rectificado U.

Una vez calculado ${ \mathcal { T } } ( \Gamma _ { 0 } \mid M _ { 0 } ) = ( \tau \mid E ) \colon$

1 Calculamos $S = { \mathrm { m g u } } ( E )$ .   
2 Si no existe el unificador, el t´ermino $U$ no es tipable.   
3 Si existe el unificador, el t´ermino $U$ es tipable y vale:

$$
S ( \Gamma _ { 0 } ) \vdash S ( M _ { 0 } ) : S ( \tau )
$$

¿Qu´e tipo tienen las siguientes expresiones?

1 $\lambda f . \lambda x . f ( f x )$   
2 $x \left( \lambda x . \mathsf { s u c c } ( x ) \right)$   
3 $\lambda x . x y x$

# Algoritmo I

Dada la siguiente extensi´on al conjunto de t´erminos para el c´alculo $\lambda$ con listas:

$$
M : : = \dots | m a p \sigma , \tau | f o I d r \sigma , \tau
$$

La modificaci´on al sistema de tipos es la introducci´on de dos axiomas de tipado para $m a p _ { \sigma , \tau } \lor f o I d r _ { \sigma , \tau }$ :

$$
{ \begin{array} { c c } { { \overline { { { \mathrm {  ~ { \Large ~ \to ~ } } } } } \tau \mathrm {  ~ { \scriptstyle \to ~ } } [ \sigma ] \to [ \tau ] } } & { { \qquad \overline { { { \mathrm {  ~ { \Large ~ \Gamma ~ } } } } } \scriptscriptstyle { \mathrm {  ~ { \scriptstyle \to ~ } } } f o l d r _ { \sigma , \tau } : ( \sigma \to \tau \to \tau ) } } \end{array} }
$$

Se extiende el algoritmo de inferencia con las siguientes reglas:

$$
{ \mathcal { Z } } ( \Gamma \mid m a p _ { \sigma , \tau } ) = ( ( \sigma  \tau )  [ \sigma ]  [ \tau ] \mid \emptyset )
$$

$$
{ \mathcal { Z } } ( \Gamma ~ \mid ~ f o I d r _ { \sigma , \tau } ) = ( ( \sigma  \tau  \tau )  \tau  [ \sigma ]  
$$

Usar el algoritmo $\mathcal { T }$ con esta nueva extensi´on para tipar la siguiente expresi´on:

foldr map

foldr map ya est´a rectificado

2 $\Gamma _ { 0 } = \emptyset$ ,

$$
\begin{array} { l } { M _ { 0 } = f o I d r _ { X _ { 1 } , X _ { 2 } } \ m a p _ { X _ { 3 } , X _ { 4 } } } \\ { I d r _ { X _ { 1 } , X _ { 2 } } \ m a p _ { X _ { 3 } , X _ { 4 } } ) = ? ? } \\ { \ | \ f o I d r _ { X _ { 1 } , X _ { 2 } } ) = ( ( X _ { 1 }  X _ { 2 }  X _ { 2 } )  X _ { 2 }  [ X _ { 1 } ] } \\ { \ | \ m a p { x _ { 3 } , X _ { 4 } } ) = ( ( X _ { 3 }  X _ { 4 } )  [ X _ { 3 } ]  [ X _ { 4 } ] \ | \ \emptyset ) } \end{array}
$$

1 → X2 | ∅)

1 foldr map ya est´a rectificado

2 $\Gamma _ { 0 } = \emptyset$

3 (X5 | → [X3] → [X4]) → X5})

$$
\begin{array} { l } { { M _ { 0 } = f o l d r _ { X _ { 1 } , X _ { 2 } } \ m a p _ { X _ { 3 } , X _ { 4 } } } } \\ { { \ } } \\ { { \mathit { I d r } _ { X _ { 1 } , X _ { 2 } } \ m a p _ { X _ { 3 } , X _ { 4 } } ) = } } \\ { { \mathit { \iota _ { 1 } }  X _ { 2 }  X _ { 2 } )  X _ { 2 }  [ X _ { 1 } ]  X _ { 2 } \overset { ? } { = } ( ( X _ { 3 }  X _ { 4 } ) - ( X _ { 3 } ) + ( X _ { 4 } + X _ { 4 } ) + ( X _ { 3 } + X _ { 4 } ) + ( X _ { 4 } + X _ { 4 } ) + ( X _ { 4 } + X _ { 5 } ) + ( X _ { 5 } + X _ { 6 } ) + ( X _ { 6 } + X _ { 6 } ) } } \\ { { \mathrm { ~ ( } [ \begin{array} { l } { { t o l d r _ { X _ { 1 } , X _ { 2 } } } } \\ { { m a p _ { X _ { 3 } , X _ { 4 } } } } \end{array} ] = ( ( X _ { 3 }  X _ { 2 }  X _ { 2 } )  X _ { 2 } )  X _ { 2 }  [ X _ { 4 } ] \ ( \begin{array} { l } { { t } _ { 1 } } \\ { { 0 } } \end{array} ) } } \\ { { \mathrm { ~ ( } ( X _ { 1 }  X _ { 2 }  X _ { 2 } )  X _ { 2 }  X _ { 1 } ]  X _ { 2 } \overset { ! } { = } ( ( X _ { 3 }  X _ { 4 } ) + ( X _ { 4 } + X _ { 4 } ) + ( X _ { 4 } ) \ ( \begin{array} { l } { { t } _ { 2 } } \\ { { 0 } } \end{array} ) } } \end{array}
$$

I(∅ X2 | ∅)I(∅

4 S = mgu [X3] → [X4]) → X5}

# Algoritmo I

S = MG MGU{( $\begin{array} { r l } & { U \{ ( X _ { 1 } \to X _ { 2 } \to X _ { 2 } ) \to X _ { 2 } \to [ X _ { 1 } ] \to X _ { 2 } \stackrel { ? } { = } ( ( X _ { 3 } \to X _ { 4 } ) } \\ & { \leqslant 1 \to X _ { 2 } \to X _ { 2 } ) \to X _ { 2 } \to [ X _ { 1 } ] \to X _ { 2 } \stackrel { ? } { = } ( ( X _ { 3 } \to X _ { 4 } ) ~ . } \end{array}$ X4) → [X3] → [X4]) → → [X3] → [X4]) → X5}   
$\begin{array} { r l } & { \cdots \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \cdot \quad \quad \quad \quad \quad \quad \cdot \quad } \\ & { \longrightarrow ^ { 1 } \{ X _ { 1 }  X _ { 2 }  X _ { 2 } \stackrel { { \_ { \alpha } } } { = } ( X _ { 3 }  X _ { 4 } )  [ X _ { 3 } ]  [ X _ { 4 } ]  [ X _ { 3 } ]  [ X _ { 4 } ]  [ X _ { 4 } ]  [ X _ { 5 } ]  [ X _ { 5 } ]  [ X _ { 6 } ]  [ X _ { 6 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ] } \\ & { \longrightarrow ^ { 1 } \{ X _ { 1 } \stackrel { { \_ { \alpha } } } { = } X _ { 3 }  X _ { 4 } , X _ { 2 }  X _ { 2 } \}  X _ { 2 } \stackrel { { \_ { \alpha } } } { = } [ X _ { 3 } ]  [ X _ { 1 } ]  [ X _ { 1 } ] , X _ { 7 }  X _ { 4 } ]  [ X _ { 7 } ]  [ X _ { 8 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ]  [ X _ { 7 } ] } \\ &  \longrightarrow ^ { 4 } \{ X _ { 2 }  X _ { 2 } \stackrel { { \_ { \alpha } } } { = } [ X _ { 3 } ]  [ X _ { 4 } ] , X _ { 2 }  [ X _ { 3 }  X _ { 4 } ]  [ X _ { 7 }  X _ { 4 } ]  [ X _ { 7 } \end{array}$ 1] → X2 ?= X5} 1] → X2 ?= X5}   
$\begin{array} { r l } & { \longrightarrow ^ { 1 } \{ X _ { 1 } \stackrel { \_ } { = } X _ { 3 }  X _ { 4 } , \ X _ { 2 }  X _ { 2 } \stackrel { \_ } { = } [ X _ { 3 } ]  [ X _ { 4 } ] , \ X _ { 2 }  } \\ & { \longrightarrow ^ { 1 } \{ X _ { 1 } \stackrel { \_ } { = } X _ { 3 }  X _ { 4 } , \ X _ { 2 }  X _ { 2 } \stackrel { \_ } { = } [ X _ { 3 } ]  [ X _ { 4 } ] , X _ { 2 } . } \\ & { \longrightarrow ^ { 4 } \{ X _ { 2 }  X _ { 2 } \stackrel { \_ } { = } [ X _ { 3 } ]  [ X _ { 4 } ] , \ X _ { 2 }  [ X _ { 3 }  X _ { 4 } ]  } \\ & { \longrightarrow ^ { 4 } \{ X _ { 2 }  X _ { 2 } \stackrel { \_ } { = } [ X _ { 3 } ]  [ X _ { 4 } ] , \ X _ { 2 }  [ X _ { 3 }  X _ { 4 } ] - } \\ & { \longrightarrow ^ { 1 } \{ X _ { 2 } \stackrel { \_ } { = } [ X _ { 3 } ] , \ X _ { 2 } \stackrel { \_ } { = } [ X _ { 4 } ] , \ X _ { 2 }  [ X _ { 3 }  X _ { 4 } ]  X _ { 4 }  } \\ & { \longrightarrow ^ { 1 } \{ X _ { 2 } \stackrel { \_ } { = } [ X _ { 3 } ] , \ X _ { 2 } \stackrel { \_ } { = } [ X _ { 4 } ] , \ X _ { 2 }  [ X _ { 3 }  X _ { 4 } ]  X _ { 3 }  } \\ & { \longrightarrow ^ { 1 } \{ \{ X _ { 3 } \} \stackrel { \_ } { = } [ X _ { 4 } ] , \ [ X _ { 3 } ]  [ X _ { 3 }  X _ { 4 } ]  [ X _ { 3 } ] \stackrel { \_ } { = } X _ { 5 } \} } \end{array}$ 2 ?= X5} 2 ?= X5} X2 ?= X5} | {X1 := X3 → X4}   
$\begin{array} { r l } & { \longmapsto ^ { 4 } \{ X _ { 2 }  X _ { 2 } = [ X _ { 3 } ]  [ X _ { 4 } ] , X _ { 2 }  [ X _ { 3 }  X _ { 4 } ] - } \\ & { \longrightarrow 1 \{ X _ { 2 } \stackrel { 2 } { = } [ X _ { 3 } ] , X _ { 2 } \stackrel { 2 } { = } [ X _ { 4 } ] , X _ { 2 }  [ X _ { 3 }  X _ { 4 } ]  X } \\ & { \longrightarrow 1 \{ X _ { 2 } \stackrel { 2 } { = } [ X _ { 3 } ] , X _ { 2 } \stackrel { 2 } { = } [ X _ { 4 } ] , X _ { 2 }  [ X _ { 3 }  X _ { 4 } ]  X } \\ & { \longrightarrow ^ { 4 } \{ [ X _ { 3 } ] \stackrel { 2 } { = } [ X _ { 4 } ] , [ X _ { 3 } ]  [ X _ { 3 }  X _ { 4 } ]  [ X _ { 3 } ] \stackrel { 2 } { = } X _ { 5 } \} } \\ & { \longrightarrow ^ { 4 } \{ [ X _ { 3 } ] \stackrel { 2 } { = } [ X _ { 4 } ] , [ X _ { 3 } ]  [ X _ { 3 }  X _ { 4 } ]  [ X _ { 3 } ] \stackrel { 2 } { = } X _ { 5 } \} } \\ & { \longrightarrow 1 \{ X _ { 3 } \stackrel { 2 } { = } X _ { 4 } , [ X _ { 3 } ]  [ X _ { 3 }  X _ { 4 } ]  [ X _ { 3 } ] \stackrel { 2 } { = } X _ { 5 } \} . } \\ & { \longrightarrow 1 \{ X _ { 3 } \stackrel { 2 } { = } X _ { 4 } , [ X _ { 3 } ]  [ X _ { 3 }  X _ { 4 } ]  [ X _ { 3 } ] \stackrel { 2 } { = } X _ { 5 } \} \mid . } \end{array}$ X2 ?= X5} | {X1 := X3 → X4} 2 ?= X5} | {X1 := X3 → X4} $x _ { 2 } \stackrel { ? } { = } [ X _ { 4 } ] , X _ { 2 }  [ X _ { 3 }  X _ { 4 } ]  X _ { 2 } \stackrel { ? } { = } X _ { 5 } \} \mid \{ X _ { 1 } : = X _ { 1 } $ 3 → X4} | {X2 := [X3]} ◦ {X1 := X3 → X | {X2 := [X3]} ◦ {X1 := X3 → X {X2 := [X3]} ◦ {X1 := X3 → X4} ◦ {X1 := X3 → X4}   
S ${ \begin{array} { r l } & { = M G U \{ ( X _ { 1 } \to X _ { 2 } \to X _ { 2 } ) \to X _ { 2 } \to [ X _ { 1 } ] \to X _ { 2 } } \\ & { = \{ X _ { 1 } : = X _ { 3 } \to X _ { 4 } , X _ { 2 } : = [ X _ { 3 } ] , X _ { 3 } : = X _ { 4 } , X _ { 5 } : = X _ { 4 } , X _ { 5 } : = X _ { 4 } \} } \\ & { = \{ X _ { 1 } : = X _ { 3 } \to X _ { 4 } , X _ { 2 } : = [ X _ { 3 } ] , X _ { 3 } : = X _ { 4 } , X _ { 5 } : = U \} } \\ & { \{ X _ { 1 } : = X _ { 4 } \to X _ { 4 } , X _ { 2 } : = [ X _ { 4 } ] , X _ { 3 } : = X _ { 4 } , X _ { 5 } : = [ X _ { 4 } ] \to X _ { 4 } \} } \end{array} }$ → X4) → [X3] → [X4]) → X5} [X4] → [X4 → X4] → [X4]} [X4] → [X4 → X4] → [X4]}   
= X4] → [X4 → X4] → [X4]}

$$
S ( \emptyset ) \vdash S ( f o l d r _ { X _ { 1 } , X _ { 2 } } \ : m a p _ { X _ { 3 } , X _ { 4 } } ) : S ( X _ { 5 } ) =
$$

$$
\begin{array} { r } { f o I d r _ { X _ { 4 } \to X _ { 4 } , [ X _ { 4 } ] } m a p _ { X _ { 4 } , X _ { 4 } } : [ X _ { 4 } ] \to [ X _ { 4 } \to X _ { 4 } ] } \end{array}
$$

# Extensi´on del algoritmo I

$$
\sigma : : = \dots | \ [ \sigma ]
$$

M , N , $O : = \dots \mid { [ \begin{array} { l } { } \end{array} ] } _ { \sigma } \mid M : : N \mid C a s e \ M o f \mid \sim $ N ; h :: t ⇝ O

$$
\begin{array}{c} \overline { { { [ \begin{array} { l l l l l l l l } \end{array} : } [ \sigma ] } }  & { { } } & { { } } & { { } } & { { \begin{array} { l l l l l l } { { \Gamma \triangleright { { \cal M } } : \sigma } } & { { \Gamma \triangleright { { \cal N } } : \sigma } } & { { } } & { { } } & { { } } \\ { { } } & { { } } & { { } } & { { \Gamma \triangleright { { \cal M } } : : { \cal N } : [ \sigma ] } } \end{array} } } \end{array}
$$

$$
\begin{array} { r l r } { \boldsymbol { M } : [ \boldsymbol { \sigma } ] } & { { } \Gamma \triangleright \boldsymbol { N } : \tau } & { \Gamma \cup \{ \boldsymbol { h } : \boldsymbol { \sigma } , \boldsymbol { t } : [ \boldsymbol { \sigma } ] \} \triangleright } \end{array}
$$

$$
\Gamma \triangleright C a s e \ M o f \ [ \ ] \sim N \ ; h : : t \sim \to O : \tau
$$

# Extensi´on del algoritmo de inferencia

$$
\mathcal { I } ( \Gamma \mid \{ \} _ { \tau } ) = ( [ \tau ] \mid \emptyset )
$$

$$
{ \mathcal { Z } } ( \Gamma \mid M _ { 1 } : : M _ { 2 } ) = ( \tau _ { 2 } \mid \{ \tau _ { 2 } \stackrel { ? } { = } [ \tau _ { 1 } ] \} \cup E _ { 1 } \cup
$$

$$
\begin{array} { r } { \mathcal { I } ( \Gamma \mid M _ { 1 } ) = \left( \tau _ { 1 } \mid E _ { 1 } \right) } \\ { \mathcal { I } ( \Gamma \mid M _ { 2 } ) = \left( \tau _ { 2 } \mid E _ { 2 } \right) } \end{array}
$$

$$
\begin{array} { r l } & { \widehat { \mathscr { L } } \partial s e \ M _ { 1 } \ o f \ [ \ ]  M _ { 2 } \ ; h : : t  M _ { 3 } ) = } \\ & { \widehat { \mathscr { L } } _ { 1 } \overset { ? } { = } [ X _ { h } ] , \tau _ { 2 } \overset { ? } { = } \tau _ { 3 } , X _ { t } \overset { ? } { = } \tau _ { 1 } \} \cup E _ { 1 } \cup E _ { 2 } \cup E _ { 3 } ) } \\ & { \quad \mathcal { Z } ( \Gamma \ | \ M _ { 1 } ) = ( \tau _ { 1 } \ | \ E _ { 1 } ) } \\ & { \quad \mathcal { Z } ( \Gamma \ | \ M _ { 2 } ) = ( \tau _ { 2 } \ | \ E _ { 2 } ) } \\ & { \mathcal { Z } ( \Gamma , h : X _ { h } , t : X _ { t } \ | \ M _ { 3 } ) = ( \tau _ { 3 } \ | \ E _ { 3 } ) } \\ & { \widecheck { \mathscr { L } } \widecheck { \mathscr { \Pi } } , \ \widecheck { \mathscr { L } } \widecheck { \mathscr { L } } \widecheck { \mathscr { L } } _ { 1 } \widecheck { \mathscr { L } } _ { 2 } \widehat { \mathscr { L } } _ { 3 } \widehat { \mathscr { L } } _ { 3 } } \end{array}
$$

Dar el tipo de: Case $\operatorname { s u c c } ( \underline { { 0 } } ) : : x \ o f \ [ \ ] \to x \ ; x : : y \to \operatorname { s u c c } ( x ) : :$ [ ]

# Extensi´on del algoritmo de inferencia

$$
M : : = \dots | \mathrm { ~ } [ \mathrm { ~ } M \mathrm { ~ } | \mathrm { ~ } x \gets M , M \mathrm { ~ } ]
$$

Consideremos el C´alculo Lambda extendido con las listas por comprensi´on vistas en la pr´actica 4.

La regla de tipado es la siguiente:

Γ ∪ $\{ x : \sigma \} \ \triangleright M : \tau \quad \Gamma \triangleright N : [ \sigma ] \quad \Gamma \cup \{ x : \sigma \} \ \triangleright \ O$ : Bool

$$
\Gamma \triangleright [ \ M \ | \ x  N , O \ ] \colon [ \tau ]
$$

# Extensi´on del algoritmo de inferencia

I( donde I ${ \begin{array} { r l } & { \mathbf { 1 } \mid x  M _ { 2 } , M _ { 3 } \mid ) = ( [ \tau _ { 1 } ] \mid \{ \tau _ { 2 } \stackrel { ? } { = } } [ X _ { 0 } ] , \tau _ { 3 } \stackrel { ? } { = } } \\ & { { \ ' } ( \Gamma , x \colon X _ { 0 } \mid M _ { 1 } ) = ( \tau _ { 1 } \mid E _ { 1 } ) } \\ & { { \ ' } ( \Gamma \mid M _ { 2 } ) = ( \tau _ { 2 } \mid E _ { 2 } ) } \\ & { { \prime } ( \Gamma , x \colon X _ { 0 } \mid M _ { 3 } ) = ( \tau _ { 3 } \mid E _ { 3 } ) } \end{array} $ Bool} ∪ E1 ∪ E2 ∪ E3) X0 variable fresca

Dar el tipo de: [ if $x$ then 0 else 1 | x ← false :: isZero(x) :: [ ], true ]

¿ ¿ ¿ ¿ ¿ ¿Preguntas? ? ? ? ? ?