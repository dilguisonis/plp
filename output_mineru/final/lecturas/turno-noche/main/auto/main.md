# Paradigmas de Programaci´on

Correspondencia de Curry–Howard Puntos fijos y recursi´on

2do cuatrimestre de 2025 Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

# Correspondencia de Curry–Howard

Operador de punto fijo

$$
2
$$

# Sistema de tipos para el c´alculo-λb

![](images/1d584d4ae069619d652ee8232b018b4f23f805ebc29355e69f83e4b61942095b.jpg)

Vamos a omitir las reglas para booleanos.

# Sistema de tipos para el c´alculo-λ

# Reglas de tipadoDeducci´on natural

$$
4
$$

$$
\begin{array} { r l } & { \Gamma , x : \quad \tau \vdash x : \quad \tau ^ { \top - \mathrm { V A R } \lambda x } } \\ & { \begin{array} { r l } { \Gamma , x : \quad } & { \tau \vdash M : \quad } & { \sigma } \\ { \Gamma \vdash \lambda x : \sigma . M : \quad } & { \tau  \sigma ^ { \top - \mathrm { A B } } } \end{array} } \\ & { \begin{array} { r l } { \underline { { \Gamma \vdash M : \quad } } } & { \tau  \sigma \quad } & { \Gamma \vdash N : } \\ { \Gamma \vdash M N : \quad } & { \sigma } \end{array} } \\ & { \begin{array} { r l } { \mathrm { l g n o r e m o s ~ } \mid \mathrm { o s ~ t e r m i n o s } } & { \quad } \end{array} } \end{array}
$$

s→iτt-app→e

Las reglas de tipado se corresponden con reglas de deducci´on natural.

# Correspondencia de Curry

Curry y Feys observaron que si se lee el tipo $\tau  \sigma$ como una implicaci´on $\tau \Rightarrow \sigma$ :

la regla de tipado de la aplicaci´on de una funci´on es la regla modus ponens

# Pruebas y Programas

# F´ormulas Tipos Demostraciones T´erminos

Un juicio ⊢ σ es derivable si y s´olo si el tipo $\cdot$ est´a habitado, esto es, existe un t´ermino M tal que ⊢ M : τ es derivable.

# Ejemplo

Si, por ejemplo:

$$
\begin{array} { r l } & { \dot { \overline { { \mathbf { \Lambda } } } } _ { \overline { { \mathbf { \Lambda } } } ^ { \overline { { \mathbf { 0 } } } } } } \\ & { \frac { 1 } { \overline { { \mathbf { \Lambda } } } _ { \overline { { \mathbf { \Lambda } } } ^ { \overline { { \mathbf { 0 } } } } } } \partial x } \\ & { \frac { 1 } { \overline { { \mathbf { \Lambda } } } _ { \overline { { \mathbf { \Lambda } } } ^ { \overline { { \mathbf { 0 } } } } } } \partial \vec { \mathbf { \Lambda } } _ { i } } \\ & { \quad \begin{array} { r l } & { . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . } \\ & { \left. \begin{array} { l } { 0 } \\ { 0 } \end{array} \Delta \mathbf { I } \mathbf { \Lambda } \mathbf { \Lambda } \mathbf { \Sigma } \right|} \\ & { \frac { 1 } { \sigma } \mathbf { \Lambda } _ { \overline { { \mathbf { \Lambda } } } ^ { \overline { { \mathbf { 0 } } } } } \mathbf { \Lambda } _ { \overline { { \mathbf { \Lambda } } } ^ { \overline { { \mathbf { 0 } } } } } \mathbf { \Lambda } _ { \overline { { \mathbf { \Lambda } } } ^ { \overline { { \mathbf { 0 } } } } } } \end{array}  _ { \overline { { \mathbf { \Lambda } } } ^ { \overline { { \mathbf { 0 } } } } } } \end{array}
$$$$
{ \frac { \overline { { x : \sigma \vdash x : \sigma } } ^ { \mathrm { T - V A R } } } { \vdash \lambda x : \sigma . x : \sigma \to \sigma } } \mathrm { T - A B S }
$$

Corresponde al siguiente juicio d

El t´ermino $\cdot$ se asocia con la prueba de $\sigma \Rightarrow \sigma$ que se muestra en la parte superior

# Ejemplo

¿Es derivable ⊢ σ ⇒ σ?

Tambi´en existe la siguiente prueba

$$
{ \begin{array} { r l } { { \overline { { \sigma \Rightarrow \sigma \vdash \sigma \Rightarrow \sigma } } } ^ { a x } } & { { \overline { { \sigma \vdash \sigma } } } ^ { a x } } \\ { \overleftarrow { \vdash ( \sigma \Rightarrow \sigma ) \Rightarrow \sigma \Rightarrow \sigma } ^ { \Rightarrow i } } & { { \overline { { \vdash \sigma \Rightarrow \sigma } } } ^ { \Rightarrow i } } \\ { \vdash \sigma \Rightarrow \sigma } & { \Longrightarrow _ { e } } \end{array} }
$$

Corresponde al siguiente juicio de tipado:

$$
\frac { \overline { { \gamma \circ \vdash \sigma \to \sigma } } ^ { \mathrm { T - V A R } } } { \vdash \sigma \to \sigma \to \sigma ^ { \mathrm { T - A B S } } } \frac { \overline { { \sigma \vdash \sigma \vdash \sigma } } } { \vdash } \sigma 
$$

El t´ermino $^ -$ se asocia con la prueba que se muestra en la parte superior.

# Ejemplo

¿Es derivable ⊢ σ ⇒ σ?

Tambi´en existe la siguiente prueba

$$
\frac { \frac { \sigma \vdash \sigma ^ { a x } } { \sigma \vdash \sigma \Rightarrow \sigma } \Rightarrow i \quad \overline { { \sigma \vdash \sigma } } ^ { a x } } { \sigma \vdash \sigma } \Rightarrow _ { e } \quad \Rightarrow _ { i }
$$$$
\begin{array} { r } { \frac { \frac { \overline { { \sigma \vdash \sigma } } ^ { \mathrm { a x } } } { \sigma \vdash \sigma \Rightarrow \sigma }  \sigma } { \frac { \sigma \vdash \sigma } { \sigma } } } \\ { \frac { \overline { { \sigma \vdash \sigma } }  \sigma } { \sigma \vdash \sigma } } \\ { \vdash \dots \dots \dots \dots \dots } \\ { \underbrace { \frac { \overline { { x : \sigma , y : \sigma \vdash y : \sigma } } } { \sigma } } _ { \textnormal { X : \sigma > \textnormal { X y : \sigma > \sigma } } } \Upsilon \setminus \mathrm { B B } } \\ { \underbrace { \frac { \overline { { x : \sigma \vdash \lambda y : \sigma \cdot y : \sigma \neq \sigma } } } { x : \sigma \cdot ( x ) : \sigma \cdot y \cdot x : \sigma \cdot y \times \sigma } } _ { \textnormal { Y : \sigma > \textnormal { X : \sigma > \sigma } } ( x ) : \sigma \cdot y \times \textnormal { Y } } } \end{array}
$$

El t´ermino $\lambda x : \sigma . ( \lambda y : \sigma . y ) x$ se asocia con la prueba que se muestra en la parte superior.

# Pruebas vs t´erminos

Una f´ormula puede tener muchas pruebas distintas.   
Distintas pruebas corresponden a distintos juicios de tipado, es decir distintos t´erminos.   
Notar que algunas pruebas de la misma proposici´on son mas complejas que otras:

# Distintas pruebas de σ ⇒ σ

<table><tr><td rowspan="6">ax 9Tg →i Tσ→σ</td><td rowspan="6">- - - - - - - - - -</td><td></td></tr><tr><td>ax ax σ→9τσ』σ σtσ</td></tr><tr><td>→i →i ├(σ⇒σ)⇒σ⇒σ Tσ→σ</td></tr><tr><td>e</td></tr><tr><td>Tσ→σ - - -</td></tr><tr><td></td></tr></table>

# Correspondencia de Curry-Howard

William Alvin Howard extendi´o la correspondencia:

Tratando los restantes conectivos l´ogicos.   
Usando el c´alculo- $\lambda$ en lugar de la l´ogica combinatoria. Mostrando una correspondencia entre la simplificaci´on de pruebas y la computaci´on.

# Simplificaci´on de pruebas

# Corte (cut)

Un corte es una “vuelta” innecesaria en una demostraci´on.

▶ Est´a dado por una regla de introducci´on seguida inmediatamente de una regla de eliminaci´on. ▶ Involucra a una f´ormula de corte que no es subf´ormula de la tesis.

$$
\frac { \frac { \vdots \phi } { \Gamma , \vdash \rho } } { \Gamma \vdash \Rightarrow \rho } \qquad \frac  \vdots \} { \Gamma \vdash } \Psi \qquad 
$$

![](images/fda0d1310989aa846674491006335f4583298e533c27aa9ea469d3bf9207c6b9.jpg)

# Simplificaci´on de pruebas

# Eliminaci´on de cortes (cut-elimination)

Reescribir una prueba de manera tal que no tenga cortes:

Eliminamos $\sigma$ reemplazando cada uso $\sigma$ en la prueba de $\rho$ por una copia de la prueba de $\sigma$ .

$$
\begin{array} { r l } & { \frac { \displaystyle \vdots \bigg \rangle \Phi } { \displaystyle \Gamma , \sigma \vdash \rho } \quad } &  \underline { { : \Big \} } \Psi } \\ & { \frac { \displaystyle \Gamma \vdash \sigma \Rightarrow \rho } { \displaystyle \Gamma \vdash \rho } \quad } & { \overline { { \Gamma \vdash \sigma } } \quad } \\ & { \qquad \Gamma \vdash \rho } \end{array}
$$

![](images/f116a5cc0c1c9b4b8b4aa45e541e775623aac330a8646a145bd7b88e5485f035.jpg)

# Computaci´on como simplificaci´on de pruebas

# 14

# Eliminaci´on de cortes y reducci´on β

Un paso de eliminaci´on de cortes se corresponde con un paso de c´omputo (aplicaci´on de la regla $\beta$ o e-appAbs).

$$
\begin{array}{c} \frac { \overline { { \Gamma , \tau \vdash M : \rho } } } { \Gamma \vdash \lambda x : \tau . M : \tau  \rho } \mathrm { T - A B S } \quad \frac { \vdots } { \Gamma \vdash N : \tau }  \\ { \quad \quad \quad \quad \Gamma \vdash ( \lambda x : \tau . M ) N : \rho } \end{array}
$$

$$
\overline { { \Gamma \vdash \quad \quad \rho } }
$$

# Conjunci´on

$$
\frac { \Gamma \vdash \mathrm { ~  ~ \mathscr ~ { ~ \tau ~ } ~ } \textsf { \Gamma } \vdash \mathrm { ~  ~ \mathscr ~ { ~ \sigma ~ } ~ } } { \tau \vdash \mathrm { ~  ~ \mathscr ~ { ~ \tau ~ } ~ } \tau \land \sigma } \land _ { i }
$$

$$
\frac { \Gamma \vdash \mathrm { ~  ~ \omega ~ } \tau \wedge \sigma } { \Gamma \vdash \mathrm { ~  ~ \omega ~ } \tau } \wedge _ { e 1 } \mathrm { ~  ~ \omega ~ } \stackrel { \{ \scriptstyle \Gamma \vdash \mathrm { ~ \tiny ~ \textnormal ~ { ~ \wedge ~ } ~ } \sigma }  { \Gamma \vdash \mathrm { ~  ~ \omega ~ } \sigma } \wedge _ { e 2 }
$$

Producto

$$
\frac { \Gamma \vdash M : \tau \vdash N : \sigma } { \tau \vdash \langle M , N \rangle : \tau \times \sigma }
$$

$$
\frac { \Gamma \vdash \mathrm { ~  ~ { ~ \pi ~ } ~ } ^ { \prime } \times \sigma } { \Gamma \vdash \mathrm { ~  ~ { ~ \pi ~ } ~ } ^ { \prime } } \quad \quad \frac { \Gamma \vdash \mathrm { ~  ~ { ~ \pi ~ } ~ } ^ { \tau \times \sigma } } { \Gamma \vdash \mathrm { ~  ~ { ~ \pi ~ } ~ } ^ { \sigma } }
$$

# Conjunci´on: corte

![](images/73688ed1a319ad5aa1d30915a6956168c5ce6f51c7b634ffe5c204193875fa7f.jpg)

$$
^ { 1 7 }
$$

# Conjunci´on: eliminaci´on de corte

![](images/f77271b5dfe806034e4b60f3b6e6286e8a399d5a4abcaa126fd85aef3f23adc6.jpg)

# Producto: reducci´on

$\frac { \frac { \vdots } { \Gamma \vdash M : \tau } \quad \frac { : } { \Gamma \vdash N : \sigma } } { \Gamma \vdash \langle M , N \rangle : \tau \times \sigma } \land \quad  \quad$ $\frac { \frac { \vdots } { \Gamma \vdash \textnormal { \texttt { r } } \vdash \textnormal { \texttt { r } } \vdash \textnormal { \texttt { \sigma } } } } { \Gamma \vdash \textnormal { \texttt { r } } \textnormal { \texttt { \sigma } } } \land _ { i } \quad  \quad$

Γ ⊢ M : τ

# 19

# Tipos y t´erminos

$$
\begin{array} { l l l } { { \jmath , \dots } } & { { \mathrel { \mathop : } = } } & { { \dots \dots \mid \tau \times \sigma } } \\ { { \quad \quad l , \dots } } & { { \mathrel { \mathop : } = } } & { { \dots \dots \mid \langle M , N \rangle \mid \mathrm { f s t } ( M ) \mid \mathsf { s n d } ( N } } \end{array}
$$

# Reglas de tipado

$$
\frac { \Gamma \vdash M : \tau \vdash N : \sigma } { \Gamma \vdash \langle M , N \rangle : \tau \times \sigma } \times _ { i }
$$

$$
\frac { \Gamma \vdash M : \tau \times \sigma } { \Gamma \vdash \mathtt { f s t } ( M ) : \tau } \times _ { \mathtt { e } _ { 1 } } \frac { \Gamma \vdash M : \tau \times \sigma } { \Gamma \vdash \mathtt { s n d } ( M ) : \tau } \times _ { e _ { 2 } }
$$

# 21

$$
\mathsf { C a l c u l o - } \lambda ^ { \times } - \mathsf { r e s u m e n }
$$

# Valores

$$
V , W , \dots \dots \dots | \langle V , W \rangle
$$

# Reglas de c´omputo

$$
\mathsf { f s t } ( \langle V , W \rangle ) \to V ^ { \mathrm { E - F S T P A I R } }
$$

# Reglas de congruencia

$$
\frac { M \to M ^ { \prime } } { \langle M , N \rangle \to \langle M ^ { \prime } , N \rangle } \mathrm { E - P A I R 1 }
$$

$$
\frac { N \to N ^ { \prime } } { \langle V , N \rangle \to \langle V , N ^ { \prime } \rangle } \mathrm { E - P A I R 2 }
$$

$$
\frac { M \to M ^ { \prime } } { \mathrm { f s t } ( M ) \to \mathrm { f s t } ( M ^ { \prime } ) } \mathrm { E - F S T }
$$

$$
\frac { M \to M ^ { \prime } } { \mathsf { s n d } ( M ) \to \mathsf { s n d } ( M ^ { \prime } ) } \mathrm { E \bar { - } S N D }
$$

# Disyunci´on

$$
\frac { \Gamma \vdash \mathrm { ~  ~ { ~ \pi ~ } ~ } } { \mathrm { ~  ~ { ~ \pi ~ } ~ } \Large ~ } \lor _ { i _ { 1 } } \frac { \Gamma \vdash \mathrm { ~  ~ { ~ \pi ~ } ~ } } { \Gamma \vdash \mathrm { ~ ~  ~ { ~ \pi ~ } ~ } } .
$$

Γ ⊢ τ ∨ σ Γ, x : τ ⊢ M : ρ Γ, x : σ ⊢ N ρ ∨ Γ ⊢ ρ

# Suma

Γ ⊢ $\frac { \Gamma \vdash M : \tau } { \vdash \vdash ( M ) : \tau + \sigma } \qquad \frac { \Gamma \vdash M : \sigma } { \Gamma \vdash \mathsf { r i g h t } ^ { \tau } ( M ) : \cdot }$ τ + σ

Γ ⊢ M $\frac { \tau + \sigma \qquad \Gamma , \quad \tau \vdash \qquad \rho \qquad \Gamma , } { \vdash \qquad }$ τ ⊢ N : ρ Γ : ρ

$$
2 4
$$

# Disyunci´on: corte

Γ $\begin{array} { l } { \overline { { \overline { { \cdot \ M : \tau } } } } \qquad \vdots } \\ { \overline { { \overline { { ( M ) : \tau + \sigma } } } } ^ { \vee _ { i _ { 1 } } } \qquad \overline { { \Gamma , x : \tau \vdash N : \rho } } \qquad \overline { { \Gamma , x : \tau } } } \\ { \overline { { \subset \mathsf { a s e \ l e f t } ^ { \sigma } ( M ) \left\{ | \mathsf { e f t } ( x ) \mapsto N \parallel \mathsf { r i g h t } ( x ) \mapsto P \right. } } } \end{array}$ Γ ⊢ leftσ Γ, x : σ ⊢ P : ρ ∨ Γ ⊢ } : ρ

# 25

Γ ⊢ $\frac { \overbrace { M \ } : \sigma } { \overbrace { \ M \ } : \tau + \sigma } \bigvee _ { i _ { 2 } } \qquad \frac { : } { \Gamma , x : \tau \vdash N : \rho } \quad \overline { { \Gamma , x : \sigma } }$ Γ ⊢ rightσ( Γ, x : σ ⊢ P : ρ ∨ Γ ⊢ ca : ρ

Suma: reducci´on (1)

$$
\frac { \frac { \partial } { \partial \sigma } \vee _ { i _ { 1 } } \frac { : } { \Gamma , \quad \tau \vdash \quad \rho } \quad \hfill \stackrel { : } { \Gamma , \quad \sigma \vdash \quad } \hfill \rho }
$$

Γ ⊢ N{x := M} : ρ

Suma: reducci´on (2)

$$
^ { 2 7 }
$$

Γ ⊢ r $\frac  \underset { \substack { \mathrm { \scriptsize { F } \vdash \textit { M } : \sigma } } } { \overbrace { \Gamma \vdash \textit { M } : \sigma } } \underset  \substack { \mathrm { \scriptsize { F } \vdash \textit { M } : \sigma } \textit { \mathrm { \scriptsize { M } } : \sigma } \textit { \mathrm { \scriptsize { V } } _ { i 2 } \textit { \xi } \quad \overline { { \Gamma , x : \tau \vdash \textit { N } : \rho } } \textit { \mathrm { \scriptsize { F } } } } } { \overbrace { \Gamma \vdash \mathrm { \scriptsize { c a s e ~ r i g h t } ^ { \mathrm { \scriptsize { F } } \ell \mathrm { \scriptsize { b } } \mathrm { t } ^ { \sigma } } ( M ) \left\{ \mathrm { \scriptsize { e f t } ( \boldsymbol { x } ) \mapsto \textit { N } \parallel \ r i g h t } ( \boldsymbol { x } ) \right\} } } } ^ { \boldsymbol { \vdots } }$ , x : σ ⊢ P : ρ ∨ → P } : ρ → Γ ⊢ M : τ . Γ ⊢ P{x := M}

C´alculo-λ+: resumen

# Tipos y t´erminos

τ, $\begin{array} { r c l } { \sigma , \dots } & { \mathrel { \mathop : } = } & { \dots \mid } & { \tau + \sigma } \\ { N , \dots } & { \mathrel { \mathop : } = } & { \dots \mid } & { \mathsf { l e f t } ^ { \tau } ( M ) \mid \mathsf { r i g h t } ^ { \tau } ( M ) } \\ & { \mid } & { \mathsf { c a s e ~ } M \left\{ \mathsf { l e f t } ( x ) \mapsto N \right. } \end{array}$   
M , || right(y ) 7→ P}

# Reglas de tipado

$\begin{array} { r l } & { \frac { \Gamma \vdash M : \tau } { \vdash \vdash \lceil \mathtt { e f t } ^ { \sigma } ( M ) : \tau + \sigma } + _ { i _ { 1 } } \xrightarrow { \Gamma \vdash M : \sigma } } \\ & { - \ M : \tau + \sigma \vdash \Gamma , x : \tau \vdash N : \rho \vdash \Gamma , y : \sigma } \\ & { \frac { \Gamma \vdash \mathit { c a s e } \ M \{ \mathsf { e f t } ( x ) \mapsto N \parallel \mathsf { r i g h t } ( y ) \mapsto F } } { \Gamma \vdash \mathsf { c a s e } \ M \{ \mathsf { e f t } ( x ) \mapsto N \parallel \mathsf { r i g h t } ( y ) \mapsto F }   \end{array}$ +i Γ ρ e

# C´alculo-λ+: resumenValores

# Reglas de c´omputo

$$
{ \overline { { ( x ) \mapsto M \parallel \operatorname { r i g h t } ( y ) \mapsto N } } } \} \to M \{ x : = V \} ^ { \mathrm { E } - }
$$

$$
\overline { { { \mathsf { t } } ( x ) \mapsto M \parallel \mathsf { r i g h t } ( y ) \mapsto N } } \} \to N \{ y : = V \} ^ { \mathrm { E } } ^ { - }
$$

# Reglas de congruencia

$$
\frac { \to M ^ { \prime } } { \to \mathsf { l e f t } ^ { \tau } ( M ^ { \prime } ) } \mathrm { E \mathrm { - } I N L } \qquad \frac { \to M \to M ^ { \prime } } { \mathsf { r i g h t } ^ { \tau } ( M ) \to \mathsf { r i g h t } ^ { \tau } ( M ^ { \prime } ) }
$$

$$
{ \begin{array} { c } { M  M ^ { \prime } } \\ { \neg \complement { \mathsf { s e e ~ } } M \{ \mathsf { l e f t } ( x ) \mapsto N \parallel \mathsf { r i g h t } ( y ) \mapsto P \} } \\ {  { \mathsf { c a s e ~ } } M ^ { \prime } \{ \mathsf { l e f t } ( x ) \mapsto N \parallel \mathsf { r i g h t } ( y ) \mapsto P \} } \end{array} } \qquad 
$$

Absurdo

$$
3 0
$$

![](images/0f858ee58b2af578fa9affd059b176931d5b53c0808c210aeda632323be09f2a.jpg)

# Absurdo

$$
\frac { \Gamma \vdash M : \bot } { \Gamma \vdash \mathsf { c a s e } ^ { \tau } \ M \{ \} : \tau } \bot _ { e }
$$

Notar que no hay constructores para el tipo ⊥.   
El tipo ⊥ es el tipo vac´ıo (sin habitantes).   
Se puede definir como un tipo de datos algebraico sin constructores.   
El eliminador es un case con 0 ramas.   
Las ocurrencias de caseτ $M \{ \}$ siempre corresponden a situaciones imposibles (c´odigo inalcanzable).

# C´alculo-λ⊥: resumen

# Tipos y t´erminos

$$
\begin{array} { r c l } { \tau , \sigma , \dots } & { \mathrel { \mathop : } = } & { \dots \big | \quad \bot } \\ { M , N , \dots } & { \mathrel { \mathop : } = } & { \dots \big | \quad { \mathsf { c a s e } } ^ { \tau } \ M \{ \} } \end{array}
$$

# Reglas de tipado

$$
\frac { \Gamma \vdash M : \bot } { \Gamma \vdash \mathsf { c a s e } ^ { \tau } \ M \{ \} : \tau } \bot _ { e }
$$

No se extienden los valores ni las reglas de reducci´on.

# Tipo Unit

Se puede considerar una extensi´on de NJ con la f´ormula ⊤ (“verdadero”):

El c´alculo- $\lambda ^ { \top }$ resulta de la siguiente extensi´on:

$$
\begin{array} { l l l } { \sigma , \tau , . . . } & { : : = } & { . . . \mid \top } \\ { M , N , P , . . . } & { : : = } & { . . . \mid \star } \end{array}
$$

Con una ´unica regla de tipado:

El tipo ⊤ es un tipo algebraico con un ´unico constructor ⋆.

# Propiedades

El c´alculo- $\lambda ^ { \times , + , \perp , \top }$ tiene buenas propiedades:

1. Unicidad de tipos. Si Γ ⊢ M : τ y Γ ⊢ M : σ son derivables, entonces $\tau = \sigma$ .

2. Weakening + Strengthening. Si $\Gamma \vdash M : \tau$ es derivable y $\mathsf { f v } ( M ) \subseteq \mathsf { d o m } ( \Gamma \cap \Gamma ^ { \prime } )$ entonces $\Gamma ^ { \prime } \vdash M : \tau$ es derivable.

3. Determinismo. Si $M  N _ { 1 }$ y $M  N _ { 2 }$ entonces $N _ { 1 } = N _ { 2 }$ .

4. Preservaci´on de tipos. $\mathsf { S i } \vdash M : \tau \lor M  N$ entonces ⊢ N : τ .

5. Progreso. $\mathsf { S i } \vdash M : \tau$ entonces:

5.1 O bien M es un valor.   
5.2 O bien existe $N$ tal que $M  N$ .

6. Terminaci´on. $\mathsf { S i } \vdash M : \tau$ , entonces no hay una cadena infinita de pasos:

$$
M  M _ { 1 }  M _ { 2 }  . . .
$$

# Correspondencia de Curry-Howard

Teorema (Correspondencia de Curry–Howard)

Son equivalentes:

1. $\tau _ { 1 } , \ldots , \tau _ { n } \vdash \sigma$ es derivable en NJ   
2. Existe un t´ermino M tal que $x _ { 1 } : \tau _ { 1 } , . . . , x _ { n } : \tau _ { n } \vdash M : \sigma .$

# Nota

En el teorema de arriba identificamos t´acitamente los s´ımbolos:

<table><tr><td rowspan=1 colspan=1>→</td><td rowspan=1 colspan=1>→</td></tr><tr><td rowspan=1 colspan=1>×</td><td rowspan=1 colspan=1>&gt;</td></tr><tr><td rowspan=1 colspan=1>+</td><td rowspan=1 colspan=1>V</td></tr></table>

# Consistencia de la l´ogica

La relaci´on entre reducci´on y pruebas permite concluir que la l´ogica es consistente.

# Corolario

El juicio ⊢ ⊥ no es derivable en NJ.

Se obtiene a partir del siguiente razonamiento:

Debe existir M, tal que ⊢ M : ⊥.   
Por terminaci´on y preservaci´on de tipos, deber´ıa existir un valor V , tal que ⊢ V : ⊥. Por analisis de casos en los posibles valores, se puede concluir que no existe.

# Sobre la negaci´on

La negaci´on se puede codificar como:

$$
\neg \sigma \equiv ( \sigma  \bot )
$$

Notar que la regla:

¬i corresponde a ⇒i ¬e corresponde ${ \sf a } \Rightarrow$ e

No hay necesidad de extender el c´alculo- $\lambda$ con negaci´on.

$$
\mathsf { S o b r e ~ l o s ~ b o o l e a n o s }
$$

Los ignoramos porque se pueden codificar.

# Booleanos como sumas

# Correspondencia de Curry–Howard

$$
\mathrm { O p e r a d o r \ d e \ p u n t o \ f i j o }
$$

# 39

# Recursi´on

Extendemos la sintaxis con un nuevo operador:

$$
M : : = \dots \mid \mathsf { f i x } \ M
$$

No se precisan nuevos tipos pero s´ı una regla de tipado.

$$
\frac { \Gamma \vdash M : \tau \to \tau } { \Gamma \vdash \mathsf { f i x } M : \tau } \mathrm { T - F I X }
$$

# Sem´antica operacional small-step

No hay valores nuevos pero s´ı reglas de evaluaci´on nuevas.

$$
\frac { M \to M ^ { \prime } } { \mathrm { f i x ~ } M \to \mathrm { f i x ~ } M ^ { \prime } } \mathrm { E \mathrm { - } F I X }
$$

$$
4 1
$$

fix $\overline { { \left( \lambda x : \tau . M \right) \to M \{ x : = { \bf f i x } \left( \lambda x : \tau . M \right) \} } } ^ { 1 }$ E-FIXBETA

# Ejemplos

# Sea M el t´ermino

λf : nat → nat.   
λx : nat.   
if iszero(x) then 1 else x ∗ f (pred(x))

# Ejemplos

Ahora podemos definir funciones parciales:

$$
\mathsf { f i x } \left( \lambda x : \sigma . x \right)
$$

Notar que ⊢ fix $( \lambda x : \sigma . x ) : \sigma$ para cualquier $\sigma$

En particular, vale para $\sigma = \bot$

En consecuencia, si se extiende NJ con un operador fix , la l´ogica resulta inconsistente (⊢ ⊥ ser´ıa derivable)

$$
4 4
$$

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

Lectura recomendada   
Cap´ıtulos 3 y 4 del libro de Sørensen y Urzyczyn.   
Morten Sørensen y Pawe l Urzyczyn. Lectures on the Curry–Howard Isomorphism   
Elsevier, 2006.