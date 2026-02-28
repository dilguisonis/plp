# Paradigmas de Programaci´on

# C´alculo-λ

2do. cuatrimestre de 2025

Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

# 1

Introducci´on

C´alculo-λb: sintaxis y tipado

C´alculo-λb: sem´antica operacional

$$
2
$$

C´alculo-λbn: extensi´on con n´umeros naturales

# ¿Qu´e es el c´alculo-λ?

Lenguaje de programaci´on definido de manera rigurosa.   
Se basa s´olo en dos operaciones: construir funciones y aplicarlas.

# Hist´oricamente

Concebido en la d´ecada de 1930 por Alonzo Church para formalizar la noci´on de funci´on efectivamente computable. Usado desde la d´ecada de 1960 para estudiar sem´antica formal de lenguajes de programaci´on.

# Actualmente

N´ucleo de lenguajes de programaci´on funcionales y asistentes de demostraci´on. Lisp, OCaml, Haskell, Coq, Agda, Lean, . . ..

Laboratorio para investigar nuevas caracter´ısticas de lenguajes.

Fuertemente conectado con la teor´ıa de la demostraci´on, matem´atica constructiva, teor´ıa de tipos . . .

# Introducci´on

C´alculo-λb: sintaxis y tipado

C´alculo-λb: sem´antica operacional

$$
4
$$

C´alculo-λbn: extensi´on con n´umeros naturales

$$
E | \mathsf { c a l c u l o - } \lambda ^ { b }
$$

# Sintaxis de los tipos

$$
\begin{array} { c c } { { \tau , \sigma , \rho , \ldots } } & { { \mathrel { \mathop : } \mathrel { : } = } } & { { \mathsf { b o o l } } } \\ { { \mid } } & { { \tau \to \sigma } } \end{array}
$$

Asumimos que el constructor de tipos “→” es asociativo a derecha:

$$
\begin{array} { r l r l r l r l } { { } ~ \to \rho } & { { } } & { = { } } & { \tau \to ( \sigma \to \rho ) } & { { } } & { \neq } & { { } ( \tau \to } & { } \end{array}
$$

# El c´alculo-λb

Suponemos dado un conjunto infinito numerable de variables:

$$
\mathcal { X } = \{ x , y , z , \ldots \}
$$

Sintaxis de los t´erminos

${ \begin{array} { l l l } { M , N , P , \dots } & { : : = } & { x } \\ & { \mid } & { \lambda x : \tau . M } \\ & { \mid } & { M N } \\ & { \mid } & { { \mathrm { t r u e } } } \\ & { \mid } & { { \mathrm { f a l s e } } } \\ & { \mid } & { { \mathrm { i f } } \ M { \mathrm { t h e n } } \ N { \mathrm { \ e l s e } } \ P } \end{array} }$ variable abstracci´on aplicaci´on verdadero falso condicional

Asumimos que la aplicaci´on es asociativa a izquierda:

$$
\begin{array} { r l r } { { \cal M } { \cal N } { \cal P } } & { { } = } & { \left( { \cal M } { \cal N } \right) { \cal P } \quad \ne \quad { \cal M } \left( { \cal N } \right. } \end{array}
$$

La abstracci´on y el “if” tienen menor precedencia que la aplicaci´on:

λx : τ. M N $\begin{array} { r l r } { = { } } & { { } \lambda x : \tau . \left( M N \right) \quad \neq { } } & { \left( \lambda x : \tau . \Lambda \right. } \end{array}$ ) N

$$
\begin{array} { r l } & { { \mathsf { E j e m p l o s ~ d e ~ t e r m i n o s } } } \\ & { \bullet \quad \lambda x : { \mathsf { b o o l . } } x } \\ & { \bullet \quad \lambda x : { \mathsf { b o o l . } } } \\ & { \bullet \quad ( \lambda x : { \mathsf { b o o l . } } x ) { \mathsf { f a l s e } } } \\ & { \bullet \quad ( \lambda x : { \mathsf { b o o l . } } x ) { \mathsf { f a l s e } } } \\ & { \bullet \quad ( \lambda x : { \mathsf { b o o l . } } \mapsto { \mathsf { b o o l . } } x ) ( \lambda y : { \mathsf { b o o l . } } y ) } \\ & { \bullet \quad ( \lambda x : { \mathsf { b o o l . } } \lambda y : { \mathsf { b o o l . } }  { \mathsf { b o o l . } } y x ) { \mathsf { t r } } } \\ & { \bullet \quad \lambda x : { \mathsf { b o o l . } } { \mathsf { i f ~ } } x { \mathsf { \ t h e n ~ f a l s e ~ e l s e ~ t r u e } } } \\ & { \bullet { \mathsf { t r u e ~ f r u e } } } \end{array}
$$

# 7

# Variables libres y ligadas

Una ocurrencia de x est´a ligada si aparece adentro de una abstracci´on “λ x”. Una ocurrencia de x est´a libre si no est´a ligada.

# Ejemplo

Marcar ocurrencias de variables libres y ligadas:

(λx : bool → bool. λy : bool. x y) (λy : bool. x y) y

# Ejercicio

Definir el conjunto de variables libres $\mathsf { f v } ( M )$ de M.

# Variables libres: Definici´on formal

$$
9
$$

fv ${ \begin{array} { r l } { { \mathsf { f v } } ( x ) } & { { \stackrel { \mathrm { d e f } } { = } } \quad \{ x \} } \\ { { \mathsf { \Pi } } ( { \mathsf { r u e } } ) = { \mathsf { f v } } ( { \mathsf { f a l s e } } ) } & { { \stackrel { \mathrm { d e f } } { = } } \quad \emptyset } \\ { { \mathsf { M } } { \mathsf { \ t h e n \ } } N { \mathsf { \ e l s e \ } } P ) } & { { \stackrel { \mathrm { d e f } } { = } } \quad { \mathsf { f v } } ( M ) \cup { \mathsf { f v } } ( N ) \cup } \\ { { \mathsf { f v } } ( M N ) } & { { \stackrel { \mathrm { d e f } } { = } } \quad { \mathsf { f v } } ( M ) \cup { \mathsf { f v } } ( N ) } \\ { { \mathsf { f v } } ( \lambda x : \tau . M ) } & { { \stackrel { \mathrm { d e f } } { = } } \quad { \mathsf { f v } } ( M ) \setminus \{ x \} } \end{array} }$ fv(if fv(P)

Dos t´erminos M y N que difieren solamente en el nombre de sus variables ligadas se dicen $\alpha$ -equivalentes (relaci´on =α)

α-equivalencia es una relaci´on de equivalencia

Ojo: De aqu´ı en m´as haremos abuso de notaci´on y usaremos el operador $=$ para denotar las $\alpha$ -equivalencias (ojo).

λx : τ. λ $\begin{array} { l } { { \prime : \sigma . x \ = \ \lambda y : \tau . \lambda x : \sigma . y \ = \ \lambda a : \tau . \lambda \nonumber } } \\ { { \prime : \sigma . x \ \neq \ \lambda x : \tau . \lambda y : \sigma . y \ = \ \lambda x : \tau . \lambda x } } \end{array}$ : σ. a λx : τ. λy : σ. x

# Sistema de tipos

La noci´on de “tipabilidad” se formaliza con un sistema deductivo.

# Problema

¿Qu´e tipo tiene x?

# Contextos de tipado

Un contexto de tipado es un conjunto finito de pares $\left( x _ { i } : \tau _ { i } \right)$ :

$$
\{ x _ { 1 } : \tau _ { 1 } , \ldots , x _ { n } : \tau _ { n } \}
$$

sin variables repetidas $( i \neq j \Rightarrow x _ { i } \neq x _ { j } ) .$

Se nota con letras griegas may´usculas (Γ, ∆, . . .).

A veces notamos d $\mathsf { o m } ( \Gamma ) = \{ x _ { 1 } , \hdots , x _ { n } \}$

# Juicios de tipado

El sistema de tipos hace afirmaciones sobre juicios de tipado, de la forma:

# Sistema de tipos

# Reglas de tipado

t-true t-false Γ ⊢ true : bool Γ ⊢ false : bool Γ ⊢ M : bool Γ ⊢ N : τ Γ ⊢ P : τ t-if Γ ⊢ if M then N else P : τ $\frac { \Gamma , x : \tau \vdash M : \sigma } { : \tau \vdash x : \tau } \mathrm { T } \mathrm { - V A R } \qquad \Gamma \vdash \lambda x : \tau . M : \tau $ t-abs Γ, x σ $\frac { \Gamma \vdash M : \tau  \sigma \quad \Gamma \vdash N : \tau } { \Gamma \vdash M N : \sigma } \mathrm { T } \lnot \mathrm { A P P }$

# Sistema de tipos

# Ejemplo — derivaciones de juicios de tipado

Derivar, si es posible, juicios de tipado para los siguientes t´erminos:

1. λx : bool. if $x$ then false else x   
2. λy : bool → bool → bool. λz : bool. y (y x z)   
3. x z (y z)   
4. λx : bool → bool. λx : bool. x   
5. true (λx : bool. x)   
6. x x

# Propiedades del sistema de tipos

Teorema (Unicidad de tipos)

Si Γ ⊢ M : τ y Γ ⊢ M : σ son derivables, entonces $\tau = \sigma$ .

$$
^ { 1 4 }
$$

Teorema (Weakening + Strengthening)

Si Γ ⊢ M : τ es derivable y $\mathsf { f v } ( M ) \subseteq \mathsf { d o m } ( \Gamma \cap \Gamma ^ { \prime } )$ entonces $\Gamma ^ { \prime } \vdash M : \tau$ es derivable.

# Introducci´on

C´alculo-λb: sintaxis y tipado

C´alculo-λb: sem´antica operacional

C´alculo-λbn: extensi´on con n´umeros naturales

# 15

# Sem´antica formal

El sistema de tipos indica c´omo se construyen los programas.   
Queremos adem´as darles significado (sem´antica).

Distintas maneras de dar sem´antica formal

# 1. Sem´antica operacional.

Indica c´omo se ejecuta el programa hasta llegar a un resultado.

Sem´antica small-step: ejecuci´on paso a paso.   
Sem´antica big-step: evaluaci´on directa al resultado.

2. Sem´antica denotacional. Interpreta los programas como objetos matem´aticos.

3. Sem´antica axiom´atica. Establece relaciones l´ogicas entre el estado del programa antes y despu´es de la ejecuci´on.

4.

Vamos a trabajar con sem´antica operacional small-step.

# Sem´antica operacional small-step

# Programas

Un programa es un t´ermino M tipable y cerrado $( \mathsf { f v } ( M ) = \emptyset )$ :

El juicio de tipado ⊢ M : τ debe ser derivable para alg´un $\tau$

# Juicios de evaluaci´on

La sem´antica operacional hace afirmaciones sobre juicios de evaluaci´on:

donde M y N son programas.

# Valores

Los valores son los posibles resultados de evaluar programas:

$$
^ { 1 7 }
$$

# Sem´antica operacional small-step

![](images/d138859c1fcb9391dfa1d4eec1a3597b4082a76f79b64be89dae924a827b43b4.jpg)

# Sem´antica operacional small-step

# Ejemplo

1. Derivar el siguiente juicio:

if (if false then false else true) then false else true → if true then false else true

2. ¿Para qu´e t´erminos M vale que true → M?

3. ¿Es posible derivar el siguiente juicio?

if true then true else (if false then false else false) → if true then true else false

4. ¿Y este juicio?

if true then (if false then false else false) else true → if true then false else true

# Sem´antica operacional small-step

Reglas de evaluaci´on para funciones (abstracci´on y aplicaci´on)

$\frac { M \to M ^ { \prime } } { M N \to M ^ { \prime } N } \mathrm { E - A P P 1 }$ $\begin{array} { c } { { N  N ^ { \prime } } } \\ { { \overline { { { \lambda x : \tau . M ) N  ( \lambda x : \tau . M ) N ^ { \prime } } } } ^ { \mathrm { E - A P P 2 } } } } \\ { { { } } } \\ { { \overline { { { \lambda x : \tau . M ) V  M \{ x : = V \} } } } ^ { \mathrm { E - A P P A B S } } } } \end{array}$

# Sustituci´on

La operaci´on de sustituci´on:

$$
M \{ x : = N \}
$$

denota el t´ermino que resulta de reemplazar todas las ocurrencias libres de x en M por N.

# Definici´on de sustituci´on

$\begin{array} { r l } { x \{ x : = N \} } & { \stackrel { \mathrm { d e f } } { = } ~ N } \\ { a \{ x : = N \} } & { \stackrel { \mathrm { d e f } } { = } ~ a ~ \mathrm { s i } ~ a \in \{ \mathrm { t r u e , ~ f a l s e } \} \cup } \\ { \gimel \{ x : = N \} } & { \stackrel { \mathrm { d e f } } { = } ~ \mathrm { i f } ~ M \{ x : = N \} } \\ & { ~ \mathrm { t h e n ~ } P \{ x : = N \} } \\ & { ~ \mathrm { e l s e ~ } Q \{ x : = N \} } \\ { \beth \{ x : = N \} } & { \stackrel { \mathrm { d e f } } { = } ~ M _ { 1 } \{ x : = N \} ~ M _ { 2 } \{ x : = }  \\ { \nmid \{ x : = N \} } & { \stackrel { \mathrm { d e f } } { = } } \end{array}$ X \ {x } (if M then $P$ else (M1 M (λy : τ. M

$$
\left\{ \begin{array} { l l } { \lambda y : \tau . M } & { \mathrm { ~ s i ~ } x = y } \\ { \lambda y : \tau . M \{ x : = N \} } & { \mathrm { ~ s i ~ } x \neq y } \\ { \lambda z : \tau . M \{ y : = z \} \{ x : = N \} } & { \mathrm { ~ s i ~ } x \neq y } \\ { \quad } & { \quad z \not \in \{ x , } \end{array} \right.
$$

$$
^ { 2 2 }
$$

# Definici´on de sustituci´on (alternativa)

$\begin{array} { r l } { x \{ x : = N \} } & { \stackrel { \mathrm { d e f } } { = } } \\ { \quad \partial \{ x : = N \} } & { \stackrel { \mathrm { d e f } } { = } } \\ { Q ) \{ x : = N \} } & { \stackrel { \mathrm { d e f } } { = } } & { \stackrel { \partial } { \operatorname { d } } \{ x : n \} } \\ & { \qquad \mathrm { t h e n } \ P \{ x : = N \} } \\ & { \qquad \mathrm { e l s e } \ Q \{ x : = N \} } \\ { M _ { 2 } ) \{ x : = N \} } & { \stackrel { \mathrm { d e f } } { = } } & { M _ { 1 } \{ x : = N \} M _ { 2 } \{ x : = N \} } \\ { M \} \{ x : = N \} } & { \stackrel { \mathrm { d e f } } { = } } & { \lambda y : \tau . M \{ x : = N \} } \end{array}$ ∪ X \ {x } (if M then $P$ else (M1 $\begin{array} { r l } & { M _ { 1 } \{ x : = N \} M _ { 2 } \{ x : = N \} } \\ & { \lambda y : \tau . \ : M \{ x : = N \} } \\ & { \mathsf { a s u m i e n d o } y \notin \{ x \} \cup \mathsf { f v } ( N ) } \end{array}$ (λy : τ.

La suposici´on se puede cumplir siempre, renombrando la variable ligada “y” en caso de conflicto.

# Sem´antica operacional small-step

# Ejemplo — evaluaci´on

Reducir repetidamente el siguiente t´ermino hasta llegar a un valor:

(λx : bool. λf : bool → bool. $f \left( f x \right) )$ true (λx : bool. x)

$$
2 4
$$

# Propiedades de la evaluaci´on

Teorema (Determinismo)

Si $M  N _ { 1 }$ y $M  N _ { 2 }$ entonces $N _ { 1 } = N _ { 2 }$ .

Teorema (Preservaci´on de tipos)

Si ⊢ M : τ y $M  N$ entonces ⊢ N : τ .

Teorema (Progreso)

Si ⊢ M : τ entonces:

1. O bien M es un valor.   
2. O bien existe N tal que $M  N$ .

Teorema (Terminaci´on)

Si ⊢ M : τ , entonces no hay una cadena infinita de pasos:

$$
M  M _ { 1 }  M _ { 2 }  . . .
$$

# Propiedades de la evaluaci´on

# Corolario (Canonicidad)

1. Si ⊢ M : bool es derivable, entonces la evaluaci´on de M termina y el resultado es true o false.

2. ${ \mathsf { S i } } \vdash M : \tau  \sigma$ es derivable, entonces la evaluaci´on de M termina y el resultado es una abstracci´on.

# Slogan

Well typed programs cannot go wrong.

(Robin Milner)

# Propiedades de la evaluaci´on

# Forma normal

Una forma normal es un t´ermino que no puede evaluarse m´as (i.e., M tal que no existe N, $M \to N )$ .

# Lema

Todo valor est´a en forma normal.

▶ Pero no toda formal normal es un valor en c´alculo- $\lambda ^ { b }$ (e.g., if x then true else false o x y ).

# Estado de error

Estado de la evaluaci´on donde el t´ermino est´a en forma normal, pero no es un valor.

Representa estado en el cual el sistema de runtime en una implementaci´on real generar´ıa una excepci´on.

Recordar que un valor es el resultado al que puede evaluar un t´ermino bien-tipado y cerrado.

$$
^ { 2 7 }
$$

# Evaluaci´on en muchos pasos

# Juicio en muchos pasos

La evaluaci´on en muchos pasos $\twoheadrightarrow$ (tambi´en denotado $\to ^ { * } ,$ ) es la clausura reflexiva-transitiva de .

Es decir, es la menor relaci´on tal que

1. Si $M  M ^ { \prime }$ , entonces $M  M ^ { \prime }$   
2. $M  M$ para todo M   
3. Si $M  M ^ { \prime } \ y \ M ^ { \prime }  \ M ^ { \prime \prime }$ , entonces $M  M ^ { \prime \prime }$

if true then (if false then false else true) else true ↠ true

# Evaluaci´on en muchos pasos

Propiedades

Para el c´alculo de expresiones booleanas valen:

Lema (Unicidad de formas normales)

Si $M \to U \lor M \to V$ con $U , V$ formas normales, entonces $U = V$

Lema (Terminaci´on)

Para todo M existe una forma normal $N$ tal que $M  N$

# Introducci´on

C´alculo-λb: sintaxis y tipado

C´alculo-λb: sem´antica operacional

C´alculo-λbn: extensi´on con n´umeros naturales

$$
E | \mathsf { c a l c u l o } \lambda ^ { b n }
$$

Sintaxis: tipos

τ , σ, . . . ::= . . . | nat

Sintaxis: t´erminos

# Sem´antica informal

M ::=

zero el n´umero cero succ(M) el sucesor del n´umero que representa M pred(M) el predecesor del n´umero que representa M isZero(M) representa un booleano true/false, dependiendo de si M representa al cero o n

$$
\mathsf { E I ~ c a l c u l o ~ \lambda ^ { b n } : ~ r e g l a s ~ d e ~ t i p a d o }
$$

t-zero Γ ⊢ zero : nat

Γ ⊢ M : nat Γ ⊢ M : nat t-succ t-pred Γ ⊢ succ(M) : nat Γ ⊢ pred(M) : nat

Γ ⊢ M : nat t-isZero Γ ⊢ isZero(M) : bool

$$
3 2
$$

$$
E | \mathsf { c } \acute { \mathsf { a } } | \mathsf { c } \mathsf { u } | \mathsf { o } \lambda ^ { b n } \mathrm { : ~ } \mathsf { v a l o r e s }
$$

$$
3 3
$$

Extendemos el conjunto de valores:

$$
V : : = \dots | \sf { z e r o } | \sf { s u c c } ( V )
$$

# El c´alculo λbn: sem´antica operacional

$\begin{array} { r l r } & { } & { \xrightarrow { M  M ^ { \prime } } \mathrm { E - S U C C } } \\ & { } & { \xrightarrow { \mathrm { s u c c } ( M )  \mathrm { s u c c } ( M ^ { \prime } ) } \mathrm { E - S U C C } } \\ & { } & { \xrightarrow { M  M ^ { \prime } } \mathrm { E - P R E D } } \\ & { } & { \mathrm { p r e d } ( M )  \mathrm { p r e d } ( M ^ { \prime } ) } \end{array}$ e-predSucc   
pred(succ(V )) → V M → M′ e-isZero   
isZero(M) → isZero(M′) e-isZeroZero   
isZero(zero) → true e-isZeroSucc   
isZero(succ(V )) → false

# El c´alculo λbn: sem´antica operacional

# Ejemplo

1. Evaluar isZero(succ(pred(succ(zero)))).   
2. Evaluar isZero(pred(pred(succ(zero)))).

(¿Qu´e ocurre?)

Forma normal (“f.n.”)

Un programa M es una f.n. si no existe M′ tal que $M  M ^ { \prime }$ .

¿Todas las f.n.’s cerradas y tipables son valores?

En el c´alculo-λb s´ı. En el c´alculo- $\lambda ^ { b n }$ no. (¿Qu´e propiedad deja de valer?)

Las f.n.’s que no son valores se llaman t´erminos de error.

# Propiedades de la evaluaci´on

Teorema (Determinismo)

Si $M  N _ { 1 }$ y $M  N _ { 2 }$ entonces $N _ { 1 } = N _ { 2 }$ .

Teorema (Preservaci´on de tipos)

Si ⊢ M : τ y $M  N$ entonces ⊢ N : τ .

Teorema (Progreso)

Si ⊢ M : τ entonces:

1. O bien M es un valor.   
2. O bien existe N tal que $M  N$ .

Teorema (Terminaci´on)

Si ⊢ M : τ , entonces no hay una cadena infinita de pasos:

$$
M  M _ { 1 }  M _ { 2 }  . . .
$$

El c´alculo λbn: sem´antica operacional ¿C´omo lo podemos arreglar

¿Todas las f.n.’s cerradas y tipables son valores?

En el c´alculo- $\lambda ^ { b }$ s´ı.

En el c´alculo- $\lambda ^ { b n }$ no. Deja de valer Progreso. ¿Por qu´e?

¿Qu´e podr´ıamos modificar para que s´ı valga la propiedad? ¿Esto requiere cambiar el lenguaje que estamos modelando? Si es as´ı, ¿qu´e es exactamente lo que cambia?

$$
3 7
$$

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

# Lectura recomendada

# Cap´ıtulos 5 y 9 del libro de Pierce.

Benjamin C. Pierce. Types and Programming Languages The MIT Press, 2002.

# Lectura adicional

Cap´ıtulos 1 y 3 del libro de Sørensen y Urzyczyn.

Morten Sørensen y Pawe l Urzyczyn. Lectures on the Curry–Howard Isomorphism. Elsevier, 2006.