PLP-Primer Parcial-2do cuatrimestre de 2025   

<table><tr><td></td><td></td><td></td><td></td><td rowspan=2 colspan=1>Ej1EJ2</td><td rowspan=1 colspan=1>Ej1EJ2</td><td rowspan=1 colspan=1>E3</td><td rowspan=1 colspan=1>Nota Finar</td></tr><tr><td rowspan=1 colspan=1>#Orden</td><td rowspan=1 colspan=1>Turno</td><td rowspan=1 colspan=1>Libreta</td><td rowspan=1 colspan=1>Apellido y Nombre</td><td></td><td></td><td></td></tr><tr><td rowspan=2 colspan=1></td><td rowspan=2 colspan=1></td><td rowspan=2 colspan=1></td><td rowspan=2 colspan=1></td><td rowspan=2 colspan=1></td><td rowspan=1 colspan=1></td><td rowspan=1 colspan=1></td><td rowspan=2 colspan=1>(P</td></tr><tr><td></td><td></td></tr></table>

euro Esteexamenseapruebobteniendoalmenosdosejerciclosbien(B) $y$ unoregular(R)，ysepromoconacn). bien)ge eericeee ldefinidoelsprcticaytodlqesediseolocandreferencisclarasEldendeerosio Entregarcadajercicioenhojas separadas.Recomendamosleerelparcial completoantesdeempezar&resolverlo.

Ejercicio 1-Programacion funcional

Aclaracion:enesteejerciciono esta permitidoutilizar recursion explicitaamenos que se Indque 10 porsuetegesUieospeetendoldeect OI

ata FS = Arch String | Dir String [FS] deriving (Eq,Show)

$_ { \textrm { y } }$

Definimos el siguiente directorio para los ejemplos:

r=Dir‘‘raiz'[Arch‘‘arch1'',Arch‘‘arch2',Arch‘arch3',

Dir‘‘subdir1’' [Arch ‘arch4’],Dir ‘subdir2'' [Arch‘‘arch1'’,Arch arch5"]] a)Dar el tipo $_ { y }$ definir las funciones foldFs $\boldsymbol { y }$ recFS,que implementan respectivamente los esquemas de recursion estructural $y$ primitiva para el tipo FS.Solo en este inciso se permite usar recursion explicita.

Ayuda:recFS ::.. (String $\scriptstyle \mathbf { \gamma } - >$ [FS]->[a]->a）->...

b) Definir la funcion rutas :: FS $- >$ [Striug],que iista las rutas de todos los archivos y subdirectorios de un sistema dearchivos dadouando lara $" / >$ como separador de directorios.

Por ejemplo:

utas unDir\~ ['raiz"','raiz/arch1",'‘raiz/arch2',''raiz/arch3'',"raiz/subdir1'', raiz/subdiri/arch4',raiz/subdir2',raiz/subdir2/arch1',raiz/subdir2/arch5'] c) Definir la funcion valido ：： $\mathrm { F S }  \mathrm { B o o l }$ ,que indique si, para cada directorio de un sistema de archivos,todos sus archivos y subdirectorios tienen nombres distintos.No importa si hay nombres repetidos entredistintos niveles-por ejemplo,no hay problema siun directorio tieneel mismo nombre que uno de sus archivos o subdirectorios-o si dos subdirectorios contienen archivos con el mismo nombre; solo importan los nombres dentro de un mismo directorio.

Por ejemplo:

Sugerencia:usar all y nub.

d) Definir la funcion rutasPosibles:：[String]->String]quedada una listade nombres (sinrpe tidos) genera la lista (infinita) de todas Ias rutas no vacias que se pueden generar con esos nombres. Porejemplo:

rutasPosibles ["'A,"B',"C]debecontenera“A",B,"C,"A/A',"C/B, A/C/C',B/A/A',B/A/B',C/A/B',"A/A/B/B'',C/B/C/A’entreOtras.

El codigo debe tener la siguiente estructura (a completar)：

rutasPosibles xss = concatMap ... [o.]

ConfoldNat：(bb->-tegr->defiidenlaga

# Ejercicio 2-Demostracion de propiedades

Considerar las siguientesdefiniciones

dataArbol23 a b= Hoja a|Dos b (Arbo123 a b)(Arbol23 ab)1Tresbb（Arbo123ab）（Arbo123ab)（Arbo123ab)const::a->b->a{C} const=（\x->\y->x）tamano ::Arbo123ab->Int  
{AO}tamafo（Hojav）=1  
{A1）tamafio（Dos xid）=1+tamafloi+tamanod  
{A2}tamano（Tresxyimd)=2+tamafo1+tamaiom+tamaiodtruncar：:a->Arbol23ab->Int->Arbol23 ab  
{TO}truncarc （Hoja v）=const （Hojac)  
{T1) truncarc（Dosxid）=（\n->if n<1 then Hojac else Dos x （truncar c i（n-1））（truncar cd （n-1）））  
T2}truncarc（Tres xyimd）=（\n->if n<1 then Hojac else Tres x y（truncar ci （n-1)）（truncar cm （n-1））（truncar cd （n-

a) Demostrar la siguiente propiedad:

Vt::Arbol23a b.Vc::a.∀n::Int.tamano(truncarctn) $\leq$ tamanot

Es importante plantear la propiedad como predicado unario y exhibir claramente el esque ma de induccion estructural.

Seconsideran demostradas las propiedades conocidas sobre enterosy booleanos,asf como tambien：

Para el caso del constructor Tres noes necesario escribir la demostracion paso por paso,basta con enunciarlaipotesisinductivaylatesisinductiva.ParalosonstrutoresHojayDossfesimportante presentar la demostracion completa.

b)Demostrar el siguiente teorema usando deduccion natural, sin utilizar principios clasicos:

$$
( ( \pi \Rightarrow \rho ) \lor ( \sigma \Rightarrow \tau ) ) \Rightarrow ( \sigma \land \pi ) \Rightarrow ( \rho \lor \tau )
$$

# Ejercicio 3-Calculo Lambda Tipado

Sedesea extender el calculo lambdapara modelar estructuras con formade anills finitos.Un anillo cuenta con un elemento actual,seguido por una cadena de $0$ o mas elementos hasta volver al actual. Se extienden los tipos y expresiones de la siguiente manera:

$$
\begin{array} { r }  \tau \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop : } \mathrel { \mathop } \mathrel { \mathop : } \mathrel { \mathop : } \mathbb { \mathop } \mathrel { \mathop : } \mathbb { \mathop : } \mathbb { \mathop } \mathrel { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb { \mathop } \mathbb { \mathop : } \mathbb  \end{array}
$$

Anillo, es el tipo de los anillos con elementos de tipo $\tau$ $\langle M \rangle$ es un anillo cuyo unico elemento (y por ende su elemento actual) es $M$ $M _ { 1 } \cdot \cdot , M _ { 2 }$ es el anillo resultante de agregar el elemento $M _ { 2 }$ a continuacion del elemento actual de $M _ { 1 }$ Notar que el elemento actual sigue siendo el mismo,y que este operador es un constructor (no realiza   
ninguna accion sobre el anillo ni sus elementos).Por ejemplo: $( \langle 0 \rangle \because 2 ) \because 1$ es el anillo cuyo elemento   
actual $\cos \underline { { 0 } }$ seguido por $\underline { { 1 } }$ luego 2 para luego volver al $\underline { { \boldsymbol 0 } }$   
actual $( M )$ es el elemento actual del anillo $M$   
avanzar $( M )$ es el anilloque resultade avanzar una posicion en el anillo $M$ ,de manera que su elemento   
actual es el ultimo que se agreg6 en $M$ (o el actual de $M$ si tiene un uinico elemento).

Por ejemplo:avanzar $( a v a n z a x ( ( \langle \underline { { { 0 } } } \rangle \cdot \underline { { { \cdot } } } \underline { { { 2 } } } ) \cdot \underline { { { \cdot } } } \underline { { { 1 } } } ) ) \to ( \langle \underline { { { 2 } } } \rangle \cdot \underline { { { \cdot } } } \underline { { { 1 } } } ) \cdots \underline { { { 0 } } }$ a) Introducir las reglas de tipado para la extension propuesta.

b)Definir el conjuntodevaloresylas nuevasreglasdereduccion en unpaso.Tener encuentaqueno es lo mismo avanzar un anillo con uno,dos o mas elementos. Pista:puede ser necesario mirar mas de un nivel de un termino para saber a que reduce.   
c) Mostrar paso por paso como reduce la expresion:actual(avanzar(0).Pred(3))∵1)   
d)Definir comomacrolafuncionsiguiente,quedadounanillconelementosdetipo $\tau$ devuelve el elemento siguiente al actual.

Peddeo

![](images/510a00dca10a62a581dcb2be26a2051b6da98b7126f34f3fb6fd3ee4d74d0bac.jpg)

JArch FDIt FolFs:（Stringol)→String→sol→ol→→ol FoldFSFArchfDir fS=CasefSof

-（Archs）→FArchs（Oirbss)→Dsmapsi)s)FArcCh FOTetssrecFSFArch FDir FS=CoseFSOf-（Arch s)→fArch.S→A  
rutosFS→[String]  
validoFs→Boolvslid=recfS（const Trve）ssubss sobsols→（llidsubsols)88length（maponombresubss)==lengthnubmapnombesss))  
DendenombreFS→stringnauibefdca  
nombre fs=Cosef5OF—（Archs)→S-(Dirs-)→5ATKASdde 2/4  
  
（t)V∴Vtaatrctn)<at  
ddt  
Srlnxii.D(Hojax)  
ranVxb4iArl(2b4dArbd12ab  
（P())()）(resxynd)HL  
  
  
CHoxyd&Hx)  
tama(trnanc（Hx）n)=(ont(Ho)n)  
=tana((xy→x）（Hoac）n）=tamo（→（Hj()）n)  
o  
LEmA⊥<tamHox)  
Snt1=an（tru(（Hojx）n)yetanano（trunsorc（Hojax）n）<tamoo（Hojx)  
decnl（Hox）

![](images/41b70e208f01457ce411979392648de0b34f6e43b957d25c02186103db0d1d62.jpg)

![](images/9dd7ace9885d7ef5946f22a95c42142215c44ef2343be9ef2f55b69f01da6adb.jpg)

$$
\begin{array} { r l } & { \int _ { \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } } ( ( \boldsymbol { \Delta } \boldsymbol { \omega } \cdot \boldsymbol { \mathbf { A } } ) ) \cdot \boldsymbol { \mathbf { A } } \cdot \gamma _ { \mathrm { p q u a b } , \mathbf { k } } \cdot \boldsymbol { \mathbf { k } } \cdot \boldsymbol { \mathbf { j } } \cdot [ ( \boldsymbol { \mathbf { B } } \boldsymbol { \omega } \cdot \boldsymbol { \mathbf { x } } \cdot \boldsymbol { \mathbf { A } } ) ] \cdot \boldsymbol { \mathbb { B } } \cdot \boldsymbol { \mathbf { u } } } \\ &  \int _ { \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } \oplus \boldsymbol { R } \cdot \boldsymbol { \mathbf { A } } \cdot \boldsymbol { \mathbf { j } } \cdot [ ( \boldsymbol { \Delta } \boldsymbol { \omega } \cdot \boldsymbol { \mathbf { A } } ) ] \cdot \boldsymbol { \mathbf { B } } \cdot \boldsymbol { \mathbf { j } } \cdot [ ( \boldsymbol { \mathbf { B } } \boldsymbol { \omega } \cdot \boldsymbol { \mathbf { A } } ) ] \cdot [ ( \boldsymbol { \mathbf { B } } \boldsymbol { \omega } \cdot \boldsymbol { \mathbf { A } } ) ] } \\ &  \int _ { \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } \oplus \mathbf { R } \oplus \boldsymbol { R } \oplus ( ( \boldsymbol { \mathbf { B } } \cdot \boldsymbol { \mathbf { A } } ) \cdot \boldsymbol { \mathbf { A } } ) \cdot [ ( \boldsymbol { \mathbf { B } } \boldsymbol { \omega } \cdot \boldsymbol { \mathbf { A } } ) ] \cdot [ ( \boldsymbol { \mathbf { B } } \boldsymbol { \omega } \cdot \boldsymbol { \mathbf { A } } ) ] \cdot [ ( \boldsymbol { \mathbf { B } } \boldsymbol { \omega } \cdot \boldsymbol { \mathbf { A } } ) ] } \\ &  \frac { \beta } { 2 } \frac { \beta } { 2 } \frac { \beta } { 8 } \frac { \beta } { 8 } ( ( \boldsymbol { \Delta } \cdot \boldsymbol  \end{array}
$$

（n<1)=Fl5e:tao(iFFbetho（Hc)（Do（oni（n-）（tccda）))ltamn（Dosx（truncarci（n-1））（truncar（d（(n-）)A1+（tarno（truncorCn）+（tamantruncrCdn-))）  
anatdtd(iy  
taman(troncri（-））tamoitaan（trnccd-1)）tad  
iddntdbgi  
）t-））  
≤1+tonanoi+tananod=taman（Dosxid)  
raboniiegmdgondlecononagve  
FuieddeDosxid）no△yaredotb{Dox)27日 EN HOA SIGNEENTEer 3/4  
  
eildenynde BIeA: P

Pdgsderogre 414 3Itde T-<M>:Anillot 1-Mit -T-Llave [-M:ArilloTT-Actua TFM:Anllov —↑-Avana [tactual（m）:T 厂-vanzor{m）：Anilot bintdebe2eatadaV=..<v>VV deeee) <M>→<= MMEAb M→M actual(m)→ctv(mnz(( ct( ven20(<v）→< (<>∵W）→<W> E-ANone3 avenzr(v.W）→>ku>ne(v))W M。N→MN N→N E-PontoR M.V→MoV M→M E-Pontsal gedindeE-Avanrgyueg deyeiVeUge mm(2）（<1<∵2 udegaged

atol(avonzor（（<0>Pred（3)）)   
EAEt E-Actuol,   
E-（（<2）∵>

edeege e

![](images/95fb4dd26fc98dfca398f5b165dfdd9842985975acaa464060ded79cca0e51b6.jpg)

sguinte=Actu()