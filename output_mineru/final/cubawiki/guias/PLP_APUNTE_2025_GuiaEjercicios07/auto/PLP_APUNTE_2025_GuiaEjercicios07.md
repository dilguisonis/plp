# Práctica No 7 - Resolución en Lógica

Resolución en Lógica Proposicional

# Ejercicio 1 ⋆

Convertir a Forma Normal Conjuntiva y luego a Forma Clausal (notación de conjuntos) las siguientes fórmulas proposicionales:

i. $P \Rightarrow P$   
ii. $( P \land Q ) \Rightarrow P$   
iii. $( P \lor Q ) \Rightarrow P$   
iv. $\lnot ( P \Leftrightarrow \lnot P )$

$\prime . \neg ( P \land Q ) \Rightarrow ( \neg P \lor \neg Q )$ vi. $( P \land Q ) \lor ( P \land R )$ vii. $( P \land Q ) \Rightarrow R$ viii. $P \Rightarrow ( Q \Rightarrow R )$

# Ejercicio 2 ⋆

i. ¾Cuáles de las fórmulas del ejercicio anterior son tautologías? Demostrarlas utilizando el método de resolución para la lógica proposicional. Para las demás, indicar qué pasa si se intenta demostrarlas usando este método.

ii. $\mathrm { \Omega _ { i } S e }$ deduce $( P \land Q )$ de $( \neg P \Rightarrow Q ) \land ( P \Rightarrow Q ) \land ( \neg P \Rightarrow \neg Q ) ^ { \cdot }$ ? Contestar utilizando el método de resolución para la lógica proposicional.

# Ejercicio 3

Demostrar las siguientes tautologías utilizando el método de resolución para la lógica proposicional. Notar que no siempre es necesario usar todas las cláusulas.

$$
\begin{array} { l l } { { } } & { { ( P \Rightarrow ( P \Rightarrow Q ) ) \Rightarrow ( P \Rightarrow Q ) } } \\ { { } } & { { ( R \Rightarrow \neg Q ) \Rightarrow ( ( R \land Q ) \Rightarrow P ) } } \\ { { } } & { { ( ( P \Rightarrow Q ) \Rightarrow ( R \Rightarrow \neg Q ) ) \Rightarrow \neg ( R \land Q ) } } \end{array}
$$

# Ejercicio 4 ⋆

Un grupo de amigos quería juntarse a comer en una casa, pero no decidían en cuál. Prevalecían dos propuestas: la casa de Fabiana, que era cómoda y espaciosa, y la de Manuel, más chica pero con un amplio jardín y parrilla al aire libre. Finalmente acordaron basar su elección en el pronóstico del tiempo. Si anunciaban lluvia, se reunirían en la casa de Fabiana; y si no, en la de Manuel (desde ya, la reunión tendría lugar en una sola casa).

Finalmente llego el día de la reunión, y el grupo se juntó a comer en la casa de Fabiana, pero no llovió.

Utilizar las siguientes proposiciones para demostrar - mediante el método de resolución - que el pronóstico se equivocó (anunció lluvia y no llovió, o viceversa).

$P = { } ^ { 6 } \mathrm { E l }$ pronóstico anunció lluvia.

$F = { } ^ { 6 } \mathrm { E l }$ grupo se reúne en la casa de Fabiana.

$M = { } ^ { 6 } \mathrm { E l }$ grupo se reúne en la casa de Manuel.

$L =$ Llueve en el día de la reunión.

Ayuda: por la descripción de arriba sabemos que $P \Rightarrow F$ , $\neg P \Rightarrow M$ y $\neg ( F \land M )$ , además de que $F$ y $\neg L$ son verdaderas. Pensar en lo que se quiere demostrar para decidir qué pares de cláusulas utilizar.

# Resolución en Lógica de Primer Orden

En esta sección, salvo que se haga referencia a SLD, la palabra resolución denota el método de resolución general. Siempre que se demuestre una propiedad, se deberá indicar la sustitución utilizada en cada paso de resolución.

# Ejercicio 5

Convertir a Forma Normal Negada (NNF) las siguientes fórmulas de primer orden:

i. ∀ $\operatorname { \mathcal { X } } . \forall Y . ( \neg Q ( X , Y ) \Rightarrow \neg P ( X , Y ) )$ ii. $\forall X . \forall Y . ( ( P ( X , Y ) \land Q ( X , Y ) ) \Rightarrow R ( X , Y ) )$ iii. $\forall X . \exists Y . ( P ( X , Y ) \Rightarrow Q ( X , Y ) )$ )

# Ejercicio 6 ⋆

Convertir a Forma Normal de Skolem y luego a Forma Clausal las siguientes fórmulas de primer orden:

i. $\exists X . \exists Y . X < Y$ , siendo $<$ un predicado binario usado de forma inja.

ii. $\forall X . \exists Y . X < Y$

iii. $\forall X . \neg ( P ( X ) \land \forall Y . ( \neg P ( Y ) \lor Q ( Y ) ) )$

iv. $\exists X . \forall Y . ( P ( X , Y ) \land Q ( X ) \land \neg R ( Y ) )$

v. $\forall X . ( P ( X ) \land \exists Y . ( Q ( Y ) \lor \forall Z . \exists W . ( P ( Z ) \land \lnot Q ( W ) ) ) )$

# Ejercicio 7

Para pensar (o jugar):

i. Exhibir una cláusula que arroje un resolvente consigo misma.   
ii. Exhibir dos cláusulas, cada una con no más de dos literales, que arrojen tres o más resolventes distintos entre sí.   
iii. Exhibir dos cláusulas que arrojen como resolvente $\sqcup$ si se unican tres o más términos a la vez, pero no si se unica solamente un término de cada lado.

# Ejercicio 8 ⋆

La computadora de la policía registró que el Sr. Smullyan no pagó una multa. Cuando el Sr. Smullyan pagó la multa, la computadora grabó este hecho pero, como el programa tenía errores, no borró el hecho que expresaba que no había pagado la multa. A partir de la información almacenada en la computadora, mostrar utilizando resolución que el jefe de gobierno es un espía.

Utilizar los siguientes predicados y constantes: $P a g \theta ( X )$ para expresar que $X$ pagó su multa, $E s p i a ( X )$ para $X$ es un espía, smullyan para el Sr. Smullyan y jefeGob para el jefe de gobierno.

# Ejercicio $\textbf { 9 \star }$

¾Cuáles de las siguientes fórmulas son lógicamente válidas? Demostrar las que lo sean usando resolución.

i. $[ \exists X . \forall Y . R ( X , Y ) ] \Rightarrow \forall Y . \exists X . R ( X , Y )$   
ii. $[ \forall X . \exists Y . R ( X , Y ) ] \Rightarrow \exists Y . \forall X . R ( X , Y )$   
iii. $\exists X . [ P ( X ) \Rightarrow \forall X . P ( X ) ]$   
iv. $\exists X . [ P ( X ) \lor Q ( X ) ] \Rightarrow [ \exists X . P ( X ) \lor \exists X . Q ( X ) ]$ v. $\forall X . [ P ( X ) \lor Q ( X ) ] \Rightarrow [ \forall X . P ( X ) \lor \forall X . Q ( X ) ]$   
vi. $\boxed { \exists X . P ( X ) \land \forall X . Q ( X ) } \Rightarrow \exists X . [ P ( X ) \land Q ( X ) ]$   
vii. $\forall X . \exists Y . \forall Z . \exists W . [ P ( X , Y ) \lor \neg P ( W , Z ) ]$   
viii. $\forall X . \forall Y . \forall Z . ( [ \neg P ( f ( \mathfrak { a } ) ) \lor \neg P ( Y ) \lor Q ( Y ) ] \land P ( f ( Z ) ) \land [ \neg P ( f ( f ( X ) ) ) \lor \neg Q ( f ( X ) ) ] )$

Ejercicio 10 (Aplicaciones del método de resolución)

i. Expresar en forma clausal la regla del modus ponens y mostrar que es válida, usando resolución.

ii. Lo mismo para la regla del modus tollens.

iii. Lo mismo para la regla de especialización: de $\forall X P ( X )$ concluir $P ( t )$ cualquiera sea el término $t$ .

# Ejercicio 11 ⋆

Dadas las siguientes cláusulas:

$\{ P ( X ) , \neg P ( X ) , Q ( \mathsf { a } ) \}$ $\begin{array} { r l } { \mathbf { \lambda } } & { \left\{ \lnot P ( X , X , Z ) , \lnot Q ( X , Y ) , \lnot Q ( Y , Z ) \right\} } \\ { \mathbf { \lambda } } & { \left\{ M ( 1 , 2 , X ) \right\} } \end{array}$ ■ $\{ P ( X ) , \neg Q ( Y ) , \neg R ( X , Y ) \}$

i. $\Dot { \iota }$ Cuáles son cláusulas de Horn?

ii. Para cada cláusula de Horn indicar si es una cláusula de denición (hecho o regla) o una cláusula objetivo.

iii. Dar, para cada cláusula, la fórmula de primer orden que le corresponde.

# Ejercicio $\mathbf { 1 2 \star }$

Indicar cuáles de las siguientes condiciones son necesarias para que una demostración por resolución sea SLD.

Realizarse de manera lineal (utilizando en cada paso el resolvente obtenido en el paso anterior).   
Utilizar únicamente cláusulas de Horn.   
Utilizar cada cláusula a lo sumo una vez.   
Empezar por una cláusula objetivo (sin literales positivos).   
Empezar por una cláusula que provenga de la negación de lo que se quiere demostrar.   
Recorrer el espacio de búsqueda de arriba hacia abajo y de izquierda a derecha.   
Utilizar la regla de resolución binaria en lugar de la general.

# Ejercicio 13 ⋆

Alan es un robot japonés. Cualquier robot que puede resolver un problema lógico es inteligente. Todos los robots japoneses pueden resolver todos los problemas de esta práctica. Todos los problemas de esta práctica son lógicos. Existe al menos un problema en esta práctica. $\mathrm { \ ; Q u i e n }$ es inteligente? Encontrarlo utilizando resolución SLD y composición de sustituciones.

Utilizar los siguientes predicados y constantes: $R ( X )$ para expresar que $X$ es un robot, $R e s ( X , Y )$ para $X$ puede resolver $Y$ , $P L ( X )$ para $X$ es un problema lógico, $P r ( X )$ para $X$ es un problema de esta práctica, $I ( X )$ para $X$ es inteligente, $J ( X )$ para $X$ es japonés y la constante alan para Alan.

# Ejercicio $^ { 1 4 \star }$

Sean las siguientes cláusulas (en forma clausal), donde suma y par son predicados, suc es una función y cero una constante:

$$
\begin{array}{c} { \begin{array} { r l r } { - s u m a ( X , Y , Z ) , s u m a ( X , s u c ( Y ) , s u c ( Z ) ) } \end{array} } \quad { \mathrm { 2 . ~ } } \left\{ s u m a ( X , c e r o , X ) \right\}  & { { \textrm { 3 . } } \left\{ \neg s u m a ( X , X , Y ) , p a r ( Y ) \right\} } \end{array}
$$

Demostrar utilizando resolución que suponiendo (1), (2), (3) se puede probar $p a r ( s u c ( s u c ( c e r o ) ) )$ . Si es posible, aplicar resolución SLD. En caso contrario, utilizar resolución general. Mostrar en cada aplicación de la regla de resolución la sustitución utilizada.

# Ejercicio 15

i. Pasar las siguientes fórmulas en lógica de primer orden a forma clausal.

$$
{ \begin{array} { r l r l r l } { { \mathcal { I } } C . ( V ( C ) \lor \exists E . P ( E , C ) ) } & { } & { b ) } & {  \exists C . ( V ( C ) \land \exists E . P ( E , C ) ) } & & { c ) \forall E . \forall C . ( P ( E , i ( C ) ) \Leftrightarrow P ( E , C ) ) } \end{array} }
$$

ii. A partir de las cláusulas denidas en el punto anterior, ¾puede demostrarse $\forall C . ( V ( i ( C ) ) \Rightarrow V ( C ) )$ usando resolución SLD? Si se puede, hacerlo. Si no, demostrarlo usando el método de resolución general.

# Ejercicio 16 ⋆

Un lógico estaba sentado en un bar cuando se le ocurrió usar el método de resolución para demostrar el teorema del bebedor: siempre que haya alguien en el bar, habrá allí alguien tal que, si está bebiendo, todos en el bar están bebiendo. Sin embargo, el lógico en cuestión había bebido demasiado y la prueba no le salió muy bien. Esto fue lo que escribió en una servilleta del bar:

Teorema del bebedor: $( \exists X . \mathtt { e n B a r } ( X ) ) \Rightarrow \exists Y . ( \mathtt { e n B a r } ( Y ) \land ( \mathtt { b e b e } ( Y ) \Rightarrow \forall Z . ( \mathtt { e n B a r } ( Z ) \Rightarrow \mathtt { b e b e } ( Z ) ) ) )$ Elimino implicaciones: $\left( \neg \exists X . \mathsf { e n B a r } ( X ) \right) \lor \exists Y . ( \mathsf { e n B a r } ( Y ) \land ( \neg \mathsf { b e b e } ( Y ) \lor \lor Z . ( \neg \mathsf { e n B a r } ( Z ) \lor \mathsf { b e b e } ( Z ) ) )$ )) Skolemizo: $( \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \to \neg \neg \neg \neg \neg \neg \neg \neg \neg \neg \to \neg \neg \neg \neg \neg \to \neg \neg \neg \neg \to \neg \neg \neg \neg \to \to \neg \neg \neg \to \neg \to \neg \to \neg \to \to \to \neg \to \neg \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to \to $ Paso a Forma Clausal: 1. {¬enBar(c)} 2. {enBar(k)} 3. {¬bebe(k)} 4. {¬enBar(Z), bebe(Z)}

Aplico resolución:

De 3 y 4 con $\sigma = \{ k  Z \}$ :

5. $\{ \neg { \in } \mathrm { n B a r } ( Z ) \}$

De 5 y 1 con $\sigma = \{ Z  c \}$

a) Identicar los 5 errores cometidos en la demostración. (La fórmula original es correcta, notar que salteó pasos importantes e hizo mal otros).   
b) Demostrar el teorema de manera correcta, usando resolución.   
c) Indicar si la resolución utilizada en el punto b es o no SLD. Justicar.

# Ejercicio 17

Dadas las siguientes armaciones:

Toda persona tiene un contacto en Facebook: ∀X.∃Y.esContacto $( X , Y )$ 1. {esContacto $\left. ( X , \mathsf { f } ( X ) ) \right\}$

La relación entre contactos es simétrica: $\forall X . \forall Y .$ (esContacto(X, Y ) ⇒ esContacto $( Y , X )$ ) 2. $\{$ ¬esContacto $( X , Y )$ , esContacto $( Y , X ) \}$

i. La siguiente es una demostración de que toda persona es contacto de sí misma, es decir, de que $\forall X$ esContacto $( X , X )$ .

Negando la conclusión: $\neg \forall X$ .esContacto $( X , X )$ Forma normal negada: ∃X.¬esContacto $( X , X )$

Skolemizando y en forma clausal: 3. $\{ \neg { \sf e s C o n t a c t o ( c , c ) } \}$   
De 1 y 3, con $\sigma = \{ X : = { \mathsf { c } } , { \mathsf { f } } ( X ) : = { \mathsf { c } } \}$ : ✷

¾Es correcta? Si no lo es, indicar el o los errores.

ii. $\dot { \iota }$ Puede deducirse de las dos premisas que toda persona es contacto de alguien (es decir, de que ∀Y.∃X.esContacto $( X , Y ) )$ ? En caso armativo dar una demostración, y en caso contrario explicar por qué.

# Ejercicio ${ \bf 1 8 \star }$

Dadas las siguientes deniciones de Descendiente y Abuelo a partir de la relación Progenitor:

{¬Progenitor $( X , Y )$ , Descendiente $( Y , X ) \}$ {¬Descendiente $( X , Y )$ , ¬Descendiente $( Y , Z )$ , Descendiente $( X , Z ) \}$ $\{ \neg { \sf A b u e l o } ( X , Y ) ,$ Progenitor( $X , \mathsf { m e d i o } ( X , Y ) ) \}$ $\{ \neg { \sf A b u e l o } ( X , Y )$ , Progenitor $( \mathsf { m e d i o } ( X , Y ) , Y ) \}$

Demostrar usando resolución general que los nietos son descendientes; es decir, que

$$
\forall X . \forall Y . ( \mathsf { A b u e l o } ( X , Y ) \Rightarrow \mathsf { D e s c e n d i e n t e } ( Y , X ) )
$$

Ayuda: tratar de aplicar el método a ciegas puede traer problemas. Conviene tener en mente lo que se quiere demostrar.

# Ejercicio $\mathbf { 1 9 ~ \star }$

En este ejercicio usaremos el método de resolución para demostrar una propiedad de las relaciones binarias; a saber, que una relación no vacía no puede ser a la vez irreexiva, simétrica $_ \mathrm { y }$ transitiva.

Para esto se demostrará la propiedad deseada para una relación arbitraria $R$ .

Dadas las siguientes deniciones:

1. $R$ es irreexiva: $\forall X . \neg R ( X , X )$ 3. $R$ es transitiva: $\forall X . \forall Y . \forall Z . ( ( R ( X , Y ) \land R ( Y , Z ) ) \Rightarrow R ( X , Z ) )$   
2. $R$ es simétrica: $\forall X . \forall Y . ( R ( X , Y ) \Rightarrow R ( Y , X ) )$ 4. $R$ es vacía: $\forall X . \lnot \exists Y . R ( X , Y )$

Utilizando resolución, demostrar que si $R$ cumple las propiedades 1 a 3, entonces es vacía. Indicar si el método de resolución utilizado es o no SLD (Y justicar).

# Ejercicio $\mathbf { 2 0 \star }$

Considerar las siguientes deniciones en Prolog:

natural(cero). mayorOIgual(suc(X),Y) :- mayorOIgual(X, Y).   
natural(suc(X)) :- natural(X). mayorOIgual(X,X) :- natural(X).   
■ $\dot { \downarrow } \mathrm { Q u } \dot { \mathrm { e } }$ sucede al realizar la consulta ?- mayorOIgual(suc(suc(N)), suc(cero))?   
Utilizar el método de resolución para probar la validez de la consulta del ítem 1. Para ello, convertir las cláusulas a forma clausal.   
Indicar si el método de resolución utilizado es o no SLD, y justicar. En caso de ser SLD, ¾respeta el orden en que Prolog hubiera resuelto la consulta?

# Ejercicio 21

Dado el siguiente programa en Prolog, pasarlo a forma clausal y demostrar utilizando resolución que hay alguien que es inteligente pero analfabeto.

analfabeto(X) :- vivo(X), noSabeLeer(X). noSabeLeer(X) :- mesa(X).   
vivo(X) :- delfín(X). noSabeLeer(X) :- delfín(X).   
inteligente(flipper). delfín(flipper).   
inteligente(alan).

# Ejercicio 22

Considerar las siguientes deniciones en prolog:

preorder(nil,[]).

append([],YS,YS).

preorder(bin(I,R,D),[R|L]) :- append(LI,LD,L), append([X|XS],YS,[X|L]) :- append(XS,YS,L).

preorder(I,LI), preorder(D,LD).

¾Qué sucede al realizar la consulta ?- preorder(bin(bin(nil,2,nil),1,nil),Lista).?   
Utilizar el método de resolución para encontrar la solución al problema.   
Indicar si el método de resolución utilizado es o no SLD, y justicar. En caso de ser SLD, $>$ respeta el orden en que Prolog hubiera resuelto la consulta?

# Ejercicio 23

Dada la siguiente base de conocimientos en Prolog:

parPositivo(X,Y) :- mayor(X, 0), mayor(Y, 0).

natural(0).   
natural(succ(N)) :- natural(N). mayor(succ(X),0) :- natural(X).   
mayor(succ(X),succ(Y)) :- mayor(X,Y).

a) Explicar con palabras qué sucede al realizar la siguiente consulta: parPositivo(A,B), mayor(A,B).

b) Expresar la base de conocimientos y la consulta anterior como fórmulas lógicas, y luego encontrar una solución a la consulta utilizando resolución SLD.

# Ejercicio 24

Sea la siguiente base de conocimientos en Prolog, que describe una parte de las reglas de reducción de un cierto lenguaje:

reduce(const $* \texttt { X * } _ { - } , \texttt { X } )$ .   
reduce $\mathrm { ~ \ i d ~ } * \mathrm { ~ \tt ~ X ~ }$ , X).   
reduce(flip $^ *$ F \* X \* Y, $\texttt { F * Y * X }$ ).   
reduce $\mathrm { ~ \mathcal ~ ~ } | \mathbb { M } \ast \mathbb { N }$ , $\mathbb { M } 1 \ * \ \mathbb { N } ,$ ) :- reduce(M, M1).

Donde el operador $^ *$ representa la aplicación. Este operador asocia a izquierda. Si les resulta más cómodo, pueden reescribir las expresiones de la forma $\mathrm { ~ A ~ } ^ { * } \mathrm { ~ B ~ }$ como ap(A, B).

Se realiza la siguiente consulta:

? reduce(flip $^ *$ const $* \texttt { X * Y }$ , A), reduce(A, Z), reduce(const \* id \* X \* Y, B), reduce(B,Z).

a) Reescribir la base de conocimientos y la consulta como fórmulas lógicas.

b) Resolver la consulta utilizando el método de resolución para obtener los valores de A y B.

c) La resolución utilizada en el punto anterior, ¾fue SLD? Justicar. En caso armativo, ¾fue la misma resolución que habría utilizado Prolog?

# Ejercicio 25

El siguiente es un programa escrito en Prolog que dene los números naturales, su relación de orden estricto, y un intento fallido de generar todos los pares de naturales.

natural(0). mayor(suc(X),X).   
natural(suc(X)) :- natural(X). mayor(suc(X),Y) :- mayor(X,Y).

parDeNat(X,Y) :- natural(X), natural(Y).

Puede observarse que el programa no funciona correctamente, ya que, por ejemplo, la siguiente consulta se cuelga en lugar de arrojar una solución:

?- parDeNat(X,Y), mayor(X,Y).

Sin embargo, las deniciones son lógicamente correctas. Veámoslo usando resolución.

a) Convertir la base de conocimientos a forma clausal.   
b) Utilizar el método de resolución para hallar una solución a la consulta.   
c) La resolución realizada en el punto anterior ¾fue SLD? Justicar. En caso armativo, ¾en qué diere de lo que habría hecho Prolog? En caso contrario, ¾sería posible encontrar una solución mediante resolución SLD? (No es necesario escribirla, solo justicar por qu'e es o no es posible.)

# Ejercicio 26

a) Representar en forma clausal las siguientes fórmulas de lógica de primer orden referidas a números enteros.

i. $\forall X . ( p a r ( X ) \Rightarrow \exists Y . ( Y > X \land \lnot p a r ( Y ) ) )$ ) - Para todo $X$ par existe un impar mayor que él.   
ii. $\forall X . ( \neg p a r ( X ) \Rightarrow \exists Y . ( Y > X \land p a r ( Y ) ) )$ - Para todo $X$ impar existe un par mayor que él.   
iii. $\forall X . \forall Y . \forall Z . ( ( X > Y \land Y > Z ) \Rightarrow X > Z$ ) - La relación de mayor es transitiva.

b) Usando resolución demostrar que para todo par existe otro par mayor, es decir, $\forall X . ( p a r ( X ) \Rightarrow \exists Y . ( Y > X \land p a r ( Y ) ) )$ ).

c) Indicar si la demostración es SLD y justicar.