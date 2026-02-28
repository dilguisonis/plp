# Paradigmas de Programaci´on

L´ogica de primer orden

2do cuatrimestre de 2025 Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

# 1

# Introducci´on

# Sintaxis de la l´ogica de primer orden

Deducci´on natural para l´ogica de primer orden

$$
2
$$

Sem´antica de la l´ogica de primer orden

Unificaci´on de t´erminos

# Introducci´on

# L´ogica proposicional

Permite razonar acerca de proposiciones.

Ejemplo: Llueve ∨ ¬Llueve

# L´ogica de primer orden

Permite razonar acerca de elementos sobre los que se predica. Ejemplo:

$$
\forall X . ( \qquad ( X ) \Rightarrow \neg \qquad ( \operatorname { s u c c } ( X ) ) )
$$

Extiende a la l´ogica proposicional con t´erminos y cuantificadores.

# ¿Para qu´e tanta l´ogica? Yo me anot´e en Computaci´on. . .

Conexi´on estrecha entre l´ogica de primer orden y Computaci´on.

En sus or´ıgenes hist´oricos

Problema de la decisi´on de Hilbert.

# En la actualidad

Computabilidad y complejidad descriptiva.   
Representaci´on del conocimiento, sistemas multi-age Inteligencia artificial, razonamiento autom´atico.   
M´etodos formales, verificaci´on autom´atica.   
Bases de datos relacionales, lenguajes de consulta.   
Verificaci´on de hardware.   
Fundamento de la programaci´on l´ogica.

$$
4
$$

# Programaci´on l´ogica

Ideal de la programaci´on declarativa

Los programas deber´ıan asemejarse a especificaciones.

En particular: programaci´on l´ogica

El usuario escribe una f´ormula:

∃X . P(X )

El sistema busca satisfacer o refutar la f´ormula.

En caso de lograr satisfacerla, el sistema produce una salida que verifica la propiedad $P$ buscada.

# Introducci´on

# Sintaxis de la l´ogica de primer orden

Deducci´on natural para l´ogica de primer orden

Sem´antica de la l´ogica de primer orden

Unificaci´on de t´erminos

# 6

# Lenguajes de primer orden

# Definici´on

Un lenguaje de primer orden $\mathcal { L }$ est´a dado por:

1. Un conjunto de s´ımbolos de funci´on $\mathcal { F } = \{ \mathbf { f } , \mathbf { g } , \mathbf { h } , \mathbf { \Omega } , \mathbf { \Omega } \} .$ Cada s´ımbolo de funci´on tiene asociada una aridad $( \geq 0 )$ . 2. Un conjunto de s´ımbolos de predicado $\mathcal { P } = \{ \mathsf { P } , \mathsf { Q } , \mathsf { R } , \hdots \} .$ Cada s´ımbolo de predicado tiene asociada una aridad $( \geq 0 )$

# T´erminos de primer orden

Suponemos fijado un lenguaje de primer orden $\mathcal { L }$ y un conjunto infinito numerable de variables $\mathcal { X } = \{ X , Y , Z , \ldots \} .$

# Definici´on

El conjunto T de t´erminos se define por la siguiente gram´atica:

$$
 \begin{array} { r l r l r l } { t } & { { } } & { \mathrel { \mathop : } = { } } & { { } } & { X } & { { } } & { { } \big | } & { } & { { } \mathbf { f } \left( t _ { 1 } , \ldots , t _ { n } \right) } \end{array}
$$

donde:

X denota una variable f denota un s´ımbolo de funci´on de aridad n

# T´erminos de primer orden

Ejemplo — el lenguaje Laritm´etica

![](images/68d99ff0562c6327ead2007fcbba896e5b8105a45b9e56feacc8788e79abf6a3.jpg)

![](images/d83dce8f7326d14a95701507ebca575f7c9c52247f22543614683bfe55af3c7d.jpg)

Ejemplo — t´erminos sobre el lenguaje Laritm´etica

$$
+ ( 0 , \operatorname { s u c c } ( X ) ) \qquad * ( + ( X , Y ) , Z )
$$

Los s´ımbolos de funci´on de aridad 0 se llaman constantes.   
Nota. Usamos notaci´on infija como conveniencia.

$$
0 + \operatorname { s u c c } ( X ) \qquad ( X + Y ) * Z
$$

# F´ormulas de primer orden

Recordemos la gram´atica de las f´ormulas en l´ogica proposicional y extend´amosla a l´ogica de primer orden.

$\begin{array} { r c l } { \sigma } & { : = } & { \mathsf { P } ( t _ { 1 } , \ldots , t _ { n } ) } \\ & & { | } & { \bot } \\ & & { | } & { \sigma \Rightarrow \sigma } \\ & & { | } & { \sigma \land \sigma } \\ & & { | } & { \sigma \lor \sigma } \\ & & { | } & { \lnot \sigma } \\ & & { | } & { \forall \cal X . \sigma } \\ & & { | } & { \exists \cal X . \sigma } \end{array}$ f´ormula at´omica contradicci´on implicaci´on conjunci´on disyunci´on negaci´on cuantificaci´on universal cuantificaci´on existencial

P denota un s´ımbolo de predicado de aridad $^ { n }$ .   
Los cuantificadores ligan una variable X .   
Se puede tomar la precedencia: ¬, ∀X . σ/∃X . σ, ∧, ∨, ⇒.

# F´ormulas de primer orden

Recordemos — el lenguaje Laritm´etica

0 succ1 2 2 2   
0 + ∗ 12

Ejemplo — f´ormulas sobre Laritm´etica

$$
\forall X . \exists Y . = ( + ( X , Y ) , 0 )
$$

∀X . ∀Y . (succ(X ) = succ(Y ) ⇒ X = Y )

$$
\forall X . ( X \quad \ 0 \lor \ X \quad 0 \lor \ 0 \quad X )
$$

# F´ormulas de primer orden

Una ocurrencia de una variable X en una f´ormula est´a:

ligada si est´a bajo el alcance de un cuantificador $\forall X / \exists X$ , libre si no.

Dos f´ormulas que s´olo difieren en los nombres de las variables ligadas se consideran iguales.

# Ejemplo

∀X . ∃Y . P(X , Y ) ≡ ∀Y . ∃X . P(Y , X ) ≡ ∀A. ∃B. P(A, B)

# F´ormulas de primer orden

Notamos $\sigma \{ X : = t \}$ a la sustituci´on de las ocurrencias libres de X en la f´ormula $\sigma$ por el t´ermino t, evitando la captura de variables.

# Ejemplo

Sean:

$$
{ \boldsymbol { \sigma } } ~ : \equiv ~ \operatorname { s u c c } ( { \boldsymbol { X } } ) \quad { \boldsymbol { Y } } \implies \exists { \boldsymbol { Z } } . { \boldsymbol { X } } + { \boldsymbol { Z } }
$$

entonces:

σ{X := Z ∗ Z} $\sharp \ \equiv \ \mathsf { s u c c } ( Z \ast Z ) = Y \implies \exists Z ^ { \prime } . ( Z \ast Z )$ Z ) + Z ′ = Y

# Introducci´on

# Sintaxis de la l´ogica de primer orden

Deducci´on natural para l´ogica de primer orden

$$
^ { 1 4 }
$$

Sem´antica de la l´ogica de primer orden

Unificaci´on de t´erminos

# Deducci´on natural

La deducci´on natural proposicional se extiende a primer orden.

Igual que antes:

1. Un contexto Γ es un conjunto finito de f´ormulas.   
2. Un secuente es de la forma Γ ⊢ σ.

Todas las reglas de deducci´on natural proposicional siguen vigentes.   
Se agregan reglas de introducci´on y eliminaci´on para ∀ y ∃.   
Axioma ax   
Conjunci´on ∧i ∧e1 ∧e2   
Disyunci´on ∨i1 ∨i2 ∨e   
Implicaci´on ⇒i ⇒e   
Negaci´on ¬i ¬e   
Contradicci´on ⊥e   
L´ogica cl´asica ¬¬e   
Cuantificaci´on universal ∀i ∀e   
Cuantificaci´on existencial ∃i ∃e

# Cuantificaci´on universal

Regla de eliminaci´on

$$
\frac { \Gamma \vdash \forall X . \sigma } { \Gamma \vdash \sigma \{ X : = t \} } \forall \mathrm { E }
$$

Regla de introducci´on

$$
\frac { \Gamma \vdash \sigma \quad X \notin \mathsf { f v } ( \Gamma ) } { \Gamma \vdash \forall X . \sigma } \forall \mathrm { I }
$$

# Cuantificaci´on universal

Ejemplo

∀X . ( $\begin{array} { r l } & { \overline { { \mathbf { \phi } ^ { \mathtt { p } } ( X ) \wedge \mathbf { Q } ( X ) ) \vdash \forall X . ( \mathbf { P } ( X ) \wedge \mathbf { Q } ( X ) ) } } ^ { \mathrm { - \mathbb { A X } } } } \\ & { \overline { { \mathbf { \phi } ^ { \mathtt { c } } ) \wedge \mathbf { Q } ( X ) ) \vdash \mathbf { P } ( \cos ( X ) ) \wedge \mathbf { Q } ( \cos ( X ) ) } } ^ { \overline { { \mathtt { c } } } } } \\ & { \overline { { \mathbf { \phi } _ { X } . ( \mathbf { P } ( X ) \wedge \mathbf { Q } ( X ) ) \vdash \mathbf { P } ( \cos ( X ) ) } } ^ { \overline { { \mathtt { c } } } } \wedge } \\ & { \overline { { \mathbf { \phi } ( \mathbf { P } ( X ) \wedge \mathbf { Q } ( X ) ) \vdash \forall X . \mathbf { P } ( \cos ( X ) ) } } ^ { \overline { { \mathtt { c } } } } \quad \forall } \\ & { \overline { { \mathbf { \phi } ( \mathbf { P } ( X ) \wedge \mathbf { Q } ( X ) ) \Rightarrow \forall X . \mathbf { P } ( \cos ( X ) ) } } \quad \Rightarrow 1 } \end{array}$ e   
∀X . (P( e1   
∀ i   
∀X.   
⊢ ∀X.

$$
^ { 1 7 }
$$

# Cuantificaci´on universal

Ejemplo

$$
\begin{array} { r l } & { \overset { \cdot } { \underset { \mathbf { V } ^ { } , \forall X . \forall Y . \mathbf { Q } ( X , Y ) \vdash \forall Z . \forall Y . \mathbf { Q } ( Z , Y ) } { \cdot } } } \\ & { \overset { \cdot } { \underset { \mathbf { V } ^ { } , \forall X . \forall Y . \mathbf { Q } ( X , Y ) \vdash \forall Y . \forall X . \mathbf { Q } ( Z , Y ) } { \cdot } } \overset { \cdot } { \underset { \forall Y . \mathbf { Q } ( X , Y ) \vdash \forall Y . \mathbf { Q } ( Z , Y ) } { \cdot } } } \\ & { \overset { \cdot } { \underset { \mathbf { P } ^ { } , \forall X . \forall Y . \mathbf { Q } ( X , Y ) \vdash \forall ( Z , Y ) } { \cdot } } \overset { \cdot } { \underset { \forall Y . \mathbf { Q } ( X , Y )  \forall Y . \mathbf { Q } ( X , Y ) } { \cdot } } \overset { \forall } { \underset { \forall Y } { \cdot } } } \\ & { \overset { \cdot } { \underset { \forall X . \forall Y . \mathbf { Q } ( X , Y ) \vdash \forall Y . \forall X . \mathbf { Q } ( X , Y ) } { \cdot } } \overset { \cdot } { \underset { \forall Y . \forall X . \mathbf { Q } ( X , Y ) } { \cdot } } } \end{array}
$$

# Cuantificaci´on universal

¿Por qu´e se exige que $X \notin \mathsf { f v } ( \Gamma )$ en la regla ∀i?

Ejemplo — aplicaci´on incorrecta de la regla ∀i

EsPar(N) ⊢ EsPar(N) ⇐ Paso de razonamiento inv´alido EsPar(N) ⊢ ∀N. EsPar(N)

# Cuantificaci´on existencial

Regla de introducci´on

$$
{ \frac { \Gamma \vdash \sigma \{ X : = t \} } { \Gamma \vdash \exists X . \sigma } } \exists \mathrm { I }
$$

# Regla de eliminaci´on

$$
\frac { \Gamma \vdash \exists X . \sigma \quad \Gamma , \sigma \vdash \tau \quad X \notin \mathsf { f v } ( \Gamma , \tau ) } { \Gamma \vdash \tau } \exists \mathrm { E }
$$

# Cuantificaci´on existencial

Ejemplo

![](images/37512693dabc6ab0580cec166cc9c618322685268b8d534fdcf91b332a762f0e.jpg)

# Cuantificaci´on existencial

Ejemplo

$\begin{array} { r l } & { \quad \frac { \alpha , \mathbf { P } ( W , W ) , \mathbf { Q } ( X ) \vdash \mathbf { P } ( W , W ) } { \sigma , \mathbf { P } ( W , W ) \vdash \mathbf { Q } ( X ) \Rightarrow \mathbf { P } ( W , W ) } \quad \quad } \\ & { \quad \frac { \sigma , \mathbf { P } ( W , W ) \vdash \mathbf { Q } ( X ) \Rightarrow \mathbf { P } ( W , W ) } { \tau , \mathbf { P } ( W , W ) \vdash \exists Z . ( \mathbf { Q } ( X ) \Rightarrow \mathbf { P } ( W , Z ) ) } \stackrel { \exists } { = } } \\ & { \quad \frac { \mathbf { \ P } ( W , W ) \vdash \exists Y . \exists Z . ( \mathbf { Q } ( X ) \Rightarrow \mathbf { P } ( W , Z ) ) } { \Rightarrow \mathbf { V } . \exists Z . ( \mathbf { Q } ( X ) \Rightarrow \mathbf { P } ( Y , Z ) ) } } \\ & { \quad \overline { { W ) \vdash \exists Y . \exists Z . ( \mathbf { Q } ( X ) \Rightarrow \mathbf { P } ( Y , Z ) ) } } \quad \equiv } \end{array}$ i ax ∃i σ ⊢ σ σ, P e ∃X W . P(X W ,

# Cuantificaci´on existencial

# Para pensar

¿Por qu´e se exige que $X \not \in \mathfrak { f v } ( \Gamma , \tau )$ en la regla ∃e?

$$
^ { 2 3 }
$$

# Introducci´on

# Sintaxis de la l´ogica de primer orden

Deducci´on natural para l´ogica de primer orden

$$
2 4
$$

Sem´antica de la l´ogica de primer orden

Unificaci´on de t´erminos

# Estructuras de primer orden

Suponemos fijado un lenguaje de primer orden $\mathcal { L }$ .

# Definici´on

Una estructura de primer orden es un par $\mathcal { M } = ( M , I )$ donde:

M es un conjunto no vac´ıo, llamado universo.

I es una funci´on que le da una interpretaci´on a cada s´ımbolo.

Para cada s´ımbolo de funci´on f de aridad $^ { n }$ :

$$
I ( \pounds ) : M ^ { n } \to M
$$

Para cada s´ımbolo de predicado P de aridad n:

$$
I ( \mathbf { \theta } ) \subseteq M ^ { n }
$$

# Estructuras de primer orden

Recordemos — el lenguaje Laritm´etica

Ejemplo — una estructura sobre Laritm´etica

M := N (los elementos son n´umeros naturales)

$$
\begin{array} { l l } { ( 0 ) } & { = 0 } \\ { ( \operatorname { s u c c } ) ( n ) = n + 1 } & { \quad ( n , m ) \in I ( \quad ) } \\ { ( + ) ( n , m ) = n + m } & { } \\ { ( * ) ( n , m ) \ = n \cdot m } & { \quad ( n , m ) \in I ( \quad ) } \end{array}
$$

¿Qu´e pasa con la f´ormula ∀X . $. ( X = X + X )$ bajo esta estructura? ¡Es falsa!

# Estructuras de primer orden

Recordemos — el lenguaje Laritm´etica

Ejemplo — otra estructura sobre Laritm´etica

$M : = { \mathcal { P } } ( \mathbb { R } )$ (los elementos son conjuntos de n´umeros reales)

$$
\begin{array} { c c } { { } } & { { = \emptyset } } \\ { { . . . \circ ( A ) = \left\{ 1 + x \ | \ x \in A \right\} } } & { { ( A , B ) \in I } } \\ { { ) ( A , B ) = A \cup B } } & { { ( A , B ) \in I } } \end{array}
$$

¿Y ahora qu´e pasa con ∀X . (X = X + X )? ¡Es verdadera!

# Interpretaci´on de t´erminos

Suponemos fijada una estructura de primer orden $\mathcal { M } = ( M , I )$ .

# Definici´on

Una asignaci´on es una funci´on que a cada variable le asigna un elemento del universo:

$$
\mathbf { a } : \mathcal { X }  M
$$

# Definici´on – interpretaci´on de t´erminos

Cada t´ermino $t \in \mathcal { T }$ se interpreta como un elemento ${ \mathbf a } ( t ) \in M$ , extendiendo la definici´on de a a t´erminos:

$$
\begin{array} { r c l } { \mathsf { f } \left( t _ { 1 } , \ldots , t _ { n } \right) ) } & { = } & { I ( \pounds ) ( \mathsf { a } ( t _ { 1 } ) , \ldots , \mathsf { a } ( t _ { n } ) ) } \end{array}
$$

# Interpretaci´on de f´ormulas

Suponemos fijada una estructura de primer orden ${ \mathcal { M } } = ( M , I ) .$

Definimos una relaci´on de satisfacci´on $\mathbf { a } \Vdash _ { \mathcal { M } } \sigma$ “La asignaci´on a (bajo la estructura $\mathcal { M } )$ satisface la f´ormula $\boldsymbol { \sigma } ^ { \prime \prime }$ .

a ⊨M P(t1, . . . , tn) sii (a(t1), . . . , a(tn)) ∈ I (P) a ⊨ σ ∧ τ sii a ⊨M σ y a ⊨M τ a ⊨M σ ∨ τ sii a ⊨M σ o a ⊨M τ a ⊨M σ ⇒ τ sii a ̸⊨M σ o a ⊨M τ a ⊨M ¬σ sii a ̸⊨M σ

a ⊨M ∀X. σ sii $\mathbf { a } [ X \mapsto m ] \models _ { \mathcal { M } } \sigma$ para todo $m \in M$ a ⊨M ∃X. σ sii $\mathbf { a } [ X \mapsto m ] \models _ { \mathcal { M } } \sigma$ para alg´un $m \in M$ a ⊨M σ ♣ τ sii $\mathbf { a } \Vdash _ { \mathcal { M } } \sigma$ br´ocoli $\mathbf { a } \Vdash _ { \mathcal { M } } \tau$ (Chiste robado de J.-Y. Girard)

# Validez y satisfactibilidad

Decimos que una f´ormula $\sigma$ es:

<table><tr><td>VALIDA si a FM σ para toda M,a</td><td>SATISFACTIBLE si a FM σ para alguna M,a</td></tr><tr><td>INVALIDA si a FM σ para alguna M,a</td><td>INSATISFACTIBLE si a FM σ para toda M,a</td></tr></table>

# Observaciones

σ es Valida´ sii $\sigma$ no es Invalida´ $\sigma$ es Satisfactible sii $\sigma$ no es Insatisfactible σ es Valida´ sii ¬σ es Insatisfactible $\sigma$ es Satisfactible sii ¬σ es Invalida´

# Modelos

Una sentencia es una f´ormula $\sigma$ sin variables libres.   
Una teor´ıa de primer orden es un conjunto de sentencias.

# Definici´on — consistencia

Una teor´ıa T es consistente si T ̸⊢ ⊥.

# Definici´on — modelo

Una estructura $\mathcal { M } = ( M , I )$ es un modelo de una teor´ıa T si vale $\models _ { \mathcal { M } } \sigma$ para toda f´ormula $\sigma \in { \mathcal { T } }$ .

(La asignaci´on es irrelevante pues $\sigma$ es cerrada).

# Correcci´on y completitud

Teorema (G¨odel, 1929)

Dada una teor´ıa T , son equivalentes:

1. T es consistente.   
2. T tiene (al menos) un modelo.

# Corolario

Dada una f´ormula $\sigma$ , son equivalentes:

1. ⊢ σ es derivable.   
2. $\sigma$ es v´alida.

# Corolario

Dada una f´ormula $\sigma$ , son equivalentes:

1. ⊢ ¬σ es derivable.   
2. $\sigma$ es insatisfactible.

$$
3 2
$$

# Ejemplos de validez y satisfactibilidad

# Ejemplo

Determinar si son (in)v´alidas/(in)satisfactibles:

$\begin{array} { r l } & { \mathrm { 1 . ~ } \forall X . \mathrm { ~ ( } X \quad X ) } \\ & { \mathrm { 2 . ~ } \forall X . \mathrm { ~ \lambda ~ } ( X ) \Rightarrow \forall X . \mathrm { ~ \lambda ~ } ( \mathtt { f } ( X ) ) } \\ & { \mathrm { 3 . ~ } \forall X . \mathrm { \ \lambda  ~ \lambda ~ } ( X ) \wedge \exists X . \mathrm { ~ \lambda ~ } ( X ) } \\ & { \mathrm { 4 . ~ } \forall X . \exists Y . \mathrm { ~ \lambda ~ } ( X , Y ) \Rightarrow \exists Y . \forall X . \mathrm { ~ \lambda ~ } ( X , Y } \\ & { \mathrm { 5 . ~ } \forall X . \mathrm { ~ ( } X ) \Rightarrow \sigma ) \ \Rightarrow \ ( \exists X . \mathrm { ~ \lambda ~ } ( X ) ) \Rightarrow } \end{array}$ satisfactible e inv´alida v´alida (∴ satisfactible) nsatisfactible (∴ inv´alida) ) satisfactible e inv´alida con $X \notin \mathsf { f v } ( \sigma )$ v´alida

# El problema de la decisi´on

Querr´ıamos un algoritmo que resuelva el siguiente problema:

Entrada: una f´ormula $\sigma$ .   
Salida: un booleano que indica si $\sigma$ es v´alida.

No es posible dar un algoritmo que cumpla dicha especificaci´on.

# Introducci´on

# Sintaxis de la l´ogica de primer orden

Deducci´on natural para l´ogica de primer orden

Sem´antica de la l´ogica de primer orden

Unificaci´on de t´erminos

# Algoritmo de unificaci´on

El algoritmo de unificaci´on que conoc´ıamos se adapta a t´erminos de primer orden s´olo cambiando la notaci´on:

$\begin{array} { r l } { \{ X ^ { \frac { 7 } { 2 } } X \} \cup E } & { \xrightarrow { \mathrm { \scriptsize ~ p e l e t e } } , } \\ { t _ { 1 } , \ldots , t _ { n } \big ) ^ { \frac { 7 } { 2 } } \mathbf { f } \big ( s _ { 1 } , \ldots , s _ { n } \big ) \} \cup E } & { \xrightarrow { \mathrm { \scriptsize ~ p e c o m p o s e } } } \\ { \{ t ^ { \frac { 7 } { 2 } } X \} \cup E } & { \xrightarrow { \mathrm { \scriptsize ~ s u a p } } } \\ & { \qquad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad } \end{array}$ E   
{f( $\{ t _ { 1 } \stackrel { ? } { = } s _ { 1 } , \ldots , t _ { n } \stackrel { ? } { = } s _ { n } \} \cup E$ $\{ X { \overset { ? } { = } } t \} \cup E$ si $t$ no es una variable $\{ X \stackrel { ? } { = } t \} \cup E \quad \xrightarrow { \mathtt { E 1 i m } } \{ X \quad t \}$ E{X :=t} si X ∈/ fv(t)   
{f $\left( t _ { 1 } , \dots , t _ { n } \right) \overset { ? } { = } \mathbf { g } ( s _ { 1 } , \dots , s _ { m } ) \} \cup E \quad \xrightarrow { \mathrm { c l a s h } } \quad$ falla si f ̸= g {X ?= t} ∪ E Occurs-Check −−−−−−−−→ falla si $X \neq t \ y \ X \in \mathsf { f v } ( t )$

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

# Lectura recomendada

# Cap´ıtulo 2 del libro de van Dalen.

$$
3 7
$$