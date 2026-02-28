Departamento de Computaci´on FCEyN UBA

<table><tr><td>(FCEyN UBA)</td><td>Repaso</td><td>2c2025 1/10</td></tr></table>

# Programaci´on Funcional

Tenemos un tipo de datos Melodia para representar melod´ıas compuestas por sonidos y silencios, dispuestos a lo largo del tiempo:

type Tono = Integer   
data Melodia $=$ Silencio | Nota Tono | Secuencia Melodia Melodia | Paralelo [ Melodia ]

Tono corresponde a una nota musical que se expresa mediante un entero mayor o igual a 0. Los silencios y las notas duran una unidad de tiempo cada uno (como si fueran todas negras o todas blancas, por ejemplo). En el caso del constructor Secuencia, la segunda melod´ıa empieza inmediatamente cuando finaliza la primera. En el caso de Paralelo, todas las melod´ıas suenan simult´aneamente. Suponemos que Paralelo [] no es una melod´ıa v´alida.

<table><tr><td>(FCEyN UBA)</td><td>Repaso</td><td>2c2025 2/10</td></tr></table>

Dar el tipo de y definir la funci´on foldMelodia, que implementa el esquema de recursi´on estructural para este tipo de datos. S´olo en este ejercicio est´a permitido usar recursi´on expl´ıcita.

Definir la funci´on duracionTotal :: Melodia -> Integer que, dada una melod´ıa, devuelve la cantidad de unidades de tiempo desde su inicio hasta su fin.

Por ejemplo: duracionTotal \$

Paralelo [Nota 1, Secuencia Silencio (Nota 2), Secuencia (Secuencia Silencio (Nota 2)) (Nota 3)]   
devuelve 3.

Definir la funci´on truncar :: Melodia -> Integer -> Melodia que reproduce una melod´ıa hasta una duraci´on determinada, de manera que la duraci´on total de la nueva melod´ıa sea el m´ınimo entre la duraci´on original y la indicada. La duraci´on indicada debe ser mayor a 0.

<table><tr><td>(FCEyNUBA)</td><td>Repaso</td><td>2c2025 3/10</td></tr></table>

# Razonamiento Ecuacional e Inducci´on Estructural 1er Parcial 2c2024

Dadas las siguientes definiciones:

data AB a $=$ Nil | Bin (AB a) a (AB a)

const :: a -> b -> a $\{ { \bf C } \} \mathrm { c o n s t } = ( \backslash { \bf x } \mathrm {  ~  ~ } \backslash \mathrm { y ~ } \mathrm {  ~  ~ } { \bf x } )$

zipAB :: AB a -> AB b -> AB (a,b)   
$\{ \boldsymbol { { \mathrm { Z 0 } } } \}$ zipAB Nil $=$ const Nil   
$\{ \mathbf { Z 1 } \}$ zipAB (Bin i r d) = \t -> case t of Nil -> Nil Bin i’ r’ d’ -> Bin (zipAB i i’)

<table><tr><td>(FCEyN UBA)</td><td>Repaso</td><td>2c2025 4/10</td></tr></table>

# Razonamiento Ecuacional e Inducci´on Estructural 1er Parcial 2c2024

Demostrar la siguiente propiedad:

∀ t::AB a.∀ u::AB a. altura t ≥ altura (zipAB t u)

Se recomienda hacer inducci´on en un ´arbol, utilizando el lema de generaci´on para el otro cuando sea necesario. Se permite definir macros (i.e., poner nombres a expresiones largas para no tener que repetirlas). No es obligatorio escribir los $\forall$ correspondientes en cada paso, pero es importante recordar que est´an presentes. Recordar tambi´en que los = de las definiciones pueden leerse en ambos sentidos. Se consideran demostradas todas las propiedades conocidas sobre enteros y booleanos, as´ı como tambi´en:

<table><tr><td>(FCEyN UBA)</td><td>Repaso</td><td>2c2025 5/10</td></tr></table>

Demostrar el siguiente teorema usando Deducci´on Natural, sin utilizar principios cl´asicos: $\rho \Rightarrow ( \sigma \lor ( \rho \Rightarrow \tau ) ) \Rightarrow ( \sigma \lor \tau )$

<table><tr><td>(FCEyNUBA)</td><td>Repaso</td><td>2c2025 6/10</td></tr></table>

# Reglas de deducci´on natural

$$
\begin{array} { l c r } { { } } & { { \qquad \Gamma , \tau \vdash \tau } } & { { \mathrm { a x } } } \\ { { \frac { \tau \vdash \tau \land \sigma } { \tau \land \sigma } \land _ { i } } } & { { \qquad \frac { \Gamma \vdash \tau \land \sigma } { \Gamma \vdash \tau } \land _ { e _ { 1 } } } } \\ { { \frac { \tau \vdash \sigma } { \tau \Rightarrow \sigma } \Rightarrow _ { i } } } & { { \qquad \frac { \Gamma \vdash \tau \Rightarrow \sigma } { \Gamma \vdash \tau } } } \\ { { \mathrm { \sigma _ { i } } \quad { \quad } { \stackrel { \Gamma \vdash \sigma } { \Gamma \vdash \tau \lor \sigma } } \lor _ { i _ { 2 } } } } & { { \qquad \frac { \Gamma \vdash \tau \lor \sigma } { \Gamma \vdash \tau } \lor _ { i } } } \\ { { \frac { \tau \vdash \bot } { \Gamma \vdash \tau } \neg _ { i } } } & { { \qquad \frac { \Gamma \vdash \tau \quad \Gamma } { \Gamma \vdash \tau } } } \end{array}
$$$$
\begin{array} { r l } { \overline { { \overline { { \mathbf { \alpha } } } , \tau \vdash \tau } } \stackrel { \mathsf { a x } } { = } } & { { } } \\ { \frac { \Gamma \vdash \tau \land \sigma } { \Gamma \vdash \tau } \land _ { e _ { 1 } } \quad } & { { } \frac { \Gamma \vdash \tau \land \sigma } { \Gamma \vdash \sigma } \land _ { e _ { 2 } } } \end{array}
$$$$
\begin{array} { l } { \displaystyle \frac { \Gamma \vdash \tau } { \Gamma \vdash \tau \lor \sigma } \lor _ { i _ { 1 } } \frac { \Gamma \vdash \sigma } { \Gamma \vdash \tau \lor \sigma } \lor _ { i _ { 2 } } } \\ { \displaystyle \frac { \Gamma , \tau \vdash \bot } { \Gamma \vdash \lnot \tau } \lnot _ { i } } \end{array}
$$

$$
\frac { \frac { \Gamma \vdash \tau \Rightarrow \sigma \vdash \tau } { \Gamma \vdash \sigma } \Rightarrow _ { e } } { \frac { \Gamma \vdash \tau } { \Gamma \vdash \sigma } \vdash \rho \vdash \tau  \rho } \lor _ { e }
$$

L´ogica cl´asica (las tres son equivalentes entre s´ı)

<table><tr><td>(FCEyN UBA)</td><td>Repaso</td><td>2c2025</td></tr></table>

# C´alculo Lambda - Pr´actica 4 Ejercicio 27

Se desea extender el C´alculo Lambda tipado con colas bidireccionales (tambi´en conocidas como deque).

Se extender´an los tipos y t´erminos de la siguiente manera:

τ ::= · · · | Colaτ M ::= · · · | ⟨⟩τ | M • M | pr´oximo(M) | desencolar(M) | case M of $\langle \rangle  M ; c \bullet x  M$

donde $\left. \right. _ { \tau }$ es la cola vac´ıa en la que se pueden encolar elementos de tipo $\tau$ $; M _ { 1 } \bullet M _ { 2 }$ representa el agregado del elemento $M _ { 2 }$ al final de la cola $M _ { 1 }$ ; los observadores pr´oximo( $M _ { 1 }$ ) y desencolar $M _ { 1 }$ ) devuelven, respectivamente, el primer elemento de la cola (el primero que se encol´o), y la cola sin el primer elemento (estos dos ´ultimos solo tienen sentido si la cola no es vac´ıa); y el observador case $M _ { 1 }$ of $\langle \rangle  M _ { 2 } ; c \bullet x  M _ { 3 }$ permite operar con la cola en sentido contrario, accediendo al ´ultimo elemento encolado (cuyo valor se ligar´a a la variable $_ x$ en $M _ { 3 }$ ) y al resto de la cola (que se ligar´a a la variable c en el mismo subt´ermino).

<table><tr><td>(FCEyN UBA)</td><td>Repaso</td><td>2c2025 8/10</td></tr></table>

# C´alculo Lambda - Pr´actica 4 Ejercicio 27

τ : $\begin{array} { r l } & { \mathrel { \mathop : } = \mathrm { \dots ~ } | \mathsf { C o l a } _ { \tau } } \\ & { \mathrel { \mathop : } = \mathrm { \dots ~ } | \big \langle \rangle _ { \tau } \mid M \bullet M \mid \mathsf { p r } \acute { \circ } \mathrm { x i m o } ( M ) \mid \mathsf { d e s } } \\ & { \mathrel { \phantom { = } } \mid \mathsf { c a s e } M \mathrm { o f } \big \langle \rangle  M ; c \bullet x  M } \end{array}$ M encolar(M)

1. Introducir las reglas de tipado para la extensi´on propuesta.

<table><tr><td>(FCEyNUBA)</td><td>Repaso</td><td>2c2025 9/10</td></tr></table>

# C´alculo Lambda - Pr´actica 4 Ejercicio 27

τ : $\begin{array} { r l } & { \mathrel { \mathop : } = \mathrm { \dots ~ } | \mathsf { C o l a } _ { \tau } } \\ & { \mathrel { \mathop : } = \mathrm { \dots ~ } | \big \langle \rangle _ { \tau } \mid M \bullet M \mid \mathsf { p r } \acute { \circ } \mathrm { x i m o } ( M ) \mid \mathsf { d e s } } \\ & { \mathrel { \phantom { = } } \mid \mathsf { c a s e } M \mathrm { o f } \big \langle \rangle  M ; c \bullet x  M } \end{array}$ M encolar(M)

1. Introducir las reglas de tipado para la extensi´on propuesta.   
2. Definir el conjunto de valores y las nuevas reglas de reducci´on. Pueden usar los conectivos booleanos de la gu´ıa. No es necesario escribir las reglas de congruencia, basta con indicar cu´antas son

<table><tr><td>(FCEyN UBA)</td><td>Repaso</td><td>2c2025 9/10</td></tr></table>

# C´alculo Lambda - Pr´actica 4 Ejercicio 27

τ : $\begin{array} { r l } & { \mathrel { \mathop : } = \mathrm { \dots ~ } | \mathsf { C o l a } _ { \tau } } \\ & { \mathrel { \mathop : } = \mathrm { \dots ~ } | \big \langle \rangle _ { \tau } \mid M \bullet M \mid \mathsf { p r } \acute { \circ } \mathrm { x i m o } ( M ) \mid \mathsf { d e s } } \\ & { \mathrel { \phantom { = } } \mid \mathsf { c a s e } M \mathrm { o f } \big \langle \rangle  M ; c \bullet x  M } \end{array}$ M encolar(M)

1. Introducir las reglas de tipado para la extensi´on propuesta. 2. Definir el conjunto de valores y las nuevas reglas de reducci´on. Pueden usar los conectivos booleanos de la gu´ıa. No es necesario escribir las reglas de congruencia, basta con indicar cu´antas son.

Pista: puede ser necesario mirar m´as de un nivel de un t´ermino para saber a qu´e reduce.

<table><tr><td>(FCEyN UBA)</td><td>Repaso</td><td>2c2025 9/10</td></tr></table>

# C´alculo Lambda - Pr´actica 4 Ejercicio 27

τ : $\begin{array} { r l } & { \mathrel { \mathop : } = \mathrm { \dots ~ } | \mathsf { C o l a } _ { \tau } } \\ & { \mathrel { \mathop : } = \mathrm { \dots ~ } | \big \langle \rangle _ { \tau } \mid M \bullet M \mid \mathsf { p r } \acute { \circ } \mathrm { x i m o } ( M ) \mid \mathsf { d e s } } \\ & { \mathrel { \phantom { = } } \mid \mathsf { c a s e } M \mathrm { o f } \big \langle \rangle  M ; c \bullet x  M } \end{array}$ M encolar(M)

Introducir las reglas de tipado para la extensi´on propuesta.

2. Definir el conjunto de valores y las nuevas reglas de reducci´on.

Pueden usar los conectivos booleanos de la gu´ıa. No es necesario escribir las reglas de congruencia, basta con indicar cu´antas son.

Pista: puede ser necesario mirar m´as de un nivel de un t´ermino para saber a qu´e reduce.

3. Mostrar paso por paso c´omo reduce la expresi´on: case $\langle \rangle _ { \mathsf { N a t } } \bullet \underline { { 1 } } \bullet 0$ of $\langle \rangle  \mathrm { p r } \acute { o } \times \mathrm { i m o } ( \langle \rangle _ { \mathrm { B o o l } } ) ; c \bullet x  \mathrm { i } 5 Z \mathsf { e r o } ( x )$

<table><tr><td>(FCEyN UBA)</td><td>Repaso</td><td>2c2025 9/10</td></tr></table>

# C´alculo Lambda - Pr´actica 4 Ejercicio 27

τ : $\begin{array} { r l } & { \mathrel { \mathop : } = \mathrm { \dots ~ } | \mathsf { C o l a } _ { \tau } } \\ & { \mathrel { \mathop : } = \mathrm { \dots ~ } | \big \langle \rangle _ { \tau } \mid M \bullet M \mid \mathsf { p r } \acute { \circ } \mathrm { x i m o } ( M ) \mid \mathsf { d e s } } \\ & { \mathrel { \phantom { = } } \mid \mathsf { c a s e } M \mathrm { o f } \big \langle \rangle  M ; c \bullet x  M } \end{array}$ M encolar(M)

Introducir las reglas de tipado para la extensi´on propuesta.

2. Definir el conjunto de valores y las nuevas reglas de reducci´on.

Pueden usar los conectivos booleanos de la gu´ıa. No es necesario escribir las reglas de congruencia, basta con indicar cu´antas son.

Pista: puede ser necesario mirar m´as de un nivel de un t´ermino para saber a qu´e reduce.

3. Mostrar paso por paso c´omo reduce la expresi´on: case $\langle \rangle _ { \mathsf { N a t } } \bullet \underline { { 1 } } \bullet 0$ of $\langle \rangle  \mathrm { p r } \acute { o } \times \mathrm { i m o } ( \langle \rangle _ { \mathrm { B o o l } } ) ; c \bullet x  \mathrm { i } 5 Z \mathsf { e r o } ( x )$

4. Definir como macro la funci´on ´ultimoτ , que dada una cola devuelve el ´ultimo elemento que se encol´o en ella. Si la cola es vac´ıa, puede colgarse o llegar a una forma normal bien tipada que no sea un valor. Dar un juicio de tipado v´alido para esta funci´on (no es necesario demostrarlo).

¿Preguntas?

¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

<table><tr><td>(FCEyN UBA)</td><td>Repaso</td><td>2c2025 10/10</td></tr></table>