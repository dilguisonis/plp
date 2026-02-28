# Chapter 2

# Intuitionistic logic

The word ‘logic” is used with a variety of meanings,from common sense reasoning to sophisticated formal systems. In most cases, logic is used to classify statements as “true” or “false". That is, what we mean by logic is usually one of the many possible variants of two-valued classical logic.

Indeed, classical logic can by all means be seen as a standard wherever there is a need for precise reasoning, especially in mathematics and computer science. The principles of classical logic are extremely useful as a tool to describe and classfy the reasoning patterns occurring both in everyday life and in mathematics.

It is however important to understand the following. First of all, no sys-tem of rules can capture all of the rich and complex world of human thoughts, and thus every logic can merely be used as a limited-purpose tool rather than as an ultimate oracle, responding to all possible questions.

In addition, the principles of classical logic,although easily acceptable by our intuition,are not the only possible reasoning principles. It can be argued that from certain points of view (likely to be shared by the reader with a computing background) it is actually better to use other principles. Let us have a closer look at this.

Classical logic is based on the fundamental notion of truth. The truth of a statement is an“absolute” property of this statement, in that it is independent of any reasoning,understanding,or action. A well-formed and unambiguous declarative statement is either true or false, whether or not we (or anybody else) know it, prove it,or verify it in any possible way. Here “false” means the same as “not true, and this is expressed by the excluded middle principle (also known as tertium non datur) stating that $p \lor \lnot p$ holds no matter what the meaning of $p$ is.

Needless to say, the information contained in the claim $p \lor \lnot p$ is quite limited. Take the following sentence as an example:

There are seven 7's in a row somewhere in the decimal representation of the number $\pi$

It may very well happen that nobody will ever be able to determine the truth or falsity of the sentence above. Yet we are forced to accept that either the claim or its negation must necessarily hold. Another wel-known example is:

There erist irrational numbers $_ x$ and $y$ ， such that $x ^ { y }$ is rational.

The proof of this fact is very simple: if ${ \sqrt { 2 } } ^ { { \sqrt { 2 } } }$ is a rational number then we can take x = y= 2; otherwisetake x=2 and $y = { \sqrt { 2 } }$

The problem with this proof is that we do not know which of the two possibilities is the right one.But here is a different argument: For $x = { \sqrt { 2 } }$ and $y = 2 \log _ { 2 } 3$ ， we have $x ^ { y } = 3 \in \mathbb { Q }$ . We say the latter proof is constructive while the former is not.

Such examples demonstrate some of the drawbacks of classical logic. Indeed, in many applications we want to find an actual solution to a problem, and not merely to know that some solution exists. We thus want to sort out the proof methods that provide the actual solutions from those that do not. Therefore, from a very pragmatic point of view, it makes sense to consider a constructive approach to logic.

The logic that meets our expectations and accepts only “constructive” reasoning is traditionally known under the (slightly confusing) name of intuitionistic logic. To explain this name, one has to recall the philosophical foundations of intuitionistic logic. These may be expressed concisely and very simplified by the following principle: There is no absolute truth, there is only the knowledge and intuitive construction of the idealized mathematician, the creative subject.A logical judgement is only considered “true” if the creative subject can verify its correctness.Accepting this point of view inevitably leads to the rejection of the excluded middle as a uniform principle.As we learned from the noble Houyhnhnms [464]:

(...) reason taught us to affirm or deny only where we are certain; and beyond our knowledge we cannot do either.

# 2.1. The BHK interpretation

The language of intuitionistic propositional logic, also called intuitionistic propositional calculus (abbreviated IPC)， is the same as the language of classical propositional logic.

2.1.1.DEFINITiON. We assume an infinite set PV of propositional variables and we define the set $\Phi$ of formulas as the least set such that:

· Each propositional variable and the constant $\perp$ are in $\Phi$ ；

· If $\varphi , \psi \in \Phi$ then $( \varphi \to \psi ) , ( \varphi \lor \psi ) , ( \varphi \land \psi ) \in \Phi .$

Variables and $\perp$ are called atomic formulas. A subformula of a formula $\varphi$ is a (not necessarily proper) part of $\varphi$ ，which itself is a formula.

That is,our basic connectives are: implication ， disjunction V, conjunction $\wedge$ ,and the constant $\perp$ (absurdity). Negation $\neg$ and equivalence are abbreviations, as well as the constant $\top$ (truth):

$\neg \varphi$ abbreviates $\varphi  \bot$ ； · $\varphi  \psi$ abbreviates $( \varphi \to \psi ) \land ( \psi \to \varphi )$ · T abbreviates $\perp  \perp$ .

2.1.2. CONVENTION.

1. We often use the convention that implication is right associative, i.e. we write e.g. $\varphi \to \psi \to \vartheta$ instead of $\varphi \to ( \psi \to \vartheta )$ ·

2. We assume that negation has the highest priority,and implication the lowest，with no preference between $\vee$ and $\wedge$ That is, $\neg p \land q  r$ means $( ( \neg p ) \land q ) \to r$

3. And of course we skip the outermost parentheses.

In order to understand intuitionistic logic,one should forget the classical notion of"truth". Now our judgements about a logical statement are no longer based on any truth-value assigned to that statement,but on our ability to justify it via an explicit proof or “construction". As a consequence of this we should not attempt to define propositional connectives by means of truthtables (as it is normally done for classical logic). Instead, we should explain the meaning of compound formulas in terms of their constructions.

Such an explanation is often given by means of the so-called Brouwer-Heyting-Kolmogorov interpretation,in short BHK interpretation. One can formulate the BHK interpretation as the following set of rules,the algorithmic flavor of which will later lead us to the Curry-Howard isomorphism.

· A construction of $\varphi _ { 1 } \wedge \varphi _ { 2 }$ consists of a construction of $\varphi _ { 1 }$ and a construction of $\varphi _ { 2 }$ ;   
· A construction of $\varphi _ { 1 } \lor \varphi _ { 2 }$ consists of an indicator $i \in \{ 1 , 2 \}$ and a construction of $\varphi _ { i }$ ；   
· A construction of φ1 → 2 is a method (function) transforming every construction of $\varphi _ { 1 }$ into a construction of $\varphi _ { 2 }$ ;   
. There is no construction of $\perp$ .1

We do not specify what a construction of a propositional variable is. This is because the meaning of a propositional variable becomes only known when the variable is replaced by a concrete statement.Then we can ask about the construction of that statement.In contrast,the constant $\perp$ represents a statement with no possible construction at all.

Negation $\neg \varphi$ is understood as the implication $\varphi  \bot$ . That is, we may assert $\neg \varphi$ when the assumption of $\varphi$ leads to absurdity. In other words:

· A construction of $\neg \varphi$ is a method that turns every construction of $\varphi$ into a nonexistent object.

The equivalence of $\neg \varphi$ and $\varphi  \perp$ holds also in classical logic.But note that the intuitionistic $\neg \varphi$ is stronger than just “there is no construction of $\varphi ^ { \mathfrak { N } }$

The reader should be aware that the BHK interpretation is by no means intended to make a precise and complete description of constructive semantics.The very notion of“construction” is informal and can be understood in a variety of ways.

2.1.3.ExAMPLE. Consider the following formulas:

(i) $\perp  p ;$   
(ii) $p \to q \to p ;$   
(ii) $( p \to q \to r ) \to ( p \to q ) \to p \to r ;$   
(iv) $p \to \neg \neg p$   
(v) $\neg \neg \neg p \to \neg p ;$   
(vi) $( p \to q ) \to ( \neg q \to \neg p ) ;$   
(vii) $\neg ( p \lor q )  ( \neg p \land \neg q )$   
(vi) $( ( p \land q ) \to r )  ( p \to ( q \to r ) ) ;$   
(ix) $\neg \neg ( p \lor \neg p )$ ； $( \mathrm { \bf x } ) ( p \lor \neg p ) \to \neg \neg p \to p .$

All these formulas can be given a BHK interpretation.For instance,a con-struction for formula (i) is based on the safe assumption that a construction of $\perp$ is impossible. (In contrast，we do not have a construction of $q  p$ because we cannot generally rule out the existence of a construction of q.) A construction for formula (iv), that is, for $p \to ( ( p \to \bot ) \to \bot )$ , is as follows:

Given a construction of $p$ ,here is a construction of $( p \to \bot ) \to \bot$ ： Take a construction of $p  \bot$ . It is a method to translate con-structions of p into constructions of ⊥. As we have a construction of p,we can use this method to obtain a construction of ⊥.

The reader is invited to discover the BHK interpretation of the other formulas (Exercise 2.2).

Of course all the formulas of Example 2.1.3 are classical tautologies. But not every classical tautology can be given a construction.

2.1.4. ExAMPLE. Each of the formulas below is a classical tautology. Yet none appears to have a construction, despite the fact that some of them are similar or “dual” to certain formulas of the previous example.

(i) $( ( p \to q ) \to p ) \to p ;$ (ii) $p \lor \lnot p ;$ (ii) $\neg \neg p \to p ;$ (iv) $( \neg q \to \neg p ) \to ( p \to q ) ;$ (v) $\neg ( p \land q )  ( \neg p \lor \neg q ) ;$ (vi) $( p \to q ) \to ( \neg p \to q ) \to q ;$ (vii) $( ( p  q )  r )  ( p  ( q  r ) ) ;$ (vii) $( p \to q )  ( \neg p \lor q ) ;$ (ix) $( p \lor q \to p ) \lor ( p \lor q \to q ) ;$ $( \mathbf { x } ) \ ( \neg \neg p \to p ) \to p \lor \neg p .$

For instance, formula (ii） seems to express the same principle as Example 2.1.3(iv). Similarly, formula (iv) and Example 2.1.3(vi) are often treated as two equivalent patterns of a proof by contradiction. Formula (v) and Example 2.1.3(vii) are both known as De Morgan's laws,and express the classical duality between conjunction and disjunction.

Such examples show that the symmetry of classical logic disappears when we turn to constructive semantics,and this is obviously due to the fact that negation is no longer an involution,i.e. $\varphi$ and $\neg \neg \varphi$ cannot be identified with each other anymore. Note however that formula (ii) expresses a property weaker than (ii), because we do not have a construction of $\mathbf { \tau } ( \mathbf { x } )$

Not very surprisingly, proofs by cases (vi) are not constructive. Indeed, this is a simple consequence of the unavailability of the excluded middle-we just cannot a priori split the argument into cases. But it may be a surprise to observe that not only negation or falsity may cause difficulties. Formula (i), known as Peirce's law, is purely implicational, but still we are unable to find a construction. Another example of this kind is formula (vii) expressing the classical associativity of equivalence. One can verify it using a binary truthtable,but from the constructive point of view this associativity property seems to be purely accidental.

Formula (vii) can be seen as a defnition of classical implication in terms of negation and disjunction. Constructively, this definition does not work. We can say more: None among ，⊥,V,^ is definable from the others (see Exercise 2.26).

# 2.2. Natural deduction

In order to formalize the intuitionistic propositional logic,we define a proof system，called natural deduction， and denoted by $\mathrm { N J } ( \to , \bot , \land , \lor )$ ,or sim-ply NJ. The rules of natural deduction express in a precise way the ideas of the informal semantics of Section 2.1.

2.2.1. DEFINITION.

(i) A judgement in natural deduction is a pair, written $\Gamma \vdash \varphi$ (and read ${ } ^ { 6 6 }  { \Gamma }$ proves $\varphi ^ { \mathfrak { N } }$ ） consisting of a finite set of formulas $\Gamma$ and a formula $\varphi$   
(ii) We use various simplifications when we deal with judgements. For instance, we write $\varphi _ { 1 } , \varphi _ { 2 } \vdash \psi$ instead of $\{ \varphi _ { 1 } , \varphi _ { 2 } \} \vdash \psi$ ，or $\Gamma , \Delta$ instead of $\Gamma \cup \Delta$ ，or $\Gamma , \varphi$ instead of $\Gamma \cup \{ \varphi \}$ . In particular, the notation $+ ~ \varphi$ stands for $\emptyset \vdash \varphi$   
(iii) A formal proof or derivation of $\Gamma \vdash \varphi$ is a finite tree of judgements satisfying the following conditions: · The root label is Γ├; · All the leaves are axioms, i.e. judgements of the form $\Gamma , \varphi \vdash \varphi ;$ · The label of each mother node is obtained from the labels of the daughters using one of the rules in Figure 2.1.

If such a proof exists,we say that the judgement $\Gamma \vdash \varphi$ is provable or derivable, and we write $\Gamma \vdash _ { N } \varphi$ For infinite $\Gamma$ ，we write $\Gamma \vdash _ { N } \varphi$ to mean that $\Gamma _ { 0 } \vdash _ { N } \varphi$ ,for some finite subset $\Gamma _ { 0 }$ of $\Gamma$

(iv) It is customary to omit the index $N$ in $\vdash _ { N }$ . Note that in this way the notation $\Gamma \vdash \varphi$ becomes overloaded. It expresses the provability of a judgement and also denotes the judgement itself. However, the intended meaning is usually clear from the context.

(v） If $\vdash \varphi$ then we say that $\varphi$ is a theorem.2

The proof system consists of an axiom scheme and rules. For each logical connective (except $\perp$ ） we have one or two introduction rules and one or two elimination rules. An introduction rule for a connective o tells us how a conclusion of the form $\varphi \circ \psi$ can be derived. An elimination rule describes the

$$
\Gamma , \varphi \vdash \varphi \ ( \mathbf { A x } )
$$

$$
\frac { \Gamma \vdash \varphi \land \psi } { \Gamma \vdash \varphi } ( \land \mathtt { E } ) \frac { \Gamma \vdash \varphi \land \psi } { \Gamma \vdash \psi }
$$

way in which $\varphi \circ \psi$ can be used to derive other formulas. Observe that the natural deduction rules can be seen as a formalization of the BHK interpretation，where“construction” should be read as “proof". Indeed, consider for instance the implication. The premise $\Gamma , \varphi \vdash \psi$ of rule $( \neg \mathbf { I } )$ can be understood as the ability to infer $\psi$ from $\Gamma$ if a proof of $\varphi$ is provided. This is enough to derive the implication. The elimination rule $(  \mathbf { E } )$ corresponds to the same idea: if we have a proof of $\varphi \to \psi$ then we can turn a proof of $\varphi$ into a proof of $\psi$ . In a sense, rule $(  \mathbf { E } )$ can be seen as a converse of rule $( \neg \mathrm { I } )$ ， and a similar observation (called the inversion principle, see Prawitz [403]) can be made about the other connectives. Rule (⊥E), called ex falso sequitur quodlibet (or simply ex falso) is an exception, because there is no matching introduction rule.

2.2.2.NoTATiON. It is sometimes useful to consider fragments of propositional logic where some connectives do not occur. For instance, in Section 2.6 we discuss the implicational fragment $\mathrm { I P C } (  )$ of the intuitionistic propositional logic. The subsystem of NJ consisting of the axiom scheme and rules for implication is then denoted by $\mathrm { { N J } } ( \to )$ . This convention applies to other fragments, e.g. $\displaystyle \mathrm { I P C } ( \to , \land , \lor )$ is the positive fragment, called also minimal logic,and $\mathrm { N J } ( \to , \land , \lor )$ stands for the appropriate part of NJ.

2.2.3. ExAMPLE. We give example proofs of our favourite formulas. Below, formulas $\varphi , \psi$ and $\vartheta$ can be arbitrary:

$$
{ \frac { \varphi \vdash \varphi } { \vdash \varphi \to \varphi } } \left( \to { \mathrm { I } } \right)
$$

$$
\begin{array} { c } { { \displaystyle \frac { \varphi , \psi \vdash \varphi } { \varphi \vdash \psi \to \varphi } (  \mathrm { I } ) } } \\ { { \displaystyle \frac { \varphi \vdash \psi  \varphi } { \vdash \varphi  ( \psi  \varphi ) } (  \mathrm { I } ) } } \end{array}
$$

(ii)  Here, $\Gamma$ abbreviates $\{ \varphi  ( \psi  \vartheta ) , \varphi  \psi , \varphi \}$

$$
\begin{array} { r l } & { \frac { \Gamma \vdash \varphi \to ( \psi \to \vartheta ) \Gamma \vdash \varphi } { \Gamma \vdash \psi \to \vartheta } ( \to \mathbf { E } ) \qquad \frac { \Gamma \vdash \varphi \to \psi \Gamma \vdash \varphi } { \Gamma \vdash \psi } ( \to \mathbf { E } ) } \\ & { \qquad \frac { \Gamma \vdash \vartheta } { \varphi \to ( \psi \to \vartheta ) , \varphi \to \psi \vdash \varphi \to \vartheta } ( \to \mathbf { E } ) } \\ & { \qquad \frac { \overline { { \varphi \to ( \psi \to \vartheta ) , \varphi \to \psi \vdash \varphi \to \vartheta } } ( \to \Gamma ) } { \varphi \to ( \psi \to \vartheta ) \vdash ( \varphi \to \psi ) \to ( \varphi \to \vartheta ) } ( \to \Gamma ) } \\ & { \qquad \frac { \overline { { \varphi \to ( \psi \to \vartheta ) \vdash ( \varphi \to \psi ) } } \to ( \varphi \to \vartheta ) \to ( \varphi \to \vartheta ) } { \vdash ( \varphi \to ( \psi \to \vartheta ) ) \to ( \varphi \to \psi ) \to ( \varphi \to \vartheta ) } ( \to \mathrm { I } ) } \end{array}
$$

2.2.4. LEMMA. Intuitionistic propositional logic is closed under weakening and substitution, that is, $\Gamma \vdash \varphi$ implies $\Gamma , \psi \vdash \varphi$ and $\Gamma [ p : = \psi ] \vdash \varphi [ p : = \psi ]$ ， where $[ p : = \psi ]$ denotes a substitution of $\psi$ for all occurrences of the propositional variable $p$

PROOF. Induction with respect to the size of proofs (Exercise 2.3).

Results like the above are sometimes expressed by saying that the following are derived (or admissible) rules of propositional intuitionistic logic:

$$
{ \frac { \Gamma \vdash \varphi } { \Gamma , \psi \vdash \varphi } } \qquad { \frac { \Gamma \vdash \varphi } { \Gamma [ p : = \psi ] \vdash \varphi [ p : = \psi ] } }
$$

# Chapter 6

# Classical logic and control operators

In the previous chapters we have encountered the Curry-Howard isomorphism in various incarnations. Each of these states a correspondence between some calculus for computation and a system of formal logic. Until now these systems of formal logic have been intuitionistic; for instance, in none of them have we been able to derive the principle of double negation elimination $\neg \neg \varphi \to \varphi$ that one finds in classical logics.

This is by no means a coincidence. Until around 1990 it was believed by many that “there is no Curry-Howard isomorphism for classical logic.”However,at that time Timothy Griffin discovered that the principle of double negation elimination corresponds to the typing of a control operator known from programming language theory. The idea was soon generalized and refined by Chet Murthy.

This chapter presents the discovery and its consequences, e.g. the result that Kolmogorov's double negation embedding of classcal logic into intuitionistic logic corresponds to a continuation passing style translation.

# 6.1. Classical propositional logic

Classical logic differs from intuitionistic logic by embracing these principles:

(i) Tertium non datur (law ofthe ercluded middle): $\varphi \lor \lnot \varphi$ .Either $\varphi$ holds, or $\varphi$ does not hold.   
(ii) Double negation elimination: $\neg \neg \varphi \to \varphi$ . If it is not the case that $\varphi$ does not hold, then $\varphi$ holds.   
(i) Peirce's law: $( ( \varphi \to \psi ) \to \varphi ) \to \varphi .$   
(iv) Reductio ad absurdum: $( \neg \varphi \to \varphi ) \to \varphi$ . If the assumption that $\varphi$ does not hold implies $\varphi$ ，then $\varphi$ must hold.

A natural deduction system for classical propositional calculus (CPC) is obtained by replacing the ex falso rule in intuitionistic logic (see Figure 2.1) with a rule for double negation elimination. We study the implicational fragment with absurdity; negation is defined using absurdity as usual.

6.1.1. DEFINITION. The natural deduction presentation $\operatorname { N K } ( \to , \bot )$ ,of classical propositional calculus for implication and absurdity, is defined by the axiom and rules in Figure 6.1. We write $\Gamma \vdash _ { N } \varphi$ when $\Gamma \vdash \varphi$ can be derived in this system (we sometimes leave out “N"). We use the same terminology, notations, and conventions as in Chapter 2.

# 6.1.2. ExAMPLE.

(i) The following is a derivation of the formula $\left( \varphi \to \psi \right) \to \left( \neg \varphi \to \psi \right) \to \psi$ ("proof by cases"). Let $\Gamma = \{ \varphi  \psi , \lnot \varphi  \psi , \lnot \psi \}$

(ii) The following is a derivation of Peirce's law. Let $\boldsymbol { \Gamma } = \{ ( \varphi \to \psi ) \to \varphi \}$

$$
\begin{array} { r } { \frac { \frac { \Gamma , \neg \varphi , \varphi , \dotsc \psi \vdash  \varphi } { \frac { \Gamma , \neg \varphi , \varphi , \dotsc \psi \vdash \varphi , \dotsc \psi \vdash \varphi } { \frac { \Gamma , \neg \varphi , \varphi , \dotsc \psi \vdash \dotsc } { \varphi } } } } { \frac { \Gamma , \neg \varphi , \varphi , \dotsc \psi \vdash \dotsc } { \frac { \Gamma , \neg \varphi , \varphi \vdash \psi } { \Gamma , \neg \varphi \vdash \psi } } } } \\ { \frac { \Gamma , \neg \varphi \vdash \varphi } { \textnormal { \texttt { e } } ^ { + } \frac { \Gamma , \neg \varphi \vdash ( \varphi  \psi )  \varphi } { \Gamma , \neg \varphi \vdash \varphi } } } { \frac { \Gamma , \neg \varphi \vdash \varphi } { \Gamma + \varphi } }  \\ { \frac { \frac { \Gamma , \neg \varphi \vdash \bot } { \Gamma \vdash \varphi } } { \Gamma \vdash ( ( \varphi  \psi )  \varphi )  \varphi } } \end{array}
$$

$$
\frac { \Gamma , \varphi \to \bot \vdash \bot } { \Gamma \vdash \varphi } \left( \lnot \mathrm { E } \right)
$$

6.1.3.ExAMPLE. Ex falso is a derived rule in $\mathrm { N K } (  , \perp )$ . That is, if $\Gamma \vdash \bot$ then also $\Gamma \vdash \varphi$ Indeed,assume we have a derivation of $\Gamma \vdash \perp$ . By adding $\neg \varphi$ to all environments in this derivation,we obtain a derivation of $\Gamma , \neg \varphi \vdash \bot$ Then $\Gamma \vdash \varphi$ by the $( \neg \mathbf { E } )$ rule.

6.1.4. COROLLARY. If $\Gamma \vdash \varphi$ in $\mathrm { N J } ( \to , \bot )$ ，then $\Gamma \vdash \varphi$ in $\mathrm { N K } (  , \perp )$

PROOF. By induction on the derivation of $\Gamma \vdash \varphi$ ,using Example 6.1.3.

6.1.5.REMARK. An alternative to the rule $\left( \neg \mathbf { E } \right)$ of Figure 6.1 are the following two rules, namely ex falso and a form of Peirce's law.

$$
{ \frac { \Gamma \vdash \ \bot } { \Gamma \vdash \ \varphi } } ( \bot \mathbf { E } ) \qquad { \frac { \Gamma , \varphi \to \psi \vdash \varphi } { \Gamma \vdash \varphi } } ( \mathbf { P } ) .
$$

Using the rules $( \to \mathbf { E } ) , ( \to \mathbf { I } )$ ,and $( \mathbf { A x } )$ , the two above rules can be derived from $\left( \neg \mathbf { E } \right)$ -see Examples 6.1.2 and 6.1.3-and vice versa.

Moreover,we can replace the rule (P) by the special case (P⊥),which is very similar to the formula (iv) mentioned in the introduction:

$$
\frac { \Gamma , \varphi \to \bot \vdash \varphi } { \Gamma \vdash \varphi } ( \mathrm { P \bot } ) .
$$

Using ex falso, (P) can be derived from $( \mathbb { P } \bot )$

In the case of Hilbert-style systems, there are several ways to obtain classical logic from intuitionistic logic. The following is one possibility.

6.1.6.DEFINITiON. We consider the same terminology and notation as in Chapter 5. The language of propositions is extended with ⊥,and we use the

abbreviation $\lnot \varphi = \varphi \to \bot$ again. The Hilbert-style system for classical logic is obtained by adding the following axiom scheme:

$$
( A 3 _ { \perp } ) \ ( ( \varphi  \perp )  \perp )  \varphi
$$

to the system with $( A 1 )$ and (A2). We write $\Gamma \vdash _ { H } \varphi$ if $\Gamma \vdash \varphi$ can be derived in the system from Definition 5.1.2 with these three axioms.

The following is an immediate consequence of Theorem 5.1.8,because classcal provability can be seen as intuitionistic provability with some additional axioms.

6.1.7. THEOREM (Deduction theorem). $\Gamma , \varphi \vdash _ { H } \psi$ ff $\Gamma \vdash _ { H } \varphi  \psi$

6.1.8. PROPOSITION. $\Gamma \vdash _ { N } \varphi$ $\Gamma \vdash _ { H } \varphi$

PROOF. The only new issue compared to the intuitionistic case is to show that one can express $\left( \neg \mathbf { E } \right)$ using $( A 3 _ { \perp } )$ and vice versa. For the former,assume that we have a Hilbert-style derivation of $\Gamma , \lnot \varphi \vdash \bot$ . Then by the deduction theorem, $( A 3 _ { \perp } )$ ， and modus ponens we obtain a derivation of $\Gamma \vdash \varphi$ Conversely, the natural deduction derivation

$$
\frac { \Gamma , \pi \pi \varphi , \pi \varphi \vdash \lnot \varphi \quad \Gamma , \lnot \pi \varphi , \lnot \varphi \vdash \lnot \varphi } { \frac { \Gamma , \lnot \lnot \varphi , \lnot \varphi \vdash \ell } { \frac { \Gamma , \lnot \ l \varphi \vdash \varphi } { \Gamma \vdash \lnot \varphi  \varphi } } }
$$

shows that one can express $( A 3 _ { \perp } )$ using $\left( \neg \mathbf { E } \right)$

In view of the above proposition it is natural to talk about “classical propositional calculus” independently of the chosen formalism.

6.1.9.NoTATION. The phrase “theorem of $\mathrm { C P C } (  , \perp ) ^ { \mathfrak { N } }$ means a formula that can be proved in $\mathrm { N K } (  , \perp )$ ， or in the Hilbert-style system of Definition 6.1.6,or in any other equivalent system. Similar terminology will be employed for other sets of connectives, e.g. including $\wedge$ and $\vee$

6.1.10.THEoREM (Completeness). Every theorem of $\mathrm { C P C } (  , \bot )$ is a classical tautology， and vice versa.

PROOF (Kalmar, 1935). We show that $\vdash _ { H } \varphi$ iff $\varphi$ is a tautology. From left to right, show that the three axioms are tautologies,and show the following property: if $\varphi \to \psi$ is a tautology and $\varphi$ is a tautology, so is $\psi$

For the direction from right to left，we proceed as follows. Given a valuation $v$ ，let

$$
\psi ^ { \prime } = { \left\{ \begin{array} { l l } { \psi } & { { \mathrm { i f ~ } } [ \psi ] | _ { v } = 1 } \\ { \neg \psi } & { { \mathrm { i f ~ } } [ \| \psi \| _ { v } = 0 . } \end{array} \right. }
$$

We show the following claim: for any valuation $v$ and formula $\varphi$ ，

$$
p _ { 1 } ^ { \prime } , \ldots , p _ { n } ^ { \prime } \vdash \varphi ^ { \prime } ,
$$

where $p _ { 1 } , \ldots , p _ { n }$ include all the propositional variables in $\varphi$ . The proof of this result is by induction on $\varphi$ . The only interesting case is when $\varphi = \varphi _ { 1 }  \varphi _ { 2 }$ We consider three subcases.

CASE 1: $\mathbb { J } \varphi _ { 1 } \mathbb { J } _ { v } = 0$ . Then $[ [ \varphi _ { 1 }  \varphi _ { 2 } ] ] _ { v } = 1$ .By the induction hypothesis,

$$
p _ { 1 } ^ { \prime } , \ldots , p _ { n } ^ { \prime } \vdash \lnot \varphi _ { 1 } .
$$

Now prove $\vdash \lnot \varphi _ { 1 } \to ( \varphi _ { 1 } \to \varphi _ { 2 } )$ and use modus ponens to obtain:

$$
p _ { 1 } ^ { \prime } , \ldots , p _ { n } ^ { \prime } \vdash \varphi _ { 1 }  \varphi _ { 2 } .
$$

CASE 2: $\mathbb { J } \varphi _ { 2 } \mathbb { J } _ { v } = 1$ .Then $[ \varphi _ { 1 }  \varphi _ { 2 } ] _ { \upsilon } = 1$ By the induction hypothesis, $p _ { 1 } ^ { \prime } , \ldots , p _ { n } ^ { \prime } \vdash \varphi _ { 2 }$ . Then use axiom (A1) and modus ponens to obtain:

$$
p _ { 1 } ^ { \prime } , . . . , p _ { n } ^ { \prime } \vdash \varphi _ { 1 }  \varphi _ { 2 } .
$$

CASE 3 $\mathbb { J } \varphi _ { 1 } \mathbb { J } _ { v } = 1$ and $\mathbb { J } \varphi _ { 2 } \mathbb { J } = 0$ Then $[ \varphi _ { 1 }  \varphi _ { 2 } ] _ { v } = 0$ .By the induction hypothesis,

$$
p _ { 1 } ^ { \prime } , \ldots , p _ { n } ^ { \prime } \vdash \varphi _ { 1 } \qquad p _ { 1 } ^ { \prime } , \ldots , p _ { n } ^ { \prime } \vdash \lnot \varphi _ { 2 } .
$$

Now prove $p _ { 1 } ^ { \prime } , \ldots , p _ { n } ^ { \prime } \vdash \varphi _ { 1 } \longrightarrow \neg \varphi _ { 2 } \longrightarrow \neg ( \varphi _ { 1 } \longrightarrow \varphi _ { 2 } )$ . Then by modus ponens,

$$
p _ { 1 } ^ { \prime } , . . . , p _ { n } ^ { \prime } \vdash \lnot ( \varphi _ { 1 } \to \varphi _ { 2 } ) .
$$

This concludes the proof of $( * )$ . Now let $\varphi$ be a tautology with propositional variables $p _ { 1 } , \ldots , p _ { n }$ . We show for all $i \in \{ 0 , \ldots , n \}$ and each valuation $^ v$ that

$$
p _ { 1 } ^ { \prime } , \ldots , p _ { i } ^ { \prime } \vdash \varphi .
$$

The desired result is then the special case $i = 0$

The proof is by induction on $n - i$ .If $i = n$ , the claim follows from $( * )$ If $i < n$ ,let $_ v$ be any valuation. Consider the two diferent valuations arising from $_ v$ by assigning O and 1 to $p _ { i + 1 }$ . We have by the induction hypothesis that $p _ { 1 } ^ { \prime } , \ldots , p _ { i } ^ { \prime } , p _ { i + 1 } \vdash \varphi$ and $p _ { 1 } ^ { \prime } , \ldots , p _ { i } ^ { \prime } , \lnot p _ { i + 1 } \vdash \varphi$ ，and then also $p _ { 1 } ^ { \prime } , \ldots , p _ { i } ^ { \prime } \vdash \varphi$ using Example 6.1.2. □

Since every theorem is a classical tautology, consistency follows,i.e. $\forall \perp$ In fact,our logic is maximally consistent in the following sense.

6.1.11. PROPOSITION． Let $\varphi$ be a formula which is not a tautology. Consider the system $z$ obtained from Definition 6.1.6 by adding $\varphi$ as an axiom scheme. The system $z$ is inconsistent.

PROOF. Let $p _ { 1 } , \ldots , p _ { n }$ be the propositional letters in $\varphi$ . Since $\varphi$ is not a tautology there is a valuation $_ v$ such that $[ | \varphi | ] _ { v } = 0$ . Then let

$$
\psi _ { i } = { \left\{ \begin{array} { l l } { p _ { i } \to p _ { i } } & { { \mathrm { i f ~ } } v ( p _ { i } ) = 1 } \\ { \neg ( p _ { i } \to p _ { i } ) } & { { \mathrm { i f ~ } } v ( p _ { i } ) = 0 . } \end{array} \right. }
$$

Let $\psi$ be obtained from $\varphi$ by replacing all $p _ { i }$ by $\psi _ { i }$ . We have $\vdash \psi$ in $z$ However, $\mathbb { [ } \psi ] _ { u } = 0$ for all valuations $\boldsymbol { u }$ ，s0 $[ \neg \psi ] _ { u } = 1$ . By completeness, $\vdash \lnot \psi$ in classical logic,and hence also in $Z$ . Thus $\vdash \bot$ in $Z$ □

Thus,with classical logic the addition of new axiom schemes must come to an end; otherwise, the system becomes inconsistent.