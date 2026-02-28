# Práctica No 6 - Lógica de primer orden

Aclaraciones:

Los ejercicios marcados con el símbolo $\star$ constituyen un subconjunto mínimo de ejercitación. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

# Sintaxis de la Lógica de Primer Orden

# Ejercicio 1

Dados $\mathcal { F } = \{ d , f , g \}$ , donde $d$ itene aridad $0$ , $f$ aridad 2 y $g$ aridad 3. $\dot { \iota }$ Cuáles de las siguientes cadenas son términos sobre $\mathcal { F }$ ?

i. $g ( d , d )$   
ii. $f ( X , g ( Y , Z ) , d )$   
iii. $g ( X , f ( d , Z ) , d )$   
iv. $g ( X , h ( Y , Z ) , d )$   
v. $f ( f ( g ( d , X ) , f ( g ( d , X ) , Y , g ( Y , d ) ) , g ( d , d ) ) , g ( f ( d , d , X ) , d ) , Z )$

# Ejercicio 2

Sean $c$ una constante, $f$ un símbolo de función de aridad 1 y $S$ y $B$ , dos símbolos de predicado binarios. $\dot { \iota }$ Cuáles de las siguientes cadenas son fórmulas?

i. $S ( c , X )$   
ii. $B ( c , f ( c ) )$   
iii. $f ( c )$   
iv. $B ( B ( c , X ) , Y )$   
v. $S ( B ( c ) , Z )$   
vi. $B ( X , Y ) \Rightarrow ( \exists Z . S ( Z , Y ) ) \rangle$ ) vii. $( S ( X , Y ) \Rightarrow S ( Y , f ( f ( X ) ) ) )$ ） viii. $B ( X , Y ) \Rightarrow f ( X )$   
ix. $S ( X , f ( Y ) ) \land B ( X , Y )$   
x. $\forall X . B ( X , f ( X ) )$   
xi. $\exists X . B ( Y , X ( c ) )$

# Ejercicio 3

Sea $\sigma = \exists X . P ( Y , Z ) \land \forall Y . \lnot Q ( Y , X ) \lor P ( Y , Z )$

i. Identicar todas las variables libres $_ \mathrm { y }$ ligadas.

ii. Calcular $\sigma \{ X : = W \}$ , $\sigma \{ Y : = W \}$ , $\sigma \{ Y : = f ( X ) \}$ y $\sigma \{ Z : = g ( Y , Z ) \}$ .

# Ejercicio 4

Dada $\sigma = \neg \forall X . ( \exists Y . P ( X , Y , Z ) ) \land \forall Z . P ( X , Y , Z )$

i. Identicar todas las variables libres y ligadas.

ii. Calcular $\sigma \{ X : = t \}$ , $\sigma \{ Y : = t \}$ y $\sigma \{ Z : = t \}$ con $t = g ( f ( g ( Y , Y ) ) , Y )$ .

iii. Calcular $\sigma \{ X : = t , Y : = t , Z : = t \}$ con $t = g ( f ( g ( Y , Y ) ) , Y )$ .

iv. Calcular $\sigma ( \{ X : = t \} \circ \{ Y : = t \} \circ \{ Z : = t \} ) \mathrm { c o n } t = g ( f ( g ( Y , Y ) ) , Y )$ .

# Unificación

# Ejercicio 5 ⋆

Unir con echas las expresiones que unican entre sí (entre una la y la otra). Para cada par unicable, exhibir el mgu (most general unier). Asumir que a es una constante, $X , Y ,$ , $Z$ son variables, $f$ y $g$ son símbolos de función, y $P$ y $Q$ predicados.

$$
\begin{array} { r l r l r l r l r l } { P ( f ( X ) ) } & { } & { P ( \mathfrak { a } ) } & { P ( Y ) } & { Q ( X , f ( Y ) ) } & { Q ( X , f ( Z ) ) } & { Q ( X , f ( \mathfrak { a } ) ) } & { X } & & { f ( X ) } \\ & { } & { P ( f ( X ) ) } & { P ( f ( \mathfrak { a } ) ) } & { Q ( f ( Y ) ) } & { Q ( f ( Y ) , f ( X ) ) } & { Q ( f ( Y ) , f ( X ) ) } & { f ( f ( Y ) , Y ) } & { f ( f ( \mathfrak { c } ) ) } & { f ( g ( Y ) ) } \end{array}
$$

# Ejercicio $\textbf { 6 } \star$

Determinar, para cada uno de los siguientes pares de términos de primer orden, si son unicables o no. En cada caso justicar su respuesta exhibiendo una secuencia exitosa o fallida (según el caso) del algoritmo de Martelli-Montanari. Asimismo, en caso de que los términos sean unicables indicar el mgu (most general unier). Notación: $X , Y , Z$ variables; $a , b , c$ constantes; $f , g$ símbolos de función.

i. $f ( X , X , Y ) { \textrm { y } } f ( a , b , Z )$   
ii. $Y { \textrm { y } } f ( X )$   
iii. $f ( g ( c , Y ) , X ) )$ y $f ( Z , g ( Z , a ) )$ iv. $f ( a ) \mathrm { ~ y ~ } g ( Y )$   
v. $f ( X )$ y $X$   
vi. $g ( X , Y )$ y $g ( f ( Y ) , f ( X ) )$

# Ejercicio 7

Preguntas para pensar.

i. La relación entre términos unica con, ¾es reexiva? ¾Es simétrica? $\dot { \iota }$ Es transitiva?   
ii. ¾Existe algún término $t$ tal que todo término $s$ unique con él?   
iii. $\operatorname { \dot { \Omega } } \operatorname { C o m o }$ aplicaría el algoritmo de unicación al problema de determinar si, dado un conjunto nito de términos, existe un unicador común a todos?

# Ejercicio 8 ⋆

Sean las constantes Nat y Bool y la función binaria (representada como un operador injo), determinar el resultado de aplicar el algoritmo MGU (most general unier) sobre las ecuaciones planteadas a continuación. En caso de tener éxito, mostrar la sustitución resultante.

i. MGU $\{ { \bf T } _ { 1 }  { \bf T } _ { 2 } \doteq { \mathsf { N a t } }  { \mathsf { B o o l } } \}$   
ii. MGU $\{ { \bf T } _ { 1 }  { \bf T } _ { 2 } \doteq { \bf T } _ { 3 } \}$   
iii. MGU $\{ { \bf { T } } _ { 1 }  { \bf { T } } _ { 2 } \doteq { \bf { T } } _ { 2 } \}$   
iv. MGU $\{ ( \mathbf { T } _ { 2 }  \mathbf { T } _ { 1 } )  \mathsf { B o o l } \doteq \mathbf { T } _ { 2 }  \mathbf { T } _ { 3 } \}$

v. MGU $\{ \mathbf { T } _ { 2 }  \mathbf { T } _ { 1 }  \mathsf { B o o l } \doteq \mathbf { T } _ { 2 }  \mathbf { T } _ { 3 } \}$ vi. MGU $\{ \mathbf { T } _ { 1 } \to \mathsf { B o o l } \doteq \mathsf { N a t } \to \mathsf { B o o l } , \mathbf { T } _ { 1 } \doteq \mathbf { T } _ { 2 } \to \mathbf { T } _ { 3 } \}$ vii. MGU $\{ \mathbf { T } _ { 1 } \to \mathsf { B o o l } \doteq \mathsf { N a t } \to \mathsf { B o o l } , \mathbf { T } _ { 2 } \doteq \mathbf { T } _ { 1 } \to \mathbf { T } _ { 1 } \}$ viii. MGU $\{ \mathbf { T } _ { 1 }  \mathbf { T } _ { 2 } \doteq \mathbf { T } _ { 3 }  \mathbf { T } _ { 4 } , \mathbf { T } _ { 3 } \doteq \mathbf { T } _ { 2 }  \mathbf { T } _ { 1 } \}$

# Deducción natural

# Ejercicio 9 ⋆

Demostrar en deducción natural que vale $\vdash \sigma$ para cada una de las siguientes fórmulas, sin usar principios de razonamiento clásicos, salvo que se indique lo contrario:

i. Intercambio $( \forall ) \colon \forall X . \forall Y . P ( X , Y ) \iff \forall Y . \forall X . P ( X , Y ) .$ . ii. Intercambio (∃): $\exists X . \exists Y . P ( X , Y ) \iff \exists Y . \exists X . P ( X , Y ) .$ .   
iii. Intercambio ( $\exists / \forall ) \colon \exists X . \forall Y . P ( X , Y ) \implies \forall Y . \exists X . P ( X , Y ) .$   
iv. Universal implica existencial: $\forall X . P ( X ) \implies \exists X . P ( X )$ . v. Diagonal $\begin{array} { r } { ( \forall ) \colon \forall X . \forall Y . P ( X , Y ) \implies \forall X . P ( X , X ) . } \end{array}$   
vi. Diagonal $( \exists ) \colon \exists X . P ( X , X ) \implies \exists X . \exists Y . P ( X , Y ) .$ .   
vii. de Morgan (I): $\lnot \exists X . P ( X ) \iff \forall X . \lnot P ( X )$ .   
viii. de Morgan (II): $\lnot \forall X . P ( X ) \iff \exists X . \lnot P ( X )$ . Para la dirección $\Rightarrow \mathrm { e s }$ necesario usar principios de razonamiento clásicos.   
ix. Universal/conjunción: $\forall X . ( P ( X ) \land Q ( X ) ) \iff ( \forall X . P ( X ) \land \forall X . Q ( X ) ) .$ . x. Universal/disyunción: $\forall X . ( P ( X ) \lor \sigma ) \iff ( \forall X . P ( X ) ) \lor \sigma$ , asumiendo que $X \notin \mathsf { f v } ( \sigma )$ . Para la dirección $\Rightarrow \mathrm { e s }$ necesario usar principios de razonamiento clásicos.   
xi. Existencial/disyunción: $\exists X . ( P ( X ) \lor Q ( X ) ) \iff ( \exists X . P ( X ) \lor \exists X . Q ( X ) ) .$   
xii. Existencial/conjunción: $\exists X . ( P ( X ) \land \sigma ) \iff ( \exists X . P ( X ) \land \sigma )$ , asumiendo que $X \notin \mathsf { f v } ( \sigma )$   
xiii. Principio del bebedor: $\exists X . ( P ( X ) \implies \forall X . P ( X ) )$ . En este ítem es necesario usar principios de razonamiento clásicos.

# Ejercicio $\mathbf { 1 0 ~ \star }$

Demostrar en deducción natural: $( \forall X . \forall Y . R ( X , f ( Y ) ) ) \Rightarrow ( \forall X . R ( X , f ( f ( X ) ) ) ) .$

# Ejercicio 11

Una fórmula $\sigma$ está en forma normal negada (f.n.n.) si se puede producir con la siguiente gramática:

$$
\sigma : = P ( t _ { 1 } , \dots , t _ { n } ) \mid \neg P ( t _ { 1 } , \dots , t _ { n } ) \mid \sigma \land \sigma \mid \sigma \lor \sigma \mid \forall X . \sigma \mid \exists X . \sigma
$$

Es decir, una fórmula está en f.n.n. si no tiene ocurrencias del conectivo de la implicación $( \Rightarrow )$ y todas las ocurrencias del conectivo de la negación $\left( \lnot \right)$ acompañan a fórmulas atómicas (es decir, la negación sólo puede encontrarse en las hojas de la fórmula). Demostrar que toda fórmula $\sigma$ es equivalente a una fórmula en forma normal negada. Es decir, para cada fórmula $\sigma$ existe una fórmula $\sigma ^ { \prime }$ en f.n.n. tal que $\vdash \sigma \iff \sigma ^ { \prime }$ .

# Ejercicio 12

Una fórmula $\sigma$ está en forma normal prenexa (f.n.p.) si es de la forma $\mathcal { Q } _ { 1 } X _ { 1 } . . . \mathcal { Q } _ { n } X _ { n } . \tau$ donde cada $\mathcal { Q } _ { i }$ es un cuanticador ( $\forall$ o ∃) y $\tau$ es una fórmula en forma normal negada sin ocurrencias de cuanticadores. Demostrar que toda fórmula $\sigma$ es equivalente a una fórmula en forma normal prenexa. Es decir, para cada fórmula $\sigma$ existe una fórmula $\sigma ^ { \prime }$ en f.n.p. tal que $\vdash \sigma \iff \sigma ^ { \prime }$ .

# Semántica

# Ejercicio 13 ⋆

Sea $\mathcal { L }$ el lenguaje de primer orden que incluye (junto con las variables, conectivos $\mathrm { y }$ cuanticadores) la constante $a _ { 1 }$ , el símbolo de función $f$ de aridad $2 \textrm { y }$ el símbolo de predicado $P$ de aridad 2. Sea $\sigma$ la fórmula

$$
\forall X _ { 1 } . \forall X _ { 2 } . ( P ( f ( X _ { 1 } , X _ { 2 } ) , a _ { 1 } ) \Rightarrow P ( X _ { 1 } , X _ { 2 } ) )
$$

Denamos una interpretación $I$ para $\mathcal { L }$ como sigue. $D _ { I }$ es $\mathbb { Z }$ , $\overline { { a } } _ { 1 }$ es $0$ , ${ \overline { { f } } } ( X , Y )$ es $X - Y$ , ${ \overline { { P } } } ( X , Y )$ es $X < Y$ . Escribir la interpretación de $\sigma$ en castellano. $\mathrm { i } \mathrm { E l }$ enunciado es verdadero o falso? Hallar una interpretación de $\sigma$ en la cual el enunciado tenga el valor de verdad opuesto.

# Ejercicio $^ { 1 4 \star }$

Sea $N$ la interpretación aritmética donde $D _ { I } = \mathbb { N }$ y

$$
\begin{array} { r l } { \overline { { c } } ^ { 0 } } & { { } \mathrm { ~ e s ~ e l ~ } 0 , } \\ { \overline { { P } } ^ { 2 } } & { { } \mathrm { ~ e s ~ } = , } \\ { \overline { { f } } _ { 1 } ^ { 1 } } & { { } \mathrm { ~ e s ~ l a ~ f u n c i o n ~ s u c e s o r , } } \\ { \overline { { f } } _ { 2 } ^ { 2 } } & { { } \mathrm { ~ e s ~ } + , } \\ { \overline { { f } } _ { 3 } ^ { 2 } } & { { } \mathrm { ~ e s ~ } \times } \end{array}
$$

Hallar, si es posible, asignaciones que satisfagan y que no satisfagan las siguientes fórmulas.

i. $P ( f _ { 2 } ( X _ { 1 } , X _ { 1 } ) , f _ { 3 } ( f _ { 1 } ( X _ { 1 } ) , f _ { 1 } ( X _ { 1 } ) ) )$   
ii. $P ( f _ { 2 } ( X _ { 1 } , c ) , X _ { 2 } ) \Rightarrow P ( f _ { 2 } ( X _ { 1 } , X _ { 2 } ) , X _ { 3 } )$   
iii. $\neg P ( f _ { 3 } ( X _ { 1 } , X _ { 2 } ) , f _ { 3 } ( X _ { 2 } , X _ { 3 } ) )$   
iv. $\forall X _ { 1 } . { P } ( f _ { 3 } ( X _ { 1 } , X _ { 2 } ) , X _ { 3 } )$   
v. $\forall X _ { 1 } . ( P ( f _ { 3 } ( X _ { 1 } , c ) , X _ { 1 } ) \Rightarrow P ( X _ { 1 } , X _ { 2 } ) )$

# Ejercicio 15

Demostrar que ninguna de las siguientes fórmulas es lógicamente válida.

i. $\forall X _ { 1 } . \exists X _ { 2 } . P ( X _ { 1 } , X _ { 2 } ) \Rightarrow \exists X _ { 2 } . \forall X _ { 1 } . P ( X _ { 1 } , X _ { 2 } )$   
ii. $\forall X _ { 1 } . \forall X _ { 2 } . ( P ( X _ { 1 } , X _ { 2 } ) \Rightarrow P ( X _ { 2 } , X _ { 1 } ) )$   
iii. $\forall X _ { 1 } . \neg Q ( X _ { 1 } ) \Rightarrow Q ( c )$   
iv. $( \forall X _ { 1 } . P ( X _ { 1 } , X _ { 1 } ) ) \Rightarrow \exists X _ { 2 } . \forall X _ { 1 } . P ( X _ { 1 } , X _ { 2 } )$

# Ejercicios extra de deducción natural (opcional)

# Ejercicio 16

Dar derivaciones en DN de las siguientes fórmulas.

i. $( \forall X . P ( X ) ) \Rightarrow P ( a )$ ii. $P ( a ) \Rightarrow \exists X . P ( X )$ iii. $( \forall X . \forall Y . ( R ( X , Y ) \Rightarrow \neg R ( Y , X ) ) ) \Rightarrow \forall X . \neg R ( X , X )$ iv. $( \forall X . \forall Y . R ( X , Y ) ) \Rightarrow \forall X . R ( X , X )$ v. $( \exists X . P ( X ) ) \Rightarrow ( \forall Y . Q ( Y ) ) \Rightarrow \forall X . \forall Y . ( P ( X ) \Rightarrow Q ( Y ) )$ vi. $( \forall X . ( P ( X ) \Rightarrow Q ( X ) ) ) \land ( \exists X . P ( X ) ) \Rightarrow \exists X . Q ( X )$ vii. $( \neg \forall X . ( P ( X ) \lor Q ( X ) ) ) \Rightarrow \neg \forall X . P ( X )$ viii. ( $\exists X . ( P ( X ) \Rightarrow Q ( X ) ) ) \Rightarrow ( \forall X . P ( X ) ) \Rightarrow \exists X . Q ( X )$ ix. (∀ $\operatorname { Y . } ( P ( X ) \Rightarrow Q ( X ) ) ) \land ( \neg \exists X . Q ( X ) ) \Rightarrow \forall X . \neg P ( X )$ x. $\forall X . ( \exists Y . R ( Y , X ) \Rightarrow P ( X ) ) ) \Rightarrow ( \exists X . \exists Y . R ( X , Y ) ) \Rightarrow \exists X . P ( X )$ xi. $\exists X . ( P ( X ) \lor Q ( X ) ) ) \Rightarrow ( \forall X . \lnot Q ( X ) ) \Rightarrow \exists X . P ( X )$ xii. $( \neg \forall X . \exists Y . R ( X , Y ) ) \Rightarrow \neg \forall X . R ( X , X )$ xiii. $( \neg \exists X . \forall Y . R ( Y , X ) \Rightarrow \exists X . \exists Y . \neg R ( X , Y ) )$ xiv. $\neg ( \forall X . P ( X ) \land \exists X . \neg P ( X ) )$ xv. $( \exists X . ( R ( X , X ) \land P ( X ) ) ) \Rightarrow \lnot \forall X . ( P ( X ) \Rightarrow \lnot \exists Y . R ( X , Y ) )$ xvi. $( \exists X . P ( X ) \Rightarrow \forall X . Q ( X ) ) \Rightarrow \forall Y . ( P ( Y ) \Rightarrow Q ( Y ) )$ xvii. $\lnot ( \forall X . ( P ( X ) \land Q ( X ) ) ) \land \forall X . P ( X ) \Rightarrow \lnot \forall X . Q ( X )$ xviii. ( $\forall X . ( R ( X , X ) \Rightarrow Q ( X ) ) ) \land \exists X . \forall Y . R ( X , Y ) \Rightarrow \exists X . Q ( X )$ )