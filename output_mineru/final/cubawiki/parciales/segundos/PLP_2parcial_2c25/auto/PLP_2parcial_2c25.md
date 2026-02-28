PLP-Segundo Parcial-2do cuatrimestre de 2025

<table><tr><td></td><td rowspan=3 colspan=1>Turno</td><td rowspan=3 colspan=1>Libreta</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td></td><td rowspan=2 colspan=1>Ej1</td><td rowspan=2 colspan=1>E2</td><td></td></tr><tr><td rowspan=1 colspan=1>#Orden</td><td></td><td></td></tr><tr><td rowspan=1 colspan=1></td><td rowspan=1 colspan=2></td><td></td><td rowspan=1 colspan=1>EE</td><td rowspan=1 colspan=1>EE</td><td rowspan=1 colspan=1>E</td></tr></table>

EsteexamenseapruebteendonlesdsjerciclebeB)yregular(R)，ysepromocinonlmdoe ) d enojssepdddelmelodded prctcdoet separadnsRecomendamosleerelparcialcompletontedempezararosolverlo

# Ejercicio 1-Programacion Logica

Implementar lospredicadosrespetandoencndacaso lainstanciacionpedida.Los generadoresdeben cubrir todas las deqeleespeseedsaddelped que colapsen clausulas,cut （！） )ni predicados dealto dencon launica excepindeot

Eneste ejercicio trabajaremos con melodias.Se cuenta con el predicado nota(?N) quees verdadero ota(doretcLlosederoel2)ersee dedosmelodAldeelrd)aeretald a)DefinirelpredicadolistaAMelodia(+LM)queesverdaderocuandoMesunamelodia quecontieneenoen notas de la lista L.Por ejemplo:

?-listaAMelodia([do,re,mi,fa],M) M=sec（do,sec(re,sec（mi,fa）)）;   
M=sec(do,sec(sec(re,mi）,fa));   
M=sec(sec(do,re),sec(mi,fa));   
M=sec（sec（do,sec（re,mi））,fa);   
M=sec（sec（sec(do,re),mi),fa);   
false.

b)Detinir el predicado submelodia $( + M , - S )$ que es verdadero cuando S es una subsecuencia de M.Una melodia Ses subsecuenciadeunamelodiaMcuando Sesun subterminodentrodelaestructura deM,obtenidosiguiendo algin caminodesecsinreordenarniitirpartes.Esdecir,lamelodia secdosec(re,i))tienecomo subsececias asec(ei）di))oeesde）d）e ejemplo:

$? -$ submelodia(sec(sec(do,sec(re,mi)),fa),S).  
$\mathrm { ~ \mathsf ~ { ~ s ~ } ~ } =$ sec(sec(do,sec(re,mi)),fa);${ \textbf { s } } =$ sec(do,sec(re,mi));$\mathrm { ~ \mathsf ~ { ~ s ~ } ~ } =$ sec(re,mi);false.

$i ^ { \mathrm { E l } }$ predicado es reversible en S? Justificar brevemente.

c)DefinirelpredicadosinSubmelodiasEnComun $+ M I$ ,+M2)queesverdaderocuandoM1y M2notienensubmelodias en comun. Por ejemplo:

?-sinSubmelodiasEnComun(secdo,sec(re,mi)）,sec（fa,sec(re,i))).false.  
?-sinSubmelodiasEnComun(sec(do,sec(re，mi)),sec（fa,secre,sol)))true.

d)Definirelpredicadomelodia(-M)queinstanciaen Mtodaslasmelodias.Nosepermitedefinirmelodiaenfuncion delistaAMelodiadebedefinirse generandolastructurasencadapasoPorejemplouponiendoquelasunicas notas fueran do y re:

?-melodia(M). $M = d \sigma$ $\mathrm { ~  ~ M ~ } = \mathrm { ~  ~ \it ~ \it ~ \it ~ \it ~ \tau ~ } _ { x \in \mathrm { ~ \scriptsize ~ \it ~ \Omega ~ } }$ ;   
M=sec（do,do）;

$$
\begin{array} { r } { \begin{array} { r } { M = \mathrm { ~ s e c } ( \mathrm { d o } , \mathrm { r e } ) ; } \\ { M = \mathrm { ~ s e c } ( \mathrm { r e } , \mathrm { d o } ) ; } \\ { M = \mathrm { ~ s e c } ( \mathrm { r e } , \mathrm { r e } ) ; } \\ { M = \mathrm { ~ s e c } ( \mathrm { d o } , \mathrm { s e c } ( \mathrm { } } \end{array} } \end{array}
$$

$\begin{array} { r l } & { M = \sec ( \deg , \sec ( \deg , \tt { r e } ) ) ; } \\ & { } \\ & { M = \sec ( \sec ( \deg , \tt { r e } ) , d o ) ; } \end{array}$

Ejerciclo 2-Resolucion

Representar en forma clausnl Ins siguientes formulas de logicn de primer orden

1）vX.(vcio（X）vZ.-（2EX)) ntoeiosiysolsininginlementopeteeceal. Siun elemento pertenece a un conjuntooaotroentonces pertenee a launiondeambos

c.Utilizarresolucionpara demostrarlaformuladel incisoanteriorIndicarIasustitucinutilzadaencadapaso d.La resolucion utilizada enel punto anterior,fue SLD? Justificar.

Ejercicio 3-Inferencia $\mathbf { y }$ Deduccion Natural

Consideremos el Calculo Lambda tipado extendido con colas (queues)de la siguientemanera: =..·/Cola M=··|（(）|M·M丨map $x : \tau \mapsto M$ in $M$ · $C O \bot a _ { T }$ es el tipodelas colas de tipo $\tau$ $0 _ { \tau }$ es una cola vacia de tipo $\tau$   
M1·M2 es una cola M1 alacual se le agrega al final un elemento M2.   
mape：g→M1inM2 representa una cola con la misma estructura que M2，pero queen cada elemento contieneelresultadodereemplazar lasapariciones libresdeeen M1,porelvalordelelementocorrepondiente enM2,como se ve en el siguienteejemplo：

$$
\mathtt { m a p } e : N a t \mapsto \mathtt { s u c c } ( e ) \mathrm { i n } \langle \rangle _ { N a t } \bullet \underline { { 3 } } \bullet \underline { { 0 } } \bullet \underline { { 1 } } \sim \langle \rangle _ { N a t } \bullet \underline { { 4 } } \bullet \underline { { 1 } } \bullet \underline { { 2 } }
$$

Se dispone delas siguientes reglas de tipado

$$
\begin{array} { r l r } { \frac { \Gamma \vdash ( \gamma _ { \tau } : \mathsf { c o l a } _ { \tau } ) } { \Gamma \vdash M _ { 1 } : \mathsf { C o l a } _ { \tau } } } & { \qquad } & { \frac { \Gamma \vdash M _ { 1 } : \mathsf { C o l a } _ { \tau } } { \Gamma \vdash M _ { 1 } \bullet M _ { 2 } : \mathsf { C o l a } _ { \tau } } \qquad } & { \frac { \Gamma , x : \tau \vdash M _ { 1 } : \sigma } { \Gamma \vdash \mathsf { m a p } : \tau \mapsto M _ { 1 } \ : \mathsf { i n } \ : M _ { 2 } : \mathsf { C o l a } _ { \tau } } } \end{array}
$$

Seextiende tambien el algoritmo de inferencia de la siguiente manera:

$$
\begin{array} { r l } & { \mathcal { T } ( \Gamma \mid \{ \mathcal { S } _ { \tau } \} = ( \mathsf { c o l a } _ { \tau } \mid \boldsymbol { \vartheta } ) } \\ & { \mathcal { T } ( \Gamma \mid M _ { 1 } \bullet M _ { 2 } ) = ( \mathsf { c o l a } _ { \tau _ { 2 } } \mid \{ \tau _ { 1 } \overset { ? } { = } \mathsf { c o l a } _ { \tau _ { 2 } } \} \cup E _ { 1 } \cup E _ { 2 } ) } \\ & { \begin{array} { r l } & { \mathcal { I } ( \Gamma \mid M _ { 1 } ) = ( \tau _ { 1 } \mid E _ { 1 } ) } \\ & { \mathcal { I } ( \Gamma \mid M _ { 2 } ) = ( \tau _ { 2 } \mid E _ { 2 } ) } \end{array} } \\ & { \mathcal { X } ( \Gamma \mid \mathbf { u } \mathbf { a } \mathbf { p } \boldsymbol { x } ; \tau _ { n } \mapsto M _ { 1 } \mathbf { i n } M _ { 2 } ) = ( \mathsf { c o l a } _ { \tau _ { 1 } } \mid \{ \tau _ { 2 } \overset { ? } { = } \mathsf { c o l a } _ { \tau _ { n } } \} \cup E _ { 1 } \cup E _ { 2 } ) } \\ & { \begin{array} { r l } & { \mathcal { I } ( \Gamma , \boldsymbol { x } \mid \tau _ { x } \mid M _ { 1 } ) = ( \tau _ { 1 } \mid E _ { 1 } ) } \\ & { \mathcal { I } ( \Gamma \mid M _ { 2 } ) = ( \tau _ { 2 } \mid E _ { 2 } ) } \end{array} } \end{array}
$$

Se pide:

i) Rectificar el siguiente termino:

i)UsarelalgoritmoIpara inferir el tipode las siguientes expresionesodemostrarque noson tipables

$$
( \lambda x \cdot \lambda y \cdot z ) ( \zeta ) \bullet ( r u e )
$$

sustitucion final. seribrelpasoaodelGUeroebentarpeseteslseacioedecy

menteteoremaendeducionnatural.Esnecesariousarpricipiosclasicos.Recordarquepueden utilizarlos teoremas demostrados enla guia (delaforma queestan eseritos alli)

$$
( \neg \forall Y , P ( Y ) ) \Rightarrow \exists X . ( P ( X ) \Rightarrow Q ( X ) )
$$

Eercicio1,hoj1/1 1/5listAMeld([N]，N）i-notN)neeelistAMelodi（L,sec(m1,m2)):-ppend(1,L2,L),etge2,lisbAmelodi(Li,m）,lstAmelodi（L2,）

Dsfnedid com: submelodia(sec(m1,m2),sec(m1,m2))。 subrelodisec(m,-),):-bmelod(m1,) submelodia(sec(-,M2),S):-submelodia(M2,5).

Etpedie neerib ZobeSdd guenJa irtoroouon roe utnon predid gue naSdteetS apotndemfiaco yaalvuaecurip2odadeLorubmd Coe

Dfiledicd com:sinSubelodsEnComm，m2)：-notbSubmelodnComu(msm))Utl 2pedebauiliahySubmelodiaEnComun(+M1+M2)：haySubrelodiaEnomu(M1,M2）：-submelodia（m1，S），submelodis(m2，s)

Dfiedicddeiginmone  
melodi(m):-matural(T），melodiaDeTamano(M，T).  
melodiaDeTəmao(M，1）：-nota(m）.  
el，）-1  
betwe(1TpK1)，2s  
mede

$$
\begin{array} { r l } & { | | \operatorname* { P r } _ { \overline { { \mathbf { S } } } } ( \mathbf { S } ) | ^ { 2 } , } \\ & { \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad } \\ & { \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad } \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad  \\ & { \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad \quad } \\ &  \quad \quad \quad \quad \quad \quad \quad \quad \end{array}
$$

=Vx.4y..（e(x）vrtee(,（y))△(pertenere（2,y）vperbenere（2,Unon(x))））

tece （gve20ne tombiae

![](images/e53f491b8536f693ddb4a1503a17d593ef375754b06ea18fe1197dab44cea142.jpg)

Pridoloo decoln)stgdinum ontvacounion（x13gvo)v(g)3gaalymzguitmfa① prtearevone)tpertece(no(x)③pertere(te)otS=ngo(per）)=t（（xy）=xy{pertenere（△，）③②{pete（）3Patee（x），x）？S=mgulP（1（（xxe()vacio（x）@③  
te  
{pertenece（2，）@②  
Ss=g(pae(=tx borre,ol0 tengo mal pub!  
cubiano Evacio(g)  
6=guvacio()x S=mgu(vo(/(3)=口

![](images/181bff60da1dc865902e6fa35e0e6b12d38d684f45d3dbc25d37d45a037dbc7b.jpg)

Ejercicio2，hoja2/2 3/5 alRenidn，noaoudgednopopedib nvoa NouesLDgontraoueLinalEdeeage Lrebo mficoonde③cn② No utbXinuetdelaotai que③（gennottnobgZnagueg）

田A $\begin{array} { r l } & { \frac { | | \hat { \mathbf { f } } _ { x } ( x , 0 ) - \mathbf { J } _ { x } ( \hat { \mathbf { g } } _ { 2 } ^ { \dagger } ) | / 2 } { | \hat { \mathbf { f } } _ { y } ( x , 0 ) - \mathbf { J } _ { x } ( \hat { \mathbf { g } } _ { 2 } ^ { \dagger } ) | / 2 } } \\ & { \frac { | \hat { \mathbf { f } } _ { x } ( x , 0 ) - \mathbf { J } _ { x } ( \hat { \mathbf { g } } _ { 2 } ^ { \dagger } ) | / 2 } { | \hat { \mathbf { f } } _ { y } ( x , 0 ) - \mathbf { J } _ { x } ( \hat { \mathbf { g } } _ { 2 } ^ { \dagger } ) | / 2 } } \\ & { \frac { | \hat { \mathbf { f } } _ { y } ( x , 0 ) - \mathbf { J } _ { x } ( \hat { \mathbf { g } } _ { 2 } ^ { \dagger } ) | / 2 } { | \hat { \mathbf { f } } _ { y } ( x , 0 ) - \mathbf { J } _ { x } ( \hat { \mathbf { g } } _ { 2 } ^ { \dagger } ) | / 2 } | \hat { \mathbf { f } } _ { y } ( \hat { \mathbf { g } } _ { 2 } ^ { \dagger } ) | / 2 } \\ & { \frac { | \hat { \mathbf { f } } _ { y } ( x , 0 ) - \mathbf { J } _ { x } ( \hat { \mathbf { g } } _ { 2 } ^ { \dagger } ) | / 2 } { | \hat { \mathbf { f } } _ { y } ( x , 0 ) - \mathbf { J } _ { x } ( \hat { \mathbf { g } } _ { 2 } ^ { \dagger } ) | / 2 } } \\ &  \frac { | \hat { \mathbf { f } } _ { y } ( x , 0 ) - \mathbf { J } _ { y } ( \hat { \mathbf { g } } _ { 2 } ^ { \dagger } ) | / 2 } { | \hat { \mathbf { f } } _ { y } ( x , 0 ) - \mathbf { J } _ { x } ( \hat { \mathbf { g } } _ { 2 } ^ { \dagger } ) | / 2 } \frac  | \hat   \end{array}$ FocriddposaeeI(厂M)voyadbuunldendeaebanytuetcbrgemeniat  
[(1ax:x.（ag:xz1）（<2xote））①  
1（o1（x:.（g:x2,2）） ↓Ab5 -APP- 工(ol<>xotve）② Colao  
（olx:x3ag：xz）-（ol<>x）c（oltrve↓Abs  
[（0x:x,gx3））  
uenddcdntovs  
²=（x1x）国=（Doll）③@=（Colx.la）>

（x→x）/（x2x）） =(xxx2）=（olaDdX，Colx²ColBo3）aXa Obsetgideemmudetcn

$\begin{array} { r l } & { \quad \sum _ { k \geq 2 } e ( \mathscr { X } _ { k + 1 } + \mathscr { X } _ { k + 2 } ) , \quad \mathscr { Z } _ { k } ( \mathscr { X } _ { k } ) = - \mathscr { Z } _ { k } , \quad \mathscr { Z } _ { k } ( \mathscr { X } _ { k + 1 } , \mathscr { Z } _ { k } ) = } \\ & { \quad \sum _ { k \geq 2 } e _ { \pm 1 } ^ { - 1 } \mathscr { Z } _ { k } , \quad \mathscr { Z } _ { k } ( \mathscr { X } _ { k + 2 } , \mathscr { X } _ { k } ) = \mathscr { Z } _ { k } , \quad \mathscr { Z } _ { k } ( \mathscr { X } _ { k } , \mathscr { X } _ { k + 2 } ) = } \\ & { \quad \sum _ { k \geq 1 } e _ { \pm 1 } ^ { - 1 } \mathscr { Z } _ { k } , \quad \mathscr { Z } _ { k } ( \mathscr { X } _ { k } ) = \mathscr { Z } _ { k } , \quad \mathscr { Z } _ { k } ( \mathscr { X } _ { k } ) = \mathscr { Z } _ { k } , \quad \mathscr { Z } _ { k } ( \mathscr { X } _ { k } ) = } \\ & { \quad \frac { 1 } { \sqrt { 2 } } e _ { \pm 1 } ^ { - 1 } \mathscr { Z } _ { k } , \quad \mathscr { Z } _ { k } ( \mathscr { X } _ { k } ) = \mathscr { Z } _ { k } , \quad \mathscr { Z } _ { k } ( \mathscr { X } _ { k } ) = } \\ & { \quad \sum _ { k \geq 2 } e _ { \pm 1 } ^ { - 1 } \mathscr { Z } _ { k } , \quad \mathscr { Z } _ { k } ( \mathscr { X } _ { k } ) = \mathscr { Z } _ { k } , \quad \mathscr { Z } _ { k } ( \mathscr { X } _ { k } ) = } \\ & { \quad \mathscr { Z } _ { k } , \quad \mathscr { Z } _ { k } ( \mathscr { X } _ { k } ) = \mathscr { Z } _ { k } , \quad \mathscr { Z } _ { k } ( \mathscr { X } _ { k + 2 } , \mathscr { X } _ { k } ) = } \\ &  \quad \mathscr { Z } _ { k } , \quad \mathscr { Z } _ { k } \geq \mathscr { Z } _ { k } \end{array}$   
  
  
E  
一1ghb:）  
M  
DibuadeI（FIM）：  
Ie|mope:xe→iszele)in<x01）①mapc1（o1<x0）③bColao- deshgo elmxer  
1(2e:xe31e)@ 1（e/<x）Surr  
gsn d l（丨er）②  
/Boolet  
ltl，2NtlaxCstNN)  
nlmudestic

![](images/9cd9927775c3ac673198178db47c100906de298445ac4ccdde6296cea72306a5.jpg)

Eercicio 3,hoj2/2 5/5 iColaNt²Colaxe，x=Nt，Colax=ColaNatNt2Nt) deonpxeabe NNt bgbedntlx Colax=Co >{xe=Nt，xc²Nt} Elu eanoa Cn[Xe=NatX=Nt htugneaS=xe=Nstxc=Nt子gn: s(o)├S(m）:S(Colaboot) gdean: -(mope:Natt→iszerle）in<>Nto1）：ColaBol geci3日mtcril

Parademot toen 二   
eeRilyia deniyon demino 三 B 个 V 介 1