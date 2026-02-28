PLP-Primer Parcial- ${ \bf 1 } ^ { \mathrm { e r } }$ cuatrimestre de 2025-Parte 1

<table><tr><td rowspan=1 colspan=1>#Orden</td><td rowspan=1 colspan=1>Libreta</td><td rowspan=1 colspan=1>Apellidoy Nombre</td><td rowspan=1 colspan=1>Nota</td></tr><tr><td rowspan=1 colspan=1>187</td><td rowspan=1 colspan=1>685/24</td><td rowspan=1 colspan=1>ITTIG,Ernesto</td><td rowspan=1 colspan=1></td></tr></table>

Estaparte del examen se aprueba respondiendo correctamente al menos el $7 5 \%$ delas preguntas.Es necesario aprobaresta partepara accederala correcciondela segunda parte.Responderlas preguntasen los espacios indicados.

Pregunta 1:La siguiente definicioniutiliza recursion explicita?Justificar.

esHoja：：ABa $\mathrel { - } >$ Bool   
esHoja Nil $\equiv$ False   
esHoja (Binird） $=$ esNili&&esNild where esNil Nil $=$ True esNil- $=$ False

Respuesta: Nopvesnesnafmonecrsivo.Eseirose lmacsmisa

Pregunta 2:Indicar el tipo del esquemade recursion estructural foldABNv parael siguiente tipo: data ABNVa $=$ Hojaa丨Unia（ABNVa)丨Bi（ABNVa)a（ABNVa)

Pregunta3: $\romannumeral 1$ tipo de recursion utiliza la siguiente definicion?(Indicar la mas especifica).

listasQueSuman ：：Int $\scriptstyle - >$ [[Int]]   
listasQueSuman $0 = [ [ ] ]$   
listasQueSumann|n>O=[x：xs|x<-[1..n]，xs $< -$ listasQueSuman (n-x)]

a.Estructural c.Global b.Primitiva d.Iterativa/ala cola

Pregunta 4:Indicar cual de las siguientes divisiones en casos puede justificarse porun Lemade Generacion.

a.Hay 2 casos:

c.El arbol binario t puede ser:

alturai≥altura d alturai<alturad

·[x] x:y:ys

Nil

Binird

(Con i,d:AB a).

(Conr:a,iyd:AB a).

√

Respuesta:C

Pregunta 5:Definir el predicado unario $\mathrm { P }$ que se podria usar para demostrar la siguiente propiedad por induccion estructural:

$\forall$ xs::[a]. $\forall$ ys::[a].length (entrelazar xs ys) $=$ length xs +length ys

Respuesta:P=s：a.lengthntrexsy）=ngxs+egths (xs)

Pregunta 6: Sise quisiera demostrar que vale $\neg P \lor Q \vdash Q \lor ( P \Rightarrow Q )$ por deduccionnatural,culra el error al aplicar el siguiente paso?

Respuesta:Elproblenoesgue eljuicio enla premisa nodle esderivable

Pregunta 7:Indicar a que termino reduce en un paso la siguiente expresi6n,y mediante que regla(s): if isZero(zero) then Pred(Succ(zero)) else zero

Respestaee itthenPre(Sue）eseev

Pregunta 8:Sea la extension del Calculo Lambda con listas vista en la guia:

$$
M ~ : = ~ _ { \mathrm { \scriptsize ~ c } , \mathrm { \scriptsize ~ c } } | [ ] _ { T } \mid M : : M \mid \mathrm { c a s e } M \mathrm { o f } \{ [ ] \sim M \mid h : t \sim M \} \mid \mathrm { f o r } M \mid \mathrm { f o r } M  \mathrm { \scriptsize ~ c a s e } M .
$$

Indicar el error en la siguiente regla decomputo para foldr:

$$
\begin{array} { r l } & { \cdots V _ { 2 } \mathrm { b a s e }  M ; \mathrm { r e c } ( h , r ) \to N \to N \to N \pmod { N } } \\ & { \underbrace { \qquad \downarrow } _ { \textit { b } \gamma \textit { r a p } \to \emptyset \cap \mathcal { N } _ { 2 } \to \emptyset \land \textit { v a l o l o l o l o g } \to \emptyset \land \textit { w a l l y } \varphi \swarrow \emptyset \land \textit { r a p l y } \bar { r } _ { \mathrm { t o } } ^ { * } \eta \sim q y \notin  { s g r } \tau \{ \& \forall i z \land \textit { s a d y } \} \alpha \land \textit { o } \deg { u r a t } } _ { \textit { v a l o r } \to \Psi } , } \\ & { \therefore V _ { 2 } \vdash \int _ { 0 } ^ { L } d r \setminus V _ { 2 } ⨏ _ { 0 } ^ { L } d r \to \hat { r } _ { \mathrm { t o } } ( \lfloor h _ { \mathrm { t o } } \rfloor \times \ J ) ^ { 2 } } \end{array}
$$

PLP-Primer Parcial- ${ \bf 1 } ^ { \mathrm { e r } }$ cuatrimestre de 2025-Parte 2   

<table><tr><td rowspan=1 colspan=1>#Orden</td><td rowspan=1 colspan=1>Libreta</td><td rowspan=1 colspan=1>Apellidoy Nombre</td><td rowspan=1 colspan=1>Ej1</td><td rowspan=1 colspan=1>Ej2</td><td rowspan=1 colspan=1>Ej3</td><td rowspan=1 colspan=1>Nota Final</td></tr><tr><td rowspan=1 colspan=1>187</td><td rowspan=1 colspan=1>685124</td><td rowspan=1 colspan=1>ITTTG，Emest</td><td rowspan=1 colspan=1>E</td><td rowspan=1 colspan=1>E</td><td rowspan=1 colspan=1>E</td><td rowspan=1 colspan=1>P</td></tr></table>

Lasnotasparacadaejercicioson:-I，R,B，MB,E.EsteexamenseapruebaobteniendoalmenosdosejerciciosByunoRy sepromocionaconalmenosdosejerciciosMByunoB.Esposibleobtenerunaaprobacincondicionalconunejercicio MB,uno ByunoI.Estorequiereentregaralgoquecontribuyaalasoluciondelejercicio.Ponernombreapelidoynmerodeorden etodaslashojas,ynumerarlas.Sepuedeutizartodolodefinidoenlaspracticasytodoloquesedioenclasecolocando referenciasclaras.ElordendelosejerciciosesarbitrarioRecomendamoslerelparcialcompletoantesdeempezararesolverlo

# Ejercicio 1-Programacion funcional

Aclaracion:en este ejercicio no esta permitido utilizar recursion explicita, a menos que se indique lo contrario.

Sedefine eltipo de datos ABNv aque representa arboles binarios no vacios con elementos de tipoa：

data ABNVa $=$ Hojaa丨Unia（ABNVa)丨Bi（ABNVa)a（ABNVa）

Definimos el siguiente arbol para los ejemplos:

abnv ${ } = { }$ Bi(Uni2（Hoja1)）3（Bi（Hoja4）5（Uni2（Hoja7)））

a)Definirlas funciones foldABnVy recABNv,que implementan respectivamente los esquemas derecursion estructural y primitiva para el tipo ABNv a.Solo en este inciso se permiteusar recursion explicita.

b)Definir la funcion elemABNv::Eq a $\Rightarrow$ a $\scriptstyle - >$ ABNVa $\scriptstyle - >$ Bool, que indica si un elemento pertenece a un arbol.

Porejemplo:elemABNv 7abnv True.

c)Definir la funcion reemplazarUno::Eq a => a - a $\scriptstyle \mathbf { \bar { \alpha } } >$ ABNV a $\scriptstyle - >$ ABNV a que, dados dos elemeney y un rbol,devaelve un arbol como el original, pero reemplazandola primera aparicion de xpory (la primera desde la raiz yendo de izquierda a derecha,en el orden de preorder).

Porejemplo:

reemplazarUno 25abnv Bi（Uni5（Hoja1)）3（Bi（Hoja4）5（Uni2（Hoja7)））.   
reemplazarUno 25 （Hoja1） Hoja 1.

d)Definir la funcion nivel::ABNV a $\scriptstyle - >$ Int -> [a],que liste todos los elementos del nivel indicado, deizquierdaa derecha,siendoOel nivel delaraiz.Siel nivel no existe (ya sea por ser negativo o por superar la altura del arbol),devolver[].

Porejemplo: nivel abnv $1 \sim [ 2 , 5 ]$ , nivel abnv $2 \sim [ 1 , 4 , 2 ]$ nivel abnv $4  [ ]$ ,

Pista:aprovechar la currificacion y utilizar evaluacion parcial.

# Ejercicio 2-Demostracion de propiedades

a)Considerar las siguientes definiciones:

dataABa $\equiv$ Nil丨Bin（ABa)a（ABa）elemAB：：Eqa $\Rightarrow$ a $\sp { - > }$ ABa $\Rightarrow$ Bool  
{PO}elemAB_Nil $=$ False  
{P1}elemAB $\mathbf { x }$ （Binird） $=$ $\begin{array} { r } { \textbf { x } = = \textbf { r } } \end{array}$ I|（elemABxi）Il（elemABxd）mapAB:：（a->b） $^ { - > }$ ABa $^ { - > }$ ABb  
{MO}mapAB_Nil $=$ Nil  
{M1}mapABf（Binird） $=$ Bin（mapABfi）（fr）（mapABfd）

Sean dos tiposayb tales que valen Eq a,Eq b,y por ende tambienla siguientepropiedad：

$$
\left\{ \mathrm { C O N G R U E N C I A } = = \right\} \forall \mathbf { x } : : \mathsf { a } . \forall \mathbf { y } : : : \mathsf { a } . \forall \mathbf { f } : : : \mathsf { a } \to \mathsf { b } . \mathbf { x } \ = \ \mathbf { y } \Rightarrow \mathbf { f } \ \mathbf { x } = = \textbf { f } \ \mathbf { y }
$$

Demostrar la siguiente propiedad:

Sepermite definir macros (i.e.,poner nombres aexpresiones largas para no tener que repetirlas).

No es obligatorio escribir los $\forall$ correspondientes en cada paso, pero es importante recordar que estar presentes.Recordar tambien que ${ \mathrm { l o s } } = { \mathrm { d e } }$ las definiciones pueden leerse en ambos sentidos.

Se consideran demostradas todas las propiedades conocidas sobre enteros y booleanos.

Sugerencia:tener en cuenta que Vx::Bool.Vy::Bool.Vz::Bool. $( \mathbf { x } \Rightarrow \mathbf { y } ) \Rightarrow ( \mathbf { x } \Rightarrow \mathbf { z } \lor \mathbf { y } )$ .

b)Demostrar el siguiente teorema usando Deduccion Natural,sin utilizar principios clasicos:

$$
\rho \Rightarrow ( \sigma \lor ( \rho \Rightarrow \tau ) ) \Rightarrow ( \sigma \lor \tau )
$$

# Ejercicio3-Calculo Lambda Tipado

Sedesea extenderelcalculolambdasimplemente tipado paramodelar listas ordenadas.Unalista ordenada seconstruyede manera similarauna lista comun,pero sus observadores secomportande manera diferente: lacabeza dela listaes siempre el minimoelemento,ysucolaes el restodelos elementos.

Estas listas tienen como precondici6n queel tipo de sus elementos cuente con una operaci6n de comparaci6n $<$ (no es necesario escribir nada al respecto, suponemos que vale).

Seextienden los tipos y expresiones de la siguiente manera:

$\tau : = \cdot \cdot \cdot \vert [ \tau ] ^ { < }$ M=|[]丨M:<M|head<（M）|tai1<（M）

donde:

$[ \tau ] ^ { < }$ es el tipo de las listas ordenadas con elementos de tipo $\tau$

$[ \left. \right] _ { \tau } ^ { < }$ es una lista ordenada vacia que admite valores de tipo $\tau$

· $M _ { 1 } : : \thinspace M _ { 2 }$ es la lista resultante deagregar el elemento $M _ { 1 }$ a la lista $M _ { 2 } { } ^ { 1 }$

head $< ( M )$ denota elminimo elemento de lalista $M$ .

tail $< ( M )$ esla lista ordenada con todos los elementos de $M$ excepto el minimo (si $M$ tiene mas de una aparicion de su minimo elemento, se elimina una de ellas).

a) Introducir las reglas de tipado para la extension propuesta.

b)Definir elconjunto devalores y las nuevas reglas de reducci6n enunpaso.Tener en cuenta que una lista vacia no tiene cabeza ni cola.

Pista:puede ser necesario mirar mas deun nivel de un término para saber a que reduce.

c)Mostrar paso por paso como reduce la expresion:

head $< ( ( \lambda x : N a t . \underline { { 2 } } ) z e r o \ : : ^ { < } \underline { { 1 } } \ : : ^ { < } \ [ \ ] _ { N a t } ^ { < } )$

Se pueden considerar dadas las siguientes reglas:

$$
\frac { M _ { 1 } \to M ^ { \prime } } { M _ { 1 } < M _ { 2 } \to M ^ { \prime } < M _ { 2 } } ( \mathrm { E } - < _ { 1 } ) \quad \frac { M _ { 2 } \to M ^ { \prime } } { V < M _ { 2 } \to V < M ^ { \prime } } ( \mathrm { E } - < _ { 2 } )
$$

$$
\overline { { V < z e r o \to \mathsf { F a l s e } ^ { \prime } } } ^ { \left( \mathrm { E } - < _ { F } \right) } \quad \overline { { z e r o < \mathsf { S u c c } ( V ) \to \mathsf { T r u e } ^ { \left( \mathrm { E } - < _ { T } \right) } } }
$$

$$
\overline { { \mathsf { S u c c } ( V _ { 1 } ) < \mathsf { S u c c } ( V _ { 2 } ) \to V _ { 1 } < V _ { 2 } } }  ^ { \mathrm { ( E - } < _ { S } ) }
$$

Ernesto ITTT6 685124

dataABNVa=HOjaa1(nia(ABNVa){D:（ABNVa）aCABNVa） folABNV::（a→6）→（a→b→b)→（6→a→b→b）→A3NVa→b fdJABNVfHojofUnfB:t=caretof Hojok→fHojaR unikt→fUn;k（rect>） B:k2→B;(reci）k(recd） where rec=folABNVHja fOn:B recABN/:Ca→b)→（a→ABNVG→b+b)→（ABNVa→b→a→AB3NVa→b→b）→ABNVab TrCCABNU fHoinLUm fB:t=caeto+ HojaR→Hojak k） / whererec=reeABNVfHojafUnifB elemABNY:Egaa→ABNV→Bo1 elemABNYx=oldABNv（=x）（brec→k=×1rc（ikd→k==xU:d） reemplazaUno:Egaa→a→ABNVa→ABNVa reemplazarunoxy=recABNV （<k→ifk=xthen Hojayelse Hoja) (t²nec→if==xthenUnitelse anikrec) (kireeikdrecd→ifk==x thenBiiyd elseifelemABNVxi thenBirecikd eleB:ikrecd) nivel:ABVNa→ln→La

nivel=fol0ABNVCn→ifn=0thenLkehe[）krecn→ifn==0thon[k]olseree(n-（））△ikdn→itn=o+hen[kJesei(n-1)++d(n-1）)

EmstITTIG HOJA N·2/3 685124 FECHA

![](images/18d36b701f7016779659aa2371359acffe36e267a7c35588d7e29b67c6d38422.jpg)

a)QvgvtAB.Vx:a.vf:a→b.（olemABχ+=7elemAB（+\~）（mapAB+t）DetinP(t）=Vxa.4ia→.eleomAB）xt→demAB（f）（vopAB上t)Loonehoponinouciongaraarblebincoio:VtABa.PCt)(P(N:1)V:ADaVa.V:AB△（PC）a&P())=P(BinJ）

CB:QvqP(NiD=1Vx:ia.Uf:a→b.elenABxMi）=elenAB（fx)（mapABN:1） Seanx:a， elemABN:1⇒elemAB(fx)N,1 Fal>e=>elemAB（x）Ni=Tre (Bool)

PI:Sean，)：ABa,ra.Sopongo gue valen （4x：a.v{:a→b）  
DC）=SHTsoemAB×→elemAB（fx)（maPAB↓）  
P()=EelemABx→elenAB（x)（mapADf)vaP(BinivO）=elemAB×（Bnin2）=>elemAB（+-)（mopAB（Bni）elemABx（Binix)=eamAB\~)（mapABf(Bin∴J) SP1===r1elewAEx;lelemtxd）⇒elemAB(fx）（mapAB！（3nir）) M=(x=x1elemABti/elemABxd）=>elenAB（x)(Bin（mapABi）（）（mapAB（）) P=(2==xuelemAB<:（elenAB）=>（Fx）=（f）1elenAs(mopADs)1elomAB）（mp）Lemada generacion de Bolsparux== 4x)-Obienx==r=trae MACRO中=（TneWeemABx:（elemADx）=7（R)=（）elenAB（moAB↓,deNAB（mapAB）（bools）=rve=（r）=（>）elenAB（mapAB51elenAB（mopAB+2） (bool=（x==fx)11ee△B（mapABJ;)1elemAB（mapABf2) 3CONGRUENA=3Tne =True gcegueriammos ver.-0bienx=r=False（FlscelemABx:1elemAB×）⇒ (b001s)=(elenABx;1eemABx））Lemadeyereracion de bools pomelemABx;-O bienPlemABxi=Tr(Trve1eenA×）2H工ydenxi=（1x).=（r)1True/elemAB(onapA) (00157=Tre，qurqoeniamswr-ObienelemABxi=False（Fal(elemAB2）→ (ools)=elexABx0⇒（+r1elemAB[mapAbf) =Tue,gve queniameeuerNPLuegoP(t)valeVE:AB 区NOTA

b Dotoax Viz

![](images/73d84100d40dc8174881b687232c555e26fef5773c19e8203275a27e83ad38c7.jpg)

![](images/44b9fde4e06c0a58b3c9b2e8d7df2cbee24dcc76bb6b536ad2035b72e6b9aaf7.jpg)

Emesto ITTIG HOJA N:313 G&kk FECHA

Eyreey3

Reghs detipadoT-6onsP-M∴M:C<FM:[T] T-heud 1M:[7] +-tuil├head<（M）：+ FHtail(M）：[T]

![](images/68d478129c05548d2616b472a8dbf8e6b3e5a4a48a2bc36d66a62be32da60644.jpg)

Reotccion head<(x:Nat.2)zeo:<1:<[JNG+ →he)<（<△<(I） (E-he+E-Conso+β) (E.head-C) →if1<zenothmnhea（2JNa）elsehea(△[&d）→iFFalsethenhea)（<it)elsehed（{JN） （5-i+E<5） CE+E-< → he)(△:<[JN）→①（ulb） E+IHFalke) (E-head-N)

![](images/b490af9bae86cc6a13708bbd1e77938af83b98ffde2496e06bfd48d09163ec36.jpg)