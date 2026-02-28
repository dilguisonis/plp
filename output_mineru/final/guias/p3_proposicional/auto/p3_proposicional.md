# Práctica N $\mathrm { \bf O }$ 3 - Demostración en Lógica Proposicional

Los ejercicios marcados con el símbolo $\star$ constituyen un subconjunto mínimo de ejercitación. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

# Semántica

# Ejercicio 1

Determinar el valor de verdad de las siguientes proposiciones (fórmulas):

i. $( \neg P \lor Q )$   
ii. $( P \lor ( S \land T ) \lor Q )$   
iii. $\neg ( Q \lor S )$   
iv. $( \neg P \lor S ) \Leftrightarrow ( \neg P \land \neg S )$   
v. ((P ∨ S) ∧ (T ∨ Q))   
vi. (((P ∨ S) ∧ (T ∨ Q)) ⇔ (P ∨ (S ∧ T ) ∨ Q))   
vii. (¬Q ∧ ¬S)

cuando el valor de verdad de $P$ y $Q$ es $\vee$ , mientras que el de $S$ y $T$ es $\sf { F }$ .

# Ejercicio 2

Mostrar que cualquier fórmula de la lógica proposicional que utilice los conectivos $\neg$ (negación), $\wedge$ (conjunción), ∨ (disyunción), $\Rightarrow$ (implicación) puede reescribirse a otra fórmula equivalente que usa sólo los conectivos ¬ y ∨. Sugerencia: hacer inducción en la estructura de la fórmula.

# Ejercicio 3

Sean $\tau$ $\cdot , \sigma , \rho \mathrm { ~ y ~ } \zeta$ proposiciones tales que $\tau \implies \sigma$ es tautología y $\rho \Rightarrow \zeta$ es contradicción. Determinar si las siguientes proposiciones son tautologías, contradicciones o contingencias y demostrarlo:

i. $( \tau \Rightarrow \sigma ) \lor ( \rho \Rightarrow \zeta )$   
ii. $( \tau \Rightarrow \rho ) \lor ( \sigma \Rightarrow \zeta )$   
iii. $( \rho \Rightarrow \sigma ) \lor ( \zeta \Rightarrow \sigma )$

# Ejercicio 4

Probar que cualquier fórmula que sea una tautología contiene un ¬ o una ⇒.

# Deducción natural

# Ejercicio $\textbf { 5 } \star$

Demostrar en deducción natural que las siguientes fórmulas son teoremas sin usar principios de razonamiento clásicos salvo que se indique lo contrario. Recordemos que una fórmula $\sigma$ es un teorema si y sólo si vale $\vdash \sigma$ :

i. Modus ponens relativizado: $( \rho \Rightarrow \sigma \Rightarrow \tau ) \Rightarrow ( \rho \Rightarrow \sigma ) \Rightarrow \rho \Rightarrow \tau$ ii. Reducción al absurdo: $( \rho \Rightarrow \bot ) \Rightarrow \neg \rho$ iii. Introducción de la doble negación: $\rho \Rightarrow \neg \neg \rho$ iv. Eliminación de la triple negación: $\neg \neg \neg \rho \Rightarrow \neg \rho$ v. Contraposición: $( \rho \Rightarrow \sigma ) \Rightarrow ( \neg \sigma \Rightarrow \neg \rho )$ vi. Adjunción: $( ( \rho \land \sigma ) \Rightarrow \tau ) \Leftrightarrow ( \rho \Rightarrow \sigma \Rightarrow \tau )$

vii. de Morgan (I): $\neg ( \rho \lor \sigma ) \Leftrightarrow ( \neg \rho \land \neg \sigma )$   
viii. de Morgan (II): $\neg ( \rho \land \sigma ) \Leftrightarrow ( \neg \rho \lor \neg \sigma )$ . Para la dirección $\Rightarrow { \mathrm { e s } }$ necesario usar principios de razonamiento clásicos.   
ix. Conmutatividad $( \wedge )$ $\setminus ) \colon ( \rho \wedge \sigma ) \Rightarrow ( \sigma \wedge \rho )$ x. Asociatividad (∧ $\setminus ( ( \rho \land \sigma ) \land \tau ) \Leftrightarrow ( \rho \land ( \sigma \land \tau ) )$   
xi. Conmutatividad (∨): $( \rho \lor \sigma ) \Rightarrow ( \sigma \lor \rho )$   
xii. Asociatividad (∨): $( ( \rho \lor \sigma ) \lor \tau ) \Leftrightarrow ( \rho \lor ( \sigma \lor \tau ) )$

¾Encuentra alguna relación entre teoremas de adjunción, asociatividad y conmutatividad con algunas de las propiedades demostradas en la práctica 2?

# Ejercicio 6 ⋆

Demostrar en deducción natural que vale $\vdash \sigma$ para cada una de las siguientes fórmulas. Para estas fórmulas es imprescindible usar lógica clásica:

i. Absurdo clásico: $( \lnot \tau \Rightarrow \bot ) \Rightarrow \tau$ ii. Ley de Peirce: $( ( \tau \Rightarrow \rho ) \Rightarrow \tau ) \Rightarrow \tau$ iii. Tercero excluido: $\tau \lor \lnot \tau$ iv. Consecuencia milagrosa: $( \lnot \tau \Rightarrow \tau ) \Rightarrow \tau$ v. Contraposición clásica: $( \neg \rho \Rightarrow \neg \tau ) \Rightarrow ( \tau \Rightarrow \rho )$ vi. Análisis de casos: $( \tau \Rightarrow \rho ) \Rightarrow ( \neg \tau \Rightarrow \rho ) \Rightarrow \rho$ vii. Implicación vs. disyunción: $( \tau \Rightarrow \rho ) \Leftrightarrow ( \neg \tau \lor \rho )$

# Ejercicio 7

Probar las siguientes propiedades:

i. Debilitamiento. Si $\Gamma \vdash \sigma$ es válido entonces $\Gamma , \tau \vdash \sigma$ es válido. Sugerencia: utilizar inducción sobre el tamaño de la derivación. ii. Regla de corte. Si $\Gamma , \tau \vdash \sigma$ es válido y $\Gamma \vdash \tau$ es válido, entonces $\Gamma \vdash \sigma$ es válido. iii. $\Rightarrow _ { i } ^ { - 1 }$ : Si $\Gamma \vdash \tau \Rightarrow \sigma$ es válido, entonces $\Gamma , \tau \vdash \sigma$ también lo es.

# Ejercicio 8

Si $[ \tau _ { 1 } , \dots , \tau _ { n } ]$ es una lista de fórmulas, denimos la notación $[ \tau _ { 1 } , \dots , \tau _ { n } ] \Rightarrow ^ { * } \sigma$ inductivamente:

$$
\begin{array} { l l l } { { ( \bigl [ \bigl ] \Rightarrow ^ { * } \sigma \bigr ) } } & { { = } } & { { \sigma } } \\ { { ( \bigl [ \tau _ { 1 } , \tau _ { 2 } , . . . , \tau _ { n } \bigr ] \Rightarrow ^ { * } \sigma \bigr ) } } & { { = } } & { { \tau _ { 1 } \Rightarrow \bigl ( \bigl [ \tau _ { 2 } , . . . , \tau _ { n } \bigr ] \Rightarrow ^ { * } \sigma \bigr ) } } \end{array}
$$

Probar por inducción en $n$ que $\tau _ { 1 } , \ldots , \tau _ { n } \vdash \sigma$ es válido si y sólo ${ \mathrm { s i } } \vdash [ \tau _ { 1 } , \ldots , \tau _ { n } ] \Rightarrow ^ { * } \sigma$ es válido.

# Ejercicio 9

Probar los siguientes teoremas:

i. $( ( P \Rightarrow Q ) \Rightarrow Q ) \Rightarrow ( ( Q \Rightarrow P ) \Rightarrow P )$ ii. $( P \Rightarrow Q ) \Rightarrow ( ( \neg P \Rightarrow Q ) \Rightarrow Q )$ )

# Ejercicio 10

Demostrar las siguientes tautologías utilizando deducción natural.

i. $( P \Rightarrow ( P \Rightarrow Q ) ) \Rightarrow ( P \Rightarrow Q )$   
ii. $( R \Rightarrow \neg Q ) \Rightarrow ( ( R \land Q ) \Rightarrow P )$   
iii. $( ( P \Rightarrow Q ) \Rightarrow ( R \Rightarrow \neg Q ) ) \Rightarrow \neg ( R \land Q )$

# Ejercicios extra de deducción natural

# Ejercicio 11

Probar que los siguientes secuentes son válidos sin usar principios de razonamiento clásicos:

i. $( P \land Q ) \land R , S \land T \ \vdash Q \land S$

ii. $( P \land Q ) \land R \vdash P \land ( Q \land R )$

iii. $P \Rightarrow ( P \Rightarrow Q ) , P \vdash Q$

iv. $Q \Rightarrow ( P \Rightarrow R ) , \neg R , Q \vdash \neg P$

v. $\vdash ( P \land Q ) \Rightarrow P$

vi. $P \Rightarrow \neg Q , Q \vdash \neg P$

vii. $P \Rightarrow Q \vdash ( P \land R ) \Rightarrow ( Q \land R )$

viii. $Q \Rightarrow R \vdash ( P \lor Q ) \Rightarrow ( P \lor R )$

ix. $( P \lor Q ) \lor R \vdash P \lor ( Q \lor R )$

x. $P \land ( Q \lor R ) \vdash ( P \land Q ) \lor ( P \land R )$

xi. $( P \land Q ) \lor ( P \land R ) \vdash P \land ( Q \lor R )$

xii. $\lnot P \lor Q \vdash P \Rightarrow Q$

xiii. $P \Rightarrow Q , P \Rightarrow \neg Q \vdash \neg P$

xiv. $P \Rightarrow ( Q \Rightarrow R ) , P , \neg R \vdash \neg Q$

# Ejercicio 12

Probar que los siguientes secuentes son válidos:

i. $( P \land \neg Q ) \Rightarrow R , \neg R , P \vdash Q$

ii. $\neg P \Rightarrow Q \vdash \neg Q \Rightarrow P$

iii. $P \lor Q \vdash R \Rightarrow ( P \lor Q ) \land R$

iv. $( P \lor ( Q \Rightarrow P ) ) \land Q \vdash P$

v. $P \Rightarrow Q , R \Rightarrow S \vdash ( P \land R ) \Rightarrow ( Q \land S )$

vi. $P \Rightarrow Q \vdash ( ( P \land Q ) \Rightarrow P ) \land ( P \Rightarrow ( P \land Q ) )$

vii. $P \Rightarrow ( Q \land R ) \vdash ( P \Rightarrow Q ) \land ( P \Rightarrow R )$

viii. $( P \Rightarrow Q ) \land ( P \Rightarrow R ) \vdash P \Rightarrow ( Q \land R )$

ix. $P \lor ( P \land Q ) \vdash P$

x. $P \Rightarrow ( Q \lor R ) , Q \Rightarrow S , R \Rightarrow S \vdash P \Rightarrow S$

xi. $( P \land Q ) \lor ( P \land R ) \vdash P \land ( Q \lor R )$

# Ejercicio 13

Probar que los siguientes secuentes son válidos:

i. $\neg P \Rightarrow \neg Q \vdash Q \Rightarrow P$

ii. $\neg P \lor \neg Q \vdash \neg ( P \land Q )$

iii. $\neg P , P \lor Q \vdash Q$

iv. $P \lor Q , \neg Q \lor R \vdash P \lor R$

v. $P \land \neg P \vdash \neg ( R \Rightarrow Q ) \land ( R \Rightarrow Q )$

vi. $\neg ( \neg P \lor Q ) \vdash P$

vii. $\vdash \lnot P \Rightarrow ( P \Rightarrow ( P \Rightarrow Q ) )$ )

viii. $P \land Q \vdash \neg ( \neg P \lor \neg Q )$

ix. $\vdash ( P \Rightarrow Q ) \lor ( Q \Rightarrow R )$