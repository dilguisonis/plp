# ⊢ Sistemas deductivos

Paradigmas de Lenguajes de Programación

Departamento de Ciencias de la Computación Universidad de Buenos Aires

19 de septiembre de 2025

Sistemas deductivos   
Deducción natural   
Lógica intuicionista vs. clásica   
Demo de weakening por inducción en la derivación

# Sintaxis

$$
\tau : : = P \mid \bot \mid \neg \tau \mid \tau \land \tau \mid \tau \lor \tau \mid \tau \Rightarrow \tau
$$

# Valuaciones

Una valuación es una función $v : \mathcal { V } \to \{ V , F \}$ . Una valuación $v$ satisface una proposición $\tau$ si $v \models \tau$ , donde:

$$
\begin{array} { r l } { v \vdash P \quad } & { { } { \mathrm { s i i } } \quad } & { v ( P ) = V } \\ { v \vdash \neg \quad } & { { } { \mathrm { s i i } } \quad } & { v \nmid \tau } \\ { v \vdash \tau \land \sigma \quad } & { { } { \mathrm { s i i } } \quad } & { v \models \tau \quad \forall \quad v \models \sigma } \\ { v \vdash \tau \lor \sigma \quad } & { { } { \mathrm { s i i } } \quad } & { v \models \tau \quad \circ \quad v \models \sigma } \\ { v \vdash \tau \Rightarrow \quad } & { { } { \mathrm { s i i } } \quad } & { v \nmid \tau \quad \circ \quad v \models \sigma } \end{array}
$$

# Lógica proposicional

# Valuaciones

Una valuación v satisface una proposición $\tau$ si $v \models \tau$ , donde:

$$
{ \begin{array} { r l } { v \vdash P } & { \ \operatorname { s i i } } & { \quad v ( P ) = V } \\ { v \vdash \neg \tau } & { \ \operatorname { s i i } } & { \quad v \not \vdash \tau } \\ { v \vdash \tau \land \sigma } & { \ \operatorname { s i i } } & { \quad v \vdash \ \tau \quad y \quad v \vdash \sigma } \\ { v \vdash \tau \lor \sigma } & { \ \operatorname { s i i } } & { \quad v \vdash \ \tau \quad \circ \quad v \vdash \sigma } \\ { v \vdash \tau \Rightarrow \sigma } & { \ \operatorname { s i i } } & { \quad v \not \vdash \ \tau \quad \circ \quad v \vdash \sigma } \\ { v \vdash \bot } & { \ \operatorname { s i e m p r e } } \end{array} }
$$

# Equivalencia de fórmulas

$\tau$ es lógicamente equivalente a $\sigma$ cuando $v \models \tau$ sii $v \models \sigma$ para toda valuación $v$

# Ejercicio de la guía:

Mostrar que cualquier fórmula de la lógica proposicional que utilice los conectivos ¬ (negación), $\wedge$ (conjunción), ∨ (disyunción), $\Rightarrow$ (implicación) puede reescribirse a otra fórmula equivalente que usa sólo los conectivos $\lnot \mathrm { ~ y ~ } \lor$ .

# Sistemas deductivos

![](images/1a4e4f13dd47fc8af60f2c8cda1b4fd4565efa9fa1138d0f221acb3b2e2f6049.jpg)

Definidos por un conjunto de reglas Las reglas son de la forma:

Premisa1 Premisa2 . . . Premisan Nombre de Conclusión la regla

Un caso particular: $n = 0$

Nombre de Conclusión la regla

Por ejemplo,1

![](images/c8373457c206caed85f5ffcb54dc3245c3b5e1116b662d6b462e319182bf64df.jpg)

# Un sistema deductivo: deducción natural

Secuentes:

Una regla de deducción

intuitivamente se puede pensar que expresa:

$$
\left. { \begin{array} { l } { { \mathsf { P r e m i s a } } _ { 1 } } \\ { { \mathsf { P r e m i s a } } _ { 2 } } \\ { \vdots } \\ { { \mathsf { P r e m i s a } } _ { n } } \end{array} } \right\} \Longrightarrow { \mathsf { C o n c l u s i } } \dot { \mathsf { o n } }
$$

Por ejemplo...

$$
P , Q \vdash P \land Q
$$

$$
\frac { \Gamma \vdash \tau \quad \Gamma \vdash \sigma } { \Gamma \vdash \tau \land \sigma } \land i \quad \frac { } { \Gamma , \tau \vdash \tau } \mathsf { a x }
$$

$$
\left. \begin{array} { l } { { \Gamma \vdash \tau } } \\ { { \Gamma \vdash \sigma } } \end{array} \right\} \implies \Gamma \vdash \tau \wedge \sigma
$$

$$
{ \mathsf { T r u e } } \implies \Gamma , \tau \vdash \tau
$$

La demostración de un secuente es un árbol formado por reglas de deducción:

$$
\frac { \overline { { P , Q \vdash P } } ^ { \mathrm { ~ a x ~ } } \overline { { P , Q \vdash Q } } ^ { \mathrm { ~ a x ~ } } } { P , Q \vdash P \land Q } \land _ { i }
$$

# Deducción natural

# Reglas básicas

$$
\begin{array} { r l r } & { \frac { \Gamma \vdash \tau } { \Gamma \vdash \tau \setminus \sigma } } & { \frac { \Gamma \vdash \tau } { \tau \vdash \tau } \overset { \mathbf { x } } { \simeq } } \\ & { \frac { \Gamma \vdash \tau \land \tau } { \Gamma \vdash \tau \land \sigma } \land _ { i } } & { \frac { \Gamma \vdash \tau \land \sigma } { \Gamma \vdash \tau } \land _ { e _ { 1 } } \frac { \Gamma \vdash \tau } { \Gamma } } \\ & { \frac { \Gamma , \tau \vdash \sigma } { \Gamma \vdash \tau \Rightarrow \sigma } \Rightarrow _ { i } } & { \frac { \Gamma \vdash \tau \Rightarrow \sigma } { \Gamma \vdash \sigma } \mathrm { ~ T \vdash \tau ~ } } \\ & { \frac { \textnormal { \texttt { r } } \lor _ { i } } { \sigma } \quad \frac { \Gamma \vdash \sigma } { \Gamma \vdash \tau \lor \sigma } \lor _ { i _ { 2 } } } & { \frac { \Gamma \vdash \tau \lor \sigma } { \Gamma \vdash \rho } \mathrm { ~ T \vdash \rho ~ } } \\ & { \frac { \Gamma , \tau \vdash \bot } { \Gamma \vdash \tau } \neg _ { i } } & { \frac { \Gamma \vdash \tau \land \tau } { \Gamma \vdash \tau } } \end{array}
$$

$$
\frac { \Gamma \vdash \lnot \lnot \tau } { \Gamma \vdash \tau } \lnot \lnot \lnot \lnot e
$$

# Deducción natural

Reglas derivadas

$$
\frac { \Gamma \vdash \tau } { \Gamma \vdash \lnot \tau } \lnot \lnot _ { i } \frac { \Gamma \vdash \tau \Rightarrow \sigma \vdash \Gamma \vdash \lnot \sigma } { \Gamma \vdash \lnot \tau } \mathsf { M } \mathsf { T }
$$

$$
\frac { \Gamma , \neg \tau \vdash \bot } { \Gamma \vdash \tau } \mathsf { P B C } \qquad \frac { \sum \sqsubset \tau \vdash \tau } { \Gamma \vdash \tau \lor \lnot \tau } \mathsf { L E M }
$$

Todas las reglas derivadas, incluyendo las que hayan probado en la guía de ejercicios, pueden usarse para resolver otros ejercicios y los parciales.

Recuerden que en la sección Útil del campus tienen el Machete de Deducción Natural con todas las reglas.

# Deducción natural en lógica intuicionista

# Ejercicio de la guía

Demostrar en deducción natural que las siguientes fórmulas son teoremas sin usar principios de razonamiento clásicos salvo que se indique lo contrario. Una fórmula es un teorema cuando el juicio $\vdash \tau$ es derivable.

Reducción al absurdo: $( \rho \Rightarrow \bot ) \Rightarrow \neg \rho$   
Introducción de la doble negación: $\rho \Rightarrow \neg \neg \rho$   
Eliminación de la triple negación: $\neg \neg \neg \rho \Rightarrow \neg \rho$   
de Morgan (II): $\neg ( \rho \land \sigma ) \Leftrightarrow ( \neg \rho \lor \neg \sigma )$   
Para la dirección es necesario usar principios de razonamiento clásicos. Conmutatividad (∨): $( \rho \lor \sigma ) \Rightarrow ( \sigma \lor \rho )$

![](images/487aac6216b3792b2442c83243b379df301df24eeea9649063e9e39143ea14ca.jpg)

# Deducción natural en lógica clásica

Veamos que las reglas $\neg \neg _ { e }$ , PBC y LEM son equivalentes.

# Deducción natural en lógica clásica

# Ejercicio de la guía

Demostrar en deducción natural que las siguientes fórmulas son teoremas. Para cada una de ellas es imprescindible usar lógica clásica:

Absurdo clásico: $( \neg \tau \Rightarrow \bot ) \Rightarrow \tau$ Ley de Peirce: $( \rho \Rightarrow \sigma ) \Rightarrow \rho ) \Rightarrow \rho$ Análisis de casos: $( \tau \Rightarrow \sigma ) \Rightarrow ( \neg \tau \Rightarrow \sigma ) \Rightarrow \sigma$

# Debilitamiento o weakening

# Ejercicio de la guía

Probar la siguiente propiedad:

Si $\Gamma \vdash \sigma$ es válido entonces $\Gamma , \tau \vdash \sigma$ es válido.   
Pista: utilizar inducción estructural sobre la derivación o inducción global sobre su tamaño.

Por ejemplo,

$$
\frac { \overline { { Q \vdash P } } ^ { \mathrm { \tiny ~ a x } } \overline { { P , Q \vdash Q } } ^ { \mathrm { \tiny ~ a x } } } { \overline { { P , Q \vdash P \land Q } } ^ { \mathrm { \tiny ~ \ddots ~ } } \lor A _ { 1 } } \lor _ { i _ { 1 } } ^ { \mathrm { \tiny ~ a x } } \lor _ { i } ^ { \mathrm { \tiny ~ \overline { { P , Q , S \vdash P } } } ^ { \mathrm { \tiny ~ a x } } \mathrm { \Pi } \overline { { P , Q } } } .
$$

Para usar esta propiedad como regla en otras derivaciones:

$$
\frac { \Gamma \vdash \sigma } { \Gamma , \tau \vdash \sigma } \ : \mathsf { w }
$$

# Debilitamiento o weakening

En la sección Útil del campus pueden encontrar una   
Demostración (parcial) de Weakening para Deducción Natural, hecha con inducción estructural sobre la derivación.

# Último ejercicio

Demostrar en deducción natural que vale $\vdash ( \rho \lor \tau ) \land ( \sigma \lor \tau ) \Rightarrow \tau \lor ( \rho \land \sigma ) .$

![](images/9d5cd92a8c30f4e1392ade2a4e7cff3b22c58ef45149da6d4e0e8305794a7640.jpg)

¿Preguntas?