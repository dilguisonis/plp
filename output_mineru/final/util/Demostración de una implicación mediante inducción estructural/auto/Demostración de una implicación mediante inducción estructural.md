# Demostración de una implicación mediante inducción estructural (entre otras cosas)

Sean las siguientes definiciones: data AEB a $=$ Hoja a | Bin (AEB a) a (AEB a)

const :: a -> b -> a $\{ { \mathsf { C } } \} { \mathsf { c o n s t } } = ( \backslash \times \to \lfloor \ y \to \mathsf { x } )$

head :: [a] -> a {H} head $( { \sf x } { : } { \sf x } { \sf s } ) = { \sf x }$

length :: [a] $\mathbf { \delta } _ { - > }$ Int   
$\{ \mathsf { L O } \}$ length $[ ] = 0$   
{L1} length $( { \mathsf { X } } ; { \mathsf { X } } { \mathsf { S } } ) = 1 +$ length xs

tail :: [a] $\mathbf { \delta } _ { - > }$ [a] $\{ \top \}$ tail $( { \sf x } ; { \sf x } { \sf s } ) = { \sf x } { \sf s }$ null :: [a] $\mathbf { \delta } _ { - > }$ Bool {N0} null $[ ] =$ True {N1} null (x:xs) $=$ False

altura :: AEB a $\mathbf { \delta } _ { - > }$ Int   
$\{ \mathsf { A O } \}$ altura $( \mathsf { H o j a \_ } ) = 1$   
$\{ \mathsf { A } 1 \}$ altura $( \mathsf { B i n } \mathrm { ~ i ~ r ~ d ~ } ) = 1 + \mathsf { m a x }$ (altura i) (altura d)   
esPreRama :: Eq $\tt a = \tt$ AEB a $\mathbf { \delta } _ { - > }$ [a] $\mathbf { \delta } _ { - > }$ Bool   
{E0} esPreRama $( \mathsf { H o j a x } ) = \mathsf { U s s } \to$ null xs || $( \mathsf { x s } = \mathbf { \bar { \rho } } ( \mathsf { x l } ) )$ )   
{E1} esPreRama (Bin i r d) $1 = \mathsf { \backslash x s \_ s > }$ null xs || ( ${ \sf r } = =$ head xs && (esPreRama i (tail xs) $\parallel$ esPreRama d (tail xs)))

$\begin{array} { r l } & { ( = = ) { \cdot } : \mathsf { E q a } \Rightarrow [ \mathsf { a } ] \to [ \mathsf { a } ] \to \mathsf { B o o l } ( \mathsf { E s c r i t a e n } 4 \mathsf { c a s o s } 1 } \\ & { \{ = = 0 \} \mathbb { I } = = \mathbb { I } = \mathbb { T } \mathsf { r u e } } \\ & { \{ = = 1 \} \mathbb { I } = = \left( \_ { \cdot } : \_ { - } \right) = \mathsf { F a l s e } } \\ & { \{ = = 2 \} \left( \_ { \cdot } : \_ { - } \right) = = \mathbb { I } = \mathsf { F a l s e } } \\ & { \{ = = 3 \} \left( \mathsf { x } : \mathsf { x s } \right) = = \left( \mathsf { y } : \mathsf { y s } \right) = \left( \mathsf { x } = = \mathsf { y } \right) \& \mathsf { A } \left( \mathsf { x s } = = \mathsf { y s } \right) } \end{array}$ para facilitar la demostración)

Lema: ∀t::AEB a . $0 \leq$ altura t

Asumiendo Eq a, demostrar la siguiente propiedad: ∀ ∀t::AEB a. xs::[a].(esPreRama t xs $\Rightarrow$ length xs ≤ altura t)

$\mathsf { P } ( \mathsf { t } ) = \forall \mathsf { x s } \colon :$ [a].(esPreRama t xs $\Rightarrow$ length xs $\leq$ altura t)

Hacemos inducción estructural en t, desplegando definiciones y propiedades hasta probar que la implicación es verdadera. No copiamos el $\forall$ xs::[a] en cada paso, sabemos que está.

# Caso t $=$ Hoja x:

esPreRama (Hoja x) $\tt X S \Rightarrow$ length xs ≤ altura $( { \mathsf { H o j a } } \times ) = \{ { \mathsf { A } } 0 \}$ esPreRama (Hoja x) $\tt X S \Rightarrow$ length $\mathsf { x s } \leq 1 = \{ \mathsf { E 0 } \}$ ( $\mathsf { l x s \mathsf { \_ } } >$ null xs $| |$ $\mathbf { \langle x s \circ = = [ x ] \rangle }$ ) $\tt X S \Rightarrow$ length xs ≤ 1 = {β} null xs $\parallel$ $\scriptstyle \mathbf { \left[ x s \right] } = = [ \mathbf { x } ] ) \Rightarrow$ length xs ≤ 1

Por lema de generación de listas, xs es de la forma $[ ]$ o y:ys (para alguna y::a e ys::[a]). Caso $\mathsf { x s } = \left[ \begin{array} { r l r l } \end{array} \right]$ : null $[ ] \begin{array} { r } {  \mathbf { \Lambda } ( [ \begin{array} { l } { } \end{array} ] = = [ \mathbf { x } ] ) \Rightarrow | \mathbf { e n g t h } [ [ \mathbf { \Lambda } ] \leq 1 = \{ \mathsf { L } \boldsymbol { 0 } \} } \end{array} $ null $[ [ \begin{array} { l } {  \mathbf { \Lambda } ( [ \mathbf { \Lambda } ] = = [ \mathbf { x } ] ) \Rightarrow 0 \leq 1 = \{ | \mathsf { n t } \} } \end{array}  $ null $\ [ \| \ ( \boldsymbol { \mathrm { I } } ) = - \boldsymbol { \mathrm { I } } \boldsymbol { \mathrm { x } } \| ) \Rightarrow \mathsf { T r u e } = \{ \mathsf { B o o l } \}$ True Caso ${ \tt X S } = { \tt y } { \tt : y s }$ : $\begin{array} { r l } & { \mathsf { n u l l \ ( y { : } y s ) } \left. \right. \left( \left( y { : } y s \right) = = \left[ x \right] \right) \Rightarrow \mathsf { l e n g t h \ ( y { : } y s ) } \le 1 = \{ \mathsf { N } 1 \} } \\ & { \mathsf { F a l s e \ | | \left( \left( y { : } y s \right) = = \left[ x \right] \right) } \Rightarrow \mathsf { l e n g t h \ ( y { : } y s ) } \le 1 = \{ \mathsf { B o o l } \} } \\ & { \left( \left( y { : } y s \right) = = \left[ x \right] \right) \Rightarrow \mathsf { l e n g t h \ ( y { : } y s ) } \le 1 = \{ = = 3 \} } \\ & { \left( y = - \mathsf { x } \right) \& \& \left( y \mathsf { s } = = \left[ \right] \right) \Rightarrow \mathsf { l e n g t h \ ( y { : } y s ) } \le 1 } \end{array}$ Por lema de generación de listas, ys puede ser $\mathbb { I } \circ z { : } Z \mathsf { s }$ . Caso ys ${ \bf { \dot { \rho } } } = { \bf { Z } } { : \bf { { Z S } } }$ : $\begin{array} { r } { ( \mathsf { y } = \mathsf { x } ) \& \& ( z : z \mathsf { s } = = [ \mathsf { I } ) \Rightarrow \mathsf { l e n g t h } ( \mathsf { y } : \mathsf { y } \mathsf { s } ) \mathsf { s }  \mathsf { I } = \{ = 2 \}  } \\ {  ( \mathsf { y } = \mathsf { x } ) \& \& \mathsf { F a l s e } \Rightarrow \mathsf { l e n g t h } ( \mathsf { y } : \mathsf { y } \mathsf { s } ) \mathsf { s }  \mathsf { 1 } = \{ \mathsf { B o o l } \} \mathsf { T r u e } } \end{array}$ e Caso $\mathsf { y } \mathsf { s } = \left[ \mathsf { l } \right]$ : $\begin{array} { r l } & { \mathrm { ( y ^ { - } = = x ) } \& { \& ~ ( I = = [ I ] ) } \Rightarrow \mathsf { l e n g t h } \mathrm { ( y : [ I ] ) } \le 1 = \{ \mathsf { L } 1 \} } \\ & { \mathrm { ( y = = x ) } \& \& ~ ( I = = [ I ] ) \Rightarrow 1 + \mathsf { l e n g t h } \mathrm { [ I \le 1 = \{ L 0 \} } } \\ & { \mathrm { ( y = = x ) } \& \& ~ ( I = = [ I ] ) \Rightarrow 1 + 0 \le 1 = \{ \mathsf { I n t } \} } \\ & { \mathrm { ( y = = x ) } \& \& ~ ( I = = [ I ] ) \Rightarrow \mathsf { T r u e = \{ B o o l \} T r u e } } \end{array}$

Con esto queda probado el caso base ${ \mathfrak { t } } = { \mathsf { H o j a x } } .$ .

Caso t ${ \bf \Phi } _ { \cdot } =$ Bin i r d:   
Hipótesis inductiva: ${ \mathsf { P } } ( { \mathsf { i } } ) \wedge { \mathsf { P } }$ (d), es decir:   
( xs::[a].(esPreRama i xs∀ $\Rightarrow$ length xs $\leq$ altura i)) $\wedge$ ( xs::[a].(esPreRama d ∀ $\tt X S \Rightarrow$ length xs ≤ altura d))   
esPreRama (Bin i r d) ${ \tt X S } \Rightarrow$ length xs $\leq$ altura $( \mathsf { B i n } \mathrm { ~ i ~ r ~ d ~ } ) = \{ \mathsf { E } 1 \}$   
( $\backslash \ltimes \ltimes \lnot \ltimes$ null xs ||(r $= =$ head xs && (esPreRama i (tail xs) $\Vert$ esPreRama d (tail xs)))) ${ \tt X S } \Rightarrow$ length xs $\leq$ altura $( { \mathsf { B i n } } { \mathrm { ~ i ~ r ~ d ~ } } ) = \{ { \mathsf { \beta } } \}$   
null xs ||(r $= =$ head xs && (esPreRama i (tail xs) $| |$ esPreRama d (tail xs))) $\Rightarrow$ length xs $\leq$ altura $( \mathsf { B i n i r d } ) = \{ \mathsf { A } 1 \}$   
null xs ||(r $= =$ head xs && (esPreRama i (tail xs) $| |$ esPreRama d (tail xs))) $\Rightarrow$ length $\mathsf { x s } \leq 1 + \mathsf { m a x }$ (altura i) (altura d)

Por lema de generación de listas, xs es [] o y:ys.

Caso $\mathsf { x s } = \left[ \mathsf { l } \right]$

null [] ||(r $= =$ head $\mathbb { I } ^ { \ \& \alpha }$ (esPreRama i (tail []) || esPreRama d (tail []))) $\Rightarrow$ null [] ||(r == head $\mathbb { I } ^ { \ \& \alpha }$ (esPreRama i (tail []) $| |$ esPreRama d (tail []))) $\Rightarrow 0 \leq 1 + \mathsf { r }$ ax (altura i) (altura d) Por lema, $0 \leq$ altura i $\wedge 0 \leq$ altura d.

Luego, por Int: $0 \leq \mathsf { m a x }$ (altura i) (altura d) $\leq 1 + \mathsf { m a x }$ (altura i) (altura d).

Luego el consecuente de la implicación es verdadero, y por Bool la implicación es verdadera.

Caso xs $=$ y:ys:

null (y:ys) ||(r $\cdot = =$ head (y:ys) && (esPreRama i (tail (y:ys)) $\parallel$ esPreRama d (tail (y:ys)))) $\Rightarrow$ length (y:ys) $\leq 1 + \mathsf { m a x }$ (altura i) (altura d) $\begin{array} { r l } & { \mathrel { = } \{ \uparrow \} } \\ & { \mathrel { } } \\ & { \mathrel { = } \{ \mathsf { N } 1 \} } \\ & { \mathrel { } } \\ & { \mathrel { = } \{ \mathsf { B o o l } \} } \end{array}$ null (y:ys) ||(r $= =$ head (y:ys) && (esPreRama i ys) $\Vert$ esPreRama d ys)) $\Rightarrow$ length (y:ys) $\leq 1 +$ max (altura i) (altura d) False ||(r $= =$ head (y:ys) && (esPreRama i ys) $| |$ esPreRama d ys)) $\Rightarrow$ length (y:ys) $\leq 1 + \mathsf { m a x }$ (altura i) (altura d) ( $\mathsf { r } = \mathsf { = }$ head (y:ys) && (esPreRama i ys) $| |$ esPreRama d ys)) $\Rightarrow$ length (y:ys) $\leq 1 + \mathsf { m a x }$ (altura i) (altura d)

Sean:

$\mathsf { A } = \mathsf { r } = =$ head (y:ys) B = (esPreRama i ys) $\parallel$ esPreRama d ys) ${ \mathsf C } =$ length (y:ys) ≤ 1 + max (altura i) (altura d)

Si probamos $\mathsf { B } \Rightarrow \mathsf { C }$ , entonces, por Bool, vale $( \mathsf { A } \land \mathsf { B } ) \Rightarrow \mathsf { C }$

Probemos que vale $\mathsf { B } \Rightarrow \mathsf { C }$ .

esPreRama i ys $| |$ esPreRama d ys $\Rightarrow$ length (y:ys) $\leq 1 + \mathsf { m a x }$ (altura i) (altura d) $) = \{ \mathsf { L } 1 \}$ esPreRama i ys $| |$ esPreRama d ys $\Rightarrow 1 +$ length ys $\leq 1 +$ max (altura i) (altura d) $=$ {Int} esPreRama i ys $| |$ esPreRama d ys $\Rightarrow$ length ys ≤ max (altura i) (altura d)

Por lema de generación de Bool, esPreRama i xs es True o False.

Caso True:

True || esPreRama d ys $\Rightarrow$ length ys $\leq$ max (altura i) (altura d) $=$ {Bool} length ys $\leq$ max (altura i) (altura d)

Por HI, sabemos que: esPreRama i ys $\Rightarrow$ length ys $\leq$ altura i.

Por caso True, True $\Rightarrow$ length ys $\leq$ altura i.

Por Bool, length ys $\leq$ altura i.

Por Int, altura i ≤ max (altura i) (altura d).

Luego, por Int, length ys $\leq$ max (altura i) (altura d), que es lo que queríamos demostrar.

Caso False:

False || esPreRama d ys $\Rightarrow$ length ys ≤ max (altura i) (altura d) $=$ {Bool} esPreRama d ys $\Rightarrow$ length ys $\leq$ max (altura i) (altura d)

Por HI, esPreRama d ys $\Rightarrow$ length ys ≤ altura d.   
Por Int, altura d ≤ max (altura i) (altura d).   
Luego, por Int, esPreRama d ys $\Rightarrow$ length ys ≤ max (altura i) (altura d), que es lo que queríamos demostrar. $\boxed { \begin{array} { r l } \end{array} }$