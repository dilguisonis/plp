# A Machine-Oriented Logic Based on the Resolution Principle

J.A. RoBINSON

Argonne National Laboralory and Rice Universityt

Abstraet. Theorem-proving on the computer,using procedurcs based on the fundn. mental theorem of Herbrand coneerning the first-order predieate caleulus,is examined witl a view towards improving the cffeiency and widening the range of practical applicability of these procedures.A close analysis of the process of substitution (of terms for variables). and thc process of truth-funetional analysis of thc results of such substitutions, reveals that both processes can bc combined into a single new process (called resolution),iterating which is vastly more efieient than the older cyelic procedures consisting of substitution stages alternating with truth-functional anaiysis stages.

The theory of the resolution proecss is presentcd in the form of a system of first-order logic with just one inference prineiple (the resolution prineiple).The completeness of the system is proved;the simplest proof-procedure based on the system is then thc direct implementation of the proof of completencss.Howcver,this procedure is quite inefficient. and the paper concludes with a discussion of several prineiples (called search principles) which are applicable to the design of efficient proof-procedures employing resolution as the basic logical process.

# 1.Introduction

Presented in this paper is a formulation of first-order logic which is specifically designed for use as the basic theoretical instrument of a coinputer theoremproving program. Earlier theorem-proving programs have been based on systems of first-order logic which were originally devised for other purposes.A prominent feature of those systems of logic, which is lacking in the system described in this paper,is the relative simplicity of their inference principles.

Traditionaily,a single step in a deduetion has been required,for pragmatic and psychological reasons,to be simple enough,broadly speaking,to be apprehended as correct.by a human being in a single intellectual act.No doubt this custom originates in the desire that each single step of a deduction should be indubitable, cven though the deduetion as a whole may consist of a long chain of such steps. The ultimate conclusion of a deduction,if the deduction is correct, folows logically from the premisses used in the deduction;but the human mind may well find the unmediated transition from the premisses to the conclusion surprising, hence.(psychologically) dubitable. Part of the point,then, of thc logical analysis of deductive reasoning has been to reduce complex inferences, which are beyond the capacity of the human mind to grasp as single steps, to chains of simpler inferences,each of which is within the capacity of thehuman mind to grasp as a single transaction.

Work performed under the auspices of the U.S. Atomic Energy Commission. \*Argonne,Illinois. ： Present address:Rice University, Houston, Texas. 1

From the theoretical point of view, however,an inference principle need only bc sound (i.e., allow only logical consequences of premisses to bc deduccd from them)and effective (i.e., it must be algorithmically decidable whcthor an alleged application of thc inference principle is indeed an application of it).When the agent carrying out the application of an inference principle is a modern computing machine,the traditional limitation on the complexity of inference principles is no longer very appropriate. More powerful principles, involving perhaps a much greater amount of combinatorial information-processing fora single application, become a possibility.

In the system describcd in this paper, one such inference principle is used. It is caled the resolution principle,and it is machinc-oriented,rather than humanoriented, in the sense of the preceding remarks. Theresolution principle is quite powerful, both in the_psychological sense that it condoncs singie inferences which are often beyond the ability of the human to grasp (other than discursively),and in the theoretical sense that it alone,as sole inference principle, forms a complete system of first-order logic. While this latter property is of no great importance, it is interesting that (as far as the author is aware) no other complele system of first-order logic has consisted of just one inference principlc, if one construes the device of introducing a logical axiom, given outright, or by a schema,asa(premiss-frce) inference principle.

The main advantage of the resolution principle lies in its ability to allow us to avoid one of the major combinatorial obstacles to efficiency which have plagued earlier theorem-proving procedurcs.

In Section 2 the syntax and semantics of thc particular formalism which is used in this papcr are explained.

# 2.Formal Preliminaries

The formalism used in this paper is based upon thc notions of unsatisfiability and refutation rather than upon the notions of validity and proof.It is well known (cf. [2] and [5l) that in order to determine whethcra finite set $\boldsymbol { \mathscr { S } }$ of sentcnces of first-order logic is satisfiablc,it is sufficient to assume that cach sentcnce in $\boldsymbol { \mathrm { \Sigma } }$ is in prenex form with no existential quantifiers in the prefix;moreover the matrix of each sentence in $\boldsymbol { \varsigma }$ can be assumed to be a disjunction of formulas each of which is either an atomic formula or the negation of an atomic formula. Thcrefore our syntax is set up so that the natural syntactical unit is $^ \mathrm { a }$ finite set $\boldsymbol { s }$ of sentences in this special form. The quantifier prefix is omitted from each sentence, since it consists just of universal quantifiers binding each variable in the sentence; furthermore the matrix of each sentence is regarded simply as the set of its disjunets,on the grounds that the order and multiplicity of the disjuncts in a disjunetion are immaterial.

Accordingly we introduce the following dcfinitions (following in part the nomenclature of [2] and [5]):

2.1 Variables.The following symbols,in alphabetical order,are variables:

$$
u , v , w , x , y , z , u _ { 1 } , v _ { 1 } , w _ { 1 } , x _ { 1 } , y _ { 1 } , z _ { 1 } , u _ { 2 } , \cdot \cdot \cdot , \mathrm { e t c } .
$$

2.2 Function symbols. The following syinbols, in alphabetical order,are function symbols of degree $\boldsymbol { \gamma } _ { \ell }$ ,for each $n \not \equiv 0$ ：

$$
a ^ { n } , b ^ { n } , c ^ { n } , d ^ { n } , e ^ { n } , f ^ { n } , g ^ { n } , h ^ { n } , k ^ { n } , a _ { 1 } ^ { \textit { n } } , b _ { 1 } ^ { \textit { n } } , \cdot \cdot \cdot , \mathrm { e t c . }
$$

When $ { n _ { \mathrm { ~  ~ } } } =  {   }$ ,the superscript may be omitted. Function symbols of degree O are individual constants.

2.3 Predicale symbols. The following symbols，in alphabetical order,are predicate symbols of degree $n$ ,for each $n \gtrapprox 0$ ：

$$
F ^ { n } , Q ^ { n } , R ^ { n } , P _ { 1 } ^ { n } , Q _ { 1 } ^ { n } , R _ { 1 } ^ { n } , P _ { 2 } ^ { n } , \cdot \cdot \cdot , { \mathrm { e t c } } .
$$

The superseript may be omitted when $\textit { n }$ is 0.

2.4 The negation symbol. The following symbol is the negation symbol:\~ 2.5 Alphabetical order of symbols. The set of all symbols is well ordered in alphabetical ordcr by adding to the above ordering conventions the rule that variables precede funetion symbols, funetion symbols precede predicate symbols, predicate symbols precede the negation symbol,function symbols of lower degree precede function symbols of higher degree, and predicate symbols of lower degree precede prcdicatc symbols of higher degrce.

2.6 Terms. A variable is a term,and a string of symbols consisting of a function symbol of degree $\mathscr { n } \geq 0$ followcd by $\mathscr { n }$ terms is a term.

2.7 Atomic formulas. A string of symbols consisting of a predicate symbol of degree $\varkappa \triangleq 0$ followed by n terms is an atomic formula.

2.8 Literals. An atomic formula is a literal; and if $A$ is an atomic formula then ${ \sim } A$ is a literal.

2.9 Complements.If $\measuredangle$ is an atomic formula,then the two literals $\mathcal { A }$ and ${ \sim } A$ are said to be each other's complements,and to form,in either order,a complementary pair.

2.10 Clauses. A finite set (possibly empty） of literals is called a clause. The empty clause is denoted by:

2.11 Ground literals. A literal which contains no variables is caled a ground literal.

2.12 Ground clauses. A clause,each member of which is a ground literal, is callcd a ground clause. In particular  is a ground clause.

2.13 Welu-forined expressions. Terms and literals are (the only) well formed expressions.

2.14 Lexical order of well-formed expregsions. The set of all well formed expressions is well ordered in lexical order by the rule that $\varLambda$ precedcs $B$ just in case that $\mathbf { A }$ is shorter than $\boldsymbol { B }$ or,if $A$ and $B$ are of equal length, then $A$ has the alphabetically earlier symbol in the first symbol position at which $A$ and $B$ have distinct symbols.

In writing well-formed expressions for illustrative purposes,we follow the more readable plan of enclosing the $\boldsymbol { n }$ terms following a function symbol or predicate symbol of degree $\mathscr { n } _ { \ell }$ by a pair of parenthescs,separating the terms, if there are two or more, by commas. We can then unambiguously omit all superseripts fron symbols. In writing finite sets, we follow the usual convention of enclosing the members in a pair of braces and of separating the members by commas, with the understandiug that the order of writing the inembers is immaterial.

2.15 Herbrand universes.With any set $\ddot { S }$ of clauses there is associated a set of ground terms called the Herbrand universe of $S _ { i }$ as follows:let $\vec { \psi } ^ { \prime }$ be the set of all function symbols which occur in $\mathcal { S }$ I $\vec { \mathcal { l } }$ contains any function symbols of degree O, the funetional vocabulary of $\mathcal { S }$ is $\vec { t ^ { \prime } }$ ; otherwise it is the set $\{ \alpha \} \cup { \cal I } ^ { \prime }$ .The Herbrand universe of $\boldsymbol { \Lambda }$ is then the set of all ground terms in which there occur only symbols in the funetional vocabulary of $\mathcal { S }$

2.16 Saturation. If $\cal S$ is any set of clauses aud $P$ is any set of terms, then by $I ^ { \gamma } ( S )$ we denote the saturation of $\boldsymbol { \mathcal { S } }$ over $P$ ，which is the set of all ground clauses obtainable from members of $\mathcal { S }$ by replacing variables with mcmbers of $f ^ { \mathrm { ~ r ~ } }$ occurrences of the same variable in any one clause being replaced by occurrences of the same tern.

2.17 Models. A set of ground literals which does not inelude a complementary pair is called a model. If $\lambda \mathcal { I }$ is a model and $\boldsymbol { \varsigma }$ is a set of ground clauses,then M isa model of $\tilde { S }$ if,for all $C$ in $s$ ， $C ^ { \prime }$ contains a member of $\it { 1 1 }$ .Then,in general, if $\mathcal { S }$ is any set of clauses, and $H$ is the Herbrand universe of $\hat { s }$ we say that $\mathit { 1 1 }$ is a model of $\boldsymbol { \mathcal { S } }$ just in case that $M$ is a model of $H ( \cal { S } )$ .

2.18 Satisfiability. A sct $\mathcal { S }$ of clauses is satisfiablc if there is a model of $\mathcal { S }$ otherwise $\tilde { \mathcal { S } }$ isunsatisfiable.

From the definition of satisfiability,it is clear that any set of clauses which contains  is unsatisfiable,and that the empty set of clauses is satisfiable. These two cireumstances will appear quite natural as the development of our system proceeds. It is also clear that according to our semantic definitions each nonempty clause is interpreted, as explained in the informal remarks at the beginning of this section,as the universal closure of the disjunction of the literals which it contains.

2.19 Ground resoluents. If $\mathcal { C }$ and $\boldsymbol { D }$ are two ground clauscs, and $\cal { L } \subseteq \cal { C }$ ， $M \subseteq D$ are two singletons (unit sets） whose respective members form a complementary pair,then the ground clause: $( C - L ) \ U \left( D - \ M \right)$ is called a ground resolvent of $\mathcal { C } ^ { \dagger }$ and $\mathcal { D }$

Evidently any model of $\{ \zeta , D \}$ is also a model of $\beta , D , R \}$ ，where $\mathit { l } _ { \mathrm { 0 } } ^ { \mathrm { + } }$ isa ground resolvent of $\mathcal { C }$ and $\mathcal { D }$ . Not all pairs of ground clauses have ground resolvents,and some have more than one;but in no case,as is clear from the definition,can two ground ciauses have more than a finite number of ground resolvents.

2.20 Ground resolution. If $\mathcal { S }$ is any set of ground clauses, then the ground resolution of $\mathcal { S }$ denoted by ${ \mathfrak { P } } _ { i } ( S )$ , is the set of ground clauses consisting of the members of $\boldsymbol { \mathscr { S } }$ together with all ground resolvents of all pairs of members of $\mathcal { S }$

2.21 $N$ -th ground resolution. I $\mathcal { S }$ is any set of ground clauses,then the nth ground resolution of $\ddot { \curlywedge }$ ,denoted by $( \mathfrak { R } ^ { ? ? } ( \mathcal { S } )$ , is defined for each $\smash { \hat { \pi } _ { \perp } } \gtrapprox 0$ as follows: $\Updownarrow 0 \left( \hat { S } ^ { \prime } \right) = \ S$ and for ${ \hbar \underset { = } { \overset { } {  } } 0 }$ ${ \mathfrak { P } } _ { \mathfrak { t } } ^ { n \cdot \dagger \mathrm { 2 } } \ \cong \ { \mathfrak { R } } { \left( \mathfrak { R } ^ { n } ( S ) \right) }$

This completes the first bateh of definitions.The next sections are concerned with the various forms that Herbrand's Theorem takes on in our system. To each such form, there is a type of refutation procedure which that form sug-gests and justifies. The basic version is stated as follows (cf. [2, 41):

HERBRAND'S THEOREM.I $S$ is any finite sel of clauses and $H$ its Herbrand universe,then S is unsatisfiable if and only if some finite subset of $H ( S )$ is unsalisfiable.

# 3.Saturation Procedures

Is was noted in an earlier paper [5] that one can express Herbrand's Theorem in the following form:

THEOREM 1.If $\tilde { S }$ is any finite set of clauses, then $ { \mathcal { S } }$ is unsatisfiable if and only if,for some finite subset $P$ of the Herbrand universe of $\mathcal { S }$ ， $I ^ { \gamma } ( S )$ is unsatisfiable.

This version of Herbrand's Theorem suggests the following sort of refutation procedure, which we call a saturation procedure: given a finite set $\boldsymbol { \mathscr { S } }$ of clauses, select a sequence $P _ { \mathrm { ~ 0 ~ } } , \ P _ { \mathrm { ~ 1 ~ } } , \ P _ { \mathrm { ~ 2 ~ } } , \ \cdots$ ，of finite subsets of the Herbrand universe $\vec { \cal I }$ of $S$ ，such that $P _ { j } \subseteq P _ { j + 1 }$ for each $j \gtrapprox 0$ ,and such that $\cup _ { j = 0 } ^ { \infty } P _ { j } = H .$ Then examine in turn the sets $P _ { 0 } ( \vec { S } )$ ， $P _ { 1 } ( S )$ ， $P _ { 2 } ( \cal { S } )$ ,,for satisfiability.Evidently, for any finite subset $P$ of $H$ ， $P \subseteq P _ { j }$ for some $j$ ,and therefore $I ^ { \prime } ( S ) \subseteq P _ { j } ( S )$ Therefore,by Theorem 1,if $\boldsymbol { \mathrm { \Sigma } } _ { S }$ is unsatisfiable then,for some $j$ ， $P _ { j } ( \mathrm { \cal S } )$ is unsatisfiable.

Of course, any specific procedure of this sort must make the selection of $P _ { 0 }$ ， $\boldsymbol { \mathrm { f } } _ { \mathrm { ~ 1 ~ , ~ } } ^ { \prime } \boldsymbol { \mathrm { f } } _ { \mathrm { ~ 2 ~ , ~ } } ^ { \prime } \cdot \cdot \cdot$ ,uniformly for all finite sets of clauses.A particularly natural way of doing this is to use the so-called levels $\scriptstyle { H _ { 0 } }$ ， $H _ { 1 }$ ， $H _ { 2 }$ ,,of the Herbrand universe $H$ ;where $H _ { 0 }$ consists of all the individual constants in $H$ and $H _ { n + 1 }$ ,for $\varkappa \gtrapprox 0$ ,consists of all the terms in $H$ which are in $H _ { \ast }$ ,or whose arguments are iu $H _ { \cdot \cdot }$ .In [5] we called procedures using this method level-saturation procedures. [t was there remarked that essentially the procedures of Gilmore [4] and Davis-Putnam [2] are level-saturation procedures.

The major combinatorial obstacle to effcieney for level-saturation procedures is the enormous rate of growth of the finite sets $H _ { j }$ and $H _ { j } ( \cal { S } )$ as $\dot { j }$ increases, at least for most interesting sets $\boldsymbol { \mathrm { \Pi } }$ .These growth rates were analyzed in some detail in [5], and somc examples were there given of some quite simple unsatisfiable $\ S$ for which thc earliest unsatisfiable $H _ { j } ( \cal { S } )$ is so large as to be absolutely beyond the limits of fcasibility.

An interesting heuristic remark is that,for every finite set $\mathrm { \AA }$ of clauscs which is unsatisfiable and which has a refutation one could possibly construct, there is at least onc rcasonably small finite subset of the Herbrand universc of $\boldsymbol { \mathcal { S } }$ such that $P ( \mathbf { \vec { s } } )$ is unsatisfiable and such that $P$ is minimal in the sense that $Q ( S )$ is satisfiable for each proper subset $Q$ of $P$ .Such a $P$ was called a proof set for $\mathrm { \ o }$ in [5]. If only, then,a bencvolent and omniscient demon were available who could provide us, in rcasonablc time, with a proof set $P$ for cach unsatisfable finite set $\ S$ of clauses that wc considered, we could simply arrange to saturate $\boldsymbol { \varsigma }$ over $l ^ { \flat }$ and then extract a suitable refutation of $ { \mathcal { S } }$ from the resulting finite unsatisfiable set $P ( S )$ of ground clauses.This was in fact thc underlying scheme of a computer program reported in [5],in which the part of thc demon is played,as best his ingenuity allows,by the mathematician using the program.What is really wanted, to be sure, is a simulatiou of the proof sct demon on thc computer; but this would appear, intuitively,to be out of the question.

It turns out that it is not completely out of the question.In fact, the method developed in the remainder of this paper seems to come quite close to supplying the required demon as a computing process. In Scction 4 we take the first major step towards the development of this method by proving more versions of Herbrand's Theorem. We also give a preliminary informal account of the rest of the argument, pending a rigorous treatment in succeeding seetions.

# 4. The Resolution Theorems and the Basic Lemma

As a speeific method for testing a finite set of ground clauses for satisfiability, the method of Davis-Putnam [4] would be hard to improve on from the point of view of efficiency. However,we now give another method, far less efficient than theirs,which plays only a theoretical role in our development,and which is mueh simpler to state: givcn thc finitc sct $\boldsymbol { \mathrm { \Sigma } }$ of ground clauses, form successively the sets $\mathcal { S } , \mathbf { \bar { \Omega } } \mathbf { \bar { \Omega } } ( \mathcal { S } ) , \mathbf { \Omega } \Re ^ { 2 } ( \mathcal { S } ) , \mathbf { \bar { \Omega } } \cdot \mathbf { \Omega } \cdot \mathbf { \Omega }$ ,until either some ${ \mathfrak { R } } ^ { n } ( S )$ contains ,or does not contain $\square$ but is equal to ${ \mathfrak { G } } ^ { { \mathfrak { n } } \div { \mathfrak { i } } } ( { \mathfrak { S } } )$ . In the former case, $\tilde { s }$ is unsatisfiable; in the latter casc, $\ddot { s }$ is satisfiable.One or other of these two terminating conditions must eventually occur, since the number of distinct clauses formable from the finite set of literals which occur in $\mathcal { S }$ is finite,and hence in the nested infinite sequence:

not all of the inclusions are proper, since resolution introduces no ncw literals.

In view of the finite termination of thc described proccss we can prove its correctness,as stated above,in the form of the ground resolution theorem.

GROUND RESOLUTION THEOREM.If $\boldsymbol { s }$ is any finite set of ground clauses, then $\xi$ is unsatisfiable if and only if ${ { \bf \ddot { \mathcal R } } ^ { n } } ( S )$ contains ,for some $n \geq 0$

PrOOF.The“if'' part is immediate.To prove the“only if"part, let $T$ be the terminating set ${ \mathfrak { B } } _ { \ell } ^ { n } ( S )$ in the sequence（4.1） above,so that $\mathit { \Delta } T$ is elosed under ground resolution.We need only show that if $T$ does not contain $\sqcap$ ,then $T$ is satisfiable, and hence $\boldsymbol { s }$ is satisfiable since $\smash { \mathrm { ~  ~ { ~ S ~ } ~ } } \subseteq \textit { T }$ Let $\boldsymbol { L } _ { 1 }$ ，， $L _ { j _ { k } }$ be all the distinct atomic formulas which occur in $T$ or whose complements occur in $T$ Let $\boldsymbol { \mathcal { M } }$ be the model defincd as follows: $M _ { \mathrm { f } }$ is thc cmpty sct;and for $0 < j \le k _ { \cdot }$ ， $M _ { j }$ is the set $\mathcal { M } _ { j = 1 } \cup \{ L _ { j } \}$ ,unless some clause in $T$ consists entirely of complements of literals in the set $\mathcal { M } _ { j = 1 } \cup \{ L _ { j } \} ;$ in which case $M _ { j }$ is the set $\ M _ { j  1 } \cup \{ \sim { \cal L } _ { j } \}$ Finally, $\mathcal { M }$ is $\smash { \lambda \hat { H } _ { \tilde { r } } }$ .Now if $T$ does not contain □, $\mathcal { M }$ satisfies $\mathcal { T }$ For otherwise there is a least $j$ ， $0 < j \le k$ ,such that somc clausc(say, $ { C }$ ）in $\boldsymbol { T }$ consists entirely of complements of literals in the set $M _ { j }$ . By thc definition of $i \mathcal { H } _ { j }$ ,therefore, $M _ { j }$ is $\mathcal { M } _ { { j - 1 } } \cup \{ { \sim } L _ { j } \}$ .Hence by the leastness of $j$ ， $\mathcal { C }$ contains $L _ { j }$ 、But since $M _ { j }$ is $M _ { j \cdots } \cup \{ \sim I _ { i } \}$ ，there is some clause (say, $D$ ）in $T$ which consists entirely of complements of literals in the set $\lambda l _ { j = 1 } \cup \{ L _ { j } \}$ . Hence by the leastness of $j$ ， $\boldsymbol { D }$ contains ${ \sim } I _ { \ j }$ Then the clause $B ~ = ~ ( C ~ - ~ \{ L _ { j } \} ) ~ \cup ~ ( D ~ - ~ \{ \mathord { \sim } , \{ \mathord { \left/ { \vphantom { \bigcup } } \right. \kern - delimiterspace }  ~ \} )$ consists entirely of complements of literals in the set $M _ { j \cdots 1 }$ ,unless $B$ is $\sqsubset$ But $\boldsymbol { B }$ isa ground resolvent of $C$ and $D$ ,hence is in $\boldsymbol { T }$ ,hence is not .Thus the leastness of $j$ is contradicted and the thcorcm is proved.

The Ground Resolution Theorem now allows us to state a more specific form of Theorem 1, namcly,

THEOREM 2.If $\mathcal { S }$ is any fnite set of clauses, then $\bar { \mathcal { S } }$ is unsatisfiable if and onty i,for somefinite subset $P$ of the Ilerbrand aniverse of $\bar { S }$ and 8ome $n \geq 0$ 、 ${ \mathfrak { R } } ^ { n } ( P ( S ) )$ conlains.

It is now possible to state informally the cssential steps of the remaining part of the development. We are going to generalizc the notions of ground resolvont and ground resolution, respectively, to the notions of resolvent and resolution. by removing the restriction that the clauses involvcd bc only ground clauses. Any two clauses will then have zero, one or more clauses as their resolvcnts, but in no case more than finitely many.In the special case that $\mathcal { C }$ and $\boldsymbol { D }$ are ground clauses, their resolvents, if any,are precisely their ground resolvents as already defined. Similarly, the notations ${ \mathfrak { G } } ( S )$ ， ${ \mathfrak { R } } ^ { * } ( { \mathfrak { S } } )$ will be retained, with $\check { S }$ allowed to be any set of clauses. ${ \mathfrak { R } } ( S )$ will then denote the resolution of $\vec { \cal S }$ ,which is the set of clauses consisting of all members of $\boldsymbol { \mathrm { \check { S } } }$ together with all resolvents of all pairs of members of $\boldsymbol { S }$ Again, ${ \mathfrak { G } } ( S )$ is precisely the ground resolution of $\mathcal { S }$ ,already defined,whenever $\boldsymbol { s }$ happens to be a set of ground clauses.

The details of how this generalization is done must await the formal definitions in Seetion 5. However,an informal grasp of the general notion of resolution is obtainable now,prior to its exact treatment,from simply contemplating the fundamental property which it will be shown to possess:resolulion is semicommutative with saturation. More exactly,this property is as stated in the following basic Lemma,which is proved in Section 5:

LEMMA.If $\ddot { s }$ is any set of clauses,and $P$ is any subset of the Herbrand universe of $\boldsymbol { S }$ then: ${ \mathfrak { R } } { \big ( } P ( S ) { \big ) } \subseteq P { \big ( } \mathfrak { R } ( S ) { \big ) }$

Thc fact is,as will bc shown here,that any ground clause which can be obtained by first instantiating over $P$ a pair $C , D$ of clauses in $\boldsymbol { S }$ ,and then forming a ground resolvcnt of thc two resulting instances, can also be obtained by instantiating over $P$ one of the finitely many resolvents of $C$ and $D$

It is an easy corollary of thc basic Lemma that nth resolutions are also semicommutative with saturation:

COROLLARY.If $\mathit { S }$ is any set of clauses and $P$ isany subset of the Herbrand universe of $\boldsymbol { S }$ ,then: $\Phi ^ { n } ( P ( S ) ) \subseteq P ( \mathbb { R } ^ { n } ( S ) )$ for all $n \not \equiv 0$

PROOF. By induction on n. $\Re ^ { 0 } ( P ( S ) ) ~ = ~ P ( S ) ~ = ~ P ( \ o ( \Re ^ { 0 } ( S ) )$ ，so that the case $n \approx 0$ is trivial. And if,for $n \not \equiv 0$ ， $\mathfrak { R } ^ { { \mathfrak { n } } } ( P ( S ) ) \subseteq P ( \mathfrak { R } ^ { { \mathfrak { n } } } ( S ) )$ ,then:

$\begin{array} { r l } { \mathbb { G } ^ { n \div 1 } ( P ( \mathcal S ) ) } & { = \mathbb { G } ( \mathbb { G } ^ { n } ( P ( \mathcal S ) ) ) } \\ & { \subseteq \mathbb { G } ( P ( \mathbb { G } ^ { n } ( \mathcal S ) ) ) } \\ & { \subseteq P ( \mathbb { G } ( \mathbb { G } ^ { n } ( \mathcal S ) ) ) } \\ & { = P ( \mathbb { G } ^ { n + 1 } ( \mathcal S ) ) } \end{array}$ by definition of $( \mathbb { R } ^ { n + 1 }$ ， by the induction hypothesis, ${ \mathfrak { a s } } { \mathfrak { R } }$ preserves inclusion, by the Lemma, by definition of $( \bar { \mathcal { V } } ^ { n + 1 }$ ，

and the Corollary is proved.

Now by the above Corollary to the basic Lemma we may immediately obtain a lhird version of Herbrand's Theorem from Theorem 2:

THEOREM 3.Ij $\ddot { S }$ is any finite set of clauses, then $\mathcal { S }$ is unsatisfable if and only if,for some finite subset $l ^ { \mathrm { ~ p ~ } }$ of the Herbrand universe of $\mathcal { S }$ ,and some $\gamma _ { \hat { l } } \gtrapprox \left\{ \begin{array} { r l } \end{array} \right\}$ ， $P ^ { \prime } ( \ B ^ { \prime } \ ^ { \prime } ( \ B ^ { \prime } ) )$ conlains□.

Here,the order of the saturation and nth resolution operations is reversed. Now a rather surprising simplification of Theorem 3 can be made, on thc basis of the remark that mere replacement of variables by terms cannot producc £ from a nonempty clause.Hence $P ( \mathbb { R } ^ { n } ( S ) )$ will contain  if and only if $( \ S \{ \stackrel { \pi } { . } \} ^ { \prime \prime } \{ \stackrel { \cdot } { . } \} )$ coutains .From Thcorem 3,therefore,we immediately obtain our fiual version of Herbrand's Theorem,which is the main result of this paper,and which wc call:

RESOLUTION THEOREM.If $\mathcal { S }$ is any finite set of clauses, then $\mathcal { S }$ is unsatisfiable i and only i ${ \mathcal { G } } _ { 4 } ^ { \gamma _ { i } } ( S )$ contains $\sqcap$ for some $n \ \geq \ 0$

The statement of the Resolution Theorem is just that of the Ground Resolution Thcorem with the word “ground"omitted. Apart, therefore, from the somewhat more complex way in which the resolvents of two elauses are computed (described in Section 5） the method suggested by the Resolution Theorem for testing a finite set $\bar { S }$ of clauses for unsatisfiability is exactly like that given earlier for the case that $\mathrm { \Delta S }$ is a set of ground clauses,and indced it automatically reverts to that method when it is applied to a finite set of ground clauses. However, it is no longer the case in general that the nested sequence

$$
S \subseteq { \mathfrak { R } } ( S ) \subseteq { \mathfrak { R } } ^ { 2 } ( S ) \subseteq \cdots \subseteq { \mathfrak { R } } ^ { n } ( S ) \subseteq \cdots
$$

must terminate for al finite $S$ By Church's Thcorem this could not be so, for otherwise we would have a decision procedure for satisfiability for our formulation of first-order logic.

Consider now the “proof set demon” discussed in Section 3.We there supposed that if we were given a proof set $P$ for an unsatisfiable set $\mathcal { S }$ of clauses, all wc would have to do would bc to compute until we encountered the first ${ \mathfrak { P } } _ { \mathfrak { t } } ^ { \pi } ( P ( S ) )$ which contains ,in order to obtain from it a formal refutation of $\mathrm { \ddot { s } }$ But the Resolution Theorem assures us that by the time we had computed $( \bar { \bf y } _ { \mathrm { i } } ^ { \mathrm { \tiny ~ \gamma _ { \mathrm { i } } ~ } } ( S )$ ，if not before,we would have turned up Q,despite our ignorance of $\boldsymbol { j } ^ { \flat }$ .In this sense the Resolution Theorem makes the proof set demon's role unneccssary.

In Section 5 we introduce a little more formal apparatus by a second batch of definitions,and pay off our debts by defining the general notion of resolution and proving the basic Lemma.

# 5.Substitution,Unificalion and Resotution

The following definitions are concerned with the operation of iustantiation, i.e. substitution of terms for variables in well-formed expressions and in sets of well-formed expressions, and with the various auxiliary notions needed to define resolution in general.

5.1 Substitution components. A substitution component is any expression of theform $T / \mathcal { V }$ ,where $\overrightarrow { \mathbf { \downarrow } }$ is any variable and $\it { \Delta } \chi ^ { \prime }$ is any term different from $V , \ V ^ { \prime }$ is callcd the variable of the component $T / V$ and $T$ is called the term of the component $T / V$

5.2 Substitulions. A substitution is any finite set (possibly empty) of substitution components none of the variables of which are the same.If $P$ is any $\ S \langle \dot { \bf { \sigma } } \rangle ^ { \dagger }$ of terms,and the terms of the components of the substitution $\boldsymbol { \vartheta }$ are all in $f ^ { \gamma }$ we say that $\theta$ is a substitution over $P$ .We write the substitution whose components are $\mathcal { I } _ { 1 } ^ { : } / \mathcal { V } _ { 1 }$ ，， $T _ { i ; i } / V _ { i ; i }$ as $\{ T _ { 1 } / \top _ { 1 } , \cdot \cdot \cdot , T _ { k } / V _ { k } \}$ ，with the understanding that the order of the components is immaterial. We use lower-case Greek letters to denote substitutions.In particular, $\epsilon$ is the empty substitution,

5.3 Instantiation. If $\vec { \mathcal { L } }$ is any finite string of symbols and

$$
\theta = \{ T _ { 1 ^ { ' } } V _ { 1 } , \cdots , T _ { k ^ { ' } } ^ { \prime } / V _ { k } \}
$$

is any substitution,then the instantiation of $\mathcal { L }$ by $\boldsymbol { \theta }$ is the operation of replacing each occurrence of the variable $V _ { i }$ ， $1 \leq i \leq k$ in $\mathcal { E }$ by an occurrence of the term $\boldsymbol { T _ { i } }$ .The resulting string, denoted by $E \theta$ is called the instance of $\mathcal { \overline { { L } } }$ by $\theta .$ L.e., f $\vec { l } _ { i } ^ { \gamma }$ is the string $\mathcal { E } _ { 0 } V _ { i _ { \perp } } \mathcal { E } _ { 1 } \dots  { V } _ { i _ { n } } E _ { n }$ ,then $E \theta$ is the string $\mathcal { E } _ { \mathfrak { g } } T _ { i _ { 1 } } \mathcal { E } _ { 1 } \ \cdot \ \cdot \ \mathcal { T } _ { i _ { n } } \mathcal { E } _ { x } ,$ ， Herc, none of the substrings $\dddot { \mathcal { L } } _ { j }$ of $\mathcal { E }$ contain occurrences of the variables $\bar { V } _ { 1 } , \cdots ,$ $\mathbb { V } _ { k }$ ,some of the $E _ { j }$ are possibly null, $\mathscr { n } .$ is possibly O,and each $\boldsymbol { V } _ { i _ { 2 } }$ is an occurrence of one of the variables $\mathbb { V } _ { \bot } , \cdots , \mathbb { V } _ { k }$ .Any string $\operatorname { \it { F } } \theta$ is called an instance of the string $\mathcal { E }$ If $\textrm { C }$ is any set of strings and $\theta$ a substitution, then the instance of $\hat { C }$ by $\theta$ is the set of all strings $E \vartheta$ where $\mathcal { \vec { E } }$ isin $C$ We denote this set by $\mathcal { C } \theta$ and say that it is an instance of $\hat { C }$

5.4 Standardizationg. If $\zeta$ is any finite sct of strings, and $V _ { 1 } , \cdots , \ V _ { i }$ are all the distinct variables, in alphabetieal order,which occur in strings in $C$ ,then the $\it { \Delta } x$ -standardization of $\mathcal { \vec { C } }$ denoted by $\xi _ { C }$ ,is the substitution $\{ x _ { 1 / } \langle \mathcal { V } _ { 1 } , \cdot \cdot \cdot , x _ { k } / V _ { k } \}$ and the $\mathcal { Y }$ -standardization of $C$ ,denoted by $\eta _ { \mathrm { { f } } }$ ,is the substitution

$$
\langle { y _ { 1 } } , { ' } V _ { 1 } , \cdot \cdot \cdot , y _ { k } , { ' } V _ { k } \rangle ,
$$

5.5 Composition of substitutioms. If $\hat { \theta } ~ = ~ \{ T _ { 1 } / V _ { 1 } ~ , ~ \cdot ~ \cdot ~ , ~ T _ { \hat { x } } ^ { \prime } / V _ { \hat { x } \hat { j } } ^ { \prime }$ and $\lambda$ are any two substitutions, then the set $\theta ^ { ' } \cup \lambda ^ { ' }$ ,where $\lambda ^ { ' }$ is the set of all components of $\lambda$ whose variables are not among $V _ { 1 }$ ，…， $\boldsymbol { V } _ { \mathcal { k } }$ ,and $\hat { \theta } ^ { ' }$ is thc set of all components $\mathcal { T } _ { i } \lambda / V _ { i }$ ， $1 \ \leq \ i \ \leq \ k$ such that $\mathbf { \nabla } T _ { i } \lambda$ is different from $V _ { i }$ ,is called the composition of $\theta$ and $\lambda$ ,and is denoted by $\theta \lambda$

It is straightforward to verify that $\epsilon \theta \ : = \ : \theta \epsilon = \theta$ for any substitution $\theta$ Also, composition of substitutions enjoys the associative property $( \theta \lambda ) \mu = \theta ( \lambda \mu )$ ，80 that we may omit parenthescs in writing multiple compositions of substitutions.

The point of the composition operation on substitutions is that,when $E$ is any string,and $\sigma = \theta \lambda$ ,the string $E _ { \sigma }$ is just the string $E \theta \lambda$ ,i.e.the instance of $I \xi \partial$ by入

These properties of the composition of substitutions are established by the following propositions.

5.5.1. $( { \cal E } _ { \bf \tilde { \tau } } ) \lambda = { \cal E } ( { \sigma \lambda } )$ for all strings $E$ and all substilutions $\sigma , \lambda$

PROOr.Let $\sigma = \{ T _ { 1 } / V _ { 1 } , \cdot \cdot \cdot , T _ { k } / V _ { k } \}$ ， $\lambda = \{ U _ { 1 } / W _ { 1 } , \ldots , U _ { m } / W _ { m } \}$ and $\mathcal { E } \ = \ \mathit { E } _ { 0 } V _ { : : } \mathit { E } _ { 1 } \ \cdot \cdot \cdot \ V _ { i _ { n } } \mathcal { E } _ { n }$ as explained in (5.3） above.Then by definition $\begin{array} { r l } { \operatorname { \mathcal { F } } _ { z \sigma } ~ \approx ~ } & { { } \lneq } \end{array}$ $\vec { \mathcal { L } } _ { 1 9 } \vec { \mathcal { L } } _ { 1 } ^ { 3 } , \vec { \mathcal { L } } _ { 1 } ^ { \dag } \ \cdot \ \cdot \ \vec { \mathcal { L } } _ { i _ { n } } \vec { \mathcal { L } } _ { n }$ ，and $( L ^ { \prime } \sigma ) \lambda \ = \ \bar { E _ { 0 } } \bar { L ^ { \prime } } _ { i _ { 1 } } \bar { L ^ { \prime } } _ { 1 } \ \cdot \ \cdot \ \bar { L ^ { \prime } } _ { i _ { n } } \bar { L ^ { \prime } } _ { n }$ ，where each $\bar { \mathcal { T } ^ { \prime } } _ { i _ { j } }$ is $\mathcal { I } _ { i _ { j } } ^ { \prime } \lambda ,$ and cach $\ddot { \mathcal { Z } } _ { j }$ is $\vec { \mathcal { L } } _ { j } \lambda _ { \ j } ^ { ' }$ where $\lambda ^ { ' }$ is the sct of all components of $\lambda$ whose variables are not among $\mathbb { f } _ { 1 } ^ { * }$ ，， $\boldsymbol { \xi } _ { : } ^ { * }$ (since none of these variables occur in any $\vec { \mathcal { k } } _ { j } ^ { 1 }$ .But $\sigma \lambda = \sigma ^ { \prime } \bigcup \lambda _ { i } ^ { \prime }$ where cach component of $\acute { \sigma }$ is just $\bar { \mathcal { I } ^ { \prime } } _ { i } / \bar { \mathcal { Y } } _ { i }$ whenever $\vec { \mathcal { T } } _ { i } ^ { \phantom { \dagger } }$ is different from $\gamma _ { i }$ Hence $\begin{array} { r c l } { \vec { E } ( \sigma \lambda ) } & { = } & { \vec { E } _ { 0 } \vec { Z } _ { i _ { 1 } } \vec { Z } _ { 1 } \cdot \cdot \cdot \vec { Z } _ { i _ { n } } \vec { E } _ { \ast } } \end{array}$ ，

5.5.2. For any substitutions $\mathcal { O }$ ，入： $\smash { \vec { L } } \sigma \equiv J _ { s } ^ { \prime } \lambda$ for all strings $\mathit { k }$ ，then $\sigma = \lambda$ PROOF. Let $\mathbf { \Delta } \mathbf { V } _ { 1 }$ ，， $\gamma _ { \varepsilon }$ inelude all the variables of the components of $\boldsymbol { \sigma }$ and 入；then $\gamma _ { j } \sigma = \gamma _ { j } ^ { r } \lambda $ ,for $1 \ \leq j \ \leq k$ Then all the components of $\sigma$ and $\lambda$ are the same.

5.5.3. For any substitutions $\sigma , \lambda , \mu \colon ( \sigma \lambda ) \mu = \sigma ( \lambda \mu )$

PROOr. Let $E$ be any string. Then by 5.5.1,

$$
\begin{array} { r l } { E \left( \left( \sigma \lambda \right) \mu \right) } & { = \left( E \left( \sigma \lambda \right) \right) \mu } \\ & { = \left( \left( E \sigma \right) \lambda \right) \mu } \\ & { = \left( E \sigma \right) \left( \lambda \mu \right) } \\ & { = E \left( \sigma ( \lambda \mu ) \right) . } \end{array}
$$

Hence $( \sigma \lambda ) \mu = \sigma ( \lambda \mu )$ by (5.5.2).

We shall also have occasion to use the following distributive property.

5.5.4.For any sets $\varLambda$ ， $B$ of strings and substitution $\lambda \colon ( A \cup B ) \lambda = A \lambda \cup B \lambda .$ 5.6 Disagreement sels. If $\mathcal { A }$ is any set of well-formed expressions,we call the set $\boldsymbol { B }$ the disagroement set of $\varLambda$ whenever $B$ is the set of all well-formcd subexpressions of the well-formed expressions in $\lrcorner 4$ ，which begin at the first symbol position at which not all well-formed expressions in $\mathcal { A }$ have the same symbol. Ecomple:

$$
{ \mathcal A } = \{ P ( x , h ( x , y ) , y ) , P ( x , t ( y ) , y ) , P ( x , a , b ) \} ,
$$

Disagreement set of $\mathcal { A } = \{ \hbar ( x , y ) , \hbar ( y ) , \alpha \}$

Evidently,if $\mathcal { A }$ is nonempty and is not a singleton,then the disagreement set of $A$ is nonemply and is not a singleton.

5.7 Unification. If $\measuredangle 4$ is any set of well-formed expressions and $\boldsymbol { \theta }$ is a substitution, then $\theta$ is said to unify $\varDelta$ , or to be a unifier of $\mathcal { A }$ ，if $\angles { \theta }$ is a singleton. Any set of well-formed expressions which has a unifier is said to be unifiable.

Evidently,if $\boldsymbol { \hat { \theta } }$ unifies $A$ ，but $\varLambda$ is not a singleton, then $\theta$ unifies the disagreement set of $\mathcal { A }$ ，

5.8 Unification Algorithm. The following process, applicable to any finite nonempty set $\mathcal { A }$ of well-formed expressions,is called the Unification Algorithm:

Step 1.Set $\sigma _ { \bar { \mathcal { I } } } \quad \cdots \quad \epsilon$ and ${ \vec { \beta } } _ { v } ^ { * } \ \mathrel { \mathop : } \ 0 _ { \ s }$ and go to step 2.   
Step 2.If $\blacktriangleleft _ { k }$ is not a singleton,go to step 3.Otherwise,sct $\begin{array} { r l } { \pmb { \mathscr { F } } _ { \mathcal { A } } } & { { } \triangleq \pmb { \mathscr { F } } _ { \mathcal { k } } } \end{array}$ and terminate,   
Step 3.Let $\boldsymbol { \Vdash } _ { k }$ be the earliest,and $\mathcal { \tilde { \ell } } _ { \ast } ^ { \ast }$ the next earliest,in the lexical ordering of the disagreement set $B _ { \mathcal { k } }$ of $A \sigma _ { k }$ .If $\gamma _ { k }$ is a variable,and does not oecur in $\boldsymbol { \mathit { U } } _ { k }$ ， $\mathrm { s c } \ t \sigma _ { k + 1 } \ \mathrel { \mathop : } \ \cdots \ \sigma _ { \ell ; \ell } \{ U _ { k } / V _ { k } \}$ ， add1to $\Bbbk$ and return to step 2.Otherwise,terminate.

This definition requires justification in the form of a proof that the given process is in fact an algorithn. In fact the process always terminates for any fiuite nonempty set of well-formed expressions, for otherwise there would be generated an infinite sequence $\textit { A }$ ， $\mathcal { A } \sigma _ { 1 }$ ， $\textit { A } \sigma _ { 2 }$ ，of finite nonempty sets of wellformed expressions with the property that cach successive set contains one less variable than its predecessor (namely, $\angles { \mathcal { A } } { \sigma } _ { k }$ contains $\boldsymbol { V } _ { i \cdot }$ but $\boldsymbol { \mathscr { A } } \boldsymbol { \sigma } _ { k \to \pm 1 }$ does not).But this is impossible,since $\varLambda$ contains only finitely many distinct variables.

5.9 Most general unifiers. If $\mathcal { A }$ is a finite nonempty set of well-formcd expressions for which the Unification Algorithm terninates in step 2, the substitution $\boldsymbol { \mathfrak { T } } _ { A }$ then available as output of thc Unification Algorithm is called the most general unifier of $\mathcal { A }$ ,and $\measuredangle 4$ is then said to be Inost generally unifiable.

5.10 Key triples. The ordered triple $\langle L , \mathcal { M } , N \rangle$ of finite sets of literals is said to be a key triple of the ordered pair $\langle \mathcal { C } , D \rangle$ of clauses just in case the following conditions are satisfied.

5.10.1. $\mathcal { L }$ and $\mathcal { M }$ are nonempty,and $L \subseteq C$ ， $M \subseteq D$

5.10.2. $N$ is the set of atomic formulas which are members, or complements of members,of the set $L \xi _ { \vec { c } } \cup \mathcal { M } \eta _ { \bar { D } }$ (cf.definition (5.4））.

5.10.3. $N$ is most generally uuifiable, with most general unifier $\sigma _ { N }$

5.10.4.The sets $\chi _ { \mathcal { \xi } _ { \mathcal { C } } \mathcal { T } _ { N } }$ and $i k f _ { \ l } \eta _ { n } \sigma _ { S }$ are singletons whose members are complements.

Evidently, a pair $\langle C , D \rangle$ of clauses has at most a finite number of key triples, and possibly none at all.

5.11 Resolvents. $\Lambda$ resolvent of the two clauses $\mathcal { C }$ and $\mathcal { D }$ is any elause of the form: $( \mathcal { C } - \mathcal { L } ) \xi _ { c } \sigma _ { N } \cup ( D - \mathcal { M } ) \eta _ { D } \sigma _ { N }$ where $\langle \bar { L } , \lambda \bar { \mathcal { U } } , \bar { N } \rangle$ is a key triple of $\langle C , D \rangle$

By the remark following definition (5.10） it is clear that two clauses $\mathcal { C }$ and $\mathcal { D }$ can have at most finitely many resolvents,and possibly none at all.

5.12 Resolutions.If $\boldsymbol { S }$ is any set of clauses then the resolution of $\vec { S }$ denoted py ${ \mathfrak { G } } ( S )$ ,is the set of allclauses which are members of $\bar { \mathcal { S } }$ or rosolvents of members of $\boldsymbol { S }$

5.13 $N$ -th resolution. The nth resolution of $\mathrm { \Delta } S$ ,where $\mathit { S }$ is any set of clauses, is denoted by ${ \mathfrak { G } } ^ { \mathfrak { n } } ( { \mathfrak { S } } )$ and is defined for all $\mathscr { n } \gtrapprox 0$ cxactly analogously to definition (2.21).

This completes our second group of definitions. The dcfinition of $\mathbb { R } ( S )$ as given is adequate for our theoretical argumcnt, but in practice one would not include in it both the resolvents of $\langle \mathcal { C } , D \rangle$ and the resolvents of $\langle D , \mathcal { C } \rangle$ since these are in fact identical up to a change of variablcs. When $\mathcal { C }$ and $D$ are both ground clauses, the resolvents of $\langle C , D \rangle$ are actually identical with those of $\langle D , C \rangle$ ,and are precisely the ground resolvents of $\mathcal { C }$ and $D$ ,as is easily verified.

It now remains to prove the basic Lemma,which will be done after we have first proved the following thcorem establishing thc basic property of unification, which we need in the proof of the Lemma and elsewhere in our theory:

UNIFICATION THEOREM.Let $\varLambda$ be any finite nonempty set of wel-formed expressions. If A is unifiable, then $\varLambda$ is most generally unifiable with most general unifer $\sigma _ { A }$ ;moreover,for any unifier $\pmb \theta$ $\measuredangle 4$ there is a subslitution X such that $\beta = \sigma _ { A } \lambda$

Proor.It will sufficc to prove that uuder the hypotheses of the theorem the Unification Algorithm will terminate, when applied to $A$ ,at step 2; and that for each k ≥ O until the Unjfication Algorithm so terminates, the equation

# 5.14.

holds at step 2 for some substitution $\lambda _ { k }$ .For $k = 0$ ，（5.14） holds with $\therefore 0 =$ since $\sigma _ { \mathfrak { h } } \ \cong \ \epsilon$ .Now assume that, for $k \ \underset { = } { \overset { \displaystyle > } { \mathrm { \succ } } } \ 0$ ，(5.14) holds at step 2 for some s stitution $\lambda _ { \not \mu }$ .Then either $\mathcal { A } \sigma _ { \mathcal { k } }$ is a singleton, in which case the Unification gorithm terminates at step 2 with $\sigma _ { \varLambda } \varlimsup \varlimsup \varlimsup$ the most general unifier of $\lambda \textbf { \ \xi }$ $\lambda \ : = \ : \lambda _ { k }$ the required substitution;or the Unification Algorithm transfers to s 3.In the latter case,since $\lambda _ { k }$ unifies $\mathcal { A } \sigma _ { k }$ ,(by(5.14）,since $\boldsymbol { \vartheta }$ unifies $\mathcal { A }$ ） $\lambda _ { k }$ m also unify the disagreement set $B _ { k }$ of $A \sigma _ { k }$ .Hence the $\boldsymbol { \mathrm { { V } } } _ { ! : }$ and $\chi _ { \textit { k } }$ defined in s 3 of the Unification Algorithm satisfy the equation

5.15. $\tilde { V _ { k } } \lambda _ { k } , = \tilde { U _ { k } } \lambda _ { k }$

Since $B _ { k }$ isa disagreement set,the well-formed expressions in ${ { \bar { \boldsymbol { B } } } _ { l _ { v } } }$ cannot begin with the same symbol; hence they cannot all begin with symbols which not variables, since ${ { \cal { R } } _ { k } }$ is unifiable.Therefore at least one well-formed express in $B _ { s }$ begins with a variable,and hence is a variable, since it is well-form Since variables precede all other well-formed expressions in the lexical order,ε since $\boldsymbol { V } _ { k }$ is the carliest well-formed expression in ${ \mathcal { B } } _ { \varepsilon }$ ,it follows that $\boldsymbol { V } _ { \kappa }$ i variable. Now if $\boldsymbol { V } _ { \dot { \kappa } }$ occurs in ${ { \cal { U } } _ { k } ^ { \dag } }$ ， $V _ { \xi } \lambda _ { k }$ oceurs in $U _ { k } \lambda _ { k }$ ,but since $\boldsymbol { \ V } _ { k }$ and $U _ { k }$ distinct well-formcd cxprcssions this is impossible becausc of (5.15).Theref $\boldsymbol { V } _ { k }$ does not oceur in $\left. \it { U } _ { k } \right.$ .Hence thc Unification Algorithm will not terminate step 3, but will return to stcp 2 with $\sigma _ { k + 1 } = \sigma _ { k } { \mathrm { \large { / ~ } } } U _ { \lambda } { \mathrm { / ~ } } V _ { k } { \mathrm { \large { 3 } } }$ . Now let $\lambda _ { \dot { \iota } + 1 } = \lambda _ { \dot { \iota } }$ $\{ Y _ { k } \} _ { k } / V _ { k } \}$ . Then:

$$
\begin{array} { r c l r c l } { { \lambda _ { i } = \{ V _ { k } \lambda _ { k } / V _ { i } \} \cup \lambda _ { k + 1 } } } & { { \ } } & { { \mathrm { b y ~ d e f i n i t i o n ~ o f ~ } \lambda _ { k + 1 } \mathrm { ~ , ~ } } } \\ { { } } & { { } } & { { } } & { { } } \\ { { = \{ U _ { k } \lambda _ { k } / V _ { k } \} \bigcup \ \lambda _ { k + 1 } } } & { { \ } } & { { \mathrm { b y ~ ( 5 . 1 5 ) , ~ } } } \\ { { } } & { { } } & { { } } & { { } } \\ { { } } & { { = \{ U _ { k } \lambda _ { k + 1 } / V _ { k } \} \bigcup \ \lambda _ { k + 1 } } } & { { \ } } & { { \mathrm { s i n c e ~ } V _ { k } \mathrm { ~ d o e s ~ n o t ~ o c c u r ~ i n ~ } U _ { k } \mathrm { ~ , ~ } } } \\ { { } } & { { } } & { { } } & { { } } \\ { { = \{ U _ { k } / V _ { k } \} \lambda _ { k + 1 } } } & { { \ } } & { { } } & { { \mathrm { b y ~ d e f i n i t i o n ~ ( 5 . 5 ) . } } } \end{array}
$$

Hence by (5.14） $\theta ~ = ~ \sigma _ { i \ast + 1 } \lambda _ { k + 1 }$ .Thus(5.14) holds for all $k \geq 0$ until the U fication Algorithm terminates in step 2,and the theorem is proved.

We are now in a position to prove the basic Leinina, which we state here ag for convenience.

LEMMA.If $\boldsymbol { \mathrm { \check { S } } }$ is any set of clauses and $P$ isany subset of the Herbrand unive of $\boldsymbol { \mathcal { S } }$ then: $\mathbb { R } ( P ( S ) ) \subseteq P ( \mathbb { R } ( S ) )$

PROOF. Assume that $A \in \mathfrak { R } ( P ( S ) )$ . Then either $A \in P ( \mathbb { S } )$ ,in which cl $\varLambda \in \varPsi ( \mathfrak { R } ( S ) )$ since ${ \mathcal { S } } \subseteq { \mathfrak { R } } ( { \mathcal { S } } ) ;$ or $\varLambda$ is a ground resolvent of two ground clau $C \alpha , D \beta$ where $C \in S , D \in S , \alpha = \{ T _ { 1 } / V _ { 1 } , \cdot \cdot , T _ { k } / V _ { k } \}$ ,whcre $V _ { \mathrm { ~ l ~ } } , \cdots , V _ { k } :$ all the distinct variables of $C$ in alphabetical order and $T _ { 1 } , \cdots , T _ { k }$ are in and $\beta = \{ U _ { 1 } / W _ { 1 } , \ldots , U _ { m } / W _ { m 3 } \}$ where $W _ { 1 } , \cdots , W _ { m }$ arc all the distinet vε ables of $\boldsymbol { D }$ in alphabetical ordcr and $\tilde { U } _ { 1 } , \cdots , \tilde { \{ \chi _ { n } }  _ { }$ are in $P$ . In that case, $\pmb { A }$ $( \mathcal { C } - \mathcal { L } ) \alpha \cup ( D - \mathcal { M } ) \beta _ { 3 }$ where $\cal { L } \subseteq \cal { C }$ ， $M \subseteq D$ ， $L$ and $\it { i d }$ are nonempty,a $L \alpha , M \beta$ are singletons whose members are complements.Let

$$
\theta = \{ T _ { 1 } / x _ { 1 } , \cdot \cdot \cdot , T _ { k } / x _ { k } , U _ { 1 } / y _ { 1 } , \cdot \cdot \cdot , U _ { m } / y _ { m } \} ,
$$

Then it follows that $\mathcal { A } = ( C - L ) \xi _ { C } \theta \bigcup \left( D - \mathcal { M } \right) _ { \eta _ { D } \theta }$ and that $L \xi _ { \mathcal { G } } \theta = L \alpha$ a $M \eta _ { D } \theta = M \beta$ .Therefore $\boldsymbol { \theta }$ unifies the set $N$ of atomic formulas which are me bers, or compicinents of members, of the set $L \xi _ { \mathcal { C } } \bigcup \big _ { i } \exists i f _ { \eta _ { \mathcal { P } } }$ . Hence by the Unifieation Theorem $\operatorname { \ddup } _ { \varepsilon } \operatorname { \ddup } _ { \varepsilon }$ has a most gencral unificr $\sigma _ { \mathcal { N } }$ ,and there is a substitution $\lambda$ over $P$ such that $\theta \stackrel { . . . } { - } \delta _ { N } \lambda$ Hence $\mathit { \tilde { L } } _ { \mathrm { A , C } } ^ { \mathrm { s } } \sigma _ { N } \lambda \ = \mathit { \tilde { L } } _ { \mathrm { A } }$ and $\Im T \eta _ { \ell } \sigma _ { N } \lambda \ = \ \mathcal { M } \beta$ ,and thcrefore $\displaystyle { \int _ { \varepsilon } \xi _ { \varepsilon } \sigma _ { s } }$ and $\mathcal { N } \gamma _ { j , j } , j , \ j$ are singletons whose members are complements. It follows that $\langle \bar { I } , \bar { \ M } , \ N \rangle$ is $^ \mathrm { a }$ key triple of $\langle \mathcal { C } , D \rangle$ ,and hence that the clause

$$
B = ( C - L ) \xi _ { C } \sigma _ { N } \bigcup ( D - M ) _ { \eta _ { \mathcal { D } } \sigma _ { N } }
$$

is a resolvent of $\mathcal { C }$ and $\mathcal { D }$ ; hence ${ \mathit { l } } 3 \in { \mathfrak { Q } } ( { \mathfrak { S } } )$ .But since $\begin{array} { r l r } { \theta } & { { } = } & { \sigma _ { N } \lambda } \end{array}$ ,it follows by (5.5.4） that ${ \textit { A } } = { \textit { B } } $ and therefore that $A \in P ( \mathfrak { G } ( \mathcal { S } ) )$ .The proof is complete. The hypotheses of the Lemma do not entail the opposite inclusion ${ \cal { P } } \big ( \mathfrak { G } ( \mathbb { S } ) \big ) \ \subseteq$ $\mathfrak { P } ^ { \prime } ( P ( S ) )$ .As a simple counterexample,consider:

$$
\begin{array} { r } { S = \{ \{ Q ( x , f ( y ) ) \} , \{ { \sim } Q ( g ( y ) , x ) \} \} , ~ P = \{ a \} . } \end{array}
$$

A short investigation shows that $P ( \{ \} ( \tilde { \Lambda } ( \tilde { \Lambda } ) )$ contains （sincc ${ \mathfrak { G } } ( { \mathcal { S } } )$ docs）while $\mathfrak { P } _ { \mathfrak { c } } ( P ( S ) )$ does not.Thus $\ S$ is unsatisfiable,but $\boldsymbol { l } ^ { \flat }$ is not a proof set for $\check { \kappa }$

# 6. The Resolution Principle:Refutations

The single inferencc principle of our system of logic,mentioned in Section 1, is the resolulion principle, namely:From any two clauses $ { C }$ and $\mathcal { D }$ , one may infer aresolvent of $\hat { C }$ and $\boldsymbol { \mathrm { \mathit { D } } }$

By a refutation of the sct $\boldsymbol { \mathrm { \Sigma } } _ { \kappa } ^ { \mathrm { { \scriptsize { S } } } }$ of clauses we mean a finite sequence $B _ { 1 } , \cdots , B _ { n }$ of clauses such that （a）cach $B _ { i }$ ， $1 \leq i \leq n$ ,is either in $\boldsymbol { \mathrm { \Sigma } }$ or is a resolvent of two earlier clauses in the sequence,and （b） $B _ { n }$ is□.

It is immediate from the Resolution Theorem that a finite set $\boldsymbol { S }$ of clauses is unsatisfiable if and only if there is a refutation of $\mathcal { S }$ .Thus the Resolution Theorem is the completcness thcorem for our system of logic.

Two examples of refutations will illustrate the workings of the system.

Example 1. The set containing just the two clauses $C _ { 1 }$ and $\mathcal { C } _ { 2 }$ ，whcre

$$
\begin{array} { l } { { C _ { 1 } = \{ Q ( x , g ( x ) , y , h ( x , y ) , z , k ( x , y , z ) \} \} } } \\ { { \ } } \\ { { C _ { 2 } = \{ \sim Q ( u , v , e ( v ) , w , f ( v , w ) , x ) \} } } \end{array}
$$

has the refutation $\check { C } _ { \mathrm { ~ I ~ } } , \check { C } _ { \mathrm { ~ 2 ~ } }$ ，.Note that $\langle { \mathcal { C } } _ { 1 } , { \mathcal { C } } _ { 2 } \rangle$ has the key triple $\langle \mathcal { C } _ { 1 } ^ { \ast } , \mathcal { C } _ { 2 } ^ { \ast } , \mathcal { N } \rangle$ ， where $\mathcal { N }$ is the set

$$
\begin{array} { r l r } & { } & { \{ Q ( x _ { 1 } , g ( x _ { 1 } ) , x _ { 2 } , h ( x _ { 1 } , x _ { 2 } ) , x _ { 3 } , k ( x _ { 1 } , x _ { 2 } , x _ { 3 } ) ) , } \\ & { } & { Q ( y _ { 1 } , y _ { 2 } , e ( y _ { 2 } ) , y _ { 3 } , j ( y _ { 2 } , y _ { 3 } ) , y _ { 4 } ) \} . } \end{array}
$$

The reader can verify in $^ \mathrm { \textregistered }$ few minutes of computation with the Unification Algorithm that $\sigma _ { \tilde { i } \tilde { i } }$ is the substitution with the components:

$$
\begin{array} { l l l } { { y _ { 1 } / x _ { 1 } ~ , } } & { { h ( y _ { 1 } ~ , ~ \epsilon ( g ( y _ { 1 } ) ) ) / y _ { 3 } ~ } } & { { } } \\ { { g ( y _ { 1 } ) / y _ { 2 } ~ , } } & { { f ( g ( y _ { 1 } ) , ~ h ( y _ { 1 } ~ , ~ \epsilon ( g ( y _ { 1 } ) ) ) ) / x _ { 3 } ~ } } & { { } } \\ { { } } & { { \epsilon ( g ( y _ { 1 } ) ) / x _ { 2 } ~ , } } & { { k ( y _ { 1 } ~ , ~ \epsilon ( g ( y _ { 1 } ) ) , f ( g ( y _ { 1 } ) , ~ h ( y _ { 1 } ~ , ~ \epsilon ( g ( y _ { 1 } ) ) ) ) ) / y _ { 4 } ~ } } \end{array}
$$

and that then $\mathrm { C } _ { 1 } \xi _ { \perp } \sigma _ { N }$ and $\mathcal { C } _ { \widehat { \sf 2 } } \eta _ { \mathcal { C } _ { \widehat { \sf 2 } } } \sigma _ { N }$ are singletons whose mcmbers are complcments.

This example illustrates the way in which a proof set is automatically computed as a by-produet of thc resolution operation. The terms of the above substitution components become those of a proof set for $\{ \zeta _ { i } ^ { \mathrm { y } } , \zeta _ { i } ^ { \mathrm { y } } \}$ when the variable $i i _ { \downarrow }$ is replaced throughout by any term of the Herbrand universe of $\{ \mathcal { C } _ { 1 } , \mathcal { C } _ { 2 } \}$ ，e.g. by the individual constant $\therefore z$ " It is interesting to note that the earliest level of this Herbrand universe $\mathbf { \nabla } \tilde { f } \tilde { \mathbf { \nabla } }$ to include such a proof set is $H _ { 5 }$ ,which has of the order of $\sharp \{ \} ^ { \ell 4 }$ members. Consequently $H _ { 5 } \big ( \{ \vec { \tau } _ { \mathrm { ~ i ~ } , } \ \vec { \tau } _ { \mathrm { ~ i ~ } } ^ { \prime } \} \ \big )$ has of the order of $\boldsymbol { \mathrm { 1 0 ^ { 2 5 6 } } }$ mombers. A level-saturation proccdure would not find this cxample feasible.

Example 2. A more interesting example is one which was discussed in [5]. It arises froin the following algebraic problem,

Prote that in any associative system which has left and right solutions $\boldsymbol { \mathscr { x } }$ and y for all equations ${ x \cdot \alpha } = b $ and ${ a / } \vartheta = b $ ,there is $a$ right identity element.

To formalize this problem in our logic, we deny the alleged conelusion, and try to refute the set containing the clauses (where $Q ( x , y , z )$ is to mean $\it { \Psi } _ { 3 / 2 } = \it { \Psi } _ { 2 } \cdot \it { \Psi } _ { 3 / 2 }$ ：

nd right

$$
\begin{array} { r l } & { C _ { 1 } : \quad \{ \mathbf { \mathcal { \backsimeq } } Q ( x , y , u ) , \mathbf { \mathcal {  } } Q ( y , z , v ) , \mathbf { \mathcal { \sim } } Q ( x , v , w ) , Q ( u , z , w ) \} } \\ & { C _ { 2 } : \quad \{ \mathbf { \mathcal { \backsimeq } } Q ( x , y , u ) , \mathbf { \mathcal { \sim } } Q ( y , z , v ) , \mathbf { \mathcal { \sim } } Q ( u , z , w ) , Q ( x , v , w ) \} } \\ & { C _ { 3 } : \quad \{ Q ( x , y ) , \mathbf { \mathcal { \alpha } } , y \} \quad } & { \mathrm { E x i s t e n c e ~ o f ~ \ l e f t ~ a ~ } } \\ & { C _ { 4 } : \quad \{ Q ( x , h ( x , y ) , y ) \} } \\ & { C _ { 5 } : \quad \{ Q ( x , y , f ( x , y ) ) \} } & { \mathrm { C l o s u r e ~ u n d e r ~ } . } \\ & { C _ { 6 } : \quad \{ \mathbf { \mathcal { \backsimeq } } Q ( k ( x ) , x , k ( x ) ) \} } & { \mathrm { N o ~ r i g h t ~ i d e n t i t y } . } \end{array}
$$

By adding the following resolvents, we get a refutation:

$$
\begin{array} { r l } & { C _ { 7 } : \ \{ \sim Q ( y _ { 1 } , x _ { 5 } , y _ { 1 } ) , Q ( y _ { 2 } , x _ { 5 } , y _ { 5 } ) \} } \\ & { C _ { 8 } : \ \lceil \sim Q ( y _ { 1 } , y _ { 2 } , y _ { 1 } ) \} } \\ & { C _ { 9 } : \ \Gamma = } \end{array}
$$

Commentary. $C _ { 7 } ^ { 7 }$ is the resolvent of the pair $\langle C _ { 1 } , C _ { 3 } \rangle$ for the key triple

$$
\langle \{ \sim Q ( x , y , u ) , \sim Q ( x , v , w ) \} , \{ Q ( g ( x , y ) , x , y ) \} , { \cal N } \rangle
$$

where $\mathcal { N }$ is the set $\{ Q ( x _ { 4 } , x _ { 5 } , x _ { 1 } ) , Q ( x _ { 4 } , x _ { 2 } , x _ { 3 } ) , Q ( g ( y _ { 1 } , y _ { 2 } ) , y _ { 1 } , y _ { 2 } ) \}$ The $\sigma _ { \tilde { S } }$ computed for this $\mathcal { N }$ by the Unification Algorithm is

$$
\{ y _ { 2 } / x _ { 1 } , y _ { 1 } / x _ { 2 } , y _ { 2 } / x _ { 3 } , g ( y _ { 1 } , y _ { 2 } ) / x _ { 4 } , y _ { 1 } / x _ { 5 } \} ,
$$

as is easily verified. $\hat { C } _ { 8 }$ is thc only resolvent of $\langle { \cal C } _ { 6 } , { \cal C } _ { 7 } \rangle$ ,and  is the only resolvent of $\langle { C _ { 4 } ^ { \prime } , C _ { 8 } ^ { \prime } } \rangle$ ，

This oxample illustrates the way in which the single steps in a refutation made with the resolution principle go beyond,in their complexity, the capacity of the human mind to apprehend thcir correctness in one single intellectual act.By taking larger bites,so to speak, the resolution principle in this case permits a very compact, not to say clegant,piece of reasoning. $\mathrm { C _ { : } } _ { : \rangle }$ and $C _ { 5 }$ are not used as premisses in the refutation, although this has nothing to do with the resolution principle. Hence a nonredundant refutation for this exarmple is the sequence: $\mathcal { C } _ { \downarrow }$ ， $C _ { 3 }$ ： $\beta _ { s }$ ， $\ell _ { \cdot } ^ { \prime } { \mathfrak { s } }$ ， $\mathcal { C } _ { : : } ^ { \prime }$ ， $\zeta _ { 8 }$ ，□

# 7. Refutatim Procedures, Search Principles

The foregoing discusson was intended only to establish the theoretical framework, in the form of a speeial system of logic,for the design of theorem-proving programs, i.e. in the present case, refutation procedures. No attempt has been made thus far to diseuss the question of developing efficient refutation procedures,and in this final section of the paper we briefly discuss this question.

The raw implementation of thc Resolution Theorem would produce a very inefficient refutation procedure,namely,the procedure would consist of computing, given the finite sot $\mathrm { \AA }$ of clauses as input, the sequence of sets S, $( \ S _ { \ell } ( \ S ^ { \prime } )$ ， ${ \mathfrak { G } } _ { \ell } ^ { 2 } ( S ) , \cdots$ ,until one is encountered, say, ${ \mathfrak { G } } _ { \mathfrak { i } } ^ { \pi } ( { \mathfrak { S } } )$ ,which either contains $\boxed { \begin{array} { r l } \end{array} }$ 0r else does not contain  but is equal to its sucecssor $( \beta _ { 2 } ^ { n - 1 - l } ( S )$ . In the former case, $\mathfrak { a }$ refutation of $\ddot { s }$ is obtained by tracing back thc genesis of O；in the latter case the conclusion is that $\smash { \mathcal { S } ^ { \prime } }$ is satisfiable.By Church's Theorem [1] we know that for some inputs $\boldsymbol { s }$ this procedure,and in general all correct refutation procedures, will not terminate in either of these two ways but will continue computing indefinitely.

In some cases we can foresee the nonterminating behavior. Consider the example of the set $\mathcal { S }$ whose members are:

$$
C _ { 1 } : \{ Q ( a ) \} , \qquad C _ { 2 } : \{ \sim Q ( x ) , Q ( f ( x ) ) \} .
$$

(The reader will recognize this as the formulation, in our logic,of a fragment of Peano's postulates for the natural numbers, with $" Q ( x ) "$ for $^ { 6 6 } \mathfrak { x }$ isa natural number,” $\varepsilon _ { \langle \dot { a } \rangle } ,$ for ${ } ^ { \mathfrak { s c } } \ 0 , { } ^ { \mathfrak { s } } $ and $\ast \cdot \boldsymbol { f } ( \boldsymbol { x } ) ^ { \flat }$ for“the successor of $x '$ ） It is easy to see that for this $\boldsymbol { \mathrm { \mathit { S } } }$ the procedure described above would generate successively the resolvents $\{ \hat { Q } ( f ( a ) ) \}$ ， $\{ Q ( f ( f ( a ) ) ) \}$ ， $\{ Q ( f ( f ( f ( a ) ) ) ) \} \rangle$ ，，etc.，ad infinitum.

This example suggests our attempting to formulate a principle which would allow us effcetively to recognizc the particular indefinite continuation phenomenon which it exhibits,so that we might incorporate the principle into a refutation procedure and cause it to terminate for this $\mathrm { _ { 5 } }$ and for other similar examples. Such a principle,which we call the purity principle, is available, based on the notion of $\mathfrak { Q }$ literal being pure in a set $\mathcal { S }$ of clauses. We define this notion as follows.

7.1 Pure literals.If $S$ is any finite set of clauses, $C$ a clause in $\check { S }$ and $\boldsymbol { L }$ a literal in $C$ with the property that there is no key triple $\langle \lbrace { \cal L } \rbrace , { \cal M } , { \cal N } \rangle$ for any pair $\langle \mathcal { C } , D \rangle$ of clauses,where $D$ is any clause in $S \ - \ \{ \zeta \}$ ,then $L$ is said to be pure in $\ S$

The purity principle is then based on the following theorem.

PURITY THEOREM.If $\mathcal { S }$ is any finite set of clauses,and $L \in C \not \in S$ isaliteral which is mire in $\boldsymbol { \ S }$ ，then $\boldsymbol { \mathcal { S } }$ is satisfiable if and only if $\mathrm { \AA } - \mathrm { \{ } \it { C } \}$ is satisfiable.

PROOF. If $\ S$ is satisfiable then so is $S \sim \{ C \}$ since it is a subset of $\boldsymbol { \mathcal { S } }$ If $\mathrm { \Phi } { \cal S } \ - \ \{ { \cal C } \}$ is satisfiable,thcn thcre is a model $\varLambda$ of $ { \mathrm { ~ \cal { S } ~ } } \sim  { \{ C \} }$ ,every literal in which occurs in some clause of $H ( S )$ ，where $H$ is the Herbrand universe of $\smash { \ S }$ Let $N$ be the set of all ground literals $L \vartheta _ { \cdot }$ where $\pmb \theta$ is a substitution over $H$ ,and let $\kappa$ consist of all complements of members of $N$ Then thc set $P = N \cup ( A \mathrm { ~ - ~ } K )$ is $\mathfrak { a }$ model; morcover it is a model of S, since every clause in H({Ct） contains a member of P (namely a member of N), and every clause in H(S - {C}） contains a member of P,namely a member of A - K;for no clause in H(S - {C}) coutains a member of K,since otherwise, if Dβ were such a clause, with D ∈ S -{C},then there would be an M Ω D such that Mβ would be a singleton containing a member of K. Then there would be some substitution α over H such that {L/a, Afβ contained complementary singletons. Hence by the same argument as in the proof of the Lemma, there would be a key triple $\langle \{ \mathcal { X } \} , \mathcal { W } , \mathcal { N } \rangle$ of the pair $\langle { C , \ \bar { Z } } \rangle$ , contradicting the purity of $\boldsymbol { \mathcal { \bar { L } } }$ in $\mathcal { S }$ .The theorem is proved.

The purity principle is then simply the following: One may delete, from a finite set S of clauses, any clause conlaining a literal which is pure in S.

When S is the little Peano example given carlicr, i.e., is the set containing just the two clauscs

$$
{ \cal C } _ { \bf { I } } : \{ Q ( a ) \} , \qquad { \cal C } _ { \bf { 2 } } : \{ \sim Q ( x ) , Q ( f ( x ) ) \} .
$$

we see that the underlined literal in C is pure in S. Hence we may delete Cz: obtaining the set $\mathrm { { \small { S } } ~ } \sim \mathrm { { \small { \Omega } } } \{ \mathrm { { \small { C } } _ { : : } } \}$ whose only clause is

$$
\begin{array} { r l } { \mathcal { C } _ { \mathrm { ~ t ~ } } : } & { { } \mathrm { ~ \Omega ~ } _ { \mathrm { i } } ^ { \dagger } \mathcal { Q } ( \boldsymbol { a } ) \dag , } \end{array}
$$

But of course the underlincd literal is, trivially,pure in S - {Czl; hence we may delete C,obtaining thc set S - {Ci} - {Cz},which is empty, hence satisfiable. Hence by the Purity Theorem, $\xi$ is satisfiable.

Thus a refutation procedure incorporating the purity principle as well as the resolution principle “converges" for more finite sets of clauses than a procedure based on the resolution principle alone. Such prineiplcs as the purity principle we call search princeples, to distinguish them from inference principles.

There is another seareh principle which, though not increasing the range of convergence， does help to inerease the rate of convergencc, of refutation procedures. We call this principle the subsumption principle and base it on the following definition.

7.2 Subsumption. If C and D arc two distinct nonempty clauses, we say that C subsumes D just in case there is a substitution g such that Cg D.

The following theorem establishes the basic property of subsumption.

SUBSUMPrroN THEoREM. If S is any finite set of clauses,and D is any clause in S which is subsumed by some clause in S- {D},then Sis satisfiable if and onty $S \sim { \bf \Gamma } _ { \mathrm { : } } ^ { \mathrm { : } } D \}$ is satisfiable.

PROOF.We need only show that if M is a model of S- {D},then M is a model of S.Let M be a model of S - {D},and suppose that C ∈ S - {D} subsumes D. Then there is a substitution σ such that Cg ≌ D.Since D ∈ S, the terms of the components of g must be formed from function symbols in the functional vocabulary of S, together possibly with variables. Hence every ground instance of Co over H is a ground instance of C over H,and hence contains a member of M. But every ground instance DX of D ineludes the ground instance Co of C, and hence contains a member of M. So M is a model of S and the theorem is proved.

The subsumption prneiple is then simply the folowing: Onc may delete,from a fenite set $\mathcal { S }$ of clausesayclouseDwhichissubsumedbclause in $\beta  \{ \beta \}$

$\operatorname { l n }$ order to make the subsuinption prineiple availabie for ineorporation into a refutation procedure, we must give an algorithm for deciding whether oue clause $\mathcal { C }$ subsumes another clanse $\mathcal { D }$ Such an algoritin is the following Subsumption Algorithm:

Step 1.Lot $\xi _ { \vdots } ^ { \ast }$ $\Gamma _ { \eta \psi }$ beallthe distinct variables,inalphabetical orderof $\varLambda$ Let $J _ { \mathrm { ~ i ~ } } , \dots , J _ { n }$ be distinct individual constants, none of whien occur in $\zeta$ or $^ { j ) }$ Let $\hat { \theta } \quad { \approx } { * }$ $, J _ { \mathrm { ~ i ~ } } / \mathrm { ~ i ~ } ^ { * } ,$ ， $J _ { \pi : } / V _ { \pi : } \}$ .Compute $D \theta$ and go to step 2.   
Step 2.Sot $A _ { 0 } \approx \beta _ { j } ^ { \prime }$ ： $k = ~ 0$ , and go to step 3.   
Step 3.If $\mathcal { A } _ { k }$ docs not contain,let $\textit { A } _ { t + 1 }$ be the $\operatorname { s c } ; \operatorname { f } ,$ of ull clauses of the forn $( \dot { \kappa } \sigma _ { N } \cdots \dot { \iota } \rbrace \dot { \iota } \mathfrak { c } _ { N } ) ,$ where $\bar { \kappa } \in \mathcal { A } _ { k } \mathrm { ~ , ~ } \bar { \mathcal { M } } \subseteq \bar { \kappa } \mathrm { , ~ } \bar { \mathcal { N } } = \bar { \mathcal { M } } \mathrm { ~ U ~ } \{ \bar { P } \} \mathrm { , ~ } \dagger$ or somoe $I ^ { \gamma } \ _ { \mathrm { ~ \tiny ~  ~ } } ^ { \gamma } \quad I \lambda \notin$ and $\therefore$ ismost generallyuifiable with most general unifier $\pmb { \sigma } _ { N }$ ； and go to step 4. Otherwise,terminate.   
Step 4.I $\therefore i \lambda _ { k + 1 }$ is nonempty,add 1 t $\operatorname { \mathrm { \Sigma } } _ { i \setminus j } ^ { \prime } { \mathrm { \Sigma } } _ { i \setminus j } ^ { \prime }$ and return to step 3.Otherwise,terminate.

That this is an algorithm is clear from the fact that cach clause in $\mathcal { A } _ { \boldsymbol { k } + \boldsymbol { k } }$ is smaller,by at least one literal,than the clause in $\mathbf { \chi } _ { i , i } ^ { A }$ from which it was obtained, Hence,since the only clause in $\measuredangle 1 _ { 0 }$ has but finitely many literais, the sequence ${ \mathit { s i } } _ { \emptyset } , { \mathit { s i } } _ { \ ? } , \cdots$ ，must eventualiy contain a set which contains $\smash { \prod _ { s = - 1 } ^ { 2 } }$ or is empty.

That the Subsumption Algorithm is correct is shown by the following argument that it terininates in step 3 if and only if $\mathcal { C } _ { \upsilon } ^ { \mathrm { ~ \tiny ~ \mathfrak ~ { ~ \chi ~ } ~ } }$ subsumes $\mathcal { D }$

f $\mathcal { C }$ subsumes $\mathit { \Pi } _ { \mathit { 1 0 } }$ ，then $\mathit { C } \sigma \subseteq \mathit { D }$ for some $\sigma$ Hence $\langle z _ { \sigma } \theta \subseteq J \rangle \theta$ Henee $\dot { C } _ { \bf \Phi } ^ { \prime } \mu \stackrel { \zeta ^ { - } } { = }$ $D \theta$ for some $\mu$ Now assumc, for $\mathit { \hat { k } } \equiv 0$ ,that $K ( \cdot , \lambda _ { i } ) ,$ and that, for some $\mu _ { - }$ $K _ { \mu } \subseteq I ) \theta .$ If $\kappa$ is not□,let $P$ be a literal in $K \mu \cap \mathcal { D } \mathcal { Q }$ Then there is an $i k / \zeta \zeta \zeta \zeta \zeta$ such that $N \backsim ( \mathcal { M } \cup \{ P \} )$ is unificd by $\mu$ Therefore by the Unification Thcorem $\mathcal { N }$ has a most general unifier $\boldsymbol { \mathcal { O } } _ { \mathcal { N } }$ ,and the clause $G = ( { \mathit { k } } \sigma _ { N } \sim { \mathit { k } } ) \sigma _ { N } )$ isin $\boldsymbol { \mathcal { A } } _ { \boldsymbol { k } + \boldsymbol { \mathbf { j } } }$ But by the Unification Theorem $\mu = \phantom { } \sigma _ { N } \lambda$ for some $\lambda ,$ hence $K \sigma _ { \mathcal { N } } \lambda \subset D \theta$ Therefore $G \lambda \subseteq D \theta$ Since $C \ \in \ A _ { 0 }$ ,this shows that each $\boldsymbol { \mathscr { A } } _ { i } _ { : }$ ， $j _ { k } \stackrel {  } { \underset { n  \infty } { \longrightarrow } } \{ \begin{array} { r l } \end{array} \}$ ,either contains  or is nonempty.Hence the Subsumption Algorithm does not terminate in step 4. Therefore it terminates in step 3.

If the Subsumption Algorithm terminates in step 3, for $\mathit { C } _ { \lambda } ^ { \prime }$ and $\boldsymbol { D }$ as input,then there is a finite sequence $\mathrm { C } _ { 0 } \ , \ C _ { 1 } \ , \ \cdots \ , \ C _ { n + 1 }$ of clauses such that $\ell _ { \downarrow } ^ { \prime } \approx \ell$ $C _ { \cdot n + 1 } ^ { \prime } =$ $\sqcap$ ,and, for $0 \ \leq \ j \ \leq \ n$ $C _ { j + 1 } = C _ { j } \sigma _ { j } - M _ { j } \sigma _ { j }$ ，where $M N _ { j } \subseteq C _ { j } ^ { t }$ ，and $\boldsymbol { \mathcal { T } } _ { j }$ is the most general unifier of $\ M , \ U \{ P \}$ ,where $I ^ { \prime } \in \mathbb { \Gamma } I \partial \theta$ It follows that (since $M _ { j } ( \pmb { \tau } _ { j }$ contains no variables, $0 \not \equiv \ j \ \stackrel { \ll } { = } \ n$ we have

$$
\mathcal { C } _ { n \div \mathtt { i } } = \sqcup = ( \sigma _ { 0 } \sigma _ { 1 } \cdot \cdot \cdot \ \sigma _ { n } - M _ { 0 } \sigma _ { 0 } - M _ { 1 } \sigma _ { 1 } - \cdot \cdot \cdot \ \smile \ M _ { \ast } \sigma _ { n } \ ,
$$

i.e.that $C \sigma _ { 0 } \sigma _ { 1 } \ldots \sigma _ { n } \subseteq ( M _ { 0 } \sigma _ { 0 } \sqcup M _ { 1 } \sigma _ { 1 } \sqcup \ldots \sqcup M _ { n } \sigma _ { n } ) \subseteq D \theta$ Hence,for some A $, c \rangle \subseteq { \mathcal { D } } \vartheta$ Let $\sigma$ be the substitution obtained from X by the replacement,in each component of $\lambda$ of $J _ { \textrm { i } }$ by $V _ { i }$ ,for $1 \leq i \leq m$ .Then $\mathit { C } _ { \mathcal { O } } ^ { \prime } \subsetneq D$

A partieularly useful application of the subsumption principle is the following:Suppose a resolvent $\mathcal { R }$ of $\mathcal { C } ^ { \sharp }$ and $D$ subsumes one of $C , D$ ; then in adding $\mathcal { R }$ by the resolution principle we may simultaneously delete,by the subsumption principle, that one of C, D which R subsumes. This combined opcration aiounts to replacing C or D by R;accordingly we name thc prineiple involved the replacesnent principle.

The following example,used by Gilmore [4], Davis-Putnam [2] and Friedman [3], illustrates the utility of these search principles in spccding up convergence. Consider the set $\mathbb { S }$ whose members are:

$$
\begin{array} { r l } { C _ { 1 } : } & { \underbrace { \{ P ( x _ { 1 } , x _ { 2 } ) \} } _ { ( 6 ) } } \\ { C _ { 2 } : } & { \{ \underbrace { \{ \sim P ( y _ { 2 } , f ( y _ { 1 } , y _ { 2 } ) ) } , \ \sim P ( f ( y _ { 1 } , y _ { 2 } ) , f ( y _ { 1 } , y _ { 2 } ) ) } _ { ( 1 ) } , \ Q ( y _ { 1 } , y _ { 2 } ) \}  \\ { C _ { 3 } : } & { \{ \underbrace { \sim P ( y _ { 2 } , f ( y _ { 1 } , y _ { 2 } ) ) } _ { ( 3 ) } , \ \underbrace { \sim P ( f ( y _ { 1 } , y _ { 3 } ) , f ( y _ { 1 } , y _ { 2 } ) ) } _ { ( 4 ) } , \ \underbrace { \sim Q ( y _ { 1 } , f ( y _ { 1 } , y _ { 2 } ) ) } _ { ( 5 ) } , \sim Q ( f ( y _ { 1 } , y _ { 3 } ) , f ( y _ { 1 } , y _ { 2 } ) ) \} } \end{array}
$$

and we obtain the set $S ^ { \prime }$ whose only members are:

$$
\begin{array} { r l } { { \hat { C } _ { 4 } : } } & { { \{ Q ( y _ { 1 } , y _ { 2 } ) \} } } \\ { { } } & { { } } \\ { { C _ { 5 } : } } & { { \{ \sim Q ( f ( y _ { 1 } , y _ { 2 } ) , f ( y _ { 1 } , y _ { 2 } ) ) \} } } \end{array}
$$

in six stages which may be followed through by deleting the underlined literals' and the underlined clause,in the order indicated.This gives the set of clauses at each stage.Deletions(1） through (5） are by virtue of the replacement principle;deletion (6),of the entire clause $C _ { 1 }$ ,is by virtue of the purity principle. The set $\bar { s } ^ { \prime }$ in turn is found immediately to be unsatisfiable,since $C _ { 4 }$ and $C _ { 5 }$ have as their only resolvent.

Gilmore's 704 program failed to convcrgo after 21 minutes'running timc, when given this example. The morc efficient procedure of Davis and Putnam converges, for this cxample,in 3O minutes of hand computation.

The application, to a finite set $\textrm { \AA }$ of clauses, of any of the three search principles we have described, produces a set $\boldsymbol { S ^ { \prime } }$ which either has fewer clauses than $\boldsymbol { s }$ or has the same number of clauses as $\boldsymbol { \mathrm { \Sigma } } ^ { S }$ but with one or more shorter clauscs. An obvious method of exploiting these principles in a refutation procedurc is therefore never to add new clauses,by the resolution principle,except to a set to which the three prineiples are no longer applicable. We might call such scts irreducible. The way in which such a procedure would terminate,for satisfiable $\boldsymbol { \varsigma }$ within its range of convergence,would then be with a set which is either empty (as in the Peano example) or nonempty, irreducible,and with the property that each resolvent of any pair of its clauses is subsumed by some one of its elauses.

There are further search principles of this same general sort,which are less simple than those discussed in this scction. A sequel to the present paper is planned in which thc thcoretical framework developed here will be used as the basis for a more extensive treatment of search principles and of the design of refutation procecdures. This section has been merely a sketch of the general nature of the problem,and a brief view of some of the approaches to it.

Acknowledgments. I should like to express my indebtedness to my colleagucs Dr. George A. Robinson and Dr. Lawrence T. Wos, of the Argonne National Laboratory，and to Professor William Davidon of Haverford College, for their iuvaluable insights and criticisms concerning the basic concepts of this paper. My thanks are also due to the ACM referees,and to Dr. T. Hailperin of the Sandia Corporation,whosc comments on and criticisms of a prior version of the paper greatly facilitatcd the writing of the present complete revision.

RECEIVED SEPTEMBER,1963；REVISED AUGUST,1964

# REFERENCES

1.CHURcn，A. A note on the Entscheidungsproblem.J. Symb.Logic 1 (1936)，40-41. Correction,ibid.,101-102.   
2.DAvIs,M.,AND PurNAm,H. A computing procodure for quantification theory.J.ACM   
7(Mar.1960),201-215.   
3.FRiEDMAN,J. A somi-dccision procedure for the functional calculus.J.ACM 10 (Jan.   
1963), 1-24.   
4.GILMoRE,P.C.A proof method for quantification theory.IBM J.Res.Develop.4 (1960),28-35.   
5.RoBINsoN,J.A. Thcorcm-proving on thc computer.J.ACM 10 (Apr.1963)，163-174.