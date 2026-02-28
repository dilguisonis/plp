PLP - Recuperatorio del Primer Parcial - $1 ^ { \mathrm { w } }$ cuatrimestre de 2024   

<table><tr><td>#Orden</td><td colspan="2">Nro.Libreta</td><td colspan="2">Apellido(s)</td><td colspan="2">Nombre(s)</td></tr><tr><td>81 </td><td colspan="2"></td><td colspan="2">FalKowski</td><td colspan="2">Valentin.</td></tr><tr><td>Corregido por</td><td>Nota E1</td><td>Nota E2</td><td>Nota E3</td><td></td><td>Nota Final</td><td rowspan="3"></td></tr><tr><td>PERLA</td><td></td><td>B-</td><td>B-</td><td>B</td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td><td></td></tr></table>

Esteexmenseapruebaobeniendoalmenosdosjerciciosbienmenos(B-)yunoregular(B).Lasnotasparacadajercicio so-I,egdeepdoebidoyodl numerarlasSepuedeutilizartodolodefinidoenlspracticasytodoloquesdioenclasecolocandoeferenciscaras EordendeloseccosesarbtarioRecomendaoslerelprealcompetoantesdempeararesoerlo

# Ejercicio 1-Programacion funcional

trio

data Prop Var String | No Prop 丨 Y Prop Prop l O Prop Propl Imp Prop Prop

type Valuacion = String -> Bool

Porejeplo‘）））

Lasvaluaciosestcocdiablropslig PorejenplolavuacionxleasignaelvlorverdaderolavariablePyfsds otras variables proposicionales.

a)Dareltipdefiirlfucosfdroycueipletanespectivates Deree explicita.

b)DefinirlfcionvriblesPropStringueddfrladevevelisaono sus variablesproposicionales enalgun orden,sinelenentos repetidos

Prejeplo:vbes（（rp）（(Var）(Var)）deberidever

)Defiirlfaoo

# Ejercicio 2-Demostracion e inferencia

Considerar las siguientes definiciones sobre Arboles con informncion en las hojas

data AIH a-Hoja a | Bin (AIHa) (AIH a) der:AIHa->AIHa esHoja ：:AIHa->Bool {D}der（Binid）=d   
{EO}esHoja （Hoja x）=True   
{E1}esHoja (Bin id）-False mismaEstructura::AIH a-> AIH a -> Bool {MO) mismaEstructura (Hoja x）=esHoja izq：:AIHa->AIHa {M1}mismaEstructura（Bin id）=\t ->not （esHojat）&   
{I}izq（Binid）=i mismaEstructura i (izq t） && mismaEstructura d (der t

a)Demostrar la siguiente propiedad:

Vt：：AIH a.Vu::AIH a.mismaEstructura tu=mismaEstructuraut

Serecomienda hacer induccion en el primerarbol,utilizando extensionalidaden el segundo.Se permite definir macros (poner nombres a expresiones largas para no tener que repetirlas).

Noes obligatorio reescribir los Vcorrespondientes en cada paso,pero es importante recordarque estan presentesyescribir los que corespondan al platear la propiedad como predicado unario.Recordar tambien que los= de las definiciones pueden leerse en ambos sentidos.

Se consideran demostradas todas las propiedades conocidas sobre enteros y booleanos.

b)Usarel algoritmo Wpara inferir juiciosde tipado validos para las siguientes expresionesoindicarpor quenoes posible (recordar que en inferencia no esta permitido renombrar variables)：

1)（Ax.x(λx.Succ(x))(Ax.x)ifsZero(x)then x elsex zero

# Ejercicio 3-Calculo Lambda Tipado

Sedesea extender el calculo lambda simplemente tipado para modelar Arbolescon informacion enlas hojas.Para eso se extienden los tipos y expresiones de la siguiente manera:

· $A I H ( \tau ) \cos$ el tipo de los arbolescon informacionen las hojas de tipor.

·Hoja(M) es un arbol compuesto por una unica hoja con informacion $M$ · $\mathsf { B i n } ( M _ { 1 } , M _ { 2 } )$ es un arbol compuesto por dos subarboles $M _ { 1 }$ y $M _ { 2 }$

Elobservador caseM1 of Hojax\~ M2;Bin(i,d)\~M3 permite acceder al valorde un arbol que es hoja(el cual se ligaraa la variabler quepuede aparecer libre en M2),ya los dos subarboles de un Arbol que no $\curvearrowright$ hoja(loscualesseligaranalas variablesiydquepuedenaparecerlibresen $M _ { 3 }$

a.Introducir las reglas de tipado para la extension propuesta.

Mostrar paso por paso cono reduce la expresion:

case(An:Nat.Hoja(n)) Succ(zero) of Hoja x\~ Succ(Pred(x);Bin(i，d)\~ zero d

$\begin{array} { r l } { \varphi _ { 0 } ( x ) } & { = ( \varphi \omega _ { 0 } ^ { \ast }  \varphi )  ( \varphi \omega _ { 0 } ^ { \ast }  \varphi )  ( \varphi \omega _ { 0 } ^ { \ast }  \varphi )  ( \varphi \omega _ { 0 } ^ { \ast }  \varphi )  ( \varphi \omega _ { 0 } ^ { \ast }  \varphi ) } \\ & {  ( \varphi \omega _ { 0 } ^ { \ast }  \varphi )  \Re \cdot \mathrm { P r e } \varphi  \varphi  \sqrt { \frac { \varphi \omega _ { 0 } ^ { \ast } } { \omega _ { 0 } ^ { \ast } } } } \\ & {  \mathrm { P e } \omega _ { 0 } ^ { \ast }  \mathrm { P e } \omega _ { 0 } ^ { \ast } \mathrm { P o r }  \mathrm { P e } \omega _ { 0 } ^ { \ast } \mathrm { P o r }  ( \omega _ { 0 } ^ { \ast } \omega _ { 0 } ^ { \ast } ) } \\ &  \overset { \mathrm { ( f _ { e e e } } = \omega _ { 0 } ^ { \ast } = \varphi \omega _ { 0 } ^ { \ast } = \varphi \omega _ { 0 } ^ { \ast }  0 \mathrm { ~ ( f _ { e e } } = \omega _ { 0 } ^ { \ast } ) = \mathrm { ~ ( f _ { e i g e } ~ } = \omega _ { 0 } ^ { \ast }  0 \mathrm { ~ ( f _ { e i g e } ~ } = \omega _ { 0 } ^ { \ast } ) } \\ & { \overset { \mathrm { ( b a ) } } {  } \mathrm { ~ ( f _ { e i g e } ~ } = \omega _ { 0 } ^ { \ast } \mathrm { P o r }  \mathrm { ~ ( f _ { e i g e } ~ } = \omega _ { 0 } ^ { \ast } \mathrm { P o r }  \omega _ { 0 } ^ { \ast } \mathrm { ~ ) } } \\  \varphi _ { 0 } ^ { \ast }  \mathrm { ~ ( f _ { e i g e } ~ } = \omega _ { 0 } ^ { \ast } \mathrm { P o r }  \mathrm { ~ ( f _ { e i g e } ~ } = \omega _ { 0 } ^ { \ast } \mathrm { P o r }  \omega _ { 0 } ^  \ \end{array}$ uoI   
foNneioK ntin   
f $ \begin{array} { l l l l l } { \operatorname { i g } \operatorname { i n f } } & { \operatorname { f o r } } & { \operatorname { f o r } } & { \operatorname { - } \operatorname { - } \operatorname { \rho } - \operatorname { \rho } ( \operatorname { V o r } { \mathfrak { s } } ) } & { = ( \operatorname { f o r } \varphi ) } \\ { \operatorname { i g } \operatorname { f o r } } & { \operatorname { f o r } \operatorname { f o r } \operatorname { f o r } \operatorname { f o r } } & { \operatorname { f o r } \operatorname { f o r } \operatorname { f o r } } & { \operatorname { f o r } \operatorname { f o r } } \\ { ( \operatorname { W } \circ } & { \operatorname { e } ) } & { = } & { \operatorname { f o r } \operatorname { a n } \operatorname { \rho } ( \operatorname { v e c o n } { \mathfrak { p } } ) } \\ { ( \operatorname { Y } \circ } & { \operatorname { e } _ { \mathfrak { s } } \operatorname { f o r } ) } & { = } & { \operatorname { f o r } ( \operatorname { Y e c o n } { \mathfrak { p } } ) } \\ { ( \operatorname { V o r } } & { \operatorname { e } _ { \mathfrak { s } } \operatorname { f o r } ) } & { = } & { \operatorname { f o r } ( \operatorname { Y e c o n } { \mathfrak { p } } _ { \mathfrak { s } } ) } & { ( \operatorname { ( \operatorname { e x e } _ { \mathfrak { s } } \operatorname { \rho } \varphi ) } ) } \\ { ( \operatorname { O } \circ } & { \operatorname { e } _ { \mathfrak { s } } \operatorname { \rho } _ { 2 } ) } & { = } & { \operatorname { f o r } ( \operatorname { ( e x e } _ { \mathfrak { s } } \operatorname { P } _ { 3 } ) } & { ( \operatorname { ( \operatorname { e x e } _ { \mathfrak { s } } \operatorname { \rho } \varphi ) } ) } \\ { { \frac { 1 } { \operatorname { d e t } } } \operatorname { e n } \operatorname { \rho } _ { 3 } \operatorname { \rho } _ { 2 } ) } & { \operatorname { f o r } } & { ( \operatorname { Y o r } \operatorname { f o r } \operatorname { f o r } \operatorname { f o r } \operatorname { f o r } \operatorname { f o r } \operatorname { f o r } ) } \\  \operatorname { i n f } _  \operatorname  e c o \end{array}$ 0.=8   
$\begin{array} { r l } & { \mathrm { ( \textnormal { \texttt { Y } } ~ e _ { 1 } ~ e _ { 2 } ~ ) = ~ } \begin{array} { l } { f _ { 1 } , } \\ { f _ { 2 } } \end{array} \quad \mathrm { ( r e c o ~ \hat { e } _ { 1 } ~ \rho ~ , ~ t _ { 2 } ~ ) = ~ } \begin{array} { l } { f _ { 1 } } \\ { ( \textnormal { \texttt { c g } } , ~ \varphi _ { 2 } ) } \end{array} \quad , } \\ & { \mathrm { ( \texttt { O } ~ e _ { 2 } ~ \rho _ { 1 } ~ ) = ~ } \begin{array} { l l l l l l } { f _ { 2 } } & { \mathrm { ( f e c o ~ \hat { e } _ { 2 } ~ \rho _ { 2 } ) } } & { \mathrm { ( \ r e c o ~ \hat { e } _ { 2 } ~ \rho _ { 1 } ~ ) = ~ } } & & \\ { \vdots } & { } & { } & { } & { } & { } \\ { \operatorname* { \texttt { a n g } } ( \textnormal { \texttt { R } } , ~ \varphi _ { 2 } ) = ~ } \end{array} } \\ & { \begin{array} { l } { \frac { ( \hat { \mathcal { X } } _ { 1 } ) \times \theta _ { 1 } } { \sqrt { \theta _ { 1 } + \theta _ { 2 } } } , } & { \mathrm { ( \ r e c o ~ \hat { e } _ { 2 } ~ \rho _ { 2 } ~ ) ~ , } } & { \mathrm { ( \ r e c o ~ \hat { e } _ { 2 } ~ \rho _ { 2 } ~ ) ~ , } } & { } \\ { \frac { ( \hat { \mathcal { Y } } _ { 2 } ) \times \theta _ { 1 } } { \sqrt { \theta _ { 1 } + \theta _ { 2 } } } , } & { \mathrm { ( \ r e c o ~ \hat { e } _ { 2 } ~ \rho _ { 1 } ~ ) = ~ } } & { \int _ { \mathbb { R } } \theta _ { 1 } } \end{array} } \\ &  \begin{array} { l }  ( \hat { \mathcal { X } } _ { 1 } ) : = \begin{array} { l } { ( \hat { e } _ { 1 } , \rho _ { 2 } ) \times \theta _ { 2 } } \\ { \vdots } \\ { \hat { e } _ { 2 } \times \theta _ { 2 } } \end \end{array} \end{array} \end{array}$ es ROP Con sula. RDR   
fipode dares Prop (con Pmeub)   
“

rec $\begin{array} { r l } & { \mathrm { ( s e c r a p ) } _ { + ^ { \prime } = 0 }  \mathrm { ( f o r o p - s e c o ) }  \mathrm { ( f o r o p - s e c o ) }  \mathrm { ( f o r o p - s e c o ) }  \mathrm { ( f o r o p - s e c o ) }  \mathrm { ( f o r o p - s e c o ) }  } \\ { * \mathrm { ( f o r o p - s e c o s - s e c o ) }  \mathrm { ( f o r o p - s e c o s ) }  \mathrm { ( f o r o p - s e c o s ) }  \mathrm { ( f o r o p - s e c o s ) } } \\ { * \mathrm { ( f o r o p - s e c o - s e c o ) }  \mathrm { ( f o r o p - s e c o s ) }  \mathrm { ( f o r o p - s e c o s ) } } \\ { * \mathrm { ( s e c h o s - f o r o p - s e c o s ) } } \\ { * \mathrm { ( s e c h o s - f o r o p - s e c o s ) } } \\ { * \mathrm { ( f o r o p - s e c o s ) } } \\ { * \mathrm { ( f o r o p - s e c o s ) } } \\ { * \mathrm { ( f o r o p - s e c o s ) } } \end{array}$ (amPPp)=fimAPP(recnP1)（recn P2) whoereon=recprop Fvarfnocsyfosimp

Va $\begin{array} { r c l } { { } } & { { \dot { \gamma } > \operatorname { \texttt { g o f } } \dot { \varepsilon } \dot { \textbf { \texttt { G } } } ( a ) } } & { { \dot { \varepsilon } ^ { \prime } \dot { \varepsilon } ^ { \prime } } } \\ { { } } & { { ~ \operatorname { \texttt { g r o p } } \dot { \varepsilon } ( \widehat { \bigtriangledown } ) ~ . ~ \operatorname* { \mathbb { P } } _ { \Gamma ^ { } \circ \mathbb { P } }  ~ \operatorname { \texttt { L s t r i n } } \dot { \varrho } ^ { - } \big ] ~ . } } \\ { { } } & { { ( \operatorname { \texttt { W i p } } \dot { \varrho } ) \dot { \varepsilon } \dot { \ge } \operatorname { \texttt { f o l d p } } \dot { \varphi } ( \operatorname { \texttt { S } } \dot { \textbf {  { s } } } ) ~ \operatorname { \texttt { E s } } \Sigma ) ~ \operatorname { \hat { \varrho } } \operatorname { \hat { M } } \operatorname { M } \operatorname { M } \operatorname { M } \operatorname { M } \dot { \varphi } \dot { \textbf {  { s } } } \dot { \textbf { i } } \dot { \textbf {  { d } } } ~ f } } \\ { { } } & { { } } & { { \lambda \operatorname { \texttt { V i n e s e } } \dot { \hat { \xi } } ~ = ~ ( \setminus \rho _ { * } ~ \mathbb { P } _ { \ Z } ~  ~ \mathbb { P } _ { \widehat { \ Z } } + + \rho _ { 2 } ) ~ = ~ ( + + ) } } \end{array}$ f   
vaoblerProp[strnd]   
vroblerp=elmRepet1der（vnoble-Rp) PODiAS USAR nUO,O NGIORUNION ENLUCAR   
elmmr(epetoer[a]] DE++ e FUNCONABA IGUAC thorr else(x）++r (x:r)   
pentenee   
AsuneelemytdenenelereldldHhel   
nnelBl re(b→（0→[0)→b→b）→[}→b   
evalarVolucisnroPBoo Vatin N   
evoluve=eN=Pva voty X（+/) wherse val Vel not   
cvoarvl=foupop(sval）（r→r) (r→r&& v2)（ee)not (.→r=r)(u） (nr→（v）Y)   
)esten FNNProP→Bool   
etoen FNN=recprop.(const Trve) FOuxOUE Es EsTENOMBE （1--1.1→日&r2） （----→Folse)

![](images/9adbbb7df757f67f2689d354b6a6fe4adc9daa78731759a6c241aeaeb32361d5.jpg)

)demosrer

VtAIH a.VuAiHa.mismEstvuur tu= mmaBseadut

$$
\begin{array} { r l r l } & { \textrm { d } ( \phi _ { 0 } , \phi _ { 1 } , \phi _ { 2 } ) } & { = \phi _ { 0 } ( \phi _ { 2 } , \phi _ { 1 } ) } & { \phi _ { 0 } < \phi _ { 0 } ( \phi _ { 1 } , \phi _ { 2 } ) } \\ & { = } & { \phi _ { 0 } ( \phi _ { 1 } , \phi _ { 2 } ) } & { 0 < \phi _ { 1 } ( \phi _ { 2 } , \phi _ { 1 } ) } \\ & { } & { = \phi _ { 0 } ( \phi _ { 1 } , \phi _ { 2 } ) } & { 0 < \phi _ { 1 } ( \phi _ { 2 } , \phi _ { 1 } ) } \\ & { } & { = \phi _ { 1 } ( \phi _ { 2 } , \phi _ { 1 } ) } \\ & { } & { \phi _ { 0 } ( \phi _ { 2 } , \phi _ { 2 } ) } & { \phi _ { 0 } ( \phi _ { 3 } , \phi _ { 3 } ) } \\ & { } & { \phi _ { 1 } ( \phi _ { 1 } , \phi _ { 2 } ) } & { 0 < \phi _ { 1 } ( \phi _ { 3 } , \phi _ { 3 } ) } \\ & { } & { \phi _ { 2 } ( \phi _ { 1 } , \phi _ { 3 } ) } & { 0 < \phi _ { 1 } ( \phi _ { 2 } , \phi _ { 1 } ) } \\ & { } & { \phi _ { 3 } ( \phi _ { 3 } , \phi _ { 3 } ) } \end{array}
$$

）   
(Dein macoME=misno Estuctura)   
es Hoa u=mismEscructv u（Hoan)n   
Ar utivzoerrasionlidod sobre u(amo). SiuAHa,en u=H ben u=Ben Lr (acAHo.rA(ND),   
coro u= Ho. 5Hosa(Ho）am）=ME（Hoam)（Hojan） 1imol TNe = H子（Hon) 3E07 TML=TmEY P(Hoan) xeP u=Hosa(m）   
Cso u=BinLr   
esHo（BinLr)=ME（DonLr)（Hoan) 3m22 False =not（EsHos（Ho)an）)&& MEL(iz（KOn）)&& mE(der(Hon))   
Como,Pov}EoEshOa（Hosa=tme entena\~not（estea（tojan))=Folse

estar

Fdse

$$
\begin{array}{c} \begin{array} { r l } & { \begin{array} { l l l l l l l } { = } & { \gamma _ { 0 } i s < 0 . } \\ & { } & & { } & & { } \\ { \gamma _ { 0 } s _ { i } ( r _ { i } ) s _ { 0 } \phi } & { \phi ( \phi _ { 0 } ) } & { \gg 0 . } & { u = ( \beta _ { i } r _ { i } ) } & { c _ { \hphantom { ( } r } ) } \end{array} , } \\ & { } & & { } & \\ & { \begin{array} { l l l l l l l } { \phi ( \gamma _ { 0 } , \eta _ { i } ) } & { = } & { ( \gamma _ { 0 } , \eta _ { i } ) \rho ( \mathrm { e } ^ { \mathrm { i } \phi _ { 0 } } \gamma _ { 0 } , r _ { i } ) , } & { e ( \hphantom { ( } \psi _ { 0 } , \eta _ { i } ) , \mathrm { d } / \eta _ { 0 } ) . } \end{array} } \\ & { } & & { } & \\ { , \textit { \texttt { w i n f } } \left( \mathbb { B } _ { 0 } r _ { i } \right) , } & { u = ( \gamma _ { 0 } , \eta _ { i } ) , } & { u = ( \beta _ { i } r _ { i } ) , } & { ( \beta _ { i } r _ { i } ) . } \end{array}  \end{array}
$$

$$
\begin{array} { r l } &  \mathrm { ~ e x c r e ~ \gamma ~ } ( { \mathrm { B o r ~ } \mathord { ( \begin{array} { l } { ( \sqrt { 3 } ) } \end{array} ) } }  \begin{array} { l } { \mathrm { ~ , ~ } } \\ { \mathrm { ~ } } \\ { \mathrm { ~ , ~ } } \\ { \mathrm { ~ } } \\ { \mathrm { ~ , ~ } } \\ { \mathrm { ~ } } \\  \mathrm { ~ \operatorname* { m a x } ~ \mathrm { ~ H e y ~ } \mathord { ( \begin{array} { l l l l l } { ( \sqrt { 3 } ) } & { \mathord { ( \sqrt { 3 } ) } } & { \mathord { ( \epsilon ) } } & { \mathord { ( \epsilon ) } } & { \mathord { ( \epsilon ) } } & { \mathord { ( \epsilon ) } } \end{array} } \mathrm { ~ , ~ } } \\ { \mathrm { ~ a s ~ , ~ } } \\ { \mathrm { ~ C ~ t o ~ } \mathord { ( \begin{array} { l l l l l } { \mathrm { ~ C } } & { \mathrm { ~ B o r e ~ \gamma , ~ } } & { \mathrm { ~ } \mathrm { ~ A } } & { \mathrm { ~ C } } \\ { \mathrm { ~ } } & { \mathrm { ~ H } \mathord \mathord { ( \epsilon ) } } & { \mathrm { ~ , ~ } } \\ { \mathrm { ~ H } \mathord \mathord { ( \epsilon ) } } & { \mathrm { ~ , ~ } } \\ { \mathrm { ~ } } & { \mathrm { ~ H } \mathord \mathord { ( \epsilon ) } } & { \mathrm { ~ , ~ } } \end{array} } ) } \end{array} \end{array}
$$

$$
. \cos \circ \sin \alpha = k \cos \alpha \sin \alpha = - \sqrt { 3 } \sin \alpha = - \sqrt { 3 } \cos \alpha ,
$$

cuHa  
not（EsHosa（Hosam))&&MeiI2f（Hem）&mEd(nFolse（Por{EO1) ?R(nocl)  
:Fise&&=Folse.e  
PpedaFolse=mE(Ho）m)（oon id)Folse=eHja（oond)Fose=False YE2?.

demstrado （Bunid) Po =Hoam/Casou=(BinLr).AnolobAire izfde1'=(enP)not（EsHo（BinL）)&&xtoMEi(F(BonLv)&&MEddes（Dn(r)

AeomobzO noc(cstod（onLr)BrTrue（r{Ea).tue&&MEi(BonLr)&MEddr(Bun(r). Ynor(sPropdbooeo)  
mEiizf（onLr)&&Medder(Oonr)  
Ahoropor{ YPor3D3  
$E ( \mathbf { \Delta } C ) \& \mathbf  \mathcal { K } ( \mathbf { \mathcal { M } } \in \Delta \textbf { d } \textbf { v } ) = m E ( \boldsymbol { \alpha } \boldsymbol { \alpha } \cdot \mathbf { \Delta } C ) ( \mathbf { \beta }$

$$
\begin{array} { r l r l r l } & { \log _ { 2 } } & { \log \rho ( \gamma _ { \mathcal { G } } ^ { 0 } , \ \log e \nu \nu \sigma _ { \mathcal { G } } \ \pm \mu , \ \gamma _ { \mathcal { G } } \ \log i \alpha \phi , \ \gamma _ { \mathcal { G } } ^ { 0 } ) } & & { \forall \gamma _ { \mathcal { G } } ^ { 0 , 0 } } \\ & { \in } & { \mathcal { G } _ { \mathcal { G } } ^ { 0 , 0 } , } & & { \mathcal { G } _ { \mathcal { G } } ^ { 1 , 0 } } \\ & { \lesssim } & { \mathcal { G } _ { \mathcal { G } } ^ { 0 , 0 } , } & & { \mathcal { G } _ { \mathcal { G } } ^ { 1 , 0 } } \\ & { \lesssim } & { \left( \log _ { 1 } \ \underline { { \hat { \omega } } } \right) } & { \ \sqrt { \Delta _ { \mathcal { G } } } , } & & { \mathcal { G } _ { \mathcal { G } } ^ { 1 , 0 } \notin \left( \log i \alpha \phi , \ \hat { \omega } \right) } \\ & { } & { \underset { \mathrm { L S } } { \geq } } & { \big ( \log _ { 1 } \ \underline { { \hat { \omega } } } \big ) } & { \ \mathrm { R e } } & { \mathcal { G } _ { \mathcal { G } } ^ { 1 , 0 } \notin \left( \log i \alpha \phi \right) , } \\ & { } & { \mathrm { L S } _ { \mathcal { G } } ^ { 0 , 1 } } & & { \mathcal { G } _ { \mathcal { G } } ^ { 0 , 2 } \in \mathcal { G } _ { \mathcal { G } } ^ { 1 , 0 } \notin \mathcal { G } _ { \mathcal { G } } ^ { 1 , 0 } \ , } \\ & { \mathrm { Q u t q } _ { \mathcal { G } } } & { \mathrm { S t i g h t } _ { \mathcal { G } } ^ { 0 , 0 } } & & { \big ( \log i \alpha \phi , \ \gamma _ { \mathcal { G } } ^ { 0 , 0 } \big ) \ \stackrel { \mathrm { d u t q a l } } { \leq } \ \mathrm { b y } \ \sqrt { \omega \omega \delta } } \\ & { \underset { \mathrm { L S } } { \geq } } &  \big ( \log i \end{array}
$$

T43   
(poceam dad)   
propie ) （P) MEAA   
MEOL&&MEdr=MELi&&MErd.   
Aneapodemorapvor  nporeisinductiePfi)np(d). CamaAEAHMEE   
PiVEuA) en PmeiL=mELi （MEdr=MErd)   
7lfMEiL&&MEdr=ME∠i&xMrd mEiL=MEiAmEd=MErd   
10cns1derg lo cwel ale PorH.工 √   
v poped   
booleon conouda. wdemserao PrBnid) to u=（bnLr) Br1o+anTO.Vle V+:AIH>.(t). NOMCe Entmceno s ePos YATe yE p ueRs

![](images/1fcee5e757f38ba598a1660263d704c9cd8d682ac61e5bc9950547dd775a3695.jpg)

![](images/08fe58e24999b753c866df41611da02ab3d20ce2cf1de3667eb178032dbe90ce.jpg)

![](images/78bfd777be551f4e6ab3b4bde78d56e4b002338a339f4a5df696a80765b6dada.jpg)

A

②.W（x)→xX△Fx.x x1:in inegdnita  
②.w（x）>x:x├xx xe:inco'gnita

![](images/cbb8a472ddf54337e2b88825c13551a8baa6a560885e1d7fa1d061df8d503af8.jpg)

![](images/643c3acecb42d8a3f9c2969507005847ae453e4363c9d36757153cd50a9a7d2b.jpg)

![](images/ac13c284178b100b86e421ebeda9ecad114c88a9764f0c84e44091be9b099d13.jpg)

$$
\begin{array} { r l r } & { \beta = \pi \beta ( u ) } \\ & { \gamma _ { \mathrm { S } } + \gamma _ { \mathrm { S } } ( \mathbf { \boldsymbol { x } } ) - \gamma _ { \mathrm { S } } } & { \hat { \gamma } ( \mathbf { \boldsymbol { x } } ) } \\ & { \gamma _ { \mathrm { S } } , ~ \mathrm { o r c } ( \mathbf { \boldsymbol { x } } ) \setminus \gamma _ { \mathrm { S } } } \\ & { \boldsymbol { \times } \operatorname { N e } ( \mathbf { \boldsymbol { x } } ) , ~ \mathrm { \boldsymbol { \mathcal { H } } } ( \mathbf { \boldsymbol { x } } ) = \boldsymbol { \mathcal { H } } ( \mathbf { \boldsymbol { \hat { x } } } ) \operatorname { \boldsymbol { \Psi } } ( \mathbf { \boldsymbol { \hat { x } } } ) } \\ & { \frac { N \operatorname { e r } \big ( N - \mathbf { \boldsymbol { \hat { x } } } ( \mathbf { \boldsymbol { x } } ) \big ) \big ( N \big ) \big ( N - \mathbf { \boldsymbol { \hat { x } } } \big ) } { N } } \\ & { \frac { N } { N } \left( \boldsymbol { \hat { x } } \big ( \mathbf { \boldsymbol { x } } \mathrm { N } + \boldsymbol { \hat { x } } ( \mathbf { \boldsymbol { x } } ) \big ) \big ) \sim \boldsymbol { \mathcal { H } } \cdot \big ( N \partial / N - \mathbf { \boldsymbol { \hat { x } } } ( \mathbf { \boldsymbol { \hat { x } } } ) \big ) \right. \mathbf { \boldsymbol { \hat { x } } } } \\ & { \textit { k } \times \big ( N \partial / N \partial / N \big ) , ~ \mathcal { S } \mathrm { o r c } \big ( N } \end{array}
$$

![](images/e8baa254769bda4cf92360fd5838c29776beafcd562ac05c85ac717250069510.jpg)

![](images/11b9b8b4d4309d74c212182b8bd4915a1bfd41d81c314f8479217ed0a3e02bd6.jpg)

$$
\begin{array} { r l } & { \bigoplus } \\ & { \bigoplus \quad \operatorname { w \prime } ( x ) \to x : \times { \mathfrak { a } } \vdash x : \times { \mathfrak { a } } . } \\ & { \bigoplus } \\ & { \underset { \underset { \mathrm { \normalfont \sf \sf \sf \{ S } ^ { + } \sim } } { \iint } } \omega ( \boldsymbol { x } ) \to x : \times { \mathfrak { a } } \vdash \mathbb { M } x : \times { \mathfrak { a } } .  \\ & { \underset { \mathrm { \normalfont \sf \{ S \} \sim } } { \iint } ( \mathbb { \hat { x } } \cdot \mathbb { x } \cdot \alpha ) \quad \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\omega \vdash ( \mathbb { \wedge } x : \mathbb { \times } \times \times ) : \mathbb { \times A } . } \end{array}
$$

![](images/1423d8a4c000326941d9dc25eb83482d213bb8935a98e242fb77dff21bf190d9.jpg)

![](images/e3dc3b855479ed51c7ee69c31fd5f0240b0d888712544e8a4b4e900202d54902.jpg)

![](images/fc4ebea5d154fd7280802391b6c1b62adb3227db16153e416132b72e8e182c97.jpg)

![](images/db2aac71765189e8e8451a7a5dd2492cf200db02a093b8d48bd7511b143cd383.jpg)

$$
\begin{array} { r c l } { { \displaystyle ( \widehat { \Theta } \cdot \mathrm {  ~ \scriptstyle { \scriptstyle ~ w } ( \alpha ) ~ } \backsim \gamma \cdot \mathrm {  ~ \scriptstyle { \scriptstyle ~ x } _ \alpha \cdot ~ } \times \lambda \mathrm {  ~ \scriptstyle { \scriptstyle ~ x } _ \beta \cdot ~ } } }  & { { } } & { { } } \\ { { } } & { { } } & { { } } \\ { { \displaystyle ( \widehat { \Theta } \cdot \mathrm {  ~ \scriptstyle { \scriptstyle ~ w } ( \alpha ) ~ } \cdots \mathrm {  ~ \scriptstyle { \scriptstyle ~ x } _ \alpha \cdot ~ } \times \iota _ { 1 } \mathrm {  ~ \scriptstyle { \scriptstyle ~ c } _ \alpha \cdot ~ } \times \lambda \mathrm {  ~ \scriptstyle { \beta } ~ } } } \\ { { } } & { { } } & { { } } \\ { { \displaystyle ( \widehat { \Theta } \cdot \mathrm {  ~ \scriptstyle { \scriptstyle ~ w } ( \bar { z } \mathrm {  ~ \scriptstyle { \scriptstyle ~ z } ^ \circ ~ } / \cdots \mathrm {  ~ \scriptstyle { \alpha } ~ } ) ~ } \phi _ { I } \mathrm {  ~ \scriptstyle { \scriptstyle ~ z } \in \mathcal { S } ^ \prime \mathrm {  ~ \scriptstyle { \beta } ~ } } \mathrm {  ~ \scriptstyle { \beta } \partial ~ } \tau _ { \ast } } } \\ { { } } & { { } } & { { } } \\ { { \displaystyle ( \widehat { \Theta } \cdot \mathrm {  ~ \scriptstyle { \scriptstyle ~ \mathscr { ~ \beta } ~ } } } } & { { } } & { { } } \end{array}
$$

$$
\begin{array} { l l } { \log x : \log _ { 1 } + x _ { 2 } \times \log _ { 2 } } & { \leq \log _ { 1 } + x _ { 1 } \times \log _ { 2 } \to x } \\ { \log _ { 1 } \to \log _ { 2 } \operatorname* { d i m } _ { 2 \leq 2 } \operatorname* { d i m } _ { 2 } x } & { = 1 \times \log _ { 1 } = N \partial _ { 2 } < 0 } \\ { ( \log 2 e \leq 0 ) \to 7 } & { \operatorname* { d i m } _ { 2 \leq 1 } \log _ { 2 } \to \times 6 + x _ { 1 } \times 2 \operatorname* { d i m } _ { 2 } \times x _ { 4 } } \end{array}
$$

$\begin{array} { c c } { { } } & { { 5 = \longleftrightarrow \longleftrightarrow \longleftrightarrow } } \\ { { } } & { { } } \\   \begin{array} { c c c } { { \begin{array} { r c c c } { { \scriptstyle ( \bar { \lambda } ) \longleftrightarrow ( \kappa \times \lambda ) \to 0 } & { { \scriptstyle \lambda : \wedge \partial \sigma } \ \to | \ \Gamma ^ { 2 } \scriptstyle \Theta \otimes \ ( { \bf \kappa } ) \ \to \ \langle \Delta _ { \mathrm { d o s } } \rangle \ } } & { { \scriptstyle \displaystyle \bigwedge \displaystyle \} \mathrm { i s ~ o t ~ } \ \frac { \lambda ^ { 2 } } { c } } \ } \\ { { \scriptstyle ( \mathrm { v } \times \lambda ) \to \ \infty } } & { { \scriptstyle \times \cdot \lambda \ \sum _ { k } \ \vdash \ \ \lambda \cdot \times \sum } } \end{array} } } \\  { \begin{array} { r c c } { { \begin{array} { r c c c } { { \scriptstyle \mathcal { X } ( { \bf \kappa } ) \to 0 } & { { \scriptstyle \chi : \wedge \partial \sigma } \to \infty \ \times \delta \ \ \in \ \ \mathcal { X } \ \ \times \ \ \mathcal { X } \ \ \ \mathcal { X } \ \ \ \times \ \mathcal { \epsilon } } } & { { \scriptstyle \times \ \sum } } \\ { { \scriptstyle \times \ \sqrt { \ \ \mathcal { X } ( { \bf \kappa } ) \to \ \ \chi \ \times \ \mathcal { X } \ \ } } } & { { \scriptstyle \times \ \lambda \ \epsilon } } & { { \scriptstyle \times \ } } \end{array} } } \\ { { \begin{array} { r c c } { { \begin{array} { r c c c } { { \begin{array} { r c c c } { { \forall \ \ \mathcal { X } \not \ \ \ \log ( { \bf \kappa } ) \ \ \ \ \epsilon \ \ \exp \ \ \Lambda } } & { { \ x } } & { { \scriptstyle \mathcal { X } \ } \ \ \epsilon \mathcal { X } \ \ \leq \ \ \mathcal { X } \ \ \ \leq \ \ \mathcal { X } \ } } \\ { { \scriptstyle \big \ \Theta } } & { { \scriptstyle \ddots \ \sqrt { \ \mathcal { Y } } } } & { { \scriptstyle \otimes } } \end{array} } } \end{array} } } \end{array} } } &   \begin{array} { r c c }   \begin{array} { r c c } { { \lambda } } &   \ \end{array} \end{array} \end{array} \end{array} \end{array}$ u( 01，x=x x=NC→X. Nat-xo follPrelonPen+rors (morelli-mtari)t $\begin{array} { r l } & { \begin{array} { r l } & { \mathrm { i v e n } ^ { \mathrm { i } } \eta ^ { \mathrm { i } } \dag \Pi _ { 1 } - \mathrm { c } ^ { \mathrm { i } } \dag \Pi _ { 1 } \dag \Delta _ { 1 } } \\ { \mathrm { i } } & { : \mathrm { B o } ^ { \mathrm { i } } \eta \dag \hat { H } \dag \hat { \omega } _ { 0 } } \\ { \mathrm { e } ^ { \mathrm { i } } \dag \Pi _ { 2 } ^ { \mathrm { i } } \dag \hat { \omega } _ { 0 } ( \frac { 1 } { \omega _ { 0 } } \frac { \Gamma } { \omega _ { 1 } } ( \begin{array} { l l l l l } & & & { \mathrm { i } } \\ & { \mathrm { A s } } & { \frac { \eta } { \omega _ { 1 } } } & & { \mathrm { i } \omega _ { 0 } } & { \mathrm { x } _ { 3 } } \end{array} ) ^ { \frac { \alpha } { 2 } }  } \end{array} } \\ &  \begin{array} { r l } & { \mathrm { e } ^ { \mathrm { i } } \dag \Pi _ { 3 } } & & \\ & {  \mathrm { e } ^ { \mathrm { i } } \dag \Pi _ { 4 } ^ { \mathrm { i } } \dag \Pi _ { 4 } ^ { \mathrm { i } }  ( \frac { 1 } { \omega _ { 0 } } \frac { \Gamma } { \omega _ { 1 } } ) \dag \Delta _ { 3 } ( \frac { 1 } { \omega _ { 0 } } \frac { \Gamma } { \omega _ { 1 } } ) \dag \Delta _ { 4 } ^ { \mathrm { i } } ( \frac { 1 } { \omega _ { 0 } } \frac { \Gamma } { \omega _ { 1 } } ) \dag \Delta _ { 1 } ^ { \mathrm { i } } ( \frac { 1 } { \omega _ { 0 } } \frac { \Gamma } { \omega _ { 1 } } ) \dag \Delta _ { 1 } ^ { \mathrm { i } } ( \frac { 1 } { \omega _ { 0 } } \frac { \Gamma } { \omega _ { 1 } } ) \dag } \\ &   \mathrm { i } \frac { \mathrm { d } \Gamma } { \omega _ { 0 } } ( \frac  1  \end{array} \end{array}$

3))ebrdd Wentin Fahousk N.O.=84.

$\frac { H M : A H ( \pi ) } { H \cos e _ { n } M o f } + H _ { 2 } M : \sigma \cdots \cos ( n _ { 1 } i ) B i : A l ( \pi ) , d : A l$ cosecesena csemog

ren →Mlve

ho⊥Hoa（m)Hoa（m)  
Bon²Bin（mM)→Bcn（m;，n2)  
5Bn27Bin（v，M)→Bin（v,M）.  
350e3 $\begin{array} { r l } & { \quad \cos \theta \leq \mathrm { ~ \phi ~ } \operatorname { \mathbb { H } } _ { \phi \leq 0 } \mathrm { ~ } x  \mathrm { ~ \mathbb { N } ~ } _ { l } \mathrm { ~ } ; \quad \mathbb { E } \sin ( \xi _ { l , \phi } )  } \\ & {  \mathrm { ~ \phi ~ } \otimes e \mathrm { ~ \phi ~ } _ { \mathrm { M } } \mathrm { ~ } ^ { \mathrm { i } } \mathrm { ~ } \oplus \mathrm { ~ \phi ~ } \mathrm { ~ } \mathrm { ~ \mathbb { H } } _ { \phi \leq \mathrm { ~ \phi ~ } } \times  \mathrm { ~ \phi ~ } \operatorname { \mathbb { W } } _ { u } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } \mathrm { ~ } }  \\ &  ( \mathrm \end{array}$ M2)9M2.Por cesesltongo te vedcir  
（xn:NatHosa(n))succ(zerg)  
CoseHosa（svc(2））ofHoxnc(（pne)）

volonrinalvausK

![](images/267020e37c90af12d2261b179e4c6cd6ace4b4979425fe48d593c023fe51328f.jpg)