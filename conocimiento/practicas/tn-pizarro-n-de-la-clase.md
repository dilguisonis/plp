foldMelodia::b->（Tono->b)\~>（b→b-b>-→> （{b]->b)->Melodia->b   
FoldMelodia cSilencio cNota cSecuencia cPralelo m= casemf Silencio -cSilencio NotatcNotat Secuencia m1 m2→ cSecuencia (rec m1）Grec m2) Parolelo ms-> cPoralelo (map rec ms) where rec = FoldMelodia cSilencio cNota cSecuencia cPralelo

duracionTotal=foldMelodia 1 (const1) （+） maximum

truncar Silencio Silencio truncar Silencio 3 \~> Silencio truncar (Secuencia (Nota 15Silencio truncar (Secuencia (Secuencia (Nota 1) Silencio) (Secuencia Silencio Sileucio)) 3 Secuencid (Secuencia (Nta 1) Silencio) Silencio

![](images/cc14fd973dee745d291801f7828ab8915804e330f54f2dc44c58c9002813d798.jpg)

![](images/d99aabca2be539fd03cfaba5c23c8fc626d63e453a09909470e06a05fd092ed8.jpg)

m

runcar↑foldMelodia b = Integer >Melodia (const Silencio) (i→Silencio) (t（→Notat) <f1f2n→ Letm1=f1n

duracionRestante=nduraonotalm1 in ifduracionRestante > then Secuencia m (F2 dracionRestante) else m1） (fsn>Paou(map（\$n)fs）） (rec > rec ) Paralel Lrec n | rec e f J

recMelodia:b->(Tono>b>->(Melodia-Melodia-b>b->b) →([Melodia了->[bJ-b)->Melodia->b

recMelodia cSilencio cNda cSecuencia cPradelo m= case m of Silencio → cSilenco Not n ->cNota n Secuonci> m1 m2 -7 cSecuencia m1 m2 (rec m1） lrec m2) Paralelo ms→ cParalelo ms (map rec ms) where rec = recMelodia cSilencio cNda cSecuencia cParale

P(t）:=Vu:ABα.twt>Olbyo （SiABtx）  
Cme boeP(Ni)  
H：ABaNe≥OluAN从  
tNf( Ne03 N2A0≥x→y→x）NA）EO>（N&） Sx270 AoTwe   
Cemuctino  
H:PC=ARaY  
HP(a）VnABa td>...  
ltv(Bmd)((Bid））  
1+mox（4 i）（ad）> A  
1+mx（o4i）（abd）≥otuaC(t→et²N→ Binird B (moa0))△Bn(3B1Ce果N0N0

Pemode grooue

M=N&Q   
irdgeM=Binird   
Co=Ne   
+mx (ob）d）≥tC Ce Nilo N Bm...   
1+ms)）≥SE3 VO A   
A13 p LEmA M-nm

![](images/6aecad12660810e00f17e2c14cecf6e400367c1342e51b4a231d23728dc9f813.jpg)

m（4）（d）≥0 en+mx（+）(d）≥O

C=BmNd  
1+mox（oi）-d）>(CeBNdoNNalBniNd'→B   
1+ mox(+）d）liewa（CASEBm(3iAB）)Bdd1)  
）  
+mx (）（） AB  
/+mox（+（3bAD.0）

（dPAH：o>O+iAB+b>o(sABdd）

mxx3>maxya  
Entenmx（oti）（b）>mxl（3AB1S）  
/+mmsx ZA+mox..

# PLP - Primer Parcial - ${ \bf 1 } ^ { \bf { e r } }$ cuatrimestre de 2025

# Ejercicio 1 - Calculo Lambda Tipado

Se desea extender el calculo lambda simplemente tipado para modelar listas ordenadas.Una lista ordenada se construye de manera similar auna lista comun, pero sus observadores se comportan de manera diferente: la cabeza de la lista es siempre el minimo elemento,y su cola es el resto de los elementos.

Estas listas tienen como precondicion que el tipo de sus elementos cuente con una operación de comparacion $<$ (no es necesario escribir nada al respecto, suponemos que vale).

Se extienden los tipos y expresiones de la siguiente manera:

T =·.·|[]< M:= ...I[]<|M :< M| head<(M) | tail<(M)

donde:

■ $[ \tau ] ^ { < }$ es el tipo de las listas ordenadas con elementos de tipo $\tau$

$[ \mathbf { \nabla } ] _ { \tau } ^ { < }$ es una lista ordenada vacia que admite valores de tipo $\tau$

$M _ { 1 } : : \ < \ M _ { 2 }$ es la lista resultante de agregar el elemento $M _ { 1 }$ a la lista $M _ { 2 } { } ^ { 1 }$

·head $^ { < } ( M )$ denota el minimo elemento de la lista $M$

·tail $^ { < } ( M )$ es la lista ordenada con todos los elementos de $M$ excepto el minimo (si $M$ tiene más de una aparición de su minimo elemento,se elimina una de ellas).

a) Introducir las reglas de tipado para la extension propuesta.

b)Definir el conjunto de valores y las nuevas reglas de reduccion en un paso. Tener en cuenta que una lista vacia no tiene cabeza ni cola.

Pista: puede ser necesario mirar más de un nivel de un término para saber a qué reduce.

c) Mostrar paso por paso cómo reduce la expresión:

$\mathtt { h e a d } ^ { < } ( ( \lambda x : \mathsf { N a t . 2 } ) z \mathsf { e r o } : : ^ { < } \underline { { 1 } } : : ^ { < } \left[ \begin{array} { l } { \right] _ { \mathsf { N a t } } ^ { < } } \end{array}$

Se pueden considerar dadas las siguientes reglas:

$$
\frac { M _ { 1 } \to M ^ { \prime } } { M _ { 1 } < M _ { 2 } \to M ^ { \prime } < M _ { 2 } } ( \mathrm { E } - < _ { 1 } ) \quad \frac { M _ { 2 } \to M ^ { \prime } } { V < M _ { 2 } \to V < M ^ { \prime } } ( \mathrm { E } - < _ { 2 } )
$$

$$
\overline { { V < z \mathrm { e r o }  \mathsf { F a l s e } ^ { \circ } } } ^ { ( \mathrm { E } - < _ { F } ) } \quad \overline { { z \mathrm { e r o } < \mathsf { S u c c } ( V )  \mathsf { T r u e } ^ { \circ } } } ^ { ( \mathrm { E } - < _ { T } ) }
$$

$$
\overline { { \mathsf { S u c c } ( V _ { 1 } ) < \mathsf { S u c c } ( V _ { 2 } ) \to V _ { 1 } < V _ { 2 } } }  ^ { \big ( \mathrm { E } - < _ { S } \big ) }
$$

2 M=IE IM:<M丨 nead<(M) | tail<(M)

Reglas de tipado

T-r1 HM:rN:LtI T< HCIE:C< ├M:<N：[c]<

M:C< T-h M:[27< T-t ├ head<(M): tail<(m）:[27<

Conjunto de valores VIV<Y

Reglas de reduccion

![](images/f590e0fd5e97ee660ee853a0a32854f228e2ee61da0c4ca314c4f9589e80b561.jpg)

E-h1

nead<(Y<V<V） →if Y<V then head<(Vi : <V） else head<(V ;< V)

E-hz

![](images/cefc235665bee53d294bb3917d13ab4964fe6da6d8fb75bd91f5e830cb0d6d15.jpg)

tail<（Y<V<V）→iFV<head<（<V)E-t2then Y<Velse Vi =< tail (V2:<V）

SiM→：

MN → M'N Y:<M 一 V:M E2 nead<(m)→head<(M') +ail<(m）→tail<M'） E4

head<（(xx:Na+.2)2ero:<1:< [INa+）  
EE1B→head（<⊥:[Nnt+）  
E-h2if< = suc(suc(zero)）then head（2 :<INa+） 1= Suc(2ero)else head<(1::<CNa+)  
E-iFE<s→if1<2erOthen head（2 :INa+）else head<(<ENa+)  
EiFE-<→ if falsethen head<（2 :<CINa+）else head<(1:<ENa+)  
E-if-False →head<(1 :<{Na+）  
E-h1