# Paradigmas de Programaci´on

# Resoluci´on l´ogica

2do cuatrimestre de 2025 Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

# 1

# Breve introducci´on a Prolog

Resoluci´on para l´ogica proposicional

Resoluci´on para l´ogica de primer orden

$$
2
$$

# Introducci´on a Prolog

Ejemplo — genealog´ıa del pante´on mitol´ogico griego

padre(cronos, zeus).   
padre(zeus, atenea).   
padre(zeus, hefesto).   
padre(zeus, ares).   
abuelo(X, Y) :- padre(X, Z), padre(Z, Y). ?- padre(zeus, atenea). ?- abuelo(cronos, X). true. >> X = atenea ; ?- padre(zeus, cronos). >> X = hefesto ; >> false. >> X = ares. ?- abuelo(X, atenea). ?- abuelo(X, Y). >> $\texttt { X } =$ cronos. >> X = cronos, $\begin{array} { r l } { \mathsf { Y } } & { { } = } \end{array}$ atenea ; $\ ? -$ abuelo(X, zeus). >> X = cronos, $\begin{array} { r l } { \mathsf { Y } } & { { } = } \end{array}$ hefesto ;   
>> false. >> X = cronos, $\begin{array} { r l } { \mathsf { Y } } & { { } = } \end{array}$ ares.

# Introducci´on a Prolog

$$
4
$$

Prolog opera con t´erminos de primer orden:

X Y succ(succ(zero)) bin(I, R, D)

Las f´ormulas at´omicas son de la forma pred(t1, . . . , tn):

padre(zeus, atenea) suma(zero, X, X)

# Introducci´on a Prolog

Un programa es un conjunto de reglas. Cada regla es de la forma:

donde $\sigma , \tau _ { 1 } , \ldots , \tau _ { n }$ son f´ormulas at´omicas.

Las reglas en las que $n = 0$ se llaman hechos y se escriben:

$\sigma$ . Ej.: padre(zeus, ares).

Las reglas tienen la siguiente interpretaci´on l´ogica:

$$
\forall \mathtt { X } _ { 1 } \dots \forall \mathtt { X } _ { k } . ( ( \tau _ { 1 } \wedge \dots \wedge \tau _ { n } ) \Rightarrow \sigma )
$$

donde $\mathtt { X } _ { 1 } , \ldots , \mathtt { X } _ { k }$ son todas las variables libres de las f´ormulas.

Ej.: $\forall \mathbf { X } . \forall \mathbf { Y } . \forall \mathbf { Z }$ . ((padre(X, Z) ∧ padre(Z, Y)) $\Rightarrow$ abuelo(X, Y))

# Introducci´on a Prolog

Una consulta es de la forma:

Las consultas tienen la siguiente interpretaci´on l´ogica:

$$
\exists \mathbf { X } _ { 1 } \dots \exists \mathbf { X } _ { k } . \left( \sigma _ { 1 } \land \dots \land \sigma _ { n } \right)
$$

donde $\mathtt { X } _ { 1 } , \ldots , \mathtt { X } _ { k }$ son todas las variables libres de las f´ormulas.

El entorno de Prolog busca demostrar la f´ormula $\tau$ de la consulta. En realidad busca refutar ¬τ , o sea, demostrar $\neg \tau \Rightarrow \bot$ La b´usqueda de la refutaci´on se basa en el m´etodo de resoluci´on.

# Breve introducci´on a Prolog

Resoluci´on para l´ogica proposicional

Resoluci´on para l´ogica de primer orden

# 7

# Resoluci´on para l´ogica proposicional

Entrada: una f´ormula $\sigma$ de la l´ogica proposicional.   
Salida: un booleano que indica si $\sigma$ es v´alida.

# M´etodo de resoluci´on

1. Escribir ¬σ como un conjunto $\mathcal { C }$ de cl´ausulas. (Pasar a forma clausal ).   
2. Buscar una refutaci´on de C. Una refutaci´on de $\mathcal { C }$ es una derivaci´on de C ⊢ ⊥.

Si se encuentra una refutaci´on de $\mathcal { C }$ :

Vale ¬σ ⊢ ⊥. Es decir, ¬σ es insatisfactible/contradicci´on.

Luego vale ⊢ σ. Es decir, $\sigma$ es v´alida/tautolog´ıa.

Si no se encuentra una refutaci´on de $\mathcal { C }$ :

No vale $\neg \sigma \vdash \bot$ . Es decir, $\sigma$ es satisfactible.

Luego no vale ⊢ $\sigma$ . Es decir, $\sigma$ no es v´alida.

# Pasaje a forma clausal

Una f´ormula se pasa a forma clausal aplicando las siguientes reglas.   
Todas las reglas transforman la f´ormula en otra equivalente.

Paso 1. Deshacerse del conectivo $" \Rightarrow "$ :

$$
\begin{array} { r } { \sigma \Rightarrow \boldsymbol { \tau } \Rightarrow \neg \sigma \lor \boldsymbol { \tau } } \end{array}
$$

La f´ormula resultante s´olo usa los conectivos $\{ \neg , \lor , \land \}$ . Paso 2. Empujar el conectivo “¬” hacia adentro:

$$
\begin{array} { l r } { \neg ( \sigma \wedge \tau ) } & { \to } & { \neg \sigma \vee \neg \tau } \\ { \neg ( \sigma \vee \tau ) } & { \to } & { \neg \sigma \wedge \neg \tau } \\ { \neg \neg \sigma } & { \to } & { \sigma } \end{array}
$$

La f´ormula resultante est´a en forma normal negada (NNF):

$$
\sigma _ { \mathrm { n n f } } : : = \mathsf { P } \mid \neg \mathsf { P } \mid \sigma _ { \mathrm { n n f } } \wedge \sigma _ { \mathrm { n n f } } \mid \sigma _ { \mathrm { n n f } } \vee \sigma _ { \mathrm { n } }
$$

# Pasaje a forma clausal

Paso 3. Distribuir ∨ sobre ∧:

$$
\begin{array} { r } { \begin{array} { l l l } { \sigma \vee ( \tau \wedge \rho ) } & {  } & { ( \sigma \vee \tau ) \wedge ( \sigma \vee \rho ) } \\ { ( \sigma \wedge \tau ) \vee \rho } & {  } & { ( \sigma \vee \rho ) \wedge ( \tau \vee \rho ) } \end{array} } \end{array}
$$

La f´ormula resultante est´a en forma normal conjuntiva (CNF). Una f´ormula en CNF es conjunci´on de disyunciones de literales (asumiendo que permitimos asociar libremente ∧ y ∨):

F´ormulas en CNF Cl´ausulas $\begin{array} { l l l } { \sigma _ { \mathrm { c n f } } } & { : : = } & { \left( \kappa _ { 1 } \wedge \kappa _ { 2 } \wedge \ldots \wedge \kappa _ { n } \right) } \\ { \kappa } & { : : = } & { \left( \ell _ { 1 } \vee \ell _ { 2 } \vee \ldots \vee \ell _ { m } \right) } \\ { \ell } & { : : = } & { \mathbf { P } \mid \lnot \mathbf { P } } \end{array}$ Literales

# Pasaje a forma clausal

Por ´ultimo, usando el hecho de que la disyunci´on $( \vee )$ es:

$$
\begin{array} { l } { \sigma \vee ( \tau \vee \rho ) \longleftrightarrow ( \sigma \vee \tau ) \vee \rho } \\ { \sigma \vee \tau \longleftrightarrow \tau \vee \sigma } \\ { \sigma \vee \sigma \longleftrightarrow \sigma } \end{array}
$$

notamos una cl´ausula (disyunci´on de literales) como un conjunto:

$$
^ { \prime } \ell _ { 2 } \vee \ldots \vee \ell _ { n } \big ) \quad \mathsf { s e ~ n o t a } \quad \{ \ell _ { 1 } , \ell _ { 2 } , \ldots , \ell _ { n } \}
$$

An´alogamente, usando el hecho de que la conjunci´on $( \wedge )$ es asociativa, conmutativa e idempotente notamos una conjunci´on de cl´ausulas como un conjunto:

$$
\begin{array} { r l } { \mathrm { ~ : } 2 \ r \wedge \ldots \wedge \kappa _ { n } \big ) } & { { } \mathrm { ~ s e ~ n o t a ~ } \quad \big \{ \kappa _ { 1 } , \kappa _ { 2 } , \ldots , \kappa _ { r } } \end{array}
$$

$$
\mathsf { P a s a j e \textsf { a f o r m a } c l a u s a l }
$$

# Resumen — pasaje a forma clausal

1. Reescribir $\Rightarrow$ usando ¬ y ∨.   
2. Pasar a f.n. negada, empujando ¬ hacia adentro.   
3. Pasar a f.n. conjuntiva, distribuyendo ∨ sobre ∧.

# Pasaje a forma clausal

# Ejemplo — pasaje a forma clausal

Queremos ver que $\sigma \equiv ( ( ( \boldsymbol { \mathsf { P } } \Rightarrow ( \boldsymbol { \mathsf { Q } } \land \boldsymbol { \mathsf { R } } ) ) \land \boldsymbol { \mathsf { P } } ) \Rightarrow \boldsymbol { \mathsf { Q } } )$ es v´alida. Primero la negamos: $\neg \sigma \equiv \neg ( ( ( \boldsymbol { \mathsf { P } } \Rightarrow ( \boldsymbol { \mathsf { Q } } \land \boldsymbol { \mathsf { R } } ) ) \land \boldsymbol { \mathsf { P } } ) \Rightarrow \boldsymbol { \mathsf { Q } } ) .$ Pasamos ¬σ a forma clausal:

# 13

$$
{ \begin{array} { r l } & { \lnot ( (  ( \mathbf { Q } \land \mathbf { R } ) ) \land \mathbf { P } ) \Rightarrow \mathbf { Q } ) } \\ { \implies } & { \lnot ( \lnot ( \lnot ( \mathbf { \lnot ~ P } \lor ( \mathbf { Q } \land \mathbf { R } ) ) \land \mathbf { P } ) \lor \mathbf { Q } ) } \\ { \implies } & { ( \lnot \ l ( \lnot ( \lnot \mathbf { P } \lor ( \mathbf { Q } \land \mathbf { R } ) ) \land \mathbf { P } ) \land \lnot \mathbf { Q } ) } \\ { \implies } & { ( ( \lnot \ l \mathbf { P } \lor ( \mathbf { Q } \land \mathbf { R } ) ) \land \mathbf { P } ) \land \lnot \mathbf { Q } ) } \\ { \implies } & { ( ( \lnot \mathbf { P } \lor \mathbf { Q } ) \land ( \lnot \mathbf { P } \lor \mathbf { R } ) ) \land \mathbf { P } ) \land \lnot \mathbf { Q } } \\ { \implies } & { ( \lnot \mathbf { P } \lor \mathbf { Q } ) \land ( \lnot \mathbf { P } \lor \mathbf { R } ) \land \mathbf { P } \land \lnot \mathbf { Q } } \\ { \implies } & { ( \lnot \mathbf { P } \lor \mathbf { Q } ) \land ( \lnot \mathbf { P } \lor \mathbf { R } ) \land \mathbf { P } \land \lnot \mathbf { Q } } \end{array} }
$$

La forma clausal es:

$$
\mathcal { C } = \{ \{ \neg { \bf P } , { \bf Q } \} , \{ \neg { \bf P } , { \bf R } \} , \{ { \bf P } \} , \{ \neg { \bf Q } \} \}
$$

# Refutaci´on

Una vez obtenido un conjunto de cl´ausulas $\mathcal { C } = \{ \kappa _ { 1 } , . . . , \kappa _ { n } \}$ , se busca una refutaci´on, es decir, una demostraci´on de C ⊢ ⊥.

El m´etodo de refutaci´on se basa en la siguiente regla de deducci´on:

# Regla de resoluci´on

$$
\frac { \lor \ell _ { 1 } \lor \dots \lor \ell _ { n } \lor \ell _ { 1 } \lor \ell _ { 1 } ^ { \prime } \lor \dots \lor \ell _ { m } ^ { \prime } } { \ell _ { 1 } \lor \dots \lor \ell _ { n } \lor \ell _ { 1 } ^ { \prime } \lor \dots \lor \ell _ { m } ^ { \prime } }
$$

Escrita con notaci´on de cl´ausulas:

$$
\frac { \{ \mathbf { P } , \boldsymbol { \ell } _ { 1 } , \dots , \boldsymbol { \ell } _ { n } \} \{ \neg \mathbf { P } , \boldsymbol { \ell } _ { 1 } ^ { \prime } , \dots , \boldsymbol { \ell } _ { m } ^ { \prime } \} } { \{ \boldsymbol { \ell } _ { 1 } , \dots , \boldsymbol { \ell } _ { n } , \boldsymbol { \ell } _ { 1 } ^ { \prime } , \dots , \boldsymbol { \ell } _ { m } ^ { \prime } \} }
$$

La conclusi´on se llama la resolvente de las premisas.

$$
^ { 1 4 }
$$

# Refutaci´on

Entrada: un conjunto de cl´ausulas $\mathcal { C } _ { 0 } = \{ \kappa _ { 1 } , . . . , \kappa _ { n } \}$ . Salida: SAT/INSAT indicando si $\mathcal { C } _ { 0 }$ es insatisfactible $( { \mathcal { C } } _ { 0 } \vdash \bot ) .$

# Algoritmo de refutaci´on

Sea $\mathcal { C } : = \mathcal { C } _ { 0 }$ . Repetir mientras sea posible:

1. Si $\{ \} \in { \mathcal { C } }$ , devolver INSAT.

2. Elegir dos cl´ausulas $\kappa , \kappa ^ { \prime } \in \mathcal { C }$ , tales que:

$$
\begin{array} { l } { \kappa = \{  { \mathsf { P } } , \ell _ { 1 } , \dots , \ell _ { n } \} } \\ { \kappa ^ { \prime } = \{ \neg  { \mathsf { P } } , \ell _ { 1 } ^ { \prime } , \dots , \ell _ { m } ^ { \prime } \} } \end{array}
$$

La resolvente $\rho = \{ \ell _ { 1 } , \ldots , \ell _ { n } , \ell _ { 1 } ^ { \prime } , \ldots , \ell _ { m } ^ { \prime } \}$ no est´a en C.

Si no es posible, devolver SAT.

3. Tomar ${ \mathcal { C } } : = { \mathcal { C } } \cup \{ \rho \}$ y volver al paso 1.

# Ejemplo — m´etodo de resoluci´on

Queremos demostrar $\sigma \equiv ( ( ( { \bf P } \Rightarrow ( { \bf Q } \land { \bf R } ) ) \land { \bf P } ) \Rightarrow { \bf Q } ) .$ Equivalentemente, veamos que ¬σ ⊢ ⊥.   
La forma clausal de $\neg \sigma$ era: Luego C ⊢ ⊥.   
Luego ¬σ ⊢ ⊥.   
Luego ⊢ σ.

![](images/ac3eb50d3dc77e2fbf2dabe4f34d1f2b080d101fa6061cd54c2f424d7a010ba7.jpg)

![](images/090506cc983a299be6422d444b6ac70308b7fab72d4aeadc71430fa458ad42a3.jpg)

# Correcci´on del m´etodo de resoluci´on proposicional

Teorema (correcci´on del pasaje a forma clausal)

Dada una f´ormula $\sigma$ :

1. El pasaje a forma clausal termina.   
2. El conjunto de cl´ausulas $\mathcal { C }$ obtenido es equivalente a $\sigma$ . Es decir, ⊢ $\sigma \iff { \mathcal { C } } .$ .

$$
^ { 1 7 }
$$

# Correcci´on del m´etodo de resoluci´on proposicional

# Teorema (correcci´on del algoritmo de refutaci´on)

Dado un conjunto de cl´ausulas $\mathcal { C } _ { 0 }$

1. El algoritmo de refutaci´on termina.   
2. El algoritmo retorna INSAT si y s´olo si $\mathcal { C } _ { 0 } \vdash \bot$ .

Ideas de la demostraci´on:

1. Si en $\mathcal { C } _ { 0 }$ aparecen $n$ literales distintos, se pueden formar $2 ^ { n }$ cl´ausulas posibles. Cada paso agrega una cl´ausula. Luego el algoritmo no puede tomar m´as de de $2 ^ { n }$ pasos.

$2 . ( \Rightarrow )$ . El algoritmo preserva el invariante de que para cada cl´ausula $\kappa \in { \mathcal { C } }$ se tiene que $\mathcal { C } _ { 0 } \vdash \kappa$ . La observaci´on clave es que si $\kappa , \kappa ^ { \prime } \in \mathcal { C }$ y $\rho$ es la resolvente, entonces $\kappa , \kappa ^ { \prime } \vdash \rho$ .

$2 . ( \Leftarrow ) .$ . M´as dif´ıcil. Se puede probar por inducci´on en el n´umero de variables proposicionales que aparecen en $\mathcal { C } _ { 0 }$ .

Ver Handbook of Proof Theory. Samuel R. Buss (editor). Elsevier, 1998. Secci´on 2.6.

# Breve introducci´on a Prolog

Resoluci´on para l´ogica proposicional

Resoluci´on para l´ogica de primer orden

# Resoluci´on para l´ogica de primer orden

Entrada: una f´ormula $\sigma$ cerrada de la l´ogica de primer ord Salida: un booleano indicando si $\sigma$ es v´alida. Si $\sigma$ es v´alida, el m´etodo siempre termina. Si $\cdot$ no es v´alida, el m´etodo puede no terminar.

M´etodo de resoluci´on de primer orden (Procedimiento de semi-decisi´on)

1. Escribir ¬σ como un conjunto $\mathcal { C }$ de cl´ausulas. 2. Buscar una refutaci´on de C. Si existe alguna refutaci´on, el m´etodo encuentra alguna. Si no existe una refutaci´on, el m´etodo puede “colgarse”

# Pasaje a forma clausal en l´ogica de primer orden

Una f´ormula se pasa a forma clausal aplicando las siguientes reglas. Paso 1. Deshacerse del conectivo “⇒”:

$$
\begin{array} { r } { \sigma \Rightarrow \boldsymbol { \tau } \quad \Rightarrow \quad \supset \ : \sigma \vee \boldsymbol { \tau } } \end{array}
$$

La f´ormula resultante s´olo usa los conectivos $\{ \neg , \vee , \wedge , \forall , \exists \} .$ Paso 2. Empujar el conectivo “¬” hacia adentro:

$$
\begin{array} { l l l } { \neg ( \sigma \wedge \tau ) } & { \to } & { \neg \sigma \vee \neg \tau } \\ { \neg ( \sigma \vee \tau ) } & { \to } & { \neg \sigma \wedge \neg \tau } \\ { \neg \neg \sigma } & { \to } & { \sigma } \end{array}
$$

La f´ormula resultante est´a en forma normal negada (NNF):

σnnf ::= P( $\begin{array} { r l r l } { | } & { { } | } & { \qquad } & { { } | \ \sigma _ { \mathrm { n n f } } \wedge \sigma _ { \mathrm { n n f } } \ | \ \sigma _ { \mathrm { r e f } } } \end{array}$ nnf ∨ σnnf ∀X.

# Pasaje a forma clausal en l´ogica de primer orden

Paso 3. Extraer los cuantificadores (“∀/∃”) hacia afuera. Se asume siempre $\mathtt { X } \notin \mathsf { f v } ( \tau )$ :

(∀X. σ (∀X. σ ${ \begin{array} { r l } { { \mathord { / { \vphantom { | { \mathrm { X } } }  }  } } ( { \mathord { | { \mathrm { X } }  }  } ( { \sigma } \wedge \tau )  } & { \tau \wedge ( { \forall { \mathrm { X } } } . \sigma ) \longrightarrow } \\ { { \mathrm { V } } \tau \implies { \forall { \mathrm { X } } } . ( { \sigma } \vee \tau ) } & { \tau \vee ( { \forall { \mathrm { X } } } . \sigma ) \longrightarrow } \\ { { \mathrm { I } } \wedge \tau \implies \exists { \mathrm { X } } . ( { \sigma } \wedge \tau ) } & { \tau \wedge ( \exists { \mathrm { X } } . \sigma ) \longrightarrow } \\ { { \mathrm { V } } \tau \implies \exists { \mathrm { X } } . ( { \sigma } \vee \tau ) } & { \tau \vee ( \exists { \mathrm { X } } . \sigma ) \longrightarrow } \end{array} }$ ∀X. (τ ∧ σ) ∀X. (τ ∨ σ) (∃X. σ ∃X. (τ ∧ σ) (∃X. σ ∃X. (τ ∨ σ)

Todas las reglas transforman la f´ormula en otra equivalente.

La f´ormula resultante est´a en forma normal prenexa:

$$
\sigma _ { \mathrm { p r e } } : : = \mathcal { Q } _ { 1 } \mathtt { X } _ { 1 } . \mathcal { Q } _ { 2 } \mathtt { X } _ { 2 } . \ . \ . . \ \mathcal { Q } _ { n } \mathtt { X } _ { n } . \tau
$$

donde cada $\mathcal { Q } _ { j }$ es un cuantificador {∀, ∃} y $\tau$ representa una f´ormula en NNF libre de cuantificadores.

# Pasaje a forma clausal en l´ogica de primer orden

Paso 4. Deshacerse de los cuantificadores existenciales (∃). Para ello se usa la siguiente t´ecnica de Herbrand y Skolem:

Lema (Skolemizaci´on)

∀X. ∃Y. $\sigma ( { \tt X } , { \tt Y } )$ es sat. sii ∀X $\therefore \sigma ( { \mathbb X } , { \mathbb f } ( { \mathbb X } ) )$ es sat. ∀X1X2. ∃Y. $\sigma ( { \tt X } _ { 1 } , { \tt X } _ { 2 } , { \tt Y } )$ es sat. sii $\forall { \mathrm { X } } _ { 1 } { \mathrm { X } } _ { 2 } . \sigma { \big ( } { \mathrm { X } } _ { 1 } , { \mathrm { X } } _ { 2 } , { \mathrm { f } } { \big ( } { \mathrm { X } } _ { 1 } , { \mathrm { X } } _ { 2 } { \big ) } { \big ) }$ es sat. ..

∀⃗X. ∃Y. $\sigma ( \vec { \tt X } , \tt Y )$ es sat. sii $\forall \vec { \bf X } . \sigma ( \vec { \bf X } , { \bf f } ( \vec { \bf X } ) )$ es sat.

El lado izquierdo es una f´ormula en el lenguaje $\mathcal { L }$ .   
El lado derecho es una f´ormula el lenguaje ${ \mathcal { L } } \cup \{ \mathbf { f } \}$ .

Caso particular cuando |⃗X| = 0

∃Y. $\sigma ( \Upsilon )$ es sat. sii $\sigma ( \mathsf { c } )$ es sat.

El lenguaje se extiende con una nueva constante c.

$$
^ { 2 3 }
$$

# Pasaje a forma clausal en l´ogica de primer orden

La Skolemizaci´on preserva la satisfactibilidad.   
Pero no siempre produce f´ormulas equivalentes.   
Es decir no preserva la validez.

Ejemplo — la Skolemizaci´on no preserva la validez

$$
\begin{array} { r l r } { \underbrace { \exists \mathbf { X } . \left( \mathbf { P } ( 0 ) \Rightarrow \mathbf { P } ( \mathrm { X } ) \right) } _ { \forall \mathrm { \bar { d } } \mathrm { l i d a } } } & { } & { \underbrace { \mathbf { P } ( 0 ) \Rightarrow \mathbf { P } ( \mathrm { c } ) } _ { \mathrm { i n v \bar { d } } \mathrm { l i d a } } } \end{array}
$$

# Pasaje a forma clausal en l´ogica de primer orden

Dada una f´ormula en forma normal prenexa, se aplica la regla:

$$
\begin{array} { r l r } { \Upsilon . \sigma } & { { }  } & { \forall \Upsilon _ { 1 } . . . \forall \Upsilon _ { n } . \sigma \big \{ \Upsilon : = { \bf f } \big ( \Upsilon _ { 1 } , . . . } \end{array}
$$

donde f es un s´ımbolo de funci´on nuevo de aridad $n \geq 0$

La f´ormula resultante est´a en forma normal de Skolem:

$$
\sigma _ { \mathrm { S k } } : : = \forall \mathtt { X } _ { 1 } \mathtt { X } _ { 2 } \dots \mathtt { X } _ { n } . \tau
$$

donde $\tau$ representa una f´ormula en NNF libre de cuantificadores.

# Pasaje a forma clausal en l´ogica de primer orden

Paso 5. Dada una f´ormula en forma normal de Skolem:

se pasa $\tau$ a forma normal conjuntiva usando las reglas ya vistas:

$$
\begin{array} { r } { \begin{array} { l l l } { \sigma \vee ( \tau \wedge \rho ) } & {  } & { ( \sigma \vee \tau ) \wedge ( \sigma \vee \rho ) } \\ { ( \sigma \wedge \tau ) \vee \rho } & {  } & { ( \sigma \vee \rho ) \wedge ( \tau \vee \rho ) } \end{array} } \end{array}
$$

El resultado es una f´ormula de la forma:

$$
\begin{array}{c} \begin{array} { r } { \forall \mathtt { X } _ { 1 } \dotsc \dotsc \mathtt { X } _ { n } . } \\ { \forall \mathtt { X } _ { 1 } \dotsc \dotsc \mathtt { X } _ { n } . } \\ { \dotsc \dotsc \dotsc } \\ { \bigwedge \dotsc ( \ell _ { 1 } ^ { ( 1 ) } \vee \dotsc \vee \ell _ { m _ { k } } ^ { ( k ) } ) } \end{array} )  \end{array}
$$

# Pasaje a forma clausal en l´ogica de primer orden

Paso 6. Empujar los cuantificadores universales hacia adentro:

$$
\begin{array} { r } { \left( \begin{array} { c c } { ( \ell _ { 1 } ^ { ( 1 ) } \vee \ldots \vee \ell _ { m _ { 1 } } ^ { ( 1 ) } ) } \\ { \wedge \ ( \ell _ { 1 } ^ { ( 2 ) } \vee \ldots \vee \ell _ { m _ { 2 } } ^ { ( 2 ) } ) } \\ { \cdots } \\ { \wedge \ ( \ell _ { 1 } ^ { ( k ) } \vee \ldots \vee \ell _ { m _ { k } } ^ { ( k ) } ) } \end{array} \right) \longrightarrow \left( \begin{array} { c c } { \forall { \texttt X } _ { 1 } \ldots { \texttt X } _ { i } } \\ { \wedge \ \forall { \texttt X } _ { 1 } \ldots { \texttt X } _ { i } } \\ { \cdots } \\ { \wedge \ \forall { \texttt X } _ { 1 } \ldots { \texttt X } _ { i } } \end{array} \right) } \end{array}
$$

Por ´ultimo la forma clausal es:

$$
\left\{ \begin{array} { l } { \{ \ell _ { 1 } ^ { ( 1 ) } , \ldots , \ell _ { m _ { 1 } } ^ { ( 1 ) } \} , } \\ { \{ \ell _ { 1 } ^ { ( 2 ) } , \ldots , \ell _ { m _ { 2 } } ^ { ( 2 ) } \} , } \\ { \vdots } \\ { \{ \ell _ { 1 } ^ { ( k ) } , \ldots , \ell _ { m _ { k } } ^ { ( k ) } \} } \end{array} \right\}
$$

$$
^ { 2 7 }
$$

# Pasaje a forma clausal en l´ogica de primer orden

Resumen — pasaje a forma clausal en l´ogica de primer orden

1. Reescribir $\Rightarrow$ usando ¬ y ∨.   
2. Pasar a f.n. negada, empujando ¬ hacia adentro.   
3. Pasar a f.n. prenexa, extrayendo ∀, ∃ hacia afuera.   
4. Pasar a f.n. de Skolem, Skolemizando los existenciales.   
5. Pasar a f.n. conjuntiva, distribuyendo ∨ sobre ∧.   
6. Empujar los cuantificadores hacia adentro de las conjunciones.

Cada paso produce una f´ormula equivalente, excepto la Skolemizaci´on que s´olo preserva satisfactibilidad.

# Pasaje a forma clausal en l´ogica de primer orden

# Ejemplo — pasaje a forma clausal

Queremos ver que $\sigma \equiv \exists \mathrm { X } . ( \forall \mathrm { Y } . \mathbf { P } ( \mathrm { X } , \mathrm { Y } ) ) \Rightarrow \forall \mathrm { Y } . \mathbf { P } ( \mathrm { Y } , \mathrm { X } ) )$ es v´alida. Primero la negamos: $\lnot \sigma \equiv \lnot \exists \mathrm { X } . \left( \forall \mathrm { Y } . \mathbf { P } ( \mathrm { X } , \mathrm { Y } ) \Rightarrow \forall \mathrm { Y } . \mathbf { P } ( \mathrm { Y } , \mathrm { X } ) \right)$ . Pasamos ¬σ a forma clausal:

¬∃X. (∀Y. P(X, Y) ⇒ ∀Y. P(Y, X)) ¬∃X. (¬∀Y. P(X, Y) ∨ ∀Y. P(Y, X)) ∀X. ¬(¬∀Y. P(X, Y) ∨ ∀Y. P(Y, X)) ∀X. (¬¬∀Y. P(X, Y) ∧ ¬∀Y. P(Y, X)) ∀X. (∀Y. P(X, Y) ∧ ∃Y. ¬P(Y, X)) ∀X. ∃Y. (∀Y. P(X, Y) ∧ ¬P(Y, X)) ∀X. ∃Y. ∀Z. (P(X, Z) ∧ ¬P(Y, X)) ∀X. ∀Z. (P(X, Z) ∧ ¬P(f(X), X)) ∀X. ∀Z. P(X, Z) ∧ ∀X. ∀Z. ¬P(f(X), X)

La forma clausal es:

$$
2 ) \} , \{ \lnot \mathbf { P } ( \mathbf { f } ( \mathbf { X } ) , \ l \mathbf { X } ) \} \} \equiv \{ \{ \mathbf { P } ( \mathbf { X } , \mathbf { Y } ) \} , \{ \lnot \mathbf { P } (
$$

# Refutaci´on en l´ogica de primer orden

Una vez obtenido un conjunto de cl´ausulas $\mathcal { C } = \{ \kappa _ { 1 } , . . . , \kappa _ { n } \}$ , se busca una refutaci´on, es decir, una demostraci´on de C ⊢ ⊥.

Recordemos la regla de resoluci´on proposicional:

$$
\frac { \{ \ : \ : , \ell _ { 1 } , \ldots , \ell _ { n } \} \{  \ : , \ell _ { 1 } ^ { \prime } , \ldots , \ell _ { m } ^ { \prime } \} } { \{ \ell _ { 1 } , \ldots , \ell _ { n } , \ell _ { 1 } ^ { \prime } , \ldots , \ell _ { m } ^ { \prime } \} }
$$

Queremos adaptarla a l´ogica de primer orden.

En lugar de una variable proposicional P vamos a tener una f´ormula at´omica P $\cdot$ .

¿Podemos escribir la regla as´ı?:

$$
, \ell _ { 1 } , \ldots , \ell _ { n } \} \qquad \{ \begin{array} { l l } { { \ldots } } &  { \qquad , \ell _ { 1 } , \ldots , \ell _ { n } \} } \end{array}  \quad \{ \begin{array} { l l } { { \ldots } } &  { \qquad \ell _ { 1 } , \ldots , \ell _ { n } \} } \end{array}  \quad \{ \begin{array} { l l } { { \ldots } } & { { \qquad \ell _ { 1 } , \ldots , \ell _ { n } } } \end{array}  \quad [ \begin{array} { c l } { { \ldots } } & { { \qquad \ell _ { 1 } , \ldots , \ell _ { n } } } \end{array} ] \}
$$

$$
\{ \ell _ { 1 } , \ldots , \ell _ { n } , \ell _ { 1 } ^ { \prime } , \ldots , \ell _ { m } ^ { \prime } \}
$$

# Refutaci´on en l´ogica de primer orden

Consideremos la f´ormula:

Deber´ıa ser refutable, pues es insatisfactible. Su forma clausal consta de dos cl´ausulas:

$$
\begin{array} { r l r } { \{ \pmb { \mathsf { P } } ( \mathbb { X } ) \} } & { { } \{ \lnot \mathbf { P } ( 0 ) \} } \end{array}
$$

La regla de resoluci´on propuesta no aplica pues $\mathbf { P } ( \mathbf { X } ) \neq \mathbf { P } ( 0 ) .$ .

Los t´erminos no necesariamente tienen que ser iguales.   
Relajamos la regla para permitir que sean unificables.

# Refutaci´on en l´ogica de primer orden

La regla de resoluci´on de primer orden es:

$$
\begin{array} { r l } & { \{ \sigma _ { 1 } , \ldots , \sigma _ { p } , \ell _ { 1 } , \ldots , \ell _ { n } \} \qquad \{ \neg { \tau _ { 1 } } , \ldots , \neg { \tau _ { q } } , \ell _ { 1 } ^ { \prime } , } \\ & { \mathbf { S } = \mathbf { m g u } ( \{ \sigma _ { 1 } \stackrel { ? } { = } \sigma _ { 2 } \stackrel { ? } { = } \ldots \stackrel { ? } { = } \sigma _ { p } \stackrel { ? } { = } \tau _ { 1 } \stackrel { ? } { = } \tau _ { 2 } \stackrel { ? } { = } }  \end{array}
$$

$$
\pmb { \mathsf { S } } ( \{ \ell _ { 1 } , \hdots , \ell _ { n } , \ell _ { 1 } ^ { \prime } , \hdots , \ell _ { m } ^ { \prime } \} )
$$

Se asume impl´ıcitamente que las cl´ausulas est´an renombradas de tal modo que $\left\{ \begin{array} { l l } \end{array} \right. \quad , \ldots ,$ , ℓ1, . . . , ℓn} y {¬τ1, . . . , ¬ τq, ℓ′ , ℓ ′m } no tienen variables en com´un.

# Refutaci´on en l´ogica de primer orden

El algoritmo de refutaci´on se adapta sin mayores cambios.   
Se usa la nueva regla de resoluci´on para calcular la resolvente.

# Refutaci´on en l´ogica de primer orden

# Ejemplo — m´etodo de resoluci´on

Queremos demostrar $\sigma \equiv \exists \mathrm { X . } \left( \forall \mathrm { Y . } \mathbf { P } ( \mathrm { X , Y } ) \right) \Rightarrow \forall \mathrm { Y . } \mathbf { P } ( \mathrm { Y , X } ) \big ) .$ Equivalentemente, veamos que ¬σ ⊢ ⊥.   
La forma clausal de $\neg \sigma$ era:

$$
\mathcal { C } = \{ \underset { \left[ 1 \right] } { \{ \mathbf { P } ( \mathrm { X } , \mathrm { Y } ) \} } , \underset { \left[ 2 \right] } { \underbrace { \{ \neg \mathbf { P } ( \mathrm { f } ( \mathrm { Z } ) , \mathrm { Z } ) \} } } \}
$$

De 1 y 2 calculamos   
mgu(P $( \mathtt { X } , \mathtt { Y } ) \overset { ? } { = } \mathbf { P } ( \mathtt { f } ( \mathtt { Z } ) , \mathtt { Z } ) ) = \{ \mathtt { X } : = \mathtt { f } ( \mathtt { Z } ) , \mathtt { Y } : = :$ Z} y se obtiene la resolvente $\{ \}$ .

# Refutaci´on en l´ogica de primer orden

# Resoluci´on binaria

Considerar la siguiente variante de la regla de resoluci´on:

$$
, \ldots , \ell _ { n } \} \quad \{ \to \ , \ell _ { 1 } ^ { \prime } , \ldots , \ell _ { m } ^ { \prime } \} \quad { \bf 5 } = { \sf m g u } ( \{
$$

$$
 { \mathsf { S } } ( \{ \ell _ { 1 } , \dots , \ell _ { n } , \ell _ { 1 } ^ { \prime } , \dots , \ell _ { m } ^ { \prime } \} )
$$

No es completa.

# Ejemplo

{{P(X), P(Y)}, $\{ \neg \mathsf { P } ( \mathsf { Z } ) , \neg \mathsf { P } ( \mathsf { W } ) \} \}$ es insatisfactible.   
No es posible alcanzar la cl´ausula vac´ıa $\{ \}$ con resoluci´on binaria.

Correcci´on del m´etodo de resoluci´on de primer orden

# Teorema (correcci´on del pasaje a forma clausal)

Dada una f´ormula $\sigma$ :

1. El pasaje a forma clausal termina.   
2. El conjunto de cl´ausulas $\mathcal { C }$ obtenido es equisatisfactible a $\sigma$ . Es decir, $\sigma$ es sat. si y s´olo si $\mathcal { C }$ es sat..

Correcci´on del m´etodo de resoluci´on de primer orden

Teorema (correcci´on del algoritmo de refutaci´on)

Dado un conjunto de cl´ausulas $\mathcal { C } _ { 0 }$ :

1. Si $\mathcal { C } _ { 0 } \vdash \bot$ , existe una manera de elegir las cl´ausulas tal que el algoritmo de refutaci´on termina.

2. El algoritmo retorna INSAT si y s´olo si ${ \mathcal { C } } _ { 0 } \vdash \bot .$

Si $\cdot$ , no hay garant´ıa de terminaci´on.

$$
3 7
$$

# Resoluci´on de primer orden

# Ejemplo — no terminaci´on

La siguiente f´ormula $\sigma$ no es v´alida:

$$
\forall \mathrm { X . } \left( \mathbf { P ( s u c c ( x ) ) } \Rightarrow \mathbf { P ( X ) } \right) \Rightarrow \mathbf { P ( 0 ) }
$$

Tratemos de probar que es v´alida usando el m´etodo de resoluci´on. Para ello pasamos ¬σ a forma clausal:

$$
\{ \underbrace { \{ \neg { \bf P } ( \mathrm { s u c c } ( \mathrm { x } ) ) , { \bf P } ( \mathrm { x } ) \} } _ { \mathrm { \bf 1 } } , \underbrace { \{ \neg { \bf P } ( 0 ) \} } _ { \mathrm { \bf \left[ 2 \right] } } \}
$$

![](images/754e4e7b6c449296110bce2dca073e0d32f08db64e5e2910b810ebfd6e81eeb2.jpg)

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

# Lectura recomendada

# Art´ıculo original de Robinson.

J. A. Robinson. A Machine-Oriented Logic Based on the Resolution Principle.   
Journal of the Association for Computing Machinery, Vol. 12, No. 1 (enero de 1965), pp. 23-41.