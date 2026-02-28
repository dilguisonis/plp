# Chapter 3 Predicate Logic

# 3.1 Quantifiers

In propositional logic we used large chunks of mathematical language, namely those parts that can have a truth value. Unfortunately this use of language is patently insufficient for mathematical practice. A simple argument, such as “all squares are positive, 9 is a square, therefore 9 is positive” cannot be dealt with. From the propositional point of view the above sentence is of the form $\varphi \wedge \psi  \sigma$ , and there is no reason why this sentence should be true, although we obviously accept it as true. The moral is that we have to extend the language, in such a way as to be able to discuss objects and relations. In particular we wish to introduce means to talk about all objects of the domain of discourse, e.g. we want to allow statements of the form “all even numbers are a sum of two odd primes”. Dually, we want a means of expressing “there exists an object such that . . . ”, e.g. in “there exists a real number whose square is $2 ^ { \circ }$ .

Experience has taught us that the basic mathematical statements are of the form $^ { 6 6 } a$ has the property $P ^ { \ast }$ or $^ { 6 6 } a$ and $b$ are in the relation $R ^ { \ast }$ , etc. Examples are: $^ { * } n$ is even”, “ $f$ is differentiable”, $" 3 = 5 "$ , $^ { 6 6 } 7 < 1 2 ^ { 3 }$ , $^ { 6 6 } B$ is between $A$ and $C ^ { \ast }$ . Therefore we build our language from symbols for properties, relations and objects. Furthermore we add variables to range over objects (so called individual variables), and the usual logical connectives now including the quantifiers $\forall$ and ∃ (for “for all” and “there exists”).

We first give a few informal examples.

$$
\begin{array} { r l } & { \exists x P ( x ) } \\ & { \forall y P ( y ) } \\ & { \forall x \exists y ( x = 2 y ) } \\ & { \forall \varepsilon ( \varepsilon > 0 \to \exists n ( \frac { 1 } { n } \ll \varepsilon ) ) } \\ & { x < y \to \exists z ( x < z \land z < y ) } \\ & { } \\ & { \forall x \exists y ( x . y = 1 ) } \end{array}
$$

there is an $x$ with property $P$ , for all $y \ P$ holds (all $y$ have the property $P$ ), for all $x$ there is a $y$ such that $x$ is two times $y$ , for all positive $\epsilon$ there is an $n$ such that $\begin{array} { r } { \frac { 1 } { n } < \varepsilon } \end{array}$ , if $x < y$ , then there is a $z$ such that $x < z$ and $z < y$ , for each $x$ there exists an inverse $y$ .

We know from elementary set theory that functions are a special kind of relations. It would, however, be in flagrant conflict with mathematical practice to avoid functions (or mappings). Moreover, it would be extremely cumbersome. So we will incorporate functions in our language.

Roughly speaking the language deals with two categories of syntactical entities: one for objects—the terms, and one for statements—the formulas. Examples of terms are: $1 7 , x , ( 2 + 5 ) - 7 , x ^ { 3 y + 1 }$ .

What is the subject of predicate logic with a given language? Or, to put it differently, what are terms and formulas about? The answer is: formulas can express properties concerning a given set of relations and functions on a fixed domain of discourse. We have already met such situations in mathematics; we talked about structures, e.g. groups, rings, modules, ordered sets (see any algebra text). We will make structures our point of departure and we will get to the logic later.

In our logic we will speak about “all numbers” or “all elements”, but not about “all ideals” or “all subsets”, etc. Loosely speaking, our variables will vary over elements of a given universe (e.g. the $n \times n$ matrices over the reals), but not over properties or relations, or properties of properties, etc. For this reason the predicate logic of this book is called first-order logic, or also elementary logic. In everyday mathematics, e.g. analysis, one uses higher order logic. In a way it is a surprise that first-order logic can do so much for mathematics, as we will see. A short introduction to second-order logic will be presented in Chap. 5.

# 3.2 Structures

A group is a (non-empty) set equipped with two operations, a binary one and a unary one, and with a neutral element (satisfying certain laws). A partially ordered set is a set equipped with a binary relation (satisfying certain laws).

We generalize this as follows.

Definition 3.2.1 A structure is an ordered sequence $\langle A , R _ { 1 } , \ldots , R _ { n } , F _ { 1 } , \ldots , F _ { m }$ , $\{ c _ { i } | i \in I \} \rangle$ , where $A$ is a non-empty set. $R _ { 1 } , \ldots , R _ { n }$ are relations on $A , F _ { 1 } , \dots , F _ { m }$ are functions on $A$ , and the $c _ { i }$ $( i \in I )$ are elements of $A$ (constants).

Warning The functions $F _ { i }$ are total, i.e. defined for all arguments; sometimes this calls for tricks, as with $0 ^ { - 1 }$ (cf. p. 82).

# Examples

$\langle \mathbb { R } , + , \cdot , \cdot ^ { - 1 } , 0 , 1 \rangle$ —the field of real numbers, $\langle \mathbb { N } , < \rangle$ —the ordered set of natural numbers.

We denote structures by Gothic capitals: ${ \mathfrak { A } } , { \mathfrak { B } } , { \mathfrak { C } } , { \mathfrak { D } } , \dots$ The script letters are shown on p. 52.

If we overlook for a moment the special properties of the relations and operations (e.g. commutativity of addition on the reals), then what remains is the type of a structure, which is given by the number of relations, functions (or operations), and their respective arguments, plus the number (cardinality) of constants.

Definition 3.2.2 The similarity type of a structure ${ \mathfrak { A } } = \langle A , R _ { 1 } , \ldots , R _ { n } , F _ { 1 } , \ldots , F _ { m }$ , $\{ c _ { i } | i \in I \} \rangle$ is a sequence, $\langle r _ { 1 } , \ldots , r _ { n } ; a _ { 1 } , \ldots , a _ { m } ; \kappa \rangle$ , where $R _ { i } \subseteq A ^ { r _ { i } }$ , $F _ { j } : A ^ { a _ { j } }  A$ , $\kappa = | \{ c _ { i } \ | i \in I \} |$ (cardinality of $I$ ).

The two structures in our example have (similarity) type $\langle - ; 2 , 2 , 1 ; 2 \rangle$ and $\langle 2 ; - ; 0 \rangle$ . The absence of relations, functions is indicated by −. There is no objection to extending the notion of structure to contain arbitrarily many relations or functions, but the most common structures have finite types (including finitely many constants).

It would, of course, have been better to use semicolons for our structures, i.e. $\langle A ; R _ { 1 } , \ldots , R _ { n } ; F _ { 1 } , \ldots , F _ { m } ; c _ { i } | i \in I \rangle$ , but that would be too pedantic.

If $R \subseteq A$ , then we call $R$ a property (or unary relation), if $R \subseteq A ^ { 2 }$ , then we call $R$ a binary relation, if $R \subseteq A ^ { n }$ , then we call $R$ an $n$ -ary relation.

The set $A$ is called the universe of $\mathfrak { A }$ .

Notation $A = | \mathfrak { A } | . \ \mathfrak { A }$ is called (in)finite if its universe is (in)finite. We will mostly commit a slight abuse of language by writing down the constants instead of the set of constants; in the example of the field of real numbers we should have written: $\langle \mathbb { R } , + , \cdot , \ l ^ { - 1 } , \{ 0 , 1 \} \rangle$ , but $\langle \mathbb { R } , + , \cdot , \cdot ^ { - 1 } , 0 , 1 \rangle$ is more traditional. Among the relations one finds in structures, there is a very special one: the identity (or equality) relation.

Since mathematical structures, as a rule, are equipped with the identity relation, we do not list the relation separately. It does, therefore, not occur in the similarity type. We henceforth assume all structures to possess an identity relation and we will explicitly mention any exceptions. For purely logical investigations it makes, of course, perfect sense to consider a logic without identity, but this book caters to readers from the mathematics or computer science community.

One also considers the “limiting cases” of relations and functions, i.e. 0-ary relations and functions. An 0-ary relation is a subset of $A ^ { \varnothing }$ . Since $A ^ { \varnothing } = \{ \varnothing \}$ there are two such relations: ∅ and $\{ \varnothing \}$ (considered as ordinals: 0 and 1). 0-ary relations can thus be seen as truth values, which makes them play the role of the interpretations of propositions. In practice 0-ary relations do not appear; e.g. they have no role to play in ordinary algebra. Most of the time the reader can joyfully forget about them, nonetheless we will allow them in our definition because they simplify certain considerations. A 0-ary function is a mapping from $A ^ { \varnothing }$ into $A$ , i.e. a mapping from $\{ \varnothing \}$ into $A$ . Since the mapping has a singleton as domain, we can identify it with its range.

In this way 0-ary functions can play the role of constants. The advantage of the procedure is, however, negligible in the present context, so we will keep our constants.

# Exercises

1. Write down the similarity type for the following structures:

(i) $\langle \mathbb { Q } , < , 0 \rangle$ (ii) $\langle \mathbb { N } , + , \cdot , s , 0 , 1 , 2 , 3 , 4 , \dots , n , \dots \rangle$ , where $S ( x ) = x + 1$ ,   
(iii) $\langle \mathcal { P } ( \mathbb { N } ) , \subseteq , \cup , \cap , { } ^ { c } , \emptyset \rangle$ , (iv) $\langle \mathbb { Z } / ( 5 ) , + , \cdot , - , ^ { - 1 } , 0 , 1 , 2 , 3 , 4 \rangle$ , (v) $\langle \{ 0 , 1 \} , \wedge , \vee ,  , \lnot , 0 , 1 \rangle$ , where $\wedge , \vee ,  , \lnot$ operate according to the ordinary truth tables,   
(vi) $\langle \mathbb { R } , 1 \rangle$ ,   
(vii) $\langle \mathbb { R } \rangle$ ,   
(viii) $\langle \mathbb { R } , \mathbb { N } , \mathbf { < } , T , \mathbf { \mu } ^ { 2 } , | \mathbf { \mu } | , \mathbf { - } \rangle$ , where $T ( a , b , c )$ is the relation $^ { 6 6 } b$ is between $a$ and $c ^ { \prime \prime }$ , 2 is the square function, − is the subtraction function and $| \ |$ the absolute value.

2. Give structures with type $\langle 1 , 1 ; - ; 3 \rangle , \langle 4 ; - ; 0 \rangle$ .

# 3.3 The Language of a Similarity Type

The considerations of this section are generalizations of those in Sect. 2.1. Since the arguments are rather similar, we will leave a number of details to the reader. For convenience we fix the similarity type in this section: $\langle r _ { 1 } , \ldots , r _ { n }$ ; $a _ { 1 } , \ldots , a _ { m } ; \kappa \rangle$ , where we assume $r _ { i } \ge 0 , a _ { j } > 0$ .

The alphabet consists of the following symbols:

1. Predicate symbols: $P _ { 1 } , \ldots , P _ { n } , \doteq$   
2. Function symbols: $f _ { 1 } , \ldots , f _ { m }$   
3. Constant symbols: $\overline { { c } } _ { i }$ for $i \in I$   
4. Variables: $x _ { 0 } , x _ { 1 } , x _ { 2 } , \ldots$ (countably many)   
5. Connectives: $\vee , \wedge , \right. , \ - , \left. , \bot \forall , $ ∃   
6. Auxiliary symbols: (, ),

$\forall$ and ∃ are called the universal and the existential quantifier. The curiously looking equality symbol has been chosen to avoid possible confusion. There are in fact a number of equality symbols in use: one to indicate the identity in the models, one to indicate the equality in the meta-language and the syntactic one introduced above. We will, however, practice the usual abuse of language, and use these distinctions only if it is really necessary. As a rule the reader will have no difficulty in recognizing the kind of identity involved.

Next we define the two syntactical categories.

Definition 3.3.1 TERM is the smallest set $X$ with the properties (i) $\overline { { c } } _ { i } \in X ( i \in I )$ and $x _ { i } \in X ( i \in N )$ , (ii) $t _ { 1 } , \dots , t _ { a _ { i } } \in X \Rightarrow f _ { i } ( t _ { 1 } , \dots , t _ { a _ { i } } ) \in X$ , for $1 \leq i \leq m$ .

TERM is our set of terms.

Definition 3.3.2 FORM is the smallest set $X$ with the properties:

(i) $\bot \in X ; P _ { i } \in X$ if $r _ { i } = 0$ ; $t _ { 1 } , \dots , t _ { r _ { i } } \in T E R M \Rightarrow P _ { i } ( t _ { 1 } , \dots , t _ { r _ { i } } ) \in X ; \ t _ { 1 } , t _ { 2 } \in$ $T E R M \Rightarrow t _ { 1 } = t _ { 2 } \in X$ ,   
(ii) $\varphi , \psi \in X \Rightarrow ( \varphi \boxed { \ d \cup } \psi ) \in X$ , where $\sqcup \in \{ \wedge , \vee , \right. , \left. \}$ ,   
(iii) $\varphi \in X \Rightarrow ( \neg \varphi ) \in X$ ,   
(iv) $\varphi \in X \Rightarrow ( ( \forall x _ { i } ) \varphi )$ , $( ( \exists x _ { i } ) \varphi ) \in X$ .

FORM is our set of formulas. We have introduced $t _ { 1 } = t _ { 2 }$ separately, but we could have subsumed it under the first clause. If convenient, we will not treat equality separately. The formulas introduced in (i) are called atoms. We point out that (i) includes the case of 0-ary predicate symbols, conveniently called proposition symbols.

A proposition symbol is interpreted as a 0-ary relation, i.e. as 0 or 1 (cf. Definition 3.2.2). This is in accordance with the practice of propositional logic to interpret propositions as true or false. For our present purpose propositions are a luxury. In dealing with concrete mathematical situations (e.g. groups or posets) one has no reason to introduce propositions (things with a fixed truth value). However, propositions are convenient (and even important) in the context of Boolean-valued logic or Heyting-valued logic, and in syntactical considerations.

We will, however, allow a special proposition: $\perp$ , the symbol for the false proposition (cf. Sect. 2.2).

The logical connectives have, what one could call “a domain of action”, e.g. in $\varphi  \psi$ the connective yields the new formula $\varphi  \psi$ from formulas $\varphi$ and $\psi$ , and $\mathbf { S } \mathbf { O } \longrightarrow$ bears on $\varphi , \psi$ and all their parts. For propositional connectives this is not terribly interesting, but for quantifiers (and variable-binding operators in general) it is. The notion goes by the name of scope. So in $( ( \forall x ) \varphi )$ and $( ( \exists x ) \varphi )$ , $\varphi$ is the scope of the quantifier. By locating the matching brackets one can easily effectively find the scope of a quantifier. If a variable, term or formula occurs in $\varphi$ , we say that it is in the scope of the quantifier in $\forall x \varphi$ or $\exists x \varphi$ .

Just as in the case of PROP, we have induction principles for TERM and FORM.

Lemma 3.3.3 Let $A ( t )$ be a property of terms. If $A ( t )$ holds for t a variable or a constant, and if $\cdot A ( t _ { 1 } ) , A ( t _ { 2 } ) , \dots , A ( t _ { n } ) \Rightarrow A ( f ( t _ { 1 } , \dots , t _ { n } ) )$ , for all function symbols $f$ , then $A ( t )$ holds for all $t \in T E R M$ .

Proof Cf. Theorem 2.1.3.

Lemma 3.3.4 Let $A ( \varphi )$ be a property of formulas. If

(i) $A ( \varphi )$ for atomic $\varphi$ ,   
(ii) $A ( \varphi )$ , $A ( \psi ) \Rightarrow A ( \varphi \sqcup \psi )$ ,   
(iii) $A ( \varphi ) \Rightarrow A ( \neg \varphi )$ ,   
(iv) $A ( \varphi ) \Rightarrow A ( ( \forall x _ { i } ) \varphi )$ , $A ( ( \exists x _ { i } ) \varphi )$ for all $i$ , then $A ( \varphi )$ holds for all $\varphi \in F O R M$ .

Proof Cf. Theorem 2.1.3.

We will straight away introduce a number of abbreviations. In the first place we adopt the bracket conventions of propositional logic. Furthermore we delete the outer brackets and the brackets round $\forall x$ and $\exists x$ whenever possible. We agree that quantifiers bind more strongly than binary connectives. Furthermore we join strings of quantifiers, e.g. $\forall x _ { 1 } x _ { 2 } \exists x _ { 3 } x _ { 4 } \varphi$ stands for $\forall x _ { 1 } \forall x _ { 2 } \exists x _ { 3 } \exists x _ { 4 } \varphi$ . For better readability we will sometimes separate the quantifier and the formula by a dot: $\forall x \cdot \varphi$ . We will also assume that $n$ in $f ( t _ { 1 } , \ldots , t _ { n } )$ , $P ( t _ { 1 } , \ldots , t _ { n } )$ always indicates the correct number of arguments. $A$ word of warning: the use of $=$ might confuse a careless reader. The symbol $^ { 6 6 } = ^ { 9 9 }$ is used in the language $L$ , where it is a proper syntactic object. It occurs in formulas such as $x _ { 0 } = x _ { 7 }$ , but it also occurs in the meta-language, e.g. in the form $x = y$ , which must be read $\cdot _ { x }$ and $y$ are one and the same variable”. However, the identity symbol in $x = y$ can just as well be the legitimate symbol from the alphabet, i.e. $x = y$ is a meta-atom, which can be converted into a proper atom by substituting genuine variable symbols for $x$ and $y$ . Sometimes $\equiv$ is used for “syntactically identical”, as in $^ { 6 6 } x$ and $y$ are the same variable”. We will opt for $^ { 6 6 } = ^ { 9 9 }$ for the equality in structures (sets) and $^ { 6 6 } \mathop { = } ^ { \cdot \flat }$ for the identity predicate symbol in the language. We will use $\doteq$ a few times, but we prefer to stick to a simple $^ { 6 6 } = ^ { 9 9 }$ trusting the alertness of the reader.

Example 3.3.5 Example of a language of type $\langle 2 ; 2 , 1 ; 1 \rangle$ .

predicate symbols: $L , \dot { = }$ function symbols: $p , i$ constant symbol: $\overline { { e } }$

Some terms: $t _ { 1 } : = x _ { 0 } ; ~ t _ { 2 } : = p ( x _ { 1 } , x _ { 2 } ) ; ~ t _ { 3 } : = p ( { \overline { { e } } } , { \overline { { e } } } ) ; ~ t _ { 4 } : = i ( x _ { 7 } ) ; ~ t _ { 5 } : =$ $p ( i ( p ( x _ { 2 } , \overline { { e } } ) ) , i ( x _ { 1 } ) )$ .

Some formulas:

$$
\begin{array} { r l r l } & { \varphi _ { 1 } : = x _ { 0 } \doteq x _ { 2 } , \quad } & & { \varphi _ { 4 } : = ( x _ { 0 } \doteq x _ { 1 } \to x _ { 1 } \dot { = } x _ { 0 } ) , } \\ & { \varphi _ { 2 } : = t _ { 3 } \doteq t _ { 4 } , \quad } & & { \varphi _ { 5 } : = ( \forall x _ { 0 } ) ( \forall x _ { 1 } ) ( x _ { 0 } \dot { = } x _ { 1 } \to - L ( v _ { 0 } , x _ { 1 } ) ) } \\ & { \varphi _ { 3 } : = L ( i ( x _ { 5 } ) , \overline { { e } } ) , \quad } & & { \varphi _ { 6 } : = ( \forall x _ { 0 } ) ( \exists x _ { 1 } ) ( p ( x _ { 0 } , x _ { 1 } ) \dot { = } \overline { { e } } ) , } \\ & { } & & { \varphi _ { 7 } : = ( \exists x _ { 1 } ) ( \neg x _ { 1 } \dot { = } \overline { { e } } \wedge p ( x _ { 1 } , x _ { 1 } ) \dot { = } \overline { { e } } ) . } \end{array}
$$

(We have chosen a suggestive notation; think of the language of ordered groups: $L$ for “less than”, $p , i$ for “product” and “inverse”.) Note that the order in which the various symbols are listed is important. In our example $p$ has 2 arguments and $i$ has 1.

In mathematics there are a number of variable-binding operations, such as summation, integration, abstraction. Consider, for example, integration, in $\begin{array} { r } { \int _ { 0 } ^ { 1 } \sin x d x } \end{array}$ the variable plays an unusual role for a variable. For $x$ cannot “vary”; we cannot (without writing nonsense) substitute any number we like for $x$ . In the integral the variable $x$ is reduced to a tag. We say that the variable $x$ is bound by the integration symbol. Analogously we distinguish in logic between free and bound variables.

A variable may occur in a formula more than once. It is quite often useful to look at a specific instance at a certain place in the string that makes up the formula. We call these occurrences of the variable, and we use expressions like $^ { 6 6 } x$ occurs in the subformula $\psi$ of $\varphi$ .” In general we consider occurrences of formulas, terms, quantifiers, and the like.

In defining various syntactical notions we again freely use the principle of definition by recursion (cf. Theorem 2.1.6). The justification is immediate: the value of a term (formula) is uniquely determined by the values of its parts. This allows us to determine the value of $H ( t )$ for a mapping acting on terms, in finitely many steps.

Definition by Recursion on TERM Let $H _ { 0 } : V a r \cup C o n s t  A$ (i.e. $H _ { 0 }$ is defined on variables and constants), $H _ { i } : A ^ { a _ { i } }  A$ , then there is a unique mapping $H :$ $T E R M  A$ such that

$$
{ \big \lfloor } H ( f _ { i } ( t _ { 1 } , \dots , t _ { a _ { i } } ) ) = H _ { i } ( H ( t _ { 1 } ) , \dots , H ( t _ { a _ { i } } ) ) .
$$

# Definition by Recursion on FORM Let

$\begin{array} { r l } & { H _ { a t } : A t  A \quad ( \mathrm { i . e . ~ } H _ { a t } \mathrm { i s ~ d e f i n e d ~ o r } } \\ & { H _ { \square } : A ^ { 2 }  A \quad ( \square \in \{ \lor , \land ,  ,  \} ) , } \\ & { H _ { \neg } : A  A , } \\ & { H _ { \forall } : A \times N  A , } \\ & { H _ { \exists } : A \times N  A . } \end{array}$ atoms),

Then there is a unique mapping $H : F O R M  A$ such that

$$
\left\{ \begin{array} { l l } { H ( \varphi ) = H _ { a t } ( \varphi ) \quad \mathrm { f o r ~ a t o m i c } \varphi , } \\ { H ( \varphi \sqcap \psi ) = H _ { \bigstar } ( H ( \varphi ) , H ( \psi ) ) , } \\ { H ( \neg \varphi ) = H _ { \neg } ( H ( \varphi ) ) , } \\ { H ( \forall x _ { i } \varphi ) = H _ { \forall } ( H ( \varphi ) , i ) , } \\ { H ( \exists x _ { i } \varphi ) = H _ { \exists } ( H ( \varphi ) , i ) . } \end{array} \right.
$$

Definition 3.3.6 The set $F V ( t )$ of free variables of t is defined by

$$
\begin{array} { l } { F V ( x _ { i } ) : = \{ x _ { i } \} , } \\ { F V ( \overline { { c } } _ { i } ) : = \emptyset } \\ { F V ( f ( t _ { 1 } , \ldots , t _ { n } ) ) : = F V ( t _ { 1 } ) \cup \cdots \cup F V ( t _ { n } ) . } \end{array}
$$

Remark To avoid messy notation we will usually drop the indices and tacitly assume that the number of arguments is correct. The reader can easily provide the correct details, should he wish to do so.

Definition 3.3.7 The set $F V ( \varphi )$ of free variables of $\varphi$ is defined by

(i) $F V ( P ( t _ { 1 } , \dots , t _ { p } ) ) : = F V ( t _ { 1 } ) \cup \dots \cup F V ( t _ { p } ) ,$ , $F V ( t _ { 1 } = t _ { 2 } ) : = F V ( t _ { 1 } ) \cup F V ( t _ { 2 } )$ , $F V ( \bot ) = F V ( P ) : = \emptyset$ for $P$ a proposition symbol,

$$
\begin{array} { r l } & { F V ( \varphi \boxdot \psi ) : = F V ( \varphi ) \cup F V ( \psi ) , } \\ & { F V ( \neg \varphi ) : = F V ( \varphi ) , } \\ & { F V ( \forall x _ { i } \varphi ) : = F V ( \exists x _ { i } \varphi ) : = F V ( \varphi ) - \{ x _ { i } \} . } \end{array}
$$

Definition 3.3.8 $t$ or $\varphi$ is called closed if $F V ( t ) = \varnothing$ , resp. $F V ( \varphi ) = \varnothing$ . A closed formula is also called a sentence. A formula without quantifiers is called open. $T E R M _ { c }$ denotes the set of closed terms; SENT denotes the set of sentences.

It is left to the reader to define the set $B V ( \varphi )$ of bound variables of $\varphi$

# Continuation of Example 3.3.5

$F V ( t _ { 2 } ) = \{ x _ { 1 } , x _ { 2 } \} ; F V ( t _ { 3 } ) = \emptyset ; F V ( \varphi _ { 2 } ) = F V ( t _ { 3 } ) \cup F V ( t _ { 4 } ) = \{ x _ { 7 } \} ;$ FV(ϕ7) = ∅; $B V ( \varphi _ { 4 } ) = \emptyset$ ; $B V ( \varphi _ { 6 } ) = \{ x _ { 0 } , x _ { 1 } \}$ . $\varphi _ { 5 } , \varphi _ { 6 } , \varphi _ { 7 }$ are sentences.

Warning $F V ( \varphi ) \cap B V ( \varphi )$ need not be empty; in other words, the same variable may occur free and bound. To handle such situations one considers free (resp. bound) occurrences of variables. When necessary we will make informal use of occurrences of variables; see also p. 59.

Example $\forall x _ { 1 } ( x _ { 1 } = x _ { 2 } )  P ( x _ { 1 } )$ contains $x _ { 1 }$ both free and bound, for the occurrence of $x _ { 1 }$ in $P ( x _ { 1 } )$ is not within the scope of the quantifier.

In predicate calculus we have substitution operators for terms and for formulas.

Definition 3.3.9 Let $s$ and $t$ be terms, then $s [ t / x ]$ is defined by:

$$
\begin{array} { r l } & { y [ t / x ] : = \left\{ \begin{array} { l l } { y } & { \mathrm { i f ~ } y \neq x } \\ { t } & { \mathrm { i f ~ } y \equiv x } \end{array} \right. } \\ & { c [ t / x ] : = c } \\ & { f ( t _ { 1 } , \dots , t _ { p } ) [ t / x ] : = f ( t _ { 1 } [ t / x ] , \dots , t _ { p } [ t / x ] ) . } \end{array}
$$

Note that in the clause (i) $y \equiv x$ means $^ { 6 6 } x$ and $y$ are the same variables”.

# Definition 3.3.10 $\varphi [ t / x ]$ is defined by:

(i) $\perp [ t / x ] : = \perp$ , $P [ t / x ] : = P$ for propositions $P$ , (ii) $\begin{array} { r l } & { P ( t _ { 1 } , \dots , t _ { p } ) [ t / x ] : = P ( t _ { 1 } [ t / x ] , \dots , t _ { p } [ t / x ] ) , } \\ & { ( t _ { 1 } = t _ { 2 } ) [ t / x ] : = t _ { 1 } [ t / x ] = t _ { 2 } [ t / x ] , } \\ & { ( \varphi \sqsubseteq \psi ) [ t / x ] : = \varphi [ t / x ] \bigtriangledown \psi [ t / x ] , } \\ & { ( \neg \varphi ) [ t / x ] : = \neg \varphi [ t / x ] } \end{array}$

$$
{ \begin{array} { r l } { ( \forall y \varphi ) [ t / x ] : = { \left\{ \begin{array} { l l } { \forall y \varphi [ t / x ] } & { { \mathrm { i f ~ } } x \not \equiv y } \\ { \forall y \varphi } & { { \mathrm { i f ~ } } x \equiv y } \end{array} \right. } } \\ { ( \exists y \varphi ) [ t / x ] : = { \left\{ \begin{array} { l l } { \exists y \varphi [ t / x ] } & { { \mathrm { i f ~ } } x \not \equiv y } \\ { \exists y \varphi } & { { \mathrm { i f ~ } } x \equiv y } \end{array} \right. } } \end{array} }
$$

Substitution of formulas is defined as in the case of propositions; for convenience we use “ $\cdot \$ 3$ as a symbol for the propositional symbol (0-ary predicate symbol) which acts as a “place holder”.

Definition 3.3.11 $\sigma [ \varphi / \mathbb { S } ]$ is defined by:

(i) $\sigma [ \varphi / \ S ] : = { \left\{ \begin{array} { l l } { \sigma } & { { \mathrm { i f ~ } } \sigma \not \equiv \ S } \\ { \varphi } & { { \mathrm { i f ~ } } \sigma \equiv \ S } \end{array} \right. } \quad { \mathrm { f o r ~ a t o m i c ~ } } \sigma ,$ (ii) $\begin{array} { r l } & { ( \sigma _ { 1 } \sqcup \sigma _ { 2 } ) [ \varphi / \mathfrak { F } ] : = \sigma _ { 1 } [ \varphi / \mathfrak { F } ] \sqcup \sigma _ { 2 } [ \varphi / \mathfrak { F } ] } \\ & { ( \neg \sigma _ { 1 } ) [ \sigma / \mathfrak { F } ] : = \neg \sigma _ { 1 } [ \varphi / \mathfrak { F } ] } \\ & { ( \forall y \sigma ) [ \varphi / \mathfrak { F } ] : = \forall y . \sigma [ \varphi / \mathfrak { F } ] } \\ & { ( \exists y \sigma ) [ \varphi / \mathfrak { G } ] : = \exists y . \sigma [ \varphi / \mathfrak { G } ] . } \end{array}$

# Continuation of Example 3.3.5

$$
\begin{array} { l } { { t _ { 4 } [ t _ { 2 } / x _ { 1 } ] = i ( x _ { 7 } ) ; \qquad t _ { 4 } [ t _ { 2 } / x _ { 7 } ] = i ( p ( x _ { 1 } , x _ { 2 } ) ) ; } } \\ { { t _ { 5 } [ x _ { 2 } / x _ { 1 } ] = p ( i ( p ( x _ { 2 } , \overline { { { e } } } ) , i ( x _ { 2 } ) ) , } } \\ { { \varphi _ { 1 } [ t _ { 3 } / x _ { 0 } ] = p ( \overline { { { e } } } , \overline { { { e } } } ) \doteq x _ { 2 } ; \qquad \varphi _ { 5 } [ t _ { 3 } / x _ { 0 } ] = \varphi _ { 5 } . } } \end{array}
$$

We will sometimes make simultaneous substitutions, the definition is a slight modification of Definitions 3.3.9, 3.3.10 and 3.3.11. The reader is asked to write down the formal definitions. We denote the result of a simultaneous substitution of $t _ { 1 } , \ldots , t _ { n }$ for $y _ { 1 } , \ldots , y _ { n }$ in $t$ by $t [ t _ { 1 } , \ldots , t _ { n } / y _ { 1 } , \ldots , y _ { n } ]$ (similarly for $\varphi$ ).

Note that a simultaneous substitution is not the same as its corresponding repeated substitution.

Example $( x _ { 0 } \doteq x _ { 1 } ) [ x _ { 1 } , x _ { 0 } / x _ { 0 } , x _ { 1 } ] = ( x _ { 1 } \doteq x _ { 0 } )$ , but $( ( x _ { 0 } \doteq x _ { 1 } ) [ x _ { 1 } / x _ { 0 } ] ) [ x _ { 0 } / x _ { 1 } ] =$ $( x _ { 1 } \dot { = } x _ { 1 } ) [ x _ { 0 } / x _ { 1 } ] = ( x _ { 0 } \dot { = } x _ { 0 } )$ .

The quantifier clause in Definition 3.3.10 forbids substitution for bound variables. There is, however, one more case we want to forbid: a substitution, in which some variable after the substitution becomes bound. We will give an example of such a substitution; the reason why we forbid it is that it can change the truth value in an absurd way. At this moment we do not have a truth definition, so the argument is purely heuristic.

Example $\exists x ( y < x ) [ x / y ] = \exists x ( x < x ) .$

Note that the right-hand side is false in an ordered structure, whereas $\exists x ( y < x )$ may very well be true. We make our restriction precise.

# Definition 3.3.12 $t$ is free for $x$ in $\varphi$ if

(i) $\varphi$ is atomic,   
(ii) $\varphi : = \varphi _ { 1 } \bigsqcup \varphi _ { 2 }$ (or $\varphi : = \lnot \varphi _ { 1 } ,$ ) and $t$ is free for $x$ in $\varphi _ { 1 }$ and $\varphi _ { 2 }$ (resp. $\varphi _ { 1 }$ ),   
(iii) $\varphi : = \exists y \psi$ (or $\varphi : = \forall y \psi$ ) and if $x \in F V ( \varphi )$ , then $y \not \in F V ( t )$ and $t$ is free for $x$ in $\psi$ .

# Examples

1. $x _ { 2 }$ is free for $x _ { 0 }$ in $\exists x _ { 3 } P ( x _ { 0 } , x _ { 3 } )$ ,   
2. $f ( x _ { 0 } , x _ { 1 } )$ is not free for $x _ { 0 }$ in $\exists x _ { 1 } P ( x _ { 0 } , x _ { 3 } )$ ,   
3. $x _ { 5 }$ is free for $x _ { 1 }$ in $P ( x _ { 1 } , x _ { 3 } )  \exists x _ { 1 } Q ( x _ { 1 } , x _ { 2 } )$ .

Note that the use of $^ { 6 6 } t$ is free for $x$ in $\varphi ^ { , \dag }$ comes down to the fact that the (free) variables of $t$ are not going to be bound after substitution in $\varphi$ .

Lemma 3.3.13 t is free for $x$ in $\varphi \Leftrightarrow$ the variables of $t$ in $\varphi [ t / x ]$ are not bound by a quantifier.

Proof Induction on $\varphi$ .

• For atomic $\varphi$ the lemma is evident.

• $\varphi = \varphi _ { 1 } \bigsqcup \varphi _ { 2 } . t$ is free for $x$ in $\varphi \ { \stackrel { \mathrm { d e f . } } { \Leftrightarrow } } \ t$ is free for $x$ in $\varphi _ { 1 }$ and $t$ is free for $x$ in $\varphi _ { 2 } \Leftrightarrow$ the variables of $t$ in $\varphi _ { 1 } [ t / x ]$ are not bound by a quantifier and the variables of $t$ in $\varphi _ { 2 } [ t / x ]$ are not bound by a quantifier $\Leftrightarrow$ the variables of $t$ in $( \varphi _ { 1 } \bigsqcup \varphi _ { 2 } ) [ t / x ]$ are not bound by a quantifier.

• $\varphi = \neg \varphi _ { 1 }$ , similar.

• $\varphi = \exists y \psi$ . It suffices to consider the case $x \in F V ( \varphi )$ . $t$ is free for $x$ in $\varphi \ { \stackrel { \mathrm { d e f . } } { \Leftrightarrow } } \ y \notin$ $F V ( t )$ and $t$ is free for $x$ in $\psi \stackrel { \mathrm { i . h . } } { \Leftrightarrow }$ the variables of $t$ are not in the scope of $\exists y$ and the variables of $t$ in $\psi [ t / x ]$ are not bound by (another) quantifier $\Leftrightarrow$ the variables of $t$ in $\varphi [ t / x ]$ are not bound by a quantifier. �

There is an analogous definition and lemma for the substitution of formulas.

Definition 3.3.14 $\varphi$ is free for $\$ 1$ in $\sigma$ if:

(i) $\sigma$ is atomic, (ii) $\sigma : = \sigma _ { 1 } \bigsqcup \sigma _ { 2 }$ (or $\neg \sigma _ { 1 }$ ) and $\varphi$ is free for $\$ 1$ in $\sigma _ { 1 }$ and in $\sigma _ { 2 }$ (or in $\sigma _ { 1 }$ ), (iii) $\sigma : = \exists y \tau$ (or $\forall y \tau )$ and if $\$ 9$ occurs in $\sigma$ then $y \not \in F V ( \varphi )$ and $\varphi$ is free for $\$ 9$ in $\tau$ .

Lemma 3.3.15 $\varphi$ is free for $\$ 9$ in $\sigma \Leftrightarrow$ the free variables of $\varphi$ are in $\sigma [ \varphi / \$ ]$ not bound by a quantifier.

Proof As for Lemma 3.3.13.

From now on we tacitly suppose that all our substitutions are “free for”.

For convenience we introduce an informal notation that simplifies reading and writing.

Notation In order to simplify the substitution notation and to conform to an ancient suggestive tradition we will write down (meta-) expressions like $\varphi ( x , y , z ) , \psi ( x , x )$ , etc. This neither means that the listed variables occur free nor that no other ones occur free. It is merely a convenient way to handle substitution informally: $\varphi ( t )$ is the result of replacing $x$ by $t$ in $\varphi ( x ) ; \varphi ( t )$ is called a substitution instance of $\varphi ( x )$ .

We use the languages introduced above to describe structures, or classes of structures of a given type. The predicate symbols, function symbols and constant symbols act as names for various relations, operations and constants. In describing a structure it is a great help to be able to refer to all elements of $| \mathfrak { A } |$ individually, i.e. to have names for all elements (if only as an auxiliary device). Therefore we introduce the following.

Definition 3.3.16 The extended language, $L ( { \mathfrak { A } } )$ , of $\mathfrak { A }$ is obtained from the language $L$ , of the type of $\mathfrak { A }$ , by adding constant symbols for all elements of $| \mathfrak { A } |$ . We denote the constant symbol, belonging to $a \in | \mathfrak { A } |$ , by $\overline { { a } }$ .

Example Consider the language $L$ of groups; then $L ( { \mathfrak { A } } )$ , for $\mathfrak { A }$ the additive group of integers, has (extra) constant symbols ${ \overline { { 0 } } } , { \overline { { 1 } } } , { \overline { { 2 } } } , \ldots , { \overline { { - 1 } } } , { \overline { { - 2 } } } , { \overline { { - 3 } } } , \ldots .$ Observe that in this way 0 gets two names: the old one and one of the new ones. This is no problem, why shouldn’t something have more than one name?

# Exercises

1. Write down an alphabet for the languages of the types given in Exercise 1 of Sect. 3.2.   
2. Write down five terms of the language belonging to Exercise 1 (iii), (viii), Write down two atomic formulas of the language belonging to Exercise 1 (vii) and two closed atoms for Exercise 1 (iii), (vi).   
3. Write down an alphabet for languages of types $\langle 3 ; 1 , 1 , 2 ; 0 \rangle , \langle - ; 2 ; 0 \rangle$ and $\langle 1 ; - ; 3 \rangle$ .   
4. Check which terms are free in the following cases, and carry out the substitution:   
(a) $x$ for $x$ in $x = x$ ,   
(b) $y$ for $x$ in $x = x$ ,   
(c) $x + y$ for $y$ in $z = \overline { { 0 } }$ ,   
(d) ${ \overline { { 0 } } } + y$ for $y$ in $\exists x ( y = x )$ ,   
(e) $x + y$ for $z$ in $\exists w ( w + x = \overline { { 0 } } )$ ,   
(f) $x + w$ for $z$ in $\forall w ( x + z = \overline { { 0 } } )$ ,   
(g) $x + y$ for $z$ in $\forall w ( x + z = \overline { { 0 } } ) \wedge$ $\exists y ( z = x )$ ,   
(h) $x + y$ for $z$ in $\forall u ( u = v ) $ $\forall z ( z = y )$ .

# 3.4 Semantics

The art of interpreting (mathematical) statements presupposes a strict separation between “language” and the mathematical “universe” of entities. The objects of language are symbols, or strings of symbols, the entities of mathematics are numbers, sets, functions, triangles, etc. It is a matter for the philosophy of mathematics to reflect on the universe of mathematics; here we will simply accept it as given to us. Our requirements concerning the mathematical universe are, at present, fairly modest. For example, ordinary set theory will do very well for us. Likewise our desiderata with respect to language are modest. We just suppose that there is an unlimited supply of symbols.

The idea behind the semantics of predicate logic is very simple. Following Tarski, we assume that a statement $\sigma$ is true in a structure, if $\sigma$ actually is the case (the sentence “Snow is white” is true if snow actually is white). A mathematical example: $\cdot \overline { { { 2 } } } + \overline { { { 2 } } } = \overline { { { 4 } } } '$ is true in the structure of natural numbers (with addition) if $2 + 2 = 4$ (i.e. if addition of the numbers 2 and 2 yields the number 4). Interpretation is the art of relating syntactic objects (strings of symbols) and states of affairs “in reality”.

We will start by giving an example of an interpretation in a simple case. We consider the structure ${ \mathfrak { A } } = ( \mathbb { Z } , < , + , - , 0 )$ , i.e. the ordered group of integers.

The language has in its alphabet:

predicate symbols: $\dot { = } , L$ function symbols: $P , M$ constant symbol: 0

$L ( { \mathfrak { A } } )$ has, in addition to all that, constant symbols $\overline { { m } }$ for all $m \in \mathbb { Z }$ . We first interpret the closed terms of $L ( { \mathfrak { A } } )$ ; the interpretation $t ^ { \mathfrak { A } }$ of a term $t$ is an element of $\mathbb { Z }$ .

<table><tr><td>t</td><td>3</td></tr><tr><td>m</td><td>m</td></tr><tr><td>P(t1,t2) M(t)</td><td>t 13</td></tr></table>

Roughly speaking, we interpret $\overline { { m } }$ as “its number”, $P$ as plus, $M$ as minus. Note that we interpret only closed terms. This stands to reason, how should one assign a definite integer to $x$ ?

Next we interpret sentences of $L ( { \mathfrak { A } } )$ by assigning one of the truth values 0 or 1. As far as the propositional connectives are concerned, we follow the semantics for propositional logic.

$$
\begin{array} { r l r } & { } & { v ( \perp ) = 0 , } \\ & { } & { v ( t \doteq s ) = \left\{ \begin{array} { l l } { 1 } & { \mathrm { i f ~ } t ^ { \flat } = s ^ { \mathfrak { A } } } \\ { 0 } & { \mathrm { e l s e } , } \end{array} \right. } \\ & { } & { v ( L ( t , s ) ) = \left\{ \begin{array} { l l } { 1 } & { \mathrm { i f ~ } t ^ { \flat \iota } < s ^ { \mathfrak { A } } } \\ { 0 } & { \mathrm { e l s e } } \end{array} \right. } \end{array}
$$

$$
\begin{array} { r l } & { v ( \varphi \boxed { \ d } \psi ) \quad \mathrm { ~ a s ~ i n ~ D e f i n i t i o n ~ } 2 . 2 . 1 } \\ & { v ( \lnot \varphi ) \quad } \\ & { \quad v ( \forall { x } \varphi ) = \operatorname* { m i n } \{ v ( \varphi [ \overline { { n } } / x ] ) \mid n \in \mathbb { Z } \} } \\ & { \quad v ( \exists { x } \sigma ) = \operatorname* { m a x } \{ v ( \varphi [ \overline { { n } } / x ] ) \mid n \in \mathbb { Z } \} } \end{array}
$$

A few remarks are in order.

1. In fact we have defined a function $v$ by recursion on $\varphi$ .   
2. The valuation of a universally quantified formula is obtained by taking the minimum of all valuations of the individual instances, i.e. the value is 1 (true) iff all instances have the value 1. In this respect $\forall$ is a generalization of $\wedge$ . Likewise is a generalization of $\vee$ .   
3. $v$ is uniquely determined by $\mathfrak { A }$ , hence $v _ { \mathfrak { A } }$ would be a more appropriate notation. For convenience we will, however, stick to just $v$ .   
4. As in the semantics of propositional logic, we will write $[ [ \varphi ] ] \mathfrak { a }$ for $v { \mathfrak { A } } ( \varphi )$ , and when no confusion arises we will drop the subscript $\mathfrak { A }$ .   
5. It would be tempting to make our notation really uniform by writing $[ [ t ] ] _ { \mathfrak { A } }$ for $t ^ { \mathfrak { A } }$ . We will, however, keep both notations and use whichever is the most readable. The superscript notation has the drawback that it requires more brackets, but the $[ [$ -notation does not improve readability.

# Examples

1. $( P ( P ( \overline { { { 2 } } } , \overline { { { 3 } } } ) , M ( \overline { { { 7 } } } ) ) ) ^ { \mathfrak { A } } = P ( \overline { { { 2 } } } , \overline { { { 3 } } } ) ^ { \mathfrak { A } } + M ( \overline { { { 7 } } } ) ^ { \mathfrak { A } } = ( \overline { { { 2 } } } ^ { \mathfrak { A } } + \overline { { { 3 } } } ^ { \mathfrak { A } } ) + ( - \overline { { { 7 } } } ^ { \mathfrak { A } } ) = 2 + 3 + 3$ $( - 7 ) = - 2$ ,   
2. $[ [ \overline { { 2 } } \doteq \overline { { - 1 } } ] ] = 0$ , since $2 \neq - 1$ ,   
3. $\mathbb { [ } \overline { { 0 } } \doteq \overline { { 1 } } \to L ( \overline { { 2 5 } } , \overline { { 1 0 } } ) \mathbb { ] } = 1$ , since $[ \overline { { { 0 } } } = \overline { { { 1 } } } ] = 0$ and $[ [ L ( \overline { { 2 5 } } , \overline { { 1 0 } } ) ] ] = 0$ ; by the interpretation of the implication the value is 1,   
4. $\begin{array} { r } { \mathbb { [ } \forall x \exists y ( L ( x , y ) ) ] = \operatorname* { m i n } _ { n } ( \operatorname* { m a x } _ { m } \mathbb { [ } L ( \overline { { n } } , \overline { { m } } ) ] ] ) } \end{array}$ . $\left[ { \mathbb L } ( \overline { { n } } , \overline { { m } } ) \right] = 1$ for $m > n$ , so for fixed $n$ , $\mathrm { m a x } _ { m } \mathbb { I } ( \overline { { n } } , \overline { { m } } ) \mathbb { I } = 1$ , and hence $\begin{array} { r } { \operatorname* { m i n } _ { n } \operatorname* { m a x } _ { m } \big [ { L ( \overline { { n } } , \overline { { m } } ) } \big ] = 1 } \end{array}$ .

Let us now present a definition of interpretation for the general case. Consider $\mathfrak { A } = \langle A , R _ { 1 } , \ldots , R _ { n } , F _ { 1 } , \ldots , F _ { m } , \{ c _ { i } | i \in I \} \rangle$ of a given similarity type $\langle r _ { 1 } , \ldots , r _ { n }$ ; $a _ { 1 } , \ldots , a _ { m } ; | I | \rangle$ .

The corresponding language has predicate symbols $\overline { { R } } _ { 1 } , \ldots , \overline { { R } } _ { n }$ , function symbols $\overline { { F } } _ { 1 } , \ldots , \bar { \overline { { F } } } _ { m }$ and constant symbols $\overline { { c } } _ { i }$ . $L ( { \mathfrak { A } } )$ , moreover, has constant symbols $\overline { { a } }$ for all $a \in | \mathfrak { A } |$ .

Definition 3.4.1 An interpretation of the closed terms of $L ( { \mathfrak { A } } )$ in $\mathfrak { A }$ is a mapping $\left( . \right) ^ { \mathfrak { A } } : T E R M _ { c } \to | \mathfrak { A } |$ satisfying:

(i) $\begin{array} { r l } { \overline { { c _ { i } } } ^ { \mathfrak { A } } = c _ { i } } & { { } ( = \mathbb { [ } \overline { { c _ { i } } } \mathbb { ] } _ { \mathfrak { A } } ) } \\ { \overline { { a } } ^ { \mathfrak { A } } = a , } & { { } ( = \mathbb { [ } \overline { { a } } \mathbb { ] } _ { \mathfrak { A } } ) } \end{array}$

$$
\begin{array} { r l } & { ( \overline { { F } } _ { i } ( t _ { 1 } , \dots , t _ { p } ) ) ^ { \mathfrak { A } } = F _ { i } ( t _ { 1 } ^ { \mathfrak { A } } , \dots , t _ { p } ^ { \mathfrak { A } } ) , \quad ( = \mathbb { I } [ F _ { i } ( t _ { 1 } , \dots , t _ { p } ) ] _ { \mathfrak { A } } } \\ & { \quad \mathrm { w h e r e ~ } p = a _ { i } } \end{array}
$$

There is also a valuation notation using Scott brackets; we have indicated in the above definition how these brackets are to be used. The following definition is exclusively in terms of valuations.

Definition 3.4.2 An interpretation of the sentences $\varphi$ of $L ( { \mathfrak { A } } )$ in $\mathfrak { A }$ is a mapping $[ [ . ] ] { \mathfrak { A } } : S E N T \to \{ 0 , 1 \}$ , satisfying:

(i) $\mathbb { I } \mathbb { \perp } \mathbb { I } \mathfrak { A } : = 0 ,$ $[ \overline { { R } } ] ] _ { \mathfrak { A } } : = R$ (i.e. 0 or 1).

$\bigl [ \overline { { \boldsymbol { R } } } _ { i } ( t _ { 1 } , \dots , t _ { p } ) \bigl ] \mathbf { \mathrm { \nabla } } \mathrm { \ J } : = \left\{ \begin{array} { l l } { { 1 \mathrm { ~ i f ~ } \langle t _ { 1 } ^ { \mathfrak { A } } , \dots , t _ { p } ^ { \mathfrak { A } } \rangle \in R _ { i } , } } \\ { { 0 } } \end{array} \right.$ where $p = r _ { i }$ , else. $[ [ t _ { 1 } = t _ { 2 } ] ] \mathfrak { A } , : = \left\{ \begin{array} { l l } { { 1 } } & { { \mathrm { i f } t _ { 1 } ^ { \mathfrak { A } } = t _ { 2 } ^ { \mathfrak { A } } } } \\ { { 0 } } & { { \mathrm { e l s e } . } } \end{array} \right.$

(iii) $\begin{array} { r } { \mathbb { I } \varphi \wedge \psi \mathbb { I } \mathfrak { A } : = \operatorname* { m i n } ( \mathbb { I } \varphi \mathbb { I } \mathfrak { A } , \mathbb { I } \psi \mathbb { I } \mathfrak { A } ) , } \end{array}$ $\begin{array} { r } { \mathbb { [ } \boldsymbol { \varphi } \vee \boldsymbol { \psi } \mathbb { ] } \mathfrak { z } \mathfrak { z } : = \operatorname* { m a x } ( \mathbb { [ } \boldsymbol { \varphi } \mathbb { ] } \mathfrak { z } , \mathbb { [ } \boldsymbol { \psi } \mathbb { ] } \mathfrak { z } ) , } \end{array}$ $\mathbb { [ \varphi  \psi \mathbb { J } ] } \mathfrak { A } : = \operatorname* { m a x } ( 1 - \mathbb { [ \varphi \mathbb { J } ] } \mathfrak { A } , \mathbb { [ \psi \mathbb { J } ] } \mathfrak { A } ) ,$ ϕ ↔ ψ A := 1 − | ϕ A − ψ A|, ¬ϕ A := 1 − ϕ A.   
(iv) ∀xϕ A := min{ ϕ[a/x] A| a ∈ |A|}, ∃xϕ A := max{ ϕ[a/x] A| a ∈ |A|}.

Convention: from now on we will assume that all structures and languages have the appropriate similarity type, so that we don’t have to specify the types all the time.

In predicate logic there is a popular and convenient alternative for the valuation notation:

${ \mathfrak { A } } \models \varphi$ stands for $[ \varphi ] \mathbb { \mathfrak { a } } = 1$ . We say that $^ { 6 6 } \varphi$ is true, valid, in $\mathfrak { A } ^ { \mathfrak { s } }$ if ${ \mathfrak { A } } \models \varphi$ . The relation $\vDash$ is called the satisfaction relation.

Note that the same notation is available in propositional logic—there the role of $\mathfrak { A }$ is taken by the valuation, so one could very well write $v \models \varphi$ for $[ [ \varphi ] ] _ { v } = 1$ .

So far we have only defined truth for sentences of $L ( { \mathfrak { A } } )$ . In order to extend $\vDash$ to arbitrary formulas we introduce a new notation.

Definition 3.4.3 Let $F V ( \varphi ) = \left\{ z _ { 1 } , . . . , z _ { k } \right\}$ , then $C l ( \varphi ) : = \forall z _ { 1 } \dots z _ { k } \varphi$ is the universal closure of $\varphi$ (we assume the order of variables $z _ { i }$ to be fixed in some way).

# Definition 3.4.4

(i) ${ \mathfrak { A } } \models \varphi$ iff $\mathfrak { A } | = C l ( \varphi )$ ,   
(ii) $\models \varphi$ iff ${ \mathfrak { A } } \models \varphi$ for all $\mathfrak { A }$ (of the appropriate type),   
(iii) ${ \mathfrak { A } } \models { \cal T }$ iff ${ \mathfrak { A } } \models \psi$ for all $\psi \in { \cal {Gamma } }$ ,   
(iv) ${ \cal { T } } \models \varphi$ iff $( { \mathfrak { A } } \models { \Gamma } \Rightarrow { \mathfrak { A } } \models \varphi )$ , where ${ \cal { T } } \cup \{ \varphi \}$ consists of sentences.

If ${ \mathfrak { A } } \models \sigma$ , we call $\mathfrak { A }$ a model of $\sigma$ . In general: if ${ \mathfrak { A } } \models { \cal T }$ , we call $\mathfrak { A }$ a model of $\boldsymbol { { \Gamma } }$ . We say that $\varphi$ is true if $\models \varphi$ , $\varphi$ is a semantic consequence of $\varGamma$ if ${ \cal T } \models \varphi$ , i.e. $\varphi$ holds in each model of $\varGamma$ . Note that this is all a straightforward generalization of Definition 2.2.4.

If $\varphi$ is a formula with free variables, say $F V ( \varphi ) = \left\{ z _ { 1 } , \dots , z _ { k } \right\}$ , then we say that $\varphi$ is satisfied by $a _ { 1 } , \dots , a _ { k } \in | { \mathfrak { A } } |$ if $\mathfrak { A } \vdash \varphi [ \overline { { a } } _ { 1 } , \ldots , \overline { { a } } _ { k } / z _ { 1 } , \ldots , z _ { k } ] , \varphi$ is called satisfiable in $\mathfrak { A }$ if there are $a _ { 1 } , \ldots , a _ { k }$ such that $\varphi$ is satisfied by $a _ { 1 } , \ldots , a _ { k }$ and $\varphi$ is called satisfiable if it is satisfiable in some $\mathfrak { A }$ . Note that $\varphi$ is satisfiable in $\mathfrak { A }$ iff $\mathfrak { A } \models \exists z _ { 1 } \dots z _ { k } \varphi$ .

The properties of the satisfaction relation are in understandable and convenient correspondence with the intuitive meaning of the connectives.

Lemma 3.4.5 If we restrict ourselves to sentences, then

(i) $\mathfrak { A } \models \varphi \land \psi \Leftrightarrow \mathfrak { A } \models \varphi$ and ${ \mathfrak { A } } \models \psi$ , (ii) $\mathfrak { A } \models \varphi \lor \psi \Leftrightarrow \mathfrak { A } \models \varphi \ \mathfrak { e }$ or ${ \mathfrak { A } } \models \psi$ , (iii) $\mathfrak { A } \models \neg \varphi \Leftrightarrow \mathfrak { A } \models \varphi$ , (iv) $\mathfrak { A } \vdash \varphi  \psi \Leftrightarrow ( \mathfrak { A } \vdash \varphi \Rightarrow \mathfrak { A } \vdash \psi$ ), (v) $\mathfrak { A } \models \varphi \Leftrightarrow \psi \Leftrightarrow ( \mathfrak { A } \models \varphi \Leftrightarrow \mathfrak { A } \models \psi )$ , (vi) $ \mathfrak { A } \models \forall x \varphi \Leftrightarrow \mathfrak { A } \models \varphi [ \overline { { a } } / x ]$ , for all $a \in | \mathfrak { A } |$ , (vii) $\mathfrak { A } \Vdash \exists x \varphi \Leftrightarrow \mathfrak { A } \models \varphi [ \overline { { a } } / x ]$ , for some $a \in | \mathfrak { A } |$

Proof Immediate from Definition 3.4.2. We will do two cases.

(iv) $\mathfrak { A } \models \varphi \to \psi \Leftrightarrow \ [ \varphi \to \psi \ ] _ { \mathfrak { A } } = \operatorname* { m a x } ( 1 - \mathbb { I } \varphi \mathbb { I } \mathfrak { a } , [ \psi ] \mathfrak { a } ) = 1 .$ . Suppose ${ \mathfrak { A } } \models \varphi$ , i.e. $[ [ \varphi ] ] _ { \mathfrak { A } } = 1$ , then clearly $[ [ \psi ] ] _ { \mathfrak { A } } = 1$ , or ${ \mathfrak { A } } \models \psi$ . Conversely, let ${ \mathfrak { A } } \models \varphi \Rightarrow { \mathfrak { A } } \models \psi$ , and suppose ${ \mathfrak { A } } \not \models \varphi \to \psi$ , then $\mathbb { [ \varphi  }$ $\psi \mathbb { I } \mathbb { { z } } = \operatorname* { m a x } ( 1 - \mathbb { [ } \varphi \mathbb { I } \mathbb { { z } } , \mathbb { [ } \psi \mathbb { I } \mathbb { { z } } ) = 0$ . Hence $[ [ \psi ] ] _ { \mathfrak { A } } = 0$ and $\mathbb { J } \varphi \mathbb { J } \mathfrak { a } \ = 1$ . Contradiction.   
(vii) $\mathfrak { A } \models \exists x \varphi ( x ) \Leftrightarrow \operatorname* { m a x } \{ \ [ \varphi ( \overline { { a } } ) ] \ v { g } _ { 1 } | a \in | \mathfrak { A } | \} = 1 \Leftrightarrow$ there is an $a \in | { \mathfrak { A } } |$ such that $[ [ \varphi ( \overline { { a } } ) ] ] _ { \mathfrak { A } } = 1 \Leftrightarrow$ there is an $a \in | \mathfrak { A } |$ such that ${ \mathfrak { A } } \models \varphi ( { \overline { { a } } } )$ . �

Lemma 3.4.5 tells us that the interpretation of sentences in $\mathfrak { A }$ runs parallel to the construction of the sentences by means of the connectives. In other words, we replace the connectives by their analogues in the meta-language and interpret the atoms by checking the relations in the structure.

For example, consider our example of the ordered additive group of integers: $\mathfrak { A } \models \lnot \forall { x } \exists { y } ( { x } \doteq { P } ( { y } , { y } ) ) \Leftrightarrow \mathrm { I t }$ is not the case that for each number $n$ there exists an $m$ such that $n = 2 m \Leftrightarrow$ not every number can be halved in $\mathfrak { A }$ . This clearly is correct, take for instance $n = 1$ .

Let us reflect for a moment on the valuation of proposition symbols; an 0-ary relation is a subset of $A ^ { \varnothing } = \{ \varnothing \}$ , i.e. it is $\varnothing$ or $\{ \varnothing \}$ and these are, considered as ordinals, 0 or 1. So $[ \overline { { P } } ] ] _ { \mathfrak { A } } = P$ , and $P$ is a truth value. This makes our definition perfectly reasonable. Indeed, without aiming for a systematic treatment, we may observe that formulas correspond to subsets of $A ^ { k }$ , where $k$ is the number of free variables. For example, let $F V ( \varphi ) = \left\{ z _ { 1 } , \dots , z _ { k } \right\}$ , then we could put $[ [ \varphi ] ] _ { \mathfrak { A } } = \{ \langle a _ { 1 } , \ldots , a _ { k } \rangle | \mathfrak { A } | =$ $\varphi ( \overline { { a } } _ { 1 } , \dots , \overline { { a } } _ { k } ) \} ( = \{ \langle a _ { 1 } , \dots , a _ { n } \rangle | \underline { { [ \varphi ( \overline { { a } } _ { 1 } , \dots , \overline { { a } } _ { k } ) ] } } \} \alpha = 1 \} )$ ), thus stretching the meaning of $[ [ \varphi ] ] _ { \mathfrak { A } }$ a bit. It is immediately clear that applying quantifiers to $\varphi$ reduces the “dimension”. For example, $\mathbb { [ } \exists x P ( x , y ) \mathbb { ] } \mathfrak { A } = \{ a | \mathfrak { A } \ v { e } | = P ( \overline { { b } } , \overline { { a } } )$ for some $b \}$ , which is the projection of $\mathbb { [ } P ( x , y ) \mathbb { ] } \mathbb { a }$ onto the $y$ -axis.

# Exercises

1. Let $\mathfrak { N } = \langle N , + , \cdot , S , 0 \rangle$ , and $L$ a language of type $\langle - ; 2 , 2 , 1 ; 1 \rangle$ .

(i) Give two distinct terms $t$ in $L$ such that $t ^ { \mathfrak { N } } = 5$ .   
(ii) Show that for each natural number $n \in N$ there is a term $t$ such that $t ^ { \mathfrak { N } } = n$ .   
(iii) Show that for each $n \in N$ there are infinitely many terms $t$ such that $t ^ { \mathfrak { N } } = n$ .

2. Let $\mathfrak { A }$ be the structure of Exercise 1 (v) of Sect. 3.2. Evaluate ( $( ( \overline { { 1 } }  \overline { { 0 } } ) $ $\neg \overline { { { 0 } } } ) \wedge ( \neg \overline { { { 0 } } } ) \to ( \overline { { { 1 } } } \to \overline { { { 0 } } } ) ) ^ { \mathfrak { U } }$ , $( \overline { { 1 } }  \neg ( \neg \overline { { 0 } } \vee \overline { { 1 } } ) ) ^ { \mathfrak { A } }$ .

3. Let $\mathfrak { A }$ be the structure of Exercise 1 (viii) of Sect. 3.2. Evaluate $( | ( { \sqrt { 3 } } ) ^ { 2 } -$ $\overline { { - 5 } } | ) ^ { \mathfrak { A } }$ , $( \overline { { 1 } } - ( | \overline { { ( - 2 ) } } | - ( \overline { { 5 } } - \overline { { ( - 2 ) } } ) ) ) ^ { 2 1 }$ .

4. Which cases of Lemma 3.4.5 remain correct if we consider formulas in general?

5. For sentences $\sigma$ we have ${ \mathfrak { A } } \models \sigma$ or ${ \mathfrak { A } } \models \lnot \sigma$ . Show that this does not hold for $\varphi$ with $F V ( \varphi ) \neq \emptyset$ . Show that not even for sentences $\models \sigma$ $\mathrm { o r }   \kern - delimiterspace =  \lnot \sigma$ holds in general.

6. Show for closed terms $t$ and formulas $\varphi$ (in $L ( { \mathfrak { A } } ) { \big . }$ ): ${ \mathfrak { A } } \models t = { \overline { { \mathbb { I } } } } t { \overline { { \mathbb { I } } } } _ { \mathfrak { A } }$ , $\mathfrak { A } \models \varphi ( t ) \Leftrightarrow \varphi ( \overline { { \mathbb { I } \ v { t } \mathbb { J } } } _ { \mathfrak { V } } )$ . (We will also obtain this as a corollary to the Substitution Theorem, Corollary 3.5.9.)

7. Show that ${ \mathfrak { A } } \models \varphi \Rightarrow { \mathfrak { A } } \models \psi$ for all $\mathfrak { A }$ , implies $\models \varphi \Rightarrow \models \psi$ , but not vice versa.

# 3.5 Simple Properties of Predicate Logic

Our definition of validity (truth) was a straightforward extension of the valuation definition of propositional logic. As a consequence formulas which are instances of tautologies are true in all structures A (Exercise 1). So we can copy many results from Sects. 2.2 and 2.3. We will use these results with a simple reference to propositional logic.

The specific properties concerning quantifiers will be treated in this section. First we consider the generalizations of De Morgan’s laws.

# Theorem 3.5.1

$$
\begin{array} { r } { | \mathbf { - } \nabla \boldsymbol { x } \varphi  \exists \boldsymbol { x } \mathbf { - } \varphi ,  } \\ { | \mathbf { - } \mathbf { - } \exists \boldsymbol { x } \varphi  \forall \boldsymbol { x } \mathbf { - } \varphi ,  } \end{array}
$$

(iii) (iv) ${ \begin{array} { r } { | = \forall x \varphi  \neg \exists x \neg \varphi , } \\ { | = \exists x \varphi  \neg \forall x \neg \varphi . }  } \end{array} $

Proof If there are no free variables involved, then the above equivalences are almost trivial. We will do one general case.

(i) Let $F V ( \forall x \varphi ) = \{ z _ { 1 } , . . . , z _ { k } \}$ , then we must show $\mathfrak { A } \models \forall z _ { 1 } \dots z _ { k } ( \lnot \forall x \varphi ( x , z _ { 1 }$ , $\dots , z _ { k } )  \exists x { \neg } \varphi ( x , z _ { 1 } , \dots , z _ { k } ) )$ , for all $\mathfrak { A }$ . So we have to show $\mathfrak { A } \models \lnot \forall x \varphi ( x , \overline { { a } } _ { 1 } , \ldots , \overline { { a } } _ { k } ) \Leftrightarrow \exists x \lnot \varphi ( x , \overline { { a } } _ { 1 } , \ldots , \overline { { a } } _ { k } )$ for arbitrary $a _ { 1 } , \dots , a _ { k } \in | \mathfrak { A } |$ . We apply the properties of | as listed in Lemma 3.4.5: $\mathfrak { A } \ \models \lnot \forall x \varphi ( x , \overline { { a } } _ { 1 } , \ldots , \overline { { a } } _ { k } ) \ \Leftrightarrow \ \mathfrak { A } \ \models \ \forall x \varphi ( x , \overline { { a } } _ { 1 } , \ldots , \overline { { a } } _ { k } ) \ \Leftrightarrow$ not for all $b \in$ $| \mathfrak { A } | \mathfrak { A } | = \varphi ( \overline { { b } } , \overline { { a } } _ { 1 } , \dots , \overline { { a } } _ { k } ) \Leftrightarrow$ there is a $b \in \left| { \mathfrak { A } } \right|$ such that $\mathfrak { A } \models \lnot \varphi ( \overline { { b } } , \overline { { a } } _ { 1 } , \ldots , \overline { { a } } _ { k } )$ $\Leftrightarrow \mathfrak { A } \models \exists x \neg \varphi ( x , \overline { { a } } _ { 1 } , \dots , \overline { { a } } _ { k } )$ .   
(ii) is similarly dealt with,   
(iii) can be obtained from (i), (ii),   
(iv) can be obtained from (i), (ii).

The order of quantifiers of the same sort is irrelevant, and quantification over a variable that does not occur can be deleted.

# Theorem 3.5.2

$$
{ \begin{array} { r l } & { | = \forall x \forall y \varphi  \forall y \forall x \varphi ,  } \\ & { | = \exists x \exists y \varphi  \exists y \exists x \varphi ,  } \\ & { | = \forall x \varphi  \varphi i f x \notin F V ( \varphi ) ,  } \\ & { | = \exists x \varphi  \varphi i f x \notin F V ( \varphi ) .  } \end{array} }
$$

Proof Left to the reader.

We have already observed that $\forall$ and ∃ are, in a way, generalizations of $\wedge$ and $\vee$ . Therefore it is not surprising that $\forall$ (resp. ∃) distributes over ∧ (resp. ∨). $\forall$ (and ∃) distributes over $\vee$ (resp. ∧) only if a certain condition is met.

# Theorem 3.5.3

$$
\begin{array} { r l } & { \models \forall x ( \varphi \wedge \psi ) \Leftrightarrow \forall x \varphi \wedge \forall x \psi , } \\ & { \ v E \equiv \exists x ( \varphi \vee \psi ) \Leftrightarrow \exists x \varphi \vee \exists x \psi , } \\ & { \ v E \exists x ( \varphi ( x ) \vee \psi )  \forall x \varphi ( x ) \vee \psi i f x \notin F V ( \psi ) , } \\ & { \ v E \exists x ( \varphi ( x ) \wedge \psi ) \Leftrightarrow \exists x \varphi ( x ) \wedge \psi i f x \notin F V ( \psi ) . } \end{array}
$$

Proof (i) and (ii) are immediate.

(iii) Let $F V ( \forall x ( \varphi ( x ) \lor \psi ) ) = \{ z _ { 1 } , . . . , z _ { k } \}$ . We must show that $\mathfrak { A } \models \forall z _ { 1 } \dots z _ { k }$ $[ \forall x ( \varphi ( x ) \lor \psi )  \forall x \varphi ( x ) \lor \psi ]$ for all $\mathfrak { A }$ , so we show, using Lemma 3.4.5, that $\mathfrak { A } \mathbin { \vartriangle } \forall x [ \varphi ( x , \overline { { a } } _ { 1 } , \ldots , \overline { { a } } _ { k } ) \vee \psi ( \overline { { a } } _ { 1 } , \ldots , \overline { { a } } _ { k } ) ] \Leftrightarrow \mathfrak { A } \mathbin { \vline } \forall x \varphi ( x , \overline { { a } } _ { 1 } , \ldots , \overline { { a } } _ { k } ) \vee$ $\psi ( { \overline { { a } } } _ { 1 } , \dots , { \overline { { a } } } _ { k } )$ for all $\mathfrak { A }$ and all $a _ { 1 } , \dots , a _ { k } \in | { \mathfrak { A } } |$ .

Note that in the course of the argument $a _ { 1 } , \ldots , a _ { k }$ remain fixed, so in the future we will no longer write them down.

$\iff \colon \mathfrak { A } \Vdash \forall x \varphi ( x , \mathrm { ~ { ~ \small ~ \alpha ~ } ~ } ) \lor \psi ( \mathrm { ~ { ~ \small ~ \alpha ~ } ~ } ) \Leftrightarrow \mathfrak { A } \Vdash \forall x \varphi ( x , \mathrm { ~ { ~ \small ~ \alpha ~ } ~ } )$ or ${ \mathfrak { A } } \models \psi ( - \quad - \quad$ $\Leftrightarrow \mathfrak { A } \models \varphi ( \overline { { b } } , \overline { { \vline } } - \vline$ for all $b$ or ${ \mathfrak { A } } \models \psi ( - \quad - \quad )$ .   
If ${ \mathfrak { A } } \models \psi ( - \quad - \quad )$ , then also $\mathfrak { A } \triangleright \varphi ( \overline { { b } } , \longrightarrow ) \lor \psi ( \longrightarrow )$ for all $^ b$ , and so $\mathfrak { A } \models \forall x [ \varphi ( x , \xrightarrow { \quad } ) \lor \psi ( \overline { { \quad \quad } } ) ]$ . If for all $b \mathfrak { A } \models \varphi ( \overline { { b } } , \overline { { \vline } } - \vline$ then   
$\mathfrak { A } \vdash \varphi ( \overline { { b } } , \longrightarrow ) \lor \psi ( \longrightarrow )$ for all $^ b$ , so ${ \mathfrak { A } } \models \forall x ( \varphi ( x , { \xrightarrow { } } ) \lor \psi ( { \xrightarrow { } } ) )$ . In both cases we get the desired result.   
$\Rightarrow$ : We know that for each $b \in | \mathfrak { A } | \ \mathfrak { A } \left| = \varphi ( \overline { { b } } , \longrightarrow ) \lor \psi ( \overline { { \longrightarrow } } ) \right. .$ .   
If ${ \mathfrak { A } } \models \psi ( - \quad - \quad$ , then also ${ \mathfrak { A } } \models \forall x \varphi ( x , \longrightarrow ) \lor \psi ( \longrightarrow )$ , so we are done. If ${ \mathfrak { A } } \models \psi ( - \quad - )$ then necessarily ${ \mathfrak { A } } \models \varphi ( { \overline { { b } } } , { \overline { { - } } } )$ for all $b$ , so   
${ \mathfrak { A } } \models \forall x \varphi ( x , -$ and hence $\mathfrak { A } \models \forall x \varphi ( x , \mathrm { ~ \longrightarrow ~ } ) \lor \psi ( \mathrm { ~ \longrightarrow ~ } )$ .

(iv) is similar.

In the proof above we have demonstrated a technique for dealing with the extra free variables $z _ { 1 } , \ldots , z _ { k }$ , that do not play an actual role. One chooses an arbitrary string of elements $a _ { 1 } , \ldots , a _ { k }$ to substitute for the $z _ { i }$ ’s and keeps them fixed during the proof. So in the future we will mostly ignore the extra variables.

# WARNING

$\forall x ( \varphi ( x ) \lor \psi ( x ) )  \forall x \varphi ( x ) \lor \forall x \psi ( x )$ , and $\exists x \varphi ( x ) \land \exists x \psi ( x )  \exists x ( \varphi ( x ) \land \psi ( x ) )$ are not true.

One of the Cinderella tasks in logic is the bookkeeping of substitution, keeping track of things in iterated substitution, etc. We will provide a number of useful lemmas; none of them is difficult—it is a mere matter of clerical labor.

A word of advice to the reader: none of these syntactical facts is hard to prove, nor is there a great deal to be learned from the proofs (unless one is after very specific goals, such as complexity of certain predicates); the best procedure is to give the proofs directly and only to look at the proofs in the book in case of emergency.

# Lemma 3.5.4

(i) Let $x$ and $y$ be distinct variables such that $x \notin F V ( r )$ , then $( t [ s / x ] ) [ r / y ] =$ $( t [ r / y ] ) [ s [ r / y ] / x ] .$ ,   
(ii) Let $x$ and $y$ be distinct variables such that $x \notin F V ( s )$ and let $t$ and s be free for $x$ and $y$ in $\varphi$ , then $( \varphi [ t / x ] ) [ s / y ] = ( \varphi [ s / y ] ) [ t [ s / y ] / x ]$ ,   
(iii) Let ψ be free for $\$ 9$ in $\varphi$ , and let t be free for $x$ in $\varphi$ and $\psi$ , then $( \varphi [ \psi / \mathbb { S } ] ) [ t / x ] =$ $( \varphi [ t / x ] ) [ \psi [ t / x ] / \ S ] .$ ,   
(iv) Let $\varphi , \psi$ be free for $\$ 1$ , $\$ 2$ in $\sigma$ , let $\psi$ be free for $\$ 2$ in $\varphi$ , and let $\$ 1$ not occur in $\psi$ , then $( \sigma [ \varphi / \mathfrak { H } _ { 1 } ] ) [ \psi / \mathfrak { H } _ { 2 } ] = ( \sigma [ \psi / \mathfrak { H } _ { 2 } ] ) [ \varphi [ \psi / \mathfrak { H } _ { 2 } ] / \mathfrak { H } _ { 1 } ]$ .

Proof (i) Induction on $t$ .

： $t = c$ , trivial.   
• $t = x$ . Then $t [ s / x ] = s$ and $( t [ s / x ] ) [ r / y ] = s [ r / y ]$ ; (t[r/y])[s[r/y]/x] = $x [ s [ r / y ] / x ] = s [ r / y ]$ .

• $t = y$ . Then $( t [ s / x ] ) [ r / y ] = y [ r / y ] = r$ and $( t [ r / y ] ) [ s [ r / y ] / x ] = r ( s [ r / y ] / x ] =$ $r$ , since $x \notin F V ( r )$ .

• $t = z$ , where $z \neq x , y$ , trivial.

$$
\begin{array} { r c l } { { t } } & { { = } } & { { f ( t _ { 1 } , \ldots , t _ { n } ) , \mathrm { ~ T h e n ~ } ( t [ s / x ] ) [ r / y ] = ( f ( t _ { 1 } [ s / x ] , \ldots ) ) [ r / y ] = } } \\ { { } } & { { } } & { { f ( ( t _ { 1 } [ s / x ] ) [ r / y ] , \ldots ) \stackrel { \mathrm { i . h . } } { = } f ( ( t _ { 1 } [ r / y ] ) [ s [ r / y ] / x ] , \ldots ) = f ( t _ { 1 } [ r / y ] , \ldots ) [ s [ r / y ] , \ldots ] , } } \\ { { } } & { { } } & { { y ] / x ] = ( t [ r / y ] ) [ s [ r / y ] / x ] . ^ { 1 } } } \end{array}
$$

(ii) Induction on $\varphi$ . Left to the reader.   
(iii) Induction on $\varphi$ .

• $\varphi = \perp$ or $P$ distinct from $\$ 1$ . Trivial.

• $\varphi = \$ 8$ . Then $( \mathbb { S } [ \psi / \mathbb { S } ] ) [ t / x ] = \psi [ t / x ]$ and $( \ S [ t / x ] ) [ \psi [ t / x ] / \ S ] = \ S [ \psi [ t / x ] / \ S ] =$ $\psi [ t / x ]$ .

• $\varphi = \varphi _ { 1 } \bigsqcup \varphi _ { 2 }$ , $\neg \varphi _ { 1 }$ . Trivial.

• $\varphi = \forall y \varphi _ { 1 }$ . Then $( \forall y \cdot \varphi _ { 1 } [ \psi / \ S ] ) [ t / x ] = ( \forall y \cdot \varphi _ { 1 } [ \psi / \ S ] ) [ t / x ] = \forall y \cdot ( ( \varphi _ { 1 } [ \psi / \ S ] ) [ t$ $/ x ] ) \stackrel { 1 . \Pi } { = } \forall y ( ( \varphi _ { 1 } [ t / x ] ) [ \psi [ t / x ] / \ S ] ) = ( ( \forall y \varphi _ { 1 } ) [ t / x ] ) [ \psi [ t / x ] / \ S ] . \varphi = \exists y \varphi _ { 1 } . \mathrm { I d e m } .$

(iv) Induction on $\sigma$ . Left to the reader.

We immediately get the following corollary.

# Corollary 3.5.5

(i) If $z \not \in F V ( t )$ , then $t [ \overline { { { a } } } / x ] = ( t [ z / x ] ) [ \overline { { { a } } } / z ]$ , (ii) If $z \not \in F V ( \varphi )$ and z is free for $x$ in $\varphi$ , then $\varphi [ \overline { { { a } } } / x ] = ( \varphi [ z / x ] ) [ \overline { { { a } } } / z ] .$ .

It is possible to pull out quantifiers from a formula. The trick is well known in analysis: the bound variable in an integral may be changed, e.g. $\textstyle \int x d x +$ $\textstyle { \int \sin y d y } = \int x d x + \int \sin x d x = \int ( x + \sin x ) d x .$ In predicate logic we have a similar phenomenon.

Theorem 3.5.6 (Change of Bound Variables) $H x$ , y are free for $z$ in $\varphi$ and $x , y \notin$ $F V ( \varphi ) , t h e n  = \exists x \varphi [ x / z ]  \exists y \varphi [ y / z ] ,  = \forall x \varphi [ x / z ]  \forall y \varphi [ y / z ]$ .

Proof It suffices to consider $\varphi$ with $F V ( \varphi ) \subseteq \{ z \}$ . We have to show $\mathfrak { A } \models \exists x \varphi [ x / z ] \Leftrightarrow$ $\mathfrak { A } \models \exists \ v { y } { \varphi } [ \ v { y } / z ]$ for any $\mathfrak { A . 2 1 } \models \exists x \varphi [ x / z ] \Leftrightarrow \mathfrak { A } \models ( \varphi [ x / z ] ) [ \overline { { a } } / x ]$ for some $a \Leftrightarrow \mathfrak { A } | =$ $\varphi [ { \overline { { a } } } / z ]$ for some $a \Leftrightarrow \mathfrak { A } \models ( \varphi [ y / z ] ) [ \overline { { a } } / y ]$ for some $a \Leftrightarrow \mathfrak { A } \models \exists y \varphi [ y / z ]$ .

The universal quantifier is handled completely similarly.

The upshot of this theorem is that one can always replace a bound variable by a “fresh” one, i.e. one that did not occur in the formula. Now one easily concludes the following.

Corollary 3.5.7 Every formula is equivalent to one in which no variable occurs both free and bound.

We now can pull out quantifiers: $\forall x \varphi ( x ) \lor \forall x \psi ( x )  \forall x \varphi ( x ) \lor \forall y \psi ( y )$ and $\forall x \varphi ( x ) \lor \forall y \psi ( y )  \forall x y ( \varphi ( x ) \lor \psi ( y ) )$ , for a suitable $y$ .

In order to handle predicate logic in an algebraic way we need the technique of substituting equivalents for equivalents.

# Theorem 3.5.8 (Substitution Theorem)

$$
\begin{array} { r l } & { \models t _ { 1 } = t _ { 2 } \to s [ t _ { 1 } / x ] = s [ t _ { 2 } / x ] , } \\ & { \models t _ { 1 } = t _ { 2 } \to ( \varphi [ t _ { 1 } / x ]  \varphi [ t _ { 2 } / x ] ) , } \\ & { \vdash ( \varphi  \psi ) \to ( \sigma [ \varphi / \mathbb { S } ]  \sigma [ \psi / \mathbb { S } ] ) . } \end{array}
$$

Proof It is no restriction to assume that the terms and formulas are closed. We tacitly assume that the substitutions satisfy the “free for” conditions.

(i) Let $\mathfrak { A } \models t _ { 1 } = t _ { 2 }$ , i.e. $t _ { 1 } ^ { \mathfrak { A } } = t _ { 2 } ^ { \mathfrak { A } }$ . Now use induction on $s$

$s$ is a constant or a variable. Trivial.   
· $s = { \overline { { F } } } ( s _ { 1 } , \ldots , s _ { k } )$ . Then $s [ t _ { i } / x ] = \overline { { F } } ( s _ { 1 } [ t _ { i } / x ] , . . . )$ and $( s [ t _ { i } / x ] ) ^ { \mathfrak { A } } =$ $F ( ( s _ { 1 } [ t _ { i } ] ) ^ { \mathfrak { A } } / x , \ldots )$ . Induction hypothesis: $\left( s _ { j } [ t _ { 1 } / x ] \right) ^ { \mathfrak { A } } = \left( s _ { j } [ t _ { 2 } / x ] \right) ^ { \mathfrak { A } }$ , $1 \leq j \leq k$ . So $( s [ t _ { 1 } / x ] ) ^ { \mathfrak { A } } = F ( ( s _ { 1 } [ t _ { 1 } / x ] ) ^ { \mathfrak { A } } , \ldots ) = F ( ( s _ { 1 } [ t _ { 2 } / x ] ) ^ { \mathfrak { A } } , \ldots ) =$ $( s [ t _ { 2 } / x ] ) ^ { \mathfrak { A } }$ . Hence $\mathfrak { A } \models s [ t _ { 1 } / x ] = s [ t _ { 2 } / x ]$ .

(ii) Let $\mathfrak { A } \models t _ { 1 } = t _ { 2 }$ , so $t _ { 1 } ^ { \mathfrak { A } } = t _ { 2 } ^ { \mathfrak { A } }$ . We show $\mathfrak { A } \models \varphi [ t _ { 1 } / x ] \Leftrightarrow \mathfrak { A } \models \varphi [ t _ { 2 } / x ]$ by induction on $\varphi$ .

• $\varphi$ is atomic. The case of a propositional symbol (including $\perp$ ) is trivial. So consider $\varphi \ = \ { \overline { { P } } } ( s _ { 1 } , \ldots , s _ { k } )$ . $\mathfrak { A } \ \ v { S } \ v { S } \ V ( s _ { 1 } , \ldots , s _ { k } ) [ t _ { 1 } / x ] \ \Leftrightarrow \ \mathfrak { A } \ \ v { S } \ v { S } \ V$ $\overline { { P } } ( s _ { 1 } [ t _ { 1 } / x ] , \ldots ) \Leftrightarrow \langle ( s _ { 1 } [ t _ { 1 } / x ] ) ^ { \mathfrak { A } } , \ldots , ( s _ { k } [ t _ { 1 } / x ] ) ^ { \mathfrak { A } } \in P . \mathrm { B y ~ ( i ) }$ $( s _ { j } [ t _ { 1 } / x ] ) ^ { \mathfrak { A } } =$ $( s _ { j } [ t _ { 2 } / x ] ) ^ { \mathfrak { A } } , j = 1 , \dots , k$ . So we get $\langle ( s _ { 1 } [ t _ { 1 } / x ] ) ^ { \mathfrak { A } } , \ldots \rangle \in P \Leftrightarrow \cdots \Leftrightarrow \mathfrak { A } \vdash \overline { { P } } ( s _ { 1 } , \ldots ) [ t _ { 2 } / x ] .$   
• $\varphi = \varphi _ { 1 } \vee \varphi _ { 2 } , \varphi _ { 1 } \wedge \varphi _ { 2 } , \varphi _ { 1 }  \varphi _ { 2 } , \neg$ $\neg \varphi _ { 1 }$ . We consider the disjunction: ${ \mathfrak { A } } \vDash$ $( \varphi _ { 1 } \lor \varphi _ { 2 } ) [ t _ { 1 } / x ] \Leftrightarrow \mathfrak { A } \models \varphi _ { 1 } [ t _ { 1 } / x ]$ or $\mathfrak { A } \models \varphi _ { 2 } [ t _ { 1 } / x ] \stackrel { \mathrm { i } . \vartriangle } { \Leftarrow }$ h. . ${ \mathfrak { A } } \models \varphi _ { 1 } [ t _ { 2 } / x ]$ or ${ \mathfrak { A } } \vDash$ $\varphi _ { 2 } [ t _ { 2 } / x ] \Leftrightarrow \mathfrak { A } \models ( \varphi _ { 1 } \lor \varphi _ { 2 } ) [ t _ { 2 } / x ]$ . The remaining connectives are treated similarly.   
• $\varphi = \exists y \psi$ , $\varphi = \forall y \psi$ . We consider the existential quantifier. $\mathfrak { A } \ \models \ ( \exists y \psi ) [ t _ { 1 } / x ] \ \Leftrightarrow \ \mathfrak { A } \ \vDash$ $\exists y ( \psi [ t _ { 1 } / x ] ) \Leftrightarrow \mathfrak { A } \models \psi [ t _ { 1 } / x ] [ \overline { { a } } / y ]$ for some $a$ . By Lemma $3 . 5 . 4 \ { \mathfrak { A } } = \psi [ t _ { 1 } / x ] [ { \overline { { a } } } / y ] \Leftrightarrow { \mathfrak { A } } \models ( \psi [ { \overline { { a } } } / y ] ) [ t _ { 1 } [ { \overline { { a } } } / y ] / x ]$ . Apply the induction hypothesis to $\psi [ { \overline { { a } } } / y ]$ and the terms $t _ { 1 } [ \overline { { a } } / y ] , t _ { 2 } [ \overline { { a } } / y ]$ . Observe that $t _ { 1 }$ and $t _ { 2 }$ are closed, so $t _ { 1 } [ \overline { { a } } / y ] = t _ { 1 }$ and $t _ { 2 } = t _ { 2 } [ \overline { { a } } / y ]$ . We get ${ \mathfrak { A } } \vDash$ $\psi [ t _ { 2 } / x ] [ \overline { { a } } / y ]$ , and hence $\mathfrak { A } \models \exists y \psi [ t _ { 2 } / x ]$ . The other implication is similar, and so is the case of the universal quantifier.

(iii) Let ${ \mathfrak { A } } \models \varphi \Leftrightarrow { \mathfrak { A } } \models \psi$ . We show $\mathfrak { A } \models \sigma [ \varphi / \mathfrak { S } ] \Leftrightarrow \mathfrak { A } \models \sigma [ \psi / \mathfrak { S } ]$ by induction on $\sigma$ .

• $\sigma$ is atomic. Both cases $\sigma = \$ 5$ and $\sigma \neq \$ 8$ are trivial.   
• $\sigma = \sigma _ { 1 } \bigcirc \sigma _ { 2 }$ (or $\neg \sigma _ { 1 }$ ). Left to the reader.

• $\sigma = \forall x \cdot \tau$ . Observe that $\varphi$ and $\psi$ are closed, but even if they were not then $x$ could not occur free in $\varphi , \psi$ . $\mathfrak { A } \models ( \forall x \ \cdot \ \tau ) [ \varphi / \ S ] \Leftrightarrow \mathfrak { A } \models \forall x ( \tau [ \varphi / \ S ] )$ . Pick an $a \in \mathsf { \Gamma } | \mathfrak { A } |$ , then ${ \mathfrak { A } } \vDash$ $( \tau [ \varphi / \mathfrak { H } ] ) [ \overline { { a } } / x ] \overset { 3 , 5 , 4 } { \iff } \mathfrak { A } \vdash ( \tau [ \overline { { a } } / x ] ) [ \varphi [ \overline { { a } } / x ] / \mathfrak { H } ] \Leftrightarrow \mathfrak { A } \vdash ( \tau [ \overline { { a } } / x ] ) [ \varphi / \mathfrak { H } ] \overset { \scriptscriptstyle { \mathrm { i . h . } } } { \iff } \mathfrak { A } \vdash$ $\tau [ \overline { { { a } } } / x ] [ \psi / \mathfrak { H } ] \Leftrightarrow \mathfrak { A } \vdash \tau [ \overline { { { a } } } / x ] [ \psi [ \overline { { { a } } } / x ] / \mathfrak { H } ] \Leftrightarrow \mathfrak { A } \vdash ( \tau [ \psi / \mathfrak { H } ] ) [ \overline { { { a } } } / x ]$ . Hence $\mathfrak { A } \models \sigma [ \varphi / \mathfrak { S } ] \Leftrightarrow \mathfrak { A } \models \sigma [ \psi / \mathfrak { S } ]$ . The existential quantifier is treated similarly. �

Observe that in the above proof we have applied induction to $^ { * } \sigma [ \varphi / \mathbb { S } ]$ for all $\varphi ^ { , \dag }$ because the substitution formula changed during the quantifier case.

Note that also the $\sigma$ changed, so properly speaking we are applying induction to the rank (or we have to formulate the induction principle 3.3.4 a bit more liberally).

# Corollary 3.5.9

$$
{ \begin{array} { r l } & { { \mathbb { I } } s [ t / x ] ] = { \mathbb { I } } s [ { \overline { { \mathbb { I } } } } t [ [ x ] ] ] , } \\ & { { \mathbb { I } } \varphi [ t / x ] ] = { \mathbb { I } } \varphi [ ] [ t [ [ x ] ] ] . } \end{array} }
$$

Proof We apply the Substitution Theorem. Consider an arbitrary $\mathfrak { A }$ . Note that $\mathbb { T } \overline { { \mathbb { I } t \mathbb { I } } } \mathbb { I } = \mathbb { I } t \mathbb { I }$ (by definition), so $\mathfrak { A } \models \overline { { \mathbb { I } t \mathbb { I } } } = t$ . Now (i) and (ii) follow immediately. �

In a more relaxed notation, we can write (i) and (ii) as $\mathbb { [ } s ( t ) ] = \mathbb { [ } s ( \overline { { \mathbb { [ } t ] } } ) \mathbb { I }$ , or ${ \mathfrak { A } } \vDash$ $s ( t ) = s ( \overline { { \left[ t \right] } } )$ and $\mathbb { [ } \varphi ( t ) ] = \mathbb { [ } \varphi ( { \overline { { \mathbb { [ } t ] } } } ) ]$ , or $\mathfrak { U } \models \varphi ( t )  \varphi ( \overline { { \mathbb { [ } t ] } } )$ .

Observe that $[ [ t ] ] ( = [ [ t ] ] \mathfrak { A } )$ is just another way to write $t ^ { \mathfrak { A } }$ .

Proofs involving detailed analysis of substitution are rather dreary but, unfortunately, unavoidable. The reader may simplify the above and other proofs by supposing the formulas involved to be closed. There is no real loss in generality, since we only introduce a number of constants from $L ( { \mathfrak { A } } )$ and check that the result is valid for all choices of constants.

Now we really can manipulate formulas in an algebraic way. Again, write $\varphi \approx \psi$ $\mathrm { f o r } \models \varphi \Leftrightarrow \psi$ .

# Examples

1. $\forall x \varphi ( x )  \psi \approx ~ \lnot \forall x \varphi ( x ) \lor \psi \approx ~ \exists x ( \lnot \varphi ( x ) ) \lor \psi \approx ~ \exists x ( \lnot \varphi ( x ) \lor \psi ) \approx$ $\exists x ( \varphi ( x )  \psi )$ , where $x \notin F V ( \psi )$ .   
2. $\forall x \varphi ( x )  \exists x \varphi ( x ) \approx \neg \forall x \varphi ( x ) \lor \exists x \varphi ( x ) \approx \exists x ( \neg \varphi ( x ) \lor \varphi ( x ) )$ . The formula in the scope of the quantifier is true (already by propositional logic), so the formula itself is true.

Definition 3.5.10 A formula $\varphi$ is in prenex (normal) form if $\varphi$ consists of a (possibly empty) string of quantifiers followed by an open (i.e. quantifier free) formula. We also say that $\varphi$ is a prenex formula.

Examples $\exists x \forall y \exists z \exists v ( x = z \lor y = z  v < y ) , \forall x \forall y \exists z ( P ( x , y ) \land Q ( y , x ) $ $P ( z , z ) )$ .

By pulling out quantifiers we can reduce each formula to a formula in prenex form.

Theorem 3.5.11 For each $\varphi$ there is a prenex formula $\psi$ such that $\models \varphi  \psi$ .

Proof First eliminate and . Use induction on the resulting formula $\varphi ^ { \prime }$ .

For atomic $\varphi ^ { \prime }$ the theorem is trivial. If $\varphi ^ { \prime } = \varphi _ { 1 } \vee \varphi _ { 2 }$ and $\varphi _ { 1 } , \varphi _ { 2 }$ are equivalent to prenex $\psi _ { 1 } , \psi _ { 2 }$ then

$$
\begin{array} { r } { \psi _ { 1 } = ( Q _ { 1 } y _ { 1 } ) \cdot \cdot \cdot ( Q _ { n } y _ { n } ) \psi ^ { 1 } , } \\ { \psi _ { 2 } = ( Q _ { 1 } ^ { \prime } z _ { 1 } ) \cdot \cdot \cdot ( Q _ { m } ^ { \prime } z _ { m } ) \psi ^ { 2 } , } \end{array}
$$

where $Q _ { i } , Q _ { j } ^ { \prime } .$ are quantifiers and $\psi ^ { 1 } , \psi ^ { 2 }$ open. By Theorem 3.5.6 we can choose all bound variables distinct, taking care that no variable is both free and bound. Applying Theorem 3.5.3 we find

$$
\ J \ J \varphi ^ { \prime }  ( Q _ { 1 } y _ { 1 } ) \cdot \cdot \cdot ( Q _ { n } y _ { n } ) \big ( Q _ { 1 } ^ { \prime } z _ { 1 } \big ) \cdot \cdot \cdot \big ( Q _ { m } ^ { \prime } z _ { m } \big ) \big ( \psi ^ { 1 } \vee \psi ^ { 2 } \big ) ,
$$

so we are done.

The remaining cases are left to the reader.

In ordinary mathematics it is usually taken for granted that the benevolent reader can guess the intentions of the author, not only the explicit ones, but also the ones that are tacitly handed down generations of mathematicians. Take for example the definition of convergence of a sequence: $\forall \mathcal { E } > 0 \exists n \forall m ( | a _ { n } - a _ { n + m } | < \varepsilon )$ . In order to make sense out of this expression one has to add: the variables $n$ , m range over natural numbers. Unfortunately our syntax does not allow for variables of different sorts. So how do we incorporate expressions of the above kind? The answer is simple: we add predicates of the desired sort and indicate inside the formula the “nature” of the variable.

Example Let $\mathfrak { A } = \langle R , Q , < \rangle$ be the structure of the reals with the set of rational numbers singled out, provided with the natural order. The sentence $\sigma : = \forall x y ( x <$ $y \to \exists z ( Q ( z ) \land x < z \land z < y )$ ) can be interpreted in ${ \mathfrak { A } } : { \mathfrak { A } } \models \sigma$ , and it tells us that the rationals are dense in the reals (in the natural ordering). We find this mode of expression, however, rather cumbersome. Therefore we introduce the notion of relativized quantifiers. Since it does not matter whether we express informally $^ { 6 6 } x$ is rational” by $x \in Q$ or $Q ( x )$ , we will suit ourselves and at any time choose the notation which is most convenient. We use $( \exists x \in Q )$ and $( \forall x \in Q )$ as informal notation for “there exists an $x$ in $\boldsymbol { Q } ^ { \prime \prime }$ and “for all $x$ in $\boldsymbol { Q } ^ { \prime \prime }$ . Now we can write $\sigma$ as $\forall x y ( x < y \to \exists z \in Q ( x < z \land z < y )$ ). Note that we do not write $( \forall x y \in R ) ( { \overline { { \qquad } } } )$ , since: (1) there is no relation $R$ in $\mathfrak { A }$ , (2) variables automatically range over $| { \mathfrak { A } } | = R$ .

Let us now define the relativization of a quantifier properly.

Definition 3.5.12 If $P$ is a unary predicate symbol, then $( \forall x \in P ) \varphi : =$ $\forall x ( P ( x )  \varphi )$ , $( \exists x \in P ) \varphi : = ( \exists x ) ( P ( x ) \land \varphi )$ .

This notation has the intended meaning, as appears from $\mathfrak { A } \models ( \forall x \in P ) \varphi \Leftrightarrow$ for all $a \in P ^ { \mathfrak { A } } \mathfrak { A } \models \varphi [ \overline { { a } } / x ]$ , $\mathfrak { A } \models ( \exists x \in P ) \varphi \Leftrightarrow$ there exists an $a \in P ^ { \mathfrak { A } }$ such that $\mathfrak { A } \models \varphi [ \overline { { a } } / x ]$ . The proof is immediate.

We will often use informal notation, such as $( \forall x > 0 )$ or $( \exists y \neq 1 )$ ), which can be cast into the above form. The meaning of such notation will always be evident. One can restrict all quantifiers to the same set (predicate), which amounts to passing to a restricted universe (cf. Exercise 11).

It is a common observation that by strengthening a part of a conjunction (disjunction) the whole formula is strengthened, but that by strengthening $\varphi$ in $\neg \varphi$ the whole formula is weakened. This phenomenon has a syntactic origin, and we will introduce a bit of terminology to handle it smoothly. We inductively define that a subformula occurrence $\varphi$ is positive (negative) in $\sigma$ .

Definition 3.5.13 $S u b ^ { + }$ and $S u b ^ { - }$ are defined simultaneously by

$$
\begin{array} { r l } & { S u b ^ { + } ( \varphi ) = \{ \varphi \} } \\ & { S u b ^ { - } ( \varphi ) = \emptyset \mathrm { ~ f o r ~ a t o m i c ~ } \varphi } \\ & { S u b ^ { + } ( \varphi _ { 1 } \boxtimes \varphi _ { 2 } ) = S u b ^ { + } ( \varphi _ { 1 } ) \cup S u b ^ { + } ( \varphi _ { 2 } ) \cup \{ \varphi _ { 1 } \boxtimes \varphi _ { 2 } \} } \\ & { S u b ^ { - } ( \varphi _ { 1 } \boxtimes \varphi _ { 2 } ) = S u b ^ { - } ( \varphi _ { 1 } ) \cup S u b ^ { - } ( \varphi _ { 2 } ) \quad \mathrm { f o r ~ } \Pi \in \{ \land , \forall \} } \\ & { S u b ^ { + } ( \varphi _ { 1 }  \varphi _ { 2 } ) = S u b ^ { + } ( \varphi _ { 2 } ) \cup S u b ^ { - } ( \varphi _ { 1 } ) \cup \{ \varphi _ { 1 }  \varphi _ { 2 } \} } \\ & { S u b ^ { - } ( \varphi _ { 1 }  \varphi _ { 2 } ) = S u b ^ { + } ( \varphi _ { 1 } ) \cup S u b ^ { - } ( \varphi _ { 2 } ) } \\ & { S u b ^ { + } ( Q x , \varphi ) = S u b ^ { + } ( \varphi ) \cup \{ Q x \cdot \varphi \} } \\ & { S u b ^ { - } ( Q x , \varphi ) = S u b ^ { - } ( \varphi ) \quad \mathrm { f o r ~ } Q \in \{ \forall , \exists \} . } \end{array}
$$

If $\varphi \in S u b ^ { + } ( \psi )$ , then we say that $\varphi$ occurs positively in $\psi$ (similarly for negative occurrences).

We could have restricted ourselves to $\land , $ and $\forall$ , but it does not ask much extra space to handle the other connectives.

The following theorem makes the basic intuition clear: if a positive part of a formula increases in truth value then the formula increases in truth value (better: does not decrease in truth value). We express this role of positive and negative subformulas as follows.

Theorem 3.5.14 Let $\varphi \ ( \psi )$ not occur negatively (not positively) in $\sigma$ , then:

(i) $\begin{array} { r } { \left[ \varphi _ { 1 } \right] \leq \left[ \varphi _ { 2 } \right] \Rightarrow \left[ \sigma \left[ \varphi _ { 1 } / \varphi \right] \right] \leq \left[ \sigma \left[ \varphi _ { 2 } / \varphi \right] \right] , } \end{array}$ (ii) $[ [ \psi _ { 1 } ] ] \leq [ [ \psi _ { 2 } ] ] \Rightarrow [ [ \sigma [ \psi _ { 1 } / \psi ] ] ] \geq [ [ \sigma [ \psi _ { 2 } / \psi ] ]$ , (iii) $\mathfrak { A } \models ( \varphi _ { 1 } \to \varphi _ { 2 } ) \to ( \sigma [ \varphi _ { 1 } / \varphi ] \to \sigma [ \varphi _ { 2 } / \varphi ] )$ ), (iv) $\mathfrak { A } \models ( \psi _ { 1 } \to \psi _ { 2 } ) \to ( \sigma [ \psi _ { 2 } / \psi ] \to \sigma [ \psi _ { 1 } / \psi ] ) .$

Proof Induction on $\sigma$ .

# Exercises

1. Show that all propositional tautologies are true in all structures (of the right similarity type).

2. Let $x \notin F V ( \psi )$ . Show

$$
\begin{array} { r l } & { \mathop { \mathop { \mathop { \sum } } } ( \forall x \varphi \to \psi )  \exists x ( \varphi \to \psi ) , } \\ & { \mathop { \mathop { \sum } } ( \exists x \varphi \to \psi )  \forall x ( \varphi \to \psi ) , } \\ & { \mathop { \mathop { \sum } } ( \psi \to \exists x \varphi )  \exists x ( \psi \to \varphi ) , } \\ & { \mathop { \mathop { = } } ( \psi \to \forall x \varphi )  \forall x ( \psi \to \varphi ) . } \end{array}
$$

3. Show that the condition on $F V ( \psi )$ in Exercise 2 is necessary.

4. Show $\forall x \exists y \varphi \Leftrightarrow \exists y \forall x \varphi$ .

5. Show $\models \varphi \Rightarrow \models \forall x \varphi$ and ${ \big [ } = { \exists x } \varphi$ .

6. Show $\nvDash \exists x \varphi \to \forall x \varphi$

7. Show $\neq \exists x \varphi \land \exists x \psi  \exists x ( \varphi \land \psi )$ .

8. Show that the condition on $x , y$ in Theorem 3.5.6 is necessary.

9. Show

$$
{ \begin{array} { r l } & { = \forall x ( \varphi  \psi )  ( \forall x \varphi  \forall x \psi ) ; } \\ & { = ( \exists x \varphi  \exists x \psi )  \exists x ( \varphi  \psi ) ; } \\ & { = \forall x ( \varphi  \psi )  ( \forall x \varphi  \forall x \psi ) ; } \\ & { = ( \forall x \varphi  \exists x \psi )  \exists x ( \varphi  \psi ) ; } \\ & { = ( \exists x \varphi  \forall x \psi )  \forall x ( \varphi  \psi ) . } \end{array} }
$$

10. Show that the converses of Exercises 9 (i)–(iii) and (v) do not hold.

11. Let $L$ have a unary predicate $P$ . Define the relativization $\sigma ^ { P }$ of $\sigma$ by

$$
\begin{array} { r l r } & { } & { { \sigma ^ { P } } : = \sigma \quad \mathrm { f o r ~ a t o m i c } \ : \varphi , } \\ & { } & { ( \varphi \sqcap \psi ) ^ { P } : = \varphi ^ { P } \bigtriangledown \psi ^ { P } , } \\ & { } & { ( \neg \varphi ) ^ { P } : = \neg \varphi ^ { P } , } \\ & { } & { ( \forall x \varphi ) ^ { P } : = \forall x \big ( P ( x ) \to \varphi ^ { P } \big ) , } \\ & { } & { ( \exists x \varphi ) ^ { P } : = \exists x \big ( P ( x ) \land \varphi ^ { P } \big ) . } \end{array}
$$

Let $\mathfrak { A }$ be a structure without functions and constants. Consider the structure $\mathfrak { B }$ with universe $P ^ { \mathfrak { A } }$ and relations which are restrictions of the relations of $\mathfrak { A }$ , where $P ^ { \mathfrak { A } } \neq \emptyset$ . Show $\mathfrak { U } \models \sigma ^ { P } \Leftrightarrow \mathfrak { B } \models \sigma$ for sentences $\sigma$ . Why are only relations allowed in $\mathfrak { A }$ ?

12. Let $S$ be a binary predicate symbol. Show $\mathbf { \Phi } ^ { \prime }  = \lnot \exists y \forall x ( S ( y , x )  \lnot S ( x , x ) )$ . (Think of $^ { 6 6 } y$ shaves $x '$ and recall Russell’s barber paradox.)

13. (i) Show that the “free for” conditions cannot be dropped from Theorem 3.5.8. (ii) $\mathrm { S h o w } \Vdash t = s \Rightarrow \models \varphi [ t / x ]  \varphi [ s / x ]$ . (iii) $\mathrm { 3 h o w } \Vdash \varphi  \psi \Rightarrow \vdash \sigma [ \varphi / \ S ]  \sigma [ \psi / \ S ]$ .

14. Find prenex normal forms for (a) $\lnot ( ( \lnot \forall x \varphi ( x ) \lor \forall x \psi ( x ) ) \land ( \exists x \sigma ( x ) \to \forall x \tau ( x ) ) ) ,$ (b) $\forall x \varphi ( x )  \exists x \psi ( x )$ , (c) $\lnot ( \exists x \varphi ( x , y ) \land ( \forall y \psi ( y )  \varphi ( x . x ) )  \exists x \forall y \sigma ( x , y ) ) ,$ (d) $( ( \forall x \varphi ( x )  \exists y \psi ( x , y ) )  \psi ( x , x ) )  \exists x \forall y \sigma ( x , y ) .$

15. Show $\mathbf { \Phi } ^ { \prime } | = \exists x ( \varphi ( x )  \forall y \varphi ( y ) ) $ . (It is instructive to think of $\varphi ( x )$ as “ $x$ drinks”.)

# 3.6 Identity

We have limited ourselves in this book to the consideration of structures with identity (see Definition 3.4.2), and hence of languages with identity. Therefore we classified $^ { 6 6 } = ^ { 9 9 }$ as a logical symbol, rather than a mathematical one. We can, however, not treat $=$ as just some binary predicate, since identity satisfies a number of characteristic axioms, listed below.

$$
\begin{array} { r l } { I _ { 1 } } & { \forall x ( x = x ) , } \\ { I _ { 2 } } & { \forall x y ( x = y  y = x ) , } \\ { I _ { 3 } } & { \forall x y z ( x = y \land y = z  x = z ) , } \\ { I _ { 4 } } & { \forall x _ { 1 } \dots x _ { n } y _ { 1 } \dots y _ { n } ( \bigwedge _ { i \leq n } x _ { i } = y _ { i }  t ( x _ { 1 } , \dots , x _ { n } ) = t ( y _ { 1 } , \dots , y _ { n } ) ) , } \\ & { \forall x _ { 1 } \dots x _ { n } y _ { 1 } \dots y _ { n } ( \bigwedge _ { i \leq n } x _ { i } = y _ { i }  ( \varphi ( x _ { 1 } , \dots , x _ { n } )  \varphi ( y _ { 1 } , \dots , y _ { n } ) ) ) . } \end{array}
$$

One simply checks that $I _ { 1 } , I _ { 2 } , I _ { 3 }$ are true in all structures $\mathfrak { A }$ . For $I _ { 4 }$ , observe that we can suppose the formulas to be closed. Otherwise we add quantifiers for the remaining variables and add dummy identities, e.g. $\forall z _ { 1 } \ldots z _ { k } x _ { 1 } \ldots x _ { n } y _ { 1 } \ldots y _ { n }$ $( { \textstyle \bigwedge } _ { i \leq n } x _ { i } \ = \ y _ { i } \ \wedge \ { \textstyle \bigwedge } _ { i \leq k } z _ { i } \ = \ z _ { i } \ \to \ t ( x _ { 1 } , \dots , x _ { n } ) \ = \ t ( y _ { 1 } , \dots , y _ { n } ) )$ . Now $( t ( \overline { { a } } _ { 1 } , \ldots , \overline { { a } } _ { n } ) ) ^ { \mathfrak { A } }$ defines a function $t ^ { \mathfrak { A } }$ on $| \mathfrak { A } | ^ { n }$ , obtained from the given functions of $\mathfrak { A }$ by various substitutions, hence $a _ { i } = b _ { i } ( i \leq n ) \Rightarrow ( t ( { \overline { { a } } } _ { 1 } , \ldots , { \overline { { a } } } _ { n } ) ) ^ { \mathfrak { A } } =$ $( t ( \overline { { b } } _ { 1 } , \ldots , \overline { { b } } _ { n } ) ) ^ { \mathfrak { A } }$ . This establishes the first part of $I _ { 4 }$ .

The second part is proved by induction on $\varphi$ (using the first part): e.g. consider the universal quantifier case and let $a _ { i } = b _ { i }$ for all $i \leq n . \ \mathfrak { A } \models \forall u \varphi ( u , \overline { { a } } _ { 1 } , \dots , \overline { { a } } _ { n } ) \ \Leftrightarrow$ $\mathfrak { A } \models \varphi ( \overline { { c } } , \overline { { a } } _ { 1 } , \dots , \overline { { a } } _ { n } )$ for all $c$ i.h. ⇔ ${ \mathfrak { A } } \models \varphi ( { \overline { { c } } } , { \overline { { b } } } _ { 1 } , \dots , { \overline { { b } } } _ { n } )$ for all $c \Leftrightarrow \mathfrak { A } \mid =$ $\forall u \varphi ( u , \overline { { b } } _ { 1 } , \ldots , \overline { { b } } _ { n } )$ . So $\mathfrak { A } \ \ v { = } \ ( \bigwedge _ { i \leq n } \overline { { a } } _ { i } = \overline { { b } } _ { i } ) \Rightarrow \mathfrak { A } \ v { = } \ \forall u \varphi ( u , \overline { { a } } _ { 1 } , \ldots , \overline { { a } } _ { n } ) \ \to$ $\forall u \varphi ( u , \overline { { b } } _ { 1 } , . . . \overline { { b } } _ { n } )$ . This holds for all $a _ { 1 } , \ldots , a _ { n }$ , $b _ { 1 } , \ldots , b _ { n }$ , hence ${ \mathfrak { A } } \vDash$ $\begin{array} { r } { \big / x _ { 1 } , \dots x _ { n } y _ { 1 } \dots y _ { n } ( \bigwedge _ { i \leq n } x _ { i } = y _ { i } \to ( \forall u \varphi ( u , x _ { 1 } , \dots , x _ { n } ) \to \forall u \varphi ( u , y _ { 1 } , \dots , y _ { n } ) ) ) } \end{array}$ .

Note that $\varphi$ (respectively $t$ ) in $I _ { 4 }$ can be any formula (respectively term), so $I _ { 4 }$ stands for infinitely many axioms. We call such an “instant axiom” an axiom schema.

The first three axioms state that identity is an equivalence relation. $I _ { 4 }$ states that identity is a congruence with respect to all (definable) relations.

It is important to realize that from the axioms alone, we cannot determine the precise nature of the interpreting relation. We explicitly adopt the convention that $^ { 6 6 } = ^ { 9 9 }$ will always be interpreted by real equality. Inequality, $\neg x = y$ , is abbreviated as $x \neq y$ .

# Exercises

1. $\operatorname { S h o w } \left[ = \forall x \exists y ( x = y ) \right.$ .   
2. Sho $\begin{array} { r } { \mathrm { v }  = \forall x ( \varphi ( x )  \exists y ( x = y \land \varphi ( y ) ) ) \mathrm { a n d }  = \forall x ( \varphi ( x )  \forall y ( x = y  \varphi ( y ) ) ) ,  } \end{array}$ where $y$ does not occur in $\varphi ( x )$ .   
3. Show that $\left| = \varphi ( t ) \left. \forall x ( x = t \right. \varphi ( x ) ) \right.$ if $x \notin F V ( t )$ .   
4. Show that the conditions in Exercises 2 and 3 are necessary.   
5. Consider $\sigma _ { 1 } = \forall x ( x \sim x )$ , $\sigma _ { 2 } = \forall x y ( x \sim y  y \sim x )$ , $\sigma _ { 3 } = \forall x y z ( x \sim y \land y \sim$ $z  x \sim z ,$ ). Show that if ${ \mathfrak { A } } \models \sigma _ { 1 } \land \sigma _ { 2 } \land \sigma _ { 3 }$ , where ${ \mathfrak { A } } = \langle A , R \rangle$ , then $R$ is an equivalence relation. N.B. $x \sim y$ is a suggestive notation for the atom $\overline { { R } } ( x , y )$ .

6. Let $\sigma _ { 4 } = \forall x y z ( x \sim y \land x \sim z  y \sim z )$ ). Show that $\sigma _ { 1 }$ , $\sigma _ { 4 } \Vdash \sigma _ { 2 } \land \sigma _ { 3 }$

7. Consider the schema $\sigma _ { 5 } : x \sim y  ( \varphi [ x / z ]  \varphi [ y / z ] )$ . Show that $\sigma _ { 1 } , \sigma _ { 5 } \vdash $ $\sigma _ { 2 } \land \sigma _ { 3 }$ . N.B. If $\sigma$ is a schema, then $\Delta \cup \{ \sigma \} \vdash \varphi$ stands for $\Delta \cup \Sigma \vdash \varphi$ , where $\varSigma$ consists of all instances of $\sigma$ .

8. Derive the term version of $I _ { 4 }$ from the formula version.

# 3.7 Examples

We will consider languages for some familiar kinds of structures. Since all languages are built in the same way, we shall not list the logical symbols. All structures are supposed to satisfy the identity axioms $I _ { 1 } - I _ { 4 }$ .

For a refinement see Lemma 3.10.2.

1. The language of identity. Type: $\langle - ; - ; 0 \rangle$ .

Alphabet. Predicate symbol: $=$

The structures of this type are of the form ${ \mathfrak { A } } = \langle A \rangle$ , and satisfy $I _ { 1 } , I _ { 2 } , I _ { 3 }$ . (In this language $I _ { 4 }$ follows from $I _ { 1 } , I _ { 2 } , I _ { 3 }$ , cf. Sect. 3.10 Exercise 5.)

In an identity structure there is so little “structure”, that all one can virtually do is look for the number of elements (cardinality). There are sentences $\lambda _ { n }$ and $\mu _ { n }$ saying that there are at least (or at most) $n$ elements (Exercise 3, Sect. 4.1)

$$
\begin{array} { l } { { \lambda _ { n } : = \exists y _ { 1 } \dots y _ { n } \bigwedge _ { i \neq j } y _ { i } \not = y _ { j } \quad ( n > 1 ) , } } \\ { { \qquad } } \\ { { \mu _ { n } : = \forall y _ { 0 } \dots y _ { n } \bigvee \bigvee _ { i } y _ { i } = y _ { j } \quad ( n > 0 ) . } } \end{array}
$$

So ${ \mathfrak { A } } \models \lambda _ { n } \wedge \mu _ { n }$ iff $| \mathfrak { A } |$ has exactly $n$ elements. Since universes are not empty | $\exists x ( x = x )$ always holds.

We can also formulate “there exists a unique $x$ such that . . .”.

Definition 3.7.1 $\exists ! x \varphi ( x ) : = \exists x ( \varphi ( x ) \land \forall y ( \varphi ( y )  x = y )$ ), where $y$ does not occur in $\varphi ( x )$ .

Note that $\exists ! x \varphi ( x )$ is an (informal) abbreviation.

2. The language of partial order. Type: $\langle 2 ; - ; 0 \rangle$ .

Alphabet.

Predicate symbols: $= , \leq$

Abbreviations

$$
\begin{array} { r l r l } & { x \neq y : = \neg x = y , } & & { x < y : = x \leq y \land x \neq y , } \\ & { x > y : = y < x , } & & { x \geq y : = y \leq x , } \\ & { x \leq y \leq z : = x \leq y \land y \leq z . } \end{array}
$$

Definition 3.7.2 $\mathfrak { A }$ is a partially ordered set (poset) if $\mathfrak { A }$ is a model of

$$
\begin{array} { r l } & { \forall x y z ( x \le y \le z \to x \le z ) , } \\ & { } \\ & { \forall x y ( x \le y \le x  x = y ) . } \end{array}
$$

The notation may be misleading, since one usually introduces the relation $\leq$ (e.g. on the reals) as a disjunction: $x < y$ or $x = y$ . In our alphabet the relation is primitive; another symbol might have been preferable, but we chose to observe the tradition. Note that the relation is reflexive: $x \leq x$ .

Partially ordered sets are very basic in mathematics, appearing in many guises. It is often convenient to visualize posets by means of diagrams, where $a \leq b$ is represented as equal or above (respectively to the right). One of the traditions in logic is to keep objects and their names apart. Thus we speak of function symbols which are interpreted as functions, etc. However, in practice this is a bit cumbersome. We prefer to use the same notation for the syntactic objects and their interpretations, e.g. if $\Re = \langle \mathbb { R } , \leq \rangle$ is the partially ordered set of reals, then $\Re \left[ = \forall x \exists y ( x \leq y ) \right]$ , whereas it should be something like $\forall x \exists y ( x { \overline { { \leq } } } y )$ to distinguish the symbol from the relation.

The $\stackrel { 6 6 } { \mathop { \leq } } \underline { { \vec { \ : } } } \stackrel { , , }$ in $\Re$ stands for the actual relation and the $\stackrel { 6 6 } { \mathop { \leq } } \underline { { \vec { \ : } } } \stackrel { , , }$ in the sentence stands for the predicate symbol. The reader is urged to distinguish symbols in their various guises.

We show some diagrams of posets.

![](images/1ed098ac10a44649f25ff8a77031f4b40b1a4570f1f1fd4ee410ede2065ba661.jpg)

From the diagrams we can easily read off a number of properties. For example, $\mathfrak { A } _ { 1 } \models \exists x \forall y ( x \leq y )$ ${ \mathfrak { A } } _ { i }$ is the structure with the diagram of Fig. I), i.e. ${ \mathfrak { A } } _ { 1 }$ has a least element (a minimum). $\mathfrak { A } _ { 3 } \vdash \forall x \lnot \exists y ( x < y )$ , i.e. in ${ \mathfrak { A } } _ { 3 }$ no element is strictly less than another element.

# Definition 3.7.3

(i) $\mathfrak { A }$ is a (linearly or totally) ordered set if it is a poset and $\mathfrak { A } \models \forall x y ( x \leq y \lor y \leq$ $x$ ) (each two elements are comparable).   
(ii) $\mathfrak { A }$ is densely ordered if $\mathfrak { A } \models \forall x y ( x < y \to \exists z ( x < z \land z < y ) )$ ) (between any two elements there is a third one).

It is a moderately amusing exercise to find sentences that distinguish between structures and vice versa. For example, we can distinguish ${ \mathfrak { A } } _ { 3 }$ and ${ \mathfrak { A } } _ { 4 }$ (from the diagram above) as follows: in ${ \mathfrak { A } } _ { 4 }$ there is precisely one element that is incomparable with all other elements, in ${ \mathfrak { A } } _ { 3 }$ there are more such elements. Put $\sigma ( x ) : =$ $\forall y ( y \neq x \to \lnot y \leq x \land \lnot x \leq y )$ . Then ${ \mathfrak { A } } _ { 4 } \models \forall x y ( \sigma ( x ) \land \sigma ( y ) \to x = y )$ ), but ${ \mathfrak { A } } _ { 3 } \models \lnot \forall x y ( \sigma ( x ) \land \sigma ( y ) \to x = y )$ .

3. The language of groups. Type: $\langle - ; 2 , 1 ; 1 \rangle$ .

Alphabet. Predicate symbol: $=$ Function symbols: ·, $^ { - 1 }$ Constant symbol: $e$

Notation In order to conform with practice we write $t \cdot s$ and $t ^ { - 1 }$ instead of · $( t , s )$ and $^ { - 1 } ( t )$ .

Definition 3.7.4 $\mathfrak { A }$ is a group if it is a model of

$$
\begin{array} { r l } & { \forall x y z ( ( x \cdot y ) \cdot z = x \cdot ( y \cdot z ) ) , } \\ & { \forall x ( x \cdot e = x \wedge e \cdot x = x ) , } \\ & { \forall x ( x \cdot x ^ { - 1 } = e \wedge x ^ { - 1 } \cdot x = e ) . } \end{array}
$$

When convenient, we will write $t s$ for $t \cdot s$ ; we will adopt the bracket conventions from algebra. A group $\mathfrak { A }$ is commutative or abelian if ${ \mathfrak { A } } \models \forall x y ( x y = y x )$ .

Commutative groups are often described in the language of additive groups, which have the following alphabet:

Predicate symbol: $=$ Function symbols: $+$ , − Constant symbol: 0

# 4. The language of plane projective geometry. Type: $\langle 2 ; - ; 0 \rangle$

The structures one considers are projective planes, which are usually taken to consist of points and lines with an incidence relation. In this approach the type would be $\langle 1 , 1 , 2 ; - ; 0 \rangle$ . We can, however, use a more simple type, since a point can be defined as something that is incident with a line, and a line as something for which we can find a point which is incident with it. Of course this requires a non-symmetric incidence relation.

We will now list the axioms, which deviate somewhat from the traditional set. It is a simple exercise to show that the system is equivalent to the standard sets.

Alphabet. Predicate symbols: $I , =$

We introduce the following abbreviations:

$$
\begin{array} { r } { \Pi ( x ) : = \exists y ( x I y ) , \qquad \ A ( y ) : = \exists x ( x I y ) . } \end{array}
$$

Definition 3.7.5 $\mathfrak { A }$ is a projective plane if it satisfies

$$
\begin{array} { r l } & { \gamma _ { 0 } : \forall x ( \boldsymbol { \pi } ( x )  \neg { A } ( x ) ) , } \\ & { \gamma _ { 1 } : \forall x y ( \boldsymbol { \pi } ( x ) \wedge \boldsymbol { \pi } ( y )  \exists \boldsymbol { z } ( x I z \wedge y I z ) ) , } \\ & { \gamma _ { 2 } : \forall w ( \boldsymbol { A } ( u ) \wedge A ( v )  \exists x ( x I u \wedge x I v ) ) , } \\ & { \gamma _ { 3 } : \forall x y u v ( x I u \wedge y I u \wedge x I v \wedge y I v  x = y \vee u = v ) , } \\ & { \gamma _ { 4 } : \exists x _ { 0 } x _ { 1 } x _ { 2 } x _ { 3 } u _ { 0 } u _ { 1 } u _ { 2 } u _ { 3 } \bigg ( \bigwedge _ { \begin{array} { c } { x _ { i } I u _ { i } \wedge \bigwedge \atop j = i - 1 ( \bmod { 3 } ) } x _ { i } I u _ { j } \wedge \bigwedge _ { \begin{array} { c } { x _ { i } - 1 ( \bmod { 3 } ) } \\ { i \neq j } \end{array} } } \end{array} } \end{array}
$$

$\gamma _ { 0 }$ tells us that in a projective plane everything is either a point or a line, $\gamma _ { 1 }$ and $\gamma _ { 2 }$ tell us that “any two lines intersect in a point” and “any two points can be joined by a line”, by $\gamma _ { 3 }$ this point (or line) is unique if the given lines (or points) are distinct. Finally $\gamma _ { 4 }$ makes projective planes non-trivial, in the sense that there are enough points and lines.

$\Pi ^ { \mathfrak { A } } = \{ a \in | \mathfrak { A } | | \mathfrak { A } \ v { \lvert { \overline { { a } } } \rvert } = \Pi ( \overline { { a } } ) \}$ and $\Lambda ^ { \mathfrak { A } } = \{ b \in | \mathfrak { A } | | \mathfrak { A } \ v { e } | = A ( \overline { { b } } ) \}$ are the sets of points and lines of $\mathfrak { A }$ ; $I ^ { \mathfrak { A } }$ is the incidence relation on $\mathfrak { A }$ .

The above formalization is rather awkward. One usually employs a two-sorted formalism, with $P , Q , R , \ldots$ varying over points and $\ell , m , n \ldots$ varying over lines. The first axiom is then suppressed by convention. The remaining axioms become

$$
\begin{array} { r l } & { \gamma _ { 1 } ^ { \prime } \colon \forall P Q \exists \ell ( P I \ell \wedge Q I \ell ) , } \\ & { \gamma _ { 2 } ^ { \prime } \colon \forall \ell m \exists P ( P I \ell \wedge P I m ) , } \\ & { \gamma _ { 3 } ^ { \prime } \colon \forall P Q \ell m ( P I \ell \wedge Q I \ell \wedge P I m \wedge Q I m \to P = Q \vee \ell = m ) , } \\ & { \gamma _ { 4 } ^ { \prime } \colon \exists P _ { 0 } P _ { 1 } P _ { 2 } P _ { 3 } \ell _ { 0 } \ell _ { 1 } \ell _ { 2 } \ell _ { 3 } \Big ( \bigwedge \bigwedge P _ { i } I \ell _ { i } \wedge \bigwedge _ { j = i - 1 ( m o d 3 ) } P _ { i } I \ell _ { j } \wedge \bigwedge _ { \stackrel { j \neq i - 1 ( m o d 3 ) } { i \neq j } } - P _ { i } I \ell _ { j } \Big ) . } \end{array}
$$

The translation from one language to the other presents no difficulty. The above axioms are different from the ones usually given in the course in projective geometry. We have chosen these particular axioms because they are easy to formulate and also because the duality principle follows immediately (cf. Sect. 3.10, Exercise 8). The fourth axiom is an existence axiom, it merely says that certain things exist; it can be paraphrased differently: there are four points no three of which are collinear (i.e. on a line). Such an existence axiom is merely a precaution to make sure that trivial models are excluded. In this particular case, one would not do much geometry if there were only one triangle!

5. The language of rings with unity. Type: $\langle - ; 2 , 2 , 1 ; 2 \rangle$

Alphabet.

Predicate symbol: $=$ Function symbols: +, ·, − Constant symbols: 0, 1

Definition 3.7.6 $\mathfrak { A }$ is a ring (with unity) if it is a model of

$$
\begin{array} { r l } & { \forall x y z ( ( x + y ) + z = x + ( y + z ) ) , } \\ & { \forall x y ( x + y = y + x ) , } \\ & { \forall x y z ( ( x ) z = x ( y z ) ) , } \\ & { \forall x y z ( ( x + z ) = x y + x z ) , } \\ & { \forall x y z ( ( x + y ) z = x z + y z ) , } \\ & { \forall x ( x + 0 = x ) , } \\ & { \forall x ( x + ( - x ) = 0 ) , } \\ & { \forall x ( 1 \cdot x = x \wedge x \cdot 1 = x ) , 0 \neq 1 . } \end{array}
$$

A ring $\mathfrak { A }$ is commutative if ${ \mathfrak { A } } \models \forall x y ( x y = y x )$ .

A ring $\mathfrak { A }$ is a division ring if $\mathfrak { A } \models \forall x ( x \ne 0 \to \exists y ( x y = 1 ) )$

A commutative division ring is called a field.

Actually it is more convenient to have an inverse function symbol available in the language of fields, which therefore has type $\langle - ; 2 , 2 , 1 , 1 ; 2 \rangle$ .

Therefore we add to the above list the sentences $\forall x ( x \neq 0 \to x \cdot x ^ { - 1 } = 1 \land x ^ { - 1 }$ $x = 1 \AA$ ) and $0 ^ { - 1 } = 1$ .

Note that we must somehow “fix the value of $0 ^  - 1 \} ^ { , }$ , the reason will appear in Sect. 3.10, Exercise 2.

6. The language of arithmetic. Type $\langle - ; 2 , 2 , 1 ; 1 \rangle$ .

Alphabet.   
Predicate symbol: $=$   
Function symbols: +, ·, S   
Constant symbol: 0   
( $s$ stands for the successor function $n \mapsto n + 1$ ).

Historically, the language of arithmetic was introduced by Peano with the intention to describe the natural numbers with plus, times and successor up to an isomorphism. This is in contrast to, e.g. the theory of groups, in which one tries to capture a large class of non-isomorphic structures. It has turned out, however, that Peano’s axioms characterize a large class of structures, which we will call (lacking a current term) Peano structures. Whenever confusion threatens we will use the official notation for the zero symbol: $\overline { { 0 } }$ , but mostly we will trust the good sense of the reader.

Definition 3.7.7 A Peano structure $\mathfrak { A }$ is a model of

$$
\begin{array} { l c l } { \forall x ( 0 \neq S ( x ) ) , } \\ { \forall x y ( S ( x ) = S ( y )  x = y ) , } \\ { \forall x ( x + 0 = x ) , } \end{array}
$$

$$
\begin{array} { r l } & { \forall x y ( x + S ( y ) = S ( x + y ) ) , } \\ & { \forall x ( x \cdot 0 = 0 ) , } \\ & { \forall x y ( x \cdot S ( y ) = x \cdot y + x ) , } \\ & { \varphi ( 0 ) \wedge \forall x ( \varphi ( x ) \to \varphi ( S ( x ) ) ) \to \forall x \varphi ( x ) . } \end{array}
$$

The last axiom schema is called the induction schema or the principle of mathematical induction.

It will prove convenient to introduce some notation. We define:

$$
\begin{array} { r l } & { \overline { { 1 } } : = S ( \overline { { 0 } } ) , \qquad \overline { { 2 } } : = S ( \overline { { 1 } } ) , \quad \mathrm { a n d ~ i n ~ g e n e r a l } \ : \overline { { n + 1 } } : = S ( \overline { { n } } ) , } \\ & { x < y : = \exists z ( x + S z = y ) , } \\ & { x \leq y : = x < y \vee x = y . } \end{array}
$$

There is one particular Peano structure which is the intended model of arithmetic, namely the structure of the ordinary natural numbers, with the ordinary addition, multiplication and successor (e.g. the finite ordinals in set theory). We call this Peano structure the standard model $\mathfrak { N }$ , and the ordinary natural numbers are called the standard numbers.

One easily checks that $\overline { n } ^ { \mathfrak N } = n$ and $\mathfrak { N } \vdash \overline { { n } } < \overline { { m } } \Leftrightarrow n < m$ : by definition of interpretation we have $\overline { { 0 } } ^ { \mathfrak { N } } = 0$ . Assume $\overline { n } ^ { \mathfrak N } = n$ , then $\overline { { n + 1 } } ^ { \mathfrak { N } } = ( S ( \overline { { n } } ) ) ^ { \mathfrak { N } } = \overline { { n } } ^ { \mathfrak { N } } + 1 =$ $n + 1$ . We now apply mathematical induction in the meta-language, and obtain $\overline { n } ^ { \mathfrak N } = n$ for all $n$ . For the second claim see Exercise 13. In $\mathfrak { N }$ we can define all kinds of sets, relations and numbers. To be precise we say that a $\mathbf { k }$ -ary relation $R$ in $\mathfrak { N }$ is defined by $\varphi$ if $\langle a _ { 1 } , \dots , a _ { k } \rangle \in R \Leftrightarrow { \mathfrak { N } } { \big | } = \varphi ( { \overline { { a _ { 1 } } } } , \dots , { \overline { { a } } } _ { k } )$ . An element $a \in | \mathfrak { N } |$ is defined in $\mathfrak { N }$ by $\varphi$ if $\mathfrak { N } \models \varphi ( \overline { { b } } ) \Leftrightarrow b = a$ , or $\mathfrak { N } \models \forall x ( \varphi ( x )  x = \overline { { a } } )$ ).

# Examples

(a) The set of even numbers is defined by $E ( x ) : = \exists y ( x = y + y )$ .   
(b) The divisibility relation is defined by $x | y : = \exists z ( x z = y )$ .   
(c) The set of prime numbers is defined by $P ( x ) : = \forall y z ( x = y z  y =$ $1 \vee z = 1 ) \wedge x \neq 1$ .

We say that we have introduced predicates $E , |$ and $P$ by (explicit) definition.

# 7. The language of graphs

We usually think of graphs as geometric figures consisting of vertices and edges connecting certain of the vertices. A suitable language for the theory of graphs is obtained by introducing a predicate $R$ which expresses the fact that two vertices are connected by an edge. Hence, we don’t need variables or constants for edges.

Alphabet. Predicate symbols: $R , =$

Definition 3.7.8 A graph is a structure ${ \mathfrak { A } } = \langle A , R \rangle$ satisfying the following axioms:

$$
\begin{array} { l } { \forall x y ( R ( x , y )  R ( y , x ) ) } \\ { \forall x { \neg R } ( x , x ) . } \end{array}
$$

This definition is in accordance with the geometric tradition. There are elements, called vertices, of which some are connected by edges. Note that two vertices are connected by at most one edge. Furthermore there is no (need for an) edge from a vertex to itself. This is geometrically inspired; however, from the point of view of the numerous applications of graphs it appears that more liberal notions are required.

# Examples

![](images/f139d666e018f34559aeda83ec74c62bb084675956725a238350f4f5c4bf9587.jpg)

We can also consider graphs in which the edges are directed. A directed graph ${ \mathfrak { A } } = \langle A , R \rangle$ satisfies only $\forall { x } { \neg } R ( x , x )$ .

Examples

![](images/57e3ce51db2a3b42d937d1f5d78e9524c3427c8ba65eb6d585cc2b5fc2246435.jpg)

If we drop the condition of irreflexivity then a “graph” is just a set with a binary relation. We can generalize the notion even further, so that more edges may connect a pair of vertices.

In order to treat those generalized graphs we consider a language with two unary predicates $V$ , $E$ and one ternary predicate $C$ . Think of $V ( x )$ as $^ { 6 6 } x$ is a vertex”, $E ( x )$

as $^ { 6 6 } x$ is an edge”, and $C ( x , z , y )$ as $^ { 6 6 } z$ connects $x$ and $y '$ . A directed multigraph is a structure $= \langle A , V , E , C \rangle$ satisfying the following axioms:

$$
\begin{array} { r l } & { \forall x ( V ( x )  \neg E ( x ) ) , } \\ & { \forall x y z ( C ( x , z , y ) \to V ( x ) \land V ( y ) \land E ( z ) ) . } \end{array}
$$

The edges can be seen as arrows. By adding the symmetry condition, $\forall x y z ( C ( x , z , y )  C ( y , z , x ) )$ one obtains plain multigraphs.

Examples

![](images/ec737baa3f896a7d95d4518431d589429363258d16d00cb73670c438d1fcc535.jpg)

Remark The nomenclature in graph theory is not very uniform. We have chosen our formal framework such that it lends itself to treatment in first-order logic.

For the purpose of describing multigraphs a two-sorted language (cf. geometry) is well suited. The reformulation is left to the reader.

# Exercises

1. Consider the language of partial order. Define predicates for (a) $x$ is the maximum; (b) $x$ is maximal; (c) there is no element between $x$ and $y$ ; (d) $x$ is an immediate successor (respectively predecessor) of $y$ ; (e) $z$ is the infimum of $x$ and $y$ .   
2. Give a sentence $\sigma$ such that $\mathfrak { A } _ { 2 } \models \sigma$ and $\mathfrak { A } _ { 4 } \models \neg \sigma$ (for ${ \mathfrak { A } } _ { i }$ associated to the diagrams of p. 79).   
3. Let $\mathfrak { A } _ { 1 } = \langle \mathbb { N } , \leq \rangle$ and $\mathfrak { A } _ { 2 } = \langle \mathbb { Z } , \leq \rangle$ be the ordered sets of natural, respectively integer, numbers. Give a sentence $\sigma$ such that $\mathfrak { A } _ { 1 } \models \sigma$ and $\mathfrak { A } _ { 2 } \models \neg \sigma$ . Do the same for ${ \mathfrak { A } } _ { 2 }$ and ${ \mathfrak { B } } = \langle \mathbb { Q } , \leq \rangle$ (the ordered set of rationals). N.B. $\sigma$ is in the language of posets; in particular, you may not add extra constants, function symbols, etc., defined abbreviations are of course harmless.   
4. Let $\sigma = \exists x \forall y ( x \leq y \lor y \leq x )$ . Find posets $\mathfrak { A }$ and $\mathfrak { B }$ such that ${ \mathfrak { A } } \models \sigma$ and $\mathfrak { B } \models \neg \sigma$ .   
5. Do the same for $\sigma = \forall x y \exists z [ ( x \leq z \land y \leq z ) \lor ( z \leq x \land z \leq y ) ]$ .   
6. Using the language of identity structures give an (infinite) set $\boldsymbol { { \Gamma } }$ such that $\mathfrak { A }$ is a model of $\varGamma$ iff $\mathfrak { A }$ is infinite.   
7. Consider the language of groups. Define the properties: (a) $x$ is idempotent; (b) $x$ belongs to the center.

8. Let $\mathfrak { A }$ be a ring, give a sentence $\sigma$ such that $\mathfrak { A } \models \sigma \Leftrightarrow \mathfrak { A }$ is an integral domain (has no divisors of zero).

9. Give a formula $\sigma ( x )$ in the language of rings such that $\mathfrak { A } \models \sigma ( \overline { { a } } ) \Leftrightarrow$ the principal ideal $( a )$ is prime (in $\mathfrak { A }$ ).

10. Define in the language of arithmetic: (a) $x$ and $y$ are relatively prime; (b) $x$ is the smallest prime greater than $y ; ( \mathrm { c } ) x$ is the greatest number with $2 x < y$ .

11. $\sigma : = \forall x _ { 1 } \ldots x _ { n } \exists y _ { 1 } \ldots y _ { m } \varphi$ and $\tau : = \exists y _ { 1 } \dots y _ { m } \psi$ are sentences in a language without identity, function symbols and constants, where $\varphi$ and $\psi$ are quantifier free. Show: $\models \sigma \Leftrightarrow \sigma$ holds in all structures with $n$ elements. $\fallingdotseq { \tau } \Leftrightarrow \tau$ holds in all structures with 1 element.

12. Monadic predicate calculus has only unary predicate symbols (no identity). Consider $\mathfrak { A } = \langle A , R _ { 1 } , \ldots , R _ { n } \rangle$ where all $R _ { i }$ are sets. Define $a \sim b : = a \in R _ { i } \Leftrightarrow$ $b \in R _ { i }$ for all $i \leq n$ . Show that $\sim$ is an equivalence relation and that $\sim$ has at most $2 ^ { n }$ equivalence classes. The equivalence class of $a$ is denoted by $[ a ]$ . Define $B = A / { \sim }$ and $[ a ] \in S _ { i } \Leftrightarrow a \in R _ { i }$ , $\mathfrak { B } = \langle B , S _ { 1 } , \ldots , S _ { n } \rangle$ . Show $\mathfrak { A } \models \sigma \Leftrightarrow$ $\mathfrak { B } \models \sigma$ for all $\sigma$ in the corresponding language. For such $\sigma \ : \mathrm { s h o w } \left. = \sigma \Leftrightarrow \mathfrak { A } \right. = \sigma$ for all $\mathfrak { A }$ with at most $2 ^ { n }$ elements. Using this fact, outline a decision procedure for truth in monadic predicate calculus.

13. Let $\mathfrak { N }$ be the standard model of arithmetic. Show $\mathfrak { N } \vdash \overline { { n } } < \overline { { m } } \Leftrightarrow n < m$ .

14. Let $\mathfrak { A } = \langle \mathbb { N } , \mathbf { < } \rangle$ and $\mathfrak { B } = \langle \mathbb { N } , \Delta \rangle$ , where $n \triangle m$ iff (i) $n < m$ and $n , m$ both even or both odd, or (ii) if $n$ is even and $m$ odd. Give a sentence $\sigma$ such that ${ \mathfrak { A } } \models \sigma$ and $\mathfrak { B } \models \neg \sigma$ .

15. If $\langle A , R \rangle$ is a projective plane, then $\langle A , { \check { R } } \rangle$ is also a projective plane (the dual plane), where $\breve { R }$ is the converse of the relation $R$ . Formulated in the two-sorted language: if $\langle A _ { P } , A _ { L } , I \rangle$ is a projective plane, then so is $\langle A _ { L } , A _ { P } , \check { I } \rangle$ .

# 3.8 Natural Deduction

We extend the system of Sect. 2.5 to predicate logic. For reasons similar to the ones mentioned in Sect. 2.5 we consider a language with connectives $\land ,  , \bot$ and $\forall$ . The existential quantifier is left out, but will be considered later.

We adopt all the rules of propositional logic and we add

$$
\forall I { \frac { \varphi ( x ) } { \forall x \varphi ( x ) } } \qquad \forall E { \frac { \forall x \varphi ( x ) } { \varphi ( t ) } }
$$

where in $\forall I$ the variable $x$ may not occur free in any hypothesis on which $\varphi ( x )$ depends, i.e. an uncanceled hypothesis in the derivation of $\varphi ( x )$ . In $\forall E$ we, of course, require $t$ to be free for $x$ .

$\forall I$ has the following intuitive explanation: if an arbitrary object $x$ has the property $\varphi$ , then every object has the property $\varphi$ . The problem is that none of the objects we know in mathematics can be considered “arbitrary”. So instead of looking for the “arbitrary object” in the real world (as far as mathematics is concerned), let us try to find a syntactic criterion. Consider a variable $x$ (or a constant) in a derivation, are there reasonable grounds for calling $x$ “arbitrary”? Here is a plausible suggestion: in the context of the derivations we shall call $x$ arbitrary if nothing has been assumed concerning $x$ . In more technical terms, $x$ is arbitrary at its particular occurrence in a derivation if the part of the derivation above it contains no hypotheses containing $x$ free.

We will demonstrate the necessity of the above restrictions, keeping in mind that the system at least has to be sound, i.e. that derivable statements should be true. Restriction on $\forall I$ :

$$
\begin{array} { c } { \displaystyle \frac { [ x = 0 ] } { \forall x ( x = 0 ) } } \\ { \displaystyle \frac { x = 0  \forall x ( x = 0 ) } { x ( x = 0  \forall x ( x = 0 ) ) } } \\ { \displaystyle \frac { \forall x = 0  \forall x ( x = 0 ) ) } { 0 = 0  \forall x ( x = 0 ) } } \end{array}
$$

The $\forall$ introduction at the first step was illegal.

$\mathrm { S o } \vdash 0 = 0 \to \forall x ( x = 0 )$ , but clearly $\forall \ : 0 = 0  \forall x ( x = 0 )$ (take any structure containing more than just 0).

Restriction on $\forall E$ :

$$
\frac { \relax [ \forall x \neg \forall y ( x = y ) ] } { \neg \forall y ( y = y ) }
$$

The $\forall$ elimination at the first step was illegal.

Note that $y$ is not free for $x$ in $\neg \forall y ( x = y )$ . The derived sentence is clearly not true in structures with at least two elements.

We now give some examples of derivations. We assume that the reader has enough experience by now in canceling hypotheses, so we will no longer indicate the cancellations by encircled numbers.

$$
\begin{array} { r l } { \frac { [ \nabla x \forall y \varphi ( x , y ) ] } { \forall y \varphi ( x , y ) } \forall E } & { \qquad \frac { [ \nabla x ( \varphi ( x ) \wedge \psi ( x ) ) ] } { \varphi ( x ) \wedge \psi ( x ) } \qquad \frac { [ \nabla x ( \varphi ( x ) \wedge \psi ( x ) ) ) ] } { \varphi ( x ) \wedge \psi ( x ) } } \\ { \frac { \varphi ( x , y ) } { \forall x \varphi ( x , y ) } \forall I } & { \qquad \frac { \varphi ( x ) } { \forall x \varphi ( x ) } \qquad \frac { \overline { { \psi ( x ) } } } { \overline { { \forall x \psi ( x ) } } } } \\ { \frac { \overline { { \forall y \forall x ( \varphi ( x , y ) ) } } \forall I } { \forall x \forall y \varphi ( x , y ) ) } \forall I } & { \qquad \frac { \forall x \varphi ( x ) \wedge \forall x \psi ( x ) } { \overline { { \forall x ( \varphi \wedge \psi ) } }  \forall x \varphi \wedge \forall x \psi } } \\ { \forall x \forall y \varphi ( x , y )  \forall y \forall x \varphi ( x , y ) } \end{array}
$$

Let $x \notin F V ( \varphi )$

$$
{ \begin{array} { r l } { \underbrace { { \frac { [ \forall x ( \varphi \to \psi ( x ) ) ) ] } { \varphi \to \psi ( x ) } } \forall E } _ { \begin{array} { l } { [ \varphi ] } \\ { \underbrace { { \frac { \psi ( x ) } { \forall x \psi ( x ) } } \forall I } _ { \forall x \psi ( x ) } \to I } \\ { \underbrace { { \frac { \forall x \psi ( x ) } { \forall x \psi ( x ) } } \forall { I } } _ { \varphi \to \forall x \psi ( x ) } \to I } \end{array} } } & { \underbrace { { \frac { [ \varphi ] } { \forall x \varphi } } \forall I } _ { \varphi  \forall x \varphi } \underbrace { { \frac { [ \forall x \varphi ] } { \varphi } } \forall E } _ { \varphi } } \\ { { \frac { \forall x ( \varphi \to \psi ( x ) ) \to ( \varphi \to \forall x \psi ( x ) ) } { \forall x ( \varphi \to \psi ( x ) ) \to ( \varphi \to \forall x \psi ( x ) ) } } } \end{array} }
$$

In the right-hand derivation $\forall I$ is allowed, since $x \notin F V ( \varphi )$ , and $\forall E$ is applicable.

Note that $\forall I$ in the bottom left derivation is allowed because $x \notin F V ( \varphi )$ , for at that stage $\varphi$ is still (part of) a hypothesis.

The reader will have grasped the technique behind the quantifier rules: reduce a $\forall x \varphi$ to $\varphi$ and reintroduce $\forall$ later, if necessary. Intuitively, one makes the following step: to show “for all $x \ldots x \ldots ^ { \prime }$ it suffices to show “. . . x . . .” for an arbitrary $x$ . The latter statement is easier to handle. Without going into fine philosophical distinctions, we note that the distinction “for all $\ : x \ldots x \ldots ^ { \flat } - \ :$ “for an arbitrary $x \ldots x \ldots ^ { \prime }$ ” is embodied in our system by means of the distinction. “quantified statement” – “free variable statement”.

The reader will also have observed that under a reasonable derivation strategy, roughly speaking, elimination precedes introduction. There is a sound explanation for this phenomenon, its proper treatment belongs to proof theory, where normal derivations (derivations without superfluous steps) are considered. See Chap. 7. For the moment the reader may accept the above mentioned fact as a convenient rule of thumb.

We can formulate the derivability properties of the universal quantifier in terms of the relation $\vdash$ :

$$
\begin{array} { r l } { \Gamma \vdash \varphi ( x ) \Rightarrow \Gamma \vdash \forall x \varphi ( x ) } & { { \mathrm { i f ~ } } x \notin F V ( \psi ) { \mathrm { ~ f o r ~ a l l ~ } } \psi \in T } \\ { \quad \Gamma \vdash \forall x \varphi ( x ) \Rightarrow \Gamma \vdash \varphi ( t ) } & { { \mathrm { i f ~ } } t { \mathrm { ~ i s ~ f r e e ~ f o r ~ } } x { \mathrm { ~ i n ~ } } \varphi . } \end{array}
$$

The above implications follow directly from $( \forall I )$ and $( \forall E )$

Our next goal is the correctness of the system of natural deduction for predicate logic. We first extend the definition of $\vDash$ .

Definition 3.8.1 Let $\varGamma$ be a set of formulas and let $\{ x _ { i _ { 1 } } , x _ { i _ { 2 } } , . . . \} =$ $\bigcup \{ F V ( \psi ) | \psi \in T \cup \{ \sigma \} \}$ . If a is a sequence $( a _ { 1 } , a _ { 2 } , \ldots )$ of elements (repetitions allowed) of $| \mathfrak { A } |$ , then $\boldsymbol { { \Gamma } } ( \mathbf { a } )$ is obtained from $\varGamma$ by replacing simultaneously in all formulas of $\varGamma$ the $x _ { i _ { j } }$ by $\overline { { a } } _ { j } ( j \geq 1 )$ (for $T = \{ \psi \}$ we write $\psi ( \mathbf { a } ) ,$ . We now define (i) ${ \mathfrak { A } } \models { \cal T } ( \mathbf { a } )$ if ${ \mathfrak { A } } \models \psi$ for all $\psi \in T ( \mathbf { a } )$ , (ii) $T \models \sigma$ if $\mathfrak { A } \models { \Gamma } ( \mathbf { a } ) \Rightarrow \mathfrak { A } \models \sigma ( \mathbf { a } )$ for all $\mathfrak { A }$ , a.

In case only sentences are involved, the definition can be simplified:

${ \cal { { T } } } \models \sigma$ if $\mathfrak { A } \models { \cal T } \Rightarrow \mathfrak { A } \models \sigma$ for all $\mathfrak { A }$ .   
If $T = \emptyset$ , we write $\models \sigma$ .

We can paraphrase this definition as: $T \models \sigma$ , if for all structures $\mathfrak { A }$ and all choices of a, $\sigma ( \mathbf { a } )$ is true in $\mathfrak { A }$ if all hypotheses of $\boldsymbol { { \Gamma } } ( \mathbf { a } )$ are true in $\mathfrak { A }$ .

Now we can formulate the following lemma.

Lemma 3.8.2 (Soundness) $\begin{array} { r } { T \vdash \sigma \Rightarrow \boldsymbol { \Gamma } \Vdash \sigma . } \end{array}$ .

Proof By definition of ${ \cal { \cal { T } } } \vdash \sigma$ it suffices to show that for each derivation $\mathcal { D }$ with hypothesis set $\varGamma$ and conclusion $\sigma \ : T \models \sigma$ . We use induction on $\mathcal { D }$ (cf. Lemma 2.5.1 and Exercise 2).

Since we have cast our definition of satisfaction in terms of valuations, which evidently contains the propositional logic as a special case, we can copy the cases of (1) the one-element derivation, and (2) the derivations with a propositional rule as the last step, from Lemma 2.6.1 (please check this claim).

So we have to treat derivations with $( \forall I )$ or $( \forall E )$ as the final step.

$$
\begin{array} { r l r l } { \forall I ) } & { \mathcal { D } } & & { \mathcal { D } \mathrm { ~ h a s ~ i t s ~ h y p o t h e s e s ~ i n ~ } \boldsymbol { \varGamma } \mathrm { ~ a n d ~ } x \mathrm { ~ i s ~ n o t ~ f r e e ~ i n ~ } \boldsymbol { i } } \\ & { \underline { { \varphi ( x ) } } } & & { \mathrm { I n d u c t i o n ~ h y p o t h e s i s : } \boldsymbol { \Gamma } \vdash \varphi ( x ) , \mathrm { i . e . ~ } \boldsymbol { \mathfrak { A } } \vdash \boldsymbol { \Gamma } ( \mathbf { a } } \\ & { \forall x \varphi ( x ) } & & { \mathfrak { A } \vdash ( \varphi ( x ) ) ( \mathbf { a } ) \mathrm { ~ f o r ~ a l l ~ } \mathfrak { A } \mathrm { ~ a n d ~ a l l ~ } \mathbf { a } . } \end{array}
$$

It is no restriction to suppose that $x$ is the first of the free variables involved (why?). So we can substitute $\overline { { a } } _ { 1 }$ for $x$ in $\varphi$ . Put ${ \bf { a } } = ( a _ { 1 } , { \bf { a } } ^ { \prime } )$ . Now we have:

for all $a _ { 1 }$ and $\mathbf { a } ^ { \prime } = ( a _ { 2 } , \dots ) \mathfrak { A } \models { \cal T } ( \mathbf { a } ^ { \prime } ) \Rightarrow \mathfrak { A } \models \varphi ( \overline { { a _ { 1 } } } ) ( \mathbf { a } ^ { \prime } ) , \mathfrak { c }$ o for all $\mathbf { a } ^ { \prime } { \mathfrak { A } } | = r ( \mathbf { a } ^ { \prime } ) \Rightarrow { \mathfrak { A } } | = ( \varphi ( { \overline { { a } } } _ { 1 } ) ) ( \mathbf { a } ^ { \prime } )$ for all $a _ { 1 }$ , so for all $\mathbf { a } ^ { \prime } \mathfrak { A } \models \Gamma ( \mathbf { a } ^ { \prime } ) \Rightarrow \mathfrak { A } \models ( \forall x \varphi ( x ) ) ( \mathbf { a } ^ { \prime } ) .$ .

This shows ${ \cal { T } } \equiv \forall x \varphi ( x )$ . (Note that in this proof we used $\forall x ( \sigma  \tau ( x ) ) $ $( \sigma  \forall x \tau ( x ) )$ , where $x \notin F V ( \sigma )$ , in the meta-language. Of course we may use sound principles on the meta-level.)

$$
\begin{array} { r l r } { ( \forall E ) } & { \mathcal { D } } & { \mathrm { I n d u c t i o n ~ h y p o t h e s i s : } \ : T = \forall x \varphi ( x } \\ & { \underline { { \forall x \varphi ( x ) } } } & { \mathrm { i . e . } \ : \mathfrak { A } \models \ : \Gamma ( \mathbf { a } ) \Rightarrow \mathfrak { A } \models ( \forall x \varphi ( x ) ) ( \mathbf { a } } \\ & { \varphi ( t ) } & { \mathrm { f o r ~ a l l ~ \mathbf { a } ~ a n d ~ \mathfrak { A } . } } \end{array}
$$

So let ${ \mathfrak { A } } \models { \cal T } ( \mathbf { a } )$ , then ${ \mathfrak { A } } \models \varphi ( { \overline { { b } } } )$ (a) for all $b \in \left| \mathfrak { A } \right|$ . In particular we may take $t [ \overline { { \mathbf { a } } } / \mathbf { z } ]$ for $\overline { { b } }$ , where we slightly abuse the notation; since there are finitely many variables $z _ { 1 } , \dots , z _ { n }$ , we only need finitely many of the $a _ { i }$ ’s, and therefore we consider it an ordinary simultaneous substitution.

$\mathfrak { A } \models ( \varphi [ \mathbf { a } / \mathbf { z } ] ) [ t [ \mathbf { a } / \mathbf { z } ] / x ]$ , hence by Lemma 3.5.4, $\mathfrak { A } \models ( \varphi [ t / x ] ) [ \mathbf { a } / \mathbf { z } ]$ , or ${ \mathfrak { A } } \vDash$ $( \varphi ( t ) ) ( \mathbf { a } )$ . �

Having established the soundness of our system, we can easily get nonderivability results.

# Examples

1. $\forall \forall x \exists y \varphi  \exists y \forall x \varphi$ . Take $\mathfrak { A } = \langle \{ 0 , 1 \} , \{ \langle 0 , 1 \rangle , \langle 1 , 0 \rangle \} \rangle$ (type $\langle 2 ; - ; 0 \rangle ,$ ) and consider $\varphi : = P ( x , y )$ , the predicate interpreted in $\mathfrak { A }$ .

${ \mathfrak { A } } \models \forall x { \exists y } P ( x , y )$ , since for 0 we have $\langle 0 , 1 \rangle \in P$ and for 1 we have $\langle 1 , 0 \rangle \in P$ . But, $\mathfrak { A } \models \exists y \forall x P ( x , y )$ , since for 0 we have $\langle 0 , 0 \rangle \notin P$ and for 1 we have $\langle 1 , 1 \rangle \notin P$ .

2. $\forall x \varphi ( x , x ) , \forall x y ( \varphi ( x , y )  \varphi ( y , x ) ) \forall \forall x y z ( \varphi ( x , y ) \land \varphi ( y , z )  \varphi ( x , z ) ) .$ Consider ${ \mathfrak { B } } = \langle \mathbb { R } , P \rangle$ with $P = \{ \langle a , b \rangle \mid | a - b | \leq 1 \}$ .

Although variables and constants are basically different, they share some properties. Both constants and free variables may be introduced in derivations through $\forall E$ , but only free variables can be subjected to $\forall I$ ,—that is free variables can disappear in derivations by other than propositional means. It follows that a variable can take the place of a constant in a derivation but in general not vice versa. We make this precise as follows.

Theorem 3.8.3 Let x be a variable not occurring in $\varGamma$ or $\varphi$ .

(i) $r \vdash \varphi \Rightarrow r [ x / c ] \vdash \varphi [ x / c ]$ .   
(ii) If c does not occur in $\varGamma$ , then $r \vdash \varphi ( c ) \Rightarrow r \vdash \forall x \varphi ( x )$ .

Proof (ii) follows immediately from (i) by $\forall I$ . (i) Induction on the derivation of $T \vdash \varphi$ . Left to the reader. �

Observe that the result is rather obvious, changing $c$ to $x$ is just as harmless as coloring $c$ red—the derivation remains intact.

# Exercises

# 1. Show:

(i) $\begin{array} { r l } & { \vdash \forall x ( \varphi ( x )  \psi ( x ) )  ( \forall x \varphi ( x )  \forall x \psi ( x ) ) , } \\ & { \vdash \forall x \varphi ( x )  \neg \forall x \neg \varphi ( x ) , } \end{array}$   
(ii)   
(iii) $\vdash \forall x \varphi ( x )  \forall z \varphi ( z )$ if $z$ does not occur in $\varphi ( x )$ ,   
(iv) $\vdash \forall x \forall y \varphi ( x , y )  \forall y \forall x \varphi ( x , y )$ ,   
(v) $\vdash \forall x \forall y \varphi ( x , y )  \forall x \varphi ( x , x ) ,$   
(vi) $\vdash \forall x ( \varphi ( x ) \land \psi ( x ) )  \forall x \varphi ( x ) \land \forall x \psi ( x ) ,$   
(vii) $\vdash \forall x ( \varphi  \psi ( x ) )  ( \varphi  \forall x \psi ( x ) )$ , where $x \notin F V ( \varphi )$

2. Extend the definition of derivation to the present system (cf. Definition 2.4.1).

3. Show $( s ( t ) [ \overline { { a } } / x ] ) ^ { \mathfrak { A } } = ( s ( ( t [ \overline { { a } } / x ] ) ^ { \mathfrak { A } } ) [ \overline { { a } } / x ] ) ^ { \mathfrak { A } }$ .

4. Show the inverse implications of Theorem 3.8.3.

5. Assign to each atom $P ( t _ { 1 } , \ldots , t _ { n } )$ a proposition symbol, denoted by $P$ . Now define a translation $^ \dagger$ from the language of predicate logic into the language of propositional logic by

$$
\begin{array} { r l } & { ( P ( t _ { 1 } , \ldots , t _ { n } ) ) ^ { \dagger } : = P \quad \mathrm { a n d } \quad \bot ^ { \dagger } : = \bot , } \\ & { ( \varphi \sqcap \psi ) ^ { \dagger } : = \varphi ^ { \dagger } \boxed { \mathscr { V } } ^ { \dagger } , } \\ & { ( \neg \varphi ) ^ { \dagger } : = \neg \varphi ^ { \dagger } , } \\ & { ( \forall x \varphi ) ^ { \dagger } : = \varphi ^ { \dagger } . } \end{array}
$$

Show ${ \cal { T } } \vdash \varphi \Rightarrow { \cal { T } } ^ { \dagger } \vdash ^ { \dagger } \varphi ^ { \dagger }$ , where $\vdash ^ { \dagger }$ stands for “derivable without using $( \forall I )$ or $( \forall E ) ^ { \dag }$ (does the converse hold?)

Conclude the consistency of predicate logic.

Show that predicate logic is conservative over propositional logic (cf. Definition 4.1.5).

# 3.9 Adding the Existential Quantifier

Let us introduce $\exists x \varphi$ as an abbreviation for $\neg \forall x \neg \varphi$ (Theorem 3.5.1 tells us that there is a good reason for doing so). We can prove the following:

# Lemma 3.9.1

(i) $\varphi ( t ) \vdash \exists x \varphi ( x )$ (t free for $x$ in $\varphi$ ) (ii) $r , \varphi ( x ) \vdash \psi \Rightarrow r$ , $\exists x \varphi ( x ) \vdash \psi$ if $x$ is not free in $\psi$ or any formula of $\boldsymbol { { \Gamma } }$ .

Proof (i)

$$
{ \frac { \left[ { \check { \nabla } } x \neg \varphi ( x ) \right] } { \neg \varphi ( t ) } } { \frac { \varphi ( t ) } { \neg \varphi ( x \mathbin { \left( - \int _ { 0 } ^ { } \varphi ( x ) \right. } ) } \to L }
$$

so $\varphi ( t ) \vdash \exists x \varphi ( x )$

$$
\left[ \varphi ( x ) \right]
$$

$$
\begin{array} { c } { { \frac { \psi \qquad [ \neg \psi ] } { \underline { { \perp } } } \to E } } \\ { { \frac { \perp } { \neg \varphi ( x ) } \to I } } \\ { { \frac { \neg \forall x \neg \varphi ( x ) } { \underline { { \perp } } \mathbf { \cdot R } \mathbf { A } } \to E } } \\ { { \frac { \perp } { \psi } \mathbf { R A A } } } \end{array}
$$

Explanation The subderivation top left is the given one; its hypotheses are in $T \cup \{ \varphi ( x ) \}$ (only $\varphi ( x )$ is shown). Since $\varphi ( x )$ (that is, all occurrences of it) is canceled and $x$ does not occur free in $\boldsymbol { { \Gamma } }$ or $\psi$ , we may apply $\forall I$ . From the derivation we conclude that $r , \exists x \varphi ( x ) \vdash \psi$ .

We can compress the last derivation into an elimination rule for ∃:

$$
\begin{array} { c } { { [ \varphi [ y / x ] ] } } \\ { { \vdots } } \\ { { \underline { { { \exists x \varphi ( x ) } } } } } \end{array}
$$

with the conditions: $y$ is not free in $\psi$ , or in a hypothesis of the subderivation of $\psi$ , other than $\varphi ( x )$ .

This is easily seen to be correct since we can always fill in the missing details, as shown in the preceding derivation.

By (i) we also have an introduction rule: ${ \frac { \varphi ( t ) } { \exists x \ \varphi ( x ) } } \exists I$ for $t$ free for $x$ in $\varphi$ .

# Examples of derivations

<table><tr><td colspan="2">[∀x(φ(x)→)]³ AE (x)→ψ</td><td rowspan="2">[(x)]1 →E</td></tr><tr><td colspan="2">[xφ(x)]² Y 3E1</td></tr><tr><td colspan="2">4 →1</td><td>x FV(ψ)</td></tr><tr><td colspan="2">xφ(x)→ψ →1 ∀x(Φ(x)→)→(ExΦ(x)→ψ)</td><td></td></tr><tr><td rowspan="3"></td><td>[(x)]1</td><td>[y(x)]1</td></tr><tr><td>xφ(x)</td><td>x↓(x)</td></tr><tr><td>[𝜑(x)&lt;ψ(x)]² xφ(x)&lt;xψ(x)</td><td>Exφ(x)&lt;xψ(x) VE1</td></tr><tr><td rowspan="2">x(𝜑(x)&lt;ψ(x))}³</td><td></td><td>xΦ(x)&lt;xψ(x)</td></tr><tr><td>xΦ(x) &lt;xγ(x) →13</td><td>3E2</td></tr></table>

We will also sketch the alternative approach, that of enriching the language.

Theorem 3.9.2 Consider predicate logic with the full language and rules for all connectives, then $- \exists x \varphi ( x )  \lnot \forall x \lnot \varphi ( x )$ .

# Proof Compare Theorem 2.6.3.

It is time now to state the rules for $\forall$ and ∃ with more precision. We want to allow substitution of terms for some occurrences of the quantified variable in $( \forall E )$ and $( \exists E )$ . The following example motivates this.

$$
\begin{array} { l } { \displaystyle \frac { \forall x ( x = x ) } { x = x } \forall E } \\ { \displaystyle \frac { \exists x ( x = y ) } { \exists y ( x = y ) ) } \exists I } \end{array}
$$

The result would not be derivable if we could only make substitutions for all occurrences at the same time. Yet, the result is evidently true.

The proper formulation of the rules now is:

$$
\begin{array} { l c c } { { \displaystyle \forall I \frac { \varphi } { \bigtriangledown x \varphi } } } & { { ~ \forall E \frac { \bigtriangledown x \varphi } { \varphi [ t / x ] } } } \\ { { } } & { { } } & { { [ \varphi ] } } \\ { { } } & { { } } & { { ~ \cdot } } \\ { { \exists I \frac { \varphi [ t / x ] } { \exists x \varphi } } } & { { ~ \exists E \frac { \exists x \varphi } { \psi } \psi } } \end{array}
$$

with the appropriate restrictions.

# Exercises

$1 . \ \vdash \exists x ( \varphi ( x ) \wedge \psi )  \exists x \varphi ( x ) \wedge \psi \ { \mathrm { i f } } \ x \not \in F V ( \psi ) ,$ $2 . \ \vdash \forall x ( \varphi ( x ) \lor \psi )  \forall x \varphi ( x ) \lor \psi$ if x ∈ FV (ψ ), $3 . \ \vdash \forall x \varphi ( x )  \lnot \exists x \lnot \varphi ( x ) .$ ,   
$4 . \ \vdash \lnot \forall x \varphi ( x )  \exists x \lnot \varphi ( x ) .$ ,   
$5 . \ \vdash \lnot \exists x \varphi ( x )  \forall x \lnot \varphi ( x )$ ,   
$6 . \ \vdash \exists x ( \varphi ( x )  \psi )  ( \forall x \varphi ( x )  \psi )$ if $x \notin F V ( \psi )$ , $7 . \ \vdash \exists x ( \varphi  \psi ( x ) )  ( \varphi  \exists x \psi ( x ) )$ if $x \notin F V ( \varphi )$ , $8 . \ \vdash \exists x \exists y \varphi  \exists y \exists x \varphi$ ,   
$9 . \ \vdash \exists x \varphi  \varphi$ if $x \notin F V ( \varphi )$ .

# 3.10 Natural Deduction and Identity

We will give rules, corresponding to the axioms $I _ { 1 } - I _ { 4 }$ of Sect. 3.6.

$$
\begin{array} { c } { \frac { \mathbf { R } \mathbf { I } _ { 1 } } { x = x } } \\ { \frac { x = y } { y = x } \mathbf { R } \mathbf { I } _ { 2 } } \\ { \frac { x = y } { x } y = z } \\ { \frac { x = z } { x } \mathbf { R } \mathbf { I } _ { 3 } } \\ { \frac { x _ { 1 } = y _ { 1 } , . . . , x _ { n } = y _ { n } } { t ( x _ { 1 } , . . . , x _ { n } ) = t ( y _ { 1 } , . . . , y _ { n } ) } \mathbf { R } \mathbf { I } _ { 4 } } \end{array}
$$

$$
\begin{array} { l } { x _ { 1 } = y _ { 1 } , \ldots , x _ { n } = y _ { n } \quad \varphi ( x _ { 1 } , \ldots , x _ { n } ) } \\ { \qquad \varphi ( y _ { 1 } , \ldots , y _ { n } ) } \end{array} \mathrm { R I } _ { 4 }
$$

where $y _ { 1 } , . . . . , y _ { n }$ are free for $x _ { 1 } , \ldots , x _ { n }$ in $\varphi$ . Note that we want to allow substitution of the variable $y _ { i }$ $( i \leq n )$ for some and not necessarily all occurrences of the variable $x _ { i }$ . We can express this by formulating $R I _ { 4 }$ in the precise terms of the simultaneous substitution operator:

$$
x _ { 1 } = y _ { 1 } , . . . , x _ { n } = y _ { n }
$$

$$
t [ x _ { 1 } , \ldots , x _ { n } / z _ { 1 } , \ldots , z _ { n } ] = t [ y _ { 1 } , \ldots , y _ { n } / z _ { 1 } , \ldots , z _ { n } ]
$$

$$
x _ { 1 } = y _ { 1 } , \ldots , x _ { n } = y _ { n } \quad \varphi [ x _ { 1 } , \ldots , x _ { n } / z _ { 1 } , \ldots , z _ { n } ]
$$

$$
\varphi [ y _ { 1 } , \dots , y _ { n } / z _ { 1 } , \dots , z _ { n } ]
$$

Example

$$
\begin{array} { r l } & { \frac { x = y \quad x ^ { 2 } + y ^ { 2 } > 1 2 x } { 2 y ^ { 2 } > 1 2 x } } \\ & { \frac { x = y \quad x ^ { 2 } + y ^ { 2 } > 1 2 x } { x ^ { 2 } + y ^ { 2 } > 1 2 y } } \\ & { \frac { x = y \quad x ^ { 2 } + y ^ { 2 } > 1 2 x } { 2 y ^ { 2 } > 1 2 y } } \end{array}
$$

The above are three legitimate applications of $R I _ { 4 }$ having three different conclusions.

The rule $R I _ { 1 }$ has no hypotheses, which may seem surprising, but which certainly is not forbidden.

The rules $R I _ { 4 }$ have many hypotheses; as a consequence the derivation trees can look a bit more complicated. Of course one can get all the benefits from $R I _ { 4 }$ by a restricted rule, allowing only one substitution at the time.

Lemma ${ \bf 3 . 1 0 . 1  } I _ { i }$ for $i = 1 , 2 , 3 , 4$

Proof Immediate.

We can weaken the rules $R I _ { 4 }$ slightly by considering only the simplest terms and formulas.

Lemma 3.10.2 Let $L$ be of type $\langle r _ { 1 } , \ldots , r _ { n } ; a _ { 1 } , \ldots , a _ { m } ; k \rangle$ . If the rules

$$
\frac { x _ { 1 } = y _ { 1 } , \ldots , x _ { r _ { i } } = y _ { r _ { i } } \quad P _ { 1 } ( x _ { 1 } , \ldots , x _ { r _ { i } } ) } { P _ { 1 } ( y _ { 1 } , \ldots , y _ { r _ { i } } ) } \quad f o r a l l i \leq n
$$

$$
{ \frac { x _ { 1 } = y _ { 1 } , \ldots , x _ { a _ { j } } = y _ { a _ { j } } } { f _ { j } ( x _ { 1 } , \ldots , x _ { a _ { j } } ) = f _ { j } ( y _ { 1 } , \ldots , y _ { a _ { j } } ) } } \quad f o r a l l j \leq m
$$

are given, then the rules $R I _ { 4 }$ are derivable.

Proof We consider a special case. Let $L$ have one binary predicate symbol and one unary function symbol.

(i) We show $x = y \vdash t ( x ) = t ( y )$ by induction on $t$ .

(a) $t ( x )$ is a variable or a constant. Immediate. (b) $t ( x ) = f ( s ( x ) )$ . Induction hypothesis: $x = y \vdash s ( x ) = s ( y )$

$$
\begin{array} { c c } { { \displaystyle \frac { [ x = y ] } { f ( x ) = f ( y ) } } } & { { } } \\ { { \forall x y ( x = y \to f ( x ) = f ( y ) ) } } & { { \mathit { \forall I \ 2 \times } } } \end{array} \qquad \begin{array} { c c } { { \displaystyle x = } } & { { } } \\ { { \displaystyle \frac { \partial } { \partial x ( x ) = f ( y ) } } } & { { } } \\ { { \displaystyle \frac { \partial } { \partial y ( x ) = f ( y ) ) } } } & { { } } \end{array}
$$

$$
s ( x ) = s ( y ) \to f ( s ( x ) ) = f ( s ( y ) ) \qquad s ( x ) = s ( y )
$$

$$
f ( s ( x ) ) = f ( s ( y ) )
$$

This shows $x = y \vdash f ( s ( x ) ) = f ( s ( y ) )$ .

(ii) We show ${ \vec { x } } = { \vec { y } }$ , $\varphi ( { \vec { x } } ) \vdash \varphi ( { \vec { y } } )$

(a) $\varphi$ is atomic, then $\varphi = P ( t , s ) .$ $t$ and $s$ may (in this example) contain at most one variable each. So it suffices to consider $x _ { 1 } = y _ { 1 }$ , $x _ { 2 } = y _ { 2 }$ , $P ( t ( x _ { 1 } , x _ { 2 } ) , s ( x _ { 1 } , x _ { 2 } ) ) \vdash P ( t ( y _ { 1 } , y _ { 2 } ) , s ( y _ { 1 } , y _ { 2 } ) )$ (i.e. $P ( t [ x _ { 1 } , x _ { 2 } / z _ { 1 } , z _ { 2 } ] , . . . ) ,$ ).

Now we get, by applying $ E$ twice, from

$$
{ \frac { \frac { [ x _ { 1 } = y _ { 1 } ] \quad [ x _ { 2 } = y _ { 2 } ] \quad [ P ( x _ { 1 } , x _ { 2 } ) ] } { P ( y _ { 1 } , y _ { 2 } ) } } { \frac { x _ { 1 } = y _ { 1 } \to ( x _ { 2 } = y _ { 2 } \to ( P ( x _ { 1 } , x _ { 2 } ) = P ( y _ { 1 } , y _ { 2 } ) ) ) } { \forall x _ { 1 } x _ { 2 } y _ { 1 } y _ { 2 } ( x _ { 1 } = y _ { 1 } \to ( x _ { 2 } = y _ { 2 } \to ( P ( x _ { 1 } , x _ { 2 } ) = P ( y _ { 1 } , y _ { 2 } ) ) ) ) } } } \forall I \qquad \quad 
$$

and the following two instances of (i)

$$
x _ { 1 } = y _ { 1 } x _ { 2 } = y _ { 2 } x _ { 1 } = y _ { 1 } x _ { 2 } = y _ { 2 }
$$

$$
s \left( x _ { 1 } , x _ { 2 } \right) = s ( y _ { 1 } , y _ { 2 } ) \qquad t ( x _ { 1 } , x _ { 2 } ) = t ( y _ { 1 } , y _ { 2 } ) ,
$$

the required result, $( P ( s _ { x } , t _ { x } ) = P ( s _ { y } , t _ { y } ) )$ .

So

$$
x _ { 1 } = y _ { 1 } , x _ { 2 } = y _ { 2 } \vdash P ( s _ { x } , t _ { x } )  P ( s _ { y } , t _ { y } )
$$

where

$$
\begin{array} { c c } { { s _ { x } = s ( x _ { 1 } , x _ { 2 } ) , } } & { { s _ { y } = s ( y _ { 1 } , y _ { 2 } ) } } \\ { { } } & { { t _ { x } = t ( x _ { 1 } , x _ { 2 } ) , } } & { { t _ { y } = t ( y _ { 1 } , y _ { 2 } ) . } } \end{array}
$$

(b) $\varphi = \sigma  \tau$

Induction hypotheses:

$$
\begin{array} { l } { { \vec { x } = \vec { y } , \sigma ( \vec { y } ) \vdash \sigma ( \vec { x } ) } } \\ { { \vec { x } = \vec { y } , \tau ( \vec { x } ) \vdash \tau ( \vec { y } ) } } \end{array}
$$

$$
\vec { x } = \vec { y } [ \sigma ( \vec { y } ) ]
$$

$$
{ \vec { x } } = { \vec { y } }
$$

$$
\sigma ( \vec { y } )  \tau ( \vec { y } )
$$

So ${ \vec { x } } = { \vec { y } }$ , $\sigma ( \vec { x } )  \tau ( \vec { x } ) \vdash \sigma ( \vec { y } )  \tau ( \vec { y } )$

(c) $\varphi = \sigma \wedge \tau$ , left to the reader.

(d) $\varphi = \forall z \psi ( z , { \vec { x } } )$

Induction hypothesis: $\vec { x } = \vec { y } , \psi ( z , \vec { x } ) \vdash \psi ( z , \vec { y } )$

$$
\frac { \forall z \psi ( z , { \vec { x } } ) } { \psi ( z , { \vec { x } } ) } \quad \Vec { x } = \Vec { y }
$$

$$
\frac { \psi ( z , \vec { y } ) } { \forall z \psi ( z , \vec { y } ) }
$$

So $\vec { x } = \vec { y } , \forall z \psi ( z , \vec { x } ) \vdash \forall z \psi ( z , \vec { y } )$ .

This establishes, by induction, the general rule.

# Exercises

1. Show that $\forall x ( x = x ) , \forall x y z ( x = y \land z = y \to x = z ) \vdash I _ { 2 } \land I _ { 3 }$ (using predicate logic only).

2. Show $\mathbf { \partial } - \exists x ( t = x )$ for any term $t$ . Explain why all functions in a structure are total (i.e. defined for all arguments); what is $0 ^ { - 1 } \mathopen { } \mathclose \bgroup $

3. Sho $v \vdash \forall z ( z = x  z = y )  x = y ,$

4. $\operatorname { S h o w } \vdash \forall x y z ( x \neq y  x \neq z \lor y \neq z )$

5. Show that in the language of identity $I _ { 1 } , I _ { 2 } , I _ { 3 } \vdash I _ { 4 }$ .

6. Show $\forall x ( x = a \lor x = b \lor x = c ) \vdash \forall x \varphi ( x )  ( \varphi ( a ) \land \varphi ( b ) \land \varphi ( c ) )$ , where $a , b , c$ , are constants.

7. Show

$$
\begin{array} { r l } & { \forall x y ( f ( x ) = f ( y )  x = y ) , \forall x y ( g ( x ) = g ( y )  x = y ) \vdash \forall x y ( f ( g ( x ) ) = } \\ & { f ( g ( y ) )  x = y ) , } \\ & { \forall y \exists x ( f ( x ) = y ) , \forall y \exists x ( g ( x ) = y ) \vdash \forall y \exists x ( f ( g ( x ) ) = y ) . } \end{array}
$$

Which properties are expressed by this exercise?

8. Prove the following duality principle for projective geometry (cf. Definition 3.7.5): If $T \vdash \varphi$ then also $T \vdash \varphi ^ { d }$ , where $\varGamma$ is the set of axioms of projective geometry and $\varphi ^ { d }$ is obtained from $\varphi$ by replacing each atom $x I y$ by $y I x$ . (Hint: check the effect of the translation $d$ on the derivation of $\varphi$ from $\varGamma$ .)