# Paradigmas de Programaci´on

# Resoluci´on SLD Prolog

2do cuatrimestre de 2025

Departamento de Computaci´on Facultad de Ciencias Exactas y Naturales Universidad de Buenos Aires

# Resoluci´on SLD

# Sem´antica operacional de Prolog

Aspectos extra-l´ogicos

$$
2
$$

# Resoluci´on general

# Recordemos

Para determinar si una f´ormula de primer orden $\sigma$ es v´alida:

1. Pasar su negaci´on $( \neg \sigma )$ a forma clausal. Se obtiene un conjunto $\mathcal { C }$ de cl´ausulas tal que ¬σ es satisfactible sii $\mathcal { C }$ es satisfactible.

2. Aplicar repetidamente la regla de resoluci´on:

$$
\begin{array} { r l r } { \cdot , \quad , \ell _ { 1 } , \ldots , \ell _ { n } \} } & { { } \{ \neg \quad , \dots , \neg \quad , \ell _ { 1 } ^ { \prime } , \ldots , \ell _ { m } ^ { \prime } } \\ { \mathsf { \bf S } = \mathsf { m g u } ( \{ \quad \stackrel { ? } { = } \quad }  & { { } \stackrel { ? } { = } \dots \stackrel { ? } { = } \quad \stackrel { ? } { = } \quad \stackrel { ? } { = } \quad \stackrel { ? } { = } \quad \stackrel { ? } { = } \quad \stackrel { ? } { = } } & { { } \stackrel { ? } { = } } \end{array}
$$

$$
\pmb { \mathsf { S } } ( \{ \ell _ { 1 } , \hdots , \ell _ { n } , \ell _ { 1 } ^ { \prime } , \hdots , \ell _ { m } ^ { \prime } \} )
$$

3. Si se alcanza la cl´ausula vac´ıa, ¬σ es insatisfactible y $\sigma$ v´alida.   
4. El m´etodo puede no terminar.

# Resoluci´on general

$$
4
$$

B´usqueda. Elegir dos cl´ausulas.   
Selecci´on. Elegir un subconjunto de literales de cada cl´ausula.

Aplicar el m´etodo de resoluci´on general puede ser muy costoso. Cada paso requiere usar criterios de b´usqueda y selecci´on:

La cantidad de opciones es exponencial en el tama˜no del problema.   
Adem´as. . . Cada paso agrega una nueva cl´ausula.   
En cada paso se deben resolver ecuaciones de unificaci´on.   
El m´etodo requiere usar breadth-first search (BFS).

# Resoluci´on SLD

Veremos una variante de la resoluci´on general, la resoluci´on SLD.   
Es un tradeoff: menor generalidad a cambio de mayor eficiencia.

# Menor generalidad

No se puede aplicar sobre f´ormulas de primer orden arbitrarias.   
S´olo se puede aplicar sobre cl´ausulas de Horn.

# Mayor eficiencia

Se reducen las opciones de b´usqueda/selecci´on.

# Cl´ausulas de Horn

Recordemos que una cl´ausula es un conjunto de literales:

$$
\{ \ell _ { 1 } , \ldots , \ell _ { n } \}
$$

donde cada literal es una f´ormula at´omica posiblemente negada:

![](images/1bf6bd5042c72a4c51ad49015edf390ca3e620cad7e23a13e81c3217e9bf5a27.jpg)

# Definici´on (Cl´ausulas de Horn)

Las cl´ausulas son de los siguientes tipos, dependiendo del n´umero de literales positivos/negativos que contienen:

<table><tr><td></td><td>#positivos</td><td>#negativos</td></tr><tr><td>cläusula objetivo</td><td>0</td><td>*</td></tr><tr><td>cläusula de definición cläusula de Horn</td><td>1</td><td>*</td></tr><tr><td></td><td>≤1</td><td>*</td></tr></table>

# Cl´ausulas de Horn

Ejemplo — cl´ausulas de Horn

![](images/51e17ea273ee65952f3aca5241a331be1b3a94b46e2a99498caba088de5e0521.jpg)

# Observaci´on

Hay f´ormulas que no se pueden escribir como cl´ausulas de Horn. Por ejemplo:

# Regla de resoluci´on SLD

La regla de resoluci´on SLD involucra siempre a una cl´ausula de definici´on y una cl´ausula objetivo:

$$
\begin{array} { r } { \cdot \cdot , t _ { k } \big ) , \neg \sigma _ { 1 } , \cdot \cdot \cdot , \neg \sigma _ { n } \big \} \qquad \{ \neg \mathsf { P } ( s _ { 1 } , \cdot \cdot \cdot , s _ { k } ) , \neg \prime } \\ { \mathsf { S } = \mathsf { m g u } ( \{ \mathsf { P } ( t _ { 1 } , \cdot \cdot \cdot , t _ { k } ) \overset { ? } { = } \mathsf { P } ( s _ { 1 } , \cdot \cdot \cdot , s _ { k } ) } \end{array}
$$

$$
\mathbf { S } ( \{ \quad \quad , \ldots , \quad \quad , \quad \quad , \ldots , \quad \quad \} )
$$

Caso particular de la regla de resoluci´on general.   
La selecci´on es binaria (un literal de cada cl´ausula).   
La resolvente es una nueva cl´ausula objetivo.

$$
\mathsf { D e r i v a c i o n e s } \mathsf { S L D }
$$

Una derivaci´on SLD comienza con $n \geq 0$ cl´ausulas de definici´on y una cl´ausula objetivo:

$$
 { \boldsymbol { D } } _ { 1 } \qquad \dots \qquad { \boldsymbol { D } } _ { n }
$$

En cada paso:

Se elige una cl´ausula definici´on Dj con $1 \leq j \leq n$ .   
Se aplica la regla de resoluci´on SLD sobre Dj y Gi .   
▶ La resolvente es una nueva cl´ausula objetivo $G _ { i + 1 }$ .

# Derivaciones SLD

Es decir, dado un conjunto de cl´ausulas:

$$
 { \boldsymbol { D } } _ { 1 } \qquad \dots \qquad { \boldsymbol { D } } _ { n }
$$

una derivaci´on SLD es de la forma:

![](images/31d505e7ebe990cc49474a6d1b8b6e8fe26c8e72ab918f905281a99ceb4f51ca.jpg)

Cada $C _ { j }$ debe ser alguna de las cl´ausulas originales $\{ D _ { 1 } , \ldots , D _ { n } \}$ .   
La cl´ausula $\cdot$ se obtiene aplicando resoluci´on SLD sobre $C _ { j }$ y Gi .

$$
\mathsf { D e r i v a c i o n e s } \mathsf { S L D }
$$

# Observaciones:

La b´usqueda se simplifica.   
Se limita a elegir $C _ { j }$ como una de las n cl´ausulas $D _ { 1 } , \ldots , D _ { n }$ .   
La cl´ausula objetivo $G _ { j }$ est´a fijada, no hay alternativas.   
La selecci´on se simplifica.   
Se limita a elegir uno de los literales negativos de Gi .   
La cl´ausula de definici´on $C _ { j }$ tiene un ´unico literal positivo.

# Derivaciones SLD

# Ejemplo

Dadas las hip´otesis:

$$
\begin{array} { r l } & { \forall \mathbf { X } . \mathbf { a } \big ( 0 , \mathbf { X } , \mathbf { X } \big ) } \\ & { \forall \mathbf { X } . \forall \mathbf { Y } . \forall \mathbf { Z } . \big ( \mathbf { a } ( \mathbf { X } , \mathbf { Y } , \mathbf { Z } ) \Rightarrow \mathbf { a } ( \mathbf { s } ( \mathbf { X } ) , \mathbf { Y } , \mathbf { s } ( \mathbf { Z } ) \big ) } \end{array}
$$

Queremos demostrar:

3 ∃X. a(s(0), X, s(s(s(0))))

Es decir, quere $\begin{array} { r l } & { \mathsf { m o s ~ p r o b a r ~ q u e ~ ( \left[ 1 \right] \wedge \left[ 2 \right] ) } \Rightarrow \left[ 3 \right] \mathsf { e s ~ v a l i t } } \\ & { - ( ( \left[ 1 \right] \wedge \left[ 2 \right] ) \Rightarrow \left[ 3 \right] ) \mathsf { e s ~ i n s a t i s f a c t i b l e } . } \\ & { \mathsf { v e r ~ q u e ~ \left[ 1 \right] } \wedge \left[ 2 \right] \wedge \mathsf { - \left[ 3 \right] \mathsf { e s ~ i n s a t i s f a c t i b l e } } } \end{array}$ a. Basta ver que Es decir, basta .

$$
\mathsf { D e r i v a c i o n e s } \mathsf { S L D }
$$

Escribiendo 1 ∧ 2 ∧ ¬ 3 en forma clausal, tenemos:

$$
\begin{array} { r } { \begin{array} { r l } { \boxed { 1 } } & { \{ \mathbf { a } ( 0 , \mathbf { X } , \mathbf { X } ) \} } \\ { \boxed { 2 } } & { \{ \begin{array} { r l r } \end{array} } , \mathbf { a } ( \mathbf { s } ( \mathbf { X } ) , \mathtt { Y } , \mathbf { s } ( \mathbf { Z } ) ) \} } \\ & { \{ \ } & \end{array}  \end{array}
$$

1 y 2 son cl´ausulas de definici´on.   
3 es la cl´ausula objetivo.

Busquemos una refutaci´on SLD (derivaci´on SLD que llega a $\{ \} )$ :

$$
\begin{array} { r l } { \boxed { 1 } } & { \left\{ \mathsf { a } \big ( 0 , \mathrm { X } _ { 1 } , \mathrm { X } _ { 1 } \big ) \right\} } \\ { \boxed { 2 } } & { \left\{ \lnot \mathrm { a } \big ( \mathrm { X } _ { 2 } , \mathrm { Y } _ { 2 } , \mathrm { Z } _ { 2 } \big ) , \mathsf { a } \big ( \mathrm { s } \big ( \mathrm { X } _ { 2 } \big ) , \mathrm { Y } _ { 2 } , \mathrm { s } \big ( \mathrm { Z } _ { 2 } \big ) \big ) \right\} } \\ { \boxed { 3 } } & { \left\{ \lnot \mathrm { a } \big ( \mathrm { s } \big ( 0 \big ) , \mathrm { X } _ { 3 } , \mathrm { s } \big ( \mathrm { s } \big ( \mathrm { s } \big ( 0 \big ) \big ) \big ) \right\} } \end{array}
$$

$$
\begin{array} { r l } & { \mathsf { P o r } \qquad \mathsf { y } \left[ 2 \right] = \{ \qquad } \} \\ & { \mathsf { S } _ { 4 } = \{ \mathrm { X } _ { 2 } : = 0 , \mathrm { X } _ { 3 } : = \mathrm { Y } _ { 2 } , \mathrm { Z } _ { 2 } : = \mathtt { s } ( \mathtt { s } ( 0 ) ) \} } \\ & { \quad = \{ \qquad } \\ & { \qquad \mathrm { y } \left[ \overline { { 1 } } \right] = \{ \} } \\ & { \mathsf { S } _ { 5 } = \{ \mathrm { Y } _ { 4 } : = \mathtt { s } ( \mathtt { s } ( 0 ) ) , \mathrm { X } _ { 1 } : = \mathtt { s } ( \mathtt { s } ( 0 ) ) \} } \\ & { \quad = \{ \qquad \} } \end{array}
$$

$$
^ { 1 4 }
$$

# Derivaciones SLD

Definici´on (Sustituci´on respuesta)

Dada una refutaci´on SLD, con pasos:

$$
\begin{array} { c c c c c c } { { \xrightarrow { \bullet _ { 1 } } } } & { { \xrightarrow { \bullet _ { 2 } } } } & { { \cdots } } & { { } } & { { \xrightarrow { \bullet _ { n - 1 } } } } \\ { { C _ { 1 } \nearrow } } & { { C _ { 2 } \nearrow } } & { { } } & { { } } & { { C _ { n - 1 } \nearrow } } \end{array}
$$

la sustituci´on respuesta es la composici´on $\mathbf { S } _ { n - 1 } \circ \ldots \circ \mathbf { S } _ { 1 } .$

Ejemplo — sustituci´on respuesta

En el ejemplo anterior, la sustituci´on respuesta es $\mathsf { S } _ { 5 } \circ \mathsf { S } _ { 4 }$

El valor de X en la cl´ausula objetivo original 3 es s(s(0)). Esto dice que ${ \tt X } = { \tt s } ( { \tt s } ( 0 ) )$ verifica nuestra consulta original:

# Completitud del m´etodo de resoluci´on SLD

El m´etodo de resoluci´on es completo para cl´ausulas de Horn.

M´as precisamente, si $D _ { 1 } , \ldots , D _ { n }$ son cl´ausulas de definici´on y G una cl´ausula objetivo:

# Teorema

Si $\{ D _ { 1 } , \dots , D _ { n } , G \}$ es insatisfactible, existe una refutaci´on SLD.

# Resoluci´on SLD

# Sem´antica operacional de Prolog

Aspectos extra-l´ogicos

$$
^ { 1 7 }
$$

# Sem´antica de Prolog

Un programa en Prolog es una lista de cl´ausulas de definici´on.   
Una consulta en Prolog es una cl´ausula objetivo.

La notaci´on cambia ligeramente.

# Ejemplo

<table><tr><td>Clausulas</td><td>Prolog</td></tr><tr><td>{a(0, x, x)}</td><td>a(0,x,x).</td></tr><tr><td>{a(s(x),𝑌,s(Z), -a(x,Y,Z)}</td><td>a(s(x),Y,s(Z)):-a(x,Y,Z).</td></tr><tr><td>{-a(s(0),x,s(s(s(0)))}</td><td>？-a(s(0),x,s(s(s(0)))).</td></tr></table>

Las cl´ausulas son listas: el orden y la multiplicidad son relevantes.

$$
\mathsf { S e m a n t i c a \ d e \ P r o l o g }
$$

La ejecuci´on se basa en la regla de resoluci´on SLD. Escrita con la notaci´on de Prolog:

$$
\begin{array} { r l } { \mathsf { \Gamma } } & { { } \cdot \qquad \mathsf { p } ( s _ { 1 } , . . . , s _ { k } ) : - } \\ { \mathsf { \Gamma } } & { { } \mathsf { \Gamma } } & { { \mathsf { S } } = \mathsf { m g u } ( \qquad \mathsf { \Gamma } } & { { \mathsf { I } } = \mathsf { p } ( s _ { 1 } , . . . , s _ { k } ) ) } \end{array}
$$

$$
\overline { { \mathsf { S } ( ? - \tau _ { 1 } , \hdots , \tau _ { m } , \sigma _ { 1 } , \hdots , \sigma _ { n } . ) } }
$$

El orden de los literales en la cl´ausula objetivo es relevante.   
Criterio de selecci´on: elegir siempre el primer literal de la cl´ausula.

# Sem´antica de Prolog

Prolog busca sucesivamente todas las refutaciones haciendo DFS.   
Criterio de b´usqueda: las reglas se usan en orden de aparici´on.

# Ejemplo — ´arbol de refutaci´on

![](images/ff54e4b2e0db1f13f626723e6326f95b01cc24ca978c6238b44764cb3362f99f.jpg)

# Sem´antica de Prolog

La exploraci´on depth-first (DFS) es incompleta.   
Puede provocar que Prolog nunca encuentre refutaciones posibles.

Ejemplo — incompletitud de DFS

esMaravilloso(X) :- esMaravilloso(suc(X)).   
esMaravilloso(cero).   
?- esMaravilloso(cero).   
?- esMaravilloso(suc(cero)). ?- esMaravilloso(suc(suc(cero))). ?- esMaravilloso(suc(suc(suc(cero)))).

# El orden de las reglas se torna relevante.

Tradeoff: mayor eficiencia a cambio de menor declaratividad.   
La exploraci´on breadth-first (BFS) es completa pero muy costosa.

# Sem´antica de Prolog

Al unificar, Prolog no usa la regla occurs-check.   
Por ejemplo, X unifica con f(X). Esto es incorrecto.   
Puede provocar que Prolog encuentre una “refutaci´on” incorrecta.   
Ejemplo — refutaci´on incorrecta por omisi´on de occurs check   
esElSucesor(X, suc(X)). ?- esElSucesor(Y, Y). .{Y := X, X := suc(X)} Tradeoff: mayor eficiencia a cambio de incorrecci´on l´ogica.   
En muchos contextos la regla occurs-check es innecesaria.   
La carga de probar correcci´on recae en lxs programadorxs.

# Ejemplo: concatenaci´on de listas

c([], Ys, Ys).   
c([X | Xs], Ys, [X | Zs]) :- c(Xs, Ys, Zs). ?- c([1, 2], [3, 4], Zs). ?- c([2], [3, 4], Zs1). ... .....{Zs := [1 | Zs1]} ?- c([], [3, 4], Zs2). .. {Zs := [1, 2 | Zs2]} {Zs := [1, 2, 3, 4]}   
?- c([1, 2], Ys, [1, 2, 3, 4]).   
?- c([2], Ys, [2, 3, 4]). ?- c([], Ys, [3, 4]). ： {Ys := [3, 4]}

# Ejemplo: concatenaci´on de listas

![](images/02cd8271a8860eb1ad02ef748cb8019dd03c6584693e9b07c7775e94069c896d.jpg)

# Ejemplo: concatenaci´on de listas

![](images/b2a9f2b3accc9d266e36897343f3580bd56eafea4801186d2a6045118f217d46.jpg)

# Resoluci´on SLD

# Sem´antica operacional de Prolog

Aspectos extra-l´ogicos

$$
^ { 2 6 }
$$

$$
\mathsf { O p e r a d o r \ d e \ c o r t e \ ( c u t ) }
$$

Consideremos el siguiente programa:

padre(zeus, atenea). % ...base de conocimiento..   
ancestro(X, Y) :- padre(X, Y).   
ancestro(X, Y) :- padre(X, Z), ancestro(Z, Y).

![](images/f57974c0d215bb0a33e1f433cb5ce63004663693eca7f9695a97a6ad92bb4269.jpg)

Nos gustar´ıa tener una manera de podar el ´arbol de b´usqueda.

$$
\mathsf { O p e r a d o r \ d e \ c o r t e \ ( c u t ) }
$$

Reescribimos el programa agregando un corte (“!”):

padre(zeus, atenea). % ...base de conocimiento..   
ancestro(X, Y) :- padre(X, Y), !.   
ancestro(X, Y) :- padre(X, Z), ancestro(Z, Y).

El operador ! no tiene una interpretaci´on declarativa/l´ogica.

Es un operador extra-l´ogico.

Su comportamiento se explica desde el punto de vista operacional.

El operador de corte indica que, si se lo alcanza, no se deben explorar alternativas a la regla en la que aparece.

$$
\mathsf { O p e r a d o r \ d e \ c o r t e \ ( c u t ) }
$$

# Sem´antica del operador de corte

El predicado ! tiene ´exito inmediatamente.

Al momento de hacer backtracking:

Se vuelve atr´as hasta el punto en el que se eligi´o usar la regla que hizo aparecer el operador de corte.   
Se descartan todas las elecciones alternativas.   
Se contin´ua buscando hacia atr´as.

$$
\mathsf { O p e r a d o r \ d e \ c o r t e \ ( c u t ) }
$$

Gr´aficamente:

![](images/ece71489ccb0f306c5c7b930e36dcccaaeefae0d7802b610e40c66e706d853bd.jpg)

# Operador de corte (cut)

Ejemplo — cortes “benignos” (green cuts)

En algunos casos, ! no altera la sem´antica del programa.   
Puede servir para construir programas equivalentes m´as eficientes. add(N, zero, N) :- !.   
add(zero, N, N).   
add(suc(N), M, suc(P)) :- add(N, M, P).

?- add(suc(suc(suc(suc(. . .)))), zero, P).

Ejemplo — cortes “riesgosos” (red cuts)

En otros casos, la sem´antica puede verse alterada. maximo(A, B, A) :- A >= B, !   
maximo(A, B, B). ?- maximo(2, 1, C). ?- maximo(2, 1, 1).   
>> C = 2 >> true.

# Negaci´on por falla

# Definici´on (operador de negaci´on)

Si fail es un predicado que falla siempre, se puede definir la negaci´on en Prolog as´ı:

not(P) :- P, !, fail.   
not(P).

Observaci´on. not(P) tiene ´exito si y s´olo si P falla.

Ejemplo — negaci´on por falla

fruta(pera).

![](images/bce7b34a0fe4a40ad81f554aeb564b2b193fff6941c1ee0c6cece4a6a6ea9172.jpg)

![](images/87e8904efee3c1f9a34715bfa34a53ad6f35bcbd93765811ba3183ec1a924709.jpg)

# Negaci´on por falla

La negaci´on por falla no coincide con la negaci´on l´ogica.

Ejemplo — negaci´on por falla ̸= negaci´on l´ogica fruta(pera). verdura(papa).

![](images/e46c347b91709fab3059f022aab57181adbcb1120b869d15b4a5df365bf22293.jpg)

$$
3 3
$$

El orden de los literales en la consulta se vuelve relevante.

Esto atenta contra la declaratividad.

# Ejemplo

1. Definir append(L1, L2, L3).   
2. Definir ocurreAlMenosUnaVez(X, L) usando append/3.   
3. Definir ocurreAlMenosDosVeces(X, L) usando append/3.   
4. Definir ocurreExactamenteUnaVez(X, L) combinando las   
anteriores.

# ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿? ? ? ? ? ? ? ? ?

# Lectura recomendada

Cap´ıtulos 2 y 3 del libro de Nilsson y Ma luci´nski.

Ulf Nilsson y Jan Ma luzy´nski. Logic, Programming and Prolog (2nd. edition).

John Wiley & Sons Ltd., 1995.