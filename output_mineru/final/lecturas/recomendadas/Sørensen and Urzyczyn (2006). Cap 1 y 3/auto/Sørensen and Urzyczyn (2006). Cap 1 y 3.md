# Chapter 1

# Type-free X-calculus

The $\lambda$ -calculus is a model of computation. It was introduced a few years before another such model, Turing machines.With the latter, computation is expressed by reading from and writing to a tape,and performing actions depending on the contents of the tape. Turing machines resemble programs in imperative programming languages, like Java or C.

In contrast,in $\lambda$ -calculus one is concerned with functions,and these may both take other functions as arguments,and return functions as results. In programming terms, $\lambda$ -calculus is an extremely simple higher-order, functional programming language.

In this chapter we only cover the type-free or untyped $\lambda$ -calculus. Later we introduce several variants where $\lambda$ -terms are categorized into various types.

# 1.1.A gentle introduction

Computation in $\lambda$ -calculus is expressed with $\lambda$ -terms.These are similar to the nameless function notation $n \mapsto n ^ { 2 }$ used in mathematics.However,a mathematician employs the latter notation to denote functions as mathematical objects (defined as sets of pairs).In contrast, $\lambda$ -terms are formal expressions (strings) which,intuitively,express functions and applications of functions in a pure form. Thus,a $\lambda$ -term is oneof the following:

.a variable;   
·an abstraction $\lambda x M$ ,where $\pmb { x }$ isa variable and $\pmb { M }$ isa $\lambda$ -term;   
·an application MN (of $M$ to $\pmb { N }$ ，where $M$ and $\pmb { N }$ are $\lambda$ -terms.

In an abstraction $\lambda x M$ ,thevariable $\pmb { x }$ represents the function argument (orformal parameter),and it may occur in the body $M$ of the function,but it does not have to. In an application $\mathcal { M N }$ there is no restriction on the shape of the operator $\pmb { M }$ or the argument $\pmb { N }$ ； both can bearbitrary $\lambda$ -terms.

For instance,the $\lambda$ -term ${ \bf I } = \lambda x x$ intuitively denotes a function that maps any argument to itself,i.e. the identity function.As another example, $\mathbf { K } = \lambda x \lambda y x$ represents a function mapping any argument $\pmb { \mathcal { X } }$ to the constant function that always returns $\pmb { \mathcal { Z } }$ Finally,IK expresses application of the function I to the argument K.

In mathematics we usually write the application of a function,say $f$ to an argument, say 4,with the argument in parentheses: $f ( 4 )$ , In the $\lambda$ -calculus we would rather write this as $f 4$ .The use of parentheses cannot be entirely eliminated though. For instance,the notation Xxxy would be ambiguous, and we should instead write either $( \lambda x x ) y$ if we mean an application of I to $\pmb { y }$ or $\lambda x ( x y )$ to denote an abstraction on $\pmb { x }$ with the body $\pmb { x y }$ .In the latter case,it is customary to use dot notation,i.e.to write $\lambda x . x y$ instead.Similarly we may need parentheses to disambiguate applications; for instance, $\mathbf { I } ( \mathbf { K K } )$ expresses application of I to KK

If XxM denotes a function,and $N$ denotes an argument,the “value”of the application $\{ \lambda x M \} N$ can be calculated by substituting $\pmb { N }$ for $\pmb { \mathscr { X } }$ in $\pmb { M }$ .The result of such a substitution is denoted by $M \{ x : = N \}$ ,and we formalize the calculation by the $\beta$ -reduction rule: $( \lambda x M ) N \to _ { \beta } M [ x : = N ]$ .For instance,

$$
( \mathbf { I K } ) z = ( ( \lambda x x ) \mathbf { K } ) z \to _ { \beta } x [ x : = \mathbf { K } ] z = \mathbf { K } z = ( \lambda y \lambda x y ) z \to _ { \beta } \lambda x z .
$$

This process of calculating the value of an expression is similar to common practice in mathematics； if ${ f ( n ) = n ^ { 2 } }$ ，then $f ( 4 ) = 4 ^ { 2 }$ ,and we get from the application $f ( 4 )$ to the result $4 ^ { 2 }$ by substituting $^ 4$ for $\pmb { \mathscr { n } }$ in the body of the definition of $f$ A programming language analogue is the call-by-name parameter passing mechanism,where the formal parameter of a procedure is replaced throughout by the actual parameter expression.

The variable $\pmb { x }$ ina $\lambda$ -abstraction $\lambda x M$ is bound (or local） within $\pmb { M }$ in much the same way a formal parameter of a procedure is considered local within that procedure.In contrast,a variable $\pmb { \mathcal { Y } }$ without a corresponding abstraction is called free (or global) and is similar to a global variable in most programming languages.Thus, $\pmb { x }$ is bound and $\pmb { y }$ is free in $\lambda x . x y$

Some confusion may arise when we use the same name for bound and free variables.For example,in $x ( \lambda x . x y )$ ,there are obviously two different $\pmb { x } ^ { \prime } \mathbf { s } ^ { \prime }$ the free (global) $\pmb { \mathcal { X } } .$ ,and the bound (local) $\pmb { \mathcal { X } }$ ,which is “shadowing”the free one in the body. If we instead consider the $\lambda$ -term $x ( \lambda z , z y )$ ,there is no confusion. Asanother example of confusion, $( \lambda x , x y ) [ y : = x ]$ should replace $\pmb { y }$ in $( \lambda x . x y )$ bya free variable $\pmb { x } ,$ but $\lambda x . x x$ is not the desired result.In the latter term we have lost the distinction between the formal parameter $\pmb { x }$ and the free variable $\pmb { x }$ (the free variable has been captured by the lambda). If we use a bound variable ${ \pmb z } ,$ the confusion disappears: $( \lambda z . z y ) [ y : = x ] = \lambda z . z x$

A local variable of a procedure can always be renamed without affecting the meaning of the program. Similarly, in $\lambda$ -calculus we do not care about the names of bound variables; the $\lambda$ -terms $\lambda x x$ and Ayy both denote the identity function.Because of this,it is usually assumed that terms that differ only in their bound variables are identified.This gives the freedom to choose bound variables so as to avoid any confusion, e.g.variable capture.

# 1.2.Pre-terms and X-terms

We now define the notion of a pre-term and introduce X-terms as equivalence classes of pre-terms. The section is rather dull, but necessary to make our formalism precise. However, to understand most of the book, the informal understanding of $\lambda$ -terms of the preceding section suffices.

1.2.1.DEFINITION. Let $\Upsilon$ denote a countably infinite set of symbols,henceforth called variables (also object variables or X-uariables when other kinds of variables may cause ambiguity).We define the notion of a pre-term by induction as follows:

·Every variable is a pre-term.   
·If $M , N$ are pre-terms, then $( M N )$ is a pre-term.   
·If $\pmb { \mathcal { X } }$ is a variable and $\pmb { M }$ is a pre-term, then $( \lambda x M )$ is a pre-term.

The set of all pre-terms is denoted by $\Lambda ^ { - }$ ，

REMARk. The definition can be summarized by the following grammar:

$$
M : : = x \mid ( M M ) \mid ( \lambda x M ) .
$$

In the remainder of the book,we will often use this short style of definition.

Pre-terms,as defined above,are fully parenthesized.As the pre-term $( \lambda f ( ( \lambda u ( f ( u u ) ) ) ( \lambda v ( f ( v u ) ) ) ) )$ demonstrates,the heavy use of parentheses is rather cumbersome. We therefore introduce some notational conventions, which are used informally whenever no ambiguity or confusion can arise.

# 1.2.2.CONVENTION.

(i)The outermost parentheses in a term are omitted.   
(ii) Application associates to the left: $( ( P Q ) R )$ isabbreviated $( P Q R )$   
(iii)Abstraction associates to the right: $\{ \lambda x ( \lambda y P ) \}$ is abbreviated $( \lambda x \lambda y P )$ ，   
(iv)A sequence of abstractions $( \lambda x _ { 1 } ( \lambda x _ { 2 } \ldots ( \lambda x _ { n } P ) \ldots ) )$ can be written as $\{ \lambda x _ { 1 } x _ { 2 } , . . , x _ { n } . P \}$ ,in which case the outermost parentheses in $P$ (if any） are usually omitted.1

# ExAMPLE.

· $\{ \lambda v ( v v ) \}$ may be abbreviated $\lambda v ( v v )$ by (i). · $( ( ( \lambda x x ) ( \lambda y y ) ) ( \lambda z z ) )$ may be abbreviated $( \lambda x x ) ( \lambda y y ) ( \lambda z z )$ by (i），(ii). · $( \lambda x ( \lambda y ( x y ) ) )$ is written $\lambda x \lambda y ( x y )$ by (i).(ii)or as 入xy.xy by (i),(iv). · $( \lambda f ( ( \lambda u ( f ( u u u ) ) ) ( \lambda v ( f ( v v ) ) ) ) )$ is written $\lambda f . ( \lambda u . f ( u u ) ) ( \lambda v . f ( v v ) ) .$

1.2.3.DEFINITION. Define the set $\mathbb { F V } ( M )$ of free uariables of $\pmb { M }$ as follows.

$$
\begin{array} { l c l } { \operatorname { F V } ( x ) } & { = } & { \{ x \} ; } \\ { \operatorname { F V } ( \lambda x P ) } & { = } & { \operatorname { F V } ( P ) - \{ x \} ; } \\ { \operatorname { F V } ( P Q ) } & { = } & { \operatorname { F V } ( P ) \cup \operatorname { F V } ( Q ) . } \end{array}
$$

EXAMPLE. Let $x , y , z$ be distinct variables; then $\operatorname { F V } ( ( \lambda x x ) ( \lambda y . x y z ) ) = \{ x , z \}$ There are two occurrences of $\pmb { \mathcal { X } }$ : one under $\lambda x$ and one under Xy.An occurrence of $\pmb { x }$ in $\pmb { M }$ is called boundif it is in a part of $\pmb { M }$ with shape $\lambda x L$ and free otherwise.Then ${ \pmb x } \in \mathrm { F V } ( M )$ iff there is $\widehat { \mathbf { a } } _ { \ast }$ free occurrence of $\pmb { \mathcal { X } }$ in $M$

We now define substitution of pre-terms.It will only be defined when no variable is captured as a result of the substitution.

1.2.4.DEFINITION.The substitution of $\pmb { N }$ for $\pmb { x }$ in $M$ written $M [ x : = N ]$ is defined iff no free occurrence of $\pmb { x }$ in $\pmb { M }$ is in a part of $M$ with form $\lambda y L ,$ where ${ \mathfrak { y } } \in { \mathrm { F V } } ( N )$ In such cases $M \{ x : = N \}$ is given by:2

$$
{ \begin{array} { r c l } { x [ x : = N ] } & { = } & { N ; } \\ { y [ x : = N ] } & { = } & { y , { \mathrm { ~ i f ~ } } x \neq y ; } \\ { ( P Q ) [ x : = N ] } & { = } & { P [ x : = N ] Q [ x : = N ] ; } \\ { ( \lambda x P ) [ x : = N ] } & { = } & { \lambda x P ; } \\ { ( \lambda y P ) [ x : = N ] } & { = } & { \lambda y P [ x : = N ] , { \mathrm { ~ i f ~ } } x \neq y . } \end{array} }
$$

REMARK. In the last clause, $y \not \in \mathbf { F V } \{ N \}$ or $x \notin \operatorname { F V } ( P )$

# 1.2.5.LEMMA.

(i) ${ \textsf { f } } x \not \in \operatorname { F V } ( M )$ then $M \{ x : = N \}$ is defined,and $M \{ x : = N \} = M$ (ii)If $M [ x : = N ]$ is defined then $\mathfrak { y } \in \mathrm { F V } ( M [ \mathfrak { x } : = N ] )$ iff either $y \in \operatorname { F V } ( M )$ and $x \neq y$ orboth ${ \boldsymbol { y } } \in { \mathrm { F V } } ( N )$ and $x \in \mathbb { F V } ( M )$ ， (iii)）The substitution $M [ x : = x ]$ is defined and $M [ x : = x ] = M$ (iv）If $M [ x : = y ]$ isdefined,then $M [ x : = y ]$ isof the same length as $M$

PROOF. Induction on $\pmb { M }$ .As an example we show (i) in some detail. It is clear that $M [ x : = N ]$ is defined. To show that $M [ x : = N ] = M$ consider the following cases. If $\pmb { M }$ isavariable $\pmb { \mathcal { Y } } ,$ then we must have $y \neq x ,$ and $y [ x : = N ] = y$ If $M = P Q$ then $x \notin \mathbb { F V } ( P )$ and $x \not \in { \mathrm { ~ F V } } ( Q )$ soby the induction hypothesis $P [ x : = N ] = P$ and $Q [ x : = N ] = Q$ Then also $( P Q ) [ x : = N ] = P [ x : = N ] Q [ x : = N ] = P Q$ Finally, if $\pmb { M }$ is an abstraction, we may have either $M = \lambda x P$ or $M = \lambda y \mathcal { P }$ where $x \neq y$ .In the former case, $( \lambda x P ) [ x : = N ] = \lambda x P$ In the latter case,we have $x \notin \mathbb { F V } ( P )$ so by the induction hypothesis $( \lambda y P ) [ x : = N ] = \lambda y P [ x : = N ] = \lambda y P$ □

1.2.6.LEMMA. Assume that $M [ x : = N ]$ is defined,and both $N \{ y : = L \}$ and $M [ x : = N ] [ y : = L ]$ are defined, where $x \neq y$ If $x \not \in { \mathrm { F V } } ( L )$ or $y \not \in \operatorname { F V } ( M )$ then $M \{ y : = L \}$ isdefined, $M [ y : = L ] [ x : = N [ y : = L ] ]$ is defined,and

$$
M [ x : = N ] \{ y : = L \} = M [ y : = L ] [ x : = N [ y : = L ] ] .
$$

PROOF.Induction on $\pmb { M }$ .The main case is when $M = \lambda z Q$ ,for $z \not \in \{ x , y \}$ By the assumptions

$$
\begin{array} { r l } & { x \notin \mathrm { F V } ( L ) \mathrm { ~ o r ~ } y \notin \mathrm { F V } ( Q ) ; } \\ & { z \notin \mathrm { F V } ( N ) \mathrm { ~ o r ~ } x \notin \mathrm { F V } ( Q ) ; } \\ & { z \notin \mathrm { F V } ( L ) \mathrm { ~ o r ~ } y \notin \mathrm { F V } ( Q [ x : = N ] ) . } \end{array}
$$

For the "defined" part,it remains,by the induction hypothesis,to show:

$$
\begin{array} { r l } & { \bullet \ z \notin \operatorname { F V } ( L ) \ \mathrm { o r } \ y \notin \operatorname { F V } ( Q ) ; } \\ & { \bullet \ z \notin \operatorname { F V } ( N [ y : = L ] ) \ \mathrm { o r } \ x \notin \operatorname { F V } ( Q [ y : = L ] ) . } \end{array}
$$

For the first property,if $z \in \mathbb { F V } ( \mathcal { L } )$ ,then $y \not \in \operatorname { F V } ( Q [ x : = N ] )$ ,so $y \not \in \mathrm { F V } ( Q )$ For the second property，assume $x \in \mathbb { F V } \{ Q [ { \mathcal V } : = L ] \}$ .From (i）we have $x \in \mathbb { F V } ( Q )$ ,thus $z \not \in \mathrm { F V } ( N )$ by (ii).Therefore $z \in \operatorname { F V } ( N [ y : = L ] )$ could only happen when $y \in \mathbb { F V } ( N )$ and $z \in \mathbb { F V } ( L )$ .Together with $x \in { \mathrm { F V } } ( Q )$ this contradicts (iii）.Now $( \ast )$ follows from the induction hypothesis. □

A special case of the lemma is $M [ x : = y ] [ y : = L ] = M [ x : = L ] ,$ if the substitutions are defined and $y \not \in \mathrm { F V } ( M )$

1.2.7.LEMMA.If $M [ x ; = y ]$ is defined and $y \not \in \mathrm { F V } ( M )$ then $M [ x ; = y ] [ y ; = x ]$ isdefined,and $M [ x ; = y ] [ y ; = x ] = M$ ，

PROOF.By induction with respect to $M$ one shows that the substitution is defined. The equation follows from Lemmas 1.2.5(ii) and 1.2.6. □

The next definition formalizes the idea of identifying expressions that “differ only in their bound variables."

1.2.8.DEFINITION. The relation $= _ { \alpha }$ $\pmb { \alpha }$ -conversion)is the least (i.e.smallest） transitive and reflexive relation on $\Lambda ^ { - }$ satisfying the following.

·If $y \not \in \mathrm { F V } ( M )$ and $M \{ x : = y \}$ is defined then $\lambda x M = _ { \alpha } \lambda y . M [ x : = y ] .$   
·If $M = _ { \alpha } N$ then $\lambda x M = _ { \alpha } \lambda x N$ ,for all variables $\pmb { x }$   
·If $M = _ { \alpha } N$ then $M Z = _ { \alpha } N Z$   
·If $M = _ { \alpha } N$ then $Z M = _ { \alpha } Z N$

EXAMPLE. Let $x , y$ be different variables.Then $\lambda x y . x y \ = _ { \alpha } \ \lambda y x . y x .$ but $\lambda x . x y \neq _ { \alpha } \lambda y . y x$

By Lemma 1.2.7 the relation $= _ { \alpha }$ is symmetric,so we easily obtain:

1.2.9.LEMMA. The relation of $\pmb { \alpha }$ -conversion is an equivalence relation.

Strictly speaking,the omitted proof of Lemma 1.2.9 should go by induction with respect to the definition $\mathfrak { o f } = _ { \alpha }$ .We prove the next lemma in more detail, to demonstrate this approach.

# 1.2.10.LEMMA.If $M = _ { \alpha } N$ then $\operatorname { F V } ( M ) = \operatorname { F V } ( N ) ,$

PROOF. Induction on the definition of $M = _ { \alpha } N$ If $M = _ { \alpha } N$ follows from transitivity,i.e. $M = _ { \alpha } L$ and $\underline { { \tau } } = _ { \alpha } \ N$ for some $\mathbf { \delta } _ { L , \mathrm { ~ } }$ then by the induction hypothesis $\mathrm { F V } ( M ) = \mathrm { F V } ( L )$ and $\mathrm { F V } ( L ) = \mathrm { F V } ( N )$ .If $M = N$ (i.e. $M = _ { \alpha } N$ by reflexivity） then $\operatorname { F V } ( N ) = \operatorname { F V } ( M )$ If $M = \lambda x P$ and $N = \lambda y . P [ x : = y ] { \mathrm { , } }$ where $y \not \in { \mathrm { F V } } ( P )$ and $P \{ x : = y \}$ is defined,then by Lermma 1.2.5 we have $\mathrm { F V } ( M ) = \mathrm { F V } ( P ) - \{ x \} = \mathrm { F V } ( P [ x : = y ] ) - \{ y \} = \mathrm { F V } ( N )$ If $M = \lambda x P$ and $N = \lambda x Q$ ,where $P = _ { \alpha } Q$ then by the induction hypothesis $\operatorname { F V } ( P ) = \operatorname { F V } ( Q ) .$ s0 $\operatorname { F V } ( M ) = \operatorname { F V } ( N )$ .If $M = P Z$ and $N = Q Z$ or $M = z P$ and $N = Z Q ,$ where $P = _ { \alpha } Q$ ,then we use the induction hypothesis. □

1.2.11.LEMMA.If $M = _ { \alpha } M ^ { \prime }$ and $N = _ { \alpha } N ^ { \prime }$ then $M [ x : = N ] = _ { \alpha } M ^ { t } [ x : = N ^ { t } ] ,$ provided both sides are defined.

PROOF. By induction on the definition of $M = _ { \alpha } M ^ { \prime }$ If $M \ : = \ : M ^ { \prime }$ then proceed by induction on $M$ .The only other interesting case is when we have $M \equiv \lambda z P$ and $M ^ { \prime } = \lambda y . P [ z \ : = y ]$ ，where $y \not \in \mathop { \mathrm { F V } } ( P )$ ，and $P [ z : = y ]$ is defined. If ${ \boldsymbol { \mathcal { X } } } = { \boldsymbol { \mathcal { Z } } } ,$ then $x \not \in \operatorname { F V } ( M ) = \operatorname { F V } ( M ^ { \prime } )$ by Lemma 1.2.10. Hence $M [ x : = N ] = M = _ { \alpha } M ^ { \prime } = M ^ { \prime } [ x : = N ^ { \prime } ]$ by Lemma 1.2.5.The case $\boldsymbol { x } = \boldsymbol { y }$ is similar.So assume $x \not \in \{ y , z \}$ Since $M [ x : = N ]$ is defined, $x \not \in \mathrm { F V } ( P )$ or $z \not \in \mathrm { F V } ( N )$ In the former case $M [ x : = N ] = \lambda z P$ and $x \notin \operatorname { F V } ( P [ z : = y ] )$ ， so $M ^ { \prime } [ x : = N ^ { \prime } ] = \lambda y . P [ z : = y ] = _ { \alpha } \lambda z . P$

It remains to consider the case when ${ \mathfrak { x } } \in { \mathrm { F V } } ( P )$ and $z \not \in \mathrm { F V } ( N )$ Since $M ^ { \prime } [ x : = N ^ { \prime } ] = ( \lambda y . P [ z : = y ] ) [ x : = N ^ { \prime } ]$ is defined,we have $y \not \in \mathrm { F V } ( N ^ { t } ) ,$ and thus also $\Im \not \in \mathrm { ~ F V } ( P [ x : = N ^ { \prime } ] )$ .By Lemma 1.2.6 it then follows that $M ^ { \prime } [ x : = N ^ { \prime } ] = \lambda y . P [ z : = y ] [ x : = N ^ { \prime } ] = \lambda y . P [ x : = N ^ { \prime } ] [ z : = y ] = _ { \alpha } \lambda z . P [ x : = N ^ { \prime } ]$ ， By the induction hypothesis $\lambda z . P [ x : = N ^ { I } ] = _ { \alpha } \lambda z . P [ x : = N ] = M [ x : = N ] .$ □

1.2.12. LEMMA.

(i）For all $M , N$ and $\pmb { \mathscr { X } } _ { i }$ there erists an $M ^ { \prime }$ such that $M = _ { \alpha } M ^ { t }$ and the substitution $M ^ { \prime } [ x : = N ]$ isdefined.   
(ii)For all pre-terms $M , N , P _ { 1 }$ and all variables ${ \mathfrak { X } } , { \mathfrak { Y } } .$ there erist $M ^ { \prime } , N ^ { \prime }$ such that $M ^ { t } = _ { \alpha } M$ ， $N ^ { t } = _ { \alpha } N$ ,and the substitutions $M ^ { \prime } [ x : = N ^ { \prime } ]$ and $M ^ { \prime } [ x : = N ^ { \prime } ] [ y : = P ]$ are defined.

PROOF.Induction on $M$ .The only interesting case in part (i) is $M = \lambda y P$ and $x \neq y$ Let $\pmb { z }$ bea variable different from ${ \pmb x } _ { 1 }$ not free in $N$ and not occurring in $P$ at all. Then $P [ y : = z ]$ is defined.By the induction hypothesis applied to $P [ y : = z ]$ ,there is a $P ^ { \prime }$ with $P ^ { \prime } = _ { \alpha } P [ y : = z ]$ and such that the substitution $P ^ { \prime } [ x : = N ]$ is defined.Take $M ^ { \prime } = \lambda z P ^ { \prime }$ .Then $M ^ { \prime } = _ { \alpha } M$ and $M ^ { \prime } [ x ; = N ] = \lambda z . P ^ { \prime } [ x ; = N ]$ is defined.The proof of part (ii) is similar. □

# 1.2.13.LEMMA.

(i）Jf $M N = _ { \alpha } R$ then $R = M ^ { \prime } N ^ { \prime }$ ,where $M = _ { \alpha } M ^ { \prime }$ and $N = _ { \alpha } N ^ { t }$ (i）If $\lambda x P = _ { \alpha } R ,$ then $R = \lambda y Q$ for some $Q$ ，and there is $\pmb { a }$ term $P ^ { t }$ with $\mathcal { P } = _ { \alpha } \mathcal { P } ^ { \prime }$ such that $P ^ { \prime } [ x : = y ] = _ { \alpha } Q$

PROOF. Part (i) is by induction with respect to the definition of $M N = _ { \alpha } R$ Part (ii) follows in a similar style. The main case in the proof is transitivity. Assume $\lambda x P = _ { \alpha } R$ follows from $\lambda x P = _ { \alpha } M$ and $M = _ { \alpha } R$ Bythe induction hypothesis,we have $M = \lambda z N$ and $R = \lambda y Q$ and there are $P ^ { \prime } { = } _ { \alpha } P$ and $N ^ { \prime } = _ { \alpha } N$ such that $P ^ { \prime } [ x : = z ] = _ { \alpha } N$ and $N ^ { \prime } [ z : = y ] = _ { \alpha } Q$ By Lemma 1.2.12(ii) there is $P ^ { \prime \prime } = _ { \alpha } P$ with $P ^ { \prime \prime } [ x : = z ]$ and $P ^ { \prime \prime } [ x : = z ] [ z : = y ]$ defined. Then by Lemma 1.2.11,we have $P ^ { \prime \prime } [ x : = z ] = _ { \alpha } N = _ { \alpha } N ^ { \prime }$ and thus also $P ^ { \prime \prime } [ x : = z ] [ z : = y ] = _ { \alpha } Q$ And $P ^ { \prime \prime } [ x : = z ] [ z : = y ] = P ^ { \prime \prime } [ x : = y ]$ by Lemmas 1.2.5(ii) and 1.2.6. (Note that $z \not \in \mathrm { F V } ( P ^ { \prime \prime } )$ or ${ \pmb x } = { \pmb z } .$ ） □

We are ready to define the true objects of interest: $\lambda$ -terms.

1.2.14.DEFINITION.Define the set $\pmb { \Lambda }$ of $\lambda$ -terms as the quotient set $\mathfrak { o f } = _ { \alpha }$ ：

where

$$
\begin{array} { c } { { \Lambda = \{ [ M ] _ { \alpha } \} M \in \Lambda ^ { - } \} , } } \\ { { } } \\ { { \{ N \in \Lambda ^ { - } \} M = _ { \alpha } N \} . } } \end{array}
$$

EXAMPLE. Thus,for every variable $\pmb { x }$ ,the string xx is a pre-term,while $\mathbf { I } = [ \lambda x x ] _ { \alpha } = \{ \lambda x x , \lambda y y , \dotsc \}$ where $x , y , \dots$ are all the variables,is a $\lambda$ -term.

WARNING.The notion of a pre-term and the explicit distinction between pre-terms and $\lambda$ -terms are not standard in the literature.Rather,it is customary to call our pre-terms $\lambda$ -terms and remark that ${ } ^ { 6 6 } \alpha \cdot$ -equivalent terms are identifed” (cf.the preceding section).

We can now “lift" the notions of free variables and substitution.

1.2.15.DEFINITION.The free variables $\mathbf { F V } ( M )$ of a $\lambda$ -term $M$ are defined as follows. Let $M = [ M ^ { \prime } ] _ { \alpha }$ .Then

$$
\operatorname { F V } ( M ) = \operatorname { F V } ( M ^ { \prime } ) .
$$

If $\mathbf { F V } ( M ) = \emptyset$ then we say that $\pmb { M }$ is closed or that it is a combinator.

Lemma 1.2.10 ensures that any choice of $M ^ { \prime }$ yields the same result.

1.2.16.DEFINITION.For $\lambda$ -terms $M$ and $\pmb { N }$ ,we define $M [ x : = N ]$ as follows. Let $M = [ M ^ { \prime } ] _ { \alpha }$ and $\pmb { N } = [ N ^ { \prime } ] _ { \alpha }$ where $M ^ { \prime } [ x : = N ^ { \prime } ]$ is defined. Then

$$
M [ x : = N ] = [ M ^ { \prime } [ x : = N ^ { \prime } ] ] _ { \alpha } .
$$

Here Lemma 1.2.11 ensures that any choice of $M ^ { \prime }$ and $N ^ { t }$ yields the same result,and Lemma 1.2.12 guarantees that suitable $M ^ { t }$ and $N ^ { \prime }$ can be chosen.

The term formation operations can themselves be lifted.

1.2.17.NOTATION. Let $P$ and $\boldsymbol { Q }$ be $\lambda$ -terms,and let $\pmb { x }$ bea variable.Then $P Q , \lambda x P ,$ and $\pmb { \mathcal { X } }$ denote the following unique $\lambda$ -terms:

$$
{ \begin{array} { l l l } { P Q } & { = } & { [ P ^ { \prime } Q ^ { \prime } ] _ { \alpha } , \quad { \mathrm { w h e r e ~ } } [ P ^ { \prime } ] _ { \alpha } = P { \mathrm { ~ a n d ~ } } [ Q ^ { \prime } ] _ { \alpha } = Q ; } \\ { \lambda x P } & { = } & { [ \lambda x P ^ { \prime } ] _ { \alpha } , \quad { \mathrm { w h e r e ~ } } [ P ^ { \prime } ] _ { \alpha } = P ; } \\ { x } & { = } & { [ x ] _ { \alpha } . } \end{array} }
$$

Using this notation,we can show that the equations defining free variables and substitution for pre-terms also hold for $\lambda$ -terms.We omit the easy proofs.

1.2.18.LEMMA. The following equations are valid:

$$
\begin{array} { l l l } { \operatorname { F V } ( x ) } & { = } & { \{ x \} ; } \\ { \operatorname { F V } ( \lambda x P ) } & { = } & { \operatorname { F V } ( P ) - \{ x \} ; } \\ { \operatorname { F V } ( P Q ) } & { = } & { \operatorname { F V } ( P ) \cup \operatorname { F V } ( Q ) . } \end{array}
$$

1.2.19.LEMMA. The following equations on $\lambda$ -terms are valid:

$$
\begin{array} { c } { { x [ x : = N ] = N ; } } \\ { { y [ x : = N ] = y , i f x \neq y ; } } \\ { { ( P Q ) [ x : = N ] = P [ x : = N ] Q [ x : = N ] ; } } \\ { { ( \lambda y P ) [ x : = N ] = \lambda y . P [ x : = N ] , } } \end{array}
$$

where $x \neq y$ and ${ \mathcal { Y } } \not \in { \mathrm { F V } } ( N )$ in the last clause.

The next lemma “lifts”a few properties of pre-terms to the level of terms.

1.2.20.LEMMA.Let $P , Q , R , L$ be $\lambda$ -terms.Then

$$
\lambda x P = \lambda y . P [ x : = y ] , \ i f y \notin \mathrm { F V } ( P ) .
$$

(ii) $P [ x : = Q ] [ y : = R ] = P [ y : = R ] [ x : = Q [ y : = R ] ] .$ $y \neq x \notin \operatorname { F V } ( R )$ ，

$$
P [ x : = y ] [ y : = Q ] = P [ x : = Q ] , { \mathrm { ~ } } i f y \notin \operatorname { F V } ( P ) .
$$

(iv）If $P Q = R L$ then $P = R$ and $Q = L$ (v）If $\lambda y P = \lambda z Q$ then $P [ y : = z ] = Q$ and $Q \{ z : = y \} = P$

PROOF. An easy consequence of Lemmas 1.2.6 and 1.2.12-1.2.13.

From now on, expressions involving abstractions, applications,and variables are always understood as $\lambda$ -terms,as defined in Notation 1.2.17. In particular,with the present machinery at hand,we can formulate definitions by induction on the structure of $\lambda$ -terms,rather than first introducing the relevant notions for pre-terms and then lifting.The following definition is the first example of this; its correctness is established in Exercise 1.3.

1.2.21.DEFINITION.For $M , \vec { N } \in \Lambda$ and distinct variables $\vec { x } \in \Upsilon$ the simultaneous substitution of $\vec { N }$ for $\pmb { \tilde { x } }$ in $M$ is the term $M [ \vec { \pmb { x } } : = \vec { N } ]$ ,such that

$$
\begin{array} { r l } & { x _ { i } [ \vec { x } : = \vec { N } ] = N _ { i } ; } \\ & { y \left[ \vec { x } : = \vec { N } \right] = y , ~ \mathrm { i f } ~ y \neq x _ { i } , ~ \mathrm { f o r ~ a l l } ~ i ; } \\ & { ( P Q ) [ \vec { x } : = \vec { N } ] = P [ \vec { x } : = \vec { N } ] Q [ \vec { x } : = \vec { N } ] ; } \\ & { ( \lambda y P ) [ \vec { x } : = \vec { N } ] = \lambda y . P [ \vec { x } : = \vec { N } ] , } \end{array}
$$

where,in the last clause, $y \neq x _ { i }$ and $y \not \in \mathrm { F V } ( N _ { i } )$ ,for all $\pmb { \dot { q } }$

OTHER sYNTAx. In this book we define many different languages (logics and $\lambda$ -calculi) with various binding operators (e.g.quantifiers).Expressions (terms,formulas,types etc.) that differ only in their bound variables are always identified as we just did it in the untyped $\lambda$ -calculus.However,in order not to exhaust the reader,we generally present the syntax in a slightly informal manner, thus avoiding the explicit introduction of"pre-expressions."

In all such cases,however,we actually have to deal with equivalence classes of some $\pmb { \alpha }$ -conversion relation,and a precise definition of the syntax must take this into account.We believe that the reader is able in each case to reconstruct all missing details of such a definition.

# 1.3.Reduction

1.3.1.DEFINITION.A relation $\succ$ on $\pmb { \Lambda }$ is compatible iffit satisfies the following conditions for all $M , N , Z \in \Lambda$

(i）If $M \succ N$ then $\lambda x M \succ \lambda x N$ for all variables $\pmb { \mathscr { L } }$   
(ii）If $M \succ N$ then $M Z \succ N Z$   
(iii）If $M \succ N$ then $Z M \succ Z M$

1.3.2.DEFINITiON.The least compatible relation $ \beta$ on $\pmb { \Lambda }$ satisfying

$$
( \lambda x . P ) Q \to _ { \beta } P [ x : = Q ] ,
$$

is called $\beta$ -reduction.A term of form $( \lambda x P ) Q$ is called a $\beta$ -redex,and the term $P [ x : = Q ]$ is said to arise by contracting the redex.A $\lambda$ -term $\pmb { M }$ is in $\beta$ -normal form(notation $\mathcal { M } \in \mathbb { N F } _ { \beta _ { i } } \}$ iff there is no $\pmb { N }$ such that $M \to _ { \beta } N$ ， i.e. $M$ does not contain a $\beta$ -redex.

1.3.3. DEFINITION.

（i）The relation $ \beta$ (multi-step $\beta$ -reduction) is the transitive and reflexive closure of $ \beta$ .The transitive closure of $ \beta$ is denoted by $\twoheadrightarrow _ { \beta } ^ { + }$

(ii） The relation $= _ { \beta }$ (called $\beta$ equality or $\beta$ conversion) is the least equivalence relation containing $ \beta$

(ii)A $\beta$ reduction sequence is a finite or infinite sequence

$$
M _ { 0 } \to _ { \beta } M _ { 1 } \to _ { \beta } M _ { 2 } \to _ { \beta } \dots .
$$

1.3.4.REMARk. The above notation applies in general: for any relation $ 0 ,$ the symbol $\twoheadrightarrow _ { \circ } ^ { + }$ (respectively $\left| { \twoheadrightarrow } \right.$ denotes the transitive (respectively transitive and reflexive） closure of $ 0 ,$ and the symbol $\approx 0$ is used for the corresponding equivalence.We often omit $\beta$ (or in general o） from such notation when no confusion arises,with one exception: the symbol without any qualification always denotes ordinary equality. That is,we write $A = B$ when $A$ and $B$ denote the same object.

WARNING.In the literature,and contrary to the use in this book,the sym-${ \bf b o l = i s }$ often used for $\beta$ -equality.

# 1.3.5.EXAMPLE.

$$
{ \begin{array} { r l } & { ( \lambda x . x x ) ( \lambda z z ) \to _ { \beta } ( x x ) [ x : = \lambda z z ] = ( \lambda z z ) ( \lambda y y ) . } \\ & { ( \lambda z z ) ( \lambda y y ) \to _ { \beta } z [ z : = \lambda y y ] = \lambda y y . } \\ & { ( \lambda x . x x ) ( \lambda z z ) \to _ { \beta } \lambda y y . } \\ & { ( \lambda x x ) y z = _ { \beta } y ( ( \lambda x x ) z ) . } \end{array} }
$$

1.3.6.ExAMPLE (Some common $\lambda$ -terms).

(i)Let ${ \bf \cal I } = \lambda x x$ ， ${ \bf K } = \lambda x y . x .$ and $\begin{array} { r } { \mathbf { S } = \lambda x y z . x z { \left( y z \right) } } \end{array}$ . Then $\operatorname { S K K } \to \mu \operatorname { I }$ (ii）Let $\omega = \lambda x . x x$ and $\pmb { \Omega } = \omega \omega$ Then $\Omega \to _ { \beta } \Omega \to _ { \beta } \Omega \to _ { \beta } \dots ,$ (ii) Let $\mathbf { Y } = \lambda f . ( \lambda x . f ( x x ) ) ( \lambda x . f ( x x ) )$ .Then $\mathbf { Y }  _ { \beta } \mathbf { Y } ^ { \prime }  _ { \beta } \mathbf { Y } ^ { \prime \prime }  _ { \beta } \cdots _ { \beta } . \cdot \cdot ,$ where $\mathbf { Y } , \mathbf { Y } ^ { \prime } , \mathbf { Y } ^ { \prime \prime } , .$ .are all different.

1.3.7.REMARk.A term is in normal form iff it is an abstraction $\lambda x M$ where $\pmb { M }$ is in normal form,or it is $x M _ { 1 } \ldots M _ { n }$ ,where $n \geq 0$ and all $M _ { i }$ are in normal form （ $' \hat { \mathbf { \mu } } ^ { * } \hat { \mathbf { \mu } } ^ { \dagger } \mathbf { \dddot { \mu } } ^ { \dagger }$ is obvious and"only $\mathbf { i f } ^ { \mathfrak { s } }$ is by induction on the length of $M$ ).Even more compact:a normal form is $\lambda y _ { 1 } \ldots y _ { m } . x M _ { 1 } \ldots M _ { n } ,$ where $m , n \geq 0$ and all $M _ { i }$ are normal forms.

The following little properties are constantly used.

1.3.8.LEMMA.

(i）If $N \to _ { \beta } N ^ { \prime } \ t h e n \ M [ x : = N ] \to _ { \beta } M [ x : = N ^ { \prime } ] .$ (ii）If $M \to _ { \beta } M ^ { \prime }$ then $M [ x : = N ] \to _ { \beta } M ^ { \prime } [ x : = N ] ,$

PROOF.By induction on $\mathcal { M }$ and $M \to _ { \beta } M ^ { \prime }$ using Lemma 1.2.20.

In addition to $\beta$ -reduction,other notions of reduction are considered in the $\lambda$ -calculus.In particular,we have $\eta$ -reduction.

1.3.9.DEFINITION. Let $\to _ { \eta }$ denote the least compatible relation satisfying

$$
\lambda x . M x \longrightarrow _ { \eta } M , \quad \mathrm { i f } \ x \not \in \mathrm { F V } ( M ) .
$$

The symbol $ \beta \eta$ denotes the union of $ \beta$ and $\to _ { \eta }$

REMARk. In general, when we have compatible relations $ _ { R }$ and $ Q$ ,the union is written $ _ { R Q }$ .Similar notation is used for more than two relations.

The motivation for this notion of reduction (and the associated notion of equality） is,informally speaking,that two functions should be considered equal if they yield equal results whenever applied to equal arguments. Indeed:

1.3.10.PROPOSITION. $L e t = _ { e x t }$ be the least equivalence relation such that:

·If $M = _ { \beta } N$ ，then $M = _ { e x t } N$ ; ·If $M { \boldsymbol { x } } = _ { e x t }$ Nx and $x \not \in F V ( M ) \cup F V ( N )$ then $M = _ { e x t } N$ ·If $P = _ { e x t } Q _ { i }$ then $\scriptstyle P Z = _ { e x t } Q Z$ and $\scriptstyle Z P = _ { e x t }  Z Q$

Then $M = _ { e x t } N$ $M = _ { \beta \eta } N$

PROOF.The implication from left to right is by induction on the definition of $M = _ { e x t } \ N$ ,and from right to left is by induction with respect to the definition of $M = _ { \beta \eta } N$ .Note that the definition ${ \mathfrak { o f } } = _ { e z t }$ does not include the rule “If $\mathcal { P } = _ { e x t } \ Q$ then $\lambda x P = _ { e x t } \lambda x Q ,$ ”This is no mistake: this property (known as rule $\xi$ ）follows from the others. □

We do not take $ \beta \eta$ as our standard notion of reduction.We want to be able to distinguish between two algorithms,even if their input-output behaviour is the same.Nevertheless,many properties of $\beta \eta$ -reduction are similar to those of $\beta .$ reduction.For instance,we have the following.

1.3.11.LEMMA.If there is an infinite $\beta \eta$ -reduction sequence starting with aterm $\pmb { M }$ then thereis an infinite $\beta$ -reduction sequence from $\pmb { M }$

PROOF.First observe that in an infinite $\beta \eta$ -reduction sequence there must be infinitely many $\beta$ -reduction steps (cf. Exercise 1.6). These $\beta$ -reduction steps can be“permuted forward",yielding an infinite $\beta$ -reduction. Indeed, by induction with respect to $M \to _ { \eta } N$ ,one can show that $M \to _ { \eta } N \to _ { \beta } { \bar { \cal L } }$ implies $M  _ { \beta } P \nrightarrow _ { \beta \eta } L ,$ for some $\mathcal { P }$ □

OTHER sYNTAX. In the numerous lambda-calculi occurring in the later chapters,many notions introduced here will be used in an analogous way. For instance, the notion of a compatible relation (Definition 1.3.1） generalizes naturally to other syntax.A compatible relation“respects” the syntactic constructions.Imagine that, in addition to application and abstraction,we have in our syntax an operation of “acclamation,”written as M!!,i.e.whenever $M$ isa term, $M ! !$ is also a term.Then we should add the clause

·If $M \succ N$ then $M ! ! \succ N ! !$

to our definition of compatibility. Various additional reduction relations will also be considered later,and we usually define these by stating one or more reduction axioms,similar to the $\beta$ -rule of Definition 1.3.2 and the $\eta$ -ruleof Definition 1.3.9. In such cases,we usually assume that the reduction relation is the least compatible relation satisfying the given reduction axiom.

# 1.4.The Church-Rosser theorem

Since a $\lambda$ -term $\pmb { M }$ may contain several $\beta$ -redexes,there may be several $\pmb { N }$ with $M \to _ { \beta } N$ For instance, $\mathbf { K } ( \mathbf { I I } ) \to _ { \beta } \lambda$ x.II and $\mathbf { K } ( \mathbf { I I } ) \to _ { \beta }$ KI.However, as shown below, there must be some term to which all such $\pmb { N }$ reduce in one or more steps.In fact,even if we make several reduction steps,we can still converge to a common term (possibly using several steps):

$$
\begin{array} { c } { { M _ { 1 } \longrightarrow M _ { 2 } } } \\ { { \downarrow } } \\ { { \downarrow } } \\ { { M _ { 3 } \ H _ { 3 } \ H _ { 4 } } } \end{array}
$$

This property is known as confluence or the Church-Rosser property. If the above diagram was correct in a stronger version with in place of $\twoheadrightarrow$ ,then we could prove the theorem by a diagram chase:

M2 √ M4

Unfortunately,our prerequisite fails.For instance,in the diagram

$$
\begin{array} { r } { M _ { 1 } = \omega ( { \bf I I } ) \longrightarrow \omega { \bf I } = M _ { 2 } } \\ { \downarrow \qquad } \\ { M _ { 3 } = ( { \bf I I } ) ( { \bf I I } ) \longrightarrow { \bf I } ( { \bf I I } ) \longrightarrow { \bf I I } = M _ { 4 } } \end{array}
$$

two reductions are needed to get from $M _ { 3 }$ to $M _ { 4 }$ .The problemn is that the redex contracted in the reduction from $\pmb { M } _ { 1 }$ to $M _ { 2 }$ is duplicated in the reduction to $M _ { 3 }$ .We can solve the problem by working with parallel reduction, i.e.an extension of $ \beta$ allowing such duplications to be contracted in one step.

1.4.1.DEFINITION. Let $\Rightarrow \beta$ be the least relation on $\pmb { \Lambda }$ such that:

${ \mathcal { X } } \Rightarrow _ { { \mathcal { B } } } { \mathcal { X } }$ for all variables $\pmb { x }$   
$\cdot$ If $P \Rightarrow _ { \beta } Q$ then $\lambda x . P \Rightarrow _ { \beta } \lambda x . Q$   
$\bullet$ If $P _ { 1 } \Rightarrow _ { \beta } Q _ { 1 }$ and $P _ { 2 } \Rightarrow _ { \beta } Q _ { 2 }$ then $P _ { 1 } P _ { 2 } \Rightarrow _ { \beta } Q _ { 1 } Q _ { 2 }$   
·If $P _ { 1 } \Rightarrow _ { \beta } Q _ { 1 }$ and $P _ { 2 } \Rightarrow _ { \beta } Q _ { 2 }$ then $( \lambda x . P _ { 1 } ) P _ { 2 } \Rightarrow _ { \beta } Q _ { 1 } [ x : = Q _ { 2 } ] .$

1.4.2. LEMMA.

(i)If $M \to _ { \beta } N$ then $M \Rightarrow _ { \beta } N$   
(i）If $M \Rightarrow _ { \beta } N$ then $M \twoheadrightarrow _ { \beta } N$   
(ii）If $M \Rightarrow _ { \beta } M ^ { \prime }$ and $N \Rightarrow _ { \beta } N ^ { t }$ ther $M [ x ; = N ] \Rightarrow M ^ { \prime } [ x ; = N ^ { \prime } ]$

PROOF. (i) is by induction on the definition of $M \to _ { \beta } N$ (note that $P \Rightarrow _ { \beta } P$ for all $\mathcal { P }$ ),and (ii),(ii) are by induction on the definition of $M \Rightarrow _ { \beta } M ^ { \prime }$ □

1.4.3. DEFINITION. Let $M ^ { * }$ (thecomplete development of $\pmb { M }$ ）be defined by:

$$
{ \begin{array} { l l l } { x ^ { * } } & { = } & { x ; } \\ { ( \lambda x M ) ^ { * } } & { = } & { \lambda x M ^ { * } ; } \\ { ( M N ) ^ { * } } & { = } & { M ^ { * } N ^ { * } , { \mathrm { ~ i f ~ } } M { \mathrm { ~ i s ~ n o t ~ a n ~ a b s t r a c t i o n } } ; } \\ { ( ( \lambda x M ) N ) ^ { * } } & { = } & { M ^ { * } [ x : = N ^ { * } ] . } \end{array} }
$$

Note that $M \Rightarrow _ { \beta } N$ if $\pmb { N }$ arises by reducing some of the redexes present in $\pmb { M }$ ,and that $M ^ { * }$ arises by reducing $a l l$ redexes present in $\pmb { { M } }$

1.4.4. LEMMA. If $M \Rightarrow _ { \beta } N$ then $N \Rightarrow \beta ^ { \textit { M } ^ { * } }$ In particular, if $M _ { 1 } \Rightarrow _ { \beta } M _ { 2 }$ and $M _ { 1 } \Rightarrow _ { \beta } M _ { 3 }$ then $M _ { 2 } \Rightarrow _ { \beta } M _ { 1 } ^ { * }$ and $M _ { 3 } \Rightarrow _ { \beta } M _ { 1 } ^ { * }$

PROOF.By induction on the definition of $M \Rightarrow _ { \beta } N$ using Lemma 1.4.2.[

1.4.5.THEOREM (Church and Rosser).If $M _ { 1 } \twoheadrightarrow _ { \beta } M _ { 2 }$ and $M _ { 1 } \twoheadrightarrow _ { \beta } M _ { 3 }$ ,then there is $M _ { 4 } \in \Lambda$ with $M _ { 2 } \twoheadrightarrow _ { \beta } M _ { 4 }$ and $M _ { 3 } \twoheadrightarrow _ { \beta } M _ { 4 }$

PROOF. If $M _ { 1 } \to _ { \beta } \dots \to _ { \beta } M _ { 2 }$ and $M _ { 1 } \to _ { \beta } \dots \to _ { \beta } M _ { 3 }$ the same holds with $\Rightarrow \beta$ in place of $ _ { \beta }$ By Lemma 1.4.4 and a diagram chase, $M _ { 2 } \Rightarrow _ { \beta } \dots \Rightarrow _ { \beta } M _ { 4 }$ and $M _ { 3 } \Rightarrow _ { \beta } \dots \Rightarrow _ { \beta } M _ { 4 }$ for some $M _ { 4 }$ .Then $M _ { 2 } \twoheadrightarrow _ { \beta } M _ { 4 }$ and $M _ { 3 } \twoheadrightarrow _ { \beta } M _ { 4 }$ □

# 1.4.6. COROLLARY,

(i）If $M = _ { \beta } N$ ，then $M \twoheadrightarrow \beta \nsubseteq$ and $N  _ { \beta } \mathcal { L }$ for some $I$ (ii）If $M \nrightarrow _ { \beta } N _ { 1 }$ and $M \nrightarrow \beta \ \Lambda / _ { 2 }$ for $\beta$ -normal forms $N _ { 1 } , N _ { 2 }$ then $N _ { 1 } = N _ { 2 }$ (ii）) If there are $\beta$ -normal forms $L _ { 1 }$ and $\bar { L } _ { 2 }$ such that $M \to _ { \beta } L _ { 1 }$ ， $N  _ { \beta } L _ { 2 }$ ， and $\pm I _ { 1 } \neq I _ { 2 }$ ,then $M \neq _ { \beta } N$ ：

PROOF. Left to the reader.

REMARK. One can consider $\lambda$ -calculusas an equational theory,i.e.a formal theory with formulas of the form $M = _ { \beta } N$ Part (i) establishes consistency of this theory,in the following sense: there exists a formula that cannot be proved,e.g. $\lambda x x = _ { \beta } \lambda x y . x$ (cf.Exercise 2.5）.

Part (ii)in the corollary is similar to the fact that when we calculate the value of an arithmetical expression, e.g. $( 4 + 2 ) \cdot ( 3 + 7 ) \cdot 1 1$ ,the end result is independent of the order in which we do the calculations.

# 1.5.Leftmost reductions are normalizing

1.5.1.DEFINITION.A term $M$ is normalizing (notation $M \in \mathbb { W } \mathbf { N } _ { \beta } ,$ iffthere is a reduction sequence from $\pmb { M }$ ending ina normal form $N$ .We then say that $M$ has the normal form $N$ .A term $\pmb { M }$ is strongly normalizing $M \in \mathbf { S } \mathbf { N } _ { \beta }$ or just $M \in \mathbb { S } \mathbb { N } )$ if all reduction sequences starting with $\pmb { M }$ are finite.We write $M \in \infty _ { \beta }$ if $M \not \in { \mathrm { S N } } _ { \beta }$ .Similar notation applies to other notions of reduction.

Any strongly normalizing term is also normalizing,but the converse is not true,as KIΩ shows. But Theorem 1.5.8 states that a normal form,if it exists,can always be found by repeatedly reducing the leftmost redex, i.e. the redex whose $\lambda$ is the furthest to the left.The following notation and definition are convenient for proving Theorem 1.5.8.

VECTOR NOTATION. Let $\pi \geq 0 .$ If $\vec { P } = P _ { 1 } , \ldots , P _ { n }$ then we write $\mathcal { M } \vec { P }$ for $M P _ { 1 } \ldots P _ { n }$ . In particular, if $\mathfrak { n } = \mathfrak { 0 }$ i.e. $\vec { P }$ is empty,then $\bar { M P }$ is just $\pmb { M }$ Similarly, if $\vec { z } = z _ { 1 } , \ldots , z _ { n } ,$ then we write $\lambda \vec { z } . M$ for $\lambda z _ { 1 } \ldots z _ { n } . M$ Again, $\lambda \vec { z } . M$ is just $M ,$ if $\pmb { n = 0 }$ ,i.e. $\overrightarrow { z }$ is empty.

REMARK. Any term has exactly one of the following two forms: $\lambda \vec { z } . x \vec { R }$ or $\lambda \vec { z } . ( \lambda x P ) Q \vec { R } ,$ in which case $\{ \lambda x P \} Q$ is called head redex (in the former case, there is no head redex).Any redex that is not a head redex is called internal. Ahead redex is always the leftmost redex,but the leftmost redex in a term is not necessarily a head redex-it may be internal.

1.5.2.DEFINITION.For a term $\pmb { M }$ not in normal form,we write

· $M { \stackrel { \ell } { \to } } _ { \beta } N$ if $\pmb { N }$ arises from $\mathcal { M }$ by contracting the leftmost redex.   
· $M { \stackrel { \hbar } { \to } } _ { \beta } N$ if $N$ arises from $\pmb { M }$ by contracting a head redex. $M { \stackrel { i } { \to } } _ { \beta } N$ if $N$ arises from $M$ by contracting an internal redex.

1.5.3. LEMMA.

(i）If $M { \stackrel { h } { \to } } _ { \beta } N$ then $\lambda x M { \overset { h } { \to } } \beta \lambda x N ,$   
(i）If $M { \stackrel { \hbar } { \to } } _ { \beta } N$ and $\pmb { M }$ is not an abstraction,then $M L { \stackrel { \hbar } { \to } } _ { \beta } N L$ $M { \stackrel { h } { \to } } _ { \beta } N$ then $M [ x : = L ] \stackrel { h } {  } _ { \beta } N [ x : = L ] .$

PROOF. Easy.

The following technical notions are central in the proof of Theorem 1.5.8.

1.5.4. DEFINITION.We write $\vec { P } \Rightarrow _ { \beta } \vec { Q }$ if $\vec { P } = P _ { 1 } , \dots , P _ { n } , \ \vec { Q } = Q _ { 1 } , \dots , Q _ { n } ,$ $n \geq 0$ ,and $P _ { j } \Rightarrow _ { \beta } Q _ { j }$ for all $1 \leq j \leq n$ Parallel internal reduction $\frac { i } { \phi _ { \beta } }$ is the least relation on $\pmb { \Lambda }$ satisfying the following rules.

·If $\vec { P } \Rightarrow _ { \beta } \vec { Q }$ then $\lambda \vec { x } . y \vec { P } \stackrel { i } { \Rightarrow } \beta \lambda \vec { x } . y \vec { Q } ,$ ·If $\vec { P } \Rightarrow _ { \beta } \vec { Q } , S \Rightarrow _ { \beta } T$ and $R \Rightarrow _ { \beta } U _ { ; }$ then $\lambda \vec { x } . ( \lambda y S ) R \vec { P } \overset { i } { \Rightarrow } \beta \lambda \vec { x } . ( \lambda y T ) U \vec { Q } .$

REMARK. If $M { \stackrel { i } { \to } } _ { \beta } \ N$ then $M \ { \stackrel { i } { \Rightarrow } } _ { \beta } \ N$ Conversely，if $M \ { \stackrel { i } { \Rightarrow } } _ { \beta } \ N$ then $M \stackrel { i } { \twoheadrightarrow } _ { \beta } N$ Also,if $M \overset { i } { \Rightarrow } _ { \beta } N$ ,then $M \Rightarrow _ { \beta } N$

1.5.5.DEFINITION. We write $M  _ { \beta } N$ if there are $M _ { 0 } , M _ { 1 } , \ldots , M _ { n }$ with

$$
M = M _ { 0 } \stackrel { h } {  } _ { \beta } M _ { 1 } \stackrel { h } {  } _ { \beta } \ldots \stackrel { h } {  } _ { \beta } M _ { n } \stackrel { i } {  } _ { \beta } N
$$

and $M _ { i } \Rightarrow _ { \beta } N$ for all $i \in \{ 0 , \ldots , n \}$ where $n \geq 0$

1.5.6. LEMMA.

(i）If $M \Rrightarrow _ { \beta } M ^ { t }$ then $\lambda x M \ni _ { \beta } \lambda x M ^ { \prime }$ (i）If $M \Rrightarrow \beta \ M ^ { \prime }$ and $N \Rightarrow _ { \beta } N ^ { \prime }$ then $M N \Rrightarrow _ { \beta } M ^ { \prime } N ^ { \prime }$ (ii）If $M \Rrightarrow _ { \beta } M ^ { \prime }$ and $N  _ { \beta } N ^ { \prime }$ ,then $\begin{array} { r } { M [ x : = N ] \Rightarrow _ { \beta } M ^ { \prime } [ x : = N ^ { \prime } ] , } \end{array}$

PROOF.Part (i) is easy.For (ii),let

$$
M = M _ { 0 } \xrightarrow { h } _ { \beta } M _ { 1 } \xrightarrow { h } _ { \beta } \dots \xrightarrow { h } _ { \beta } M _ { n } \xrightarrow { i } _ { \beta } M ^ { \prime }
$$

where $M _ { i } \ \Rightarrow _ { \beta } \ M ^ { t }$ for all $i \in \{ 0 , \ldots , n \}$ Assume at least one $M _ { i }$ isan abstraction,and let $\pmb { k }$ be the smallest number such that $M _ { k }$ is an abstraction. Then $M _ { k } N \stackrel { i } { \Rightarrow } _ { \beta } M ^ { \prime } N ^ { \prime }$ By Lemma 1.5.3:

$$
M N = M _ { 0 } N \stackrel { h } { \longrightarrow } _ { \beta } M _ { 1 } N \stackrel { h } { \longrightarrow } _ { \beta } \cdots \stackrel { h } { \longrightarrow } _ { \beta } M _ { k } N \stackrel { i } { \longrightarrow } _ { \beta } M ^ { \prime } N ^ { \prime } ,
$$

where $M _ { i } N \Rightarrow _ { \beta } M ^ { \prime } N ^ { \prime }$ .If there is no abstraction among $M _ { i } , 0 \leq i \leq n ,$ then $( \ast )$ still holds with $k = \pi$

For (i） first assume $M \overset { i } { \Rightarrow } \beta M ^ { \prime }$ .We have either $M = \lambda \vec { z } . ( \lambda y , P ) Q \vec { R }$ or $M = \lambda \vec { z } . y \vec { R }$ In the former case, $M ^ { t } = \lambda \vec { z } . ( \lambda y , P ^ { t } ) Q ^ { \prime } \vec { R ^ { \prime } } ,$ where $P \Rightarrow _ { \beta } P ^ { \prime } $ $Q \Rightarrow _ { \beta } Q ^ { \prime }$ and $\vec { R } \Rightarrow \beta ^ { \prime }$ By Lemma 1.4.2, $M [ x : = N ] \stackrel { i } { \Rightarrow } \beta M ^ { \prime } [ x : = N ^ { \prime } ] ,$ In the latter case, $M ^ { \prime } = \lambda \vec { z } . y \vec { R } ^ { \prime }$ .We consider two possibilities. If $x \neq y ,$ we proceed as in the case just considered.If $x = y$ let $\vec { S }$ and $\vec { S ^ { \prime } }$ arise from $\vec { R }$ (respectively $\vec { R } ^ { \prime }$ ）by substituting $\pmb { N }$ (respectively $N ^ { t }$ ）for $\pmb { x }$ By(i)，(ii) and Lemma 1.4.2 we then have $M [ x : = N ] = \hat { \lambda } \vec { z } . N \vec { S } \ni \hat { \lambda } \vec { z } . N ^ { \prime } \vec { S ^ { \prime } } = \dot { M ^ { \prime } } [ x : = N ^ { \prime } ]$

Now consider the general case.By the above and Lermma 1.5.3,we have

$$
M [ \ : x : = N ] = M _ { 0 } [ x : = N ] \stackrel { h } {  } _ { \beta } \cdots \stackrel { h } {  } _ { \beta } M _ { n } [ x : = N ] \Rightarrow _ { \beta } M ^ { \prime } [ x : = N ^ { \prime } ] .
$$

Also, $M _ { i } [ x : = N ] \Rightarrow M ^ { \prime } [ x : = N ^ { \prime } ]$ holds by Lemma 1.4.2.

# 1.5.7. LEMMA.

If $M \Rrightarrow _ { \beta } N$ then $M { \stackrel { h } { \to } } { \_ { \beta } } { \_ { L } } { \stackrel { i } { \Rightarrow } } { _ { \beta } } N$ for some $\pmb { L }$ (i） f $M \stackrel { \dot { \widehat { \imath } } } { \Rightarrow } _ { \beta } N \stackrel { \hbar } { \longrightarrow } _ { \beta } L ,$ then $M { \stackrel { \hbar + } { \twoheadrightarrow } } \beta O { \stackrel { i } { \Rightarrow } } \beta { \bar { L } }$ for some $o$

PROOF.For (i),show that $M \Rightarrow _ { \beta } N$ implies $M  _ { \beta } N$ For (ii），,note that $M = \lambda \vec { z } . ( \lambda x . P ) Q \vec { R } , N = \lambda \vec { z } . ( \lambda x . P ^ { t } ) Q ^ { \prime } \vec { R ^ { \prime } }$ ，where $P \Rightarrow _ { \beta } P ^ { \prime }$ $Q \Rightarrow \beta \ Q ^ { \prime }$ and $\vec { R } \Rightarrow \beta ^ { \prime }$ .Then $L = \lambda \vec { z } . P ^ { \prime } [ x : = Q ^ { \prime } ] \vec { R } ^ { \prime }$ Define $O = \lambda \vec { z } . P [ x : = Q ] \vec { R } ,$ and we then have $M { \stackrel { h } { \to } } _ { \beta } O \Rightarrow _ { \beta } L$ Now use (i). □

1.5.8.THEOREM.If $\pmb { M }$ has normal form $\pmb { N }$ ，then $M \stackrel { \ell } { \to } { \boldsymbol { \beta } } \ N$

PROOF.Induction on the length of $\pmb { N }$ We have $M \Rightarrow _ { \beta } \dotsm \Rightarrow _ { \beta } N$ By Lemma 1.5.7,the reduction from $\pmb { M }$ to $\pmb { N }$ consists of head reductions and parallel internal reductions,and the head reductions can be brought to the beginning. Thus $M { \stackrel { h } {  } } \beta { \bar { \cal L } } { \stackrel { \star } {  } } \beta { \bar { \cal N } } .$ where ${ \cal L } = \lambda \vec { z } . y \vec { P }$ and $N = \lambda \vec { z } . y \vec { P ^ { \prime } }$ and where $P _ { i }$ has normal form $P _ { i } ^ { t }$ .By the induction hypothesis,leftmost reduction of each $P _ { i }$ yields $P _ { i } ^ { t }$ Then $M \stackrel { \ell } { \to } \mathfrak { s } N .$ □

1.5.9.DEFINITION. A reduction strategy $\pmb { F }$ is a map from $\lambda$ -terms to $\lambda$ -terms such that $F ( M ) = M$ when $M$ is in normal form,and $M \to _ { \beta } F ( M )$ otherwise. Such an $\pmb { F }$ is normalizing if for all $M \in \mathbb { W } \mathbb { N } _ { \beta }$ ,there is an $\dot { \pmb q }$ such that $F ^ { i } ( M )$ is in normal form.

1.5.10.COROLLARY. Define $F _ { \ell } ( M ) = M$ for each normal form $\pmb { M }$ and $F _ { l } ( M ) = N ,$ where $M { \stackrel { \ell } { \to } } _ { \beta } N$ ，otherwise. Then ${ { \mathbf { } } \mathbf { } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } \mathbf { { } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } } { { \mathbf { } } }$ is normalizing.

1.5.11.DEFINITiON.A reduction sequence is called

·quasi-leftmost if it contains infinitely many leftmost reductions;   
·quasi-head if it contains infinitely many head reductions.

1.5.12.CoRoLLARY.Let M be normalizing.We then have the following.

(i) M has no infinite head-reduction sequence.   
(ii) M has no quasi-head reduction sequence.   
(iii)M has no quasi-leftmost reduction sequence.

PROOF.Part (i) follows directly from the theorem.For (ii),suppose $M$ has a quasi-head reduction sequence.By Lemma 1.5.7(ii),we can postpone the internal reductions in the quasi-head reduction indefinitely to get an infinite head reduction,contradicting Theorem 1.5.8.

Part (iii) is by induction on the length of the normal form of M.Suppose $\pmb { M }$ has a quasi-leftmost reduction sequence.By (ii) we may assume that, from some point $\mathbf { o n } ,$ ,the quasi-leftmost reduction contains no head reductions. One of the reductions after this point must be leftmost,so the sequence is

$$
M \nrightarrow _ { \beta } L _ { 1 } \stackrel { i } {  } _ { \beta } L _ { 2 } \stackrel { i } {  } _ { \beta } L _ { 3 } \stackrel { i } {  } _ { \beta } \dots
$$

where ${ \cal L } _ { 1 } = \lambda \vec { z } . y \vec { P }$ .Infinitely many of the leftmost steps in $( \ast )$ must occur within the same $P _ { i }$ and these steps are leftmost relative to $P _ { i }$ contradicting the induction hypothesis. □

# 1.6.Perpetual reductions and the conservation theorem

Theorem 1.5.8 provides a way to obtain the normal form of a term,when it exists.There is alsoa way to avoid the normal form,i.e.to find an infinite reduction,when one exists.

1.6.1.DEFINITION.Define $F _ { \infty } : \Lambda \to \Lambda$ as follows. If $M ~ \in ~ \operatorname { N F } _ { \beta }$ then $\dot {  { \boldsymbol { F } } } _ { \infty } ( M ) = M$ otherwise

$$
\begin{array} { r c l l } { F _ { \infty } ( \lambda { \vec { z } } , x { \vec { P } } Q { \vec { R } } ) } & { = } & { \lambda { \vec { z } } . x { \vec { P } } F _ { \infty } ( Q ) { \vec { R } } , } & { \mathrm { i f ~ } { \vec { P } } \in \mathrm { N F } _ { \beta } \mathrm { ~ a n d ~ } Q \notin \mathrm { N F } _ { \beta } ; } \\ { F _ { \infty } ( \lambda { \vec { z } } , ( \lambda x P ) Q { \vec { R } } ) } & { = } & { \lambda { \vec { z } } . P [ x : = Q ] { \vec { R } } , } & { \mathrm { i f ~ } x \in \mathrm { F V } ( P ) \mathrm { ~ o r ~ } Q \in \mathrm { N F } _ { \beta } ; } \\ { F _ { \infty } ( \lambda { \vec { z } } , ( \lambda x P ) Q { \vec { R } } ) } & { = } & { \lambda { \vec { z } } . ( \lambda x P ) F _ { \infty } ( Q ) { \vec { R } } , } & { \mathrm { i f ~ } x \notin \mathrm { F V } ( P ) \mathrm { ~ a n d ~ } Q \notin \mathrm { N F } _ { \beta } . } \end{array}
$$

It is easy to see that $M \to F _ { \infty } ( M )$ when $M \not \in \mathbf { N F } _ { \beta }$

1.6.2.LEMMA. Assume $Q \in \mathrm { S N } _ { \beta } \ o r \ x \in \mathrm { F V } ( P ) , \ I f \ P [ x : = Q ] { \vec { R } } \in \mathrm { S N } _ { \beta } ,$ then $\{ \lambda x . P \} Q \vec { R } \in \mathbb { S } \mathbf { N } _ { \beta }$

PROOF.Let $P [ x : = Q ] { \vec { R } } \in { \mathrm { S N } } _ { \beta }$ Then $P , \vec { R } \in \mathbb { S } \mathbb { N } _ { \beta }$ .If $x \not \in { \mathrm { \bf \Xi } } { \mathrm { \bf ~ F V } } ( \mathcal { P } )$ ，then $Q \in \mathsf { S N } _ { \beta }$ by assumption.If $x \in \mathbb { F V } ( P )$ then $Q$ is part of $P \{ x : = Q \vert \vec { R } ,$ s0 $Q \in \mathbb { S } \mathbf { N } _ { \beta }$ If $( \lambda x . P ) Q \vec { R } \in \infty _ { \beta } ,$ then any infinite reduction must have form

$$
( \lambda x . P ) Q { \vec { R } } \to _ { \beta } ( \lambda x . P ^ { \prime } ) Q ^ { \prime } { \vec { R ^ { \prime } } } \to _ { \beta } P ^ { \prime } [ x : = Q ^ { \prime } ] { \vec { R ^ { \prime } } } \to _ { \beta } \dots 
$$

Then $P \{ x : = Q | \vec { R } \to _ { \beta } P ^ { \prime } \{ x : = Q ^ { \prime } \} \vec { R ^ { \prime } } \to _ { \beta } \ \cdot \ \cdot \ .$ a contradiction.

1.6.3.THEOREM.If $M \in \infty _ { \beta }$ then $F _ { \infty } ( M ) \in \infty _ { \beta }$

PROOF，By induction on $\pmb { M }$ .If $M = \lambda \vec { z } . x \vec { P }$ ,apply the induction hypothesis as necessary. We consider the remaining cases in more detail.

CASE 1: $\check { M } = \lambda \vec { z } . ( \lambda x . P ) Q \vec { R }$ where $x \in \operatorname { F V } ( P )$ or $Q \in \operatorname { N F } _ { \beta }$ Then we have $F _ { \infty } ( M ) = \lambda \vec { z } . P [ x : = Q ] \vec { R } ,$ and thus $F _ { \infty } ( M ) \in \infty _ { \beta } ,$ by Lemma 1.6.2.

CASE 2: $M = \lambda \vec { z } . ( \lambda x . P ) Q \vec { R }$ where $x \notin \operatorname { F V } ( { \mathcal { P } } )$ and $Q \in \infty _ { \beta }$ Then we have $F _ { \infty } ( M ) = \lambda \vec { z } . ( \lambda x . P ) F _ { \infty } ( Q ) \vec { R }$ By the induction hypothesis $F _ { \infty } ( Q ) \in \infty _ { \beta } ,$ s0 $F _ { \infty } ( M ) \in \infty _ { \beta }$

CASE 3: $M = \lambda \vec { z } , ( \lambda x . P ) Q \vec { R }$ where $x \not \in \mathbf { F V } ( P )$ and $Q \in \mathbb { S } \mathbb { N } _ { \beta } - \mathbb { N } \mathbb { F } _ { \beta }$ Then we have $F _ { \infty } ( M ) = \lambda \vec { z } . ( \lambda x . P ) F _ { \infty } ( Q ) \vec { R } \twoheadrightarrow \nu _ { \beta } \ P \vec { R } .$ From Lemma 1.6.2,we obtain $P \vec { R } \in \infty _ { \beta }$ but then also $F _ { \infty } ( M ) \in \infty _ { \beta }$ □

1.6.4.DEFINITION.A reduction strategy $\pmb { F }$ is perpetual iff for all $M \in \infty _ { \beta } ,$

$$
M \to _ { \beta } F ( M ) \to _ { \beta } F ( F ( M ) ) \to _ { \beta } \cdots
$$

is an infinite reduction sequence from $M$

1.6.5. COROLLARY. ${ \cal F } _ { \infty }$ is perpetual.

PROOF. Immediate from the preceding theorem.

1.6.6.DEFINITiON.The set of XI-terms is defined as follows.

·Every variable is a \I-term. ·Anapplication MN isa XI-term iff both $\pmb { M }$ and $N$ are XI-terms. · An abstraction $\lambda x M$ is a AI-term iff $M$ is a AI-term and ${ \pmb x } \in \mathrm { F V } ( M )$

The following is known as the conseruation theorem (for \I-terms).

1.6.7. COROLLARY,

(i) For all XI-terms $M$ ，i $M \in \mathbb { W } \mathbb { N } _ { \beta }$ then $M \in \mathbb { S } \mathbf { N } _ { \beta }$ (ii) For all XI-terms $M$ ，计 $M \in \infty _ { \beta }$ and $M \to _ { \beta } N$ then $N \in \infty _ { \beta }$

PROOF.For part (i),assume $M \in \mathbb { W } \mathbb { N } _ { \beta }$ Then $M \stackrel { \ell } { \twoheadrightarrow } { _ { \beta } } N$ for some normal form $N$ Now note that forall XI-terms $\pmb { { \cal L } }$ not in normal form, $\underline { { \tilde { L } } } \overset { \{ \} } { \to } _ { \beta } F _ { \infty } ( L )$ ， Thus $N = F _ { \infty } ^ { k } ( M )$ for some $\pmb { k }$ ，s0 $M \in \mathbb { S } \mathbf { N } _ { \beta }$ ,by Corollary 1.6.5.

For part (ii),suppose $M \to _ { \beta } N$ If $M \in \infty _ { \beta }$ ,then $M \not \in \mathbb { W } \mathbb { N } _ { \beta }$ by (i). Hence $N \notin \mathbb { W } \mathbb { N } _ { \beta }$ ,in particular $N \in \infty _ { \beta }$ ·

# 1.7.Expressibility and undecidability

The untyped $\lambda$ -calculus is so simple that it may be surprising how powerful it is.In this section we show that $\lambda$ -calculus in fact can be seen as an alternative formulation of recursion theory.

We can use $\lambda$ -terms to represent various constructions, e.g. truth values:

$$
\begin{array} { r } { \mathbf { t r u e } = \lambda x y . x ; } \\ { \mathbf { f a l s e } = \lambda x y . y ; } \end{array}
$$

if $P$ then $Q$ else $R = P Q R$

It is easy to see that

Another useful construction is the ordered pair

$$
\begin{array} { r c l } { \langle M , N \rangle } & { = } & { \lambda x . x M N ; } \\ { \pi _ { 1 } } & { = } & { \lambda p . p ( \lambda x y . x ) ; } \\ { \pi _ { 2 } } & { = } & { \lambda p . p ( \lambda x y . y ) , } \end{array}
$$

As expected we have

$$
\pi _ { i } \left. M _ { 1 } , M _ { 2 } \right. \twoheadrightarrow _ { \beta } M _ { i } .
$$

1.7.1.DEFINITION.We represent the natural numbers in the $\lambda$ -calculus as Church numerals:

$$
\mathbf { c } _ { n } = \lambda f x . f ^ { n } ( x ) ,
$$

where $f ^ { n } ( x )$ abbreviates $f ( f ( \cdots ( x ) \cdots ) )$ with $\pmb { n }$ occurrences of $f$ Sometimes we write $\pmb { \mathrm { n } }$ for $\mathbf { c } _ { n }$ ,so that for instance

$$
\begin{array} { l l l } { { \bf 0 } } & { { = } } & { { \lambda f x . x ; \nonumber } } \\ { { { \bf 1 } } } & { { = } } & { { \lambda f x . f x ; \nonumber } } \\ { { { \bf 2 } } } & { { = } } & { { \lambda f x . f ( f x ) . } } \end{array}
$$

1.7.2.DEFINITION.A partial function $f : \mathbb { N } ^ { k } \to \mathbb { N }$ is $\lambda$ -definableiff there is an $F \in \Lambda$ such that:

· If $f ( n _ { 1 } , \ldots , n _ { k } ) = m { \mathrm { ~ t h e n ~ } } F \mathbf { c } _ { n _ { 1 } } \ldots \mathbf { c } _ { n _ { k } } = _ { \beta } \mathbf { c } _ { m _ { k } } .$ ·If $f ( n _ { 1 } , \ldots , n _ { k } )$ is undefined then $F \mathbf { c } _ { n _ { 1 } } \ldots \mathbf { c } _ { n _ { k } }$ has no normal form.

We say that the term $\pmb { F }$ defines the function $f$

REMARK. If $\pmb { F }$ defines $f$ then in fact $F \mathbf { c } _ { n _ { 1 } } \ldots \mathbf { c } _ { n _ { k } } \nrightarrow _ { \beta } \mathbf { c } _ { f ( n _ { 1 } , \ldots , n _ { k } ) } ,$

1.7.3.ExAMPLE. The following terms define a few commonly used functions.

·Successor: $\operatorname { s u c c } = \lambda n f x . f ( n f x ) .$   
·Addition: $\mathrm { a d d } = \lambda m n f x . m f ( n f x ) ,$   
· Multiplication: $\mathrm { m u l t } = \lambda m n f x . m ( n f ) x .$   
·Exponentiation: $\exp = \lambda m n f x , m n f x$   
·The constant zero function: $z e r o = \lambda m . 0$   
· The $\dot { \pmb { \mathscr { k } } }$ -th projection of $k$ -arguments: $\Pi _ { i } ^ { k } = \lambda m _ { 1 } \ldots m _ { k } . m _ { i }$

We show that all partial recursive functions are $\lambda$ -definable.

1.7.4.PRoPOsITiON. The primitive recursive functions are $\lambda$ -definable.

PROOF. It follows from Example 1.7.3 that the initial functions are definable. It should also be obvious that the class of $\lambda$ -definable total functions is closed under composition. It remains to show that $\lambda$ -definability is closed under primitive recursion. Assume that $f$ is given by

$$
\begin{array} { l c l } { f ( 0 , n _ { 1 } , \ldots , n _ { m } ) } & { = } & { g ( n _ { 1 } , \ldots , n _ { m } ) ; } \\ { f ( n + 1 , n _ { 1 } , \ldots , n _ { m } ) } & { = } & { h ( f ( n , n _ { 1 } , \ldots , n _ { m } ) , n , n _ { 1 } , \ldots , n _ { m } ) , } \end{array}
$$

where $g$ and $h$ are $\lambda$ -definable by $\pmb { G }$ and $\pi$ Define auxiliary terms

$$
\begin{array} { l l l } { \mathrm { I n i t } } & { = } & { \langle 0 , G x _ { 1 } \dots x _ { m } \rangle . } \\ { \mathrm { S t e p } } & { = } & { \lambda p . \langle \mathrm { s u c c } ( \pi _ { 1 } p ) , H ( \pi _ { 2 } p ) ( \pi _ { 1 } p ) x _ { 1 } \dots x _ { m } \rangle ; } \end{array}
$$

The function $\pmb { \hat { f } }$ is then $\lambda$ -definable by

$$
F = \lambda x x _ { 1 } \ldots x _ { m } . \pi _ { 2 } ( x { \mathrm { S t e p I n i t } } ) .
$$

This expresses the following algorithm: Generate a sequence of pairs

$$
( 0 , \alpha _ { 0 } ) , ( 1 , a _ { 1 } ) , \ldots , ( n , a _ { n } ) ,
$$

where $a _ { 0 } = g ( n _ { 1 } , . . . , n _ { m } )$ and $a _ { i + 1 } = h ( a _ { i } , i , n _ { 1 } , \dots , n _ { m } )$ ,so at the end of the sequence, we have $a _ { n } = f ( n , n _ { 1 } , \ldots , n _ { m } )$ ， □

1.7.5.THEOREM. All partial recursiue functions are $\lambda$ -definable.

PROOF.Let $f$ be $\mathbf { a }$ partial recursive function.By Theorem A.3.8

$$
f ( n _ { 1 } , \dots , n _ { m } ) = \ell ( \mu y [ g ( y , n _ { 1 } , \dots , n _ { m } ) = 0 ] ) ,
$$

where $\pmb { g }$ and $\ell$ are primitive recursive. We show that $f$ is $\lambda$ -definable.For this,we first define a test for zero:

$$
\mathbf { z e r o ? } = \lambda x . x ( \lambda y . \mathbf { f a l s e } ) { \mathrm { t r u e . } }
$$

By Proposition 1.7.4, the functions $\pmb { g }$ and $\ell$ are definable by some terms $\pmb { G }$ and $\pmb { L }$ respectively. Let

$$
W = \lambda y . { \mathrm { i f ~ } } \operatorname { z e r o } ? ( G y x _ { 1 } \dots x _ { m } ) { \mathrm { ~ t h e n ~ } } \lambda w . L y { \mathrm { ~ e l s e ~ } } \lambda w . w ( \operatorname { s u c c } y ) w .
$$

Note that $x _ { 1 } , \ldots , x _ { m }$ are free in $\pmb { W }$ .The following term defines $f$ ：

$$
F = \lambda x _ { 1 } . . . \lambda x _ { m } . W \mathbf { c } _ { 0 } W .
$$

Indeed, take any $\pi _ { 1 } , \ldots , \pi _ { m }$ and let $\vec { c } = \mathbf { c } _ { n _ { 1 } } \ldots \mathbf { c } _ { n _ { m } }$ Then

$$
F \vec { c } \twoheadrightarrow _ { \beta } W ^ { \prime } \mathbf { c } _ { 0 } W ^ { \prime } ,
$$

where $W ^ { \prime } = W [ \vec { x } : = \vec { c } ]$ Suppose that $g ( n , n _ { 1 } , \ldots , n _ { m } ) = 0 ,$ and $\pmb { \mathscr { n } }$ is the least number with this property. Then

$$
W ^ { \prime } \mathbf { c } _ { 0 } W ^ { \prime } \twoheadrightarrow \displaybreaks W ^ { \prime } \mathbf { c } _ { 1 } W ^ { \prime } \twoheadrightarrow \displaybreaks \lor ^ { \prime } \mathbf { c } _ { n } W ^ { \prime } \mathbf { c } _ { n } W ^ { \prime } \twoheadrightarrow \displaybreaks \ L \mathbf { c } _ { n } \twoheadrightarrow \displaybreaks \lor \mathbf { c } _ { \ell ( n ) } .
$$

It remains to see what happens when the minirmum is not defined. Then we have the following infinite quasi-leftmost reduction sequence

$$
\begin{array} { r } { W ^ { \prime } \mathbf { c } _ { 0 } W ^ { \prime } \twoheadrightarrow \aleph W ^ { \prime } \mathbf { c } _ { 1 } W ^ { \prime } \twoheadrightarrow \aleph W ^ { \prime } \mathbf { c } _ { 2 } W ^ { \prime } \twoheadrightarrow \aleph \cdots } \end{array}
$$

so Corollary 1.5.12 implies that $\pmb { F } \overrightarrow { c }$ has no normal form.

1.7.6.REMARk.A close inspection of the proof of Theorem 1.7.5 reveals that it shows more than stated in the theorem:For every partial recursive function $f : \mathbb { N } ^ { m } \to \mathbb { N }$ ,there isa defining term $\pmb { F }$ such that every application $F \mathbf { c } _ { n _ { 1 } } \ldots \mathbf { c } _ { n _ { m } }$ is uniformly normalizing,i.e.either strongly normalizing or without normal form.The details of this claim can be found in Exercise 1.21.

1.7.7.CoRoLLARY. The following problems are undecidable:

(i) Given $M \in \Lambda$ does $M$ have a normal form？

(ii） Giuen $M \in \Lambda _ { * }$ is $M$ strongly normalizing?

PROOF.For (i),suppose we have an algorithm to decide whether any term has a normal form. Take any recursively enumerable set $A \subseteq \mathbb { N }$ that is not recursive,and let $f$ bea partial recursive function with domain $A$ Clearly, $f$ is $\lambda$ -definable bysome term $\pmb { F }$ Now,fora given $\pi \in \mathbb { N }$ ,wecan effectively decide whether ${ \mathfrak { n } } \in A$ by checking whether the term ${ \pmb F } { \bf n }$ has a normal form. Part (ii) now follows from Remark 1.7.6.

# 1.8. Notes

The $\lambda$ -calculus and the related systems of combinatory logic were introduced around 1930 by Alonzo Church [69,70] and Haskell B.Curry [98,99,101],respectively. From the beginning,the calculi were parts of systems intended to be & foundation for logic.Unfortunately,Church's students Kleene and Rosser [271] discovered in 1935 that the original systems were inconsistent,and Curry [1o3] simplified the result,which became known as Curry's paradox. Consequently,the subsystem dealing with $\pmb { \lambda }$ -terms,reduction,and conversion, i.e.what we call $\lambda$ -calculus,was studied independently.

The notions of $\lambda$ -binding and $\pmb { \alpha }$ -convertible termsare intuitively very clear,but we have seen in Section 1.2 that various technical difficulties must be overcorme in order to handle them properly. This issue becomes especially vital when one faces the problem of a practical implementation.A classical solution [59] is to use anameless representation of variables (so called de Bruijn indices).For more on this and related subjects,see e.g. [392,395,401].

The Church-Rosser theorem,which can be seen as a consistency result for the $\pmb { \lambda }$ -calculus,was proved in 1936 by Church and Rosser [76].Many proofs appeared later:Barendregt [31] cites Tait and Martin-Lof for the technique using parallel reductions;our proof is from Takahashi [470]. Proofs of the Church-Rosser theorem and an extension of Theorem 1.5.8 for $\beta \eta$ -reductions can also be found there.

Church and Rosser [76] also proved the conservation theorem for XI-terrs (which is sometimes called the second Church-Rosser theorem).Again,many different proofs have appeared. Our proof uses the effective perpetual strategy from [31], and the fact,also noted in [412],that the perpetual strategy always contracts the leftmost redex,when applied to a XI-term. More about perpetual strategies and their use in proving conservation theorems can be found in [4o6l and [361].

The $\lambda$ -calculus turned out to be useful for formalizing the intuitive notion of effective computability. Kleene [267] showed that every partial recursive function was $\lambda$ -definable and vice versa.This led Church to conjecture that $\lambda$ definabilityis an appropriate formalization of the intuitive notion of effective computability [72], which became known as Church's thesis.

The problems of deciding membership of $\mathbf { W N } _ { \beta }$ and $\mathbf { S N } _ { \beta }$ can be seen as variants of the halting problem.Church [71,72] inferred from the former his celebrated theorem stating that first-order arithmetic is undecidable,as wellas the undecidability ofthe Entscheidungsproblem (the “decision problern” for first-order logic),results that were‘in the air"in this period [164].

Curry and his co-workers continued the work on illative combinatory logic [107,108],i.e. logical systems including formulas as well as combinators and types. The calculus of combinators was then studied as an independent subject,and a wealth of results was obtained.For instance, the theorem about leftmost reductions is from [1o7].Like many other classical results in $\lambda$ -calculus it has been proved in many different ways ever since; our proof is taken from [470].

With the invention of computing machinery came also programming languages. Already in the ${ \bf 1 9 6 0 ^ { 3 } s }$ λ-calculus was recognized as a useful tool in the design, implementation, and theory of programming languages [295].In particular,type-free A-calculus constitutes a model of higher-order untyped functional programming languages,e.g.Scheme [3] and Lisp [2oo],while typed calculi correspond to functional languages like Haskell [478] and ML [387].

The classic texts on type-free λ-calculus are [241] and [31]. First-hand historical information may be obtained from Curry and Feys’book [1o7],which contains a wealth of historical information,and from Rosser and Kleene's eyewitness statements [270,420]. Other interesting papers are [28, 238].

# 1.9.Exercises

1.1.For a pre-term $M$ ,the directed labeled graph $G ( M )$ is defined by induction.

·If $M = x$ then $G ( M )$ has a single root node labeled $\pmb { x }$ and no edges.

·If $M = P Q$ then $G ( M )$ is obtained from the union of $G ( P )$ and $G ( Q )$ by adding a new initial (root） node labeled $\textcircled { \bullet }$ .This node has two outcoming edges: to the root nodes of $G ( P )$ and $G ( Q )$

·If $M = \lambda x \mathcal { P }$ then $G ( M )$ is obtained from $G ( P )$ by -Adding a new root node labeled $\lambda { \pmb x }$ ,and an edge from there to the root node of $G ( P )$ - Adding edges to the new root from all final nodes labeled $\pmb { x }$

Fora given graph $\pmb { G }$ ，let $e r a s e ( G )$ be a graph obtained from $\pmb { G }$ by deleting all labels from the variable nodes that are not final and renaming every label $\lambda x$ for some variable $\pmb { \mathfrak { L } }$ to $\lambda _ { * }$ Prove that the conditions erase ${ \dot { \iota } } ( G ( M ) ) = e r a s e ( G ( N ) )$ and $M = _ { \alpha } N$ are equivalent for all $M , N \in \Lambda ^ { - }$

1.2.Modify Definition 1.2.4 so that the operation $M [ x : = N ]$ is defined for all $M , N$ and $\pmb { \mathcal { D } }$ Then prove that $M [ x : = N ] = _ { \alpha } M ^ { \prime } [ x : = N ^ { \prime } ]$ holds for all $M = _ { \alpha } M ^ { t }$ and $N = _ { \alpha } N ^ { \prime }$ (cf. Lemma 1.2.11).

1.3. Let $\vec { \pmb { x } } \in \pmb { \Upsilon }$ and $\vec { N } \in \mathtt { A }$ be fixed. Show that Definition 1.2.21 determines a total function from $\pmb { \Lambda }$ to $\pmb { \Lambda }$ .Hint:Rewrite the definition as a relation $r \subseteq \Lambda \times \Lambda$ and show that for every $M \in \Lambda$ there is exactly one $L \in \Lambda$ such that $r ( M , L )$ It may be beneficial to show uniqueness and existence separately.

1.4. Prove that if $( \lambda x P ) Q = ( \lambda y M ) N$ then $P [ x : = Q ] = M [ y : = N ]$ .In other words, the contraction of a given redex yields a unique result.

1.5. Show that $\pmb { \mathcal { M } }$ is in normal form if and only if $M$ is either a variable or an abstraction $\lambda x M ^ { \prime }$ ,where $M ^ { \prime }$ is normal, or $M = M ^ { \prime } \lbrack x : = y N \rbrack ,$ for some normal forms $M ^ { \prime }$ and ${ \pmb N }$ and some $\pmb { \mathscr { x } }$ occurring free exactly once in $M ^ { \prime }$

1.6.Show that every term is strongly normalizing with respect to eta-reductions.

1.7.Which of the following are true?

() $\lambda x . M x = _ { \beta } M$ for any abstraction $\pmb { M }$ with $x \notin \operatorname { F V } ( M )$ (ii） $\lambda x \Omega = g \Omega$ (i） $( \lambda x . x x ) ( \lambda x y . y ( x x ) ) = _ { \beta } ( \lambda x . x \mathrm { I } x ) ( \lambda z x y . y ( x z z ) ) .$

1.8. Prove the weak Church-Rosser theorem: For all $M _ { 1 } , M _ { 2 } , M _ { 3 } \in \Lambda ,$ if $M _ { 1 } \to _ { \beta } M _ { 2 }$ and $M _ { 1 } \to _ { \beta } M _ { 3 }$ ,then there is $M _ { 4 } \in \Lambda$ with $M _ { 2 } \twoheadrightarrow _ { \beta } M _ { 4 }$ and $M _ { 3 } \twoheadrightarrow _ { \beta } M _ { 4 }$ Donot use the Church-Rosser theorem.

1.9.Which of the following are true?

(i) $\mathbf { I } ( \mathbf { I I } ) \Rightarrow _ { \beta } \mathbf { I I } .$ (ii) $\mathbf { I I } ( \mathbf { I I } ) \Rightarrow \beta \ \mathbf { I }$ (ii） $\mathbf { I I I } \overset { } { \Rightarrow } \beta \mathbf { I I I } .$ (iv） $\mathbf { I I I I } \Rightarrow \beta \mathbf { I }$

1.10.Find terms $M , N$ such that $M \Rightarrow \beta ^ { \textit { N } }$ and $M { \stackrel { i } { \to } } { \_ { \beta } } \ N$ ,but not $M \overset { i } { \Rightarrow } _ { \beta } N$ ，

1.11. Find terms $M , N$ such that $M { \stackrel { i } { \to } } _ { \beta } N$ and $M { \stackrel { h } { \to } } _ { \beta } N$ both hold.

1.12.Let $M \to _ { \beta } F _ { \infty } ( M ) \to _ { \beta } F _ { \infty } ( F _ { \infty } ( M ) ) \to _ { \beta } \cdots \to _ { \beta } F _ { \infty } ^ { n } ( M )$ where $F _ { \infty } ^ { n } ( M ) \in \mathbf { N F }$ Show that there is no reduction from $\pmb { M }$ with more than $\pmb { n }$ reduction steps. Hint： Generalize Lemma 1.6.2 to show that

$$
l _ { \beta } ( ( \lambda x . P ) Q \vec { R } ) = l _ { \beta } ( P [ x : = Q ] \vec { R } ) + \epsilon ( P ) \cdot l _ { \beta } ( Q ) + 1 ,
$$

where $l _ { \beta } ( M )$ denotes the length of the longest reduction sequence from $\pmb { M }$ and $\epsilon ( P )$ is1if $x \notin \mathbb { F V } ( P )$ and O else. Show that $l _ { \beta } ( M ) = 1 + l _ { \beta } ( F _ { \infty } ( M ) )$ ,if $M \not \in \mathbf { N F }$

1.13.Show that there is no total computable $\smash { \ell : \Lambda \to  { \mathbb { N } } }$ such that, for all $M \in \mathbb { S N } _ { \beta }$

$$
l ( M ) \geq l _ { \beta } ( M ) ,
$$

where $l _ { \beta } ( M )$ is as in the Exercise 1.12.Hint:That would imply decidability of SN. 1.14.Consider the fixed point combinator:

$$
\begin{array} { r } { \mathbf { Y } = \lambda f . ( \lambda x . f ( x x ) ) ( \lambda x . f ( x x ) ) . } \end{array}
$$

Show that $F \langle \mathbf { Y } F \rangle = _ { \beta } \ \mathbf { Y } F$ holds for all $\pmb { F }$ (Thus in the untyped lambda-calculus every fixpoint equation $X = F X$ has a solution.)

1.15.Let $\pmb { M }$ be any other fixed point combinator,i.e.assume that $F ( M F ) = _ { \beta } M F$ holds for all $\pmb { F }$ Show that $\pmb { M }$ has no normal form.

1.16.Define the predecessor function in the untyped lambda-calculus.

1.17.(B. Maurey,J.-L. Krivine.)Let $C = \lambda x y . ( x F ( \lambda z { \bf 1 } ) ) ( y F ( \lambda z { \bf 0 } ) ) ,$ where $\pmb { F } = \lambda f g . g f$ Show that $\pmb { C }$ defines the function

$$
c ( m , n ) = { \left\{ \begin{array} { l l } { 1 , } & { { \mathrm { i f ~ } } m \leq n ; } \\ { 0 , } & { { \mathrm { o t h e r w i s e } } . } \end{array} \right. }
$$

How many steps are needed to reduce $C \mathrm { \bf c } _ { m } \mathrm { \bf c } _ { n }$ to normal form?Will the same hold if we define c using Proposition 1.7.4?

1.18.(From[74].）Find $\pmb { \lambda } \pmb { \mathrm { I } }$ -terms $P _ { 1 } , P _ { 2 }$ (projections) such that $P _ { 1 } \{ { \bf c } _ { m } , { \bf c } _ { n } \} = _ { \beta } { \bf c } _ { m }$ and $P _ { 2 } \langle { \bf c } _ { m } , { \bf c } _ { n } \rangle = _ { \beta } { \bf c } _ { n } ,$ for all ${ m , n }$

1.19.Show that the following functions are $\lambda$ -definable:

·For each $\pmb { \mathscr { n } }$ ,the function $f ( i , m _ { 1 } , \ldots , m _ { n } ) = m _ { i }$ · Integer division,i.e.a function $f$ such that $f \{ m n , m \} = n$ ,for all $m , n \neq 0$ ， ·Integer square root,i.e.a function $f$ such that ${ \tilde { f } } ( n ^ { 2 } ) = n ,$ for all $\pmb { \mathscr { n } }$

1.20.Assume that $M \to _ { \beta } ~ z$ . Show that if $M [ z : = \lambda x N ] \twoheadrightarrow _ { \beta } \lambda u Q ,$ where $\pmb { \mathcal { N } }$ is normal, then $\lambda u Q = \lambda x N$ .Will this remain true if we replace $ \beta$ by $\left. \twoheadrightarrow _ { \beta \eta } \right.$ ？

1.21. For $\pmb { \mathscr { n } } \in \mathbb { N }$ put $d _ { n } = \operatorname { s u c c } ^ { n } ( \mathbf { c } _ { 0 } )$ Assume the following:4

Every primitive recursive function is definable by a term ${ \pmb F }$ such that all applications $F d _ { n _ { 1 } } \ldots d _ { n _ { m } } ( \lambda v . \mathrm { f a l s e } ) \mathrm { t }$ rue are strongly normalizing.

Prove the claim in Remark 1.7.6. Hint:Use Exercise 1.20.

1.22.Prove that $\beta$ equality is undecidable.Hint: See Corollary 1.7.7(i).

# Chapter 3

# Simply typed X-calculus

It is always a central issue in logic to determine if a formula is valid with respect to a certain semantics.Or, more generally, if a set of assumptions entailsa formula in all models.In the“semantic tradition” of classical logic, this question is often the primary subject,and the construction of sound and complete proof systems is mainly seen as a tool for determining validity. In this case,provability of formulas and judgements is the only proof-related question of interest. One asks whether a proof exists,but not necessarily which proof it is.

In proof theory the perspective is different. We want to study the structure of proofs,compare various proofs,identify some of them,and distinguish between others.This is particularly important for constructive logics,where a proof (construction), not semantics, is the ultimate criterion.

It is thus natural to ask for a convenient proof notation. We can for instance write $M : \varphi$ to denote that $\pmb { M }$ is a proof of $\varphi$ . In presence of additional assumptions $\mathbf { r }$ ，we may enhance this notation to

$$
\textstyle \Gamma \vdash M : \varphi _ { * }
$$

Now,if $M$ and $N$ are proofs of $\varphi  \psi$ and $\varphi$ ,respectively, then the proof of $\psi$ obtained using $(  \mathbf { E } )$ could be denoted by something like ${ \mathfrak { Q } } ( M , N ) : \psi _ { : }$ or perhaps simply written as $M N : \psi$ .This gives an “annotated” rule $(  \mathbb { E } )$

$$
\frac { \Gamma \vdash M : \varphi  \psi \quad \Gamma \vdash N : \varphi } { \Gamma \vdash M N : \psi }
$$

When trying to design an annotated version of $( \operatorname { A x } )$ ,one discovers that it is also convenient to use names for assumptions so that e.g,

$$
x : \varphi , \ y : \psi \vdash x : \varphi
$$

represents the use of the first assumption. This idea also comes in handy when we want to annotate rule $(  I )$ .The result of discharging an assumption $\pmb { \mathcal { X } }$

in a proof $\pmb { M }$ can be then written for example as $\sharp x M$ ,or $\xi x M$ ,or...why don't we try lambda?

$$
\frac { \Gamma , x : \varphi \vdash M : \psi } { \Gamma \vdash \lambda x M : \varphi \to \psi }
$$

Yes,what we get is lambda-notation. To use the words of a famous writer in an entirely different context,the similarity is not intended and not accidental. It is unavoidable.Indeed,a proof of an implication represents a construction, and according to the BHK interpretation,a construction of an implication is a function.

However,not every lambda-term can be used as a proof notation. For instance, the self-application xx does not seem to represent any propositional proof, no matter what the assumption annotated by $\pmb { x }$ is.So before we explore the analogy between proofs and terms (which will happen in Chapter 4) we must look for the appropriate subsystem of lambda-calculus.

As we said, the BHK interpretation identifies a construction of an implication with a function. In mathematics,a function $f$ is usually defined on a certain domain $A$ and ranges over a co-domain $\mathcal { B }$ .This is written as $f : A  B$ .Similarly,a construction ofa formula $\varphi  \psi$ can only be applied to designated arguments (constructions of the prermise).Then the result is a construction of the conclusion,i.e.it is again of a specific type.

In lambda-calculus,one introduces types to describe the functional behaviour of terms.An application $M N$ is only possible when $M$ hasafunction type of the form $\sigma \to \tau$ and $\pmb { N }$ has type $\pmb { \sigma }$ The result is of type $\pmb { \tau }$ This is a type discipline quite like that in strictly typed programming languages.

The notion of type assignment expressing functionality of terms has been incorporated into combinatory logic and lambda-calculus almost from the very beginning,and a whole spectrum of typed calculi has been investigated since then. In this chapter we introduce the most basic formalization of the concept of type: system $\lambda _ {  }$ ，

# 3.1. Simply typed X-calculus a la Curry

We begin with the simply typed $\lambda$ -calculus a la Curry,where we deal with the same ordinary lambda-terms as in Chapter 1.

3.1.1. DEFINITION.

(i)An implicational propositional formula is called a simple type.The set of all simple types is denoted by $\Phi _ {  }$ ，   
(ii)An environment is a finite set of pairs of the form $\{ x _ { 1 } : \tau _ { 1 } , \ldots , x _ { n } : \tau _ { n } \} .$ where $\boldsymbol { \mathcal { X } } _ { \mathcal { Y } }$ are distinct $\pmb { \lambda }$ -variables and $\tau _ { \dot { \mathfrak { z } } }$ are types.In other words,an environment is a finite partial function from variables to types.1

Thus, if $\{ { \pmb x } : { \pmb \tau } \} \in \Gamma$ then we may write $\Gamma ( { \boldsymbol { x } } ) = \tau$ We also have:

$$
\begin{array} { r } { \mathrm { d o m } ( \Gamma ) = \{ x \in \Upsilon \mid ( x : \tau ) \in \Gamma , \mathrm { ~ f o r ~ s o m e ~ } \tau \} ; } \\ { \mathrm { ~ r g } ( \Gamma ) = \{ \tau \in \Phi _ {  } \mid ( x : \tau ) \in \Gamma , \mathrm { ~ f o r ~ s o m e ~ } x \} . } \end{array}
$$

It is quite common in the literature to consider a variant of simply typed lambda-calculus where alltypes are built froma single type variable (which is then called a type constant). The computational properties of such a lambdacalculus are similar to those of our $\lambda _ {  }$ .But from the “logical” point of view the restriction to one type constant is not as interesting,cf.Exercise 4.10.

NOTATION. The abbreviation $\tau ^ { \bar { n } } \to \sigma$ is used for $\tau \to \dots \to \tau \to \sigma$ where $\pmb { \tau }$ occurs $\pmb { \mathscr { n } }$ times.An environment $\{ x _ { 1 } : \tau _ { 1 } , \ldots , x _ { n } : \tau _ { n } \}$ is often simply written as $x _ { 1 } : \tau _ { 1 } , \ldots , x _ { n } : \tau _ { n }$ .If $\mathrm { d o m ( T ) } \cap \mathrm { d o m ( } \Gamma ^ { \prime } ) = \emptyset$ then we may also write $\Gamma , \Gamma ^ { \prime }$ for $\mathbf { T } \cup \mathbf { T } ^ { \prime }$ .In particular, $\Gamma , x : \tau$ stands for $\Gamma \cup \{ x : \tau \}$ ,where it is assumed that $x \not \in \mathrm { d o m } ( \Gamma )$ .Similar conventions will be used in later chapters.

3.1.2.DEFINITioN.A judgement is a triple,written $\Gamma \vdash M : \tau .$ consisting of an environment,a lambda-term and a type.The rules in Figure 3.1 define the notion of a derivable judgement of system $\lambda _ {  }$ .(One has to remember that in rules $( \mathrm { V a r } )$ and (Abs) the variable $\pmb { x }$ is not in the domain of Γ.) If $\Gamma \vdash M : \tau$ is derivable then we say that $M$ has type $\tau$ in $\boldsymbol { \Gamma }$ and we write $\Gamma \vdash _ { \lambda  } { \bar { M } } : \tau \circ \tau$ just $\Gamma \vdash \mathcal { M } : \tau$ (cf.Definition 2.2.1).

<table><tr><td>(Var)</td><td>T,x:T├x:T</td></tr><tr><td>(Abs)</td><td>T,x:σ ├ M:t</td></tr><tr><td></td><td>r├(xM）:σ→T</td></tr><tr><td>(App)</td><td>Γ-M:σ→t ΓIN:q</td></tr><tr><td></td><td>T├(MN):T</td></tr></table>

3.1.3.EXAMPLE.Let $\sigma , \tau , \rho$ be arbitrary types.Then:

$$
\begin{array} { r l } & { \vdash \mathbf { I } : \sigma \to \sigma ; } \\ & { \vdash \mathbf { K } : \sigma \to \tau \to \sigma ; } \\ & { \vdash \mathbf { S } : ( \sigma \to \tau \to \rho ) \to ( \sigma \to \tau ) \to \sigma \to \rho . } \end{array}
$$

A type assignment of the form $M : \tau \to \sigma$ can of course be explained as $^ { \mathrm { t } \mathrm { t } } M$ is a function with the domain $\pmb { \tau }$ and co-domain $\sigma ^ { \mathfrak { A } }$ But we must understand that this understanding of a"domain"and $^ { * } \mathrm { c o - d o m a i n } ^ { * }$ is not set-theoretic.In Curry-style typed calculi, types are more adequately decribed as predicates or specifications (to be satisfied by terms) than as set-theoretical function spaces.The meaning of $f : A  B$ in set theory is that arguments of $f$ are exactly the elements of $A$ ,and that all values must belong to $B$ In contrast, $M : \tau \to \sigma$ only means that $M$ applied to an argument of type $\pmb { \tau }$ must yield a result of type $\pmb { \sigma }$

We conclude this section with a brief review of some of the basic properties of system $\lambda _ {  }$

# 3.1.4.LEMMA.

(i) $I f \Gamma \vdash M : \tau \ t h e n \ \mathrm { F V } ( M ) \subseteq \operatorname { d o m } ( \Gamma ) .$ (ii) IfT,x:T├M:σand $y \not \in \mathrm { d o m } ( \Gamma ) \cup \{ x \}$ then $\Gamma , y : \tau \vdash M [ x : = y ] : \sigma ,$

PROOF.Both parts are shown by induction with respect to the length of $\pmb { M }$ As an example we treat the case of abstraction in part (ii).

Suppose that $M = \lambda z M ^ { \prime }$ and $\sigma = \sigma ^ { \prime \prime }  \sigma ^ { \prime }$ and that we have derived $\Gamma , x \colon \tau \vdash M : \sigma$ from $\Gamma , x : \tau , z : \sigma ^ { \prime \prime } \vdash M ^ { \prime } : \sigma ^ { \prime } $ If $z \not = y$ then from the induction hypothesis we know that $\Gamma , y : \tau , z : \sigma ^ { \prime \prime } \vdash M ^ { \prime } [ x : = y ] : \sigma ^ { \prime } .$ whence $\Gamma , y : \tau \vdash \lambda z M ^ { \prime } [ x : = y ] : \sigma$ Now note that $\lambda z M ^ { \prime } [ x : = y ] = ( \lambda z M ^ { \prime } ) [ x : = y ]$

If $z = y$ and $\Gamma , x \colon \tau , y \colon \sigma ^ { \prime \prime } \vdash M ^ { \prime } : \sigma ^ { \prime }$ then we can choose a variable $v \not \in \mathrm { d o m } ( \Gamma ) \cup \{ x , y \}$ and obtain $\Gamma , x : \tau , v : \sigma ^ { \prime \prime } \vdash M ^ { \prime } [ y : = v ] : \sigma ^ { \prime }$ from the induction hypothesis.The next application of the induction hypothesis yields $\Gamma , y : \tau , v : \sigma ^ { \prime \prime } \vdash M ^ { \prime } \{ y : = v \} [ x : = y ] : \sigma ^ { \prime }$ ,because the size of the term has not been increased.It follows that $\Gamma , y : \tau \vdash \lambda v . M ^ { \prime } [ y : = v ] [ x : = y ] : \sigma$ The reader will easily verify that $\lambda v . M ^ { \prime } [ y : = v ] [ x : = y ] = M [ x : = y ]$ ， □

The following lemma is a direct consequence of the “syntax-oriented” character of the rules.

3.1.5.LEMMA (Generation lemma).Suppose that $\Gamma \vdash M : \tau$ ，

(i)f $\pmb { M }$ is a variable $\pmb { x }$ then $\Gamma ( x ) = \tau$   
(ii）If $\pmb { M }$ is an application $P Q$ then $\Gamma \vdash { \mathcal { P } } : \sigma  \tau $ and $\Gamma \vdash Q : \sigma _ { : }$ for some $\sigma$   
(iii）If $\pmb { M }$ is an abstraction $\lambda x . N$ and $x \not \in \mathrm { d o m } ( \Gamma )$ then $\tau = \tau _ { 1 } \to \tau _ { 2 }$ where r, $x : \tau _ { 1 } \vdash N : \tau _ { 2 }$

PROOF.The last step in the derivation of $\Gamma \ \vdash \ M : \ \tau$ is determined by the shape of $\pmb { M }$ .This is all that is needed to prove the first two parts.In part (iii) the last rule must be (Abs) applied to $\boldsymbol { \Gamma }$ ， $y : \tau _ { 1 } \vdash N _ { 1 } : \tau _ { 2 }$ ，where $\lambda x N = \lambda y N _ { 1 }$ ,and it can happen that $y \neq x$ Thus,by Lemma $1 . 2 . 2 0 ( \mathfrak { v } )$ ， we have $\Gamma$ $y : \tau _ { 1 } \vdash N [ x : = y ] : \tau _ { 2 } ,$ and then from Lemma 3.1.4(ii) we obtain I $, x : \tau _ { 1 } \vdash N [ x : = y ] [ y : = x ] : \tau _ { 2 }$ .But $N [ x : = y ] [ y : = x ] = N$ by Lemmas 1.2.20(iii) and 1.2.5(ii). □

3.1.6.LEMMA.

(i）If $\Gamma \vdash M : \sigma$ and $\Gamma ( x ) = \Gamma ^ { \prime } ( x )$ forall ${ \boldsymbol { x } } \in \mathbf { F V } \{ M \}$ then $\Gamma ^ { \prime } \vdash M : \sigma$ (ii） $I f \Gamma , x : \tau \vdash M : \sigma \ a n d \Gamma \vdash N : \tau \ t h e n \ \Gamma \vdash M [ x : = N ] : \sigma .$

PROOF. We proceed by induction with respect to the size of $\pmb { M }$ .In the proof of (i)we only consider the case when $M = \lambda y M ^ { \prime }$ and $\sigma = \sigma _ { 1 }  \sigma _ { 2 }$ .If $\pmb { y }$ is chosen so that $\Im \not \in \mathrm { . F V } ( \Gamma ) \cup \mathrm { F V } ( \Gamma ^ { \prime } )$ then by Lemma 3.1.5(ii) we have $\Gamma , y : \sigma _ { 1 } \vdash M ^ { \prime } : \sigma _ { 2 }$ The induction hypothesis yields $\Gamma ^ { \prime }$ $\vartheta , y : \sigma _ { 1 } \vdash M ^ { \prime } : \sigma _ { 2 } ,$ which in turn gives $\Gamma ^ { \prime } \vdash M : \sigma$

The proof of part (ii) is also routine.Note that we use part (i) in the case of abstraction. □

The following result establishes the correctness of the type assignment system.A well-typed expression remains well-typed after reductions.In particular,no run-time error can be caused by an ill-typed function application. ("Well-typed programs do not go wrong.").

3.1.7.THEOREM (Subject reduction).If $\Gamma \ \vdash \ M : \sigma$ and $M \nrightarrow _ { \beta } N$ then $\Gamma \vdash N : \sigma$

PROOF.By induction with respect to the definition of $\twoheadrightarrow \beta$ .We consider the base case when $\pmb { M }$ isa redex, $M = ( \lambda x P ) Q$ and $N = P [ x : = Q ]$ Without loss of generality we can assume that ${ \boldsymbol { \pi } } \not \in { \mathrm { d o m } } ( { \Gamma } )$ ，so by the generation lemma we have $\Gamma , x : \tau \vdash P : \sigma$ and $\Gamma \vdash Q : \tau$ From Lemma 3.1.6(ii) we obtain $\Gamma \vdash P [ x : = Q ] : \sigma$ □

3.1.8.DEFINITION. The substitution of type $\pmb { \tau }$ for type variable $\pmb { p }$ in type $\sigma _ { . }$ ， written $\sigma [ \pmb { \mathscr { p } } : = \tau ]$ ,is defined by:

$$
\begin{array} { r c l } { { p [ p : = \tau ] } } & { { = } } & { { \tau ; } } \\ { { q [ p : = \tau ] } } & { { = } } & { { q , \mathrm { ~ i f ~ } q \neq p ; } } \\ { { ( \sigma _ { 1 }  \sigma _ { 2 } ) [ p : = \tau ] } } & { { = } } & { { \sigma _ { 1 } [ p : = \tau ]  \sigma _ { 2 } [ p : = \tau ] . } } \end{array}
$$

The notation $\Gamma [ p : = \tau ]$ stands for $\{ ( x : \sigma [ p : = \tau ] ) \mid ( x : \sigma ) \in \Gamma \}$ Similar notation applies for equations, sets of equations etc.

The following shows that the type variables range over all types; this is a limited form of polymorphism (cf. Chapter 11).

3.1.9.PROPOSITION. If $\Gamma \vdash M : \sigma _ { i }$ then $\Gamma [ p : = \tau ] \vdash M : \sigma [ p : = \tau ] .$

PROOF. By induction on the derivation of $\Gamma \vdash M : \sigma$

# 3.2.Type reconstruction algorithm

A term $M \in \Lambda$ is typable if there are $\boldsymbol { \Gamma }$ and $\pmb { \sigma }$ such that $\Gamma \vdash M : \sigma$ The set of typable terms is a proper subset of the set of all $\lambda$ -terms.It is thus a fundamental problem to determine exactly which terms can be assigned types in system $\lambda _ {  }$ and how to find these types effectively. In fact，one can consider a number of decision problems arising from the analysis of the ternary predicate $^ { 4 } \Gamma \vdash M : \tau ^ { 2 9 } ,$ The following definition makes sense for every type assignment system deriving judgements of this form.

# 3.2.1.DEFINITION.

(i) The type checking problem is to decide whether $\Gamma \vdash M : \tau$ holds,for a given environment $\boldsymbol { \Gamma }$ a term $\pmb { M }$ ,and a type $\pmb { \tau }$   
(ii)The typability problem,also called type reconstruction problem, is to decide if a given term $\pmb { M }$ is typable.   
(ii) The type inhabitation problem,also calld type emptiness problem, is to decide,fora given type $\tau$ ，whether there exists a closed term $\pmb { M }$ ， such that h $- M : \tau$ holds. (Then we say that $\pmb { \tau }$ is non-empty,and has theinhabitant $\pmb { M }$ ）

The type inhabitation problem will be discussed in Chapter 4.In this section we consider typability and type checking.At first sight it might seem that determining whether a given term has a given type in a given environment could be easier than determining whether it has any type at all. This impression however is generally wrong. For many type assignment systems,typability is easily reducible to type checking.Indeed, to deterine if a term $M$ is typable,where $\operatorname { F V } ( M ) = \{ x _ { 1 } , \dots , x _ { n } \}$ wemay ask if

$$
x _ { 0 } : p \vdash \mathbf { K } x _ { 0 } ( \lambda x _ { 1 } \ldots x _ { n } , M ) : p ,
$$

and this reduces typability to type checking.In fact,in the simply typed case, the two problems are equivalent (Exercise 3.11),although reducing the latter to the former is not as easy.But for some type assignment systems,the two problems are not equivalent: compare Proposition 13.4.3 and Theorem 13.4.4.

We now show how the typability problem can be reduced to unification2 over the signature consisting only of the binary function symbol Terms over this signature are identified with simple types. For every term $\pmb { M }$ we define by induction

· a system of equations ${ \it E } _ { M }$

·a type $\tau _ { M }$

The idea is as follows: $\pmb { { \cal E } } _ { M }$ has a solution iff $\pmb { M }$ is typable,and $\tau _ { M }$ is (informally）a pattern of $\mathrm { ^ \textmd { a } }$ type for $M$ .Type variables (unknowns） occurring in ${ \pmb { { \cal E } } } _ { M }$ are of two sorts: some of them,denoted $\pmb { \mathscr { p } } _ { \pmb { \mathscr { L } } }$ ,correspond to types of free variables $\pmb { \mathcal { X } }$ of $\pmb { M }$ ,the other variables are auxiliary.

3.2.2.DEFINITION.

(i)If $\pmb { M }$ is a variable $\pmb { x }$ then ${ \mathcal { E } } _ { M } = \emptyset$ and $\tau _ { M } = p _ { x } ,$ where ${ \pmb p } _ { { \pmb x } }$ is a fresh typevariable.   
(ii) Let $\pmb { M }$ be an application $P Q$ .First rename all auxiliary variables in $E _ { Q }$ and $\pi _ { Q }$ so that auxiliary variables used by $E _ { P }$ and $\tau _ { P }$ are distinct from those occurring in $E _ { Q }$ and $\tau _ { Q }$ . Then define $\tau _ { M } = p ,$ where $\pmb { p }$ is $\bar { \bf a }$ fresh type variable, and $E _ { M } = E _ { P } \cup E _ { Q } \cup \{ \tau _ { P } = \tau _ { Q }  p \}$   
(iii）If $M$ is an abstraction $\lambda x P$ then we define $E _ { M } = E _ { P } [ p _ { x } : = p ]$ and $\tau _ { M } = p \to \tau _ { P } [ p _ { x } : = p ]$ where $\pmb { p }$ is $\clubsuit$ fresh variable.

In the definition above,it should be assumed that the renamings and the choice of “fresh”variables are made according to a certain systematic pattern, so that $E _ { M }$ is defined in a unique way for each $\pmb { M }$ An alternative is to think about $M$ as a fixed alpha-representative (a pre-term) where the choice of bound and free variables is made so that no confusion is possible.

# 3.2.3.LEMMA.

(i)If $\Gamma \vdash M : \rho ,$ then there exists a solution $\pmb { S }$ of ${ \mathcal { E } } _ { M }$ ,such that $\rho = S ( \tau _ { M } )$ and $S ( p _ { x } ) = \Gamma ( x )$ for all variables $x \in \mathrm { F V } ( M )$ ，   
(ii)Let $\pmb { S }$ be $\pmb { \alpha }$ solution of ${ \mathcal { E } } _ { M }$ ,and let $\mathbf { r }$ be such that $\Gamma ( x ) = S ( p _ { x } )$ forall $x \in \mathrm { F V } ( M )$ .Then $\Gamma \vdash M : S ( \tau _ { M } )$ ，

PROOF. Induction with respect to the length of $\pmb { M }$

It follows that $\pmb { M }$ is typable iff ${ \mathcal { E } } _ { M }$ has a solution. But $E _ { M }$ then has a principal solution,and this has the following consequence. (Here, $S ( \Gamma )$ is the environment such that $S ( \Gamma ) ( x ) = S ( \Gamma ( x ) ) .$ ）

3.2.4.DEFINITION. A pair $\{ \Gamma , \tau \}$ ,consisting of an environment and a type, is a principal pair for $\pmb { M }$ iff the following are equivalent for all $\Gamma ^ { \prime }$ and $\tau ^ { \prime }$ ：

(i） $\Gamma ^ { \prime } \vdash M : \tau ^ { \prime } ;$ (ii） $S ( \Gamma ) \subseteq \Gamma ^ { \prime }$ and $S ( \tau ) = \tau ^ { \prime }$ for some substitution $\pmb { S }$

We then also say that $\pmb { \tau }$ is the principal type of $M$

3.2.5.COROLLARY. If $\pmb { a }$ term $\pmb { M }$ is typable,then there exists a principal pair for $\pmb { M }$ This principal pair is unique up to renaming of type variables.

PROOF. Immediate from Lemma A.2.1.

We conclude that a judgement $\Gamma \vdash M : \tau$ is derivable if and only if $\{ \Gamma , \tau \}$ is a substitution instance of the principal pair.In this way,the principal pair provides a full characterization of all type assignments possible for $\mathcal { M }$

# 3.2.6.EXAMPLE.

· The principal type of S is $( p \to q \to r ) \to ( p \to q ) \to p \to r$ The type $( p \to q \to p ) \to ( p \to q ) \to p \to p$ can also be assigned to S,but it is not principal. ·Type ${ \bf i n t } = ( p  p )  p  p$ is the principal type of Church numerals $\mathbf { c } _ { n }$ for $n \geq 2$ For Oand $\mathbf { 1 }$ the principal types are respectively $p \to q \to q$ and $( p \to q ) \to p \to q$ But every Church numeral can also be assigned the type $( ( p \to q ) \to p \to q ) \to ( p \to q ) \to p \to q .$

3.2.7.THEoREM. Typability and type checking in the simply typed lambdacalculus are decidable in polynomial time.

PROOF.The system of equations $E _ { M }$ can be constructed in logarithmic space (and thus also in polynomial time) from $M$ Thus,by Lemma 3.2.3, typability reduces in logarithmic space to unification,which is decidable in polynomial time (Theorem A.5.4).

To decide if $\Gamma \vdash M : \tau$ holds,consider a signature containing (in addition to the binary symbol ）all free variables occurring in $\Gamma$ and $\pmb { \tau }$ as constant symbols.It is now enough to extend ${ \mathcal { E } } _ { M }$ to include the equations $\tau _ { M } = \tau$ and $p _ { x } = \Gamma ( x )$ ,for $x \in \mathbb { F V } ( M )$ .The extended system of equations has a solution if and only if $\Gamma \vdash M : \tau$ □

3.2.8.REMARk (Related problems).The typability problem is often written as $u ? \vdash M : ? \mathstrut \mathfrak { n }$ ,and the type inhabitation problem is abbreviated $4 6 7 : 7 ^ { 3 3 }$ This notation can be used for other related problems,as one can choose to replace various parts of our ternary predicate by question marks,and choose the environment to be empty or not.A little combinatorics shows that we have a total of 12 problems.Out of these 12 problems,four are completely trivial,since the answer is always “yes":

$$
7 + 7 : ? \qquad \Gamma \vdash ? : ? \qquad \vdash ? : ? \qquad ? \vdash ? : \tau .
$$

Thus we end up with eight non-trivial problems,as follows:

(i）？卜M:？(typability)；   
(ii)├M:？;   
(ii) r├ M:？; (iv) $\Gamma \vdash M : \tau$ (type checking);   
(v)├M:T;   
(vi) $? \vdash M : \tau ;$ (vii）├？:T(inhabitation）；   
(vii) r├？: T;

We have already noticed that problem (i) reduces to (iv).In fact,for the simply typed lambda-calculus,all problems (i)-(vi) are equivalent to unification,and thus also to each other,with respect to logarithmic-space reductions (Exercise 3.11).Thus,all these problems are PTIME-complete.We will see in Chapter 4 that (vii) and (vii) are complete for polynomial space.

# 3.3.Simply typed λ-calculus a la Church

Typed lambda-calculi usually occur in two variants,called Curry-style and Church-style systems. In the previous section we have seen an example of a Curry-style system.In such calculi, types are assigned (or not) to ordinary type-free lambda-terms,according to a set of rules.In this way,one term can be assigned more than one type.

The idea of a typed calculus a la Church is different.In the “orthodox" approach,all the type information is contained in a term,as follows.³ For each $\sigma \in \Phi _ {  } ,$ let $\Upsilon _ { \sigma }$ bea separate denumerable set of variables.Define the sets $\Lambda _ { \sigma }$ of simply typed terms of type $\pmb { \sigma }$ so that $\Upsilon _ { \sigma } \subseteq \Lambda _ { \sigma }$ and:

· If $M \in \Lambda _ { \sigma \to \tau }$ and $N \in \Lambda _ { \sigma }$ then $\left( M N \right) \in \Lambda _ { \tau }$ ·f $\mathcal { M } \in \Lambda _ { \tau }$ and $\boldsymbol { x } ^ { \sigma } \in \boldsymbol { \Upsilon } _ { \sigma }$ then $( \lambda x ^ { \sigma } M ) \in \Lambda _ { \sigma  \tau }$

The set of simply typed terms is then taken as the union of all $\Lambda _ { \sigma }$

It is sometimes convenient to think of typed lambda-terms this way, but nowadays it is more customary to define Church-style calculi in a slightly different manner.Instead of assuming that the set of variables is partitioned into disjoint sets indexed by types one uses environments to declare types of free variables as in the system $\grave { \mathbf { a } }$ la Curry.But types of bound variables remain part of the term syntax.

# 3.3.1.DEFINITION.

(i) Raw terms of Church-style $\lambda _ {  }$ are defined by the following rules:

·An object variable is a raw term;

·If $M , N$ are raw terns then the application $\{ M N \}$ is a raw term; ·If $M$ is a raw term, $\pmb { \mathcal { X } }$ is a variable,and $\pmb { \sigma }$ is a type then the abstraction $\{ \lambda x ; \sigma M \}$ is a raw term.

(ii) Free variables of a raw term $\pmb { M }$ are defined as follows.

$$
\begin{array} { l c l } { \operatorname { F V } ( x ) } & { = } & { \{ x \} } \\ { \operatorname { F V } ( \lambda x ; \sigma P ) } & { = } & { \operatorname { F V } ( P ) - \{ x \} } \\ { \operatorname { F V } ( P Q ) } & { = } & { \operatorname { F V } ( P ) \cup \operatorname { F V } ( Q ) } \end{array}
$$

If $\operatorname { F V } ( M ) = \emptyset$ then $\pmb { M }$ is called closed.

(iii） The variable $\pmb { \mathscr { X } }$ is considered bound in the term $( \lambda x { : } \sigma \mathcal { P } )$ We identify raw terms which differ only in their bound variables.4

3.3.2.CoNvENTION. We adopt similar terminology,notation,and conventions for raw terms as for untyped $\lambda$ -terms,see Chapter 1,mutatis mutandis, In particular,we omit parentheses if this does not create confusion,and we use dot notation, so that e.g.Ax:T.yx stands for $( \lambda x ; \tau ( y x ) )$ . In addition, to enhance readability,we sometimes write $\pmb { \mathscr { X } } ^ { \dagger }$ instead of $\pmb { x } = \pmb { \tau }$ ,like for instance in $\lambda x ^ { p \to q \to r } \lambda y ^ { p \to q } \lambda z ^ { p } . x z ( y z )$

The following definition of substitution on raw terms takes into account our assumption of identifying alpha-equivalent expressions.

3.3.3.DEFINITiON.The substitution of a raw term $N$ for $\pmb { x }$ in $M ,$ written $M [ x : = N ]$ ,isdefined as follows:

$$
\begin{array} { l r c l } { x [ x : = N ] } & { = } & { N ; } \\ { y [ x : = N ] } & { = } & { y , \mathrm { ~ i f ~ } x \neq y ; } \\ { ( P Q ) [ x : = N ] } & { = } & { P [ x : = N ] Q [ x : = N ] ; } \\ { ( \lambda y : \sigma . P ) [ x : = N ] } & { = } & { \lambda y : \sigma . P [ x : = N ] , \mathrm { ~ w h e ~ } } \end{array}
$$

The notion of $\beta \mathrm { . }$ -reduction for Church-style expressions is also similar to that for Curry-style terms.In the definition below,the notion of“compatible" applies to Church-style syntax (see the explanation following Definition 1.3.1).

3.3.4.DEFINITION.The relation $ \beta$ (single step $\beta$ -reduction) is the least compatible relation on raw terms,such that

$$
( \lambda x { : \sigma P } ) Q \to _ { \beta } P [ x { : = } Q ]
$$

The notation $\twoheadrightarrow \beta$ and $= \beta$ is used accordingly, cf.Remark 1.3.4.

3.3.5.DEFINITION. We say that $\pmb { M }$ is a term of type $\mathcal { T }$ in $\boldsymbol { \Gamma }$ ,and we write $\Gamma \vdash M : \tau$ when $\Gamma \vdash M : \tau$ can be derived using the rules in Figure 3.2.

FIGURE 3.2:THE SIMPLY TYPED LAMBDA-CALCULUS A LA CHURCH   

<table><tr><td>(Var)</td><td>Γ,x:t ├ x:T</td></tr><tr><td>（Abs)</td><td>T,x:σ ├M:t</td></tr><tr><td></td><td>T├(x:gM）:σ→T</td></tr><tr><td>(App)</td><td>Γ├M:σ→t Γ├N:σ</td></tr><tr><td></td><td>T├ (MN):T</td></tr></table>

3.3.6.EXAMPLE.Let $\sigma , \tau , \rho$ be arbitrary simple types.Then:

$$
\begin{array} { r l } & { \ u _ { \ u { \cdot } } \ u _ { \lambda } \propto \ d _ { \ b { \mathscr { T } } } \ d _ { x } : \sigma \to \sigma ; } \\ & { \ u _ { \ u { \cdot } } \ u _ { \lambda } \propto \ d _ { \mathscr { T } } \ d _ { \cdot } x : \sigma \to \tau \to \sigma ; } \\ & { \ u _ { \ u { \cdot } } \ u _ { x } \propto \ d _ { \mathscr { T } } \to \ d _ { \lambda } \ d _ { \mathscr { Y } } \to \tau \ d _ { \cdot } x \ d _ { z } \ d _ { \cdot } x \ d _ { z } ( y \ d _ { Z } ) : ( \sigma \to \tau \to \rho ) \to ( \sigma \to \tau ) \to \sigma \to \rho . } \end{array}
$$

Asin the Curry-style calculus,we have a subject reduction theorem:

3.3.7.THEOREM.If $\Gamma \vdash M : \sigma$ and $M \twoheadrightarrow _ { \beta } N$ then $\Gamma \vdash N : \sigma$

PROOF. Similar to the proof of Theorem 3.1.7.

It is sometimes convenient to consider also $\eta$ -reduction and $\eta$ -equality on typed terms.

3.3.8.DEFINITION.The relation $ _ { \eta }$ is the smallest compatible relation on raw terms,such that

$$
\lambda x : \sigma , M x \to _ { \eta } M ,
$$

whenever $x \not \in \mathrm { F V } ( M )$

It is not difficult to see that $\to _ { \eta }$ preserves types, i.e. that an analogue of Theorem 3.3.7 holds for eta-reductions.

# 3.4.Church versus Curry typing

Asmentioned at the beginning of Section 3.3,the principle of typinga la Church (at least in the orthodox way) is that types of all variables and terms are “fixed".The full type information is "built into”an expression,and a given well-formed term is correctly typed by definition.There is no issue of typability because the type of a term is simply a part of it.This corresponds to the use of types in programming languages like e.g. Pascal. In such languages, it is the responsibility of the programmer to provide proper types of all identifiers,functions,etc. In contrast,Curry-style typing resembles ML or Haskell,where a compiler or interpreter does the type inference.

Because of the difference above, $\lambda _ {  } \hat { \mathbf { a } }$ la Curry and other similar systems are often called type assignment systems,in contrast to $\lambda _ {  }$ a la Church and sirmilar systems which are called typed systems.

Our formulation of simply typed lambda-calculus a la Church is however halfway between the Curry style and the“orthodox”Church style.Types of bound variablesare “embedded”in terms,but types of free variables are declared in the environment rather than being part of syntax.A raw term becomes a true“typed Church-style term”only within an environment which determines types of its free variables.Then,unlike in Curry style (cf.Proposition 3.1.9) a type of a term is unique.

3.4.1.PROPOSITION.If $\Gamma \ \vdash \ M : \sigma$ andT├ M:T in the simply-typed X-calculus a la Church then $\sigma = \tau$

PROOF.Induction with respect to $\pmb { M }$

3.4.2.CoNvENTioN. In what follows,we often refer to Church-style terms without explicitly mentioning the environment,but if not stated otherwise it is implicitly assumed that some environment is given,and types of all variables are known. By Proposition 3.4.1 we can thus assume that every term has a uniquely determined type.We then proceed as if we actually dealt with “orthodox"Church-style terms.

In order to improve readability we sometimes write types of terms as superscripts,like in $( M ^ { \sigma  \tau } N ^ { \sigma } ) ^ { \tau }$ .This notation is not part of the syntax and is only used informally to stress that e.g. $M$ has type $\sigma \to \tau$ in a certain fixed environment.

Similar conventions are used in the later chapters,whenever Churchstyle systems are discussed.Also the word term always refers to a well-typed expression,cf.Definition 3.3.5.

Although the simply typed X-calculi a la Curry and Church are different, one has the feeling that essentially the same thing is going on.To a large extent this intuition is correct.A Church-style term $\mathcal { M }$ can in fact be seen as a linear notation for a type derivation that assigns a type to a Curry-style term.This term is the“core”or "skeleton”of $M$ ,obtained by erasing the domains of abstractions.

3.4.3.DEFINITION. The erasing map $\{ \cdot \}$ from Church-style to Curry-style terms is defined as follows:

$$
\begin{array} { r c l } { { | x | } } & { { = } } & { { x ; } } \\ { { | M N | } } & { { = } } & { { | M | | N | ; } } \\ { { | \lambda x { : } \sigma M | } } & { { = } } & { { \lambda x | M | . } } \end{array}
$$

3.4.4. PROPOSITION.

(i)If $M \to _ { \beta } N$ then $\vert M \vert  _ { \beta } \vert N \vert$

(ii）If $\Gamma \vdash M : \sigma$ a la Church then $\Gamma ^  \mathrm { ~ \ v ~ { ~ \ v ~ { ~ \} ~ } ~ } } | \mathcal { M } | : \sigma$ a la Curry.

PROOF.For (i) prove by induction on $\pmb { M }$ that

$$
| M [ x : = N ] | = | M | [ x : = | N ] ]
$$

Then proceed by induction on the definition of $M \to _ { \beta } N$ using $( \ast )$

Part (ii) follows by induction on the derivation of $\Gamma \vdash M : \sigma$

Conversely,one can “lift” every Curry derivation to a Church one.

3.4.5.PROPOSITION. For all $M , N \in \Lambda$ ：

(i）If $M  _ { \beta } N$ and $M = | M ^ { \prime } |$ then $M ^ { \prime } \to _ { \beta } N ^ { \prime }$ ,for some $N ^ { t }$ such that $\vert N ^ { \prime } \vert = N$ ，

(ii）If $\Gamma \vdash M : \sigma$ then there is $\pmb { \alpha }$ Church-style term $M ^ { t }$ with $| M ^ { t } | = M$ and $\Gamma \vdash M ^ { \prime } : \sigma$

PROOF.By induction on $M \to _ { \beta } N$ and $\Gamma \vdash M : \sigma$ respectively.

The two propositions above allow one to“translate” various properties of Curry-style typable lambda-terms to analogous properties of Church-style typed lambda-terrms,or conversely.For instance, strong normalization for one variant of $\lambda _ {  }$ implies strong normalization for the other (Exercise 3.15). But one has to be cautious with such proof methods (Exercise 3.19).

# 3.5.Normalization

In this section we show that all simply typed terms have normal forms.Even more,all such terms $\pmb { M }$ are strongly normalizing,i.e. there exists no infinite reduction $M = M _ { 1 } \to _ { \beta } M _ { 2 } \to _ { \beta } \dots $ In other words,no matter how we evaluate a well-typed expression,we must eventually reach a normal form. In programming terms: a program in a language based on the simply typed lambda-calculus can only diverge as a result of an explicit use of a programming construct such as a loop,a recursive call, or a circular data type.

Strong normalization makes certain properties easier to prove.Newman's lemma below is a good example.Another example is deciding equality of typed terms by comparing their normal forms (Section 3.7). Yet another related aspect is normalization of proofs,which will be seen at work in the chapters to come.

The results of this section hold for both Church-style and Curry-style terms.Our proofs are for Church style,but the Curry style variant can be easily derived (Exercise 3.15). In what follows,we assume that types of all variables are fixed, so that we effectively work with the“orthodox” Church style (cf. Convention 3.4.2).

3.5.1.THEoREM.Euery term of Church-style 入, hasa normal form.

PROOF.We show that a certain reduction strategy is normalizing.The idea is to always reduce a redex of a most complex type available and to begin from the right if there are several candidates.To make this idea precise, define the degree $\delta ( \tau )$ of a type $\pmb { \tau }$ by:

$$
\begin{array} { l l l } { { \delta ( p ) } } & { { = } } & { { 0 ; } } \\ { { \delta ( \tau \to \sigma ) } } & { { = } } & { { 1 + \operatorname* { m a x } ( \delta ( \tau ) , \delta ( \sigma ) ) . } } \end{array}
$$

The degree $\delta ( \Delta )$ of a redex $\Delta = ( \lambda x ^ { \tau } P ^ { p } ) R$ is $\delta ( \tau  \rho )$ . If a term $M$ is not in normal form then we define

$$
m _ { M } = ( \delta _ { M } , n _ { M } ) ,
$$

where $\delta _ { M } = \operatorname* { m a x } \{ \delta ( \Delta ) | \Delta $ isa redex in $M \}$ and $\pmb { n } _ { M }$ is the number of redex occurrences in $\mathcal { M }$ of degree $\delta _ { M }$ For $M \in \mathbf { N F } _ { \beta }$ put $m _ { \mathrm { { \it M } } } = \{ 0 , 0 \}$ .The proof is by induction on lexicographically ordered pairs $\mathbf { m } _ { M }$

If $M \in \operatorname { N F } _ { \beta }$ the assertion is trivially true. If $M \not \in { \mathrm { N F } } _ { \beta }$ let $\Delta$ be the rightmost redex in $\pmb { M }$ of maximal degree $\delta$ (we determine the position of a subterm by the position of its first symbol,i.e. the rightmost redex means the redex which begins as much to the right as possible).

Let $M ^ { \prime }$ be obtained from $\mathcal { M }$ by reducing the redex $\pmb { \Delta }$ The term $M ^ { t }$ may in general have more redexes than $\pmb { M }$ .But we claim that the number of redexes of degree $\pmb { \delta }$ in $M ^ { \prime }$ is smaller than in $\pmb { M }$ .Indeed, the redex $\Delta$ has disappeared,and the reduction of $\Delta$ may only create new redexes of degree less than $\delta$ To see this,note that the number of redexes can increase by either copying existing redexes or by creating new ones.The latter happens when a non-abstraction $A$ occurs in a context $A B$ ,and it is turned into an abstraction by the reduction of $\Delta$ .This is only possible when $\pmb { A }$ is a variable or $A = \Delta$ It follows that one of the following cases must hold:

1. The redex $\pmb { \Delta }$ has form $( \lambda x ^ { \tau } \dots x P ^ { \rho } \dots ) ( \lambda y ^ { \rho } Q ^ { \mu } ) ^ { \tau }$ ，where $\tau = \rho \to \mu ,$ and it reduces to ... $( \lambda y ^ { \rho } Q ^ { \mu } ) P ^ { \rho }$ ...The new redex $( \lambda y ^ { \rho } Q ^ { \mu } ) P ^ { \rho }$ is of degree $\delta ( \tau ) < \delta$

2. We have $\Delta = ( \lambda x ^ { \tau } \lambda y ^ { \rho } . R ^ { \mu } ) P ^ { \tau }$ ,occurring in the context $\Delta ^ { p  \mu } Q ^ { p }$ The reduction of $\Delta$ to $\lambda { y ^ { p } R _ { 1 } ^ { \mu } }$ ,for some $\scriptstyle { R _ { 1 } }$ ,creates a new redex $( \lambda y ^ { \rho } R _ { 1 } ^ { \mu } ) Q ^ { \rho }$ of degree $\delta ( \rho \to \mu ) < \delta ( \tau \to \rho \to \mu ) = \delta ,$

3.The last case is when $\Delta = ( \lambda x ^ { \tau } x ) ( \lambda y ^ { \rho } P ^ { \mu } )$ with $\tau = \rho \to \mu ,$ and it occurs in the context $\Delta ^ { \tau } Q ^ { \rho }$ .The reduction creates the new redex $\{ \lambda y ^ { \bar { \rho } } \bar { P } ^ { \mu } \} Q ^ { \bar { \rho } }$ of degree $\delta ( \tau ) < \delta$

The other way to add redexes is by copying.If $\Delta = ( \lambda x { : } \tau , P ^ { \rho } ) Q ^ { \tau }$ ,and the term $P$ contains more than one free occurrence of $\pmb { \mathcal { X } }$ ,then all redexes in $\boldsymbol { Q }$ are multiplied by the reduction.But we have chosen $\Delta$ to be the rightmost redex of degree $\delta _ { i }$ ，and thus all redexes in $\boldsymbol { Q }$ must be of smaller degrees,because they are to the right of $\pmb { \Delta }$

Thus, in all cases $m _ { M } > m _ { M ^ { \prime } }$ ,so by the induction hypothesis $\mathbf { \nabla } \mathcal { M } ^ { \prime }$ has a normal form, and then $\pmb { M }$ also has a normal form. □

Theorem 3.5.1 states that every typed term is normalizing.We now set out to show that every term is in fact strongly normalizing,i.e.that every reduction sequence from the term must eventually terminate. Our aim is to infer the strong property from the weak one,with the help of the conservation property of XI-terms (Corollary 1.6.7).This can be done by translating an arbitrarytyped $\lambda$ -term $\pmb { M }$ into a XI-term $\iota ( M )$ ,of the same type,such that $\iota ( M ) \in { \mathbb S } { \mathbb N }$ implies $M \in \mathbb { S } \mathbb { N }$

3.5.2.DEFINITION.For every propositional variable $\pmb { p }$ and every type $\pmb { \sigma }$ we choose a fixed $\lambda$ variable $k _ { p , \sigma }$ of type $p \to \sigma \to p$ If $\pmb { M }$ is a variable or an application then $\iota ( M )$ is defined as:

$$
\iota ( x ) = x , \qquad \iota ( P Q ) = \iota ( P ) \iota ( Q ) .
$$

Otherwise our term is an abstraction,say of the form

$$
M = \lambda x _ { 1 } ^ { \sigma _ { 1 } } \dots x _ { r } ^ { \sigma _ { r } } , N ^ { \tau _ { 1 } \dots \dots \dots \tau _ { m }  p } ,
$$

where $\tau > 0$ and $N$ is not an abstraction. In this case we define

$$
\iota \{ M \} = \lambda x _ { 1 } ^ { \sigma _ { 1 } } \ldots x _ { r } ^ { \sigma _ { r } } y _ { 1 } ^ { \tau _ { 1 } } \ldots y _ { m } ^ { \tau _ { m } } . k _ { p , \sigma _ { 1 } } ( \cdot \cdot \cdot ( k _ { p , \sigma _ { r } } ( \iota ( N ) y _ { 1 } \ldots y _ { m } ) x _ { r } ) \cdot \cdot \cdot ) x _ { 1 } .
$$

Finally,we defineaterm $t ( M )$ by replacing every $k _ { p , \sigma }$ occurring in $\iota ( M )$ by the appropriate version of the $\mathbf { \delta K }$ combinator,namely $\begin{array} { r } { \mathbf { K } _ { p , \sigma } = \lambda x ^ { p } \lambda y ^ { \sigma } , x . } \end{array}$

Note that $t ( M ) \to _ { \beta \eta } M$ Note also that $\iota ( M )$ isa typed AI-term,and thus it is strongly normalizing.We now want to prove that also $t ( M ) \in { \mathfrak { S } } \mathbb { N }$ ， by showing that reductions involving $\mathbf { K } _ { p , \sigma }$ are not essential.

3.5.3.LEMMA.If $M \not \in { \mathrm { S N } } _ { \beta }$ then $\pmb { M }$ has an infinite reduction sequence where no redex of the form $\mathbf { K } _ { p , \sigma } A$ isreduced.

PROOF.If aredex of the form $\mathbf { K } _ { p , \sigma } A$ is reduced to $\lambda y ^ { \sigma } A$ where $\pmb { p }$ is a type variable,then we say that thereduction step is of type 1.Clearly,an infinite reduction sequence may not consist exclusively of type 1 steps. It would thus suffce to show that steps of type 1 can always be “postponed"by permuting them with other reductions.Unfortunately, this property is not true: In the context $\mathbf { K } _ { \mathfrak { p } , \sigma } A B$ ,a reduction of type 1 creates a redex which can be reduced in the next step. These two steps cannot be permuted.

To solve this problem we first postpone reduction steps where a redex of the form $( \lambda y ^ { \sigma } A ^ { p } ) B ,$ with $y \not \in { \mathrm { F V } } ( A )$ ,is reduced to $A$ Let us say that such reductions are of type 2.Wewrite $M \to _ { 2 } M ^ { \prime }$ to indicate that the reduction is of type2,and we write $M \to _ { 0 } M ^ { \prime }$ otherwise. We prove that $M {  } _ { 2 } M ^ { \prime } {  } _ { 0 } M ^ { \prime \prime }$ implies $M {  } _ { 0 } M ^ { \prime \prime \prime } {  } _ { 2 } M ^ { \prime \prime }$ for some $M ^ { t t \prime }$

Let $\Delta = ( \lambda y ^ { \sigma } A ^ { p } ) B ^ { \sigma }$ be the redex reduced in the step from $M \to _ { 2 } M ^ { \prime }$ Since $\pmb { A }$ cannot be an abstraction, and ${ y \not \in \operatorname { F V } ( A ) }$ ,the redex $\pmb { \Sigma }$ reduced in the next step is not a“new"one,i.e.it is obtained from a redex $\Sigma ^ { \prime }$ in $\pmb { M }$ (possibly containing $\Delta$ ).It is left to the reader to check that the two reduction steps can easily be perrmuted. (There is a double arrow in $M ^ { \prime \prime \prime } {  } _ { 2 } M ^ { \prime \prime }$ ,because $\Delta$ can be duplicated or erased by reducing $\pmb { \Sigma }$ ）

The above allows us to postpone reduction steps of type 2,i.e.to conclude that there is an infinite reduction sequence without such steps.Using a similar argument,we can also postpone steps of type 1. Indeed,if $( \lambda x ^ { p } \lambda y ^ { \sigma } . x ) A ^ { p }$ is reduced to $\lambda y ^ { \sigma } A$ thenagain the next redex is either“inside”or"outside” the term $\pmb { A }$ □

# 3.5.4.LEMMA.Terms of the form $t ( M )$ are strongly $\beta$ -normalizing.

PROOF.Suppose that $t ( { \cal M } ) = { \cal M } _ { 0 }  _ { 0 } { \cal M } _ { 1 }  _ { 0 } { \cal M } _ { 2 }  _ { 0 } \cdots .$ is an infinite reduction sequence where no redex of the form $\mathbf { K } _ { p , \sigma } A$ is reduced. In this reduction sequence, the combinators $\mathbf { K } _ { p , \sigma }$ behave just like variables.It follows that $\iota ( M ) = M _ { 0 } ^ { \prime } \to _ { \beta } M _ { 1 } ^ { \prime } \to _ { \beta } M _ { 2 } ^ { \prime } \to _ { \beta } \dots .$ where $M _ { i }$ are obtained from $M _ { i } ^ { \prime }$ by substituting ${ \bf K } _ { p , \sigma }$ for $k _ { p , \sigma }$ .But $t ( M )$ is strongly normalizing. □

3.5.5.THEoREM. The simply typed lambda-calculus has the strong normalization property: Any term is strongly normalizing.

PROOF.If $M$ is not $\beta .$ -normalizing then $t ( M )$ has an infinite $\beta \eta$ -reduction sequence $t ( { \cal M } ) \  \beta \eta \ M \  \beta \ \cdots$ By Lemma 1.3.11,it must also have an infinite $\beta$ -reduction sequence, contradicting Lemma 3.5.4. □

# 3.6.Church-Rosser property

Proving the Church-Rosser property for Church-style typed terms is not as obvious as it may seem (Exercise 3.19).Fortunately, the typed lambdacalculus is strongly normalizing,and under this additional assumption,it is enough to show the weak Church-Rosser property.

3.6.1.DEFINITION. Let be a binary relation ina set $A$ Recall from Chapter1 that has the Church-Rosser property (CR) iff for all $a , b , c \in A$ such that ${ a \nrightarrow b }$ and $a \nrightarrow c$ there exists $d \in A$ with $b  d$ and $c \to d$ We say that the relation has the weak Church-Rosser property (WCR) when $a  b$ and $a \to c$ imply $b  d$ and $c  d ,$ for some $\pmb { d }$

We also say that a binary relation is strongly normalizing (SN) iff there is no infinite sequence $a _ { 0 }  a _ { 1 }  a _ { 2 }  \cdot \cdot$

Clearly,CR implies WCR.The converse is not true,see Exercise 3.16. But the two properties coincide for strongly normalizing relations.

3.6.2.PROPOSITION (Newman's lemma). $L e t  \ b e$ a binary relation satisfying SN. If satisfies WCR, then satisfies CR.

PROOF.Let be a relation on a set $A$ satisfying SN and WCR.As usual, a normal form is an $a \in A$ such that $a \neq b ,$ forall $b \in A$ ，

Since satisfies $\mathtt { s N }$ ，any $a \in A$ reduces to a normal forn. Call an element $\pmb { a }$ ambiguous if ${ \pmb q }$ reduces to two distinct normal forms. It is easy to see that satisfies CR if there are no ambiguous elements of $A$

But for any ambiguous $\pmb { a }$ there is another ambiguous ${ \pmb a } ^ { \prime }$ such that $a  a ^ { t }$ Indeed,suppose $a  b _ { 1 }$ and $a  b _ { 2 }$ and let $b _ { 1 } , b _ { 2 }$ be different normal forms. Both of these reductions must make at least one step since $b _ { 1 }$ and $b _ { 2 }$ are distinct,so the reductions have form $a  a _ { 1 }  b _ { 1 }$ and $a  a _ { 2 }  b _ { 2 }$ If $a _ { 1 } = a _ { 2 }$ we can choose $a ^ { \prime } = a _ { 1 } = a _ { 2 }$ If $a _ { 1 } \neq a _ { 2 }$ we know by WCR that $a _ { 1 } \nrightarrow b _ { 3 }$ and $a _ { 2 }  b _ { 3 }$ ,for some $b _ { 3 }$ .We can assume that $b _ { 3 }$ is a normal form.

$$
\sum \limits _ { b _ { 1 } } ^ { a } = \sum \limits _ { b _ { 2 } } ^ { b } a _ { 2 }
$$

Since $b _ { 1 }$ and $b _ { 2 }$ are distinct, $b _ { 3 }$ is different from $b _ { 1 }$ or $b _ { 2 }$ so we can choose $a ^ { \prime } = a _ { 1 }$ or ${ \pmb { a } } ^ { \prime } = { \pmb { a } } _ { 2 }$ Thus, $\pmb { \alpha }$ has an infinite reduction sequence, contradicting strong normalization. Hence, there are no ambiguous terms. □

Newman's lemma is a very useful tool for proving the Church-Rosser property.We will use it many times,and here is its debut.

3.6.3.THEOREM.The Church-style simply typed $\lambda$ -calculus has the Church-Rosser property.

PROOF.By Newman's lemma it suffces to check that the simply typed lambda-calculus has the WCR property.This is almost immediate if we observe that two different $\beta$ -redexes ina lambda-term can only be disjoint,or one is a part of the other.That is,redexes never “overlap”and if we reduce one of them we can still reduce the other.A formal proof can be done by induction with respect to the definition of $\beta$ -reduction. □

The subject reduction property together with the Church-Rosser property and strong normalization imply that reduction of any typed $\lambda$ -term terminates in a normal form of the same type,where the normal form is independent of the particular order of reduction chosen.

# 3.7.Expressibility

Aswe saw in the preceding section,every simply typed X-term has a normal form,and the normalization process always terminates.To verify whether two given terms of the same type are beta-equal or not,it thus suffices to reduce them to normal form and compare the results.However,this straightforward algorithm is of unexpectedly high complexity. It requires time and space proportional to the size of normal forms of the input terms.As demonstrated by Exercises 3.20-3.22,anormal form ofa term of length $\pmb { \mathcal { R } }$ can (in the worst case) be of size

$$
2 ^ { 2 ^ { \cdots ^ { 2 } } } \Biggr \} \mathcal { O } ( n )
$$

This isa non-elementary function,i.e.it grows faster thanany of the iterated exponentials defined by $\exp _ { 0 } ( n ) = n$ and $\begin{array} { r } { \exp _ { k + 1 } ( n ) = 2 ^ { e x p _ { k } ( n ) } } \end{array}$ .The following result,which we quote without proof (see [318,456l), states that the difficulty caused by the size explosion cannot be avoided.

3.7.1.THEoREM (Statman). The problem of deciding whether any two given Church-style terms $\pmb { \ M }$ and $\pmb { N }$ of the same type are beta-equal is of nonelementary complexity.That is, for each $\pmb { \gamma }$ ,every decision procedure takes more than $\exp _ { \eta _ { T } } ( n )$ steps on some inputs of size $\pmb { n }$

The strong normalization result gives a hint that the expressive power of $\lambda _ {  }$ should be weaker than that of the untyped lambda-calculus,i.e.that one should not be able to represent all recursive functions by simply typed $\lambda$ -terms.On the other hand,Theorem 3.7.1 might lead one to expect that the class of definable total functions should still be quite rich.

Aswe shall now see,the latter expectation is not quite correct,but first the notion of a definable function must be made precise.

3.7.2.DEFINITION.Let ${ \mathrm { i n t } } = ( p \to p ) \to ( p \to p )$ where $\pmb { p }$ is an arbitrary type variable.A function $f : \mathbb { N } ^ { k } \to \mathbb { N }$ is $\lambda _ {  }$ -definable if there is an $F \in \Lambda$ with $\vdash F : \operatorname { i n t } ^ { k }  \operatorname { i n t }$ ,such that

$$
F \mathbf { c } _ { n _ { 1 } } \cdot \cdot \cdot \mathbf { c } _ { n _ { k } } = _ { \beta } \mathbf { c } _ { f ( n _ { 1 } , \ldots , n _ { k } ) }
$$

for all $n _ { 1 } , \ldots , n _ { k } \in \mathbb { N }$

3.7.3.DEFINITioN. The class of extended polynomials is the smallest class of functions over $\mathbb { N }$ which is closed under compositions and contains the constant functions O and 1, projections,addition,multiplication,and the conditional function

$$
c o n d ( n _ { 1 } , n _ { 2 } , n _ { 3 } ) = { \left\{ \begin{array} { l l } { n _ { 2 } , } & { { \mathrm { i f } } ~ n _ { 1 } = 0 ; } \\ { n _ { 3 } , } & { { \mathrm { o t h e r w i s e } } . } \end{array} \right. }
$$

3.7.4.THEOREM (Schwichtenberg).The $\lambda _ {  }$ -definablefunctionsareexactly the ertended polynomials.

PROOF.Exercises 3.24-3.26.

# 3.8. Notes

Types are often seen as a method to avoid paradoxes occurring in the type-free world as a result of various forms of self-application. Undoubtedly，paradoxes gave the impulse for the creation of various type theories at the beginning of the 20th century.But,as pointed out in [165,257],it is natural in mathematics to classify or stratify objects into categories or “types”,and that occurred well before the paradoxes were discovered.

The history of formal type theory begins with Russell.The work of Chwistek, Ramsey,Hilbert,and others contributed to the development of the subject. An infuential presentation of the simple theory of types was given in Church's paper [73] of1940.For this purpose Church introduced the simply typed lambda-calculus, the core language of his type theory.

A typed version of combinatory logic was proposed by Curry a few years earlier, in the the 1934 paper [1oo],although Curry must have had the idea already in 1928,see [439,44o].Curry's full “theory of functionality”turned out later to be contradictory [1O4] but it was readily corrected [1o5].Soon types became a standard concept in the theory of combinators and in lambda-calculus.

Later types turned out to be useful in programming languages.Just like the type-free X-calculus provides a foundation of untyped programming languages, various typed A-calculi provide a foundation of programming languages with types. In particular, the design of languages like ML [387] motivated the research on type checking and typability problems.But,as noted in [237,pp.103-104], the main ideas of a type reconstruction algorithm can be traced as far back as the 1920's.5 Theunification-based principal type inference algorithm,implicit in Newman's 1943 paper [362],was first described by Hindley[234]in1969 (see [233,237,238] for historical notes).The PTIME-completeness of typability in simple types was shown in 1988 by Tyszkiewicz.Hindley's algorithm was later reinvented by Milner [342] for the language ML (but for ML it is no longer polynomial [259,263]).

If we look at the typability problem from the point of view of the Curry-Howard isomorphism, then we may restate it by asking whether a given"proof skeleton" can actually be turned into a correct proof by inserting the missirg formulas.Interestingly,such questions (like the “skeleton instantiation”problem of [5oo]) are indeed motivated by proof-theoretic research.

Our normalization proof follows Turing's unpublished note from the 1930's [166]. This method was later rediscovered by several other authors,including Prawitz [403]. The first published normalization proof can be found in [1o7] (see [166] for discussion).The translation from “weak"to strong normalization is based on Klop's [272], here modified using ideas of Gandy [167].A similar technique was earlier used by Nederpelt [359]. Variations of this approach have been invented (some independently from the original) by numerous authors,see e.g. [184,202,261,264,265, 312,508, 507].Paper [448] gives a survey of some of these results,see also [199].

A widely used normalization proof method,the computability method,is due to Tait.We will see it for the first time in Chapter 5.Another approach (first used byLevyand van Daalen in the late 197O's) is based on inductive characterizations of strongly normalizable terms [65,120,255].Other proofs are based on different forms of explicit induction,or semantical completeness [87,167,398,406,501]. Complexity bounds for the length of reductions are given in [433].

Various extensions of the simply typed lambda calculus can be proved strongly normalizable and we will do a number of such proofs in the chapters to follow. See also Chapter 7 for a related subject:cut-elimination.

Newman's lemma dates from 1942.A special case of it was known to Thue as early as in 1910 [458].The proof given here,a variant of Huet's proof in [249],is taken from [31].Theorem 3.7.4 is from [431] and remains true if type int is replaced by $\operatorname { i n t } _ { \sigma } = ( \sigma \to \sigma ) \to \sigma \to \sigma ,$ forany fixed $\pmb { \sigma }$ ,see [305]. If one does not insist that $\pmb { \sigma }$ is $\mathbf { f i x e d } ,$ more functions become $\lambda _ {  }$ -definable [153].For instance the predecessor function is definable bya term of type $\mathbf { i n t } _ { \sigma } \to \mathbf { i n t } _ { \tau }$ for suitable $\pmb { \sigma }$ and $\pmb { \tau }$ But various natural functions,like e.g.subtraction,remain undefinable even this way. To obtain a more interesting class of definable functions,one has to extend $\lambda _ {  }$ by some form of iteration or recursion, cf. Chapter 10.

The books [237,241] and the survey [32] are recommended for further reading on simply typed lambda-calculus and combinatory logic.Papers [165,257] give the historical perspective. For applications in programming languages we suggest [349,393].In our short exposition we have entirely omitted semantical issues and extensions of simply typed $\lambda$ -calculus,such as PCF.See [8,211,285,349] for more on these subjects.

# 3.9.Exercises

3.1.Show that the following $\lambda$ -terms are not typable in $\lambda _ {  } \hat { \mathbf { a } }$ la Curry.

$$
\mathbf { K I } \Omega , \qquad \mathbf { Y } , \qquad \lambda x y . y ( x \mathbf { K } ) ( x \mathbf { I } ) , \qquad \mathbf { 2 K } .
$$

3.2.Does the Curry style $\lambda _ {  }$ have the subject conversion property:If $\textstyle \mathbf { \dot { T } } \vdash M : { \boldsymbol { \sigma } }$ and $M = _ { \beta } N$ ，then $\Gamma \vdash N : \sigma _ { \cdot } ^ { \dagger }$ What if we assume in addition that $\pmb { N }$ is typable?

3.3.Show an example of an untypable AI-term $\pmb { M }$ ,such that $M \to _ { \beta } N$ for some typable term $\pmb { N }$

3.4.Show an example of a typable closed XI-term $\pmb { M }$ and a type $\pmb { \tau }$ such that $\mathcal { k } M : \tau ,$ but $M \to _ { \beta } N$ ,for some term $\pmb { N }$ with $\vdash \mathbf { N } : \tau$

3.5. Assume an environment $\mathbf { r }$ consisting of type assumptions of the form $( x _ { p } : p )$ Define terms $t _ { \tau }$ such that $\Gamma \vdash t _ { \tau } : \sigma$ holds if and only if $\tau = \sigma$

3.6.How long (in the worst case) is the shortest type of a Curry-style term of length $\pmb { \eta } \pmb { \ ? }$

3.7. Show that the general unification problemn can be reduced to the case of a signature consisting exclusively of the binary function symbol $\nrightarrow$

3.8. Show that the unifcation problem reduces to solving a single equation, provided the signature contains a binary function symbol.

3.9.Show that the unification problem reduces in logarithmic space to the typability problem.

3.10.Show that problems (vii) and (vii) of Remark 3.2.8 reduce to each other in logarithmic space.

3.11.Prove that the unification problem and problems (i)-(vi) of Remark 3.2.8 reduce to each other in logarithmic space.

3.12.What is wrong with the following reduction of problem (vi) to problem (i): To answer $? \vdash M : \tau$ ask the question $\mathfrak { P } \vdash \lambda y z . y ( z M ) ( z t _ { \tau } ) : \mathfrak { P }$

3.13.Prove the following converse principal type theorem: If $\pmb { \tau }$ is a non-empty type, then there exists a closed term $M$ such that $\pmb { \tau }$ is the principal type of $M$ (In fact, if $\pmb { N }$ is a closed term of type $\pmb { \tau } _ { i }$ then we can require $\pmb { M }$ to be beta-reducible to $\pmb { \mathcal { N } }$ ） Hint:Use the technique of Exercise 3.5.

3.14.Let $\Gamma \ \vdash \ M [ x \ \vdots = N ] \ : \sigma$ in Church-style,and let ${ \mathfrak { x } } \in { \mathfrak { F V } } ( M )$ .Show that $\Gamma , x : \tau \vdash M : \sigma$ for some $\tau$ with $\Gamma \vdash N : \tau$ Does it hold for Curry style?

3.15. Show that strong normalization for $( \lambda _ {  } )$ a la Curry implies strong normalization for $( \lambda \to ) \triangleq$ la Church,and conversely.

3.16.Show that the weak Church-Rosser property does not in general imply the Church-Rosser property.

3.17. Let $M _ { 1 }$ and $M _ { 2 }$ be Church-style normal forms of the same type, and let $| M _ { 1 } | = | M _ { 2 } |$ Show that $M _ { 1 } = M _ { 2 }$

3.18.Let $M _ { 1 }$ and $M _ { 2 }$ be Church-style terms of the same type, and assume that $\vert M _ { 1 } \vert = _ { \beta } \vert M _ { 2 } \vert$ Show that $M _ { 1 } {  } _ { \beta } M _ { 2 }$ Does $| M _ { 1 } | = | M _ { 2 } |$ imply $M _ { 1 } = M _ { 2 } ?$

3.19.Can you derive Church-Rosser property for Church-style terms from the Church-Rosser property for untyped terms?

3.20.How long is the normal form of the tern $M = 2 2 \dots 2 x y$ with $\pmb { \mathscr { n } }$ occurrences of 2? How long (including types) is a Church-style term $M ^ { t }$ such that $| \mathcal { M } ^ { \prime } | = \mathcal { M } ?$

3.21.(Based on [153].）This exercise uses the notation introduced in the proof of Theorem 3.5.1.In addition we define the depth $d ( M )$ of $\pmb { M }$ as:

$$
\begin{array} { l c l } { { d ( x ) } } & { { = } } & { { 0 ; } } \\ { { d ( M N ) } } & { { = } } & { { 1 + \operatorname* { m a x } ( d ( M ) , d ( N ) ) ; } } \\ { { d ( \lambda x ; \sigma M ) } } & { { = } } & { { 1 + d ( M ) . } } \end{array}
$$

Let $\delta = \delta \{ M \}$ and let $d ( M ) = d ,$ Show that $\pmb { M }$ reduces in at most $2 ^ { d }$ steps to some term $M _ { 1 }$ such that $\delta ( M _ { 1 } ) < \delta$ and $d ( M _ { 1 } ) \leq 2 ^ { d }$ ×

3.22.Use Exercise 3.21 to prove that if $\delta ( M ) = \delta$ and $d ( M ) = d$ then the normal form of a term $M$ is of depth at most $\mathrm { e x p } _ { \delta } \{ d \}$ ,and can be obtained in at most $\exp _ { \delta + 1 } ( d )$ reduction steps.

3.23.How long (in the worst case) is the normal form of a Curry-style typable term of length n？

3.24.Show that all the extended polynomials are $\lambda _ {  }$ -definable,

3.25.Let $\Gamma = \{ f : p \to p$ $a : \mathrm { i n t }$ ， $\pmb { b } : \mathbf { i n t }$ ， $x _ { 1 } : p , \ldots , x _ { r } : p \}$ ,and let $\Gamma \vdash M : \pmb { \mathscr { p } } ,$ Prove that there exists $\clubsuit$ polynomial $P ( m , n )$ and a number $i \in \{ 1 , \ldots , r \}$ such that $M [ a : = \mathbf { c } _ { m } , b : = \mathbf { c } _ { n } ] = _ { \beta } f ^ { P ( m , n ) } x _ { i }$ holds for all $m , n \neq 0$

3.26.Prove that all functions definable in simply typed lambda-calculus are extended polynomials (Theorem 3.7.4). Hint:Use Exercise 3.25.