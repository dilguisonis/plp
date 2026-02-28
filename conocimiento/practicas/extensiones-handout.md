Paradigmas (de Lenguajes) de Programaci´on

Departamento de Ciencias de la Computaci´on Universidad de Buenos Aires

30 de septiembre de 2025

$\begin{array} { r l } & { \sigma , \tau : = \dots \mid \sigma \times \tau } \\ & { M , N : = \dots \mid \langle M , N \rangle \mid \pi _ { 1 } ( M ) \mid \pi _ { 2 } ( M ) } \end{array}$   
Definir como macro la funci´on $c u r r y _ { \sigma , \tau , \delta }$ que sirve para currificar funciones que reciben pares como argumento. Enunciar las nuevas reglas de tipado.   
Extender el conjunto de valores y determinar las nuevas regl de sem´antica.   
¿Qu´e problema introduce agregar la siguiente regla?

$$
\pi _ { 1 } ( \langle M , N \rangle ) \longrightarrow M
$$

Verificar el siguiente juicio de tipado: ∅ ⊢ π1((λx : Nat.⟨x, True⟩) 0) : Nat Reducir el siguiente t´ermino a un valor: $\pi _ { 1 } ( \left( \lambda x : N a t . \langle x , \mathsf { T r u e } \rangle \right) 0 )$

# Segunda extensi´on

$\begin{array} { l l l } { \sigma } & { \mathrel { \mathop : } = } & { \mathrm { \dots ~ } \big | ~ \sigma + \sigma } \\ { M } & { \mathrel { \mathop : } = } & { \mathrm { \dots ~ } \big | ~ \mathsf { l e f t } _ { \sigma } ( M ) ~ \big | ~ \mathsf { r i g h t } _ { \sigma } ( M ) ~ \big | ~ } \\ & { } & { \mathrm { c a s e ~ } M \circ \mathsf { f } ~ \mathsf { l e f t } ( x ) \sim M \mathbb { I } \widehat { \mathsf { r i g h t } } ( \mathrm { y } } \end{array}$ y) ❀ M

· $\sigma + \tau$ representa el tipo de la uni´on disjunta entre $\sigma$ y $\tau$ , similar al tipo Either $\sigma \cdot \tau$ de Haskell,

left $_ \sigma ( M )$ y rightσ(M) inyectan un valor en la uni´on, y

case M of left $( x ) \sim N \mathbb { i } \operatorname { r i g h t } ( y ) \sim O$ efect´ua un an´alisis de casos del t´ermino $M$ compar´andolo con los patrones left $_ { \cdot \sigma } ( x )$ y $\mathsf { r i g h t } _ { \sigma } ( y )$ .

# Ejercicio

Marcar subt´erminos y anotaciones de tipos. Enunciar las nuevas reglas de tipado y extender el conjunto de valores y las reglas de sem´antica de la nueva extensi´on.

# Tercera extensi´on

σ ::= · · · | ABσ M , N , O ::= · · · | Nilσ | Bin(M , N , O ) | ra´ız(M ) | der(M ) | izq(M) | esNil(M) Definir como ejemplo un ´arbol de funciones Bool → Bool.   
Definir las nuevas reglas de tipado.   
Determinar las reglas de sem´antica y nuevos valores.

# Otra forma de proyectar/observar

Otra forma de representar proyectores u observadores m´as prolija y que requiere menos reglas (aunque una construcci´on m´as sofisticada):

# Arboles bis ´

M , N , O ::= · · · | Nilσ | $\mathsf { B i n } ( M , N , O )$ | case $M \ o f \ N i I \sim N \ ; \mathrm { B i n } ( i , r , d ) \sim { \cal O }$ Importante: las min´usculas i $, \boldsymbol { r } \ y \ d$ representan los nombres de las variables que pueden aparecer libres en O. Marcar subt´erminos y anotaciones de tipos. Modificar las reglas de tipado para soportar la nueva extensi´on. ¿Se modifica el conjunto de valores? Agregar las reglas de sem´antica necesarias.

# Otra forma de proyectar/observar

# Arboles binarios bis´

Reducir el siguiente t´ermino: case if $\langle \lambda x : B o o l . x \rangle$ True then $\mathsf { B i n } \big ( \mathsf { N i l } _ { N a t } , \underline { { 1 } } , \mathsf { N i l } _ { N a t } \big )$ else NilNat of Nil False ; $\mathsf { B i n } ( i , r , d )  \mathsf { i s z e r o } ( r )$ Definir como macros las funciones $\mathsf { r a i z } _ { \sigma }$ , $\mathsf { d e r } _ { \sigma }$ , $\mathsf { i z q } _ { \sigma }$ y esNilσ , que al aplicarlas a un ´arbol binario emulan los t´erminos de la extensi´on original. Definir una nueva extensi´on que incorpore expresiones de la forma $m a p ( M , N )$ , donde N es un ´arbol y M una funci´on que se aplicar´a a cada uno de los elementos de N.