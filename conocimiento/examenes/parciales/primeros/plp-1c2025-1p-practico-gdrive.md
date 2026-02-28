PLP - Primer Parcial - ${ \bf 1 } ^ { \mathrm { e r } }$ cuatrimestre de 2025- Parte 2

# Comieio Malena

<table><tr><td rowspan=1 colspan=1>#OrdenLibreta</td><td rowspan=1 colspan=1>Libreta</td><td rowspan=1 colspan=1>Apellidoy Nombre</td><td rowspan=1 colspan=1>Ej1</td><td rowspan=1 colspan=1>Ej2</td><td rowspan=1 colspan=1>Ej3</td><td rowspan=1 colspan=1>Nota Final</td></tr><tr><td rowspan=1 colspan=2></td><td rowspan=1 colspan=1>Penes Natalia</td><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1>P</td></tr></table>

# CPomotionodo)

Las notasparacadaejercicioson:I,R,B,,E.EsteexameneapruebaobeniendoalmenosdosejerciciosByuoR se promociona con al menos dosejerciciosMByuno B.Es posibleobtener una aprobaci6ncondicional con un ejercicio Mb,uno ByunoI.Estorequiereentregaralgoquecontribuyaalasoluciondelejercicio.Ponernombre,apelidoynumerodeorden entodaslashojas,ynumerarlas.Sepuedeutizartodolodefinidoenlas practicasytodo loquesedioenclase,colocando referenciasclaras.Elordendelosejerciciosesarbitrario.Recomendamoslerelparcialcompletoantesdeempezararesolverlo

Ejercicio1-Programacion funcional

Aclaracion: en este ejercicio no esta permitido utilizar recursi6n explicita, a menos que se indique lc contrario.

Se detine el tipo de datos ABnv a, que representa arboles binarios no vacios con elementos de tipo a:

dataABNVa=Hoja a丨Unia（ABNVa）丨Bi（ABNVa）a（ABNVa）

Definimos el siguiente arbol para los ejemplos:

abnv=Bi（Uni2（Hoja1））3（Bi（Hoja 4）5（Uni2（Hoja7)）

a) Definirlas funciones foldABnv y recABNv,que implementan respectivamente los esquemas de recursi6n estructural y primitiva para el tipo ABNv a.Solo en este inciso se permite usar recursion explicita.

b) Definirla funcion elemABNv::Eq a => a -> ABNV a -> Bool,que indica si un elemento pertenece a unarbol.

Por ejemplo: elemABNv 7 abnv True.

c) Definir la funcion reemplazarUno::Eq a => a -> a -> ABNV a -> ABNv a que,dados dos elementos x e y y un arbol. devuelvn un arbel como el original, pero reemplazando l: primere aparici6n de x por y (la primera desde la raiz yendo de izquierda a derecha, en el orden de preorder).

Por ejemplo:

reemplazarUno 2 5 abnv\~Bi (Uni 5 (Hoja 1)） 3 (Bi (Hoja 4) 5 (Uni 2 (Hoja 7))).   
reemplazarUno 2 5 (Hoja $1 ) \sim$ Hoja1.

d)Definir la funci6n nivel:ABNv a -> Int ->[a],que liste todos los elementos del nivel indicado de izquierda a derecha,siendo O el nivel de la raiz. Si el nivel no existe (ya sea por ser negativo o por superar la altura del árbol), devolver [].

Por ejemplo: nivel abnv 1\~ [2,5]. nivel abnv 2\~ [1,4,2]. nivel abnv $4 \sim [ ]$

Pista: aprovechar la currificacion y utilizar evaluacion parcial.

Ejercicio 2 -Demostracion de propiedades a) Considerar las siguientes definiciones;

data AB a= Nill Bin (AB a)a (AB a)elemAB:Eqa=>a->AB a-> Bool  
{PO} elemABNi1 $\approx$ False  
{P1}elemABx（Bin1rd）=（x==r）11（elemABxi） 11（elemABxd）mapAB:（a->b）->ABa->AB b  
MO）mapABNilNi1  
{M1}mapABf（Binird）=Bin（mapABf1）（fr）（mapABfd）

ean dos tipos a y b tales que valen Eq a, Eq b，y por ende tambien la siguiente propiedad

Demostrar la siguiente propiedad:

e permite definir macros (i.e., poner nombres a expresiones largas para no tener que repetirlas)

No es obligatorio escribir los $\forall$ correspondientes en cada paso, pero es importante recordar que estan presentes. Recordar tambien que $\mathrm { l o s } = \mathrm { d e }$ las definiciones pueden leerse en ambos sentidos.

Se consideran demostradas todas las propiedades conocidas sobre enteros y booleanos.

Sugerencia: tener en cuenta que Vx:Bool.Vy::Bool.Vz:Bool. $( \mathbf { x } \Rightarrow \mathbf { y } ) \Rightarrow ( \mathbf { x } \Rightarrow \mathbf { z } \lor \mathbf { y }$ ).

b) Demostrar el siguiente teorema usando Deduccion Natural, sin utilizar principios clasicos

$$
\rho \Rightarrow ( \sigma \lor ( \rho \Rightarrow \tau ) ) \Rightarrow ( \sigma \lor \tau )
$$

# Ejercicio 3-Calculo Lambda Tipado

Sedesea extender el calculo lambda simplemente tipado para modelar listas ordenadas. Unalista ordenada se construye de manera similar a una lista comun,pero sus observadores se comportan de manera diferente: la cabeza de la lista es siempre el minimo elemento,y su cola es el resto de los elementos.

Estaslistastienencomoprecondicinqueeltiodesuselementoscuenteconunaoperacindecomparacin $<$ (no es necesario escribir nada al respecto,suponemos que vale).

Se extienden los tipos y expresiones de la siguiente manera:

$\tau : = \dots 1 \vert \tau \vert ^ { < }$ M:=.|]丨M:<M|head<(M)|tai1<(M)

donde:

$1 + 1 <$ es el tipo de las listas ordenadas con elementos de tipo $\tau$

$1 1 \frac { < } { \tau }$ es una lista ordenada vacia que admite valores de tipo $\tau$

$M _ { 1 } : : \thinspace M _ { 2 }$ es la lista resultantede agregar el elemento $M _ { 1 }$ a la lista $M _ { 2 } { } ^ { 1 }$

head $^ { < } ( M )$ denota el minimo elemento de la lista $M$

tail<(M) es la lista ordenada con todos los elementos de M excepto el minimo (si M tiene mas de una aparicion de su minimo elemento, se elimina una de ellas).

a) Introducir las reglas de tipado para la extension propuesta.

b) Definir el conjunto de valores y las nuevas reglas de reducción en un paso. Tener en cuenta que una lista vacia no tiene cabeza ni cola.

Pista: puede ser necesario mirar mas de un nivel de un término para saber a qué reduce.

c) Mostrar paso por paso como reduce la expresion:

head $\begin{array} { r } { 1 ^ { < } ( 1 ( \lambda x : \ N a t . \underline { { 2 } } ) z e r o ) \cdots \leq \underline { { 1 } } \cdots ( 1 | _ { N a t } ^ { < } ) } \end{array}$

Se pueden considerar dadas las siguientes reglas:

$$
\frac { M _ { 1 } \to M ^ { \prime } } { M _ { 1 } < M _ { 2 } \to M ^ { \prime } < M _ { 2 } } ( \mathrm { E } \mathrm { - } < _ { 1 } ) \quad \frac { M _ { 2 } \to M ^ { \prime } } { V < M _ { 2 } \to V < M ^ { \prime } } ( \mathrm { E } \mathrm { - } < _ { 2 } )
$$

$$
\overline { { V < z e r o \to \mathsf { F a l s e } ^ { \prime } } } ^ { \left( \mathrm { E } - < _ { F } \right) } \quad \overline { { z e r o < \mathsf { S u c c } ( V ) \to \mathsf { T r u e } ^ { \left( \mathrm { E } - < _ { T } \right) } } }
$$

$$
\overline { { \mathsf { S u c c } ( V _ { 1 } ) < \mathsf { S u c c } ( V _ { 2 } ) \to V _ { 1 } < V _ { 2 } } }  ( \mathrm { E } - < _ { \cal S } )
$$

![](images/d7c916be01b219acc687f78fe368a360fe699494d81b2cc0f8f83ab0c7e20fae.jpg)

ABNV月(A0）AaB）BNdb

foldABNv::（a→b）→(a>b→b)→（b-a→b→b)→ABNVa→b   
foldABNV fHoja fUni fBi ab=case ab of Hoja v> fHoja V Univar-→fUniv（recar） Biivd-→fBi(ceci）v(recd) where rec=foldABNV fHoja FUni fBi

ecAem:a na recABNv::（a→b)→（a→AbNva→b→b)ABraAa （ABNVa→b→a→ABNVa→b→b)→ABNVa-→b

ecABNV fHoja FUni FBi ab=case ab of Hojav-FHoja V niarFUniar (rec ar) Biivd→fBii(reci)vd (recd) Whererec=recAeNv FHoja FUni fBi elemABNV::Eqa=>a→ABNVq-Bool elemABNV e=FoldABNV (\V→y（v==e)）neTnO (vrec-→(v==e)lrec)(\reci Vrecd→(v==e)llrecillrecd)

reemolazarUno::Eqa=>aa-ABNva→ANvareemplazarUnoxy=recABNvvix=3tba（v→ic（x==v）then （Hoja yelse（Hojay））（varrec-if（x-=v）+hen（uni y ar)else（uni v rec))\irecivdrecd→if（xv）then（Biiyd）elsexnara（if（elemAeNvxi）+hen(Bigrecivd)else（Biivrecd))

V nivelABNVa→Int→[aJ mvel=roldABNV （\v→（\n→if（n==O）tnen [v] else[)） Havek   
(vrec→（n→if(n==o) +hen [] else aeer rec(n-1))   
(recivrecd→(n→iF（n==o)+hen [velseleeuen+tnedde (reci(n-1)+(recd（o-）))   
Ej3： a Reggos de tipade： FEM:TrN:[T] -VACA T-LiSTA rFM:<M:LT<   
FEM:CT]< T-Head FEM:CT1 t-tait   
Fhead<(M):T rFtai1<（M）=[r< b Ceniunfo de valoen: Vx=...CJIV:<V Reglon de noduccien NM MM E-lista2 E-listat   
M<M→MM V::<M→V:M M→N E-nead MM E-tail   
head(m)→head²（H') +ail²（N）-→tail<(M）   
A<N   
Keads(vv)（v<head（v））+heoV ese hddcy）   
+it<(：<）→(F（V<head（v）+hen Ve1seV=taH（O）   
head<(v<[）→V   
head<（vy）→if{vshead(vV））+hen V1else head(ve:y   
tail<（v∴<[）→[   
(vf<ed<）(ese v<tail(:</)

head<（（λx:Nat.2）tero）<⊥:<CJNa+) e-head E-head Eisla Succ(ero) ifsucc(succ(2ero))<head(:at)+hen succ(succ(ero)) ead else keadCE7at)A succ(re) →if（succCsucc(zero))<succ(zero)A EF Enead vaco +Efsucc（2ero）<zeroA E-IF -e-<s head(succ(2eo):[Nat)->Succ(2ero) V E-iFfalse E-heod

2: bSin principios cla'sicos. ax ax $\begin{array} { r } { \frac { \frac { \partial \mathcal { K } } { \partial \tau } } { \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } \frac { \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } } { \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } } } } \\ { \frac { \partial \mathcal { K } \mathcal { K } \mathcal { K } ( \theta \Rightarrow \pi ) } { \Gamma \frac { \partial \mathcal { K } } { \partial \tau } \left( \mathcal { S } \cup \mathcal { K } \right) } \frac { \Gamma \mathcal { K } \mathcal { K } } { \left( \mathcal { S } \cup \mathcal { K } \right) \tau } \frac { \Gamma \mathcal { K } \mathcal { K } \mathcal { K } \mathcal { K } \mathcal { K } \mathcal { K } \mathcal { K } } { \Gamma \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } \mathcal { K } \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } } { \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } } { \partial \tau } } } \\  \frac  \partial \mathcal { K } \mathcal { K } \mathcal { K } \mathcal { K } ( \theta \Rightarrow \tau ) \mathcal { K } \mathcal { K } \mathcal { K } \mathcal { K } \mathcal { K } \mathcal { K } \frac { \partial \mathcal { K } \mathcal { K } \mathcal { K } } { \partial \tau } \frac { \partial \mathcal { K } \mathcal { K } \mathcal { K } \mathcal { K } \mathcal { K } \mathcal { K } \mathcal { K } }  \frac  \partial \mathcal  K \end{array}$ CP=TFP=>TrP=2T上P 27e Vi2 √

a Lodemuentro pe induccien etructiual en arbeles A vg4tABa.P(t)vale.   
P(t)=x∴afa→b，(e1emABxt=>elemAB（fx) (mapABt1)   
Poc inducion eshuctual en ABa Qu

P(Nil)vale

Ram i∵ABa d::ABa,Vr:a(Pci）APcd))=>PCBinird   
:v=seaxaFa→bQvg ekmAB X Nil =>elemAB（fx)（mapAB fNil)). plemAB xNil= False A   
te

P=aabelmAxieemABx）（apAi) P(d）=xa-bemxdelnA（fx）（map os Son mi H.I(son verdadero>) seaxafa→b uuraQmi,dABa Qug:elemABx（ind）-7elemAB（fx）（mpAf（Binird））

elemABx （bin ird) lo asumo vecdaderoya que si esfalso no engo que probor nada）y veo gue vale econsecente

elemABx（Bin:d）=（x==r)(e1emABxi）=（elemABxd)   
consecwenke: elemA（fx）（mapABft）=BaleAB作F2m（bnndpAerV 5013 (Binicd) elemABCfx)（Bin（mapAB fi）（Fr)（mapABfd))   
=（（（fx)==（fr））1（elemAB（fx)（mapABfi))1 山 (elemAB（fx)（mapABfd)））=   
yose gue e verdadero.Por leme de generacin   
B0ol：   
A（x==r）=True Por{congruencia==} si x==r=>βx==fY etencs:   
（(Fx)==(fr)) I1B=TrveB y por pop de Bobl TruelB=True =7el conseuente vale eneske caso   
B(x==s)=False Entonceo por lema oke gereracio de   
Bool:   
BA）（elemABxi）=Tue PorH.I+engo Pci)=elemABxi=>elenAB（fx)(mapfi) entonceselemAB（fx)（map fi)=true TengoCIceeaBTa True 1celemAB （Fx)（mapAB fd）) yPorprop.de BodCITrveleknAB（x)（mapAOfd))=True =7el consewete vale en esle cao   
BB(elemABxi)=tw falsecomo e werdadero   
entonces por xop de Bcol,FalseFasellA=ATrve=>A=True entonces elemABxde verdaderoypor H.Ieg   
P(d)=e\emABxd=elemAB（Fx)（mapF)entonces elemAB(fx)(mapFd)ewerdadero

Perey Natalia

Temgo We C(lelemAB （Fx) (mgpAB Fi)l Tue yRorprop de BoolClelemAB（fx)(mapAB fi))lTrue=True entonces de nvevo vale el conse wente

Probe  gue para cada casosi vale el antecedente entoncen vale el conse auente =7 probe la implicacion PcBioird) es verdadono.

PK yvalenorprincipiodenduc   
estructural en ABa, queda dermostra do que   
EABa.Pct) e verdadloro.