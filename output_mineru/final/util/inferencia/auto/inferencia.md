# Inferencia de Tipos Machete

Paradigmas (de Lenguajes) de Programaci´on

# 1. Algoritmo de inferencia

Consta de los siguientes pasos:

1. Rectificaci´on del t´ermino.   
2. Anotaci´on del t´ermino con variables de tipo frescas.   
3. Generaci´on de restricciones (ecuaciones entre tipos).   
4. Unificaci´on de las restricciones.

# 1.1. Rectificaci´on

Decimos que un t´ermino est´a rectificado si:

No hay dos variables ligadas con el mismo nombre.   
No hay una variable ligada con el mismo nombre que una variable libre.

Siempre se puede rectificar un t´ermino $\alpha$ -renombr´andolo.

# 1.2. Anotaci´on

Dado un t´ermino $U$ , que suponemos ya rectificado, producimos un contexto $\Gamma _ { 0 }$ y un t´ermino $M _ { 0 }$ :

El contexto $\Gamma _ { 0 }$ le da tipo a todas las variables libres de $U$ . El tipo de cada variable es una inc´ognita fresca.   
El t´ermino $M _ { 0 }$ est´a anotado de tal modo que $E r a s e ( M _ { 0 } ) = U$ . Todas las anotaciones son inc´ognitas frescas.

# 1.3. Generaci´on de restricciones

1. $\mathcal { T } ( \Gamma \mid \mathsf { T r u e } ) = ( \mathsf { B o o l } \mid \emptyset )$

2. $\mathcal { I } ( \Gamma \mid \mathsf { F a l s e } ) = ( \mathsf { B o o l } \mid \emptyset )$

3. $\mathcal { I } ( \Gamma \mid x ) = \left( \tau \mid \emptyset \right)$ si (x : τ ) ∈ Γ

4. $\scriptstyle { \mathcal { T } } ( \Gamma \ )$ if $M _ { 1 }$ then $M _ { 2 }$ else ${ \cal M } _ { 3 } ) =$ $( \tau _ { 2 } \ | \ \{ \begin{array} { c c c c } { { } } & { { } } & { { } } & { { , } } & { { } } \end{array} \} \cup E _ { 1 } \cup E _ { 2 } \cup E _ { 3 } )$ donde ${ \mathcal { I } } ( \Gamma \mid M _ { 1 } ) = ( \tau _ { 1 } \mid E _ { 1 } )$ $\begin{array} { r } { { \cal Z } ( \Gamma \mid M _ { 2 } ) = ( \tau _ { 2 } \mid E _ { 2 } ) } \end{array}$ ${ \mathcal { I } } ( \Gamma \mid M _ { 3 } ) = ( \tau _ { 3 } \mid E _ { 3 } )$

6. ${ \mathcal { T } } ( \Gamma \mid \lambda x : \tau . \ M ) = ( \tau \to \sigma \ | \ E )$ donde $\mathcal { T } ( \Gamma , x : \tau \ | \ M ) = ( \sigma \ | \ E )$

7. $\mathcal { I } ( \Gamma \mid z \mathsf { e r o } ) = ( N a t \mid \emptyset )$

5. ${ \mathcal { Z } } ( \Gamma ~ \mid ~ M _ { 1 } M _ { 2 } ) = ( X ~ \mid ~ \{ ~ \} ~ \cup ~ E _ { 1 } \cup$ $E _ { 2 }$ ) donde $X$ es una inc´ognita fresca ${ \mathcal { I } } ( \Gamma \mid M _ { 1 } ) = ( \tau _ { 1 } \mid E _ { 1 } )$ $\begin{array} { r } { { \cal Z } ( \Gamma \mid M _ { 2 } ) = ( \tau _ { 2 } \mid E _ { 2 } ) } \end{array}$

8. ${ \mathcal { T } } ( \Gamma \mid { \mathsf { s u c c } } ( M ) ) = ( N a t \mid \{ \qquad \} \cup E )$ donde $\mathcal { I } ( \Gamma \mid M ) = ( \tau _ { 1 } \mid E )$

9. ${ \mathcal { Z } } ( \Gamma \mid \mathsf { p r e d } ( M ) ) = ( N a t \mid \{ \tau _ { 1 } \overset { ? } { = } N a t \} \cup E )$ donde $\mathcal { I } ( \Gamma \mid M ) = ( \tau _ { 1 } \mid E )$

10. $\mathcal { Z } ( \Gamma \mid \mathsf { i s Z e r o } ( M ) ) = ( \mathsf { B o o l } \mid \{ \begin{array} { l l l } { \begin{array} { r l r l } \end{array} } & { } &  \qquad \} \end{array} \} \cup E )$ donde $\mathcal { I } ( \Gamma \mid M ) = ( \tau _ { 1 } \mid E )$

# 1.4. Unificaci´on de restricciones

Dados $\Gamma \textbf { y } M$ , resultantes de anotar un t´ermino rectificado $U$ , una vez calculado ${ \mathcal { I } } ( \Gamma \mid M ) = ( \tau \mid E )$ :

1. Calculamos $\mathbf { S } = \mathsf { m g u } ( E )$ .

2. Si no existe el unificador, el t´ermino $U$ no es tipable.

3. Si existe el unificador, el t´ermino $U$ es tipable y devolvemos: $\mathbf { S } ( \Gamma ) \vdash \mathbf { S } ( M ) : \mathbf { S } ( \tau )$

# 2. Algoritmo de unificaci´on (Martelli-Montanari)

# 2.1. Reglas

Se enuncian las reglas para constructores de tipo $C$ en general de cualquier aridad, y en particular para los constructores de tipo de $\lambda ^ { b }$

$$
\sigma , \tau : : = X _ { n } \mid N a t \mid B o o l \mid \sigma  \tau
$$

# 1. Descomposici´on

$$
\begin{array} { r l } & { \{ \sigma _ { 1 } \to \sigma _ { 2 } \overset { ? } { = } \tau _ { 1 } \to \tau _ { 2 } \} \cup G \mapsto \{ \sigma _ { 1 } \overset { ? } { = } \tau _ { 1 } , \sigma _ { 2 } \overset { ? } { = } \tau _ { 2 } \} \cup G } \\ & { \{ B o o l \overset { ? } { = } B o o l \} \cup G \mapsto G } \\ & { \{ N a t \overset { ? } { = } N a t \} \cup G \mapsto G } \end{array}
$$

Caso general

$$
\{ C ( \sigma _ { 1 } , \dots , \sigma _ { n } ) \overset { ? } { = } C ( \tau _ { 1 } , \dots , \tau _ { n } ) \} \cup G \mapsto \{ \sigma _ { 1 } \overset { ? } { = } \tau _ { 1 } , \dots , \sigma _ { n } \overset { ? } { = } \tau _ { n } \} \cup G
$$

2. Eliminaci´on de par trivial

$$
\{ \mathrm { X } _ { k } \stackrel { ? } { = } \mathrm { X } _ { k } \} \cup G \mapsto G
$$

3. Swap: si $\sigma$ no es una variable $\{ \sigma \overset { ? } { = } \mathrm { X } _ { k } \} \cup G \mapsto \{ \mathrm { X } _ { k } \overset { ? } { = } \sigma \} \cup G$

4. Eliminaci´on de variable: si $\mathrm { X } _ { k } \notin F V ( \sigma )$ $\{ \mathrm { X } _ { k } \overset { ? } { = } \sigma \} \cup G \mapsto _ { \{ \mathrm { X } _ { k } : = \sigma \} } G \{ \mathrm { X } _ { k } : = \sigma \}$

# 5. Colisi´on

$\{ \sigma \stackrel { ? } { = } \tau \} \cup G \mapsto \mathbf { f a l l a } , \mathrm { c o n } ( \sigma , \tau ) \in T \cup T ^ { - 1 }$ donde   
$T = \{ ( B o o l , N a t ) , ( N a t , \sigma _ { 1 }  \sigma _ { 2 } ) , ( B o o l , \sigma _ { 1 }  \sigma _ { 2 } ) \}$ y $T ^ { - 1 }$ representa invertir cada par   
Caso general: si $C \neq C ^ { \prime }$ son constructores de tipo diferentes   
$\{ C ( \dots ) \overset { ? } { = } C ^ { \prime } ( \dots ) \} \cup G \mapsto \mathbf { f a l l a }$

6. Occurs check: si $\mathrm { X } _ { k } \neq \sigma$ y $\mathrm { X } _ { k } \in F V ( \sigma )$ $\{ \mathrm { X } _ { k } \overset { ? } { = } \sigma \} \cup G \mapsto \mathbf { f a l l a }$

# 2.2. Ejemplos

2.2.1. Secuencia exitosa

$$
\begin{array} { r l r l } & { \{ ( N a t  \mathrm { X } _ { 1 } )  ( \mathrm { X } _ { 1 }  \mathrm { X } _ { 3 } ) \stackrel {  } { = } \mathrm { X } _ { 2 }  ( \mathrm { X } _ { 4 }  \mathrm { X } _ { 4 } )  \mathrm { X } _ { 2 } \} } \\ & {  ^ { 1 } } & & { \{ N a t  \mathrm { X } _ { 1 } \stackrel {  } { = } \mathrm { X } _ { 2 } , \mathrm { X } _ { 1 }  \mathrm { X } _ { 3 } \stackrel {  } { = } ( \mathrm { X } _ { 4 }  \mathrm { X } _ { 4 } )  \mathrm { X } _ { 2 } \} } \\ & {  ^ { 3 } } & & { \{ \mathrm { X } _ { 2 } \stackrel {  } { = } N a t  \mathrm { X } _ { 1 } , \mathrm { X } _ { 1 }  \mathrm { X } _ { 3 } \stackrel {  } { = } ( \mathrm { X } _ { 4 }  \mathrm { X } _ { 4 } )  \mathrm { X } _ { 2 } \} } \\ & {  _ { \{ \mathrm { X } _ { 2 } : = N a t  \mathrm { X } _ { 1 } \} } ^ { 4 } } & & { \{ \mathrm { X } _ { 1 }  \mathrm { X } _ { 3 } \stackrel {  } { = } ( \mathrm { X } _ { 4 }  \mathrm { X } _ { 4 } )  ( N a t  \mathrm { X } _ { 1 } ) \} } \\ & {  ^ { 1 } } & & { \{ \mathrm { X } _ { 1 } \stackrel {  } { = } \mathrm { X } _ { 4 }  \mathrm { X } _ { 4 } , \mathrm { X } _ { 3 } \stackrel {  } { = } N a t  \mathrm { X } _ { 1 } \} } \\ & {  _ { \{ \mathrm { X } _ { 1 } : = \mathrm { X } _ { 4 }  \mathrm { X } _ { 4 } \} } ^ { 4 } } & & { \{ \mathrm { X } _ { 3 } \stackrel {  } { = } N a t  ( \mathrm { X } _ { 4 }  \mathrm { X } _ { 4 } ) \} } \\ &   _ { \{ \mathrm { X } _ { 3 } : = N a t  \mathrm { X } _ { 4 } \} } ^ { 4 } \} \end{array}
$$

El MGU es

$$
\begin{array} { r l } & { \quad \ \left\{ \mathrm { X } _ { 3 } : = N a t \to ( \mathrm { X } _ { 4 } \to \mathrm { X } _ { 4 } ) \right\} \circ \left\{ \mathrm { X } _ { 1 } : = \mathrm { X } _ { 4 } \to \mathrm { X } _ { 4 } \right\} \circ \left\{ \mathrm { X } _ { 2 } : = N a t \to \mathrm { X } _ { 1 } \right\} } \\ & { = \{ \mathrm { X } _ { 2 } : = N a t \to ( \mathrm { X } _ { 4 } \to \mathrm { X } _ { 4 } ) , \ \mathrm { X } _ { 1 } : = \mathrm { X } _ { 4 } \to \mathrm { X } _ { 4 } , \ \mathrm { X } _ { 3 } : = N a t \to ( \mathrm { X } _ { 4 } \to \mathrm { X } _ { 4 } ) \} } \end{array}
$$

# 2.2.2. Secuencia fallida

$$
{ \begin{array} { r l } & { \qquad \left\{ \mathrm { X } _ { 1 } \to \left( \mathrm { X } _ { 2 } \to \mathrm { X } _ { 1 } \right) { \overset { ? } { = } } \mathrm { X } _ { 2 } \to \left( \left( \mathrm { X } _ { 1 } \to N a t \right) \to \mathrm { X } _ { 1 } \right) \right\} } \\ & { \mapsto ^ { 1 } \qquad \left\{ \mathrm { X } _ { 1 } { \overset { ? } { = } } \mathrm { X } _ { 2 } , \mathrm { X } _ { 2 } \to \mathrm { X } _ { 1 } { \overset { ? } { = } } \left( \mathrm { X } _ { 1 } \to N a t \right) \to \mathrm { X } _ { 1 } \right\} } \\ & { \mapsto _ { \left\{ \mathrm { X } _ { 1 } : = \mathrm { X } _ { 2 } \right\} } ^ { 4 } \left\{ \mathrm { X } _ { 2 } \to \mathrm { X } _ { 2 } { \overset { ? } { = } } \left( \mathrm { X } _ { 2 } \to N a t \right) \to \mathrm { X } _ { 2 } \right\} } \\ & { \mapsto ^ { 1 } \qquad \left\{ \mathrm { X } _ { 2 } { \overset { ? } { = } } \mathrm { X } _ { 2 } \to N a t , \mathrm { X } _ { 2 } { \overset { ? } { = } } \mathrm { X } _ { 2 } \right\} } \\ & { \mapsto ^ { 6 } \qquad { \mathrm { f a l l a } } } \end{array} }
$$

# 2.2.3. Ejemplo con otros constructores

Se usan los constructores de tipos de listas,

$$
\sigma : : = \dots | [ \sigma ]
$$

$$
\begin{array} { r l } & { \quad \{ ( \mathbf { X } _ { 3 } \to \mathbf { X } _ { 4 } \to \mathbf { X } _ { 4 } ) \to \mathbf { X } _ { 4 } \to [ \mathbf { X } _ { 4 } \to [ \mathbf { X } _ { 4 } ] \to \mathbf { X } _ { 4 } \stackrel { \_ { \mathrm { C } } } { \to } [ ( \mathbf { X } _ { 1 } \to \mathbf { X } _ { 2 } ) \to [ \mathbf { X } _ { 1 } ] \to [ \mathbf { X } _ { 2 } ] ) - } \\ & { \quad \to ^ { 1 } } \\ & { \quad \quad \quad \{ \mathbf { X } _ { 3 } \to \mathbf { X } _ { 4 } \to \mathbf { X } _ { 4 } \stackrel { \_ { \mathrm { C } } } { \to } [ \mathbf { X } _ { 1 } \to \mathbf { X } _ { 2 } ] \to [ \mathbf { X } _ { 1 } ] \to [ \mathbf { X } _ { 1 } ] \to [ \mathbf { X } _ { 3 } ] \to \mathbf { X } _ { 4 } \stackrel { \_ { \mathrm { C } } } { \to } [ \mathbf { X } _ { 4 } ] } \\ & { \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad } \\ & { \to ^ { 3 } } \\ & { \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad } \\ & { \quad \quad \to ^ { 4 } [ \mathbf { X } _ { 3 } - \mathbf { X } _ { 4 } \to \mathbf { X } _ { 4 } ] \to \mathbf { X } _ { 4 } \to [ \mathbf { X } _ { 1 } + \mathbf { X } _ { 2 } ] \to [ \mathbf { X } _ { 1 } ] \to [ \mathbf { X } _ { 2 } ] ] } \\ & { \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad } \\ & { \quad \quad \to ^ { 1 } } \\ &  \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \times \mathbf { X } _ { 4 } \to \mathbf { X } _ { 4 } \to [ \mathbf { X } _ { 1 } ] \to [ \mathbf { X } _  2  \end{array}
$$

El MGU es

$$
\begin{array} { r l } & { \quad \ \{ \mathrm { X } _ { 1 } : = \mathrm { X } _ { 2 } \} \circ \{ \mathrm { X } _ { 4 } : = [ \mathrm { X } _ { 1 } ] \} \circ \{ \mathrm { X } _ { 3 } : = \mathrm { X } _ { 1 }  \mathrm { X } _ { 2 } \} \circ \{ \mathrm { X } _ { 5 } : = \mathrm { X } _ { 4 }  [ \mathrm { X } _ { 3 } ]  \mathrm { X } _ { 4 } \} } \\ & { = \{ \mathrm { X } _ { 5 } : = \mathrm { X } _ { [ \mathrm { X } _ { 2 } ] }  [ \mathrm { X } _ { 2 }  \mathrm { X } _ { 2 } ]  \mathrm { X } _ { [ \mathrm { X } _ { 2 } ] } , \ \mathrm { X } _ { 3 } : = \mathrm { X } _ { 2 }  \mathrm { X } _ { 2 } , \ \mathrm { X } _ { 4 } : = [ \mathrm { X } _ { 2 } ] , \ \mathrm { X } _ { 1 } : = \mathrm { X } _ { 2 } \} } \end{array}
$$