# Chapter 2

# Definite Logic Programs

# 2.1 Definite Clauses

The idea of logic programming is to use a computer for drawing conclusions from declarative descriptions. Such descriptions — called logic programs — consist of finite sets of logic formulas. Thus, the idea has its roots in the research on automatic theorem proving. However, the transition from experimental theorem proving to applied logic programming requires improved efficiency of the system. This is achieved by introducing restrictions on the language of formulas — restrictions that make it possible to use the relatively simple and powerful inference rule called the SLD-resolution principle. This chapter introduces a restricted language of definite logic programs and in the next chapter their computational principles are discussed. In subsequent chapters a more unrestrictive language of so-called general programs is introduced. In this way the foundations of the programming language Prolog are presented.

To start with, attention will be restricted to a special type of declarative sentences of natural language that describe positive facts and rules. A sentence of this type either states that a relation holds between individuals (in case of a fact), or that a relation holds between individuals provided that some other relations hold (in case of a rule). For example, consider the sentences:

(i ) “Tom is John’s child”   
(ii ) “Ann is Tom’s child”   
(iii ) “John is Mark’s child”   
(iv ) “Alice is John’s child”   
$( v )$ “The grandchild of a person is a child of a child of this person”

These sentences may be formalized in two steps. First atomic formulas describing facts are introduced:

$$
\begin{array} { l } { c h i l d ( t o m , j o h n ) } \\ { c h i l d ( a n n , t o m ) } \\ { c h i l d ( j o h n , m a r k ) } \\ { c h i l d ( a l i c e , j o h n ) } \end{array}
$$

Applying this notation to the final sentence yields:

“For all $X$ and $Y$ , grandchil $d ( X , Y )$ if there exists a $Z$ such that child(X, Z) and child(Z, Y )”

This can be further formalized using quantifiers and the logical connectives “ $\supset$ ” and “ $\wedge$ ”, but to preserve the natural order of expression the implication is reversed and written “ $\longleftarrow$ ”:

$$
\forall X \forall Y ( g r a n d c h i l d ( X , Y ) \longleftarrow \exists Z ( c h i l d ( X , Z ) \land c h i l d ( Z , Y ) ) )
$$

This formula can be transformed into the following equivalent forms using the equivalences given in connection with Definition 1.15:

$$
\begin{array} { r l } & { \forall X \forall Y ( g r a n d c h i l d ( X , Y ) \forall \neg \exists Z ( c h i l d ( X , Z ) \land c h i l d ( Z , Y ) ) ) } \\ & { \forall X \forall Y ( g r a n d c h i l d ( X , Y ) \vee \forall Z \neg ( c h i l d ( X , Z ) \land c h i l d ( Z , Y ) ) ) } \\ & { \forall X \forall Y \forall Z ( g r a n d c h i l d ( X , Y ) \vee \neg ( c h i l d ( X , Z ) \land c h i l d ( Z , Y ) ) ) } \\ & { \forall X \forall Y \forall Z ( g r a n d c h i l d ( X , Y ) \gets ( c h i l d ( X , Z ) \land c h i l d ( Z , Y ) ) ) } \end{array}
$$

We now focus attention on the language of formulas exemplified by the example above. It consists of formulas of the form:

$$
A _ { 0 }  A _ { 1 } \land \cdots \land A _ { n } \quad ( { \mathrm { w h e r e ~ } } n \geq 0 )
$$

or equivalently:

$$
A _ { 0 } \lor \neg A _ { 1 } \lor \cdots \lor \neg A _ { n }
$$

where $A _ { 0 } , \ldots , A _ { n }$ are atomic formulas and all variables occurring in a formula are (implicitly) universally quantified over the whole formula. The formulas of this form are called definite clauses. Facts are definite clauses where $n = 0$ . (Facts are sometimes called unit-clauses.) The atomic formula $A _ { 0 }$ is called the head of the clause whereas $A _ { 1 } \land \cdots \land A _ { n }$ is called its body.

The initial example shows that definite clauses use a restricted form of existential quantification — the variables that occur only in body literals are existentially quantified over the body (though formally this is equivalent to universal quantification on the level of clauses).

# 2.2 Definite Programs and Goals

The logic formulas derived above are special cases of a more general form, called clausal form.

Definition 2.1 (Clause) A clause is a formula $\forall ( L _ { 1 } \lor \cdots \lor L _ { n } )$ where each $\boldsymbol { L } _ { i }$ is an atomic formula (a positive literal) or the negation of an atomic formula (a negative literal). ■

As seen above, a definite clause is a clause that contains exactly one positive literal. That is, a formula of the form:

$$
\forall ( A _ { 0 } \lor \neg A _ { 1 } \lor \cdots \lor \neg A _ { n } )
$$

The notational convention is to write such a definite clause thus:

$$
A _ { 0 }  A _ { 1 } , \dotsc , A _ { n } \quad ( n \geq 0 )
$$

If the body is empty (i.e. if $n = 0$ ) the implication arrow is usually omitted. Alternatively the empty body can be seen as a nullary connective $-$ which is true in every interpretation. (Symmetrically there is also a nullary connective $\sqcap$ which is false in every interpretation.) The first kind of logic program to be discussed are programs consisting of a finite number of definite clauses:

Definition 2.2 (Definite programs) A definite program is a finite set of definite clauses.

To explain the use of logic formulas as programs, a general view of logic programming is presented in Figure 2.1. The programmer attempts to describe the intended model by means of declarative sentences (i.e. when writing a program he has in mind an algebraic structure, usually infinite, whose relations are to interpret the predicate symbols of the program). These sentences are definite clauses — facts and rules. The program is a set of logic formulas and it may have many models, including the intended model (Figure 2.1(a)). The concept of intended model makes it possible to discuss correctness of logic programs — a program $P$ is incorrect iff the intended model is not a model of $P$ . (Notice that in order to prove programs to be correct or to test programs it is necessary to have an alternative description of the intended model, independent of $P$ .)

The program will be used by the computer to draw conclusions about the intended model (Figure 2.1(b)). However, the only information available to the computer about the intended model is the program itself. So the conclusions drawn must be true in any model of the program to guarantee that they are true in the intended model (Figure 2.1(c)). In other words — the soundness of the system is a necessary condition. This will be discussed in Chapter 3. Before that, attention will be focused on the practical question of how a logic program is to be used.

The set of logical consequences of a program is infinite. Therefore the user is expected to query the program selectively for various aspects of the intended model. There is an analogy with relational databases — facts explicitly describe elements of the relations while rules give intensional characterization of some other elements.

![](images/164e2ead5b991c7b83c1b99df98882f33a9baf67c27038180ce961d12a9c4553.jpg)  
Figure 2.1: General view of logic programming

Since the rules may be recursive, the relation described may be infinite in contrast to the traditional relational databases. Another difference is the use of variables and compound terms. This chapter considers only “queries” of the form:

$$
\forall ( \neg ( A _ { 1 } \land \cdots \land A _ { m } ) )
$$

Such formulas are called definite goals and are usually written as:

$$
 A _ { 1 } , \ldots , A _ { m }
$$

where $A _ { i }$ ’s are atomic formulas called subgoals. The goal where $m = 0$ is denoted $\sqsupset ^ { 1 }$ and called the empty goal. The logical meaning of a goal can be explained by referring to the equivalent universally quantified formula:

$$
\forall X _ { 1 } \cdot \cdot \cdot \forall X _ { n } \neg ( A _ { 1 } \land \cdot \cdot \cdot \land A _ { m } )
$$

where $X _ { 1 } , \ldots , X _ { n }$ are all variables that occur in the goal. This is equivalent to:

$$
\neg \exists X _ { 1 } \cdot \cdot \cdot \exists X _ { n } ( A _ { 1 } \land \cdot \cdot \cdot \land A _ { m } )
$$

This, in turn, can be seen as an existential question and the system attempts to deny it by constructing a counter-example. That is, it attempts to find terms $t _ { 1 } , \ldots , t _ { n }$ such that the formula obtained from $A _ { 1 } \wedge \dots \wedge A _ { m }$ when replacing the variable $X _ { i }$ by $t _ { i }$ ( $1 \leq i \leq n$ ), is true in any model of the program, i.e. to construct a logical consequence of the program which is an instance of a conjunction of all subgoals in the goal.

By giving a definite goal the user selects the set of conclusions to be constructed. This set may be finite or infinite. The problem of how the machine constructs it will be discussed in Chapter 3. The section is concluded with some examples of queries and the answers obtained to the corresponding goals in a typical Prolog system.

Example 2.3 Referring to the family-example in Section 2.1 the user may ask the following queries (with the corresponding goal):

<table><tr><td>QUERY</td><td>GOAL</td></tr><tr><td>“Is Ann a child of Tom?&quot; “Who is a grandchild of Ann?&quot; “Whose grandchild is Tom?&quot; “Who is a grandchild of whom?&quot;</td><td>←child(ann,tom) ← grandchild(X,ann) ← grandchild(tom,X) ← grandchild(X,Y)</td></tr></table>

The following answers are obtained:

• Since there are no variables in the first goal the answer is simply “yes”;

• Since the program contains no information about grandchildren of Ann the answer to the second goal is “no one” (although most Prolog implementations would answer simply “no”;

Since Tom is the grandchild of Mark the answer is $X = m a r k$ in reply to the third goal;

• The final goal yields three answers:

$$
\begin{array} { l l } { X = t o m } & { Y = m a r k } \\ { X = a l i c e } & { Y = m a r k } \\ { X = a n n } & { Y = j o h n } \end{array}
$$

It is also possible to ask more complicated queries, for example “Is there a person whose grandchildren are Tom and Alice?”, expressed formally as:

$$
 g r a n d c h i l d ( t o m , X ) , g r a n d c h i l d ( a l i c e , X )
$$

whose (expected) answer is $X = m a r k$ .

# 2.3 The Least Herbrand Model

Definite programs can only express positive knowledge — both facts and rules say which elements of a structure are in a relation, but they do not say when the relations do not hold. Therefore, using the language of definite programs, it is not possible to construct contradictory descriptions, i.e. unsatisfiable sets of formulas. In other words, every definite program has a model. This section discusses this matter in more detail. It shows also that every definite program has a well defined least model. Intuitively this model reflects all information expressed by the program and nothing more.

We first focus attention on models of a special kind, called Herbrand models. The idea is to abstract from the actual meanings of the functors (here, constants are treated as 0-ary functors) of the language. More precisely, attention is restricted to the interpretations where the domain is the set of variable-free terms and the meaning of every ground term is the term itself. After all, it is a common practice in databases — the constants tom and ann may represent persons but the database describes relations between the persons by handling relations between the terms (symbols) no matter whom they represent.

The formal definition of such domains follows and is illustrated by two simple examples.

Definition 2.4 (Herbrand universe, Herbrand base) Let $\mathcal { A }$ be an alphabet containing at least one constant symbol. The set $U _ { A }$ of all ground terms constructed from functors and constants in $\mathcal { A }$ is called the Herbrand universe of $\boldsymbol { A }$ . The set $B _ { A }$ of all ground, atomic formulas over $\mathcal { A }$ is called the Herbrand base of $\boldsymbol { A }$ . ■

The Herbrand universe and Herbrand base are often defined for a given program. In this case it is assumed that the alphabet of the program consists of exactly those symbols which appear in the program. It is also assumed that the program contains at least one constant (since otherwise, the domain would be empty).

Example 2.5 Consider the following definite program $P$ :

$$
\begin{array} { l } { { o d d ( s ( 0 ) ) . } } \\ { { o d d ( s ( s ( X ) ) )  o d d ( X ) . } } \end{array}
$$

The program contains one constant (0) and one unary functor $s$ ). Consequently the Herbrand universe looks as follows:

$$
U _ { P } = \{ 0 , s ( 0 ) , s ( s ( 0 ) ) , s ( s ( s ( 0 ) ) ) , \ldots \}
$$

Since the program contains only one (unary) predicate symbol $( o d d )$ it has the following Herbrand base:

$$
B _ { P } = \{ o d d ( 0 ) , o d d ( s ( 0 ) ) , o d d ( s ( s ( 0 ) ) ) , . . . \}
$$

Example 2.6 Consider the following definite program $P$ :

$$
\begin{array} { l } { o w n s ( o w n e r ( c o r v e t t e ) , c o r v e t t e ) . } \\ { h a p p y ( X )  o w n s ( X , c o r v e t t e ) . } \end{array}
$$

In this case the Herbrand universe $U _ { P }$ consists of the set:

$$
\{ c o r v e t t e , o w n e r ( c o r v e t t e ) , o w n e r ( o w n e r ( c o r v e t t e ) ) , . . . \}
$$

and the Herbrand base $B _ { P }$ of the set:

$$
\{ o w n s ( s , t ) \mid s , t \in U _ { P } \} \cup \{ h a p p y ( s ) \mid s \in U _ { P } \}
$$

Definition 2.7 (Herbrand interpretations) A Herbrand interpretation of $P$ is an interpretation $\Im$ such that:

• the domain of $\Im$ is $U _ { P }$ ;

• for every constant $c$ , $c _ { \Im }$ is defined to be $c$ itself;

• for every $n$ -ary functor $f$ the function $f _ { \mathbb { S } }$ is defined as follows

$$
f _ { \mathbb { S } } ( x _ { 1 } , \ldots , x _ { n } ) : = f ( x _ { 1 } , \ldots , x _ { n } )
$$

That is, the function $f _ { \mathbb { S } }$ applied to $n$ ground terms composes them into the ground term with the principal functor $f$ ;

• for every $n$ -ary predicate symbol $p$ the relation $p _ { \Im }$ is a subset of $U _ { P } ^ { \pi }$ (the set of all $n$ -tuples of ground terms).

Thus Herbrand interpretations have predefined meanings of functors and constants and in order to specify a Herbrand interpretation it suffices to list the relations associated with the predicate symbol. Hence, for an $n$ -ary predicate symbol $p$ and a Herbrand interpretation $\Im$ the meaning $p _ { \Im }$ of $p$ consists of the following set of $n$ - tuples: $\{ \langle t _ { 1 } , \dots , t _ { n } \rangle \in U _ { P } ^ { n } \mid { \mathfrak { I } } \models p ( t _ { 1 } , \dots , t _ { n } ) \}$ .

Example 2.8 One possible interpretation of the program $P$ in Example 2.5 is $o d d _ { \Im } =$ $\{ \langle s ( 0 ) \rangle , \langle s ( s ( s ( 0 ) ) ) \rangle \}$ . A Herbrand interpretation can be specified by giving a family of such relations (one for every predicate symbol). ■

Since the domain of a Herbrand interpretation is the Herbrand universe the relations are sets of tuples of ground terms. One can define all of them at once by specifying a set of labelled tuples, where the labels are predicate symbols. In other words: A Herbrand interpretation $\mathit { \Pi } _ { \widetilde { \mathcal { S } } } ^ { \mathrm { c } }$ can be seen as a subset of the Herbrand base (or a possibly infinite relational database), namely $\{ A \in B _ { P } \mid \Im \vdash A \}$ .

Example 2.9 Consider some alternative Herbrand interpretations for $P$ of Example 2.5.

$$
\begin{array} { l c l } { \mathfrak { I } _ { 1 } } & { : = } & { \emptyset } \\ { \mathfrak { I } _ { 2 } } & { : = } & { \{ o d d ( s ( 0 ) ) \} } \\ { \mathfrak { I } _ { 3 } } & { : = } & { \{ o d d ( s ( 0 ) ) , o d d ( s ( s ( 0 ) ) ) \} } \\ { \mathfrak { I } _ { 4 } } & { : = } & { \{ o d d ( s ^ { n } ( 0 ) ) \ | \ n \in \{ 1 , 3 , 5 , 7 , \dots \} \} } \\ & { = } & { \{ o d d ( s ( 0 ) ) , o d d ( s ( s ( s ( 0 ) ) ) ) , \dots \} } \\ { \mathfrak { I } _ { 5 } } & { : = } & { B _ { P } } \end{array}
$$

Definition 2.10 (Herbrand model) A Herbrand model of a set of (closed) formulas is a Herbrand interpretation which is a model of every formula in the set. ■

It turns out that Herbrand interpretations and Herbrand models have two attractive properties. The first is pragmatic: In order to determine if a Herbrand interpretation $\Im$ is a model of a universally quantified formula $\forall F $ it suffices to check if all ground instances of $F ^ { \dagger }$ are true in $\Im$ . For instance, to check if $A _ { 0 }  A _ { 1 } , . . . , A _ { n }$ is true in $\Im$ it suffices to show that if $A _ { 0 }  A _ { 1 } , . . . , A _ { n } ) \theta$ is a ground instance of $A _ { 0 }  A _ { 1 } , . . . , A _ { n }$ and $A _ { 1 } \theta , \ldots , A _ { n } \theta \in \Im$ then $A _ { 0 } \theta \in { \mathfrak { s } }$ .

Example 2.11 Clearly $\mathbb { \tilde { s } } _ { 1 }$ cannot be a model of $P$ in Example 2.5 as it is not a Herbrand model of $o d d ( s ( 0 ) )$ . However, $\mathbb { S } _ { 2 } , \mathbb { S } _ { 3 } , \mathbb { S } _ { 4 } , \mathbb { S } _ { 5 }$ are all models of $o d d ( s ( 0 ) )$ since $o d d ( s ( 0 ) ) \in \mathfrak { N } _ { i }$ , $( 2 \leq i \leq 5$ ).

Now, $\Im _ { 2 }$ is not a model of $o d d ( s ( s ( X ) ) ) \gets o d d ( X )$ since there is a ground instance of the rule — namely $o d d ( s ( s ( s ( 0 ) ) ) )  o d d ( s ( 0 ) )$ — such that all premises are true: $o d d ( s ( 0 ) ) ~ \in ~ \mathfrak { N } _ { 2 }$ , but the conclusion is false: $o d d ( s ( s ( s ( 0 ) ) ) ) \notin \mathfrak { I } _ { 2 }$ . By a similar reasoning it follows that ${ \mathfrak { I } } _ { 3 }$ is not a model of the rule.

However, ${ \mathfrak { I } } _ { 4 }$ is a model also of the rule; let $o d d ( s ( s ( t ) ) ) \gets o d d ( t )$ be any ground instance of the rule where $t \in U _ { P }$ . Clearly, $o d d ( s ( s ( t ) ) ) \gets o d d ( t )$ is true if $o d d ( t ) \not \in { \mathfrak { I } } _ { 4 }$ (check with Definition 1.6). Furthermore, if $o d d ( t ) \in \mathfrak { S } _ { 4 }$ then it must also hold that $o d d ( s ( s ( t ) ) ) \in \mathfrak { I } _ { 4 }$ (cf. the the definition of ${ \mathfrak { I } } _ { 4 }$ above) and hence $o d d ( s ( s ( t ) ) ) \gets o d d ( t )$ is true in $\Im _ { 4 }$ . Similar reasoning proves that ${ \mathfrak { I } } _ { 5 }$ is also a model of the program. ■

The second reason for focusing on Herbrand interpretations is more theoretical. For the restricted language of definite programs, it turns out that in order to determine whether an atomic formula $A$ is a logical consequence of a definite program $P$ it suffices to check that every Herbrand model of $P$ is also a Herbrand model of $A$ .

Theorem 2.12 Let $P$ be a definite program and $G$ a definite goal. If ${ \mathfrak { I } } ^ { \prime }$ is a model of $P \cup \{ G \}$ then $\mathfrak { T } : = \{ A \in B _ { P } \mid \mathbb { S } ^ { \prime } \vdash A \}$ is a Herbrand model of $P \cup \{ G \}$ . ■

Proof : Clearly, $\Im$ is a Herbrand interpretation. Now assume that ${ \mathfrak { I } } ^ { \prime }$ is a model and that $\Im$ is not a model of $P \cup \{ G \}$ . In other words, there exists a ground instance of a clause or a goal in $P \cup \{ G \}$ :

$$
A _ { 0 } \gets A _ { 1 } , \ldots , A _ { m } \quad ( m \geq 0 )
$$

which is not true in $\Im$ ( $A _ { 0 } = \sqcup$ in case of a goal).

Since this clause is false in $\Im$ then $A _ { 1 } , \ldots , A _ { m }$ are all true and $A _ { 0 }$ is false in $\Im$ . Hence, by the definition of $\mathit { \Pi } _ { \widetilde { \mathcal { S } } } ^ { \mathrm { c } }$ we conclude that $A _ { 1 } , \ldots , A _ { m }$ are true and $A _ { 0 }$ is false in ${ \mathfrak { I } } ^ { \prime }$ . This contradicts the assumption that ${ \mathfrak { I } } ^ { \prime }$ is a model. Hence $\Im$ is a model of $P \cup \{ G \}$ . ■

Notice that the form of $P$ in Theorem 2.12 is restricted to definite programs. In the general case, nonexistence of a Herbrand model of a set of formulas $P$ does not mean that $P$ is unsatisfiable. That is, there are sets of formulas $P$ which do not have a Herbrand model but which have other models.2

Example 2.13 Consider the formulas $\{ \neg p ( a ) , \exists X p ( X ) \}$ where $U _ { P } : = \{ a \}$ and $B _ { P } : =$ $\{ p ( a ) \}$ . Clearly, there are only two Herbrand interpretations — the empty set and $\boldsymbol { B } _ { P }$ itself. The former is not a model of the second formula. The latter is a model of the second formula but not of the first.

However, it is not very hard to find a model of the formulas — let the domain be the natural numbers, assign 0 to the constant $a$ and the relation $\{ \langle 1 \rangle , \langle 3 \rangle , \langle 5 \rangle , \dots \}$ to the predicate symbol $p$ (i.e. let $p$ denote the “odd”-relation). Clearly this is a model since “ $0$ is not odd” and “there exists a natural number which is odd, e.g. 1”. ■

Notice that the Herbrand base of a definite program $P$ always is a Herbrand model of the program. To check that this is so, simply take an arbitrary ground instance of any clause $A _ { 0 }  A _ { 1 } , . . . , A _ { m }$ in $P$ . Clearly, all $A _ { 0 } , \ldots , A _ { m }$ are in the Herbrand base. Hence the formula is true. However, this model is rather uninteresting every $n$ -ary predicate of the program is interpreted as the full $n$ -ary relation over the domain of ground terms. More important is of course the question — what are the interesting models of the program? Intuitively there is no reason to expect that the model includes more ground atoms than those which follow from the program. By the analogy to databases — if John is not in the telephone directory he probably has no telephone. However, the directory gives only positive facts and if John has a telephone it is not a contradiction to what is said in the directory.

The rest of this section is organized as follows. First it is shown that there exists a unique minimal model called the least Herbrand model of a definite program. Then it is shown that this model really contains all positive information present in the program.

The Herbrand models of a definite program are subsets of its Herbrand base. Thus the set-inclusion is a natural ordering of such models. In order to show the existence of least models with respect to set-inclusion it suffices to show that the intersection of all Herbrand models is also a (Herbrand) model.

Theorem 2.14 (Model intersection property) Let $M$ be a non-empty family of Herbrand models of a definite program $P$ . Then the intersection ${ \mathfrak { P } } : = \cap M$ is a Herbrand model of $P$ . ■

Proof : Assume that $\mathit { \Pi } _ { \widetilde { \mathcal { S } } } ^ { \mathrm { c } }$ is not a model of $P$ . Then there exists a ground instance of a clause of $P$ :

$$
A _ { 0 } \gets A _ { 1 } , \dots , A _ { m } \quad ( m \geq 0 )
$$

which is not true in $\Im$ . This implies that $\Im$ contains $A _ { 1 } , \ldots , A _ { m }$ but not $A _ { 0 }$ . Then $A _ { 1 } , \ldots , A _ { m }$ are elements of every interpretation of the family $M$ . Moreover there must be at least one model $\Im _ { i } \in M$ such that $A _ { 0 } \notin \mathbb { S } _ { i }$ . Thus $A _ { 0 } \gets A _ { 1 } , \ldots , A _ { m }$ is not true in this $\mathbb { \tilde { s } } _ { i }$ . Hence $\mathbb { S } _ { i }$ is not a model of the program, which contradicts the assumption. This concludes the proof that the intersection of any set of Herbrand models of a program is also a Herbrand model. ■

Thus by taking the intersection of all Herbrand models (it is known that every definite program $P$ has at least one Herbrand model — namely $B _ { P }$ ) the least Herbrand model of the definite program is obtained.

Example 2.15 Let $P$ be the definite program $\{ m a l e ( a d a m ) , f e m a l e ( e v e ) \}$ with obvious intended interpretation. $P$ has the following four Herbrand models:

$$
\begin{array} { c } { { \{ m a l e ( a d a m ) , f e m a l e ( e v e ) \} } } \\ { { \{ m a l e ( a d a m ) , m a l e ( e v e ) , f e m a l e ( e v e ) \} } } \\ { { \{ m a l e ( a d a m ) , f e m a l e ( e v e ) , f e m a l e ( a d a m ) \} } } \\ { { \{ m a l e ( a d a m ) , m a l e ( e v e ) , f e m a l e ( e v e ) , f e m a l e ( a d a m ) \} } } \end{array}
$$

It is not very hard to see that any intersection of these yields a Herbrand model. However, all but the first model contain atoms incompatible with the intended one. Notice also that the intersection of all four models yields a model which corresponds to the intended model. ■

This example indicates a connection between the least Herbrand model and the intended model of a definite program. The intended model is an abstraction of the world to be described by the program. The world may be richer than the least Herbrand model. For instance, there may be more female individuals than just Eve. However, the information not included explicitly (via facts) or implicitly (via rules) in the program cannot be obtained as an answer to a goal. The answers correspond to logical consequences of the program. Ideally, a ground atomic formula $p ( t _ { 1 } , \ldots , t _ { n } )$ is a logical consequence of the program $\mathrm { i f f }$ , in the intended interpretation $\Im$ , $t _ { i }$ denotes the individual $x _ { i }$ and $\langle x _ { 1 } , \ldots , x _ { n } \rangle \in p _ { \mathbb { S } }$ . The set of all such ground atoms can be seen as a “coded” version of the intended model. The following theorem relates this set to the least Herbrand model.

Theorem 2.16 The least Herbrand model $M _ { P }$ of a definite program $P$ is the set of all ground atomic logical consequences of the program. That is, $M _ { P } = \{ A \in B _ { P } \ |$ $P \succeq A \}$ . ■

Proof : Show first $M _ { P } \supseteq \{ A \in B _ { P } \mid P \models A \}$ : It is easy to see that every ground atom $A$ which is a logical consequence of $P$ is an element of $M _ { P }$ . Indeed, by the definition of logical consequence $A$ must be true in $M _ { P }$ . On the other hand, the definition of Herbrand interpretation states that $A$ is true in $M _ { P }$ iff $A$ is an element of $M _ { P }$ .

Then show that $M _ { P } \subseteq \{ A \in B _ { P } \mid P \vdash A \}$ : Assume that $A$ is in $M _ { P }$ . Hence it is true in every Herbrand model of $P$ . Assume that it is not true in some non-Herbrand model ${ \mathfrak { I } } ^ { \prime }$ of $P$ . But we know (see Theorem 2.12) that the set $\Im$ of all ground atomic formulas which are true in ${ \mathfrak { I } } ^ { \prime }$ is a Herbrand model of $P$ . Hence $A$ cannot be an element of $\mathit { \Pi } _ { \widetilde { \mathcal { S } } } ^ { \mathrm { c } }$ . This contradicts the assumption that there exists a model of $P$ where $A$ is false. Hence $A$ is true in every model of $P$ , that is $P \models A$ , which concludes the proof. ■

The model intersection property expressed by Theorem 2.14 does not hold for arbitrary formulas as illustrated by the following example.

Example 2.17 Consider the formula $p ( a ) \vee q ( b )$ . Clearly, both $\{ p ( a ) \}$ and $\{ q ( b ) \}$ are Herbrand models of the formula. However, the intersection $\{ p ( a ) \} \cap \{ q ( b ) \} = \emptyset$ is not a model. The two models are examples of minimal models — that is, one cannot remove any element from the model and still have a model. However, there is no least model — that is, a unique minimal model. ■

# 2.4 Construction of Least Herbrand Models

The question arises how the least Herbrand model can be constructed, or approximated by successive enumeration of its elements. The answer to this question is given by a fixed point approach to the semantics of definite programs. (A fixpoint of a function $f : \mathcal { D }  \mathcal { D }$ is an element $x \in \mathcal { D }$ such that $f ( x ) = x$ .) This section gives only a sketch of the construction. The discussion of the relevant theory is outside of the scope of this book. However, the intuition behind the construction is the following:

A definite program consists of facts and rules. Clearly, all ground instances of the facts must be included in every Herbrand model. If a Herbrand interpretation $\mathit { \Pi } _ { \widetilde { \mathcal { S } } } ^ { \mathrm { c } }$ does not include a ground instance of a fact $A$ of the program then $A$ is not true in $\Im$ and $\Im$ is not a model.

Next, consider a rule $A _ { 0 }  A _ { 1 } , . . . , A _ { m }$ where ( $m > 0$ ). This rule states that whenever $A _ { 1 } , \ldots , A _ { m }$ are true then so is $A _ { 0 }$ . In other words, take any ground instance ( $A _ { 0 } \longleftarrow A _ { 1 } , \ldots , A _ { m } ) \theta$ of the rule. If $\Im$ includes $A _ { 1 } \theta , \ldots , A _ { m } \theta$ it must also include $A _ { 0 } \theta$ in order to be a model.

Consider the set $\Im _ { 1 }$ of all ground instances of facts in the program. It is now possible to use every instance of each rule to augment $\Im _ { 1 }$ with new elements which necessarily must belong to every model. In that way a new set $\Im _ { 2 }$ is obtained which can be used again to generate more elements which must belong to the model. This process is repeated as long as new elements are generated. The new elements added to $\mathbb { \tilde { s } } _ { i + 1 }$ are those which must follow immediately from $\mathbb { \tilde { s } } _ { i }$ .

The construction outlined above can be formally defined as an iteration of a transformation $T _ { P }$ on Herbrand interpretations of the program $P$ . The operation is called the immediate consequence operator and is defined as follows:

Definition 2.18 (Immediate consequence operator) Let $g r o u n d ( P )$ be the set of all ground instances of clauses in $P$ . $T _ { P }$ is a function on Herbrand interpretations

of $P$ defined as follows:

$$
T _ { P } ( I ) : = \{ A _ { 0 } \mid A _ { 0 }  A _ { 1 } , \ldots , A _ { m } \in g r o u n d ( P ) \land \{ A _ { 1 } , \ldots , A _ { m } \} \subseteq I \}
$$

For definite programs it can be shown that there exists a least interpretation $\mathit { \Pi } _ { \widetilde { \mathcal { S } } } ^ { \mathrm { c } }$ such that $T _ { P } ( \mathfrak { I } ) = \mathfrak { V }$ and that $\mathit { \Pi } _ { \widetilde { \mathcal { S } } } ^ { \mathrm { c } }$ is identical with the least Herbrand model $M _ { P }$ . Moreover, $M _ { P }$ is the limit of the increasing, possibly infinite sequence of iterations:

$$
\emptyset , T _ { P } ( \emptyset ) , T _ { P } ( T _ { P } ( \emptyset ) ) , T _ { P } ( T _ { P } ( T _ { P } ( \emptyset ) ) ) , \dots .
$$

There is a standard notation used to denote elements of the sequence of interpretations constructed for $P$ . Namely:

$$
\begin{array} { r c l } { T _ { P } \uparrow 0 } & { : = } & { \emptyset } \\ { T _ { P } \uparrow ( i + 1 ) } & { : = } & { T _ { P } ( T _ { P } \uparrow i ) } \\ { T _ { P } \uparrow \omega } & { : = } & { \bigcup _ { i = 0 } ^ { \infty } T _ { P } \uparrow i } \end{array}
$$

The following example illustrates the construction:

Example 2.19 Consider again the program of Example 2.5.

$$
\begin{array} { l l l } { { T _ { P } \uparrow 0 } } & { { = } } & { { \emptyset } } \\ { { T _ { P } \uparrow 1 } } & { { = } } & { { \{ o d d ( s ( 0 ) ) \} } } \\ { { T _ { P } \uparrow 2 } } & { { = } } & { { \{ o d d ( s ( s ( s ( 0 ) ) ) ) , o d d ( s ( 0 ) ) \} } } \\ { { } } & { { } } & { { } } \\ { { } } & { { \vdots } } & { { } } \\ { { T _ { P } \uparrow \omega } } & { { = } } & { { \{ o d d ( s ^ { n } ( 0 ) ) \mid n \in \{ 1 , 3 , 5 , . . . \} \} } } \end{array}
$$

As already mentioned above it has been established that the set constructed in this way is identical to the least Herbrand model.

Theorem 2.20 Let $P$ be a definite program and $M _ { P }$ its least Herbrand model. Then:

• $M _ { P }$ is the least Herbrand interpretation such that $T _ { P } ( M _ { P } ) = M _ { P }$ (i.e. it is the least fixpoint of $T _ { P }$ ).   
• $M _ { P } = T _ { P } \uparrow \omega$ .

For additional details and proofs see for example Apt (1990), Lloyd (1987) or van Emden and Kowalski (1976).

# Exercises

2.1 Rewrite the following formulas in the form $A _ { 0 } \gets A _ { 1 } , . . . , A _ { m }$ :

$$
\begin{array} { c } { \forall X ( p ( X ) \vee \neg q ( X ) ) } \\ { \forall X ( p ( X ) \vee \neg \exists Y ( q ( X , Y ) \wedge r ( X ) ) ) } \\ { \forall X ( \neg p ( X ) \vee ( q ( X ) \supset r ( X ) ) ) } \\ { \forall X ( r ( X ) \supset ( q ( X ) \supset p ( X ) ) ) } \end{array}
$$

2.2 Formalize the following scenario as a definite program:

Basil owns Fawlty Towers. Basil and Sybil are married. Polly and Manuel are employees at Fawlty Towers. Smith and Jones are guests at Fawlty Towers. All hotel-owners and their spouses serve all guests at the hotel. All employees at a hotel serve all guests at the hotel. All employees dislike the owner of the workplace. Basil dislikes Manuel.

Then ask the queries “Who serves who?” and “Who dislikes who?”.

2.3 Give the Herbrand universe and Herbrand base of the following definite program:

$$
\begin{array} { r l } & { p ( f ( X ) )  q ( X , g ( X ) ) . } \\ & { q ( a , g ( b ) ) . } \\ & { q ( b , g ( b ) ) . } \end{array}
$$

2.4 Give the Herbrand universe and Herbrand base of the following definite program:

$$
\begin{array} { r l } & { p ( s ( X ) , Y , s ( Z ) )  p ( X , Y , Z ) . } \\ & { p ( 0 , X , X ) . } \end{array}
$$

2.5 Consider the Herbrand universe consisting of the constants $a , b , c$ and $d$ . Let $\Im$ be the Herbrand interpretation:

$$
\{ p ( a ) , p ( b ) , q ( a ) , q ( b ) , q ( c ) , q ( d ) \}
$$

Which of the following formulas are true in $\Im$ ?

$$
\begin{array} { r l } { ( 1 ) } & { \forall X p ( X ) } \\ { ( 2 ) } & { \forall X q ( X ) } \\ { ( 3 ) } & { \exists X \bigl ( q ( X ) \land p ( X ) \bigr ) } \\ { ( 4 ) } & { \forall X \bigl ( q ( X ) \supset p ( X ) \bigr ) } \\ { ( 5 ) } & { \forall X \bigl ( p ( X ) \supset q ( X ) \bigr ) } \end{array}
$$

2.6 Give the least Herbrand model of the program in exercise 2.3.

2.7 Give the least Herbrand model of the program in exercise 2.4. Hint: the model is infinite, but a certain pattern can be spotted when using the $T _ { P }$ -operator.

2.8 Consider the following program:

$$
\stackrel { p ( 0 ) . } { p ( s ( X ) ) }  p ( X ) .
$$

Show that $p ( s ^ { n } ( 0 ) ) \in T _ { P } \uparrow m$ iff $n < m$ .

2.9 Let $P$ be a definite program and $\Im$ a Herbrand interpretation. Show that $\Im$ is a model of $P$ iff $T _ { P } ( \Im ) \subseteq \Im$ .

# Chapter 3 SLD-Resolution

This chapter introduces the inference mechanism which is the basis of most logic programming systems. The idea is a special case of the inference rule called the resolution principle — an idea that was first introduced by J. A. Robinson in the mid-sixties for a richer language than definite programs. As a consequence, only a specialization of this rule, that applies to definite programs, is presented here. For reasons to be explained later, it will be called the SLD-resolution principle.

In the previous chapter the model-theoretic semantics of definite programs was discussed. The SLD-resolution principle makes it possible to draw correct conclusions from the program, thus providing a foundation for a logically sound operational semantics of definite programs. This chapter first defines the notion of SLD-resolution and then shows its correctness with respect to the model-theoretic semantics. Finally SLD-resolution is shown to be an instance of a more general notion involving the construction of proof trees.

# 3.1 Informal Introduction

Every inference rule of a logical system formalizes some natural way of reasoning. The presentation of the SLD-resolution principle is therefore preceded by an informal discussion about the underlying reasoning techniques.

The sentences of logic programs have a general structure of logical implication:

$$
A _ { 0 }  A _ { 1 } , . . . , A _ { n } \qquad ( n \geq 0 )
$$

where $A _ { 0 } , \ldots , A _ { n }$ are atomic formulas and where $A _ { 0 }$ may be absent (in which case it is a goal clause). Consider the following definite program that describes a world where “parents of newborn children are proud”, “Adam is the father of Mary” and “Mary is newborn”:

$p r o u d ( X ) \gets p a r e n t ( X , Y )$ , $n e w b o r n ( Y )$ .   
$p a r e n t ( X , Y ) \gets f a t h e r ( X , Y )$ .   
$p a r e n t ( X , Y ) \gets m o t h e r ( X , Y )$ .   
$f a t h e r ( a d a m , m a r y )$ .   
$n e w b o r n ( m a r y )$ .

Notice that this program describes only “positive knowledge” — it does not state who is not proud. Nor does it convey what it means for someone not to be a parent. The problem of expressing negative knowledge will be investigated in detail in Chapter 4 when extending definite programs with negation.

Say now that we want to ask the question “Who is proud?”. The question concerns the world described by the program $P$ , that is, the intended model of $P$ . We would of course like to see the answer “Adam” to this question. However, as discussed in the previous chapters predicate logic does not provide the means for expressing this type of interrogative sentences; only declarative ones. Therefore the question may be formalized as the goal clause:

$$
 p r o u d ( Z )
$$

which is an abbreviation for $\forall Z \neg p r o u d ( Z )$ which in turn is equivalent to:

$$
\lnot \exists Z p r o u d ( Z )
$$

whose reading is “Nobody is proud”. That is, a negative answer to the query above. The aim now is to show that this answer is a false statement in every model of $P$ (and in particular in the intended model). Then by Proposition 1.13 it can be concluded that $P \left| = \exists Z p r o u d ( Z ) \right.$ . Alas this would result only in a “yes”-answer to the original question, while the expected answer is “Adam”. Thus, the objective is rather to find a substitution $\theta$ such that the set $P \cup \{ \neg p r o u d ( Z ) \theta \}$ is unsatisfiable, or equivalently such that $P \models p r o u d ( Z ) \theta$ .

The starting point of reasoning is the assumption $G _ { 0 }$ — “For any Z, Z is not proud”. Inspection of the program reveals a rule describing one condition for someone to be proud:

$$
p r o u d ( X ) \gets p a r e n t ( X , Y ) , n e w b o r n ( Y ) .
$$

Its equivalent logical reading is:

$$
\forall ( \neg p r o u d ( X ) \supset \neg ( p a r e n t ( X , Y ) \wedge n e w b o r n ( Y ) ) )
$$

Renaming $X$ into $Z$ , elimination of universal quantification and the use of modus ponens with respect to $G _ { 0 }$ yields:

$$
\neg ( p a r e n t ( Z , Y ) \land n e w b o r n ( Y ) )
$$

or equivalently:

$$
 p a r e n t ( Z , Y ) , n e w b o r n ( Y ) .
$$

Thus, one step of reasoning amounts to replacing a goal $G _ { 0 }$ by another goal $G _ { 1 }$ which is true in any model of $P \cup \{ G _ { 0 } \}$ . It now remains to be shown that $P \cup \{ G _ { 1 } \}$ is unsatisfiable. Note that $G _ { 1 }$ is equivalent to:

$$
\forall Z \forall Y ( \neg p a r e n t ( Z , Y ) \lor \neg n e w b o r n ( Y ) )
$$

Thus $G _ { 1 }$ can be shown to be unsatisfiable with $P$ if in every model of $P$ there is some individual who is a parent of a newborn child. Thus, check first whether there are any parents at all. The program contains a clause:

$$
p a r e n t ( X , Y ) \gets f a t h e r ( X , Y ) .
$$

which is equivalent to:

$$
\forall ( \neg p a r e n t ( X , Y ) \supset \neg f a t h e r ( X , Y ) )
$$

Thus, $G _ { 1 }$ reduces to:

$$
 f a t h e r ( Z , Y ) , n e w b o r n ( Y ) .
$$

The new goal $G _ { 2 }$ can be shown to be unsatisfiable with $P$ if in every model of $P$ there is some individual who is a father of a newborn child. The program states that “Adam is the father of Mary”:

$$
f a t h e r ( a d a m , m a r y ) .
$$

Thus it remains to be shown that “Mary is not newborn” is unsatisfiable together with $P$ :

$$
 n e w b o r n ( m a r y ) .
$$

But the program also contains a fact:

$$
n e w b o r n ( m a r y ) .
$$

equivalent to $\neg n e w b o r n ( m a r y ) \supset \sqcup$ leading to a refutation:

The way of reasoning used in this example is as follows: to show existence of something, assume the contrary and use modus ponens and elimination of the universal quantifier to find a counter-example for the assumption. This is a general idea to be used in computations of logic programs. As illustrated above, a single computation (reasoning) step transforms a set of atomic formulas — that is, a definite goal — into a new set of atoms. (See Figure 3.1.) It uses a selected atomic formula $p ( s _ { 1 } , \ldots , s _ { n } )$ of the goal and a selected program clause of the form $p ( t _ { 1 } , \ldots , t _ { n } )  A _ { 1 } , \ldots , A _ { m }$ (where $m \geq 0$ and $A _ { 1 } , \ldots , A _ { m }$ are atoms) to find a common instance of $p ( s _ { 1 } , \ldots , s _ { n } )$ and $p ( t _ { 1 } , \ldots , t _ { n } )$ . In other words a substitution $\theta$ is constructed such that $p ( s _ { 1 } , \ldots , s _ { n } ) \theta$ and $p ( t _ { 1 } , \ldots , t _ { n } ) \theta$ are identical. Such a substitution is called a unifier and the problem of finding unifiers will be discussed in the next section. The new goal is constructed from the old one by replacing the selected atom by the set of body atoms of the clause and applying $\theta$ to all atoms obtained in that way. This basic computation step can be seen as an inference rule since it transforms logic formulas. It will be called the resolution principle for definite programs or $S L D$ -resolution principle. As illustrated above it combines in a special way modus ponens with the elimination rule for the universal quantifier.

![](images/5babdf6343266b38d6f21698c28c47afdc820207ecea1ad7f2eb86b53d3f6fa7.jpg)  
Figure 3.1: Refutation of $ p r o u d ( Z )$

At the last step of reasoning the empty goal, corresponding to falsity, is obtained. The final conclusion then is the negation of the initial goal. Since this goal is of the form $\forall \neg ( A _ { 1 } \land \cdots \land A _ { m } )$ , the conclusion is equivalent (by DeMorgan’s laws) to the formula $\exists ( A _ { 1 } \land \lor \cdots \land A _ { m } )$ . The final conclusion can be obtained by the inference rule known as reductio ad absurdum. Every step of reasoning produces a substitution. Unsatisfiability of the original $\mathrm { g o a l }  A _ { 1 } , \dotsc , A _ { m }$ with $P$ is demonstrated in $k$ steps by showing that its instance:

$$
 ( A _ { 1 } , \ldots , A _ { m } ) \theta _ { 1 } \cdot \cdot \cdot \theta _ { k }
$$

is unsatisfiable, or equivalently that:

$$
P \vdash ( A _ { 1 } \land \cdots \land A _ { m } ) \theta _ { 1 } \cdot \cdot \cdot \theta _ { k }
$$

In the example discussed, the goal “Nobody is proud” is unsatisfiable with $P$ since its instance $\ G$ Adam is not proud” is unsatisfiable with $P$ . In other words — in every model of $P$ the sentence “Adam is proud” is true.

It is worth noticing that the unifiers may leave some variables unbound. In this case the universal closure of $( A _ { 1 } \wedge \cdot \cdot \cdot \wedge A _ { m } ) \theta _ { 1 } \cdot \cdot \cdot \theta _ { k }$ is a logical consequence of $P$ . Examples of such answers will appear below.

Notice also that generally the computation steps are not deterministic — any atom of a goal may be selected and there may be several clauses matching the selected atom. Another potential source of non-determinism concerns the existence of alternative unifiers for two atoms. These remarks suggest that it may be possible to construct (sometimes infinitely) many solutions, i.e. counter-examples for the initial goal. On the other hand it may also happen that the selected atom has no matching clause.

If so, it means that, using this method, it is not possible to construct any counterexample for the initial goal. The computation may also loop without producing any solution.

# 3.2 Unification

As demonstrated in the previous section, one of the main ingredients in the inference mechanism is the process of making two atomic formulas syntactically equivalent. Before defining the notion of SLD-resolution we focus on this process, called unification, and give an algorithmic solution — a procedure that takes two atomic formulas as input, and either shows how they can be instantiated to identical atoms or, reports a failure.

Before considering the problem of unifying atoms (and terms), consider an ordinary equation over the natural numbers ( $\mathbb { N }$ ) such as:

$$
2 x + 3 \doteq 4 y + 7
$$

The equation has a set of solutions; that is, valuations $\varphi \colon \{ x , y \}  \mathbb { N }$ such that $\varphi _ { \mathbb { S } } ( 2 x +$ $3 ) = \varphi _ { \Im } ( 4 y + 7 )$ where $\Im$ is the standard interpretation of the arithmetic symbols. In this particular example there are infinitely many solutions ( $\{ x \mapsto 2 , y \mapsto 0 \}$ and $\{ x \mapsto 4 , y \mapsto 1 \}$ etc.) but by a sequence of syntactic transformations that preserve the set of all solutions the equation may be transformed into an new equation that compactly represents all solutions to the original equation:

$$
x \doteq 2 ( y + 1 )
$$

The transformations exploit domain knowledge (such as commutativity, associativity etc.) specific to the particular interpretation. In a logic program there is generally no such knowledge available and the question arises how to compute the solutions of an equation without any knowledge about the interpretation of the symbols. For example:

$$
f ( X , g ( Y ) ) \doteq f ( a , g ( X ) )
$$

Clearly it is no longer possible to apply all the transformations that were applied above since the interpretation of $f / 2$ , $g / 1$ is no longer fixed. However, any solution of the equations:

$$
\{ X \doteq a , g ( Y ) \doteq g ( X ) \}
$$

must clearly be a solution of equation (7). Similarly, any solution of:

$$
\{ X \doteq a , Y \doteq X \}
$$

must be a solution of equations (8). Finally any solution of:

$$
\{ X \doteq a , Y \doteq a \}
$$

is a solution of (9). By analogy to (6) this is a compact representation of some solutions to equation (7). However, whether it represents all solution depends on how the symbols $f / 2$ , $g / 1$ and $a$ are interpreted. For example, if $f / 2$ denotes integer addition, $g / 1$ the successor function and $a$ the integer zero, then (10) represents only one solution to equation (7). However, equation (7) has infinitely many integer solutions — any $\varphi$ such that $\varphi ( \boldsymbol { Y } ) = 0$ is a solution.

On the other hand, consider a Herbrand interpretation $\Im$ ; Solving of an equation $s \doteq t$ amounts to finding a valuation $\varphi$ such that $\varphi _ { \Im } ( s ) = \varphi _ { \Im } ( t )$ . Now a valuation in the Herbrand domain is a mapping from variables of the equations to ground terms (that is, a substitution) and the interpretation of a ground term is the term itself. Thus, a solution in the Herbrand domain is a grounding substitution $\varphi$ such that $s \varphi$ and $t \varphi$ are identical ground terms. This brings us to the fundamental concept of unification and unifiers:

Definition 3.1 (Unifier) Let $s$ and $t$ be terms. A substitution $\theta$ such that $s \theta$ and $t \theta$ are identical (denoted $s \theta = t \theta$ ) is called a unifier of $s$ and $t$ . ■

The search for a unifier of two terms, $s$ and $t$ , will be viewed as the process of solving the equation $s \doteq t$ . Therefore, more generally, if $\{ s _ { 1 } \doteq t _ { 1 } , . . . , s _ { n } \doteq t _ { n } \}$ is a set of equations, then $\theta$ is called a unifier of the set if $s _ { i } \theta = t _ { i } \theta$ for all $1 \leq i \leq n$ . For instance, the substitution $\{ X / a , Y / a \}$ is a unifier of equation (7). It is also a unifier of (8)–(10). In fact, it is the only unifier as long as “irrelevant” variables are not introduced. (For instance, $\{ X / a , Y / a , Z / a \}$ is also a unifier.) The transformations informally used in steps (7)–(10) preserve the set of all solutions in the Herbrand domain. (The full set of transformations will soon be presented.) Note that a solution to a set of equations is a (grounding) unifier. Thus, if a set of equations has a unifier then the set also has a solution.

However, not all sets of equations have a solution/unifier. For instance, the set $\{ s u m ( 1 , 1 ) \doteq 2 \}$ is not unifiable. Intuitively sum may be thought of as integer addition, but bear in mind that the symbols have no predefined interpretation in a logic program. (In Chapters 13–14 more powerful notions of unification are discussed.)

It is often the case that a set of equations have more than one unifier. For instance, both $\{ X / g ( Z ) , Y / Z \}$ and $\{ X / g ( a ) , Y / a , Z / a \}$ are unifiers of the set $\{ f ( X , Y ) \doteq$ $f ( g ( Z ) , Z ) \}$ . Under the first unifier the terms instantiate to $f ( g ( Z ) , Z )$ and under the second unifier the terms instantiate to $f ( g ( a ) , a )$ . The second unifier is in a sense more restrictive than the first, as it makes the two terms ground whereas the first still provides room for some alternatives in that is does not specify how $Z$ should be bound. We say that $\{ X / g ( Z ) , Y / Z \}$ is more general than $\{ X / g ( a ) , Y / a , Z / a \}$ . More formally this can be expressed as follows:

Definition 3.2 (Generality of substitutions) A substitution $\theta$ is said to be more general than a substitution $\sigma$ (denoted $\sigma \preceq \theta$ ) iff there exists a substitution $\omega$ such that $\sigma = \theta \omega$ . ■

Definition 3.3 (Most general unifier) A unifier $\theta$ is said to be a most general unifier (mgu) of two terms iff $\theta$ is more general than any other unifier of the terms.

Definition 3.4 (Solved form) A set of equations $\{ X _ { 1 } \doteq t _ { 1 } , . . . , X _ { n } \doteq t _ { n } \}$ is said to be in solved form iff $X _ { 1 } , \ldots , X _ { n }$ are distinct variables none of which appear in $t _ { 1 } , \ldots , t _ { n }$ . ■

There is a close correspondence between a set of equations in solved form and the most general unifier(s) of that set as shown by the following theorem:

Proposition 3.5 Let $\{ X _ { 1 } \doteq t _ { 1 } , . . . , X _ { n } \doteq t _ { n } \}$ be a set of equations in solved form. Then $\{ X _ { 1 } / t _ { 1 } , . . . , X _ { n } / t _ { n } \}$ is an (idempotent) mgu of the solved form. ■

Proof : First define:

$$
\begin{array} { l } { \mathcal { E } : = \{ X _ { 1 } \doteq t _ { 1 } , \ldots , X _ { n } \doteq t _ { n } \} } \\ { \theta : = \{ X _ { 1 } / t _ { 1 } , \ldots , X _ { n } / t _ { n } \} } \end{array}
$$

Clearly $\theta$ is an idempotent unifier of $\varepsilon$ . It remains to be shown that $\theta$ is more general than any other unifier of $\varepsilon$ .

Thus, assume that $\sigma$ is a unifier of $\varepsilon$ . Then $X _ { i } \sigma = t _ { i } \sigma$ for $1 \leq i \leq n$ . It must follow that $X _ { i } / t _ { i } \sigma \in \sigma$ for $1 \leq i \leq n$ . In addition $\sigma$ may contain some additonal pairs $Y _ { 1 } / s _ { 1 } , \dots , Y _ { m } / s _ { m }$ such that $\{ X _ { 1 } , \dots , X _ { n } \} \cap \{ Y _ { 1 } , \dots , Y _ { m } \} = \emptyset$ . Thus, $\sigma$ is of the form:

$$
\{ X _ { 1 } / t _ { 1 } \sigma , . . . , X _ { n } / t _ { n } \sigma , Y _ { 1 } / s _ { 1 } , . . . , Y _ { m } / s _ { m } \}
$$

Now $\theta \sigma = \sigma$ . Thus, there exists a substitution $\omega$ (viz. $\sigma$ ) such that $\sigma = \theta \omega$ . Therefore, $\theta$ is an idempotent mgu. ■

Definition 3.6 (Equivalence of sets of equations) Two sets of equations $\mathcal { E } _ { 1 }$ and ${ \dot { \varepsilon } } _ { 2 }$ are said to be equivalent if they have the same set of unifiers. ■

Note that two equivalent sets of equations must have the same set of solutions in any Herbrand interpretation.

The definition can be used as follows: to compute a most general unifier mgu $( s , t )$ of two terms $s$ and $t$ , first try to transform the equation $\{ s \doteq t \}$ into an equivalent solved form. If this fails then $\mathrm { M G U } ( s , t ) = \mathbf { f a i l u r e }$ . However, if there is a solved form $\{ X _ { 1 } \doteq t _ { 1 } , \ldots , X _ { n } \doteq t _ { n } \}$ then $\operatorname { M G U } ( s , t ) = \left\{ X _ { 1 } / t _ { 1 } , \ldots , X _ { n } / t _ { n } \right\}$ .

Figure 3.2 presents a (non-deterministic) algorithm which takes as input a set of equations $\varepsilon$ and terminates returning either a solved form equivalent to $\varepsilon$ or failure if no such solved form exists. Note that constants are viewed as function symbols of arity 0. Thus, if an equation $c \doteq c$ gets selected, the equation is simply removed by case 1. Before proving the correctness of the algorithm some examples are used to illustrate the idea:

Example 3.7 The set $\{ f ( X , g ( Y ) ) \doteq f ( g ( Z ) , Z ) \}$ has a solved form since:

$$
\begin{array} { l l l } { { \{ f ( X , g ( Y ) ) \doteq f ( g ( Z ) , Z ) \} } } & { { \Rightarrow } } & { { \{ X \doteq g ( Z ) , g ( Y ) \doteq Z \} } } \\ { { } } & { { \Rightarrow } } & { { \{ X \doteq g ( Z ) , Z \doteq g ( Y ) \} } } \\ { { } } & { { \Rightarrow } } & { { \{ X \doteq g ( g ( Y ) ) , Z \doteq g ( Y ) \} } } \end{array}
$$

The set $\{ f ( X , g ( X ) , b ) \doteq f ( a , g ( Z ) , Z ) \}$ , on the other hand, does not have a solved form since:

$$
\begin{array} { l l l } { { \{ f ( X , g ( X ) , b ) \doteq f ( a , g ( Z ) , Z ) \} } } & { { \Rightarrow } } & { { \{ X \doteq a , g ( X ) \doteq g ( Z ) , b \doteq Z \} } } \\ { { } } & { { \Rightarrow } } & { { \{ X \doteq a , g ( a ) \doteq g ( Z ) , b \doteq Z \} } } \end{array}
$$

Input: A set $\varepsilon$ of equations.   
Output: An equivalent set of equations in solved form or failure.

# repeat

select an arbitrary $s \doteq t \in \mathcal { E }$ ;   
case $s \doteq t$ of $f ( s _ { 1 } , \ldots , s _ { n } ) \doteq f ( t _ { 1 } , \ldots , t _ { n } )$ where $n \geq 0 \Rightarrow$ replace equation by $s _ { 1 } \doteq t _ { 1 } , . . . , s _ { n } \doteq t _ { n }$ ; % case 1 $f ( s _ { 1 } , \ldots , s _ { m } ) \doteq g ( t _ { 1 } , \ldots , t _ { n } )$ where $f / m \neq g / n \Rightarrow$ halt with failure; $\%$ case 2 $X \doteq X \Rightarrow$ remove the equation; $\%$ case 3 $t \doteq X$ where $t$ is not a variable $\Rightarrow$ replace equation by $X \doteq t$ ; $\%$ case 4 $X \doteq t$ where $X \neq t$ and $X$ has more than one occurrence in $\mathcal { E } \Rightarrow$ if $X$ is a proper subterm of $t$ then halt with failure $\%$ case 5a else replace all other occurrences of $X$ by $t$ ; $\%$ case 5b until no action is possible on any equation in $\varepsilon$ ;   
halt with $\varepsilon$ ;

$$
\begin{array} { r l } { \Rightarrow } & { \{ X \doteq a , a \doteq Z , b \doteq Z \} } \\ { \Rightarrow } & { \{ X \doteq a , Z \doteq a , b \doteq Z \} } \\ { \Rightarrow } & { \{ X \doteq a , Z \doteq a , b \doteq a \} } \\ { \Rightarrow } & { \{ \mathrm { a i l u r e } }  \end{array}
$$

The algorithm fails since case 2 applies to $b \doteq a$ . Finally consider:

$$
{ \begin{array} { l l l } { \{ f ( X , g ( X ) ) \doteq f ( Z , Z ) \} } & { \Rightarrow } & { \{ X \doteq Z , g ( X ) \doteq Z \} } \\ & { \Rightarrow } & { \{ X \doteq Z , g ( Z ) \doteq Z \} } \\ & { \Rightarrow } & { \{ X \doteq Z , Z \doteq g ( Z ) \} } \\ & { \Rightarrow } & { { \mathrm { f a i l u r e } } } \end{array} }
$$

The set does not have a solved form since $Z$ is a proper subterm of $g ( Z )$ .

Theorem 3.8 The solved form algorithm in Figure 3.2 terminates and returns an equivalent solved form or failure if no such solved form exists. ■

Proof : First consider termination: Note that case 5b is the only case that may increase the number of symbol occurrences in the set of equations. However, case 5b can be applied at most once for each variable $X$ . Thus, case 5b can be applied only a finite number of times and may introduce only a finite number of new symbol occurrences. Case 2 and case 5a terminate immediately and case 1 and 3 strictly decrease the number of symbol occurrences in the set. Since case 4 cannot be applied indefinitely, but has to be intertwined with the other cases it follows that the algorithm always terminates.

It should be evident that the algorithm either returns failure or a set of equations in solved form. Thus, it remains to be shown that each iteration of the algorithm preserves equivalence between successive sets of equations. It is easy to see that if case 2 or 5a apply to some equation in:

$$
\{ s _ { 1 } \doteq t _ { 1 } , . . . , s _ { n } \doteq t _ { n } \}
$$

then the set cannot possibly have a unifier. It is also easy to see that if any of case $^ { 1 }$ , 3 or 4 apply, then the new set of equations has the same set of unifiers. Finally assume that case 5b applies to some equation $s _ { i } \doteq t _ { i }$ . Then the new set is of the form:

$$
s _ { 1 } \theta \doteq \iota _ { 1 } \theta , \ldots , s _ { i - 1 } \theta \doteq t _ { i - 1 } \theta , s _ { i } \doteq t _ { i } , s _ { i + 1 } \theta \doteq t _ { i }
$$$$
\theta \doteq t _ { i - 1 } \theta , s _ { i } \doteq t _ { i } , s _ { i + 1 } \theta \doteq t _ { i + 1 } \theta , \ldots s _ { n } \theta \doteq t _ { n } \theta \}
$$

where $\theta : = \{ s _ { i } / t _ { i } \}$ . First assume that $\sigma$ is a unifier of $\mathcal { E } _ { 1 }$ — that is, $s _ { j } \sigma = t _ { j } \sigma$ for every $1 \leq j \leq n$ . In particular, it must hold that $s _ { i } \sigma = t _ { i } \sigma$ . Since $s _ { i }$ is a variable which is not a subterm of $t _ { i }$ it must follow that $s _ { i } / t _ { i } \sigma \in \sigma$ . Moreover, $\theta \sigma = \sigma$ and it therefore follows that $\sigma$ is a unifier also of $\mathcal { E } _ { 2 }$ .

Next, assume that $\sigma$ is a unifier of $\xi _ { 2 }$ . Thus, $s _ { i } / t _ { i } \sigma \in \sigma$ and $\theta \sigma = \sigma$ which must then be a unifier also of $\mathcal { E } _ { 1 }$ . ■

The algorithm presented in Figure 3.2 may be very inefficient. One of the reasons is case 5a; That is, checking if a variable $X$ occurs inside another term $t$ . This is often referred to as the occur-check. Assume that the time of occur-check is linear with respect to the size $| t |$ of $t$ . 1 Consider application of the solved form algorithm to the equation:

$$
g ( X _ { 1 } , \dots , X _ { n } ) \doteq g ( f ( X _ { 0 } , X _ { 0 } ) , f ( X _ { 1 } , X _ { 1 } ) , \dots , f ( X _ { n - 1 } , X _ { n - 1 } ) )
$$

where $X _ { 0 } , \ldots , X _ { n }$ are distinct. By case 1 this reduces to:

$$
\{ X _ { 1 } \doteq f ( X _ { 0 } , X _ { 0 } ) , X _ { 2 } \doteq f ( X _ { 1 } , X _ { 1 } ) , \ldots , X _ { n } \doteq f ( X _ { n - 1 } , X _ { n - 1 } ) \}
$$

Assume that the equation selected in step $i$ is of the form $X _ { i } = f ( \dots , \dots )$ . Then in the $k$ -th iteration the selected equation is of the form $X _ { k } \doteq \tau _ { k }$ where $T _ { i + 1 } : = f ( T _ { i } , T _ { i } )$ and $\tau _ { 0 } : = X _ { 0 }$ . Hence, $| \mathcal { T } _ { i + 1 } | = 2 | \mathcal { T } _ { i } | + 1$ . That is, $| T _ { n } | > 2 ^ { n }$ . This shows the exponential dependency of the unification time on the length of the structures. In this example the growth of the argument lengths is caused by duplication of subterms. As a matter of fact, the same check is repeated many times. Something that could be avoided by sharing various instances of the same structure. In the literature one can find linear algorithms but they are sometimes quite elaborate. On the other hand, Prolog systems usually “solve” the problem simply by omitting the occur-check during unification. Roughly speaking such an approach corresponds to a solved form algorithm where case 5a–b is replaced by:

$X \doteq t$ where $X \neq t$ and $X$ has more than one occurrence in $\mathcal { E } \Rightarrow$ replace all other occurrences of $X$ by $t$ ; $\%$ case $\it 5$

A pragmatic justification for this solution is the fact that rule 5a (occur check) never is used during the computation of many Prolog programs. There are sufficient conditions which guarantee this, but in general this property is undecidable. The ISO Prolog standard (1995) states that the result of unification is undefined if case 5b can be applied to the set of equations. Strictly speaking, removing case 5a causes looping of the algorithm on equations where case 5a would otherwise apply. For example, an attempt to solve $X \doteq f ( X )$ by the modified algorithm will produce a new equation $X \doteq f ( f ( X ) )$ . However, case 5 is once again applicable yielding $X \doteq f ( f ( f ( f ( X ) ) ) )$ and so forth. In practice many Prolog systems do not loop, but simply bind $X$ to the infinite structure $f ( f ( f ( \dots ) ) )$ . (The notation $X / f ( \infty )$ will be used to denote this binding.) Clearly, $\{ X / f ( \infty ) \}$ is an infinite “unifier” of $X$ and $f ( X )$ . It can easily be represented in the computer by a finite cyclic data structure. But this amounts to generalization of the concepts of term, substitution and unifier for the infinite case not treated in classical logic. Implementation of unification without occur-check may result in unsoundness as will be illustrated in Example 3.21.

Before concluding the discussion about unification we study the notion of most general unifier in more detail. It turns out that the notion of mgu is a subtle one; For instance, there is generally not a unique most general unifier of two terms $s$ and $t$ . A trivial example is the equation $f ( X ) \doteq f ( Y )$ which has at least two mgu’s; namely $\{ X / Y \}$ and $\{ Y / X \}$ . Part of the confusion stems from the fact that $\preceq$ (“being more general than”) is not an ordering relation. It is reflexive: That is, any substitution $\theta$ is “more general” than itself since $\theta = \theta \epsilon$ . As might be expected it is also transitive: If $\theta _ { 1 } = \theta _ { 2 } \omega _ { 1 }$ and $\theta _ { 2 } = \theta _ { 3 } \omega _ { 2 }$ then obviously $\theta _ { 1 } = \theta _ { 3 } \omega _ { 2 } \omega _ { 1 }$ . However, $\preceq$ is not anti-symmetric. For instance, consider the substitution $\theta : = \{ X / Y , Y / X \}$ and the identity substitution $\epsilon$ . The latter is obviously more general than $\theta$ since $\theta = \epsilon \theta$ . But $\theta$ is also more general than $\epsilon$ , since $\epsilon = \theta \theta$ . It may seem odd that two distinct substitutions are more general than one another. Still there is a rational explanation. First consider the following definition:

Definition 3.9 (Renaming) A substitution $\{ X _ { 1 } / Y _ { 1 } , . . . , X _ { n } / Y _ { n } \}$ is called a renaming substitution iff $Y _ { 1 } , \dots , Y _ { n }$ is a permutation of $X _ { 1 } , \ldots , X _ { n }$ .

A renaming substitution represents a bijective mapping between variables (or more generally terms). Such a substitution always preserves the structure of a term; if $\theta$ is a renaming and $t$ a term, then $t \theta$ and $t$ are equivalent but for the names of the variables. Now, the fact that a renaming represents a bijection implies that there must be an inverse mapping. Indeed, if $\{ X _ { 1 } / Y _ { 1 } , . . . , X _ { n } / Y _ { n } \}$ is a renaming then $\{ Y _ { 1 } / X _ { 1 } , \ldots , Y _ { n } / X _ { n } \}$ is its inverse. We denote the inverse of $\theta$ by $\theta ^ { - 1 }$ and observe that $\theta \theta ^ { - 1 } = \theta ^ { - 1 } \theta = \epsilon$ .

Proposition 3.10 Let $\theta$ be an mgu of $s$ and $t$ and assume that $\omega$ is a renaming. Then $\theta \omega$ is an mgu of $s$ and $t$ . ■

The proof of the proposition is left as an exercise. So is the proof of the following proposition:

Proposition 3.11 Let $\theta$ and $\sigma$ be substitutions. If $\theta \preceq \sigma$ and $\sigma \preceq \theta$ then there exists a renaming substitution $\omega$ such that $\sigma = \theta \omega$ (and $\theta = \sigma \omega ^ { - 1 }$ ). ■

Thus, according to the above propositions, the set of all mgu’s of two terms is closed under renaming.

# 3.3 SLD-Resolution

The method of reasoning discussed informally in Section 3.1 can be summarized as the following inference rule:

$$
\frac { \forall \neg ( A _ { 1 } \land \dots \land A _ { i - 1 } \land A _ { i } \land A _ { i + 1 } \land \dots \land A _ { m } ) } { \forall \neg ( A _ { 1 } \land \dots \land A _ { i - 1 } \land B _ { 1 } \land \dots \land B _ { n } \land A _ { i + 1 } \land \dots \land A _ { m } ) \theta }
$$

or (using logic programming notation):

$$
\frac {  A _ { 1 } , \dotsc , A _ { i - 1 } , A _ { i } , A _ { i + 1 } , \dotsc , A _ { m } \qquad B _ { 0 }  B _ { 1 } , \dotsc , B _ { n } } {  ( A _ { 1 } , \dotsc , A _ { i - 1 } , B _ { 1 } , \dotsc , B _ { n } , A _ { i + 1 } , \dotsc , A _ { m } ) \theta }
$$

where

(i ) $A _ { 1 } , \ldots , A _ { m }$ are atomic formulas;   
(ii ) $B _ { 0 }  B _ { 1 } , . . . , B _ { n }$ is a (renamed) definite clause in $P$ ( $n \geq 0$ );   
(iii ) mgu $( A _ { i } , B _ { 0 } ) = \theta .$ .

The rule has two premises — a goal clause and a definite clause. Notice that each of them is separately universally quantified. Thus the scopes of the quantifiers are disjoint. On the other hand, there is only one universal quantifier in the conclusion of the rule. Therefore it is required that the sets of variables in the premises are disjoint. Since all variables of the premises are bound it is always possible to rename the variables of the definite clause to satisfy this requirement (that is, to apply some renaming substitution to it).

The goal clause may include several atomic formulas which unify with the head of some clause in the program. In this case it may be desirable to introduce some deterministic choice of the selected atom $A _ { i }$ for unification. In what follows it is assumed that this is given by some function which for a given goal selects the subgoal for unification. The function is called the selection function or the computation rule. It is sometimes desirable to generalize this concept so that, in one situation, the computation rule selects one subgoal from a goal $G$ but, in another situation, selects another subgoal from $G$ . In that case the computation rule is not a function on goals but something more complicated. However, for the purpose of this book this extra generality is not needed.

The inference rule presented above is the only one needed for definite programs. It is a version of the inference rule called the resolution principle, which was introduced by J. A. Robinson in 1965. The resolution principle applies to clauses. Since definite clauses are restricted clauses the corresponding restricted form of resolution presented below is called SLD-resolution (Linear resolution for Definite clauses with Selection function).

Next the use of the SLD-resolution principle is discussed for a given definite program $P$ . The starting point, as exemplified in Section 3.1, is a definite goal clause $G _ { 0 }$ of the form:

$$
 A _ { 1 } , \dotsc , A _ { m } \qquad ( m \geq 0 )
$$

From this goal a subgoal $A _ { i }$ is selected (if possible) by the computation rule. A new goal clause $G _ { 1 }$ is constructed by selecting (if possible) some renamed program clause $B _ { 0 }  B _ { 1 } , . . . , B _ { n }$ ( $n \geq 0$ ) whose head unifies with $A _ { i }$ (resulting in an mgu $\theta _ { 1 }$ ). If so, $G _ { 1 }$ will be of the form:

$$
 ( A _ { 1 } , \ldots , A _ { i - 1 } , B _ { 1 } , \ldots , B _ { n } , A _ { i + 1 } , \ldots , A _ { m } ) \theta _ { 1 }
$$

(According to the requirement above, the variables of the program clause are being renamed so that they are different from those of $G _ { 0 }$ .) Now it is possible to apply the resolution principle to $G _ { 1 }$ thus obtaining $G _ { 2 }$ , etc. This process may or may not terminate. There are two cases when it is not possible to obtain $G _ { i + 1 }$ from $G _ { i }$ :

• the first is when the selected subgoal cannot be resolved (i.e. is not unifiable) with the head of any program clause; • the other case appears when $G _ { i } = \boldsymbol { \boxed { \mathbf { \lambda } } }$ (i.e. the empty goal).

The process described above results in a finite or infinite sequence of goals starting with the initial goal. At every step a program clause (with renamed variables) is used to resolve the subgoal selected by the computation rule $\Re$ and an mgu is created. Thus, the full record of a reasoning step would be a pair $\langle G _ { i } , C _ { i } \rangle$ , $i \geq 0$ , where $G _ { i }$ is a goal and $C _ { i }$ a program clause with renamed variables. Clearly, the computation rule $\Re$ together with $G _ { i }$ and $C _ { i }$ determines (up to renaming of variables) the mgu (to be denoted $\theta _ { i + 1 }$ ) produced at the $( i + 1 )$ -th step of the process. A goal $G _ { i + 1 }$ is said to be derived (directly) from $G _ { i }$ and $C _ { i }$ via $\Re$ (or alternatively, $G _ { i }$ and $C _ { i }$ resolve into $G _ { i + 1 }$ ).

Definition 3.12 (SLD-derivation) Let $G _ { 0 }$ be a definite goal, $P$ a definite program and $\Re$ a computation rule. An SLD-derivation of $G _ { 0 }$ (using $P$ and $\Re$ ) is a finite or infinite sequence of goals:

$$
{ \cal G } _ { 0 } \stackrel { C _ { 0 } } {  } { \cal G } _ { 1 } \cdot \cdot \cdot { \cal G } _ { n - 1 } \stackrel { C _ { n - 1 } } {  } { \cal G } _ { n } \ldots .
$$

where each $G _ { i + 1 }$ is derived directly from $G _ { i }$ and a renamed program clause $C _ { i }$ via $\Re$ .

Note that since there are usually infinitely many ways of renaming a clause there are formally infinitely many derivations. However, some of the derivations differ only in the names of the variables used. To avoid some technical problems and to make the renaming of variables in a derivation consistent, the variables in the clause $C _ { i }$ of a derivation are renamed by adding the subscript $i$ to every variable in the clause. In what follows we consider only derivations where this renaming strategy is used.

Each finite SLD-derivation of the form:

$$
{ \cal G } _ { 0 } \stackrel { C _ { 0 } } { \sim } { \cal G } _ { 1 } \cdot \cdot \cdot { \cal G } _ { n - 1 } \stackrel { C _ { n - 1 } } { \sim } { \cal G } _ { n }
$$

yields a sequence $\theta _ { 1 } , \ldots , \theta _ { n }$ of mgu’s. The composition

$$
\theta : = { \left\{ \begin{array} { l l } { \theta _ { 1 } \theta _ { 2 } \cdot \cdot \cdot \theta _ { n } } & { { \mathrm { i f ~ } } n > 0 } \\ { \epsilon } & { { \mathrm { i f ~ } } n = 0 } \end{array} \right. }
$$

of mgu’s is called the computed substitution of the derivation.

Example 3.13 Consider the initial ${ \mathrm { g o a l } }  p r o u d ( Z )$ and the program discussed in Section 3.1.

$$
\begin{array} { r l } { G _ { 0 } } & { : \mathrm { ~ }  p r o u d ( Z ) . } \\ { C _ { 0 } } & { : \mathrm { ~ } p r o u d ( X _ { 0 } )  p a r e n t ( X _ { 0 } , Y _ { 0 } ) , n e w b o r n ( Y _ { 0 } ) . } \end{array}
$$

Unification of $p r o u d ( Z )$ and $p r o u d ( X _ { 0 } )$ yields e.g. the mgu $\theta _ { 1 } = \{ X _ { 0 } / Z \}$ . Assume that a computation rule which always selects the leftmost subgoal is used (if nothing else is said, this computation rule is used also in what follows). Such a computation rule will occasionally be referred to as Prolog’s computation rule since this is the computation rule used by most Prolog systems. The first derivation step yields:

$$
\begin{array} { r c l } { { G _ { 1 } } } & { { : } } & { {  p a r e n t ( Z , Y _ { 0 } ) , n e w b o r n ( Y _ { 0 } ) . } } \\ { { } } & { { } } & { { } } \\ { { C _ { 1 } } } & { { : } } & { { p a r e n t ( X _ { 1 } , Y _ { 1 } )  f a t h e r ( X _ { 1 } , Y _ { 1 } ) . } } \end{array}
$$

In the second resolution step the mgu $\theta _ { 2 } = \{ X _ { 1 } / Z , Y _ { 1 } / Y _ { 0 } \}$ is obtained. The derivation then proceeds as follows:

$$
\begin{array} { r c l } { { G _ { 2 } } } & { { : } } & { {  f a t h e r ( Z , Y _ { 0 } ) , n e w b o r n ( Y _ { 0 } ) . } } \\ { { C _ { 2 } } } & { { : } } & { { f a t h e r ( a d a m , m a r y ) . } } \\ { { } } & { { } } & { { } } \\ { { G _ { 3 } } } & { { : } } & { {  n e w b o r n ( m a r y ) . } } \\ { { C _ { 3 } } } & { { : } } & { { n e w b o r n ( m a r y ) . } } \\ { { } } & { { } } & { { } } \\ { { G _ { 4 } } } & { { : } } & { { \sqsupset } } \end{array}
$$

The computed substitution of this derivation is:

$$
\begin{array} { l l l } { { \theta _ { 1 } \theta _ { 2 } \theta _ { 3 } \theta _ { 4 } } } & { { = } } & { { \{ X _ { 0 } / Z \} \{ X _ { 1 } / Z , Y _ { 1 } / Y _ { 0 } \} \{ Z / a d a m , Y _ { 0 } / m a r y \} \epsilon } } \\ { { } } & { { = } } & { { \{ X _ { 0 } / a d a m , X _ { 1 } / a d a m , Y _ { 1 } / m a r y , Z / a d a m , Y _ { 0 } / m a r y \} } } \end{array}
$$

A derivation like the one above is often represented graphically as in Figure 3.1.

Example 3.14 Consider the following definite program:

![](images/d2139bf8de108ff533b6404c191e170b7b9958855a42c4623e2c99598c38fc52.jpg)  
Figure 3.3: SLD-derivation

Figure 3.3 depicts a finite SLD-derivation of the goal $\longleftarrow$ grandfather $( a , X )$ (again using Prolog’s computation rule).

SLD-derivations that end in the empty goal (and the bindings of variables in the initial goal of such derivations) are of special importance since they correspond to refutations of (and provide answers to) the initial goal:

Definition 3.15 (SLD-refutation) A (finite) SLD-derivation:

$$
G _ { 0 } \stackrel { C _ { 0 } } {  } G _ { 1 } \cdot \cdot \cdot G _ { n } \stackrel { C _ { n } } {  } G _ { n + 1 }
$$

where $G _ { n + 1 } = \boldsymbol { \Pi }$ is called an $S L D$ -refutation of $G _ { 0 }$ .

Definition 3.16 (Computed answer substitution) The computed substitution of an SLD-refutation of $G _ { 0 }$ restricted to the variables in $G _ { 0 }$ is called a computed answer substitution for $G _ { 0 }$ . ■

In Examples 3.13 and 3.14 the computed answer substitutions are $\left\{ Z / a d a m \right\}$ and $\{ X / c \}$ respectively.

For a given initial goal $G _ { 0 }$ and computation rule, the sequence $G _ { 1 } , \ldots , G _ { n + 1 }$ of goals in a finite derivation $G _ { 0 }  G _ { 1 } \cdot \cdot \cdot G _ { n }  G _ { n + 1 }$ is determined (up to renaming of variables) by the sequence $C _ { 0 } , \ldots , C _ { n }$ of (renamed) program clauses used. This is particularly interesting in the case of refutations. Let:

$$
G _ { 0 } \stackrel { C _ { 0 } } {  } G _ { 1 } \cdot \cdot \cdot G _ { n } \stackrel { C _ { n } } {  } \sqsubseteq
$$

be a refutation. It turns out that if the computation rule is changed there still exists another refutation:

$$
G _ { 0 } \stackrel { C _ { 0 } ^ { \prime } } { \sim } G _ { 1 } ^ { \prime } \cdot \cdot \cdot G _ { n } ^ { \prime } \stackrel { C _ { n } ^ { \prime } } { \sim } \sqsubseteq
$$

![](images/e7e891dd3076bd53f320188b47e0a4d9f1b55bc9a62d497f2e0655a499fb5a40.jpg)  
Figure 3.4: Failed SLD-derivation

of $G _ { 0 }$ which has the same computed answer substitution (up to renaming of variables) and where the sequence $C _ { 0 } ^ { \prime } , \ldots , C _ { n } ^ { \prime }$ of clauses used is a permutation of the sequence $C _ { 0 } , \ldots , C _ { n }$ . This property will be called independence of the computation rule and it will be discussed further in Section 3.6.

Not all SLD-derivations lead to refutations. As already pointed out, if the selected subgoal cannot be unified with any clause, it is not possible to extend the derivation any further:

Definition 3.17 (Failed derivation) A derivation of a goal clause $G _ { 0 }$ whose last element is not empty and cannot be resolved with any clause of the program is called a failed derivation. ■

Figure 3.4 depicts a failed derivation of the program and goal in Example 3.14. Since the selected literal (the leftmost one) does not unify with the head of any clause in the program, the derivation is failed. Note that a derivation is failed even if there is some other subgoal but the selected one which unifies with a clause head.

By a complete derivation we mean a refutation, a failed derivation or an infinite derivation. As shown above, a given initial goal clause $G _ { 0 }$ may have many complete derivations via a given computation rule $\Re$ . This happens if the selected subgoal of some goal can be resolved with more than one program clause. All such derivations may be represented by a possibly infinite tree called the SLD-tree of $G _ { 0 }$ (using $P$ and $\Re$ ).

Definition 3.18 (SLD-tree) Let $P$ be a definite program, $G _ { 0 }$ a definite goal and $\Re$ a computation rule. The SLD-tree of $G _ { 0 }$ (using $P$ and $\Re$ ) is a (possibly infinite) labelled tree satisfying the following conditions:

• the root of the tree is labelled by $G _ { 0 }$ ; if the tree contains a node labelled by $G _ { i }$ and there is a renamed clause $C _ { i } \in P$ such that $G _ { i + 1 }$ is derived from $G _ { i }$ and $C _ { i }$ via $\Re$ then the node labelled by $G _ { i }$ has a child labelled by $G _ { i + 1 }$ . The edge connecting them is labelled by $C _ { i }$ .

![](images/be0899957c6a330e32322abf62ea050882b09410f6e4e7dad898bc44c22a5037.jpg)  
Figure 3.5: SLD-tree of $\longleftarrow$ grandfather $( a , X )$

The nodes of an SLD-tree are thus labelled by goals of a derivation. The edges are labelled by the clauses of the program. There is in fact a one-to-one correspondence between the paths of the SLD-tree and the complete derivations of $G _ { 0 }$ under a fixed computation rule $\Re$ . The sequence:

$$
G _ { 0 } \stackrel { C _ { 0 } } { \sim } G _ { 1 } \cdot \cdot \cdot G _ { k } \stackrel { C _ { k } } { \sim } \cdot \cdot \cdot
$$

is a complete derivation of $G _ { 0 }$ via $\Re$ iff there exists a path of the SLD-tree of the form $G _ { 0 } , G _ { 1 } , \dots , G _ { k } , \dots$ such that for every $_ i$ , the edge $\left. \boldsymbol { G } _ { i } , \boldsymbol { G } _ { i + 1 } \right.$ is labelled by $C _ { i }$ . Usually this label is abbreviated (e.g. by numbering the clauses of the program) or omitted when drawing the tree. Additional labelling with the mgu $\theta _ { i + 1 }$ or some part of it may also be included.

Example 3.19 Consider again the program of Example 3.14. The SLD-tree of the $\mathrm { g o a l }  g r a n d f a t h e r ( a , X )$ is depicted in Figure 3.5. ■

The SLD-trees of a goal clause $G _ { 0 }$ are often distinct for different computation rules. It may even happen that the SLD-tree for $G _ { 0 }$ under one computation rule is finite whereas the SLD-tree of the same goal under another computation rule is infinite. However, the independence of computation rules means that for every refutation path in one SLD-tree there exists a refutation path in the other SLD-tree with the same length and with the same computed answer substitution (up to renaming). The sequences of clauses labelling both paths are permutations of one another.

# 3.4 Soundness of SLD-resolution

The method of reasoning presented informally in Section 3.1 was formalized as the SLD-resolution principle in the previous section. As a matter of fact one more inference rule is used after construction of a refutation. It applies the computed substitution of the refutation to the body of the initial goal to get the final conclusion. This is the most interesting part of the process since if the initial goal is seen as a query, the computed substitution of the refutation restricted to its variables is an answer to this query. It is therefore called a computed answer substitution. In this context it is also worth noticing the case when no answer substitution exists for a given query. Prolog systems may sometimes discover this and deliver a “no” answer. The logical meaning of “no” will be discussed in the next chapter.

As discussed in Chapter 1, the introduction of formal inference rules raises the questions of their soundness and completeness. Soundness is an essential property which guarantees that the conclusions produced by the system are correct. Correctness in this context means that they are logical consequences of the program. That is, that they are true in every model of the program. Recall the discussion of Chapter 2 — a definite program describes many “worlds” (i.e. models), including the one which is meant by the user, the intended model. Soundness is necessary to be sure that the conclusions produced by any refutation are true in every world described by the program, in particular in the intended one.

This raises the question concerning the soundness of the SLD-resolution principle. The discussion in Section 3.1 gives some arguments which may by used in a formal proof. However, the intermediate conclusions produced at every step of refutation are of little interest for the user of a definite program. Therefore the soundness of SLDresolution is usually understood as correctness of computed answer substitutions. This can be stated as the following theorem (due to Clark (1979)).

Theorem 3.20 (Soundness of SLD-resolution) Let $P$ be a definite program, $\Re$ a computation rule and $\theta$ an $\Re$ -computed answer substitution for a $\operatorname { g o a l }  A _ { 1 } , \dotsc , A _ { m }$ . Then $\forall ( ( A _ { 1 } \land \cdots \land A _ { m } ) \theta )$ is a logical consequence of the program. ■

Proof : Any computed answer substitution is obtained by a refutation of the goal via $\Re$ .   
The proof is based on induction over the number of resolution steps of the refutation.

First consider refutations of length one. This is possible only if $m = 1$ and $A _ { 1 }$ resolves with some fact $A$ with the mgu $\theta _ { 1 }$ . Hence $A _ { 1 } \theta _ { 1 }$ is an instance of $A$ . Now let $\theta$ be $\theta _ { 1 }$ restricted to the variables in $A _ { 1 }$ . Then $A _ { 1 } \theta = A _ { 1 } \theta _ { 1 }$ . It is a well-known fact that the universal closure of an instance of a formula $F ^ { \dagger }$ is a logical consequence of the universal closure of $F ^ { \dagger }$ (cf. exercise 1.9, Chapter 1). Hence the universal closure of $A _ { 1 } \theta$ is a logical consequence of the clause $A$ and consequently of the program $P$ .

Next, assume that the theorem holds for refutations with $n - 1$ steps. Take a refutation with $n$ steps of the form:

$$
{ \cal G } _ { 0 } \stackrel { C _ { 0 } } { \sim } { \cal G } _ { 1 } \cdot \cdot \cdot { \cal G } _ { n - 1 } \stackrel { C _ { n - 1 } } { \sim } \sqsubseteq
$$

where $G _ { 0 }$ is the original goal clause $ A _ { 1 } , \ldots , A _ { m }$ .

Now, assume that $A _ { j }$ is the selected atom in the first derivation step and that $C _ { 0 }$ is a (renamed) clause $B _ { 0 }  B _ { 1 } , . . . , B _ { k }$ ( $k \geq 0$ ) in $P$ . Then $A _ { j } \theta _ { 1 } = B _ { 0 } \theta _ { 1 }$ and $G _ { 1 }$ has to be of the form:

$$
 ( A _ { 1 } , \ldots , A _ { j - 1 } , B _ { 1 } , \ldots , B _ { k } , A _ { j + 1 } , \ldots , A _ { m } ) \theta _ { 1 }
$$

By the induction hypothesis the formula:

$$
\forall ( A _ { 1 } \land \dotsc \land A _ { j - 1 } \land B _ { 1 } \land \dotsc \land B _ { k } \land A _ { j + 1 } \land \dotsc \land A _ { m } ) \theta _ { 1 } \dotsc \theta _ { n }
$$

is a logical consequence of the program. It follows by definition of logical consequence that also the universal closure of:

$$
( B _ { 1 } \wedge . . . \wedge B _ { k } ) \theta _ { 1 } \cdot \cdot \cdot \theta _ { n }
$$

is a logical consequence of the program. By (11):

$$
\forall ( A _ { 1 } \land \dotsc \land A _ { j - 1 } \land A _ { j + 1 } \land \dotsc \land A _ { m } ) \theta _ { 1 } \dotsc \theta _ { n }
$$

is a logical consequence of $P$ . Now because of (12) and since:

$$
\forall ( B _ { 0 } \gets B _ { 1 } \land \dots \land B _ { k } ) \theta _ { 1 } \colon \cdot \cdot \theta _ { n }
$$

is a logical consequence of the program (being an instance of a clause in $P$ ) it follows that:

$$
\forall B _ { 0 } \theta _ { 1 } \cdot \cdot \cdot \theta _ { n }
$$

is a logical consequence of $P$ . Hence by (13) and (14):

$$
\forall ( A _ { 1 } \land \dotsc \land A _ { j - 1 } \land B _ { 0 } \land A _ { j + 1 } \land \dotsc \land A _ { m } ) \theta _ { 1 } \dotsc \theta _ { n }
$$

is also a logical consequence of the program. But since $\theta _ { 1 }$ is a most general unifier of $B _ { 0 }$ and $A _ { j }$ , $B _ { 0 }$ can be replaced by $A _ { j }$ in (15). Now let $\theta$ be $\theta _ { 1 } \cdots \theta _ { n }$ restricted to the variables in $A _ { 1 } , \ldots , A _ { m }$ then:

$$
\forall ( A _ { 1 } \land \dots \land A _ { m } ) \theta
$$

is a logical consequence of $P$ , which concludes the proof.

It should be noticed that the theorem does not hold if the unifier is computed by a “unification” algorithm without occur-check. For illustration consider the following example.

Example 3.21 A term is said to be $f$ -constructed with a term $T$ if it is of the form $f ( T , Y )$ for any term $Y$ . A term $X$ is said to be bizarre if it is $f$ -constructed with itself. (As discussed in Section 3.2 there are no “bizarre” terms since no term can include itself as a proper subterm.) Finally a term $X$ is said to be crazy if it is the second direct substructure of a bizarre term. These statements can be formalized as the following definite program:

Now consider the $\mathrm { g o a l }  c r a z y ( X )$ — representing the query “Are there any crazy terms?”. There is only one complete SLD-derivation (up to renaming). Namely:

$$
\begin{array} { r c l } { { G _ { 0 } } } & { { : \  \ c r a z y ( X ) } } & { { } } \\ { { C _ { 0 } } } & { { : \ c r a z y ( X _ { 0 } )  b i z a r r e ( f ( Y _ { 0 } , X _ { 0 } ) ) } } & { { } } \\ { { } } & { { } } & { { } } \\ { { G _ { 1 } } } & { { : \  \ b i z a r r e ( f ( Y _ { 0 } , X ) ) } } & { { } } \\ { { C _ { 1 } } } & { { : \ b i z a r r e ( X _ { 1 } )  f \_ c o n s t r u c t e d ( X _ { 1 } , X _ { 1 } ) } } & { { } } \\ { { } } & { { } } & { { } } \\ { { G _ { 2 } } } & { { : \  \ f _ { - c o n s t r u c t e d ( f ( Y _ { 0 } , X ) , f ( Y _ { 0 } , X ) ) } } } & { { } } \end{array}
$$

The only subgoal in $G _ { 2 }$ does not unify with the first program clause because of the occur-check. This corresponds to our expectations: Since, in the intended model, there are no bizarre terms, there cannot be any crazy terms. Since SLD-resolution is sound, if there were any answers to $G _ { 0 }$ they would be correct also in the intended model.

Assume now that a “unification” algorithm without occur-check is used. Then the derivation can be extended as follows:

$$
\begin{array} { l l l } { { G _ { 2 } } } & { { : } } & { {  f _ { - } c o n s t r u c t e d ( f ( Y _ { 0 } , X ) , f ( Y _ { 0 } , X ) ) } } \\ { { C _ { 2 } } } & { { : } } & { { f _ { - } c o n s t r u c t e d ( f ( T _ { 2 } , Y _ { 2 } ) , T _ { 2 } ) } } \\ { { } } & { { } } & { { } } \\ { { G _ { 3 } } } & { { : } } & { { \sqsupset } } \end{array}
$$

The “substitution” obtained in the last step is $\{ X / Y _ { 2 } , Y _ { 0 } / f ( \infty , Y _ { 2 } ) , T _ { 2 } / f ( \infty , Y _ { 2 } ) \}$ (see Section 3.2). The resulting answer substitution is $\{ X / Y _ { 2 } \}$ . In other words the conclusion is that every term is crazy, which is not true in the intended model. Thus it is not a logical consequence of the program which shows that the inference is no longer sound. ■

# 3.5 Completeness of SLD-resolution

Another important problem is whether all correct answers for a given goal (i.e. all logical consequences) can be obtained by SLD-resolution. The answer is given by the following theorem, called the completeness theorem for SLD-resolution (due to Clark (1979)).

Theorem 3.22 (Completeness of SLD-resolution) Let $P$ be a definite program, $ A _ { 1 } , \ldots , A _ { n }$ a definite goal and $\Re$ a computation rule. If $P \models \forall ( A _ { 1 } \land \cdots \land A _ { n } ) \sigma$ , there exists a refutation of $ A _ { 1 } , \ldots , A _ { n }$ via $\Re$ with the computed answer substitution $\theta$ such that $( A _ { 1 } \land \cdots \land A _ { n } ) \sigma$ is an instance of $( A _ { 1 } \land \cdots \land A _ { n } ) \theta$ . ■

The proof of the theorem is not very difficult but is rather long and requires some auxiliary notions and lemmas. It is therefore omitted. The interested reader is referred to e.g. Apt (1990), Lloyd (1987), St¨ark (1990) or Doets (1994).

Theorem 3.22 shows that even if all correct answers cannot be computed using SLD-resolution, every correct answer is an instance of some computed answer. This is due to the fact that only most general unifiers — not arbitrary unifiers — are computed in derivations. However every particular correct answer is a special instance of some computed answer since all unifiers can always be obtained by further instantiation of a most general unifier.

![](images/34adabde8d9a7cf2e52568c0324ec12bb5e60dd7aa8ff633ceb2f1c9cf2f1add.jpg)  
Figure 3.6: Depth-first search with backtracking

Example 3.23 Consider the goal clause $ p ( X )$ and the following program:

$$
\begin{array} { l } { { p ( f ( Y ) ) . } } \\ { { q ( a ) . } } \end{array}
$$

Clearly, $\{ X / f ( a ) \}$ is a correct answer to the goal — that is:

$$
\{ p ( f ( Y ) ) , q ( a ) \} \vdash p ( f ( a ) )
$$

However, the only computed answer substitution (up to renaming) is $\{ X / f ( Y _ { 0 } ) \}$ .   
Clearly, this is a more general answer than $\{ X / f ( a ) \}$ .

The completeness theorem confirms existence of a refutation which produces a more general answer than any given correct answer. However the problem of how to find this refutation is still open. The refutation corresponds to a complete path in the SLD-tree of the given goal and computation rule. Thus the problem reduces to a systematic search of the SLD-tree. Existing Prolog systems often exploit some ordering on the program clauses, e.g. the textual ordering in the source program. This imposes the ordering on the edges descending from a node of the SLD-tree. The tree is then traversed in a depth-first manner following this ordering. For a finite SLD-tree this strategy is complete. Whenever a leaf node of the SLD-tree is reached the traversal continues by backtracking to the last preceding node of the path with unexplored branches (see Figure 3.6). If it is the empty goal the answer substitution of the completed refutation is reported before backtracking. However, as discussed in Section 3.3 the SLD-tree may be infinite. In this case the traversal of the tree will never terminate and some existing answers may never be computed. This can be avoided by a different strategy of tree traversal, like for example the breadth-first strategy illustrated in Figure 3.7. However this creates technical difficulties in implementation due to very complicated memory management being needed in the general case. Because of this, the majority of Prolog systems use the depth-first strategy for traversal of the SLDtree.

![](images/39010c0aede3a7fccd241ac7d2379425925123f9863798d80348483efdcd83d1.jpg)  
Figure 3.7: Breadth-first search

# 3.6 Proof Trees

The notion of SLD-derivation resembles the notion of derivation used in formal grammars (see Chapter 10). By analogy to grammars a derivation can be mapped into a graph called a derivation tree. Such a tree is constructed by combining together elementary trees representing renamed program clauses. A definite clause of the form:

$$
A _ { 0 }  A _ { 1 } , . . . , A _ { n } \qquad ( n \geq 0 )
$$

is said to have an elementary tree of one of the forms:

$$
\begin{array} { c c } { { \begin{array} { c c } { { A _ { 0 } } } & { { } } \\ { { } } \\ { { \hat { A _ { 1 } } \cdots \hat { A _ { n } } } } \end{array} \quad \quad \quad \quad \quad \begin{array} { c c } { { \hat { A _ { 0 } } } } & { { } } \\ { { } } & { { } } \\ { { \hat { \big \vert } } } & { { \mathrm { i f } n = 0 } } \end{array} } } \end{array} \quad \quad \quad \quad \begin{array} { c c } { { \hat { A _ { 0 } } } } \\ { { \big \vert } } & { { { } } } \\ { { \hat { \big \vert } } } & { { { } } } \end{array} \quad \mathrm { i f } n = 0 
$$

Elementary trees from a definite program $P$ may be combined into derivation trees by combining the root of a (renamed) elementary tree labelled by $p ( s _ { 1 } , \ldots , s _ { n } )$ with the leaf of another (renamed) elementary tree labelled by $p ( t _ { 1 } , \ldots , t _ { n } )$ . The joint node is labelled by an equation $p ( t _ { 1 } , \ldots , t _ { n } ) \doteq p ( s _ { 1 } , \ldots , s _ { n } )$ .2 A derivation tree is said to be complete if it is a tree and all of its leaves are labelled by $-$ . Complete derivation trees are also called proof trees. Figure 3.8 depicts a proof tree built out of the following elementary trees from the program in Example 3.14:

![](images/3590ab14e7ceaef2fb91f45f1cd8908bce7e474391a6b93265e3b42391337553.jpg)  
Figure 3.8: Consistent proof tree

![](images/bed18a6d8eec466f600bed53ca78feacaccd7a6017cf064825f69d67bcb7fec0.jpg)

A derivation tree or a proof tree can actually be viewed as a collection of equations. In the particular example above:

$$
\ L _ { 0 } \doteq a , Y _ { 0 } \doteq b , Y _ { 0 } \doteq X _ { 1 } , Z _ { 0 } \doteq Y _ { 1 } , X _ { 1 } \doteq b , Y _ { 1 } \doteq c
$$

In this example the equations can be transformed into solved form:

$$
\{ X _ { 0 } \doteq a , Y _ { 0 } \doteq b , X _ { 1 } \doteq b , Z _ { 0 } \doteq c , Y _ { 1 } \doteq c \}
$$

A derivation tree or proof tree whose set of equations has a solution (i.e. can be transformed into a solved form) is said to be consistent. Note that the solved form may be obtained in many different ways. The solved form algorithm is not specific as to what equation to select from a set — any selection order yields an equivalent solved form.

Not all derivation trees are consistent. For instance, the proof tree in Figure 3.9 does not contain a consistent collection of equations since the set:

$$
\{ X _ { 0 } \doteq a , Y _ { 0 } \doteq b , Y _ { 0 } \doteq X _ { 1 } , Z _ { 0 } \doteq c , X _ { 1 } \doteq a , Y _ { 1 } \doteq b \}
$$

does not have a solved form.

The idea of derivation trees may easily be extended to incorporate also atomic goals. An atomic goal $ A$ may be seen as an elementary tree with a single node, labelled by $A$ , which can only be combined with the root of other elementary trees. For instance, proof tree $( a )$ in Figure 3.10 is a proof tree involving the $\mathrm { g o a l }  g r a n d f a t h e r ( X , Y )$ . Note that the solved form of the associated set of equations provides an answer to the initial goal — for instance, the solved form:

$$
\{ X \doteq a , Y \doteq c , X _ { 0 } \doteq a , Y _ { 0 } \doteq b , Y _ { 0 } \doteq X _ { 1 } , Z _ { 0 } \doteq Y _ { 1 } , X _ { 1 } \doteq b , Y _ { 1 } \doteq c \}
$$

![](images/bf6cdd0cf342e875a9765c3d66cc3a8cb07c6aeda0e2e73164c076dc69cea0aa.jpg)  
Figure 3.9: Inconsistent proof tree

of the equations associated with proof tree $( a )$ in Figure 3.10 provides an answer substitution $\{ X / a , Y / c \}$ to the initial goal.

The solved form of the equations in a consistent derivation tree can be used to simplify the derivation tree by instantiating the labels of the tree. For instance, applying the substitution $\{ X / a , Y / c , X _ { 0 } / a , Y _ { 0 } / b , Z _ { 0 } / c , X _ { 1 } / b , Y _ { 1 } / c \}$ (corresponding to the solved form above) to the nodes in the proof tree yields a new proof tree (depicted in Figure 3.11). However, nodes labelled by equations of the form $A \doteq A$ will usually be abbreviated $A$ so that the tree in Figure 3.11 is instead written as the tree ( $d$ ) in Figure 3.10. The equations of the simplified tree are clearly consistent.

Thus the search for a consistent proof tree can be seen as two interleaving processes: The process of combining elementary trees and the simplification process working on the equations of the already constructed part of the derivation tree. Note in particular that it is not necessary to simplify the whole tree at once — the tree $[ a ]$ has the following associated equations:

$$
\{ X \doteq X _ { 0 } , Y \doteq Z _ { 0 } , X _ { 0 } \doteq a , Y _ { 0 } \doteq b , \underline { { Y _ { 0 } } } \doteq X _ { 1 } , \underline { { Z _ { 0 } \stackrel { . } { = } } } Y _ { 1 } , X _ { 1 } \doteq b , Y _ { 1 } \doteq c \}
$$

Instead of solving all equations only the underlined equations may be solved, resulting in an mgu $\theta _ { 1 } = \{ Y _ { 0 } / X _ { 1 } , Z _ { 0 } / Y _ { 1 } \}$ . This may be applied to the tree ( $a$ ) yielding the tree $( b )$ . The associated equations of the new tree can be obtained by applying $\theta _ { 1 }$ to the previous set of equations after having removed the previously solved equations:

$$
\{ X \doteq X _ { 0 } , Y \doteq Y _ { 1 } , X _ { 0 } \doteq a , X _ { 1 } \doteq b , \underline { { X _ { 1 } } } \doteq b , \underline { { Y _ { 1 } } } \doteq c \}
$$

Solving of the new underlined equations yields a mgu $\theta _ { 2 } = \{ X _ { 1 } / b , Y _ { 1 } / c \}$ resulting in the tree $( c )$ and a new set of equations:

$$
\{ X \doteq X _ { 0 } , Y \doteq c , X _ { 0 } \doteq a , b \doteq b \}
$$

Solving all of the remaining equations yields $\theta _ { 3 } = \{ X / a , Y / c , X _ { 0 } / a \}$ and the final tree $( d )$ which is trivially consistent.

Notice that we have not mentioned how proof trees are to be constructed or in which order the equations are to be solved or checked for consistency. In fact, a whole spectrum of strategies is possibile. One extreme is to first build a complete proof tree and then check if the equations are consistent. At the other end of the spectrum equations may be checked for consistency while building the tree. In this case there are two possibilities — either the whole set of equations is checked every time a new equation is added or the tree is simplified by trying to solve equations as soon as they are generated. The latter is the approach used in Prolog — the tree is built in a depth-first manner from left to right and each time a new equation is generated the tree is simplified.

![](images/71a3ed7709735ac8ce429e38cc947cf886d10a5f8a0b277a712766e1d9d04284.jpg)

![](images/605800eeeebc06e85797469f9c65db0fd0929def1f77d1acba80fffbd2e287ac.jpg)  
Figure 3.10: Simplification of proof tree

From the discussion above it should be clear that many derivations may map into the same proof tree. This is in fact closely related to the intuition behind the independence of the computation rule — take “copies” of the clauses to be combined together. Rename each copy so that it shares no variables with the other copies. The clauses are then combined into a proof tree. A computation rule determines the order in which the equations are to be solved but the solution obtained is independent of this order (up to renaming of variables).

![](images/9f03476082fe33db6c3ab20c9aae979d786bcfbc9d0f563e2863d4105b7670db.jpg)  
Figure 3.11: Resolved proof tree

# Exercises

3.1 What are the mgu’s of the following pairs of atoms:

$$
\begin{array} { l l } { p ( X , f ( X ) ) } & { p ( Y , f ( a ) ) } \\ { p ( f ( X ) , Y , g ( Y ) ) } & { p ( Y , f ( a ) , g ( a ) ) } \\ { p ( X , Y , X ) } & { p ( f ( Y ) , a , f ( Z ) ) } \\ { p ( a , X ) } & { p ( X , f ( X ) ) } \end{array}
$$

3.2 Let $\theta$ be an mgu of $s$ and $t$ and $\omega$ a renaming substitution. Show that $\theta \omega$ is an mgu of $s$ and $t$ .

3.3 Let $\theta$ and $\sigma$ be substitutions. Show that if $\theta \preceq \sigma$ and $\sigma \preceq \theta$ then there exists a renaming substitution $\omega$ such that $\sigma = \theta \omega$ .

3.4 Let $\theta$ be an idempotent mgu of $s$ and $t$ . Prove that $\sigma$ is a unifier of $s$ and $t$ iff $\sigma = \theta \sigma$ .

3.5 Consider the following definite program:

$$
\begin{array} { l } { { p ( Y )  q ( X , Y ) , r ( Y ) . } } \\ { { p ( X )  q ( X , X ) . } } \\ { { q ( X , X )  s ( X ) . } } \\ { { r ( b ) . } } \\ { { s ( a ) . } } \\ { { s ( b ) . } } \end{array}
$$

Draw the SLD-tree of the $\operatorname { g o a l }  p ( X )$ if Prolog’s computation rule is used. What are the computed answer substitutions?

3.6 Give an example of a definite program, a goal clause and two computation rules where one computation rule leads to a finite SLD-tree and where the other computation rule leads to an infinite tree.

3.7 How many consistent proof trees does the $\mathrm { g o a l }  p ( a , X )$ have given the program:

$$
\begin{array} { r l } & { p ( X , Y ) \gets q ( X , Y ) . } \\ & { p ( X , Y ) \gets q ( X , Z ) , p ( Z , Y ) . } \\ & { q ( a , b ) . } \\ & { q ( b , a ) . } \end{array}
$$

3.8 Let $\theta$ be a renaming substitution. Show that there is only one substitution $\sigma$ such that $\sigma \theta = \theta \sigma = \epsilon$ .

3.9 Show that if $A \in B _ { P }$ and $ A$ has a refutation of length $n$ then $A \in T _ { P } \uparrow n$ .