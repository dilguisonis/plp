PLP-Primer Parcial-2do cuatrimestre de 2024   

<table><tr><td>#Orden</td><td>Libreta</td><td>Apellido y Nombre</td><td></td><td></td><td></td><td>Ej1Ej2 Ej3Nota Final</td></tr><tr><td></td><td></td><td></td><td>EEEA</td><td></td><td></td><td></td></tr></table>

LFvrelenleekamen

Eteexamenseapruebaobteniendoalmenosdosejerciciosbien(B)yunoregular(R)，ysepromocionaconalmenosdos ejerciciosmuybien(MB)yunobien(B).Esposibleobtenerunaaprobacincondicionalconunjerciciomuybien(M)，nobien (B)yunoinsuficiente(I)peroabiendoentregadalgoquecontribuyalsolucindelejereicioLsnotasparaadaejecii son:-IEregrderiepsoeelidydededl ynumerarlas.SepuedeutilizartodolodfinidoenlaspracticasytodoloquesedioenclasecolocandoreferencisclarasEl ordendelosejerciciosesarbitrario.Recomendamoslerelparcialcompletoantesdeempezararesoverlo

# Ejercicio1-Programacion funcional

Aclaracion:eneste ejercicio no esta permitido utilizar recursion explicita,a menos que se indique lo contrario.

El siguiente tipo de datos sirve para representarun bufer con historia que permite escribir o leer en cualquiera de sus posiciones (las posiciones tienen tipo Int).El tipo del bufer es parametricoen el tipode los contenidos que se pueden guardar enel.Siseeseribedos vecesenlamisma posicion,el nuevo contenido pisaalanterior(porsimplicidad).Laleturaeliminaelcontenidoleido1

ata Buffer a $=$ Empty 丨 Write Int a (Buffer a) | Read Int (Buffer a)

Definimos el siguientebufferpara los ejemplos:

buf=Write1‘a''\$Write2‘b'\$ Write1‘c"\$ Empty a) Darel tipoydefinir la funcion foldBuffer y recBuffer,que implementan respectivamente loses quemas de recursion estructuraly primitiva para el tipo Buffer a.Soloen este inciso se permiteusar recursion explicita.

b)Definir la funcion posicionesOcupadas::Buffer a ->[Int],que lista las pesiciones ocupadas eu un buffer (sin posiciones repetidas).

Por ejemplo: posicionesOcupadas buf $ [ 1$ ，2]

c)Definir lafuncioncontenido：Int-> Buffer a -> Maybe aquedevuelva elcontenido de ua po sicionenunbersihyaloenellayothingencasootrio

Por ejemplo: contenido 1 buf Just $( ) _ { a } ( )$ contenido （-2） buf Nothing. contenido 1 (Read 1 buf) Nothing.

d)Definir la funcion puedeCompletarLecturas:Buffer a-> Boolque indiquesi todas las lecturas puedencompleaseeianteeseciiadavqueentlerosiiono escrito en ella).

Por ejemplo:

puedeCompletarLecturas (Read 1 Empty) $\tilde { \bf \Phi }$ False, puedeCompletarLecturas (Read 1 buf) True. puedeCompletarLecturas（Read 1 \$Read 1buf）\~False e)Definir lafunciondesacer:Bufera->Int->Bufferaque dadosunbfferyunro natural n (es decir,un Int que por contexto deuso no es negativo),deshaga las tltimas n operaciones del buffersacando los n constructores mas externos para obtener un bufer como el original antes de realizar dichas operaciones.Si se realizaron menos den operaciones,el resultado debe quedar vacio

Porejemplo:deshacer2buf\~ Write1‘c'' Empty.

Pista:aprovechar la currficacion yutilizar evaluacionparcial.

Ejercicio 2-Demostracion de propiedades

Considerar las siguientes definiciones2 data ABa=Nil | Bin (ABa)a （AB a)

const::a->b->a

C}const=（\x->\y->x)

{ZO} zipAB Nil $\mathbf { \equiv }$ const Nil {Z1}zipAB（Binird）=\t->casetof a) Demostrar la siguiente propiedad:

$$
\forall \mathrm { ~ t : : A B ~ \ a ~ . ~ } \forall \mathrm { ~ u : : A B ~ \ a ~ , ~ a l t u r a ~ t \geq a l t u r a ~ ( z i p A B ~ t ~ u ) }
$$

Serecomienda hacer inducion enunarbol,utilizandoextensionalidad para elotro cuando sea necesario.Sepermitedefinirmacros (i.e.poner nombresaexpresioneslargas parano tenerquerepetirlas).

Noes obligatorio escribir los Vcorrespondientes en cada paso,pero es importante recordar que estan presentes.Recordar tambien que $\log = \mathrm { d e }$ las definiciones pueden leerse en ambos sentidos

Seconsiderandemostradas todaslaspropiedadesconocidas sobreenterosy booleanosasi como tambien

b)Demostrarelsiguienteteoremausandodeduccionatural,sinutilizarprincipioselsios:

$$
( ( \rho \land \sigma ) \lor ( \rho \land \tau ) ) \Rightarrow ( \sigma \land \rho ) \lor \tau
$$

Ejercicio 3-Calculo Lambda Tipado

Sedesea extender el calculo lambda simplemente tipado para modelar arboles ternarios.Para eso se extienden los tipos y expresiones de la siguiente manera:

T=.·|AT(T) $M : = : \cdots | \ \operatorname { T M 1 } _ { \tau } \mid \operatorname { T e r n } ( M , M , M , M ) \mid \ \mathsf { f o l d A T } \ M \triangleright \ \mathsf { T N i l } \ \sim : M ; \ \mathsf { T e r n } ( x , r \dot { a } , r m , r d ) \sim M .$

· $\mathtt { A T } ( \tau )$ es el tipodelosarboles ternariosconnodosde tipo $\boldsymbol { \tau }$

TNil,esunArbol ternariovacioqueadmite valores detipo $\boldsymbol { \cdot }$ · $\operatorname { T e r n } ( M _ { 1 } , M _ { 2 } , M _ { 3 } , M _ { 4 } )$ esunrbolternarioconraiz $M _ { 1 }$ ehijos $M _ { 2 }$ M3yM4.

foldATMlM2;Tern(xideselemadeecursiestructuralaaes ternariosdondelasribles,imydselganalazylosresuladosdelarecuriosobe loshijos izquierdomedioyderechoelbol $M _ { 1 }$ respectivamente.

a) Introducir las reglas de tipado para la extensionpropuesta.

b)Definirelconjuntodevaloesyasuevasreglasdereduinenpas c) Mostrar paso por paso c6mo reduce la expresion:

At:AT(Nat)fotil\~Fse;Ter(imrdZeroPed)rn(1latlt d)DetinircomomacrolafuncionmapATa,,que toma unAT(g)yuna funciondeg enT,yaplica dicha funcion a todos los elementos del Arbol.

Pral PLP-2c2oRy

dbBufF=Empty|Wrire IncBufFuo）|Red 工nt(BiffU  
d)[olB(erb-（nc-ob）（c-6-Db)→Bfcr=-DbFoldBufuCEmpTgcWrneCRcodC=CsctoFEmpty-cEmmptyWrte△×b-cW²tcn×（re6）Readb→cReod（ecb）Whucree=FodBurfoCEmpty cWritccReao

ecBff:6→（LC>-Dbuf-Db→6)-（t-Dffra-b→6）→Bufu→b rcBuFfcEmptyCWrirecRd=Coretof

6FosicuvocuPad5Buffe-[Int] Fa5iunoOcupdy=foldBuff[(\n-rec-onian5n)rec) (nrec-DF1tvrec(le-De≠n）

cConteido.Inc-DBurfu→nybe Contenidoe=faldsuffoNoChingnxrec-iFn==eThnJostxesrrec) nrec-0ifn=eThNningelsc rcc)

d)PuedeCamplet>lectur:Buffur-D BolPuedeCemplesrcacturs=recBuff-Tue(rec-Drec)nbrec-D（elemn（Posicnuocopdsb)Be)desHctDUfr-Dtnc-DBFF dsurec（e-1))deHcu=recBofFu（cnxTmptg）Oxbrec-D-Dife=oThu（wrrx6）（nbrec-De-）iFe=oTn（co n6）tssre(e-1）

![](images/09f1426b81d0518d0792858f00f6345785a080a1cab17176e844fd9b38482fa6.jpg)

Csobse.P(Ni1)

tUrN;12ətur（2eADN) AO >>Ituh（2PAB Ni)a) 0alturs（totNi)u） (Corsr 。≥ltunNil HADy D

Demostrodo P(Nil

1+mx（sItuni）（oltund)≥>ltors（²iPAD（Bin55d）Nil) S2+p 1+mox（Tun=）(>itund）≥əltur（Nil） EAo' 1+m>x（sup）（altnd）≥0

Por3leno，（2/turc）2oy（sltund）≥0，Luego，mxblturi)（1tund)2O.εTenco：

1+mx（>lturs）（2tud）≥↑≥0

1+mx（slanc)（olTund）≥alur（2rAB（Binird）（Bin×yz)） ？<m×（2toni）(Tund）2>（turs（2pW@Bin（EPAB×）（r,y）（2iPADd2）） 2+mx2lturi）（sitund）>smy1+mx（1tun（2ipAD×））（situr（2pADd2) mx△[Turi）（2ltund）≥mx（>ltun/²iPABix)）（>ror（2PADd2)

Serro1mxzcsos.mox2lruh=1lrursd）={tun0m）(slturc）(sTursd）=△tordCSoMx(sltur)(stord=altorsc.GTancv，atursi>alfundPmakys >lturC≥mx（21tur（2PABix)）（1tur[2PADd21）

PorHtend，2(tuti>2tu（ePAx)，PorHIltudlur2AB) Lcgo，/ton>21turd2əur（²PAD）.Lego

21tur(≥mx（2ltuh（2pADcx））（alfur>[2PA0d2)

Comoxti)otund=（fud.CTonce△ltudatur (maxy turd3mx（s（tar（2PAx）（stu2iPADd2)

PorHJdstorod32lfuc2PADdePorM+acuni22Tun2PABCx) Lueg,dlturod2s1or2>ltu（2.PADx）Lzg tond2nmx（o1tu，2PA(x））a1ur2iPADd2)√

Demostvd Por

-oxP,PnQ-PnQ PAQ-PQNez Ae1r,PQHQ r,PnQIP C,P△t-PAT厂,P△Q卜Q△PNr-(P△Q}（PA+） rPnQ-（QNP）vT 、PAT├QP)vT-Ver=（PQ）（p△t）卜-（QP）TF（Pna）u（PA+））-D（aAP）vT

3↑=At（)  
M=-.1tNi丨n(n.n，n，n）|(uAt n>tNi）mM；ton(.r.r,ro）\~DM) -AXAT r-M:r-N:ArrrO:△)r-PA(T)P-TNil:At(r) PHtun(m，N,O，m）：A+(T)F-MATN)CI-N:O ，x：r,ro：σ，rm:σ，rd:σ-O：σ troldr├foldAt MOTNi）mbN;Ter（xrs,ra，d）noO：6)V:=..N1er(vNy)

tern(M,N,O，P）-0tern(M',No，p) e-ten Tern(v，M，NO)tern（V,n'N,O） e-corn Tern(v，V，nN)-tUn(NVnNN) e-tUn3 Tern(VV,v,n）tUn(NN,V,n') e-tutny folATM△↑Nn\~DN;TUn（x，ro,rm,a\~>O →FdAtM‘>tN;}mN;tun|xrormrd）

(oUA+tNi\~柳tN；]→n，TUn（x,ro，Ym,rd）mNM e-CFN   
FoUAtTen（vVUy)TN丨△DM;tUn(XForan,d）mDN e-DFT DN{×=V,5=（odATVN1\~>M;tUn（x，rsrm,rdDN rm:=（olATVDtN)\~M;TUn（xVrm，d）△DN rd:=[oAtVuDtNiMDM;tn（x，Hmm△N3

(A(N)tTNe））TnBDouATn（2,Ni,tNr,TN(t）△tN{mfUTen（x，c,m，d}ms(md（x)）efs²o（r（)=is2o（Pred（su(2））Dis²eo2o）e[oUAtCDTNN\~DTNpTe(xrc,tnd）mD↑Un(Fx，ron，d）