Esta partedelexamenseaprearespondiendocorrectamentealmenos el $7 5 \%$ de las preguntas.Esnecesarioaprobaresta parte para acceder a la correccion de la segunda parte. Responder las preguntas en los espacios indicados.

Pregunta 1:La siguientedefinici6n utiliza recursion explicita? Justificar.

esHoja :: AB a -> Bool   
esHoja Nil $\Bumpeq$ False   
esHoja (Bin i r d) $=$ esNil i && esNil d where esNil Nil $=$ True esNil_ $=$ False

Respuesta:Ng porque no se decine ninguna Funcioo gue Se llame asimismaenog no nay elamado ewrsivo)

Pregunta 2:Indicar el tipo del esquema de recursion estructural foldABNv para el siguiente tipo: data ABNV $a =$ Hojaa丨Uni a（ABNVa）丨Bi（ABNVa）a （ABNV a)

Respuesta:AbABNUuabbd Bbd $\{ ( 1 + P Q N ) \cdot 1 \div ( a  b )  ( a  b  b )  ( b  a  b  b )  A P N \} a  b$

Pregunta 3:iQué tipo de recursion utiliza la siguiente definicion? (Indicar la mas especifica).

listasQueSuman ::Int $\scriptstyle - >$ [[Int]]   
listasQueSuman $0 = [ [ ] ]$   
listasQueSuman n / $\mathrm { ~ n ~ } > \mathrm { ~ 0 ~ } = \mathrm { ~ } [ \mathrm { x }$ : xs 丨 x <- [1..n]， xs <- listasQueSuman (n-x)]

a.Estructural c. Global b.Primitiva d. Iterativa/a la cola

Respuesta:-

Pregnta4:Ialdelssgetesdvisioseospudejstifersepouedeeea cion.

a.Hay2 casos:

c. El arbol binario t puede ser:

altura i≥altura d altura i<altura d

[x] x:y:ys

Binird (Con i, d : AB a).

(Con r :a,iyd :AB a).

# Respuesta:

Pe duccio: [a].ys:[a]length (entrelazar xs ys) $\ L =$ length xs $^ +$ length ys

Pregunta 6:Si sequisierademostrar que vale-PvQ├Qv(PQ)pordeduccion natural,icualseria el error al aplicar el siguiente paso?

Respuesta:El eor es guepiedo infoxmacion neresaria para poder dems taloga que con v engo orna de probar que sienpre vale

Pregunta 7:Indicar aquetermino reduce enunpaso laiguiente expresion,ymedianteque regla(s): if isZero(zero)then Pred(Suc(zero))elsezero

seSu

Pregunta 8: Sea la extension del Calculo Lambda con listas vista en la guia:

$$
 = \begin{array} { r l } { - } & { { } \ldots \mid [ ] _ { \tau } ~ { \mid } ~ M : : M ~ { \mid } ~ \cos e ~ M ~ \mathrm { o f } ~ \{ [ \mathbf { \Lambda } ] \sim M ~ \mid ~ h : t \sim M \} ~ { \mid } ~ \mathrm { f o l d r } ~ M \mathrm { b a s e } \sim M ; \mathrm { r e c } ( h ) } \end{array}
$$

Indicar el error en la siguiente regla de computo para foldr:

Re $\begin{array} { r l } & { \frac { 1 } { \mathrm { f o l d r } V _ { 1 } : = V _ { 2 } \mathrm { b a s e } \to M ; \mathrm { r e c } ( h , r ) \to N } \xrightarrow [ ] { \mathbb { C } \mathrm { P } \to \mathrm { D L B } \times \mathrm { C O N R } } } \\ & { \mathrm { s p u e s t a : ~ \{ \alpha \leq 1 \leq r e i d . } { o r d . } ~ { n \in \mathbb { A } \cap \mathbb { A } \cap \mathbb { A } \cap \mathbb { C } \land \mathrm { C o c } \land \mathrm { C o c } \land \mathrm { C i d . } } }  \\ & { \{ \odot \quad \Omega \otimes \alpha \quad \mathrm { c d . } \mathrm { c a . d . } \mathrm { d o c . ~ d i . } \quad \mathrm { e l . ~ e l . ~ \Omega \cap \mathrm { d a c } \setminus \cup _ { \Omega \setminus \Omega \setminus \Omega \setminus \Omega \cap \mathrm { C . ~ c o } \cup \mathrm { A } \setminus \Omega } } } \\ & { \cdot \mathrm { c o ~ \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha } } \\ & { \mathrm { s p a r . ~ \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \alpha \leq \beta \leq \alpha \leq \alpha \leq \alpha } } \\ & { \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \times } \\ & { \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \times } \\ & { \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \times \mathrm { ~ a ~ s \ e \to \Theta \times \Omega \to \alpha \times \Omega \to \alpha \times \beta \to \alpha \times \beta \ } } \\ &  \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \ \end{array}$ niableshyr   
POC ganlascen geadelbeua .cola.