# Paradigmas de Programaci´on

Unificaci´on Inferencia de tipos

2do cuatrimestre de 2025 Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

Introducci´on

# Algoritmo de unificaci´on

Algoritmo de inferencia de tipos

$$
2
$$

Correcci´on del algoritmo de unificaci´on

# Problema de inferencia de tipos

# Notaci´on

T´erminos sin anotaciones de tipos:

U ::= x | λx . U | U U | True | False | if U then U else U

T´erminos con anotaciones de tipos:

M ::= x | λx : τ. M | M M | True | False | if M then M else M

Notamos erase(M) al t´ermino sin anotaciones de tipos que resulta de borrar las anotaciones de tipos de M.

Ejemplo: erase((λx : Bool. x) True) = (λx. x) True.

# Problema de inferencia de tipos

# Definici´on

Un t´ermino U sin anotaciones de tipos es tipable sii existen:

un contexto de tipado Γ un t´ermino con anotaciones de tipos M un tipo $\tau$ tales que erase $( M ) = U \ y \Gamma \vdash M : \tau .$

# El problema de inferencia de tipos consiste en:

Dado un t´ermino $U$ , determinar si es tipable. En caso de que $U$ sea tipable: hallar un contexto Γ, un t´ermino M y un tipo $\tau$ tales que erase $( M ) = U \ y \Gamma \vdash M : \tau .$

Veremos un algoritmo para resolver este problema.

$$
4
$$

# Problema de inferencia de tipos

El algoritmo se basa en manipular tipos parcialmente conocidos.

Ejemplo — tipos parcialmente conocidos

▶ En x True sabemos que x : Bool → X1.   
En if x y then True else False sabemos que x : X2 → Bool.

Incorporamos inc´ognitas $\left( \mathtt { X } _ { 1 } , \mathtt { X } _ { 2 } , \mathtt { X } _ { 3 } , \dots \right)$ a los tipos.

Vamos a necesitar resolver ecuaciones entre tipos con inc´ognitas.

$$
\begin{array} { r l } & { \mathrm { | j e m p l o -- e c u a c i o n e s ~ e n t r e ~ t i p o s } } \\ & { \ * ( \mathrm { X } _ { 1 }  \mathrm { B o o l } ) \stackrel {  } { = } ( ( \mathrm { B o o l }  \mathrm { B o o l } )  \mathrm { X } _ { 2 }  } \\ & { \mathrm { t i e n ~ e s o l u c i s o n } ; \mathrm { X } _ { 1 } : = ( \mathrm { B o o l }  \mathrm { B o o l } ) } \\ & { \ * ( \mathrm { X } _ { 1 }  \mathrm { X } _ { 1 } ) \stackrel {  } { = } ( ( \mathrm { B o o l }  \mathrm { B o o l } )  \mathrm { X } _ { 2 } ) } \\ & { \mathrm { t i e n e ~ s o l u c i s o n } ; \mathrm { X } _ { 1 } : = ( \mathrm { B o o l }  \mathrm { B o o l } ) } \\ & { \ * ( \mathrm { X } _ { 1 }  \mathrm { B o o l } ) \stackrel {  } { = } \mathrm { X } _ { 1 } : } \\ & { \mathrm { n o ~ t i e n e ~ s o l u c i s o n } . } \end{array}
$$

2) y X2 := Bool.

y X2 := (Bool → Bool).

Introducci´on

Algoritmo de unificaci´on

Algoritmo de inferencia de tipos

Correcci´on del algoritmo de unificaci´on

# 6

# Unificaci´on

Suponemos fijado un conjunto finito de constructores de tipos:

Tipos constantes: Bool, Int, . . ..   
Constructores unarios: (List •), (Maybe •), . . ..   
Constructores binarios: $( \bullet  \bullet )$ , $( \bullet \times \bullet )$ , (Either • •), . . ..   
(Etc´etera).

Los tipos se forman usando inc´ognitas y constructores:

$$
\tau : : = \mathbb { X } _ { n } \mid C ( \tau _ { 1 } , \ldots , \tau _ { n } )
$$

La unificaci´on es el problema de resolver sistemas de ecuaciones entre tipos con inc´ognitas.

Veremos primero un algoritmo de unificaci´on.   
Luego lo usaremos para dar un algoritmo de inferencia de tipos.

# Unificaci´on

Una sustituci´on es una funci´on que a cada inc´ognita le asocia un tipo.

Notamos:

$$
\left\{ \mathbf { X } _ { k _ { 1 } } \qquad \tau _ { 1 } , \dots , \mathbf { X } _ { k _ { n } } \qquad \tau _ { n } \right\}
$$

a la sustituci´on S tal que S $\dot { \mathfrak { s } } ( \mathbb { X } _ { k _ { i } } ) = \tau _ { i }$ para cada $1 \leq i \leq n$ y $\pmb { \mathsf { S } } ( \mathbb { X } _ { k } ) = \mathbb { X } _ { k }$ para cualquier otra inc´ognita.

Si $\tau$ es un tipo, escribimos $\mathsf { \pmb S } ( \tau )$ para el resultado de reemplazar cada inc´ognita de $\tau$ por el valor que le otorga S.

Ejemplo — aplicaci´on de una sustituci´on a un tipo

Si S = {X1 := Bool, ${ \bf \Phi } _ { 3 } : = ( { \bf x } _ { 2 }  { \bf x } _ { 2 } ) \}$ , entonces:

$$
\pmb { \mathsf { S } } ( ( \mathtt { X } _ { 1 } \to \mathsf { B o o l } ) \to \mathtt { X } _ { 3 } ) = ( ( \mathsf { B o o l } \to \mathsf { B o o l }
$$

# Unificaci´on

Un problema de unificaci´on es un conjunto finito $E$ de ecuaciones entre tipos que pueden involucrar inc´ognitas:

$$
E = \{ \tau _ { 1 } \stackrel { ? } { = } \sigma _ { 1 } , \tau _ { 2 } \stackrel { ? } { = } \sigma _ { 2 } , . . . , \tau _ { n } \stackrel { ? } { = } \sigma _ { n } \}
$$

$$
9
$$

Un unificador para $E$ es una sustituci´on S tal que:

$$
\begin{array} { l } { { \pmb { \mathsf { S } } ( \tau _ { 1 } ) = \pmb { \mathsf { S } } ( \sigma _ { 1 } ) } } \\ { { \pmb { \mathsf { S } } ( \tau _ { 2 } ) = \pmb { \mathsf { S } } ( \sigma _ { 2 } ) } } \\ { { \qquad \quad \dots } } \end{array}
$$

$$
\mathsf { \pmb S } ( \tau _ { n } ) = \mathsf { \pmb S } ( \sigma _ { n } )
$$

En general, la soluci´on a un problema de unificaci´on no es ´unica.

Ejemplo — problema de unificaci´on con infinitas soluciones

$$
\{ { \tt X } _ { 1 } \stackrel { ? } { = } { \tt X } _ { 2 } \}
$$

tiene infinitos unificadores:

${ \begin{array} { r l } & { \triangleright ~ \{ \mathrm { X } _ { 1 } : = \mathrm { X } _ { 2 } \} } \\ & { \triangleright ~ \{ \mathrm { X } _ { 2 } : = \mathrm { X } _ { 1 } \} } \\ & { \triangleright ~ \{ \mathrm { X } _ { 1 } : = \mathrm { X } _ { 3 } , ~ \mathrm { X } _ { 2 } : = \mathrm { X } _ { 3 } \} } \\ & { \triangleright ~ \{ \mathrm { X } _ { 1 } : = \mathrm { B o o l } , ~ \mathrm { X } _ { 2 } : = \mathrm { B o o l } \} } \\ & { \triangleright ~ \{ \mathrm { X } _ { 1 } : = ( \mathrm { B o o l } \to \mathrm { B o o l } ) , ~ \mathrm { X } _ { 2 } : = ( \mathrm { B o c } } } \\ & { \mapsto ~ \dots } \end{array} $ l → Bool)}

# Unificaci´on

Una sustituci´on $\pmb { \mathsf { S } } _ { A }$ es m´as general que una sustituci´on SB si existe una sustituci´on SC tal que:

$$
\pmb { \mathsf { S } } _ { B } = \pmb { \mathsf { S } } _ { C } \circ \pmb { \mathsf { S } } _ { A }
$$

es decir, SB se obtiene instanciando variables de $\pmb { \mathsf { S } } _ { A }$

Para el siguiente problema de unificaci´on:

$$
E = \{ ( { \tt X } _ { 1 }  { \tt B o o l } ) \stackrel { ? } { = } { \tt X } _ { 2 } \}
$$

las siguientes sustituciones son unificadores:

$$
\begin{array} { r l } { \mathrm { \bf ~ S } _ { 1 } = \{ { \mathrm { X } } _ { 1 } \mathrm {  ~ \lambda ~ } } & { \mathrm { B o o l } , \mathrm { \bf ~ X } _ { 2 } \mathrm {  ~ \lambda ~ } ( \mathrm { B o o l } \to \mathrm { B c } } \\ { \mathrm { \bf ~ S } _ { 2 } = \{ { \mathrm { X } } _ { 1 } \mathrm {  ~ \lambda ~ } } & { \mathrm { I n t } , \mathrm { \bf ~ X } _ { 2 } \mathrm {  ~ \lambda ~ } ( \mathrm { I n t } \to \mathrm { B o o l } ) \} } \\ { \mathrm { \bf ~ S } _ { 3 } = \{ { \mathrm { X } } _ { 1 } \mathrm {  ~ \lambda ~ } } & { \mathrm { X } _ { 3 } , \mathrm { \bf ~ X } _ { 2 } \mathrm {  ~ \lambda ~ } ( \mathrm { X } _ { 3 } \to \mathrm { B o o l } ) \} } \\ { \mathrm { \bf ~ S } _ { 4 } = \{ \mathrm { X } _ { 2 } \mathrm {  ~ \lambda ~ } } & { \mathrm { ( X } _ { 1 } \to \mathrm { B o o l } ) \} } \end{array}
$$

¿Qu´e relaci´on hay entre ellas? (¿Cu´al es m´as general que cu´al?).

# Algoritmo de unificaci´on de Martelli–Montanari

Dado un problema de unificaci´on E (conjunto de ecuaciones):

Mientras $E \neq \emptyset$ , se aplica sucesivamente alguna de las seis reglas que se detallan m´as adelante.   
La regla puede resultar en una falla.   
De lo contrario, la regla es de la forma $E  \mathsf { s } E ^ { \prime } .$ . La resoluci´on del problema $E$ se reduce a resolver otro problema $E ^ { \prime }$ , aplicando la sustituci´on S.

Hay dos posibilidades:

1. E = $\bar { E } _ { 0 } \to _ { \{ \pmb { S } _ { 1 } } \bar { E } _ { 1 } \to _ { \pmb { S } _ { 2 } } \bar { E } _ { 2 } \to . . . \to _ { \pmb { S } _ { n } } \bar { E } _ { n } \to _ { \pmb { S } _ { n + 1 } }$ falla En tal caso el problema de unificaci´on $E$ no tiene soluci´on. 2. $\mathsf { E } = E _ { 0 } \to _ { \mathsf { S } _ { 1 } } E _ { 1 } \to _ { \mathsf { S } _ { 2 } } E _ { 2 } \to . . . \to _ { \mathsf { S } _ { n } } E _ { n } =$ ∅ En tal caso el problema de unificaci´on $E$ tiene soluci´on.

# Algoritmo de unificaci´on de Martelli–Montanari

$\begin{array} { r l } { \{ \mathtt { X } _ { n } \overset { ? } { = } \mathtt { X } _ { n } \} \cup E } & { \xrightarrow { \mathrm { D e l e t e } } } \\ { \quad } \\ { \tau _ { 1 } , \dots , \tau _ { n } ) \overset { ? } { = } C \big ( \sigma _ { 1 } , \dots , \sigma _ { n } \big ) \} \cup E } & { \xrightarrow { \mathrm { D e c o m p o s e } } \gamma } \\ { \{ \tau \overset { ? } { = } \mathtt { X } _ { n } \} \cup E } & { \xrightarrow { \mathtt { S w a p } } \gamma } \end{array}$ E   
{C( $\{ \tau _ { 1 } \stackrel { ? } { = } \sigma _ { 1 } , . . . , \tau _ { n } \stackrel { ? } { = } \sigma _ { n } \} \cup E$ $\{ \mathtt { X } _ { n } \overset { ? } { = } \tau \} \cup E$ si $\tau$ no es una inc´ognita

# 13

$\{ { \mathrm { X } } _ { n } { \overset { ? } { = } } \tau \} \cup E { \overset { \scriptstyle { \mathtt { E 1 i m } } } { \longrightarrow } } \{ { \mathrm { X } } _ { n } \quad \tau \}$ $E ^ { \prime } = \{ \mathtt { X } _ { n } : = \tau \} ( E )$ si ${ \tt X } _ { n }$ no ocurre en $\tau$ {C (τ $\left. _ { \downarrow , . . . , \tau _ { n } } \right) \stackrel { ? } { = } C ^ { \prime } ( \sigma _ { 1 } , . . . , \sigma _ { m } ) \} \cup E \quad \xrightarrow { \mathrm { c l a s h } } \quad$ falla si $C \neq C ^ { \prime }$ {Xn ?= τ} ∪ E Occurs-Check falla si $\mathtt { X } _ { n } \neq \tau$ y ${ \tt X } _ { n }$ ocurre en $\tau$

# Algoritmo de unificaci´on de Martelli–Montanari

Teorema (Correcci´on del algoritmo de Martelli–Montanari)

1. El algoritmo termina para cualquier problema de unificaci´on E .

2. Si $E$ no tiene soluci´on, el algoritmo llega a una falla.

3. Si $E$ tiene soluci´on, el algoritmo llega a $\emptyset$ :

$$
\mathsf { E } = E _ { 0 } \to _ { \mathsf { S } _ { 1 } } E _ { 1 } \to _ { \mathsf { S } _ { 2 } } E _ { 2 } \to . . . \to _ { \mathsf { S } _ { n } } E _ { n } =
$$

Adem´as, $\pmb { \mathsf { S } } = \pmb { \mathsf { S } } _ { n } \circ . . . \circ \pmb { \mathsf { S } } _ { 2 } \circ \pmb { \mathsf { S } } _ { 1 }$ es un unificador para $E$

Adem´as, dicho unificador es el m´as general posible.   
(Salvo renombre de inc´ognitas).

# Definici´on (Unificador m´as general)

Notamos mgu(E) al unificador m´as general de $E$ , si existe.

# Algoritmo de unificaci´on de Martelli–Montanari

# Ejemplo

Calcular unificadores m´as generales para los siguientes problemas de unificaci´on:

$\begin{array} { r } { \mathbf { \Sigma } \{ ( \mathrm { X } _ { 2 } \to ( \mathrm { X } _ { 1 } \to \mathrm { X } _ { 1 } ) ) \overset { ? } { = } ( ( \mathrm { B o o l } \to \mathrm { B o }   } \\ { \mathbf { \Sigma }   \{ \mathrm { X } _ { 1 } \overset { ? } { = } ( \mathrm { X } _ { 2 } \to \mathrm { X } _ { 2 } ) , \mathrm { ~ \mathrm { X } } _ { 2 } \overset { ? } { = } ( \mathrm { X } _ { 1 } \to \mathrm { X } _ { 1 } ) \}  } \end{array}$ (X1 → X2))}

Introducci´on

# Algoritmo de unificaci´on

Algoritmo de inferencia de tipos

Correcci´on del algoritmo de unificaci´on

# Algoritmo I — Inferencia de tipos

El algoritmo $\mathcal { T }$ recibe un t´ermino U sin anotaciones de tipos.

Consta de los siguientes pasos:

1. Rectificaci´on del t´ermino.   
2. Anotaci´on del t´ermino con variables de tipo frescas.   
3. Generaci´on de restricciones (ecuaciones entre tipos).   
4. Unificaci´on de las restricciones.

$$
^ { 1 7 }
$$

# Algoritmo I — Paso 1: rectificaci´on

Decimos que un t´ermino est´a rectificado si:

1. No hay dos variables ligadas con el mismo nombre. 2. No hay una variable ligada con el mismo nombre que una variable libre.

Ejemplo – T´erminos rectificados $\begin{array} { r l } & { x \left( \lambda x . x x \right) \left( \lambda y . y x \right) } \\ & { x \left( \lambda z . z z \right) \left( \lambda y . y x \right) } \\ & { \lambda x . \lambda x . x y } \\ & { \lambda x . \lambda z . z y } \end{array}$ no est´a rectificado est´a rectificado no est´a rectificado est´a rectificado

# Observaci´on

Siempre se puede rectificar un t´ermino $\alpha$ -renombr´andolo.

$$
\mathsf { o r i t m o \ : \mathcal { T } \mathrm { ~ - ~ } P a s o \ : \mathcal { Q } : \mathsf { a n o t a c i d e n } }
$$

Tenemos un t´ermino $U$ , que suponemos ya rectificado.

Producimos un contexto Γ0 y un t´ermino $M _ { 0 }$ :

1. El contexto $\Gamma _ { 0 }$ le da tipo a todas las variables libres de $U$ . El tipo de cada variable es una inc´ognita fresca.   
2. El t´ermino $M _ { 0 }$ est´a anotado de tal modo que erase $( M _ { 0 } ) = U $ Todas las anotaciones son inc´ognitas frescas.

# Ejemplo – Anotaci´on del t´ermino

Dado el t´ermino rectificado $U = \left( \lambda x . y x x \right) \left( \lambda z . w \right)$ , producimos:

$$
\begin{array} { r l } & { \Gamma _ { 0 } = \left( y : \mathtt { X } _ { 1 } , w : \mathtt { X } _ { 2 } \right) } \\ & { M _ { 0 } = \left( \lambda x : \mathtt { X } _ { 3 } . y \times x \right) \left( \lambda z : \mathtt { X } _ { 4 } . w \right) } \end{array}
$$

# Algoritmo I — Paso 3: generaci´on de las restricciones

Tenemos un contexto Γ y un t´ermino M con anotaciones de tipos.

Recursivamente calculamos:

1. Un tipo $\tau$ , que corresponde al tipo de M.   
2. Un conjunto de ecuaciones $E$ . Representan restricciones para que M est´e bien tipado.

Definimos un algoritmo recursivo:

$$
\underbrace { ( \underbrace { \Gamma } _ { \mathrm { c o n t e x t o } } | \underbrace { M } _ { \mathrm { t e r m i n o } } ) } _ { \mathrm { e n t r a d a } } = \underbrace { ( \underbrace { \tau } _ { \mathrm { t i p o } } | \underbrace { E } _ { \mathrm { r e s t r i c c i o n e s } } ) } _ { \mathrm { s a l i d a } }
$$

con la precondici´on de que Γ le da tipo a todas las variables de M.

# Algoritmo I — Paso 3: generaci´on de las restricciones

1. I(Γ | Tru $\begin{array} { l } { { \Theta = \left( { \bf B o o l } \mid \emptyset \right) } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { = \left( { \bf \bar { \Phi } } \left( { \bf B o o l } \mid \emptyset \right) \right. } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\  { \mathrm { } } \\ { \mathrm { { } } } \\ { \mathrm { { } } } \\ { \mathrm { { } } } \\ { \mathrm { { } } } \\ { \mathrm { { } } } \\ { } \\ { \mathrm { { } } } \\ { \mathrm { } } \\ { } \\  \end{array}$   
2. I(Γ | Fal   
3. I(Γ | x )   
4. I (Γ | if $M _ { 1 }$ ∪ E3)   
donde

5. I $( \Gamma \mid M _ { 1 } M _ { 2 } ) = ( { \bf { x } } _ { k } \mid \{ \tau _ { 1 } \stackrel { ? } { = } ( \tau _ { 2 }  { \bf { x } } _ { k } ) \} \cup { \cal { L } }$ 1 ∪ E2)

donde ${ \tt X } _ { k }$ es una inc´ognita fresca $\begin{array} { r } { \mathcal { I } ( \Gamma \vert M _ { 1 } ) = \left( \tau _ { 1 } \vert E _ { 1 } \right) } \\ { \mathcal { I } ( \Gamma \vert M _ { 2 } ) = \left( \tau _ { 2 } \vert E _ { 2 } \right) } \end{array}$

6. I (Γ | λx : τ. M ) = (τ → σ | E ) donde I(Γ, x : τ | M) = (σ | E )

# Algor e las restricciones

Recordemos: Γ0 y $M _ { 0 }$ resultan de anotar un t´ermino rectificado U.

Una vez calculado ${ \mathcal { T } } ( \Gamma _ { 0 } | M _ { 0 } ) = ( \tau | E ) \colon$

1. Calculamos ${ \mathsf { \pmb { \mathsf { S } } } } = { \mathsf { m g u } } ( E )$ .   
2. Si no existe el unificador, el t´ermino $U$ no es tipable.   
3. Si existe el unificador, el t´ermino $U$ es tipable y vale:

$$
\pmb { \mathsf { S } } ( \Gamma _ { 0 } ) \vdash \pmb { \mathsf { S } } ( M _ { 0 } ) : \pmb { \mathsf { S } } ( \tau )
$$

# Algoritmo I — Correcci´on

# Teorema (Correcci´on del algoritmo I)

Sean $\Gamma _ { 0 } \times M _ { 0 }$ el resultado de anotar un t´ermino rectificado U. Supongamos que ${ \mathcal { T } } ( \Gamma _ { 0 } \mid M _ { 0 } ) = ( \tau \mid E )$ . Entonces:

1. Si $U$ no es tipable, no hay unificador para E.   
2. Si U es tipable, existe $\pmb { \mathsf { S } } = \mathsf { m g u } ( E ) .$ . Adem´as, $\pmb { \mathsf { S } } ( \Gamma _ { 0 } ) \vdash \pmb { \mathsf { S } } ( M _ { 0 } ) : \pmb { \mathsf { S } } ( \tau )$ es un juicio de tipado v´alido. M´as a´un, el juicio de tipado es el m´as general posible para U. M´as precisamente, si $\Gamma ^ { \prime } \vdash M ^ { \prime } : \tau ^ { \prime }$ es un juicio v´alido y erase $\left( M ^ { \prime } \right) = U$ , existe una sustituci´on $\bullet ^ { \prime }$ tal que:

$$
\begin{array} { r c l } { { \Gamma ^ { \prime } } } & { { \supseteq } } & { { \mathbb { S } ^ { \prime } ( \Gamma _ { 0 } ) } } \\ { { M ^ { \prime } } } & { { = } } & { { \mathbb { S } ^ { \prime } ( M _ { 0 } ) } } \\ { { \tau ^ { \prime } } } & { { = } } & { { \mathbb { S } ^ { \prime } ( \tau ) } } \end{array}
$$

donde adem´as S es m´as general que S′.

# Algoritmo I de inferencia de tipos

Ejercicio. Aplicar el algoritmo de inferencia sobre los siguientes t´erminos:

$$
\begin{array} { l } { > \lambda x . \lambda y . y x } \\ { > ( \lambda x . x x ) ( \lambda x . x x ) } \end{array}
$$

$$
2 4
$$

Introducci´on

# Algoritmo de unificaci´on

Algoritmo de inferencia de tipos

Correcci´on del algoritmo de unificaci´on

# Recordemos: algoritmo de unificaci´on

${ \begin{array} { r l } { \left\{ \mathbb { X } _ { n } \stackrel { ? } { = } \mathbb { X } _ { n } \right\} \cup E } & { { \xrightarrow { \mathrm { D e l e t e } } } } \\ { , \dots , \tau _ { n } ) \stackrel { ? } { = } C ( \sigma _ { 1 } , \dots , \sigma _ { n } ) \} \cup E } & { { \xrightarrow { \mathrm { D e c o m p o s e } } } } \\ { \left\{ \tau \stackrel { ? } { = } \mathbb { X } _ { n } \right\} \cup E } & { { \xrightarrow { \mathrm { S u a p } } } } \end{array} }$ E   
{C (τ1 $\{ \tau _ { 1 } \stackrel { ? } { = } \sigma _ { 1 } , . . . , \tau _ { n } \stackrel { ? } { = } \sigma _ { n } \} \cup E$ $\{ \mathtt { X } _ { n } \overset { ? } { = } \tau \} \cup E$ si $\tau$ no es una inc´ognita

$\{ { \mathrm { X } } _ { n } { \overset { ? } { = } } \tau \} \cup E { \overset { \scriptstyle { \mathtt { E 1 i m } } } { \longrightarrow } } \{ { \mathrm { X } } _ { n } \quad \tau \}$ $E \{ { \bf { X } } _ { n } \qquad \tau \}$ si ${ \tt X } _ { n }$ no ocurre en $\tau$ {C (τ $\left. _ { \downarrow , . . . , \tau _ { n } } \right) \stackrel { ? } { = } C ^ { \prime } ( \sigma _ { 1 } , . . . , \sigma _ { m } ) \} \cup E \quad \xrightarrow { \mathrm { c l a s h } } \quad$ falla si $C \neq C ^ { \prime }$ $\{ \mathrm { X } _ { n } \stackrel { ? } { = } \tau \} \cup E \xrightarrow { \mathrm { 0 c c u r s - C h e c k } }$ falla si $\mathtt { X } _ { n } \neq \tau$ y ${ \tt X } _ { n }$ ocurre en $\tau$

# Terminaci´on del algoritmo de unificaci´on

Dado un conjunto de ecuaciones de unificaci´on $E$ , definimos:

▶ n : cantidad de inc´ognitas distintas en $E$ ▶ n2: tama˜no de E , calculado como P(τ ?=σ)∈E | $\begin{array} { r } { \sum _ { ( \tau \stackrel { ? } { = } \sigma ) \in E } | \tau | + | \sigma | } \end{array}$ ▶ n3: cantidad de ecuaciones de la forma $\tau \stackrel { ? } { = } \mathtt { X } _ { n }$ en E

Podemos observar que las reglas que no producen falla achican la tripla $\left( n _ { 1 } , n _ { 2 } , n _ { 3 } \right)$ , de acuerdo con el orden lexicogr´afico:

<table><tr><td></td><td>n1</td><td>n2</td><td>n3</td></tr><tr><td>Elim</td><td>V</td><td></td><td></td></tr><tr><td>Decompose</td><td></td><td>&gt;</td><td></td></tr><tr><td>Delete</td><td>≥</td><td></td><td></td></tr><tr><td>Swap</td><td></td><td></td><td>&gt;</td></tr></table>

# Correcci´on del algoritmo de unificaci´on

# Recordemos

1. Una sustituci´on es una funci´on S que le asocia un tipo $\mathsf { \pmb { S } } ( \mathsf { X } _ { n } )$ a cada inc´ognita ${ \tt X } _ { n }$ .

2. S es un unificador de $E$ si para cada $( \tau \overset { ? } { = } \sigma ) \in E$ se tiene que $\ \mathsf { \pmb S } ( \tau ) = \mathsf { \pmb S } ( \sigma ) .$

3. S es m´as general que $\bullet ^ { \prime }$ si existe T tal que $\mathsf { \pmb { S } } ^ { \prime } = \mathsf { \pmb { T } } \circ \mathsf { \pmb { S } } .$

4. S es un m.g.u. de $E$ si S es un unificador de E y para todo unificador $\bullet ^ { \prime }$ de E

se tiene que S es m´as general que $\bullet ^ { \prime }$

T´ecnicamente, nos interesan los m.g.u. idempotentes, es decir ${ \pmb { \mathsf { S } } } ( { \pmb { \mathsf { S } } } ( \tau ) ) = { \pmb { \mathsf { S } } } ( \tau )$ para todo t´ermino $\tau$ .

# Correcci´on del algoritmo de unificaci´on

Lema — correcci´on de la regla Delete S m.g.u. de $E \implies$ S m.g.u. de $\left\{ \mathtt { X } _ { n } \overset { ? } { = } \mathtt { X } _ { n } \right\} \cup E .$

Lema — correcci´on de la regla Swap S m.g.u. de $\{ \tau \stackrel { ? } { = } \sigma \} \cup E \implies$ S m.g.u. de $\{ \sigma \stackrel { ? } { = } \tau \} \cup E .$ .

Lema — correcci´on de la regla Decompose S m.g.u. de $\begin{array} { r l } & { \{ \tau _ { 1 } \stackrel { ? } { = } \sigma _ { 1 } , \ldots , \tau _ { n } \stackrel { \overline { { ? } } } { = } \sigma _ { n } \} \cup \bar { E } } \\ & { \textsf { S m . g . u . d e } \{ C ( \tau _ { 1 } , \ldots , \tau _ { n } ) \stackrel { ? } { = } C ( \sigma _ { 1 } , \ldots , \tau _ { n } ) } \end{array}$ =⇒ σn)} ∪ E .

Lema — correcci´on de la regla Elim

S m.g.u. de $E \{ \mathtt { X } _ { n } : = \tau \}$ y Xn ∈/ τ =⇒ $\mathsf { S o } \left\{ \mathbb { X } _ { n } : = \tau \right\}$ m.g.u. de $E$ .

Usar que si ${ \bf X } _ { n }$ entonces $\mathrm { ~  ~ { ~ \cal ~ X ~ } ~ } _ { n }$

# Correcci´on del algoritmo de unificaci´on

Probemos la correcci´on del algoritmo en caso de ´exito.

Sea ${ \cal E } _ { 0 }  \pmb { \varsigma } _ { 1 } \ : { \cal E } _ { 1 }  \pmb { \varsigma } _ { n } \ : { \cal E } _ { 2 }  . . .  \pmb { \varsigma } _ { n } \ : { \cal E } _ { n } = \emptyset .$ Veamos que $\pmb { \mathsf { S } } _ { n } \circ \dots \circ \pmb { \mathsf { S } } _ { 1 }$ es un m.g.u. de $E$ . Por inducci´on en $n$ :

1. Si $n = 0$ , la sustituci´on identidad es un m.g.u. de $\emptyset$

2. Si $n > 0$ , se tiene:

$$
E _ { 0 }  _ { { \bf S } _ { 1 } } E _ { 1 } \qquad E _ { 1 }  _ { { \bf S } _ { 2 } } . . .  _ { { \bf S } _ { n } } E _ { n } = \delta
$$

Por HI, $\mathbf { S } _ { n } \circ \ldots \circ \mathbf { S } _ { 2 }$ es un m.g.u. de $E _ { 1 }$

Aplicando alguno de los lemas anteriores, se concluye que $\pmb { \mathsf { S } } _ { n } \circ \dots \circ \pmb { \mathsf { S } } _ { 2 } \circ \pmb { \mathsf { S } } _ { 1 }$ es un m.g.u. de $E _ { 0 }$ .

# Correcci´on del algoritmo de unificaci´on

La correcci´on en caso de falla se prueba de manera similar, con lemas que van “hacia adelante” en lugar de “hacia atr´as”.

# 31

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

# Lectura recomendada

Cap´ıtulo 22 del libro de Pierce.   
Benjamin C. Pierce. Types and Programming Languages.   
The MIT Press, 2002.

Extra: teor´ıa detr´as del m´etodo de unificaci´on Secci´on 4.5 del libro de Baader & Nipkow. Franz Baader y Tobias Nipkow. Term Rewriting and All That. Cambridge University Press, 1998.