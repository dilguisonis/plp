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

Ejemplos de afirmaciones que querr´ıamos hacer

El tipo (Bool -> Int) est´a sint´acticamente bien formado.

La expresi´on map tiene tipo ((a -> b) -> [a] -> [b]).

La expresi´on map tiene tipo ((a -> a) -> [a] -> [a]).

La expresi´on map tiene tipo Bool.

El programa while (true) {} no termina.

El resultado de evaluar (factorial 7) es 5040.

Los algoritmos quickSort y mergeSort son indistinguibles.

Queremos tener mecanismos para demostrar dichas afirmaciones.

En este contexto, las afirmaciones se llaman juicios.

# Sistemas deductivos

Un sistema deductivo sirve para razonar acerca de juicios.

Est´a dado por reglas de inferencia, de la forma:

⟨premisa1⟩ ⟨premisa2⟩ ⟨premisan⟩ ⟨nombre de la regla⟩ ⟨conclusi´on⟩

Las reglas que no tienen premisas $( n = 0 )$ se llaman axiomas.

Las premisas son condiciones suficientes para la conclusi´on.

▶ Lectura de arriba hacia abajo: si tenemos evidencia de que valen las premisas, podemos deducir que vale la conclusi´on.

Lectura de abajo hacia arriba: si queremos demostrar que vale la conclusi´on, alcanza con demostrar que valen las premisas.

$$
4
$$

# Sistemas deductivos

# Ejemplo — el sistema deductivo A

El sistema A predica sobre juicios de la forma “X > Y ”. Incluye tres axiomas:

y un esquema de regla, donde X , Y , Z son variables esquem´aticas (que se pueden instanciar de manera arbitraria):

$$
\frac { X > Y \quad Y > Z } { X > Z } \mathrm { t r a n s }
$$

Demostrar el juicio ⋆ > • de dos maneras distintas.

# Sistemas deductivos

Una derivaci´on es un ´arbol finito formado por reglas de inferencia.   
Parte de ciertas premisas y llega a una conclusi´on.

Un juicio es derivable si hay alguna derivaci´on sin premisas que lo concluye.

# Sistemas deductivos

# Ejemplo — f´ormulas

Suponemos dado un conjunto infinito de variables proposicionales:

$$
\mathcal { P } = \{ P , Q , R , \ldots \}
$$

El siguiente sistema predica sobre juicios de la forma “X form”.

$$
\operatorname { \mathrm { ~ \frac { \partial ~ } { \partial ~ M ~ } \mathsf { F P } ~ } } \frac { \tau \mathrm { \ F O R M ~ \hbar ~ \sigma \mathrm { ~ \ F O R M } } } { ( \tau \wedge \sigma ) \mathrm { \ F O R M ~ } } \mathsf { F } \wedge \frac { \tau \mathrm { \ F O R } } { ( \tau \mathsf { \tau } = \mathsf { \tau } _ { \mathsf { \tau } } ) \mathsf { F } \circ \tau }
$$

$$
7
$$

1. Derivar el juicio $\neg ( P \Rightarrow ( Q \Rightarrow P ) )$ form.

2. Demostrar que si $\tau$ form es un juicio derivable, entonces $\tau$ tiene el mismo n´umero de “(” que de “)”.

Proceder por inducci´on estructural en la derivaci´on.

# Sistemas deductivos

# Deducci´on natural para l´ogica proposicional

Sem´antica bivaluada

# 8

# F´ormulas de la l´ogica proposicional

Las f´ormulas son las expresiones que se pueden generar a partir de la siguiente gram´atica:

$$
\dots : : = \ P \ \mid \ ( \tau \wedge \sigma ) \ \mid \ ( \tau \Rightarrow \sigma ) \ \mid \ ( \tau \vee \sigma
$$

# Observaci´on

La gram´aticas definen sistemas deductivos de manera abreviada.

Una expresi´on $\tau$ se puede generar a partir de la gram´atica de arriba si y s´olo si el juicio $\tau$ form es derivable en el sistema de antes.

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

$$
9
$$

$\tau \vee ( \sigma \vee \rho ) ~ \neq ~ ( \tau \vee \sigma ) \vee \rho ~ \tau \wedge \sigma$ ̸= σ ∧ τ

# Contextos y juicios

Un contexto es un conjunto finito de f´ormulas.

Los notamos con letras griegas may´usculas $( \Gamma , \Delta , \Sigma , \ldots ) .$ Por ejemplo:

$$
\Gamma = \{ P \Rightarrow Q , \neg Q \}
$$

Generalmente omitimos las llaves; p. ej.: $P \Rightarrow Q , \neg Q .$ .

El sistema de deducci´on natural predica sobre juicios de la forma:

$$
 { \{ \mathrm { ~  ~ { ~ \cal ~ { ~ r ~ } ~ } ~ } }   { \Vdash }  { \mathrm { ~  ~ { ~ \cal ~ { ~ r ~ } ~ } ~ } }
$$

Informalmente, un juicio afirma que a partir de las hip´otesis en el contexto Γ es posible deducir la f´ormula de la tesis.

Por ejemplo, los siguientes van a ser juicios derivables:

$$
\Rightarrow Q \vdash \lnot Q \Rightarrow \lnot P \quad \quad \ l , Q \land R \vdash R \land
$$

# Reglas de inferencia — axioma

El sistema de deducci´on natural tiene muchas reglas de inferencia. (Vamos de a poco)

# Axioma

# Ejemplo

# 11

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
\frac { \textsf { r } \vdash \tau \vdash \sigma } { \textsf { r } \vdash \tau \land \sigma } \land _ { i }
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

(modus ponens)

$$
\frac { \Gamma \vdash \tau \Rightarrow \sigma \quad \Gamma \vdash \tau } { \Gamma \vdash \sigma } \Rightarrow _ { e }
$$

1. Dar una derivaci´on de ⊢ P ⇒ P   
2. Dar una derivaci´on de ⊢ $\cdot P \Rightarrow Q \Rightarrow ( Q \land P )$   
3. Dar una derivaci´on de $P \Rightarrow Q , Q \Rightarrow R \vdash P \Rightarrow R .$

# 13

# Reglas de inferencia — disyunci´on

Introducci´on de la disyunci´on

$$
\frac { \Gamma \vdash \tau } { \Gamma \vdash \tau \lor \sigma } \lor _ { i _ { 1 } } \quad \frac { \Gamma \vdash \sigma } { \Gamma \vdash \tau \lor \sigma } \lor _ { i _ { 2 } }
$$

Eliminaci´on de la disyunci´on

$$
^ { 1 4 }
$$

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
\frac { \Gamma \vdash \tau \quad \Gamma \vdash \lnot \tau } { \Gamma \vdash \bot } \lnot _ { e }
$$

1. Dar una derivaci´on de ⊢ $P \Rightarrow \neg \neg P$ .   
2. Dar una derivaci´on de $\vdash \neg ( P \land \neg P ) .$   
3. Dar una derivaci´on de $P \lor Q \vdash \neg ( \neg P \land \neg Q ) .$

# Deducci´on natural intuicionista (NJ) — reglas completas

<table><tr><td>Introducción</td><td>ax ，T├T Eliminación</td></tr><tr><td>&gt;</td><td>「ττ&gt;σ 「ττ&gt;q 0 Ai Ne1 Ne2 「ττ&gt;σ</td></tr><tr><td></td><td>「,τ├σ 「ττ⇒σ「├τ →i</td></tr><tr><td></td><td>e 「ττ→σ 「T9 「├T To 「├τνσ 「,τ├ρ 「,σ├</td></tr><tr><td></td><td>Vi Vi Ve ttvσ ├TVσ 「├p 「├⊥ TT e</td></tr></table>

# 17

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

# L´ogica intuicionista vs. l´ogica cl´asica

# Dos sistemas deductivos

NJ sistema de deducci´on natural intuicionista.   
NK sistema de deducci´on natural cl´asica. NK extiende a NJ con principios de razonamiento cl´asicos.   
Alcanza con agregar uno de ellos, por ejemplo $\neg \neg e$ .

Si un juicio es derivable en NJ, tambi´en es derivable en NK.

NJ es m´as restrictiva. No permite usar $\neg \neg _ { e }$ , LEM, PBC, etc.

Para hacer matem´atica, com´unmente usamos l´ogica cl´asica.

Inter´es de la l´ogica intuicionista en computaci´on

Permite razonar acerca de informaci´on. ¿Qu´e significa (hay vida en Marte ∨ ¬hay vida en Marte)? Las derivaciones en NJ se pueden entender como programas. NJ es la base de un lenguaje de programaci´on funcional.

$$
^ { 2 2 }
$$

# Deducci´on natural cl´asica (NK) — reglas completas

<table><tr><td></td><td>ax 「,T├T 「├T Introducci6n Eliminaci6n</td></tr><tr><td>&gt;</td><td>「├τ「├σ 「├T&gt;σ 「├T&gt;σ Ni Ne1 e2 「├T&gt;σ 「├T 「-o</td></tr><tr><td>→</td><td>「,T├σ 「├τ→σ 「├T →i e 「├T→σ 「-σ</td></tr><tr><td>V</td><td>「├T 「To Vi Vi</td></tr><tr><td>上</td><td>rtTVσ 「├TVo 「-p 「├」 Le 「-T</td></tr></table>

# Sistemas deductivos

# Deducci´on natural para l´ogica proposicional

Sem´antica bivaluada

$$
2 4
$$

# Valuaciones

Una valuaci´on es una funci´on $v : \mathcal { P }  \{ \mathtt { V } , \mathtt { F } \}$ que asigna valores de verdad a las variables proposicionales.

Una valuaci´on v satisface una f´ormula $\tau$ si $v \models \tau$ , donde:

$$
\begin{array} { r l } { v \vdash P } & { { } { \mathrm { ~ s i ~ y ~ s \ ' { } \thinspace { \mathrm { ~ s } } \acute { } 0 } } { \mathrm { ~ s i ~ } } \quad v ( P ) = \mathsf { V } } \\ { v \vdash \tau \land \sigma } & { { } { \mathrm { ~ s i ~ y ~ s \ ' { } \circ { \mathrm { ~ l } } { \mathrm { ~ o ~ s i ~ } } } } \quad v \vdash \tau { \mathrm { ~ y ~ } } v \vdash \sigma } \\ { \vdash \tau \Rightarrow \sigma } & { { } { \mathrm { ~ s i ~ y ~ s \ ' { } \circ { \mathrm { ~ l } } { \mathrm { ~ o ~ s i ~ } } } } \quad v \vdash \tau \circ v \vdash \sigma } \\ { v \vdash \tau \lor \sigma } & { { } { \mathrm { ~ s i ~ y ~ s \ " { \mathrm { ~ s } } \acute { } 0 } } { \mathrm { ~ s i ~ } } \quad v \vdash \tau \circ v \vdash \sigma } \\ { v \vdash \bot } & { { } { \mathrm { ~ n u n c a ~ v a l e } } } \\ { v \vdash \tau } & { { } { \mathrm { ~ s i ~ y ~ s \ " { \mathrm { ~ s i ~ } } { \mathrm { ~ s i ~ } } } } \quad v \vdash \tau } \end{array}
$$

Una valuaci´on v satisface un contexto Γ (notaci´on: v ⊨ Γ) si y s´olo si v satisface a todas las f´ormulas de Γ.

Un contexto Γ satisface una f´ormula $\tau$ (notaci´on: Γ ⊨ τ ) si y s´olo si cualquier valuaci´on v que satisface a Γ tambi´en satisface a $\tau$ .

# Ejemplo

1. Probar que $P \land Q \models P$ .   
2. Probar que $P \lor Q , \lnot Q \lor P .$   
3. Probar que no vale $P \lor Q \models Q$ .   
4. Probar que $P \models Q \lor \neg Q$ .

# Correcci´on y completitud

Teorema (Correcci´on y completitud)

Son equivalentes:

1. Γ ⊢ τ es derivable en NK.   
2. Γ ⊨ τ

$$
^ { 2 7 }
$$

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
2. O bien $\tilde { P } _ { 1 } , \ldots , \tilde { P } _ { n } \vdash \lnot \rho$ es derivable en NK. Por correcci´on vale $\tilde { P } _ { 1 } , \ldots , \tilde { P } _ { n } \vdash \lnot \rho .$ Sea v una valuaci´on tal que $v ( P _ { i } ) = \mathbb { V }$ si y s´olo si $\tilde { P } _ { j } = P _ { j }$ . Luego $v \models \neg \rho$ . Absurdo pues sab´ıamos ⊨ ρ.

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
1.2 O bien Γ ⊢ $\neg \rho$ es derivable en NK y tenemos $\Gamma \vdash \lnot ( \sigma \land \rho ) .$

2. O bien Γ ⊢ ¬σ es derivable en NK y tenemos $\Gamma \vdash \lnot ( \sigma \land \rho ) .$

Intentar probar los 5 casos restantes.

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

# Lectura recomendada

Cap´ıtulos 2 y 6 del libro de Sørensen y Urzyczyn.

Morten Sørensen y Pawe l Urzyczyn. Lectures on the Curry–Howard Isomorphism   
Elsevier, 2006.