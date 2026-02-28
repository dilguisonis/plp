# Paradigmas de Programaci´on

# Sistemas deductivos Deducci´on natural para l´ogica proposicional

2do cuatrimestre de 2025 Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

# 1

# Sistemas deductivos

# Deducci´on natural para l´ogica proposicional

Sem´antica bivaluada

$$
2
$$

# Motivaci´on

Queremos poder hacer afirmaciones matem´aticamente precisas sobre programas en distintos lenguajes de programaci´on.

Ejemplos de afirmaciones que podr´ıamos querer hacer

El tipo (Bool -> Int) est´a sint´acticamente bien formado.   
La expresi´on map tiene tipo ((a -> b) -> [a] -> [b]).   
La expresi´on map tiene tipo ((a -> a) -> [a] -> [a]).   
La expresi´on undefined || True tiene tipo Bool.   
El programa while (true) {} no termina.   
El resultado de evaluar (factorial 7) es 5040.   
Los algoritmos quickSort y mergeSort son indistinguibles.

Queremos tener mecanismos para demostrar dichas afirmaciones.

En este contexto, las afirmaciones se llaman juicios.

# Sistemas deductivos

Sistema deductivo (informalmente)

Brinda herramientas y principios para razonar de manera rigurosa.

$$
4
$$

Sistema deductivo (un poco m´as formal)

Sirve para razonar acerca de juicios.

# Sistemas deductivos

Dado por un conjunto de axiomas y reglas de inferencia, que tienen la siguiente estructura:

⟨axioma⟩ ⟨nombre del axioma⟩ ⟨premisa0⟩ ⟨premisa1⟩ . . . ⟨premisan⟩⟨conclusi´on⟩ ⟨nombre de la regla⟩

Axioma: Afirmaciones b´asicas que se asumen como verdaderas (no se deducen de otras afirmaciones).

Reglas de inferencia: Permiten derivar afirmaciones (teoremas) a partir de axiomas y otras afirmaciones.

Nota: Un axioma es una regla de inferencia sin premisas.

# Reglas de inferencia

Regla de inferencia

⟨premisa0⟩ ⟨premisa1⟩ . . . ⟨premisan⟩ ⟨nombre de la regla⟩ ⟨conclusi´on⟩

Las premisas son condiciones suficientes para la conclusi´on.

▶ Lectura de arriba hacia abajo: si tenemos evidencia de que valen las premisas, podemos deducir que vale la conclusi´on.   
▶ Lectura de abajo hacia arriba: si queremos demostrar que vale la conclusi´on, alcanza con demostrar que valen las premisas.

# Sistemas deductivos

# Ejemplo: Sistema deductivo A

El sistema A predica sobre juicios de la forma $X > Y "$ .

Axiomas:

Regla de inferencia: definida por el esquema

$$
\frac { X > Y \quad Y > Z } { X > Z } \mathrm { t r a n s }
$$

X , Y y Z son variables esquem´aticas / metavariables: se pueden instanciar de manera arbitraria.

Demostrar el juicio ⋆ $> \bullet$ de dos maneras distintas.

$$
) \mathsf { e r i v a c i o n / \mathsf { D e d u c c i o n / \mathsf { P r u e b a } } }
$$

# Derivaci´on

Un procedimiento sistem´atico que permite construir una demostraci´on, mostrando c´omo una afirmaci´on se deduce a partir de un conjunto de axiomas y reglas de inferencia.

# 8

# Arbol de Derivaci´on´

# Arbol de Derivaci´on´

Representaci´on gr´afica de una derivaci´on.

Un ´arbol finito donde. . .

Los nodos representan afirmaciones.   
La ra´ız es la afirmaci´on que se quiere probar (conclusi´on).   
Las ramas representan las reglas de inferencias que conectan a las afirmaciones.

Parte de ciertas premisas (hojas) y llega a una conclusi´on (ra´ız).

# Arbol de Derivaci´on´

![](images/422224b51cab630480537934c6a3e3341000ba8312a30e22f9504b4c23f170b6.jpg)

$$
\mathsf { A f i r m a c i o n d e r i v a b l e ( t e o r e m a ) }
$$

# Afirmaci´on derivable

Una afirmaci´on es derivable si existe alguna derivaci´on sin premisas que la tiene como conclusi´on.

¿Son derivables las siguientes afirmaciones?

⋆ > ▲ ▶ ▲ > ⋆

# L´ogica proposicional: Sintaxis

Dado un conjunto infinito numerable de variables proposicionales:

$$
\mathcal { P } = \{ P , Q , R , \ldots \}
$$

# F´ormulas

Las f´ormulas bien formadas (fbf) de la l´ogica proposicional se construyen inductivamente seg´un las siguientes reglas:

Cualquier variable proposicional es una f´ormula.   
⊥ es una f´ormula (representa una contradicci´on).   
Si τ es una f´ormula, entonces $\neg \tau$ es una f´ormula.   
Si τ y σ son f´ormulas, entonces $( \tau \wedge \sigma )$ , $\left( \tau \Rightarrow \sigma \right)$ , y $( \tau \vee \sigma )$ son f´ormulas.

L´ogica proposicional: Sintaxis (como sistema deductivo)

Dado un conjunto infinito numerable de variables proposicionales:

$$
\mathcal { P } = \{ P , Q , R , \ldots \}
$$

# Sistema deductivo

La afirmaci´on “X form” denota que $X$ es una f´ormula de la l´ogica proposicional.

$$
\begin{array} { r l } & { \underbrace { \overline { { \mathsf { \Pi } } } \mathsf { F O R M } } _ { \begin{array} { l } { \mathrm { \overline { { \perp } } } \mathrm { \tiny { ~ F O R M } } } \mathsf { F \bot } \quad } & { \frac { \tau \mathrm { \tiny ~ F O R M } } { \left( \tau \wedge \sigma \right) \mathrm { \tiny ~ F O R M } } \mathsf { F } \wedge } \\ & { } \\ { \mathsf { \Pi } } & { \frac { \tau \mathrm { \tiny ~ F O R M } } { \left( \tau \vee \sigma \right) \mathrm { \tiny ~ F O R M } } \mathsf { F } \vee \quad } & { \frac { \tau \mathrm { \tiny ~ F O R M } } { \pi \tau \mathrm { \tiny ~ F O R M } } } \end{array} } \end{array}
$$

1. Demostrar $\neg ( P \Rightarrow ( Q \Rightarrow P ) )$ form.

2. (Para pensar) Demostrar que si $\tau$ form es un juicio derivable, entonces $\tau$ tiene el mismo n´umero de “(” que de “)”. Proceder por inducci´on estructural en la derivaci´on.

# Sistemas deductivos

# Deducci´on natural para l´ogica proposicional

Sem´antica bivaluada

$$
^ { 1 4 }
$$

# L´ogica proposicional: Sintaxis (gram´aticas)

Usualmente no vamos a definir la sintaxis de lenguajes a trav´es de sistemas deductivos.

Vamos a escribirlos de maneras abreviadas, usando gram´aticas (la definici´on de lo que es una gram´atica la ver´an en LFAC).

# Gram´atica de la l´ogica proposicional

Las f´ormulas son las expresiones que se pueden generar a partir de la siguiente gram´atica:

$$
\therefore = \begin{array} { r } { | \begin{array} { l } { \perp } \end{array} | \begin{array} { r } { ( \tau \wedge \sigma ) } \end{array} | \begin{array} { r } { ( \tau \Rightarrow \sigma ) } \end{array} | \begin{array} { r } { ( \tau \wedge \sigma ) } \end{array} | } \end{array}
$$

# Observaci´on

La gram´aticas definen sistemas deductivos de manera abreviada. Una expresi´on $\tau$ se puede generar a partir de la gram´atica de arriba si y s´olo si el juicio $\tau$ form es derivable en el sistema anterior.

# Convenciones de notaci´on

1. Omitimos los par´entesis m´as externos de las f´ormulas.

$$
\tau \wedge \neg ( \sigma \vee \rho ) \ : = \ : ( \tau \wedge \neg ( \sigma \vee \rho ) )
$$

2. La implicaci´on es asociativa a derecha.

$$
\tau \Rightarrow \sigma \Rightarrow \rho \ = \ ( \tau \Rightarrow ( \sigma \Rightarrow \rho ) )
$$

3. Ojo: los conectivos $( \wedge , \vee )$ no son conmutativos ni asociativos.

$\tau \vee ( \sigma \vee \rho ) ~ \neq ~ ( \tau \vee \sigma ) \vee \rho ~ \tau \wedge \sigma$ ̸= σ ∧ τ

# L´ogica Proposicional : Sem´antica

# Valuaci´on

Una valuaci´on es una funci´on $v : \mathcal { P }  \{ \mathtt { V } , \mathtt { F } \}$ que asigna valores de verdad a las variables proposicionales.

v ⊨ τ

Una valuaci´on v satisface una f´ormula $\tau$ si $v \models \tau$ , donde:

$$
\begin{array} { r l } { v \vdash P } & { \mathrm { ~ s \ " ~ y ~ s \diamond | o ~ s \ " ~ } \quad v ( P ) = \mathsf { V } } \\ { v \vdash \tau \land \sigma } & { \mathrm { ~ s \ " ~ y ~ s \diamond | o ~ s \ " ~ } \quad v \vdash \tau \mathrm { ~ y ~ } v \vdash \sigma } \\ { \vdash \tau \Rightarrow \sigma } & { \mathrm { ~ s \ " ~ y ~ s \diamond | o ~ s \ " ~ } \quad v \vdash \tau \mathrm { ~ o ~ } v \vdash \sigma } \\ { v \vdash \tau \lor \sigma } & { \mathrm { ~ s \ " ~ y ~ s \diamond | o ~ s \ " ~ } \quad v \vdash \tau \mathrm { ~ o ~ } v \vdash \sigma } \\ { v \vdash \tau } & { \mathrm { ~ s \ " ~ y ~ s \diamond | o ~ s \ " ~ } \quad v \vdash \tau } \end{array}
$$

Nota: $v \models \bot$ nunca vale

# Contextos y juicios

Un contexto es un conjunto finito de f´ormulas.

Los notamos con letras griegas may´usculas $( \Gamma , \Delta , \Sigma , \ldots )$ . Por ejemplo:

$$
\Gamma = \{ P \Rightarrow Q , \neg Q \}
$$

Generalmente omitimos las llaves; E.g., $P \Rightarrow Q , \neg Q$ .

# L´ogica Proposicional : Sem´antica

Una valuaci´on v satisface un contexto Γ (notaci´on: v ⊨ Γ) si y s´olo si v satisface a todas las f´ormulas de Γ.

Nota: Toda valuaci´on v satisface al contexto vac´ıo

# Consecuencia l´ogica

Una f´ormula $\tau$ es consecuencia l´ogica (o consecuencia sem´antica) de un conjunto Γ (notaci´on: Γ ⊨ τ ) si y s´olo si cualquier valuaci´on v que satisface a Γ tambi´en satisface a $\tau$ .

# Notas:

τ es verdadera para todas las valuaciones que satisfacen todas la f´ormulas en Γ.

Asumiendo que todas las f´ormulas en Γ son verdaderas (hip´otesis), $\tau$ (tesis) es verdadera.

# Consecuencia l´ogica

# Ejemplo

1. Probar que $P \land Q \models P$ .   
2. Probar que $P \lor Q , \lnot Q \lor P .$   
3. Probar que no vale $P \vee Q \models Q .$ .   
4. Probar que $P \models Q \lor \neg Q$ .   
5. Probar que $\models P \Rightarrow P$ .

# Limitaciones del m´etodo sem´antico

Hay varios problemas con un enfoque puramente sem´antico:

Muy pocas l´ogicas tienen procedimientos de decisi´on como la l´ogica proposicional.

El conjunto de hip´otesis (axiomas) puede ser infinito.

No evidencia la relaci´on de la f´ormula con hip´otesis (e.g., d´onde es necesaria una hip´otesis).

Dif´ıcil reconocer resultados intermedios (lemas).

# Enfoque deductivo

Definir un sistema deductivo. ▶ Vamos a ver el sistema de deducci´on natural (existen otros):

Trabaja con afirmaciones de la forma:

![](images/366651c635e9eaef6a69c2d14ac54c83ac07a770b4760dd5f8009efceea6e57f.jpg)

A estas afirmaciones las denominamos juicios.

Informalmente, un juicio afirma que a partir de las hip´otesis en el contexto Γ es posible deducir la f´ormula de la tesis.

# Algunos juicios derivables

$$
P \lor Q , \lnot Q \vdash P \qquad \vdash P \Rightarrow P
$$

$$
Q \vdash \lnot Q \Rightarrow \lnot P \qquad P , Q \land R \vdash R \land P
$$

# Reglas de inferencia — axioma

El sistema de deducci´on natural tiene muchas reglas de inferencia. (Vamos de a poco)

# Axioma

# 24

# Ejemplo

$$
\overline { { P \Rightarrow Q , R \vdash P \Rightarrow Q } } ^ { \sf d \times } \quad \overline { { P , Q \land R , S \vdash } }
$$

Los siguientes juicios no se deducen de la regla ax:

$$
\vdash R \vdash P \Rightarrow P \land Q \vdash Q \land P \quad \lnot
$$

# Reglas de inferencia — conjunci´on

Introducci´on de la conjunci´on

$$
\frac { \textsf { r } \vdash \tau \quad \textsf { r } \vdash \sigma } { \textsf { r } \vdash \tau \land \sigma } \land _ { i }
$$

Eliminaci´on de la conjunci´on

$$
\frac { \Gamma \vdash \tau \land \sigma } { \Gamma \vdash \tau } \land _ { e _ { 1 } } \quad \frac { \Gamma \vdash \tau \land \sigma } { \Gamma \vdash \sigma } \land _ { e _ { 2 } }
$$

1. Dar una derivaci´on de $P \land Q \vdash Q \land P .$   
2. Dar una derivaci´on de $P \land ( Q \land R ) \vdash ( P \land Q ) \land R .$

# Reglas de inferencia — implicaci´on

Introducci´on de la implicaci´on

$$
\frac { \Gamma , \tau \vdash \sigma } { \Gamma \vdash \tau \Rightarrow \sigma } \Rightarrow _ { i }
$$

Eliminaci´on de la implicaci´on

$$
\frac { \Gamma \vdash \tau \Rightarrow \sigma \quad \Gamma \vdash \tau } { \Gamma \vdash \sigma } \Rightarrow _ { e }
$$

(modus ponens)

1. Dar una derivaci´on de ⊢ P ⇒ P   
2. Dar una derivaci´on de ⊢ $\cdot P \Rightarrow Q \Rightarrow ( Q \land P )$   
3. Dar una derivaci´on de $P \Rightarrow Q , Q \Rightarrow R \vdash P \Rightarrow R .$

# Reglas de inferencia — disyunci´on

# Introducci´on de la disyunci´on

$$
\frac { \Gamma \vdash \sigma } { \Gamma \vdash \tau \lor \sigma } \lor _ { i _ { 2 } }
$$

# Eliminaci´on de la disyunci´on

$$
\frac { \Gamma \vdash \tau \lor \sigma \quad \Gamma , \tau \vdash \rho \quad \Gamma , \sigma \vdash \rho } { \Gamma \vdash \rho } \lor _ { e }
$$

1. Dar una derivaci´on de ⊢ $P \Rightarrow ( P \lor P ) .$   
2. Dar una derivaci´on de $\vdash ( P \lor P ) \Rightarrow P .$   
3. Dar una derivaci´on de $P \lor Q \vdash Q \lor P .$

# Reglas de inferencia — falsedad

El conectivo ⊥ representa la falsedad (contradicci´on, absurdo).   
El conectivo ⊥ no tiene reglas de introducci´on.

Eliminaci´on del falso

(principio de explosi´on o ex falso quodlibet)

1. Dar una derivaci´on de $( P \lor Q ) \Rightarrow \bot \vdash P \Rightarrow Q$   
2. Dar una derivaci´on de $( P \land Q ) \Rightarrow \bot \vdash P \Rightarrow Q \Rightarrow R$   
3. Mostrar que hay infinitas derivaciones de ⊥ ⊢ ⊥.

# Reglas de inferencia — negaci´on

Introducci´on de la negaci´on

(reducci´on al absurdo intuicionista)

$$
\frac { \Gamma , \tau \vdash \bot } { \Gamma \vdash \lnot \tau } \lnot _ { i }
$$

Eliminaci´on de la negaci´on

$$
\frac { \Gamma \vdash \tau \quad \Gamma \vdash \lnot \tau } { \Gamma \vdash \bot } \lnot e
$$

1. Dar una derivaci´on de ⊢ $P \Rightarrow \neg \neg P$ .   
2. Dar una derivaci´on de $\vdash \neg ( P \land \neg P ) .$   
3. Dar una derivaci´on de $P \lor Q \vdash \neg ( \neg P \land \neg Q ) .$

# Deducci´on natural intuicionista (NJ) — todas la reglas

<table><tr><td>Introducción</td><td>ax 「,T├T Eliminacion</td></tr><tr><td>&gt;</td><td>「Tt&gt;σ 「ττ&gt;σ 0 Ai Ne1 「ττ&gt;σ</td></tr><tr><td></td><td>「,τ├σ 「ττ→σ 「├τ →i</td></tr><tr><td></td><td>e 「├τ→σ 「├T 「Tq</td></tr><tr><td></td><td>Vi Vi TTVC 「├T&lt;σ 「├p 0 「├」</td></tr><tr><td></td><td>「├T e 「,T├⊥ 「ττ 「├」τ</td></tr></table>

# Propiedades del sistema

# Teorema (Debilitamiento)

(weakening)

Si Γ ⊢ τ es derivable, entonces Γ, $\sigma \vdash \tau$ es derivable.

$$
\frac { \textsf { r } \vdash \tau } { \lceil , \sigma \vdash \tau \rceil } \mathsf { W }
$$

Se puede demostrar por inducci´on estructural en la derivaci´on.   
(Se har´a como ejercicio en la pr´actica).

# Ejemplo

$$
\frac { \frac { \setminus Q , R \vdash P \land Q } { P \land Q , R \vdash Q } \land _ { e _ { 2 } } } { P \land Q , R \vdash Q } \frac { \overline { { P \land Q , R \vdash P \land } } } { P \land Q , R \vdash }
$$

# Reglas derivadas

Veamos que las siguientes reglas se deducen de las anteriores.   
(No es necesario agregarlas al sistema deductivo).

# Modus tollens

$$
\frac { \Gamma \vdash \tau \Rightarrow \sigma \quad \Gamma \vdash \lnot \sigma } { \Gamma \vdash \lnot \tau } \mathsf { M T }
$$

$$
3 2
$$

Introducci´on de la doble negaci´on

# Principios de razonamiento cl´asicos

# Eliminaci´on de la doble negaci´on

¿Se puede deducir la siguiente regla a partir de las anteriores?

$$
\frac { \Gamma \vdash \lnot \lnot \tau } { \Gamma \vdash \tau } \lnot \lnot \ l _ { e }
$$

# Principio del tercero excluido

(Law of Excluded Middle)

¿Se puede deducir la siguiente regla a partir de las anteriores?

# No es posible deducir estas reglas de las anteriores.

Sin embargo, se pueden deducir la una de la otra. Veamos que:

1. Usando la regla LEM se puede deducir la regla ¬¬e.   
2. Usando la regla ¬¬e se puede deducir la regla LEM.

# Principios de razonamiento cl´asicos

Las reglas ¬¬e y LEM son principios de razonamiento cl´asicos. Otro principio de razonamiento cl´asico, equivalente a ¬¬e y LEM:

Reducci´on al absurdo cl´asico

(Proof by Contradiction)

$$
\frac { \Gamma , \lnot \tau ^ { \vdash } \bot } { \Gamma \vdash \tau } \mathsf { P B C }
$$

# Ejercicio

Ver que usando PBC se puede deducir LEM y viceversa.

$$
3 4
$$

# L´ogica intuicionista vs. l´ogica cl´asica

# Dos sistemas deductivos

NJ sistema de deducci´on natural intuicionista.   
NK sistema de deducci´on natural cl´asica. NK extiende a NJ con principios de razonamiento cl´asicos.   
Alcanza con agregar uno de ellos, por ejemplo $\neg \neg e$ .

Si un juicio es derivable en NJ, tambi´en es derivable en NK.

NJ es m´as restrictiva. No permite usar $\neg \neg e$ , LEM, PBC, etc.

Para hacer matem´atica, com´unmente usamos l´ogica cl´asica.

Inter´es de la l´ogica intuicionista en computaci´on

Permite razonar acerca de informaci´on. ¿Qu´e significa (hay vida en Marte ∨ ¬hay vida en Marte)? Las derivaciones en NJ se pueden entender como programas. NJ es la base de un lenguaje de programaci´on funcional.

# Deducci´on natural cl´asica (NK) — reglas completas

<table><tr><td></td><td>ax 「,T├T 「├T Introducci6n Eliminaci6n</td></tr><tr><td>&gt;</td><td>「├τ「├σ 「├T&gt;σ 「├T&gt;σ Ni Ne1 e2 「├T&gt;σ 「├T 「-o</td></tr><tr><td>→</td><td>「,T├σ 「├τ→σ 「├T →i e 「├T→σ 「-σ</td></tr><tr><td>V</td><td>「├T 「To Vi Vi</td></tr><tr><td>上</td><td>rtTVσ 「├TVo 「-p 「├」 Le 「-T</td></tr></table>

# Sistemas deductivos

# Deducci´on natural para l´ogica proposicional

Sem´antica bivaluada

$$
3 7
$$

# Correcci´on y completitud

Teorema (Correcci´on y completitud)

Son equivalentes:

1. Γ ⊢ τ es derivable en NK.   
2. Γ ⊨ τ

# Demostraci´on de correcci´on Γ ⊢NK τ implica Γ ⊨ τ

Supongamos que Γ ⊢ τ es derivable en NK.   
Demostramos que Γ ⊨ τ por inducci´on estructural en la derivaci´on.

Hay que analizar 13 casos, uno por cada regla de NK.

Por ejemplo, para la regla ⇒e :

$$
\frac { \Gamma \vdash \tau \Rightarrow \sigma \quad \Gamma \vdash \tau } { \Gamma \vdash \sigma } \Rightarrow _ { e }
$$

Queremos ver que ${ \Gamma } \models \sigma$

Sea v tal que $v \models \Gamma$ y veamos que $v \models \sigma$ .

Por HI sabemos que $\Gamma \models \tau \Rightarrow \sigma \lor \mathsf { q u e } \Gamma \models \tau .$

Como $v \models \Gamma$ tenemos que $v \models \tau \Rightarrow \sigma \lor v \models \tau .$

Intentar probar los 12 casos restantes.

# Demostraci´on Γ ⊢NK τ )

# Definici´on

1. Un contexto Γ determina una variable $P \in { \mathcal { P } }$ si vale que $P \in \Gamma \circ { \mathsf { q u e } } \neg P \in \Gamma .$

2. Un contexto Γ determina un conjunto de variables $X \subseteq { \mathcal { P } }$ si determina a todas las variables de $X$ .

Para probar el teorema de completitud, necesitamos:

# Lema principal

Si Γ determina a todas las variables que aparecen en $\tau$ , entonces:

1. O bien Γ ⊢ τ es derivable en NK.   
2. O bien Γ ⊢ ¬τ es derivable en NK.

Asumamos que el lema vale, lo demostraremos despu´es.

# Demostraci´on de completitud (Γ ⊨ τ implica Γ ⊢NK τ )

Supongamos que $\sigma _ { 1 } , \ldots , \sigma _ { n } \vdash \tau$ .   
Queremos ver que $\sigma _ { 1 } , \ldots , \sigma _ { n } \vdash \tau$ es derivable en NK.

Sea $\rho = ( \sigma _ { 1 } \land \dotsc \land \sigma _ { n } ) \Rightarrow \tau$ . Sabemos que ⊨ ρ. ¿Por qu´e? Alcanza con probar que ⊢ $\rho$ es derivable en NK. ¿Por qu´e?

Sea $X = \{ P _ { 1 } , \ldots , P _ { n } \}$ el conjunto de variables que aparecen en $\rho$ . Usando LEM y ∨e podemos considerar $2 ^ { n }$ casos, de la forma:

$$
\tilde { P } _ { 1 } , \ldots , \tilde { P } _ { n } \vdash \rho
$$

donde cada $\tilde { P } _ { j }$ es o bien $P _ { j }$ o bien $\neg P i$ .

Por el lema principal, se da uno de los dos casos siguientes:

1. O bien $\tilde { P } _ { 1 } , \ldots , \tilde { P } _ { n } \vdash \rho$ es derivable en NK (y listo).   
2. O bien $\tilde { P } _ { 1 } , \ldots , \tilde { P } _ { n } \vdash \lnot \rho$ es derivable en NK. Por correcci´on vale $\tilde { P } _ { 1 } , \ldots , \tilde { P } _ { n } \vdash \lnot \rho .$ Sea v una valuaci´on tal que $v ( P _ { i } ) = \mathbb { V }$ si y s´olo si $\tilde { P } _ { j } = P _ { j }$ . Luego $v \models \neg \rho$ . Absurdo pues sab´ıamos ⊨ $\rho$ .

# Demostraci´on del lema principal

Recordemos el enunciado:

# Lema principal

Si Γ determina a todas las variables que aparecen en $\tau$ , entonces:

1. O bien Γ ⊢ τ es derivable en NK.   
2. O bien Γ ⊢ ¬τ es derivable en NK.

Lo demostramos por inducci´on estructural en $\tau$ .   
Hay 6 casos $( P , \land , \Rightarrow , \lor , \bot , \neg ) .$ .

Por ejemplo, supongamos que $\tau = ( \sigma \wedge \rho )$ . Por hip´otesis inductiva sobre $\sigma$ , sabemos que:

1. O bien Γ ⊢ $\sigma$ es derivable en NK. Por hip´otesis inductiva sobre $\rho$ , sabemos que:

1.1 O bien Γ ⊢ $\rho$ es derivable en NK y tenemos $\Gamma \vdash \sigma \land \rho$ .   
1.2 O bien Γ ⊢ $\neg \rho$ es derivable en NK y tenemos $\Gamma \vdash \lnot ( \sigma \land \rho ) .$ .

2. O bien Γ ⊢ ¬σ es derivable en NK y tenemos $\Gamma \vdash \lnot ( \sigma \land \rho ) .$

Intentar probar los 5 casos restantes.

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

# Lecturas recomendadas

# Cap´ıtulo 1 del libro Huth y Ryan.

Logic in computer science: Modelling and reasoning about systems. Michael Huth y Mark Ryan. Cambridge University Press, 2004.

Cap´ıtulos 2 y 6 del libro de Sørensen y Urzyczyn. Morten Sørensen y Pawe l Urzyczyn. Lectures on the Curry–Howard Isomorphism. Elsevier, 2006.