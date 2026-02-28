# Clase pr´actica

# Resoluci´on en l´ogica de primer orden

Paradigmas de Lenguajes de Programaci´on

Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

11/11/2025

# Agenda

# Resoluci´on General

Repaso   
M´etodo de resoluci´on   
En l´ogica proposicional   
En l´ogica de primer orden   
Ejercicios

Resoluci´on lineal y SLD

Resoluci´on lineal Motivaci´on Cl´ausulas de Horn Resoluci´on SLD Arbol de resoluci´on ´ De Prolog a resoluci´on Ejemplo completo

![](images/e3e982c8c5d240f7199224b5249fd39b12d88c85373451b76c503e2fbe5f1f18.jpg)

¿Qu´e es?

• Procedimiento para determinar la insatisfactibilidad de una f´ormula.   
• Es ´util como t´ecnica de demostraci´on por refutaci´on (i.e., probar que $\tau$ es v´alida mostrando que ¬τ es insatisfactible).   
• Consiste en la aplicaci´on sucesiva de una regla de inferencia a un conjunto de cl´ausulas.

# Satisfactibilidad y validez

En general,

• Una asignaci´on asocia variables a valores del dominio.

Una f´ormula $\tau$ es v´alida sii toda asignaci´on la hace verdadera.

• Una f´ormula $\tau$ es satisfactible sii alguna asignaci´on la hace verdadera.

El siguiente hecho permite utilizar al m´etodo como t´ecnica de demostraci´on:

τ es v´alida sii ¬τ es insatisfactible

# Cl´ausulas y FNC

El m´etodo trabaja con f´ormulas en forma normal conjuntiva.

• Conjunci´on de disyunciones de literales, siendo un literal una f´ormula at´omica o su negaci´on. • Una cl´ausula es cada una de estas disyunciones de literales. Las representamos en notaci´on de conjuntos.

Ejemplo:

$$
\{ \neg { \mathsf { m e n o r } } ( X , Y ) , { \mathsf { m e n o r } } ( c , Y ) \}
$$

representa la cl´ausula

$$
\forall X . \forall Y . ( \neg { \mathsf { m e n o r } } ( X , Y ) \lor { \mathsf { m e n o r } } ( c , Y ) )
$$

# Cl´ausulas y FNC

De esta manera, notamos a una f´ormula en FNC como un conjunto de cl´ausulas. Este se entiende como la conjunci´on de todas ellas.

Por ejemplo, el conjunto que contiene a las cl´ausulas

$$
\begin{array} { r l } { \bullet } & { \{ \neg { \mathfrak { m e n o r } } ( X , Y ) , \mathfrak { m e n o r } ( c , Y ) \} } \\ { \bullet } & { \{ \mathfrak { i m p a r } ( Z ) , \mathfrak { m a y o r } ( Z , w ) \} } \end{array}
$$

representa la f´ormula

∀X .∀Y .(¬menor(X , Y )∨menor(c, Y ))∧∀Z .(impar(Z )∨mayor(Z , w))

# M´etodo de Resoluci´on

# Repaso

# Estrategia

Para demostrar que una f´ormula es universalmente v´alida Demostramos que su negaci´on es insatisfactible. • Para demostrar que $\tau$ se deduce de $\sigma _ { 1 } , . . . . \sigma _ { n }$ Demostramos que $\sigma _ { 1 } , \ldots , \sigma _ { n } , \lnot \tau$ es insatisfactible. La f´ormula es $\sigma _ { 1 } \wedge . . . \wedge \sigma _ { n } \Rightarrow \tau$ .

# Esquema general

• Expresar la o las f´ormulas como cl´ausulas.

• Aplicar sucesivamente un paso de resoluci´on (generando nuevas cl´ausulas)...

• Hasta llegar a la cl´ausula vac´ıa o concluir que no es posible llegar a ella.

• Importante: al aplicar resoluci´on suelen presentarse varias opciones. Conviene tener un plan.

# La regla de resoluci´on en el marco proposicional

$$
\frac { \ d = \{ A _ { 1 } , \dotsc , A _ { m } , Q \} } { \ u { \tau } = \{ A _ { 1 } , \dotsc , A _ { m } , B _ { 1 } , \dotsc , B _ { n } \} }
$$

• A τ se la llama resolvente (de $\sigma _ { i } \ y \ \sigma _ { j } )$

. La regla se apoya en el hecho de que la siguiente proposici´on es una tautolog´ıa:

$$
) \wedge ( \beta \vee \neg P ) \Leftrightarrow ( \alpha \vee P ) \wedge ( \beta \vee \neg P ) \wedge ( \alpha \vee \neg P ) .
$$

• El conjunto de cl´ausulas $\{ \sigma _ { 1 } , \ldots , \sigma _ { k } \}$ es l´ogicamente equivalente a $\{ \sigma _ { 1 } , \ldots , \sigma _ { k } , \tau \}$

# Ejemplo para entrar en calor

# Pr´actica 7 - Ejercicio 4

Un grupo de amigos quer´ıa juntarse a comer en una casa, pero no decid´ıan en cu´al. Prevalec´ıan dos propuestas: la casa de Fabiana, que era c´omoda y espaciosa, y la de Manuel, m´as chica pero con un amplio jard´ın y parrilla al aire libre. Finalmente acordaron basar su elecci´on en el pron´ostico del tiempo. Si anunciaban lluvia, se reunir´ıan en la casa de Fabiana; y si no, en la de Manuel. (Desde ya, se juntar´ıan en una sola casa.)

Finalmente el grupo se junt´o a comer en la casa de Fabiana, pero no llovi´o.

Utilizar las siguientes proposiciones para demostrar - mediante el m´etodo de resoluci´on - que el pron´ostico se equivoc´o (anunci´o lluvia y no llovi´o, o viceversa).

$P =$ “El pron´ostico anunci´o lluvia.” $F = { } ^ { " } \mathsf { E } |$ grupo se re´une en la casa de Fabiana.” M = “El grupo se re´une en la casa de Manuel.” L = “Llueve en el d´ıa de la reuni´on.”

# Prob´emoslo

Tenemos...

$$
\begin{array} { r l } { \mathrm { 1 . } } & { P \Rightarrow F \land \dotsc \dotsc P \lor F } \\ { \mathrm { 2 . } } & {  P \Rightarrow M \land \dotsc P \lor M } \\ { \mathrm { 3 . } } & {  ( F \land M ) \dotsc \neg F \lor \dotsc M } \\ { \mathrm { 4 . } } & { F } \\ { \mathrm { 5 . } } & {  L } \end{array}
$$

Queremos ver que:

$$
( P \land \neg L ) \lor ( \neg P \land L )
$$

Negaci´on:

$$
L ) \vee ( \neg P \wedge L ) ) \sim ( \neg P \vee L ) \wedge ( P \vee \neg L ) ,
$$

# Expresando las cl´ausulas como conjuntos

$$
\begin{array} { r l } & { 1 . \{ \begin{array} { l } {  P , F \} } \\ { 2 . } \end{array}  } \\ & {  \begin{array} { l } { 3 . \{ P , M \} } \\ { 3 . } \end{array}  } \\ & {  \begin{array} { r r r } { 4 . \{ F \} } \\ { 5 . } \end{array}  } \\ &   \begin{array} { r r r } { 5 . } & { \{ \begin{array} { r r r } { - L } \end{array} \} } \\ { 6 . } & { \{ \begin{array} { r r r , L \} } \\ { P , M \} } \end{array}  } \\ & {  \begin{array} { r r r } { 7 . \{ P , - L \} } \\ { 7 . } & { \{ P , - L \} } \end{array}  } \end{array} \end{array}
$$

De 6 y 2: 8. {L, M } De 8 y 3: 9. {L, De 9 y 4: 10. {L} De 10 y 5: ✷

Ayuda: pensemos en lo que queremos demostrar y ¡hagamos un plan! Suponemos que el pron´ostico no anunci´o lluvia o llovi´o...

# Pasaje a FNC

# Paso a paso

1. Eliminar implicaci´on   
2. Forma normal negada   
3. Forma normal prenexa (opcional)   
4. Forma normal de Skolem (dependencias $=$ variables libres dentro del   
alcance del ∃)   
5. Forma normal conjuntiva   
6. Distribuci´on de cuantificadores y renombre de variables

# La regla de resoluci´on en primer orden

$$
\frac  A _ { m } , P _ { 1 } , \ldots , P _ { k } \} \quad \sigma _ { j } = \{ B _ { 1 } , \ldots , B _ { n } , \lnot Q _ { 1 } , . . . ,
$$

• S es el MGU es decir, S(P $\begin{array} { l } { { \mathrm { ~ d e ~ } \{ P _ { 1 } \stackrel { ? } { = } \dots \stackrel { ? } { = } P _ { k } \stackrel { ? } { = } Q _ { 1 } \stackrel { ? } { = } \dots \stackrel { ? } { = } Q _ { I } \} } } \\ { { \mathrm { ~ \ I _ { 1 } ) } = \dots = S ( P _ { k } ) = S ( Q _ { 1 } ) = \dots = S ( Q } } \end{array}$ l ).

• A $\tau$ se la llama resolvente ( $\mathrm { d e } \ \sigma _ { i } \ \mathsf { y } \ \sigma _ { j } )$

• Cada paso de resoluci´on preserva satisfactibilidad (Teorema de Herbrand-Skolem-G¨odel).

# Resoluci´on en l´ogica de primer orden

Cosas importantes para recordar1 ！

• Al skolemizar, usar la misma constante o funci´on si y s´olo si la variable que estamos eliminando es la misma (nunca para otras, aun si tienen el mismo nombre). • Para encontrar las dependencias, ver qu´e variables est´an libres dentro del alcance del ∃ (sin contar la que se est´a eliminando). • ¡No olvidarse de negar lo que se quiere demostrar! Y recordar que $\lnot ( ( \sigma _ { 1 } \land \dotsc \land \sigma _ { n } ) \Rightarrow \tau ) = \sigma _ { 1 } \land \dotsc \land \sigma _ { n } \land$ ¬τ . • Antes de empezar a aplicar pasos de resoluci´on, convencerse de que lo que se quiere demostrar es verdadero, y trazar un plan para demostrarlo (mentalmente o por escrito). • Recordar bien c´omo funciona la unificaci´on, y sustituir siempre variables (ni funciones, ni constantes, ni predicados).

# Ejemplo

# Recuperatorio 2 parcial 1 Cuat. 2012

• Representar en forma clausal la siguiente informaci´on referida a conjuntos, pertenencia (predicado Pert) e inclusi´on (predicado Inc).

i ∀X .∀Y .( $\mathsf { l n c } ( X , Y ) \Leftrightarrow \forall Z . ( \mathsf { P e r t } ( Z , X ) \Rightarrow \mathsf { P e r t } ( Z , Y ) )$ )) X est´a incluido en $Y$ si y solo si cada elemento de $X$ es un elemento de $Y$ .   
ii ∀X .¬Pert(X , ∅) Ning´un elemento pertenece al vac´ıo.

• Usar resoluci´on para probar que el vac´ıo est´a incluido en todo conjunto.

• Indicar justificando si la prueba realizada es SLD (volveremos sobre esto m´as adelante).

# Ejemplo

Recuperatorio 2 parcial 1 Cuat. 2012

<table><tr><td>Cast.: 1°0.: Claus.:</td><td>X CY si y solo si cada elemento de X es un elemento de Y. ∀X.∀Y.(Inc(X,Y) ↔(∀Z.(Pert(Z,X)= Pert(Z,Y)))) {-Inc(Xi,Yi),-Pert(Z1,Xi),Pert(Zi,Yi)} {Inc(X2,Y2),Pert(f(X2,Y2),X2)} {Inc(X,Y3),-Pert(f(X,Y3),Y3)}</td></tr><tr><td>Cast.: 1° o.:</td><td>Ningun elemento pertenece al vacio. ∀X.-Pert(X,0)</td></tr></table>

# Ejemplo (cont.)°

Recuperatorio 2 parcial 1 Cuat. 2012

A partir de ellas, se desea demostrar que:°

Cast.: El vac´ıo est´a incluido en todo conjunto. 1 o.: ∀X .Inc(∅, X )   
Neg.: ∃X .¬Inc(∅, X )   
Claus.: {¬Inc(∅, c)}

# Ejemplo

Recuperatorio 2 parcial 1 Cuat. 2012

<table><tr><td>Cast.: 1°0.: Claus.:</td><td>X CY si y solo si cada elemento de X es un elemento de Y. ∀X.∀Y.(Inc(X,Y) ↔(∀Z.(Pert(Z,X)= Pert(Z,Y)))) {-Inc(Xi,Yi),-Pert(Zi,Xi),Pert(Zi,Yi)} {Inc(X2,Y2),Pert(f(X2,Y2),X2)} {Inc(X,Y3),-Pert(f(X,Y3),Y3)}</td></tr><tr><td>Cast.: 1° o.:</td><td>Ningun elemento pertenece al vacio. ∀X.-Pert(X,0)</td></tr></table>

# Ejemplo (cont.)°

Recuperatorio 2 parcial 1 Cuat. 2012

A partir de ellas, se desea demostrar que:°

Cast.: El vac´ıo est´a incluido en todo conjunto. 1 o.: ∀X .Inc(∅, X )   
Neg.: ∃X .¬Inc(∅, X )   
Claus.: {¬Inc(∅, c)}

# Ejemplo (resolviendo)° °

Recuperatorio 2 parcial 1 Cuat. 2012

$$
\begin{array} { r l } { \mathbb { 1 } . } & { \{ \neg \mathsf { I n c } ( X _ { 1 } , Y _ { 1 } ) , \neg \mathsf { P e r t } ( Z _ { 1 } , X _ { 1 } ) , \mathsf { P e r t } ( Z _ { 1 } , Y _ { 1 } ) \} } \\ { \mathbb { 2 } . } & { \{ \mathsf { I n c } ( X _ { 2 } , Y _ { 2 } ) , \mathsf { P e r t } ( \mathsf { f } ( X _ { 2 } , Y _ { 2 } ) , X _ { 2 } ) \} } \\ { \mathbb { 3 } . } & { \{ \mathsf { I n c } ( X _ { 3 } , Y _ { 3 } ) , \neg \mathsf { P e r t } ( \mathsf { f } ( X _ { 3 } , Y _ { 3 } ) , Y _ { 3 } ) \} } \\ { \mathbb { 4 } . } & { \{ \neg \mathsf { P e r t } ( X _ { 4 } , \emptyset ) \} } \\ { \mathbb { 5 } . } & { \{ \neg \mathsf { I n c } ( \emptyset , \mathsf { c } ) \} } \end{array}
$$

# ¿Cu´al es el plan?

Supongamos que el vac´ıo no est´a incluido en el conjunto c. Esto implica que existe un elemento que pertenece al vac´ıo y no pertenece a c. Pero sabemos que ning´un elemento pertenece al vac´ıo. Absurdo.

# Ejemplo (resolviendo)° °

Recuperatorio 2 parcial 1 Cuat. 2012

$$
\frac  \mathfrak { l } _ { 1 } , . . . , A _ { m } , P _ { 1 } , . . . , P _ { k } \} { S ( \{ A _ { 1 } , . . . , A _ { m } , B _ { 1 } , . . . , B _ { n } \} ) }
$$

donde S es el MGU de $\{ P _ { 1 } , . . . , P _ { k } , Q _ { 1 } , . . . , Q _ { I } \} .$

1 $\begin{array} { r l } { . . } & { \{ \neg { \mathsf { I n c } } ( X _ { 1 } , Y _ { 1 } ) , \neg { \mathsf { P e r t } } ( Z _ { 1 } , X _ { 1 } ) , \mathsf { P e r t } ( Z _ { 1 } , Y _ { 1 } ) \} } \\ { 2 . } & { \{ { \mathsf { I n c } } ( X _ { 2 } , Y _ { 2 } ) , { \mathsf { P e r t } } ( { \mathsf { f } } ( X _ { 2 } , Y _ { 2 } ) , X _ { 2 } ) \} } \\ { 3 . } & { \{ { \mathsf { I n c } } ( X _ { 3 } , Y _ { 3 } ) , \neg { \mathsf { P e r t } } ( { \mathsf { f } } ( X _ { 3 } , Y _ { 3 } ) , Y _ { 3 } ) \} } \\ { 4 . } & { \{ \neg { \mathsf { P e r t } } ( X _ { 4 } , \emptyset ) \} } \\ { 5 . } & { \{ \neg { \mathsf { I n c } } ( \emptyset , { \mathsf { c } } ) \} } \end{array}$   
6. $\begin{array} { r l } & { \left( 2 \textnormal { y } 5 \right) \left\{ \mathsf { P e r t } ( \mathsf { f } ( \varnothing , \mathsf { c } ) , \varnothing ) \right\} S = \{ X _ { 2 } : = \varnothing , \ Y _ { 2 } : = \mathsf { c } \quad } \\ & { \left( 6 \textnormal { y } 4 \right) \bigcirc \bigtriangledown S = \{ X _ { 4 } : = \mathsf { f } ( \varnothing , \mathsf { c } ) \} } \end{array}$ }   
7.

# Otro ejemplo°

Recuperatorio 2 parcial 2 Cuat. 2008

Dadas las siguientes definiciones de Descendiente y Abuela a partir de la relaci´on Madre:

• Los hijos son descendientes:   
∀X .∀Y .(Madre $( X , Y ) \Rightarrow$ Descendiente $( Y , X ) )$   
• La relaci´on de descendencia es transitiva:   
$\forall X . \forall Y . \forall Z$ .(Descendiente $( X , Y ) \wedge$ Descendiente $( Y , Z ) \Rightarrow$ Descendiente $( X , Z ) )$   
• La abuela es madre de alguien que es madre de la nieta:   
∀X .∀Y .(Abuela $\langle X , Y \rangle \Rightarrow \exists Z . ( { \mathsf { M a d r e } } ( X , Z ) \land { \mathsf { M a d r e } } ( Z , Y ) ) )$

Demostrar usando resoluci´on general que los nietos son descendientes; es decir, que

Ayuda: tratar de aplicar el m´etodo a ciegas puede traer problemas.   
Conviene tener en mente lo que se quiere demostrar.

# Otro ejemplo°

Recuperatorio 2 parcial 2 Cuat. 2008

<table><tr><td>Cast.: 1° 0.: Claus.:</td><td>Los hijos son descendientes. ∀X.∀Y.(Madre(X,Y)⇒ Descendiente(Y,X)) {-Madre(Xi,Yi),Descendiente(Yi,X1)}</td></tr><tr><td>Cast.: 1° o.: Claus.:</td><td>Larelacion de descendencia es transitiva. ∀X.VY.∀Z.(Descendiente(X, Y) ^ Descendiente(Y,Z) = Descendiente(X,Z)) {-Descendiente(X2,Y2),-Descendiente(Y2,Z2),Descendiente(X2,Z2)}</td></tr><tr><td>Cast.: 1° 0.: Claus.:</td><td>La abuela es madre de alguien que es madre de la nieta. ∀X.∀Y.(Abuela(X,Y) =Z.(Madre(X,Z) ^ Madre(Z,Y))) {-Abuela(X,Y3),Madre(X3,medio(X,Y))} {-Abuela(X4,Y4),Madre(medio(X4,Y4),Y4)}</td></tr></table>

# Otro ejemplo (cont.)° °

Recuperatorio 2 parcial 2 Cuat. 2008

A partir de ellas, se desea demostrar que:°

Cast.: Los nietos son descendientes 1 o.: ∀X.∀Y .(Abuela $( X , Y ) \Rightarrow$ Descendiente $( Y , X )$ ) Neg.: ∃X .∃Y .(Abuela $( X , Y ) \land \neg \mathsf { D }$ escendiente $( Y , X )$ ) Claus.: {Abuela(a, b)} {¬Descendiente(b, a)}

# Otro ejemplo°

Recuperatorio 2 parcial 2 Cuat. 2008

<table><tr><td>Cast.: 1° 0.: Claus.:</td><td>Los hijos son descendientes. ∀X.∀Y.(Madre(X,Y)⇒ Descendiente(Y,X)) {-Madre(Xi,Yi),Descendiente(Yi,X1)}</td></tr><tr><td>Cast.: 1° o.: Claus.:</td><td>Larelacion de descendencia es transitiva. ∀X.VY.∀Z.(Descendiente(X, Y) ^ Descendiente(Y,Z) = Descendiente(X,Z)) {-Descendiente(X2,Y2),-Descendiente(Y2,Z2),Descendiente(X2,Z2)}</td></tr><tr><td>Cast.: 1° 0.: Claus.:</td><td>La abuela es madre de alguien que es madre de la nieta. ∀X.∀Y.(Abuela(X,Y) =Z.(Madre(X,Z) ^ Madre(Z,Y))) {-Abuela(X,Y3),Madre(X3,medio(X,Y))} {-Abuela(X4,Y4),Madre(medio(X4,Y4),Y4)}</td></tr></table>

# Otro ejemplo (cont.)° °

Recuperatorio 2 parcial 2 Cuat. 2008

A partir de ellas, se desea demostrar que:°

Cast.: Los nietos son descendientes 1 o.: ∀X.∀Y .(Abuela $( X , Y ) \Rightarrow$ Descendiente $( Y , X )$ ) Neg.: ∃X .∃Y .(Abuela $( X , Y ) \land \neg \mathsf { D }$ escendiente $( Y , X )$ ) Claus.: {Abuela(a, b)} {¬Descendiente(b, a)}

# Otro ejemplo (resolviendo)° °

Recuperatorio 2 parcial 2 Cuat. 2008

1. $\{ \neg { \mathsf { M a d r e } } ( X _ { 1 } , Y _ { 1 } )$ , Descendiente $\{ Y _ { 1 } , X _ { 1 } ) \}$   
2. {¬Descendiente $( X _ { 2 } , Y _ { 2 } )$ ), ¬Descendiente( $Y _ { 2 } , Z _ { 2 } )$ , Descendiente $( X _ { 2 } , Z _ { 2 } ) \}$   
3. {¬Abuela(X3, Y3), Madre $X _ { 3 }$ , medio(X3, Y3))}   
4. {¬Abuela(X4, Y4), Madre(medio(X4, Y4), Y4)}   
5. {Abuela(a, b)}   
6. {¬Descendiente(b, a)}

Resolv´amoslo con nuestra herramienta.

# Resoluci´on General Repaso M´etodo de resoluci´on En l´ogica proposicional En l´ogica de primer orden Ejercicios

Resoluci´on lineal y SLD

Resoluci´on lineal Motivaci´on Cl´ausulas de Horn Resoluci´on SLD Arbol de resoluci´on´ De Prolog a resoluci´on Ejemplo completo

# C´omo mantenernos en l´ınea

Si un conjunto de cl´ausulas $\mathcal { C }$ es insatisfactible, existe una secuencia de pasos de resoluci´on lineal que lo refuta (prueba su insatisfactibilidad). Es decir, una secuencia de la forma:

![](images/254623fde0dd357706efd47a3d6b7ed426c18fa3344197b3c2ad2d63653992c3.jpg)

donde $C _ { 0 }$ y cada $B _ { j }$ es un elemento de $\mathcal { C }$ o alg´un $C _ { j }$ con $j < i$

# Resoluci´on SLD (Selective Linear Definite)

La resoluci´on es cara, pero hay cupones de descuento...

El m´etodo de resoluci´on es completo, pero ineficiente.   
• El espacio de b´usqueda - inicialmente cuadr´atico - crece en cada paso.   
• Resoluci´on lineal reduce el espacio de b´usqueda.   
• Resoluci´on SLD es lineal y (un poco) m´as eficiente, preservando completitud... ¡pero no puede aplicarse a cualquier conjunto de cl´ausulas!

# Cl´ausulas de Horn

# • Cl´ausula de Horn

I Cl´ausula de la forma $\forall X _ { 1 } \ldots \forall X _ { m } . C$ tal que la disyunci´on de literales C tiene a lo sumo un literal positivo.

• Cl´ausula de definici´on (“Definite Clause”)

I Cl´ausula de la forma $\forall X _ { 1 } \dots \forall X _ { m } . C$ tal que la disyunci´on de literales $C$ tiene exactamente un literal positivo.

• Sea $H = P \cup \{ G \}$ un conjunto de cl´ausulas de Horn (con nombre de variables disjuntos) tal que

I $P$ conjunto de cl´ausulas de definici´on y $G$ una cl´ausula sin literales positivos.

• $H = P \cup \{ G \}$ son las cl´ausulas de entrada.

I $P$ se conoce como el programa o base de conocimientos y I G el goal, meta o cl´ausula objetivo.

# Cl´ausulas de Horn

![](images/04cfcfa590cc725ca31e79624d9aa6e2b2a2abad949df1d7f2c6a65673cc06c7.jpg)

Cl´ausulas con a lo sumo un literal positivo.

$$
\begin{array} { r l r } { \circ } & { \{ P ( X ) , P ( Y ) , \neg Q ( Y , Z ) \} } \\ { \circ } & { \{ Q ( e , Z ) \} \vee } & {  \mathsf { c l a u s u l } } \\ { \circ } & { \{ P ( X ) , \neg P ( e ) \} \vee } & {  \mathsf { c l a u s u l } } \\ { \circ } & { \{ P ( X ) , \neg P ( e ) , \neg Q ( X , Y ) \} } \\ { \circ } & { \{ P ( X ) , \neg P ( e ) , \neg Q ( X , Y ) \} \vee } & \\ { \circ } & { \{ \neg P ( X ) , \neg P ( e ) , \neg Q ( X , Y ) \} \vee  \mathsf { c l a u s } } \\ { \circ } & { \{ \neg P ( X ) , \neg P ( e ) , \neg Q ( X , Y ) \} \not  \mathsf { c l } \breve { \mathsf { a u s } } } \end{array}
$$

a de definici´on (hecho)

a de definici´on (regla)

ula de definici´on (regla)

ula objetivo

No toda f´ormula puede expresarse como una cl´ausula de Horn

$$
\forall X . ( P ( X ) \lor Q ( X ) )
$$

# Resoluci´on SLD

Un secuencia de pasos de resoluci´on SLD para un conjunto de cl´ausulas de Horn $H$ es una secuencia

$$
< N _ { 0 } , N _ { 1 } , \ldots , N _ { p } >
$$

de cl´ausulas objetivo que satisfacen las siguientes dos condiciones:

1. $N _ { 0 } \in H$ ( $N _ { 0 }$ es la cl´ausula objetivo de $H )$ .   
2. sigue en la pr´oxima diapo...

# Resoluci´on SLD

2. para todo Ni en la secuencia, $0 < i < p$ , si $N _ { i }$ es

$$
\{ \neg A _ { 1 } , \dotsc , \neg A _ { k - 1 } , \neg A _ { k } , \neg A _ { k + 1 } , \dotsc , \neg A _ { n } \}
$$

entonces hay alguna cl´ausula de definici´on Ci de la forma $\{ A , \neg B _ { 1 } , \dotsc , \neg B _ { m } \}$ en $H$ , tal que $A _ { k }$ y A son unificables con MGU S , y $N _ { i + 1 }$ es {S (¬A1, . . . $, \neg A _ { k - 1 } , \neg B _ { 1 } , \dotsc , \neg B _ { m } , \neg A _ { k + 1 } , \dotsc , \neg A _ { n }$ )}.

# Resoluci´on SLD

Un caso particular de la resoluci´on general.

• Cl´ausulas de Horn con exactamente una cl´ausula objetivo.   
Resolvemos la cl´ausula objetivo con una cl´ausula de definici´on.   
• Eso nos da otra cl´ausula objetivo. Repetimos el proceso con esta nueva cl´ausula...   
• Hasta llegar a la cl´ausula vac´ıa.   
• Si se busca un resultado, computamos la sustituci´on respuesta componiendo todas las sustituciones que fuimos realizando.

![](images/d056880897236cc8d5cf14e5be3032ec335b6f5ecdc9a99c8157cc8c3e8d488a.jpg)

donde S es el MGU de $\left\{ R \overset { ? } { = } A _ { k } \right\}$ .

# Volviendo al primer ejercicio de LPO que resolvimos...

$$
\begin{array} { r l } { { 1 . } } & { { \{ \mathrm { - } | \mathrm { n c } ( X _ { 1 } , Y _ { 1 } ) , \mathrm { - } \mathrm { P e r t } ( Z _ { 1 } , X _ { 1 } ) , \mathrm { P e r t } ( Z _ { 1 } , Y _ { 1 } ) \} } } \\ { { 2 . } } & { { \{ \mathrm { 1 n c } ( X _ { 2 } , Y _ { 2 } ) , \mathrm { P e r t } ( \mathrm { f } ( X _ { 2 } , Y _ { 2 } ) , X _ { 2 } ) \} } } \\ { { 3 . } } & { { \{ \mathrm { 1 n c } ( X _ { 3 } , Y _ { 3 } ) , \mathrm { - } \mathrm { P e r t } ( \mathrm { f } ( X _ { 3 } , Y _ { 3 } ) , Y _ { 3 } ) \} } } \\ { { 4 . } } & { { \{ \mathrm { - } \mathrm { P e r t } ( X _ { 4 } , \emptyset ) \} } } \\ { { 5 . } } & { { \{ \mathrm { - } | \mathrm { n c } ( \emptyset , \mathsf { c } ) \} } } \\ { { 6 . } } & { { \left( 2 \ : \mathsf { y } \ : \right) \ : \left\{ \mathrm { P e r t } ( \mathrm { f } ( \emptyset , \mathsf { c } ) , \emptyset ) \right\} \ : S = \{ X _ { 2 } : = \emptyset , \ : Y _ { 2 } : } } \\ { { 7 . } } & { { \left( 6 \ : \mathsf { y } \ : 4 \right) \ : \left\{ \mathrm { ~ S } = \{ \{ X _ { 4 } : = \mathrm { f } ( \emptyset , \mathsf { c } ) \} \right\} } }  \end{array}
$$

¿Esto es SLD? ¿Por qu´e, o por qu´e no?

# Resoluci´on SLD

Ejemplo (computando una soluci´on)

“Los enemigos de mis enemigos son mis amigos.”

1. {amigo(A, B), ¬enemigo(A, C ), ¬enemigo(C , B)}

$$
\begin{array} { r l } & { \mathrm { ~  ~ { \mathcal ~ } { _ \mathrm { \cdot ~ } } ~ } \mathrm { c ^ { a n t } } \mathrm { n } { \mathrm { ! } } \mathrm { e } ^ { \mathrm { w } } { \mathrm { , ~ } D } \mathrm { , ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \cdot \mathrm { ~ } }  \\ & { \mathrm { ~  ~ { \mathcal ~ } { _ \cdot ~ } ~ } \left\{ \mathrm { ~ e } \mathrm { n } { \mathrm { e m i g o } } \bigl ( \mathrm { R e e d } , \mathrm { G a l a c t u s } \bigr ) \right\} } \\ & { \mathrm { ~  ~ { \mathcal ~ } { _ \cdot ~ } } \left\{ \mathrm { ~ } { ~ } \mathrm { e } \mathrm { n } { \mathrm { e m i g o } } \bigl ( \mathrm { G a l a c t u s , B e n } \bigr ) \right\} } \\ & { \mathrm { ~  ~ { \mathcal ~ } { _ \cdot ~ } } \bigl \{ \mathrm { ~ e } \mathrm { n } { \mathrm { e m i g o } } \bigl ( \mathrm { G a l a c t u s , J o h n n y } \bigr ) \bigr \} } \\ & { \mathrm { ~  ~ { \mathcal ~ } { _ \cdot ~ } } \bigl \{ \mathrm { ~ } { - a m i g o } \bigl ( \mathrm { R e } \mathrm { e } \mathrm { e d } , X \bigr ) \bigr \} } \\ & { \mathrm { ~  ~ { \mathcal ~ } { _ \cdot ~ } } \bigl ( 1 \mathrm { ~ } \mathrm { ~ y ~ } \bigr ) \mathrm { ~ } \bigl \{ \mathrm { ~ } \mathrm { - e n e m i g o } \bigl ( R e \mathrm { e d } , C \bigr ) , \bigr \} , } \\ & { \mathrm { ~  ~ { \mathcal ~ } { _ \delta ~ } = ~ } \{ A \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } } \end{array}
$$

¬enemigo(C , B)}

$$
\begin{array} { r l } & { ~ S _ { 6 } = \{ A : = \mathsf { K e e d } , A : = B \} } \\ & { ~ 7 . ~ ( 2 \mathrm {  ~ y ~ } 6 ) ~ \{ \mathrm {  ~ \hat { \psi } ~ \unboldmath } [ \mathsf { - e n e m i g o } ( \mathsf { G a } | \mathsf { a c t u s } , B ) \} } \\ & { ~ S _ { 7 } = \{ C : = \mathsf { G a } | \mathsf { a c t u s } \} } \\ & { ~ 8 . ~ ( 3 \mathrm {  ~ y ~ } 7 ) ~ \Pi ~ S _ { 8 } = \{ B : = \mathsf { B e n } \} } \\ & { ~ S _ { \mathrm { \texttt { a } } } S _ { 8 } \circ S _ { 7 } \circ S _ { 6 } = } \\ & { ~ \{ A : = \mathsf { R e e d } , X : = \mathsf { B e n } , B : = \mathsf { B e n } , } \end{array}
$$

C := Galactus}

# Arbol de resoluci´on ´

# ¡Es lineal!

La resoluci´on SLD es lineal: no hay vuelta atr´as posible.

• Si el objetivo puede resolverse con m´as de una regla, elegir la correcta.

Si hay m´as de una, elegir cualquiera.

• Si nos equivocamos, entonces lo que hicimos no es parte de la resoluci´on SLD.

• Puede haber varias resoluciones SLD posibles.

• Prolog intenta buscar todas (resoluci´on SLD + backtracking).

# Resoluci´on SLD y Prolog

Preguntas generales

• El mecanismo de b´usqueda en la resoluci´on SLD ¿est´a determinado?   
• ¿El m´etodo es completo? ¿Prolog usa resoluci´on SLD? ¿Su m´etodo es completo? ¿Est´a determinado? ¿D´onde est´a el problema (o la diferencia)?

# Resoluci´on SLD y Prolog

El ejemplo anterior en Prolog “Los enemigos de mis enemigos son mis amigos.”

{amigo(A,B), ¬enemigo(A,C), ¬enemigo(C,B)}   
{enemigo(Reed, Galactus)}   
{enemigo(Galactus, Ben)}   
{enemigo(Galactus, Johnny)}   
{¬amigo(Reed, X )} amigo(A, B) :- enemigo(A, C), enemigo(C, B).   
enemigo(reed, galactus).   
enemigo(galactus, ben).   
enemigo(galactus, johnny).   
?- amigo(reed, X).

¿Cu´al es la relaci´on? ¿Cualquier ejemplo se puede traducir as´ı? ¿Qu´e hay que tener en cuenta?

$$
\mathsf { R e s o l u c i o n ~ S L D ~ y ~ P r o l o g }
$$

Veamos ahora este ejemplo tomado de la pr´actica de Prolog:

1. natural(0).   
2. natural(suc(X)) :- natural(X).   
3. menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).   
4. menorOIgual(X,X) :- natural(X).

¿Qu´e pasa en Prolog si ejecutamos la consulta menorOIgual(0,X)?

¿Podremos encontrar la respuesta usando resoluci´on?

$$
\mathsf { D e } \mathsf { P r o l o g \ a \ R e s o l u c i o n }
$$

Considerar las siguientes definiciones en prolog:

preorder(bin(I,R,D),[R|L]) :- append(LI,LD,L), preorder(I,LI), preorder(D,LD).

append([],YS,YS).

append([X|XS],YS,[X|L]) :- append(XS,YS,L).

• ¿Qu´e sucede al realizar la consulta ?- preorder(bin(bin(nil,2,nil),1,nil),Lista).?

• Utilizar el m´etodo de resoluci´on para encontrar la soluci´on al problema. Para ello, convertir el programa a forma clausal.

• Indicar si el m´etodo de resoluci´on utilizado es o no SLD, y justificar. En caso de ser SLD, ¿respeta el orden en que Prolog hubiera resuelto la consulta?

# Ultimo ejercicio´° ° 2 parcial 1 Cuat. 2011

En este ejercicio usaremos el m´etodo de resoluci´on para demostrar una propiedad de las relaciones binarias; a saber, que una relaci´on no vac´ıa no puede ser a la vez irreflexiva, sim´etrica y transitiva.

Para esto tomaremos una relaci´on $R$ y se demostrar´a que, si $R$ satisface las tres propiedades mencionadas, entonces es vac´ıa.

Dadas las siguientes definiciones:

1. R es irreflexiva: $\forall X . \lnot R ( X , X )$   
2. R es sim´etrica: $\forall X . \forall Y . ( R ( X , Y ) \Rightarrow R ( Y , X ) )$   
3. R es transitiva: $\forall X . \forall Y . \forall Z . ( ( R ( X , Y ) \land R ( Y , Z ) ) \Rightarrow R ( X , Z )$ )   
4. R es vac´ıa: $\forall X . \lnot \exists Y . R ( X , Y )$

Utilizando resoluci´on, demostrar que s´olo una relaci´on vac´ıa puede cumplir a la vez las propiedades 1 a 3. Indicar si el m´etodo de resoluci´on utilizado es o no SLD (y justificar).

<table><tr><td>Cast.: 1 0.: Claus.:</td><td>R es irreflexiva. ∀X.-R(X,X) {-R(X1,X1)}</td></tr><tr><td>Cast.:</td><td>R es simétrica</td></tr><tr><td>1°o.: Claus.:</td><td>∀X.∀Y.(R(X,Y)= R(Y,X)) {-R(X2,Y2),R(Y2,X2)}</td></tr><tr><td>Cast.:</td><td>R es transitiva.</td></tr><tr><td>1°0.:</td><td>∀X.∀Y.∀Z.((R(X,Y) ^ R(Y,Z)) = R(X,Z))</td></tr><tr><td>Claus.:</td><td>{-R(X,Y3),-R(Y3,Z3),R(X,Z3)}</td></tr></table>

# Ultimo ejercicio (cont.) ´° ° 2 parcial 1 Cuat. 2011

Se desea demostrar que:°

# Ultimo ejercicio (resolviendo) ´° ° 2 parcial 1 Cuat. 2011

$\begin{array} { r l } & { 1 . \{ \neg R ( X _ { 1 } , X _ { 1 } ) \} } \\ & { 2 . \{ \neg R ( X _ { 2 } , Y _ { 2 } ) , R ( Y _ { 2 } , X _ { 2 } ) \} } \\ & { 3 . \{ \neg R ( X _ { 3 } , Y _ { 3 } ) , \neg R ( Y _ { 3 } , Z _ { 3 } ) , R ( X _ { 3 } , Z _ { 3 } ) \} } \\ & { 4 . \{ R ( a , \mathfrak { b } ) \} } \\ & { 5 . ( 4 \ \mathfrak { y } \ 2 \ \{ R ( \mathfrak { b } , \mathfrak { a } ) \} \ \mathfrak { S } = \{ X _ { 2 } : = \mathfrak { a } , Y _ { 2 } : = \mathfrak { b } \} } \\ & { 6 . \ \{ \mathfrak { S } \ \mathfrak { y } \ 3 \ \{ - R ( X _ { 6 } , \mathfrak { b } ) , R ( X _ { 6 } , \mathfrak { a } ) \} \ \leq ( Y _ { 3 } : = \mathfrak { k } } \\ & { 7 . \ ( \mathfrak { e } \ \mathfrak { y } \ 4 ) \ \{ R ( \mathfrak { a } , \mathfrak { a } ) \} \ \leq \{ X _ { 6 } : = \mathfrak { a } \} } \end{array}$ $Z _ { 3 } : = { \mathsf { a } } \}$ renombrando $X _ { 3 }$ a $X _ { 6 }$ 8. (7 y 1

¿Esta demostraci´on por resoluci´on es SLD? ¿Por qu´e, o por qu´e no?

# Alternativa SLD (cambiando objetivo)° °

2 parcial 1 Cuat. 2011

$\begin{array} { r l } & { \mathrm { 1 . ~ } \left\{ \mathrm { - } R ( X _ { 1 } , X _ { 1 } ) \right\} } \\ & { \mathrm { 2 . ~ } \left\{ \mathrm { - } R ( X _ { 2 } , Y _ { 2 } ) , R ( Y _ { 2 } , X _ { 2 } ) \right\} } \\ & { \mathrm { 3 . ~ } \left\{ \mathrm { - } R ( X _ { 3 } , Y _ { 3 } ) , \mathrm { - } R ( Y _ { 3 } , Z _ { 3 } ) , R ( X _ { 3 } , Z _ { 3 } ) \right\} } \\ & { \mathrm { 4 . ~ } \left\{ R ( \mathfrak { a } , \mathfrak { b } ) \right\} } \\ & { \mathrm { 5 . ~ } \left( \mathrm { 1 . ~ } \mathfrak { y } \mathrm { ~ 3 } \right\} \left\{ \mathrm { - } R ( X _ { 1 } , Y _ { 3 } ) , \mathrm { - } R ( Y _ { 3 } , X _ { 1 } ) \right\} s = \{ X \mathrm { 2 . ~ } \forall \mathrm { ~ } \mathfrak { a } , \mathrm { ~ } \mathfrak { b } \} } \\ & { \mathrm { 6 . ~ } \left\{ \mathrm { ~ } \mathrm { > ~ } \mathfrak { y } \mathrm { ~ 4 } \right\} \left\{ \mathrm { - } R ( \mathfrak { b } , \mathfrak { a } ) \right\} s = \{ X _ { 1 } : = \mathrm { 3 , ~ } Y _ { 3 } : = \mathfrak { b } \} } \\ &  \mathrm { 7 . ~ } \left( \mathrm { ~ 6 \forall ~ 2 ~ } \right) \ \mathrm { ~ } \mathrm { \overset { \cdot } { \in } \mathbb { R } ( \mathfrak { a } , \mathfrak { b } ) \} s = \{ X _ { 2 } : = \mathrm { 3 , ~ } Y _ { 2 } : = \mathfrak { b } \} } \\ & { \mathrm { 8 . ~ } \left( \mathrm { ~ 7 ~ } \mathfrak { y } \mathrm { ~ 4 } \right) \ \Gamma S = \mathfrak { a } , \quad } \end{array}$ := X1}

¿Es la ´unica posible?

# Otra alternativa SLD (m´as corta)° ° 2 parcial 1 Cuat. 2011

$\begin{array} { r l } & { \mathrm { 1 . ~ } \left\{ \mathrm { - } R ( X _ { 1 } , X _ { 1 } ) \right\} } \\ & { \mathrm { 2 . ~ } \left\{ \mathrm { - } R ( X _ { 2 } , Y _ { 2 } ) , R ( Y _ { 2 } , X _ { 2 } ) \right\} } \\ & { \mathrm { 3 . ~ } \left\{ \mathrm { - } R ( X _ { 3 } , Y _ { 3 } ) , \mathrm { - } R ( Y _ { 3 } , Z _ { 3 } ) , R ( X _ { 3 } , Z _ { 3 } ) \right\} } \\ & { \mathrm { 4 . ~ } \left\{ R ( \mathrm { a , b } ) \right\} } \\ & { \mathrm { 5 . ~ } \left( \mathrm { 1 ~ y 3 } \right) \left\{ \mathrm { - } R ( X _ { 1 } , Y _ { 3 } ) , \mathrm { - } R ( Y _ { 3 } , X _ { 1 } ) \right\} \mathrm { s = } \{ X _ { 3 } , Y _ { 3 } \} } \\ & { \mathrm { 6 . ~ } \left( \mathrm { 5 ~ y 2 } \right) \left\{ \mathrm { - } R ( X _ { 2 } , Y _ { 2 } ) \right\} \mathrm { s = } \{ X _ { 1 } = X _ { 2 } , Y _ { 3 } \mathrm { : = } }  \\ & { \mathrm { 7 . ~ } \left( \mathrm { 6 ~ y 4 } \right) \mathrm { G = } \{ X _ { 2 } : \mathrm { = } \mathrm { ~ a , ~ } \forall _ { 2 } : \mathrm { = ~ b \} } } \end{array}$ 3 := X1, Z3 := X1}

![](images/e4dffdb51152c878eea933cd48d81a5bc1cf4569e2c1e3c50076a73c1c9ef221.jpg)