# 1. Sintaxis de Prolog

# T´erminos:

Constantes: enteros (Ejs: 3, 4), ´atomos (Ejs: juan, pi) (en min´uscula).

Variables: Ejs: X, Casa (en may´uscula)

Estructuras: functor, seguido de uno o m´as argumentos, es decir, si f es un functor de aridad n, $f ( t _ { 1 } , . . . , t _ { n } )$ es un t´ermino si $t _ { i }$ es un t´ermino $\forall i$ . Un t´ermino se llama cerrado si no posee variables. Observar que no se permiten predicados anidados.

F´ormulas at´omicas: De la misma forma que en primer orden, si $P$ es un s´ımbolo de predicado de aridad $n$ , luego $P ( t _ { 1 } , . . . , t _ { n } )$ es una f´ormula at´omica $\forall t _ { i }$ .

Tipos de cl´ausulas:

Cl´ausula de programa: conforman el programa l´ogico. Tienen la forma de L :- B1,...,BS. Y se interpreta como: L es verdadero si valen B1,... y BS. Si S=0, se dice que la cl´ausula de programa es un hecho. Se puede pensar el :- como una implicaci´on ←.

Cl´ausula objetivo: tienen la forma de B1,...,BS y es lo que queremos probar.

# 2. Sustituci´on y Unificaci´on

Llamemos T erm al conjunto formado por todos los t´erminos y todos los predicados. Una sustituci´on en una funci´on $\sigma : V a r i a b l e s  T e r m$ tal que $\sigma ( X ) \neq X$ para finitos $X$ (i.e. tiene dominio finito).

Notaci´on: si el dominio de $\sigma$ es $X _ { 1 } , . . . , X _ { n }$ , se nota $\sigma = \{ X _ { 1 } \to \sigma ( X _ { 1 } ) , . . . , X _ { n } \to \sigma ( X _ { n } ) \}$ . Por ejemplo, $\sigma = \{ X \to f ( a ) , Y \to X \}$ .

Se puede extender $\sigma$ a la funci´on $\widehat { \sigma } : T e r m  T e r m$ , de la siguiente manera:

■ ${ \widehat { \sigma } } ( X ) = \sigma ( X )$ si $X$ es una variable.   
$\widehat { \sigma } ( g ( t _ { 1 } , . . . , t _ { n } ) ) = g ( \widehat { \sigma } ( t _ { 1 } ) , . . . , \widehat { \sigma } ( t _ { n } ) )$ si $t _ { i }$ es un t´ermino y $g$ un functor o un predicado.   
${ \widehat { \sigma } } ( c ) = c$ si $c$ es una constante.

(i.e. s´olo interesan las variables).

A partir de ahora vamos anotar $\widehat { \sigma }$ directamente como $\sigma$ . Por ejemplo, si tomamos la sustituci´on $\sigma$ del ejemplo anterior: $\sigma ( g ( X , Y ) ) = g ( \sigma ( X ) , \sigma ( Y ) ) = g ( f ( a ) , X )$ .

El problema de unificaci´on se define de la siguiente manera: Dado un conjunto de ecuaciones $S =$ $\{ s _ { 1 } = ^ { ? } t _ { 1 } , . . . , s _ { n } = ^ { ? } t _ { n } \}$ , donde $s _ { i }$ y $t _ { i }$ son t´erminos, queremos saber si existe una sustituci´on $\sigma$ tal que $\sigma ( s _ { i } ) = \sigma ( t _ { i } ) \forall 1 \leq i \leq n$ . Si esta sustituci´on existe, se dice que $\sigma$ es un unificador de $S$ .

Tener en cuenta que la igualdad utilizada es puramente sint´actica(por ejemplo $3 \neq 2 + 1$ ).

Se dice que $S$ es unificable si existen una o m´as sustituciones que cumplan lo dicho anteriormente (unificadores).

Es claro que pueden existir m´as de un unificador para un conjunto $S$ . Por ejemplo, si $S = \{ X = ^ { \stackrel { . \prime } { . } } Y \}$ , los siguientes son unificadores de $S$ : $\sigma _ { 1 } = \{ X \to Y \}$ , $\sigma _ { 2 } = \{ Y  X \}$ , $\sigma _ { 3 } = \{ X \to a , Y \to a \}$ .

Lo que se intenta buscar es el unificador m´as general(mgu) de $S$ . Una sustituci´on $\sigma _ { 1 }$ es m´as general que $\sigma _ { 2 }$ si existe un $\sigma _ { 3 }$ tal que $\sigma _ { 2 } = \sigma _ { 3 } ( \sigma _ { 1 } )$ . Si ahora volvemos al ejemplo, podemos ver que $\sigma _ { 1 }$ y $\sigma _ { 2 }$ son m´as generales que $\sigma _ { 3 }$ . Adem´as, tanto $\sigma _ { 1 }$ como $\sigma _ { 2 }$ son mgu de $S$ .

El problema de encontrar el mgu de un conjunto $S$ es decidible y existen algoritmos eficientes para encontrarlos.Veamos otros ejemplos de conjuntos de ecuaciones:

■ $S = \{ a = ^ { ? } b \}$ no unifica. En general $S = \{ t = ^ { ? } t \}$ unifica.   
■ $S = \{ f ( X ) = ^ { ? } g ( Y ) \}$ no unifica.   
■ $S = \{ f ( X ) = ^ { ? } X \}$ no unifica.

# 3. Regla de Resoluci´on

Dado un programa l´ogico $P$ (conjunto de cl´ausulas de programa) y un goal $G$ , se quiere saber si dicho goal es consecuencia l´ogica de $P$ . La regla de resoluci´on que se utiliza es:

$$
{ \frac { B _ { 1 } , . . . , B _ { i } , . . . , B _ { n } } { \sigma ( B _ { 1 } , . . . , B _ { i - 1 } , A _ { 1 } , . . . , A _ { p } , . . . B _ { i + 1 } , . . . , B _ { n } ) } } \qquad { \mathrm { s i ~ } } \sigma { \mathrm { ~ e s ~ m g u ~ d e ~ } } B _ { i } { \mathrm { ~ y ~ } } C
$$

La conclusi´on de la regla de resoluci´on es el nuevo goal a resolver. Prolog resuelve el goal comenzando desde $B _ { 1 }$ de izquierda a derecha en DFS. El orden en el que recorre el programa $P$ (buscando unificar las cabezas de las reglas) es de arriba hacia abajo. Tener en cuenta que el orden de las cl´ausulas (y subcl´ausulas) en el programa influye en el resultado. Esta es una cuesti´on mas bien implementativa.

Veamos un ejemplo. Sea el siguiente programa $P$

superHeroe(se˜norTostada).   
esValiente(X) :- superHeroe(X).

El goal es esValiente(se˜norTostada). Apliquemos la regla de resoluci´on:

$$
\begin{array} { r l r } {  { \frac { i e n t e ( s e \tilde { n } o r T o s t a d a ) \quad e s V a l i e n t e ( X ) : - s u p e r H e r o e ( X ) : } { s u p e r H e r o e ( s e \tilde { n } o r T o s t a d a ) } } \quad } & { { } \sigma _ { 1 } = \{ X \to s e \tilde { n } o r T o s t a d a \} }  \\ & { } & { \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad } \\ & { \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \frac { s u p e r H e r o e ( s e \tilde { n } o r T o s t a d a ) \quad \quad \quad \quad \quad s u p e r H e r o e ( s e \tilde { n } o r T o s t a d a ) . } { \Pi } \quad } & { \quad \sigma _ { 2 } = \{ \} } \end{array}
$$

Al evaluar un goal, los resultados posibles son los siguientes:

Yes. Se aplic´o la regla de resoluci´on hasta alcanzar la cl´ausula vac´ıa.   
No. Se lleg´o a una cl´ausula del goal que no unifica con ninguna cabeza de regla.   
Loop. El proceso de aplicaci´on de la regla de resoluci´on no termina.

# 4. Ejemplos

Ejemplo de Loop: el programa $P$ es m(X) :- m(X),n(X)

Observaci´on: Prolog utiliza unificaci´on, no tipado. Es decir, una variable puede unificar con cualquier valor y siempre pueden compararse dos valores con =.

Un ejemplo m´as complejo:

mediatico(X) :- programaBasura(Y), participa(X,Y).   
mediatico(X) :- amigoDeTinelli(X).   
programaBasura(cantandoPorUnSue\~no).   
participa(moria, cantandoPorUnSue\~no).   
amigoDeTinelli(sofovich).

Goals:

mediatico(pettinato) $\Rightarrow \mathbb { N } \circ$ .   
mediatico(moria) $\Rightarrow$ Yes.   
mediatico(X) $\Rightarrow$ X $=$ moria; X $=$ sofovich; No.

Veamos que s´ı importa el orden de las cl´ausulas con otro ejemplo:

descendiente(X,Y) :- hijo(X,Y).   
descendiente(X,Y) :- hijo(Z,Y), descendiente(X,Z).   
hijo(bart, homero).   
hijo(homero, abuelo).

Resultado:

$? -$ descendiente(bart,W). ${ \sf W } =$ homero ;   
${ \sf W } =$ abuelo ;   
No $? -$ descendiente(A,B).   
$\tt { A } =$ bart $\mathtt { B } \ =$ homero ;   
$\tt { A } =$ homero $\mathtt { B } \ =$ abuelo ;   
$\tt { A } =$ bart B $=$ abuelo ;   
No

Redefinidiendo el programa:

descendiente(X,Y) :- descendiente(X,Z), hijo(Z,Y).   
descendiente(X,Y) :- hijo(X,Y).   
hijo(bart, homero).

hijo(homero, abuelo).

Resultado:

?- descendiente(bart,W). Loop

Y si lo modificamos otra vez:

descendiente(X,Y) :- hijo(X,Y).   
descendiente(X,Y) :- descendiente(X,Z), hijo(Z,Y).   
hijo(bart, homero).   
hijo(homero, abuelo).

Resultado:

$? -$ descendiente(bart,W). ${ \sf W } =$ homero ;   
${ \sf W } =$ abuelo ;   
Loop

Ejemplos con functores: Vamos a representar los naturales con cero y suc(X). Notar que el comportamiento de los functores se definen a trav´es de los predicados que los utilizan.

nn(cero).   
nn(suc(X)) :- nn(X).   
suma(cero, X, X).   
suma(suc(X), Y, suc(Z)) :- suma(X, Y, Z).

No se estila en Prolog chequear que los argumentos de la suma sean naturales. Se utiliza el hecho de que Prolog sea no tipado como una ventaja.

# 5. Reversibilidad e Instanciaci´on

Reversibilidad: una relaci´on no distingue entre input y output, y eso significa que el goal puede “preguntar” en m´as de una direcci´on. Por ejemplo, en el predicado suma, se puede evaluar suma(X, cero,suc(cero)).

Decimos que un par´ametro est´a instanciado si es un t´ermino cerrado en la sustituci´on actual.

Por ejemplo si se intenta resolver:

mediatico(X) :- programaBasura(Y), participa(X,Y).

Y ya se ha resuelto programaBasura(Y), al evaluar el predicado participa(X,Y), la variable $Y$ ya

se encuentra instanciada. Notaci´on: si un predicado $P ( . . . , X , . . . )$ supone que el par´ametro $X$ est´a instanciado, se nota como $P ( . . . , + X , . . . )$ . Si es indistinto, $P ( . . . , - X , . . . )$ . Esta notaci´on no es sintaxis de Prolog, se utiliza a modo de documentaci´on.

# 6. Aspectos Extral´ogicos

Prolog utiliza un motor de operaciones aritm´eticas que permite realizar operaciones matem´aticas por afuera del motor l´ogico. Esto simplifica el trabajo con dominios conocidos (naturales, racionales, etc).

Decimos que un t´ermino es una expresi´on aritm´etica si es un n´umero natural, una variable instanciada en una expresi´on aritm´etica, o una expresi´on de la forma $t _ { 1 } + t _ { 2 }$ , $t _ { 1 } - t _ { 2 }$ , $t _ { 1 } * t _ { 2 }$ , etc. Donde cada $t _ { i }$ es una expresi´on aritm´etica. Esto significa que todas las variables de una expresi´on aritm´etica se encuentran instanciadas.

Hay que tener especial cuidado en trabajar con expresiones aritm´eticas, porque en caso contrario se genera una excepci´on en Prolog (que no es lo mismo que No).

operador =. $\texttt { X } = \texttt { Y }$ responde Yes si X unifica con Y (esto no es un aspecto extral´ogico). Ejemplos: responde Yes para $\textsf { 5 } = \textsf { 5 }$ , $\texttt { a } = \texttt { a }$ , $\texttt { X } = \texttt { 2 } + 3$ ; pero responde No para $5 \ = \ 2 \ + 3$ .

operador is. X is E. E siempre debe ser una expresi´on aritm´etica. Primero eval´ua E y responde Yes si X unifica con la evaluaci´on de E. Ejemplos: 5 is 2+3, 2+3 is 5, X is 2+3 (asignaci´on).

predicados relacionales. $< , ~ = : = , ~ = <$ , $> = , \ = / =$ . Ambos argumentos deben ser expresiones aritm´eticas. Se eval´uan ambos argumentos y se compara el resultado de la evaluaci´on.

Ejemplo:

factorial(0, 1).   
factorial(N, F) :- $\mathrm { ~ \tt ~ N ~ } > \mathrm { ~ \tt ~ O ~ }$ , N1 is N-1, factorial(N1, F1), F is $\tt N * F 1$ .

Ver lo siguiente:

factorial(3,X) es $\mathrm { X } = 6$ . factorial(X,2) da ERROR. El predicado no es reversible. ¿Qu´e pasa si quitamos la cl´ausula $\mathrm { ~ N ~ } > \ 0 ?$

# 7. Listas

Las listas se construyen de la siguiente manera:

[] [X, Y, ... | L], donde X, e Y son elementos y L es una lista [X, Y, Z, ...] donde X, Y y Z son elementos de la lista

Ejemplos: [], [1], [1 | []], [1, 2 | [3]], [1,2,3], [[], 3, soyGalleta]

lista([]).   
lista([X|XS]) :- lista(XS). longitud([], cero).   
longitud([X|XS], suc(Z)) :- longitud(XS, Z). esto esta MAL!   
longitud([], cero).   
longitud([X|XS], Z) :- longitud(XS, Y), Z is $\tt Y + 1$ . esto esta BIEN!! :)   
longitud([], 0).   
longitud([X|XS], Z) :- longitud(XS, Y), Z is $\tt Y + 1$ . esto esta MAL!!   
longitud([], 0).   
longitud([X|XS], Z) :- Y is Z-1, longitud(XS, Y).