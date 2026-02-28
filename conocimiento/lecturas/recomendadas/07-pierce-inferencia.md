# 22 Type Reconstruction

The typechecking algorithms for the calculi we have seen so far all depend on explicit type annotations—in particular, they require that lambda-abstractions be annotated with their argument types. In this chapter, we develop a more powerful type reconstruction algorithm, capable of calculating a principal type for a term in which some or all of these annotations are left unspecified. Related algorithms lie at the heart of languages like ML and Haskell.

Combining type reconstruction with other language features is often a somewhat delicate matter. In particular, both records and subtyping pose significant challenges. To keep things simple, we consider type reconstruction here only for simple types; §22.8 gives some starting points for further reading on other combinations.

# 22.1 Type Variables and Substitutions

In some of the calculi in previous chapters, we have assumed that the set of types includes an infinite collection of uninterpreted base types (§11.1). Unlike interpreted base types such as Bool and Nat, these types come with no operations for introducing or eliminating terms; intuitively, they are just placeholders for some particular types whose exact identities we do not care about. In this chapter, we will be asking questions like “if we instantiate the placeholder X in the term t with the concrete type Bool, do we obtain a typable term?” In other words, we will treat our uninterpreted base types as type variables, which can be substituted or instantiated with other types.

For the technical development in this chapter, it is convenient to separate the operation of substituting types for type variables into two parts: describing a mapping $\sigma$ from type variables to types, called a type substitution, and applying this mapping to a particular type $\intercal$ to obtain an instance $\sigma \mathsf { T }$ . For example, we might define $\sigma = [ \mathsf { X } \mapsto \mathsf { B o o l } ]$ and then apply $\sigma$ to the type $\mathsf X { \to } \mathsf X$ to obtain $\sigma ( { \mathsf { X } } { \to } { \mathsf { X } } ) = { \mathsf { B } } 0 0 7 { \to } { \mathsf { B } } 0 0 7$ .

22.1.1 Definition: Formally, a type substitution (or just substitution, when it’s clear that we’re talking about types) is a finite mapping from type variables to types. For example, we write $[ \mathsf { X } \mapsto \mathsf { T } , \mathsf { Y } \mapsto \mathsf { U } ]$ for the substitution that associates $\mathsf X$ with $\intercal$ and Y with U. We write $d o m ( \sigma )$ for the set of type variables appearing on the left-hand sides of pairs in $\sigma$ , and range $( \sigma )$ for the set of types appearing on the right-hand sides. Note that the same variable may occur in both the domain and the range of a substitution. Like term substitutions, the intention in such cases is that all the clauses of the substitution are applied simultaneously; for example, $[ X \mapsto 8 0 0 ]$ , $\mathsf { Y } \mapsto \mathsf { X } { \to } \mathsf { X } ]$ maps $\mathsf X$ to Bool and Y to $\tt X \to \tt X$ , not Bool→Bool.

Application of a substitution to a type is defined in the obvious way:

$$
\begin{array} { l l l } { \sigma ( { \mathsf X } ) } & { = } & { \left\{ \begin{array} { l l } { { \mathsf T } } & { \mathrm { i f ~ } ( { \mathsf X } \mapsto { \mathsf T } ) \in \sigma } \\ { { \mathsf X } } & { \mathrm { i f ~ } { \mathsf X } \mathrm { ~ i s ~ n o t ~ i n ~ t h e ~ d o m a i n ~ o f ~ } \sigma } \end{array} \right. } \\ { \sigma ( { \mathsf N } \mathsf { a t } ) } & { = } & { { \mathsf N } \mathsf { a t } } \\ { \sigma ( 8 \mathsf { o o l } ) } & { = } & { 8 \mathsf { o o l } } \\ { \sigma ( { \mathsf T } _ { 1 } \to { \mathsf T } _ { 2 } ) } & { = } & { \sigma { \mathsf T } _ { 1 } \to \sigma { \mathsf T } _ { 2 } } \end{array}
$$

Note that we do not need to make any special provisions to avoid variable capture during type substitution, because there are no constructs in the language of type expressions that bind type variables. (We’ll get to these in Chapter 23.)

Type substitution is extended pointwise to contexts by defining

$$
\sigma ( \mathsf { x } _ { 1 } : \mathsf { T } _ { 1 } , \ldots , \mathsf { x } _ { n } : \mathsf { T } _ { n } ) = ( \mathsf { x } _ { 1 } : \sigma \mathsf { T } _ { 1 } , \ldots , \mathsf { x } _ { n } : \sigma \mathsf { T } _ { n } ) .
$$

Similarly, a substitution is applied to a term $\mathtt { t }$ by applying it to all types appearing in annotations in $\mathtt { t }$ .

If $\sigma$ and $ { \gamma }$ are substitutions, we write $\sigma \circ \mathcal { Y }$ for the substitution formed by composing them as follows:

$$
\sigma \circ y = { \left[ \begin{array} { l l } { \mathsf { X } \mapsto \sigma ( \mathsf { T } ) } & { { \mathrm { f o r ~ e a c h ~ } } ( \mathsf { X } \mapsto \mathsf { T } ) \in y } \\ { \mathsf { X } \mapsto \mathsf { T } } & { { \mathrm { f o r ~ e a c h ~ } } ( \mathsf { X } \mapsto \mathsf { T } ) \in \sigma { \mathrm { ~ w i t h ~ } } \mathsf { X } \not \in d o m ( y ) } \end{array} \right] }
$$

Note that $( \sigma \circ \gamma ) \mathsf { S } = \sigma ( \gamma \mathsf { S } )$ .

A crucial property of type substitutions is that they preserve the validity of typing statements: if a term involving variables is well typed, then so are all of its substitution instances.

22.1.2 Theorem [Preservation of typing under type substitution]: If $\sigma$ is any type substitution and $\Gamma \vdash \mathtt { t } : \top$ , then $\sigma \Gamma \vdash \sigma \mathbf { t } : \sigma \mathbf { \bar { \Gamma } }$ .

Proof: Straightforward induction on typing derivations.

# 22.2 Two Views of Type Variables

Suppose that t is a term containing type variables and $\Gamma$ is an associated context (possibly also containing type variables). There are two quite different questions that we can ask about t:

1. “Are all substitution instances of t well typed?” That is, for every $\sigma$ , do we have $\sigma { \Gamma } \vdash \sigma$ t : T for some T?   
2. “Is some substitution instance of t well typed?” That is, can we find a $\sigma$ such that $\sigma \Gamma \vdash \sigma \mathbf { t } : \mathsf { T }$ for some T?

According to the first view, type variables should be held abstract during typechecking, thus ensuring that a well-typed term will behave properly no matter what concrete types are later substituted for its type variables. For example, the term

has type $( { \mathsf { X } } { \to } { \mathsf { X } } ) { \to } { \mathsf { X } } { \to } { \mathsf { X } }$ , and, whenever we replace X by a concrete type T, the instance

λf:T→T. λa:T. f (f a);

is well typed. Holding type variables abstract in this way leads us to parametric polymorphism, where type variables are used to encode the fact that a term can be used in many concrete contexts with different concrete types. We will return to parametric polymorphism later in this chapter (in §22.7) and, in more depth, in Chapter 23.

On the second view, the original term t may not even be well typed; what we want to know is whether it can be instantiated to a well typed term by choosing appropriate values for some of its type variables. For example, the term

λf:Y. λa:X. f (f a);

is not typable as it stands, but if we replace Y by Nat→Nat and X by Nat, we obtain

of type (Nat→Nat)→Nat→Nat. Or, if we simply replace Y by $\tt X \to \tt X$ , we obtain the term

λf:X→X. λa:X. f (f a);

which is well typed even though it contains variables. Indeed, this term is a most general instance of λf:Y. λa:X. f (f a), in the sense that it makes the smallest commitment about the values of type variables that yields a welltyped term.

Looking for valid instantiations of type variables leads to the idea of type reconstruction (sometimes called type inference), in which the compiler helps fill in type information that has been left out by the programmer. In the limit, we may, as in ML, allow the programmer to leave out all type annotations and write in the syntax of the bare, untyped lambda-calculus. During parsing, we annotate each bare lambda-abstraction λx.t with a type variable, $\lambda { \bf { x } } : \mathsf { X } . \mathsf { t }$ , choosing X to be different from the type variables on all the other abstractions in the program. We then perform type reconstruction to find the most general values for all these variables that make the term typecheck. (This story becomes a little more complicated in the presence of ML’s let-polymorphism; we return to this in §22.6 and §22.7.)

To formalize type reconstruction, we will need a concise way of talking about the possible ways that type variables can be substituted by types, in a term and its associated context, to obtain a valid typing statement.1

22.2.1 Definition: Let Γ be a context and t a term. A solution for $( \Gamma , \sf t )$ is a pair $( \sigma , \mathsf { T } )$ such that $\sigma \Gamma \vdash \sigma \mathbf { t } : \mathsf { T }$ . �

22.2.2 Example: Let $\Gamma = \mathsf { f } : \mathsf { X }$ , a:Y and $\mathbf { t } = \mathsf { f } \mathsf { a }$ . Then

$$
\begin{array} { l l } { { ( [ { \mathsf X } \mapsto { \mathsf Y } \to { \mathsf N } { \mathsf a } { \mathsf t } ] , \ { \mathsf N } { \mathsf a } { \mathsf t } ) } } & { { ( [ { \mathsf X } \mapsto { \mathsf Y } \to { \mathsf Z } ] , \ { \mathsf Z } ) } } \\ { { ( [ { \mathsf X } \mapsto { \mathsf Y } \to { \mathsf Z } , \ { \mathsf Z } \mapsto { \mathsf N } { \mathsf a } { \mathsf t } ] , \ { \mathsf Z } ) } } & { { ( [ { \mathsf X } \mapsto { \mathsf Y } \to { \mathsf N } { \mathsf a } { \mathsf t } \to { \mathsf N } { \mathsf a } { \mathsf t } ] , \ { \mathsf N } { \mathsf a } { \mathsf t } \to { \mathsf N } { \mathsf a } { \mathsf t } ) } } \\ { { ( [ { \mathsf X } \mapsto { \mathsf N } { \mathsf a } { \mathsf t } \to { \mathsf N } { \mathsf a } { \mathsf t } , { \mathsf Y } \mapsto { \mathsf N } { \mathsf a } { \mathsf t } ] , \ { \mathsf N } { \mathsf a } { \mathsf t } \to { \mathsf N } { \mathsf a } { \mathsf t } ) } } \end{array}
$$

are all solutions for $( \Gamma , \ t )$ .

22.2.3 Exercise $[ \star \ \not \to ]$ : Find three different solutions for the term

$$
\lambda { \bf x } : \mathsf { X } . \lambda { \bf y } : \mathsf { Y } . \lambda z : \mathsf { Z } . ( \mathsf { x } \mathsf { z } ) ( \mathsf { y } \mathsf { z } ) .
$$

in the empty context.

# 22.3 Constraint-Based Typing

We now present an algorithm that, given a term t and a context Γ , calculates a set of constraints—equations between type expressions (possibly involving type variables)—that must be satisfied by any solution for $( \Gamma , \sf t )$ . The intuition behind this algorithm is essentially the same as the ordinary typechecking algorithm; the only difference is that, instead of checking constraints, it simply records them for later consideration. For example, when presented with an application $\ t _ { 1 } \ t _ { 2 }$ with $\Gamma \vdash \mathbf { t } _ { 1 } : \mathsf { T } _ { 1 }$ and $\Gamma \vdash \ t _ { 2 } : \mathsf { T } _ { 2 }$ , rather than checking that $\mathbf { t } _ { 1 }$ has the form $\mathsf { T } _ { 2 } \to \mathsf { T } _ { 1 2 }$ and returning ${ \mathsf T } _ { 1 2 }$ as the type of the application, it instead chooses a fresh type variable $\mathsf { X } ,$ , records the constraint ${ \sf T } _ { 1 } = { \sf T } _ { 2 }  { \sf X } ,$ and returns $\mathsf X$ as the type of the application.

22.3.1 Definition: A constraint set $C$ is a set of equations $\{ \mathsf { S } _ { i } = \mathsf { T } _ { i } ^ { \phantom { } _ { i } \in I \ldots n } \}$ . A substitution $\sigma$ is said to unify an equation ${ \mathsf { S } } = { \mathsf { T } }$ if the substitution instances $\sigma { \mathsf { S } }$ and $\sigma \mathsf { T }$ are identical. We say that $\sigma$ unifies (or satisfies) $C$ if it unifies every equation in $C$ .

22.3.2 Definition: The constraint typing relation $\Gamma \vdash \mathtt { t } : \top$ $\mid x \ C$ is defined by the rules in Figure 22-1. Informally, $\Gamma \vdash \mathtt { t } : \top$ $\mid x \ C$ can be read “term $\mathtt { t }$ has type T under assumptions Γ whenever constraints $C$ are satisfied.” In rule T-App, we write $F V ( \mathsf T )$ for the set of all type variables mentioned in T.

The $x$ subscripts are used to track the type variables introduced in each subderivation and make sure that the fresh variables created in different subderivations are actually distinct. On a first reading of the rules, it may be helpful to ignore these subscripts and all the premises involving them. On the next reading, observe that these annotations and premises ensure two things. First, whenever a type variable is chosen by the final rule in some derivation, it must be different from any variables chosen in subderivations. Second, whenever a rule involves two or more subderivations, the sets of variables chosen by these subderivations must be disjoint. Also, note that these conditions never prevent us from building some derivation for a given term; they merely prevent us from building a derivation in which the same variable is used “fresh” in two different places. Since there is an infinite supply of type variable names, we can always find a way of satisfying the freshness requirements.

When read from bottom to top, the constraint typing rules determine a straightforward procedure that, given $\Gamma$ and $\mathtt { t }$ , calculates $\intercal$ and $C$ (and $x$ ) such that $\Gamma \vdash { \textsf { t } } : { \textsf { T } } \vdash C .$ However, unlike the ordinary typing algorithm for the simply typed lambda-calculus, this one never fails, in the sense that for every $\Gamma$ and $\mathtt { t }$ there are always some $\intercal$ and $C$ such that $\Gamma \vdash { \sf t } : { \sf T } \quad | { \boldsymbol { x } } \ C ,$ , and moreover that $\intercal$ and $C$ are uniquely determined by $\Gamma$ and t. (Strictly speaking, the algorithm is deterministic only if we consider it “modulo the choice of fresh names.” We return to this point in Exercise 22.3.9.)

<table><tr><td>x:T∈Γ Ttx:Tlo0</td><td>(CT-VAR)</td><td>Γ-t :TlxC C&#x27; =CU{T= Nat} (CT-PRED) Γ├ pred t1 : Nat lx C&#x27;</td></tr><tr><td>I,x:T1 ├ t2 :T2 lx C (CT-ABS) T- Ax:T1.t2 :T1-T2 lx C</td><td>Γ-t1:T lxC C&#x27; =CU{T= Nat}</td><td></td></tr><tr><td>T ├ t1 :T1 lx C1Γ├ t2:T2 lx C2 X1 ∩ X2 =Xin FV(T2)= X2 ∩ FV(Ti)= O</td><td>T- iszero t1 : Bool Ix C&#x27;</td><td>(CT-ISZERO)</td></tr><tr><td>X  X1,X2,T1,T2,C1,C2,Γ,t1,0r t2</td><td>Γ├ true :Booll{}</td><td>(CT-TRUE)</td></tr><tr><td>C&#x27; =CUC2 U{T1 =T2→X}</td><td>Γ ├ false : Bool l{}</td><td>(CT-FALSE)</td></tr><tr><td>T- t1 t2 : X IxiuxU{x} C&#x27;</td><td>Γ ├ t1 :T1 lx C1</td><td></td></tr><tr><td></td><td>(CT-APP) Γ├ t2:T2 lx C2Γ├t3:T3 lx C3</td><td></td></tr><tr><td>Γ-O:Nat l{</td><td>(CT-ZERO)</td><td>X1,X2,X3 nonoverlapping</td></tr><tr><td></td><td></td><td></td></tr><tr><td>Γ-ti:TlxC</td><td></td><td></td></tr><tr><td></td><td></td><td>C&#x27; = C1 U C2 U C3 U{T1 = Boo],T2 = T3}</td></tr><tr><td></td><td></td><td></td></tr><tr><td>C&#x27; =CU {T= Nat}</td><td></td><td></td></tr><tr><td></td><td></td><td>Γ - if t1 then t2 else t3 : T2 IxiuxzUx C&#x27;</td></tr><tr><td></td><td>(CT-SUCC)</td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td>T - succ t1 : Nat Ix C&#x27;</td><td></td><td>(CT-IF)</td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr></table>

To lighten the notation in the following discussion, we sometimes elide the $x$ and write just $\Gamma \vdash \mathbf { t } : \mathsf { T } \mid C$ .

22.3.3 Exercise $[ \star \ \not \to ]$ : Construct a constraint typing derivation whose conclusion is

$$
- \lambda { \bf x } : \mathsf { X } . \lambda { \bf y } : \mathsf { Y } . \lambda z : \mathsf { Z } . ( \mathsf { x } \thinspace z ) \mathrm { ~ ( \bf y \thinspace z ) ~ : ~ } \mathsf { S } \mathrm { ~ \bf ~ \chi ~ } C
$$

for some S, $x$ , and $C$ .

The idea of the constraint typing relation is that, given a term $\mathtt { t }$ and a context Γ , we can check whether $\mathtt { t }$ is typable under Γ by first collecting the constraints $C$ that must be satisfied in order for $\mathtt { t }$ to have a type, together with a result type S, sharing variables with $C$ , that characterizes the possible types of $\mathtt { t }$ in terms of these variables. Then, to find solutions for t, we just look for substitutions $\sigma$ that satisfy $C$ (i.e., that make all the equations in $C$ into identities); for each such $\sigma$ , the type $\sigma { \mathsf { S } }$ is a possible type of t. If we find that there are no substitutions that satisfy $C$ , then we know that t cannot be instantiated in such a way as to make it typable.

For example, the constraint set generated by the algorithm for the term ${ \boldsymbol { \mathsf { t } } } =$ $\lambda { \sf x } : { \sf X } \to { \sf Y } . { \sf x } \ : 0$ is $\{ \mathsf { N a t } { \to } \mathsf { Z } = \mathsf { X } { \to } \mathsf { Y } \}$ , and the associated result type is $( { \mathsf { X } } { \to } { \mathsf { Y } } ) { \to } { \mathsf { Z } }$ . The substitution $\sigma = [ \mathsf { X } \mapsto \mathsf { N a t }$ , $Z ~ \mapsto ~ { \mathsf { B o o l } }$ , $\textsf { Y } \mapsto \textsf { B o o l } .$ ] makes the equation $\mathsf { N a t {  } Z } ~ = ~ \mathsf { X {  } Y }$ into an identity, so we know that $\sigma ( ( { \mathsf { X } } \to { \mathsf { Y } } ) \to { \mathsf { Z } } )$ , i.e., $( \mathsf { N a t } \to \mathsf { B o o l } ) \to \mathsf { B o o l }$ , is a possible type for $\mathtt { t }$ .

This idea is captured formally by the following definition.

22.3.4 Definition: Suppose that $\Gamma \vdash \textsf { t } \colon \textsf { S } | \ C .$ . A solution for $( \Gamma , \ t , \ S , C )$ is a pair $( \sigma , \mathsf { T } )$ such that $\sigma$ satisfies $C$ and $\sigma { \mathsf { S } } = { \mathsf { T } }$ . �

The algorithmic problem of finding substitutions unifying a given constraint set $C$ will be taken up in the next section. First, though, we should check that our constraint typing algorithm corresponds in a suitable sense to the original, declarative typing relation.

Given a context Γ and a term t, we have two different ways of characterizing the possible ways of instantiating type variables in Γ and $\mathtt { t }$ to produce a valid typing:

1. [declarative] as the set of all solutions for $( \Gamma , \sf t )$ in the sense of Definition 22.2.1; or   
2. [algorithmic] via the constraint typing relation, by finding S and $C$ such that $\Gamma \vdash \mathbf { t } : \mathsf { S } \mid C$ and then taking the set of solutions for $( \Gamma , \mathbf { t } , \mathsf { S } , C )$ .

We show the equivalence of these two characterizations in two steps. First we show that every solution for $( \Gamma , \mathbf { t } , \mathsf { S } , C )$ is also a solution for $( \Gamma , \ t )$ (Theorem 22.3.5). Then we show that every solution for $( \Gamma , \sf t )$ can be extended to a solution for $( \Gamma , \ t , \ S , C )$ (Theorem 22.3.7) by giving values for the type variables introduced by constraint generation.

22.3.5 Theorem [Soundness of constraint typing]: Suppose that $\Gamma \vdash \textsf { t } \colon \mathsf { S } \mid C$ . If $( \sigma , \mathsf { T } )$ is a solution for $( \Gamma , \ t , \ S , C )$ , then it is also a solution for $( \Gamma , \sf t )$ . �

For this direction of the argument, the fresh variable sets $x$ are secondary and can be elided.

Proof: By induction on the given constraint typing derivation for $\Gamma \vdash \mathbf { t } : \mathsf { S } \ |$ $C$ , reasoning by cases on the last rule used.

Case CT-Var: $\begin{array} { r l r } { \mathbf { t } = \mathbf { x } } & { { } } & { \mathbf { x } : \mathsf { S } \in \Gamma \qquad C = \left\{ \begin{array} { l l } { \mathbf { \xi } } \end{array} \right. } \end{array}$

We are given that $( \sigma , \mathsf { T } )$ is a solution for $( \Gamma , \ t , \ S , C )$ ; since $C$ is empty, this means just that $\sigma { \mathsf { S } } = { \mathsf { T } } $ . But then by T-Var we immediately obtain $\sigma \Gamma \vdash \mathbf { x } : \mathsf { T } ,$ ， as required.

$$
\mathbf { t } = \lambda \mathbf { x } { : } \mathsf { T } _ { 1 } \mathrm { ~ . ~ } \mathbf { t } _ { 2 } \qquad \mathsf { S } = \mathsf { T } _ { 1 } { \to } \mathsf { S } _ { 2 } \qquad \Gamma , \mathsf { x } { : } \mathsf { T } _ { 1 } \vdash \mathbf { t } _ { 2 } : \mathsf { S } _ { 2 } \mid C
$$

We are given that $( \sigma , \mathsf { T } )$ is a solution for $( \Gamma , \ t , \ S , C )$ , that is, $\sigma$ unifies $C$ and ${ \sf T } = \sigma { \sf S } = \sigma { \sf T } _ { 1 }  \sigma { \sf S } _ { 2 }$ . So $( \sigma , \sigma { \sf S } _ { 2 } )$ is a solution for $( \Gamma , \ t _ { 2 } , \mathsf { S } _ { 2 } , C )$ . By the induction hypothesis, $( \sigma , \sigma { \sf S } _ { 2 } )$ is a solution for $( ( \Gamma , \times \colon \mathsf { T } _ { 1 } ) , \thinspace \mathbf { t } _ { 2 } )$ , i.e., σ $\Gamma , \times \colon \sigma  { \mathsf { T } } _ { 1 } \vdash$ $\sigma \mathbf { t } _ { 2 } : \sigma \mathsf { S } _ { 2 }$ . By T-Abs, $\sigma \Gamma \vdash \lambda \mathbf { x } \colon \sigma \mathsf { T } _ { 1 } . \sigma \mathbf { t } _ { 2 } : \sigma \mathsf { T } _ { 1 } \lnot \sigma \mathsf { S } _ { 2 } = \sigma ( \mathsf { T } _ { 1 } \lnot \mathbf { S } _ { 2 } ) = \mathsf { T }$ , as required.

Case CT-App:

$$
\begin{array} { l r } { \mathbf { t } = \mathbf { t } _ { 1 } \ \mathbf { t } _ { 2 } } & { { } \mathsf { S } = \mathsf { X } } \\ { \Gamma \vdash \mathbf { t } _ { 1 } : \mathsf { S } _ { 1 } \mid C _ { 1 } } & { { } \Gamma \vdash \mathbf { t } _ { 2 } : \mathsf { S } _ { 2 } \mid C _ { 2 } } \\ { C = C _ { 1 } \cup C _ { 2 } \cup \{ \mathsf { S } _ { 1 } = \mathsf { S } _ { 2 } { \to } \mathsf { X } \} } \end{array}
$$

By definition, $\sigma$ unifies $C _ { 1 }$ and $C _ { 2 }$ and $\sigma { \sf S } _ { 1 } = \sigma ( { \sf S } _ { 2 } {  } { \sf X } )$ . So $( \sigma , \sigma { \sf S } _ { 1 } )$ and $( \sigma , \sigma { \sf S } _ { 2 } )$ are solutions for $( \Gamma , \mathbf { t } _ { 1 } , \mathsf { S } _ { 1 } , C _ { 1 } )$ and $( \Gamma , \mathbf { t } _ { 2 } , \mathsf { S } _ { 2 } , C _ { 2 } )$ , from which the induction hypothesis gives us $\sigma \Gamma \vdash \sigma \mathbf { t } _ { 1 } : \sigma \mathsf { S } _ { 1 }$ and $\sigma \Gamma \vdash \sigma \mathbf { t } _ { 2 } : \sigma \mathsf { S } _ { 2 }$ . But since $\sigma { \sf S } _ { 1 } = \sigma { \sf S } _ { 2 }  \sigma { \sf X }$ , we have $\sigma \Gamma \vdash \sigma \mathfrak { t } _ { 1 } : \sigma \mathfrak { S } _ { 2 }  \sigma \mathfrak { X }$ , and, by T-App, $\sigma \Gamma \vdash$ $\sigma ( \mathbf { t } _ { 1 } \ \mathbf { t } _ { 2 } ) : \sigma \mathsf { X } = \mathsf { T }$ .

Other cases:

Similar.

The argument for the completeness of constraint typing with respect to the ordinary typing relation is a bit more delicate, because we must deal carefully with fresh names.

22.3.6 Definition: Write $\sigma \backslash \mathcal { X }$ for the substitution that is undefined for all the variables in $x$ and otherwise behaves like $\sigma$ .

22.3.7 Theorem [Completeness of constraint typing]: Suppose $\Gamma \vdash \mathtt { t } : \mathtt { S }$ $| x \rrangle$ $C$ . If $( \sigma , \mathsf { T } )$ is a solution for $( \Gamma , \sf t )$ and $d o m ( \sigma ) \cap \mathcal { X } = \emptyset$ , then there is some solution $( \sigma ^ { \prime } , \mathsf { T } )$ for $( \Gamma , \ t , \ S , C )$ such that $\sigma ^ { \prime } \backslash \mathcal { X } = \sigma$ . �

Proof: By induction on the given constraint typing derivation.

Case CT-Var: $\begin{array} { r l r } { \mathbf { t } = \mathbf { x } } & { { } } & { \mathbf { x } : \mathsf { S } \in \Gamma } \end{array}$

From the assumption that $( \sigma , \mathsf { T } )$ is a solution for $( \Gamma , \times )$ , the inversion lemma for the typing relation (9.3.1) tells us that ${ \sf T } = \sigma { \sf S }$ . But then $( \sigma , \mathsf { T } )$ is also a $( \Gamma , \mathsf { x } , \mathsf { S } , \{ \} )$ -solution.

Case CT-Abs: $\mathbf { t } = \lambda \mathbf { x } \colon \mathsf { T } _ { 1 } . \mathsf { t } _ { 2 } \qquad \Gamma , \mathbf { x } \colon \mathsf { T } _ { 1 } \vdash \mathsf { t } _ { 2 } : \mathsf { S } _ { 2 } \quad | \boldsymbol { x } \ C \qquad \mathsf { S } = \mathsf { T } _ { 1 } {  } \mathsf { S } _ { 2 }$

From the assumption that $( \sigma , \mathsf { T } )$ is a solution for (Γ , $\lambda \mathbf { x } { : } \mathsf { T } _ { 1 } . \mathsf { t } _ { 2 } )$ , the inversion lemma for the typing relation yields $\sigma \Gamma$ , $\mathbf { \Omega } \times : \sigma \mathsf { T } _ { 1 } \vdash \sigma \mathsf { t } _ { 2 } : \mathsf { T } _ { 2 }$ and ${ \sf T } = \sigma { \sf T } _ { 1 }  { \sf T } _ { 2 }$ for some ${ \sf T } _ { 2 }$ . By the induction hypothesis, there is a solution $( \sigma ^ { \prime } , \mathsf { T } _ { 2 } )$ for $( ( \Gamma , \pmb { \mathrm { x } } : \mathsf { T } _ { 1 } ) , \pmb { \mathrm { t } } _ { 2 } , \mathsf { S } _ { 2 } , C )$ such that $\sigma ^ { \prime } \backslash \mathcal { X }$ agrees with $\sigma$ . Now, $x$ cannot include any of the type variables in ${ \sf T } _ { 1 }$ . So $\sigma ^ { \prime } \mathsf { T } _ { 1 } \ = \ \sigma \mathsf { T } _ { 1 }$ , and $\sigma ^ { \prime } ( \mathsf { S } ) \ =$ $\sigma ^ { \prime } ( \mathsf { T } _ { 1 } {  } \mathsf { S } _ { 2 } ) = \sigma \mathsf { T } _ { 1 } {  } \sigma ^ { \prime } \mathsf { S } _ { 2 } = \sigma \mathsf { T } _ { 1 } {  } \mathsf { T } _ { 2 } = \mathsf { T } .$ . Thus, we see that $( \sigma ^ { \prime } , \mathsf { T } )$ is a solution for $( \Gamma , ( \lambda \mathbf { x } : \mathsf { T } _ { 1 } \ldots \mathsf { t } _ { 2 } ) , \mathsf { T } _ { 1 } \ldots \mathsf { S } _ { 2 } , C )$ .

Case CT-App:

$$
\begin{array} { l } { { \mathbf { t } = \mathbf { t } _ { 1 } \mathbf { t } _ { 2 } \mathbf { \Gamma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { t } _ { 1 } : \mathsf { S } _ { 1 } \mathbf { \Gamma } | \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } | \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \mathbf { \Sigma } \ } } \\ { \mathbf { \Sigma } \mathbf { X } \mathbf { \Sigma } \cap \mathbf { F } ( \mathsf { T } _ { 2 } ) = { \emptyset } } \\ { \mathbf { X } \mathbf { \Sigma } \cap F V ( \mathsf { T } _ { 1 } ) = { \emptyset } }  \end{array}
$$

From the assumption that $( \sigma , \mathsf { T } )$ is a solution for $( \Gamma , \ t _ { 1 } \ t _ { 2 } )$ , the inversion lemma for the typing relation yields $\sigma \Gamma \vdash \sigma \mathrm { t } _ { 1 } : \mathsf { T } _ { 1 }  \mathsf { T }$ and $\sigma \Gamma \vdash \sigma \mathbf { t } _ { 2 } : \mathsf { T } _ { 1 }$ . By the induction hypothesis, there are solutions $( \sigma _ { 1 } , \mathsf { T } _ { 1 } {  } \mathsf { T } )$ for $( \Gamma , \mathbf { t } _ { 1 } , \mathsf { S } _ { 1 } , C _ { 1 } )$ and $( \sigma _ { 2 } , \mathsf { T } _ { 1 } )$ for $( \Gamma , \mathbf { t } _ { 2 } , \mathsf { S } _ { 2 } , C _ { 2 } )$ , and $\sigma _ { 1 } \backslash \mathcal { X } _ { 1 } ~ = ~ \sigma = \sigma _ { 2 } \backslash \mathcal { X } _ { 2 }$ . We must exhibit a substitution $\sigma ^ { \prime }$ such that: (1) $\sigma ^ { \prime } \backslash \mathcal { X }$ agrees with $\sigma$ ; (2) $\sigma ^ { \prime } { \sf X } = { \sf T }$ ; (3) $\sigma ^ { \prime }$ unifies $C _ { 1 }$ and $C _ { 2 }$ ; and (4) $\sigma ^ { \prime }$ unifies $\{ \mathsf { S } _ { 1 } = \mathsf { S } _ { 2 } {  } \mathsf { X } \}$ , i.e., $\sigma ^ { \prime } \mathsf { S } _ { 1 } = \sigma ^ { \prime } \mathsf { S } _ { 2 } {  } \sigma ^ { \prime } \mathsf { X } .$ . Define $\sigma ^ { \prime }$ as follows:

$$
\sigma ^ { \prime } = \left[ \begin{array} { l l } { \curlyvee \mapsto \mathsf { U } } & { \mathrm { i f } \vee \notin \mathcal { X } \mathrm { ~ a n d ~ } ( \mathsf { Y } \mapsto \mathsf { U } ) \in \sigma , } \\ { \mathsf { Y } _ { 1 } { \mapsto } \mathsf { U } _ { 1 } } & { \mathrm { i f } \mathsf { Y } _ { 1 } \in \mathcal { X } _ { 1 } \mathrm { ~ a n d ~ } ( \mathsf { Y } _ { 1 } \mapsto \mathsf { U } _ { 1 } ) \in \sigma _ { 1 } , } \\ { \mathsf { Y } _ { 2 } { \mapsto } \mathsf { U } _ { 2 } } & { \mathrm { i f } \mathsf { Y } _ { 2 } \in \mathcal { X } _ { 2 } \mathrm { ~ a n d ~ } ( \mathsf { Y } _ { 2 } \mapsto \mathsf { U } _ { 2 } ) \in \sigma _ { 2 } , } \\ { \mathsf { X } \mapsto \mathsf { T } } & \end{array} \right]
$$

Conditions (1) and (2) are obviously satisfied. (3) is satisfied because $x _ { 1 }$ and $x _ { 2 }$ do not overlap. To check (4), first note that the side-conditions about freshness guarantee that $F V ( \mathsf { S } _ { 1 } ) \cap$ $( { \cal { X } } _ { 2 } \cup \{ { \sf { X } } \} ) = \emptyset$ , so that $\sigma ^ { \prime } \mathsf { S } _ { 1 } \ = \ \sigma _ { 1 } \mathsf { S } _ { 1 }$ . Now calculate as follows: σ � ${ \sf j _ { 1 } } = \sigma _ { 1 } { \sf S _ { 1 } } = { \sf T _ { 1 } } \mathrm { {  } } { \sf T } = \sigma _ { 2 } { \sf S _ { 2 } } \mathrm { {  } } { \sf T } = \sigma ^ { \prime } { \sf S _ { 2 } } \mathrm { {  } } \sigma ^ { \prime } { \sf X } =$ = $\sigma ^ { \prime } ( \mathsf { S } _ { 2 } {  } \mathsf { X } )$ .

Other cases:

Similar.

22.3.8 Corollary: Suppose $\Gamma \vdash \mathbf { t } : \mathsf { S } \mid C$ . There is some solution for $( \Gamma , \ t )$ iff there is some solution for $( \Gamma , \ t , \ S , C )$ . �

Proof: By Theorems 22.3.5 and 22.3.7.

22.3.9 Exercise [Recommended, $\bigstar \bigstar \bigstar ]$ : In a production compiler, the nondeterministic choice of a fresh type variable name in the rule CT-App would typically be replaced by a call to a function that generates a new type variable—different from all others that it ever generates, and from all type variables mentioned explicitly in the context or term being checked—each time it is called. Because such global “gensym” operations work by side effects on a hidden global variable, they are difficult to reason about formally. However, we can mimic their behavior in a fairly accurate and mathematically more tractable way by “threading” a sequence of unused variable names through the constraint generation rules.

Let $F$ denote a sequence of distinct type variable names. Then, instead of writing Γ � t : T $\mid x \ C$ for the constraint generation relation, we write $\Gamma \vdash _ { F } \mathbf { t } : \mathsf { T } \vdash _ { F ^ { \prime } } C$ , where Γ , $F$ , and $\mathtt { t }$ are inputs to the algorithm and T, $F ^ { \prime }$ , and $C$ are outputs. Whenever it needs a fresh type variable, the algorithm takes the front element of $F$ and returns the rest of $F$ as $F ^ { \prime }$ .

Write out the rules for this algorithm. Prove that they are equivalent, in an appropriate sense, to the original constraint generation rules. �

22.3.10 Exercise [Recommended, $\bigstar \bigstar \bigstar \bigstar$ : Implement the algorithm from Exercise 22.3.9 in ML. Use the datatype

type ty $=$ TyBool | TyArr of ty \* ty | TyId of string | TyNat

for types, and

type constr $\mathbf { \Sigma } = \mathbf { \Sigma } ( \mathsf { t y } \ ^ { \ast } \ \mathsf { t y } )$ list

for constraint sets. You will also need a representation for infinite sequences of fresh variable names. There are lots of ways of doing this; here is a fairly direct one using a recursive datatype:

type nextuvar $=$ NextUVar of string $^ { * }$ uvargenerator   
and uvargenerator $=$ unit nextuvar   
let uvargen $=$ let rec f n () $=$ NextUVar("?X_" ^ string_of_int n, f $\left( \mathsf { n } { + } \mathsf { 1 } \right)$ ) in f 0

That is, uvargen is a function that, when called with argument (), returns a value of the form NextUVar $( \mathsf { x } , \mathsf { f } )$ , where $\mathbf { x }$ is a fresh type variable name and $\boldsymbol { \mathsf { f } }$ is another function of the same form. �

22.3.11 Exercise $[ \star \star ]$ : Show how to extend the constraint generation algorithm to deal with general recursive function definitions (§11.11). �

# 22.4 Unification

To calculate solutions to constraint sets, we use the idea, due to Hindley (1969) and Milner (1978), of using unification (Robinson, 1971) to check that the set of solutions is nonempty and, if so, to find a “best” element, in the sense that all solutions can be generated straightforwardly from this one.

![](images/1dc78a2306168cde89ad830757aac3090dc8a190f0522033d582a8478a6cdd88.jpg)  
Figure 22-2: Unification algorithm

22.4.1 Definition: A substitution $\sigma$ is less specific (or more general) than a substitution $\sigma ^ { \prime }$ , written $\sigma \subseteq \sigma ^ { \prime }$ , if $\sigma ^ { \prime } = \gamma \circ \sigma$ for some substitution $\gamma$ . �

22.4.2 Definition: A principal unifier (or sometimes most general unifier) for a constraint set $C$ is a substitution $\sigma$ that satisfies $C$ and such that $\sigma \subseteq \sigma ^ { \prime }$ for every substitution $\sigma ^ { \prime }$ satisfying $C$ . �

22.4.3 Exercise $[ \star ]$ : Write down principal unifiers (when they exist) for the following sets of constraints:

$$
\begin{array} { l l } { \{ { \mathsf { X } } = { \mathsf { N a t } } , { \mathsf { Y } } = { \mathsf { X } } { \to } { \mathsf { X } } \} \quad \quad } & { \{ { \mathsf { N a t } } \to { \mathsf { N a t } } = { \mathsf { X } } { \to } { \mathsf { Y } } \} } \\ { \{ { \mathsf { X } } { \to } { \mathsf { Y } } = { \mathsf { Y } } { \to } { \mathsf { Z } } , { \mathsf { Z } } = { \mathsf { U } } { \to } { \mathsf { W } } \} \quad } & { \{ { \mathsf { N a t } } = { \mathsf { N a t } } { \to } { \mathsf { Y } } \} } \\ { \{ { \mathsf { Y } } = { \mathsf { N a t } } { \to } { \mathsf { Y } } \} \quad } & { \{ \{ \mathrm { t h e ~ e m p t y ~ s e t ~ o f ~ c o n s t r a i n t s } } \}  \end{array}
$$

22.4.4 Definition: The unification algorithm for types is defined in Figure 22-2.2

The phrase “let $\{ { \mathsf S } = { \mathsf T } \} \cup C ^ { \prime } = C ^ { \prime \prime }$ in the second line should be read as “choose a constraint ${ \mathsf { S } } { = } \mathsf { T }$ from the set $C$ and let $C ^ { \prime }$ denote the remaining constraints from $C$ .” �

The side conditions $\times \notin F V ( \top )$ in the fifth line and $\textsf { X } \notin \ F V ( \mathsf { S } )$ in the seventh are known as the occur check. Their effect is to prevent the algorithm from generating a solution involving a cyclic substitution like $\mathsf { X } \mapsto \mathsf { X } \to \mathsf { X } .$ , which makes no sense if we are talking about finite type expressions. (If we expand our language to include infinite type expressions—i.e. recursive types in the sense of Chapters 20 and 21—then the occur check can be omitted.)

22.4.5 Theorem: The algorithm unify always terminates, failing when given a nonunifiable constraint set as input and otherwise returning a principal unifier. More formally:

1. unify $( C )$ halts, either by failing or by returning a substitution, for all $C$ ;

2. if unif $\nu ( C ) = \sigma$ , then $\sigma$ is a unifier for $C$ ;

3. if $\delta$ is a unifier for $C$ , then unify $( C ) = \sigma$ with $\sigma \subseteq \delta$ .

Proof: For part (1), define the degree of a constraint set $C$ to be the pair $( m , n )$ , where $m$ is the number of distinct type variables in $C$ and $n$ is the total size of the types in $C$ . It is easy to check that each clause of the unify algorithm either terminates immediately (with success in the first case or failure in the last) or else makes a recursive call to unify with a constraint set of lexicographically smaller degree.

Part (2) is a straightforward induction on the number of recursive calls in the computation of unify $( C )$ . All the cases are trivial except for the two involving variables, which depend on the observation that, if $\sigma$ unifies $[ \mathsf { X } \mapsto$ $\mathsf { T } \mathsf { J } D$ , then $\sigma \circ [ \mathsf { X } \mapsto \mathsf { T } ]$ unifies $\{ \mathsf { X } = \mathsf { T } \} \cup D$ for any constraint set $D$ .

Part (3) again proceeds by induction on the number of recursive calls in the computation of unify $( C )$ . If $C$ is empty, then unify $( C )$ immediately returns the trivial substitution [ ]; since $\delta = \delta \circ [ ]$ , we have $[ \mathbf { \Psi } ] \subseteq \delta$ as required. If $C$ is non-empty, then unify $( C )$ chooses some pair (S, T) from $C$ and continues by cases on the shapes of S and T.

Case: ${ \mathsf { S } } = { \mathsf { T } }$

Since $\delta$ is a unifier for $C$ , it also unifies $C ^ { \prime }$ . By the induction hypothesis, unify $( C ) = \sigma$ with $\sigma \subseteq \delta$ , as required.

Case: ${ \sf S } = { \sf X }$ and $\times \notin F V ( \top )$

Since $\delta$ unifies S and $\intercal$ , we have $\delta ( \mathsf { X } ) ~ = ~ \delta ( \mathsf { T } )$ . So, for any type U, we have $\delta ( \mathsf { U } ) = \delta ( [ \mathsf { X } \mapsto \mathsf { T } ] \mathsf { U } )$ ; in particular, since $\delta$ unifies $C ^ { \prime }$ , it must also unify $[ \mathsf { X } \mapsto$ ${ \mathsf { T } } ] C ^ { \prime }$ . The induction hypothesis then tells us that unify $[ \mathsf { X } \mapsto \mathsf { T } ] \mathsf { C } ^ { \prime } ) \ = \ \sigma ^ { \prime }$ , with $\delta \ : = \ : \gamma \circ \sigma ^ { \prime }$ for some $\gamma$ . Since $u n i f y ( C ) ~ = ~ \sigma ^ { \prime } \circ [ \mathsf { X } \mapsto \mathsf { T } ]$ , showing that $\delta \ : = \ : \gamma \circ ( \sigma ^ { \prime } \circ [ \mathsf { X } \ : \mapsto \ : \mathsf { T } ] )$ will complete the argument. So consider any type variable Y. If $\textsf { Y } \neq \textsf { X }$ , then clearly $\begin{array} { r } { ( \gamma \circ ( \sigma ^ { \prime } \circ [ \mathsf { X } \mapsto \mathsf { T } ] ) ) \mathsf { Y } = ( \gamma \circ \sigma ^ { \prime } ) \mathsf { Y } = \delta \mathsf { Y } . } \end{array}$ . On the other hand, $( \gamma \circ ( \sigma ^ { \prime } \circ [ \mathsf { X } \mapsto \mathsf { T } ] ) ) \mathsf { X } = ( \gamma \circ \sigma ^ { \prime } ) \mathsf { T } = \delta \mathsf { X } ,$ , as we saw above. Combining these observations, we see that $\delta \mathsf { Y } = ( \gamma \circ ( \sigma ^ { \prime } \circ [ \mathsf { X } \mapsto \mathsf { T } ] ) ) \mathsf { Y }$ for all variables Y, that is, $\delta = ( \gamma \circ ( \sigma ^ { \prime } \circ [ \mathsf { X } \mapsto \mathsf { T } ] )$ ).

Case: ${ \mathsf { T } } = { \mathsf { X } }$ and $\textsf { X } \notin \ F V ( \mathsf { S } )$

Similar.

Case: ${ \mathsf S } = { \mathsf S } _ { 1 } { \mathsf { \{ \Sigma \Sigma \Sigma \Sigma } }  _ { 2 } \mathrm { \ a n d \ T } = { \mathsf T } _ { 1 } { \mathsf { \Sigma \Sigma } } { \mathsf { T } } _ { 2 }$

Straightforward. Just note that $\delta$ is a unifier of $\{ { \mathsf { S } } _ { 1 } { \to } { \mathsf { S } } _ { 2 } = { \mathsf { T } } _ { 1 } { \to } { \mathsf { T } } _ { 2 } \} \cup C ^ { \prime }$ iff it is a unifier of $C ^ { \prime } \cup \{ \mathsf { S } _ { 1 } = \mathsf { T } _ { 1 }$ , ${ \mathsf S } _ { 2 } = { \mathsf T } _ { 2 } \}$ .

If none of the above cases apply to S and $\intercal$ , then unify $( C )$ fails. But this can happen in only two ways: either S is Nat and $\intercal$ is an arrow type (or vice versa), or else ${ \sf S } = { \sf X }$ and $\mathsf { X } \in \mathsf { T }$ (or vice versa). The first case obviously contradicts the assumption that $C$ is unifiable. To see that the second does too, recall that, by assumption, $\delta { \sf S } = \delta { \sf T }$ ; if $\mathsf X$ occurred in T, then $\delta \mathsf { T }$ would always be strictly larger than $\delta { \sf S }$ . Thus, if unify $( C )$ fails, then $C$ is not unifiable, contradicting our assumption that $\delta$ is a unifier for $C$ ; so this case cannot occur. �

22.4.6 Exercise [Recommended, $\bigstar \bigstar \bigstar ]$ : Implement the unification algorithm.

# 22.5 Principal Types

We remarked above that if there is some way to instantiate the type variables in a term so that it becomes typable, then there is a most general or principal way of doing so. We now formalize this observation.

22.5.1 Definition: A principal solution for $( \Gamma , \ t , \ S , C )$ is a solution $( \sigma , \mathsf { T } )$ such that, whenever $( \sigma ^ { \prime } , \mathsf { T } ^ { \prime } )$ is also a solution for $( \Gamma , \ t , \ S , C )$ , we have $\sigma \subseteq \sigma ^ { \prime }$ . When $( \sigma , \mathsf { T } )$ is a principal solution, we call T a principal type of t under Γ . 3 �

22.5.2 Exercise $[ \star \ \not \to ]$ : Find a principal type for λx:X. λy:Y. λz:Z. (x z) (y z). �

22.5.3 Theorem [Principal types]: If $( \Gamma , \ t , \ S , C )$ has any solution, then it has a principal one. The unification algorithm in Figure 22-2 can be used to determine whether $( \Gamma , \ t , \ S , C )$ has a solution and, if so, to calculate a principal one. �

Proof: By the definition of a solution for $( \Gamma , \ t , \ S , C )$ and the properties of unification. �

22.5.4 Corollary: It is decidable whether $( \Gamma , \sf t )$ has a solution.

22.5.5 Exercise [Recommended, $\star \star \star \lrcorner$ : Combine the constraint generation and unification algorithms from Exercises 22.3.10 and 22.4.6 to build a typechecker that calculates principal types, taking the reconbase checker as a starting point. A typical interaction with your typechecker might look like:

λx:X. x;   
� <fun> : X → X λz:ZZ. λy:YY. z (y true);   
� <fun> : $( 7 \mathsf { X } _ { 0 } { \to } \mathsf { Z } \mathsf { X } _ { 1 } ) \to ( \mathsf { B } \mathsf { o } \mathsf { o } ] \to ? \mathsf { X } _ { 0 } ) \to ? \mathsf { X } _ { 1 }$ λw:W. if true then false else $\boldsymbol { \mathsf { W } }$ false;   
� <fun> : (Bool→Bool) → Bool

Type variables with names like $? { \sf X } _ { 0 }$ are automatically generated.

22.5.6 Exercise $[ \star \star \star ]$ : What difficulties arise in extending the definitions above (22.3.2, etc.) to deal with records? How might they be addressed? �

The idea of principal types can be used to build a type reconstruction algorithm that works more incrementally than the one we have developed here. Instead of generating all the constraints first and then trying to solve them, we can interleave generation and solving, so that the type reconstruction algorithm actually returns a principal type at each step. The fact that the types are always principal ensures that the algorithm never needs to re-analyze a subterm: it makes only the minimum commitments needed to achieve typability at each step. One major advantage of such an algorithm is that it can pinpoint errors in the user’s program much more precisely.

22.5.7 Exercise $[ \star \star \star \star ]$ : Modify your solution to Exercise 22.5.5 so that it performs unification incrementally and returns principal types. �

# 22.6 Implicit Type Annotations

Languages supporting type reconstruction typically allow programmers to completely omit type annotations on lambda-abstractions. One way to achieve this (as we remarked in §22.2) is simply to make the parser fill in omitted annotations with freshly generated type variables. A better alternative is to add un-annotated abstractions to the syntax of terms and a corresponding rule to the constraint typing relation.

$$
\begin{array} { r l } { \textsf { X } \not \in \mathcal { X } \quad } & { { } \Gamma , \textsf { x } \colon \textsf { X } \vdash \textsf { t } _ { 1 } : \textsf { T } \mid \dotsc \textsf { C } } \\ { \quad } & { { } \Gamma \vdash \lambda \mathsf { x } . \mathsf { t } _ { 1 } : \textsf { X } \longrightarrow \mathsf { T } \mid \dotsc \textsf { C } } \end{array}
$$

(CT-AbsInf)

This account of un-annotated abstractions is a bit more direct than regarding them as syntactic sugar. It is also more expressive, in a small but useful way: if we make several copies of an un-annotated abstraction, the CT-AbsInf rule will allow us to choose a different variable as the argument type of each copy. By contrast, if we regard a bare abstraction as being annotated with an invisible type variable, then making copies will yield several expressions sharing the same argument type. This difference is important for the discussion of let-polymorphism in the following section.

# 22.7 Let-Polymorphism

The term polymorphism refers to a range of language mechanisms that allow a single part of a program to be used with different types in different contexts (§23.2 discusses several varieties of polymorphism in more detail). The type reconstruction algorithm shown above can be generalized to provide a simple form of polymorphism known as let-polymorphism (also ML-style or Damas-Milner polymorphism). This feature was introduced in the original dialect of ML (Milner, 1978) and has been incorporated in a number of successful language designs, where it forms the basis of powerful generic libraries of commonly used structures (lists, arrays, trees, hash tables, streams, userinterface widgets, etc.).

The motivation for let-polymorphism arises from examples like the following. Suppose we define and use a simple function double, which applies its first argument twice in succession to its second:

let double $=$ λf:Nat→Nat. λa:Nat. f(f(a)) in double (λx:Nat. succ (succ x)) 2;

Because we want to apply double to a function of type Nat→Nat, we choose type annotations that give it type $( \mathsf { N a t {  } N a t } ) {  } ( \mathsf { N a t {  } N a t } )$ . We can alternatively define double so that it can be used to double a boolean function:

let double $=$ λf:Bool→Bool. λa:Bool. f(f(a)) in double (λx:Bool. x) false;

What we cannot do is use the same double function with both booleans and numbers: if we need both in the same program, we must define two versions that are identical except for type annotations.

let doubleNat $= \lambda \mathsf { f }$ :Nat→Nat. λa:Nat. f(f(a)) in let doubleBool $=$ λf:Bool→Bool. λa:Bool. f(f(a)) in let ${ \textbf { a } } =$ doubleNat (λx:Nat. succ (succ x)) 1 in let $\flat \ : =$ doubleBool (λx:Bool. x) false in ...

Even annotating the abstractions in double with a type variable let double $=$ λf:X→X. λa:X. f(f(a)) in ...

does not help. For example, if we write let double $\begin{array} { r l r } { \mathrm { ~ } } & { { } } & { = \mathrm { ~ } \lambda \mathsf { f } : \mathsf { X } \longrightarrow \mathsf { X } } \\ { \mathrm { ~ } } & { { } } & { = \mathrm { ~ } \lambda \mathsf { f } : \mathsf { X } \longrightarrow \mathsf { X } } \end{array}$ . λa:X. f(f(a)) in let ${ \textbf { a } } =$ double (λx:Nat. succ (succ x)) 1 in let $\flat \ : =$ double (λx:Bool. x) false in ...

then the use of double in the definition of a generates the constraint $\tt X \to \tt X =$ Nat→Nat, while the use of double in the definition of b generates the constraint $\mathsf { X { \to } X } = \mathsf { B o o l { \to } B o o l { \ell } }$ . These constraints place unsatisfiable demands on $\mathsf { X } ,$ , making the whole program untypable.

What went wrong here? The variable X plays two distinct roles in the example. First, it captures the constraint that the first argument to double in the calculation of a must be a function whose domain and range types are the same as the type (Nat) of the other argument to double. Second, it captures the constraint that the arguments to double in the calculation of b must be similarly related. Unfortunately, because the same variable X is used in both cases, we also end up with the spurious constraint that the second arguments to the two uses of double must have the same type.

What we’d like is to break this last connection—i.e., to associate a different variable X with each use of double. Fortunately, this is easily accomplished. The first step is to change the ordinary typing rule for let so that, instead of calculating a type for the right-hand side $\mathbf { t } _ { 1 }$ and then using this as the type of the bound variable $\mathbf { x }$ while calculating a type for the body $\mathbf { t } _ { 2 }$ ,

$$
\frac { \Gamma \vdash \mathbf { t } _ { 1 } : \mathsf { T } _ { 1 } \qquad \Gamma , \mathsf { x } : \mathsf { T } _ { 1 } \vdash \mathbf { t } _ { 2 } : \mathsf { T } _ { 2 } } { \Gamma \vdash \mathsf { l e t } \mathsf { x } = \mathbf { t } _ { 1 } \textsf { i n t } _ { 2 } : \mathsf { T } _ { 2 } }
$$

it instead substitutes $\mathbf { t } _ { 1 }$ for $\mathbf { x }$ in the body, and then typechecks this expanded expression:

$$
\frac { \Gamma \vdash \lbrack \mathbf { x } \mapsto \mathbf { t } _ { 1 } \rbrack \mathbf { t } _ { 2 } : \mathsf { T } _ { 2 } } { \Gamma \vdash \mathsf { l e t } \mathbf { x } = \mathbf { t } _ { 1 } \textsf { i n t } _ { 2 } : \mathsf { T } _ { 2 } }
$$

We write a constraint-typing rule for let in a similar way:

$$
\frac { \Gamma \vdash [ \mathbf { x } \vdash \mathbf { t } _ { 1 } ] \mathbf { t } _ { 2 } : \mathsf { T } _ { 2 } \vdash C } { \Gamma \vdash \mathsf { l e t } \mathbf { x } = \mathbf { t } _ { 1 } \textsf { i n t } _ { 2 } : \mathsf { T } _ { 2 } \vdash C }
$$

In essence, what we’ve done is to change the typing rules for let so that they perform a step of evaluation

$$
\mathbf { t } \ \mathbf { x } { = } { \mathbf { \mathbf { v } } } _ { 1 } \ \mathbf { i } { \mathsf { n } } \ \mathbf { t } _ { 2 } \ { \longrightarrow } \ [ \mathbf { x } \mapsto \mathbf { v } _ { 1 } ] \mathbf { t } _ { 2 }
$$

before calculating types.

The second step is to rewrite the definition of double using the implicitly annotated lambda-abstractions from §22.6.

let double $= \lambda \mathsf { f }$ . λa. f(f(a)) in let a $=$ double ( $\boldsymbol { \lambda \times }$ :Nat. succ (succ x)) 1 in let $\flat \ : =$ double (λx:Bool. x) false in ...

The combination of the constraint typing rules for let (CT-LetPoly) and the implicitly annotated lambda-abstraction (CT-AbsInf) gives us exactly what we need: CT-LetPoly makes two copies of the definition of double, and Ct-AbsInf assigns each of the abstractions a different type variable. The ordinary process of constraint solving does the rest.

However, this scheme has some flaws that need to be addressed before we can use it in practice. One obvious one is that, if we don’t happen to actually use the let-bound variable in the body of the let, then the definition will never actually be typechecked. For example, a program like

let $\times \ =$ <utter garbage> in 5

will pass the typechecker. This can be repaired by adding a premise to the typing rule

$$
\frac { \Gamma \vdash [ \mathbf { x } \vdash \mathbf { t } _ { 1 } ] \mathbf { t } _ { 2 } : \mathsf { T } _ { 2 } \quad \Gamma \vdash \mathbf { t } _ { 1 } : \mathsf { T } _ { 1 } } { \Gamma \vdash \mathsf { T e t } \mathbf { x } = \mathbf { t } _ { 1 } \textsf { i n t } _ { 2 } : \mathsf { T } _ { 2 } }
$$

(T-LetPoly)

and a corresponding premise to CT-LetPoly, ensuring that $\mathbf { t } _ { 1 }$ is well typed.

A related problem is that, if the body of the let contains many occurrences of the let-bound variable, then the whole right-hand side of the letdefinition will be checked once per occurrence, whether or not it contains any implicitly annotated lambda-abstractions. Since the right-hand side itself can contain let-bindings, this typing rule can cause the typechecker to perform an amount of work that is exponential in the size of the original term!

To avoid this re-typechecking, practical implementations of languages with let-polymorphism actually use a more clever (though formally equivalent) re-formulation of the typing rules. In outline, the typechecking of a term let $\mathsf { x } \mathsf { = t } _ { 1 }$ in $\mathbf { t } _ { 2 }$ in a context Γ proceeds as follows:

1. We use the constraint typing rules to calculate a type ${ \sf S } _ { 1 }$ and a set $C _ { 1 }$ of associated constraints for the right-hand side $\mathbf { t } _ { 1 }$ . 2. We use unification to find a most general solution $\sigma$ to the constraints $C _ { 1 }$ and apply $\sigma$ to ${ \sf S } _ { 1 }$ (and Γ ) to obtain $\mathbf { t } _ { 1 }$ ’s principal type ${ \sf T } _ { 1 }$ . 3. We generalize any variables remaining in ${ \sf T } _ { 1 }$ . If $\mathsf { X } _ { 1 } . . . \mathsf { X } _ { n }$ are the remaining variables, we write $\forall { \mathsf { X } } _ { 1 } \ldots \ldots { \mathsf { X } } _ { n } . { \mathsf { T } } _ { 1 }$ for the principal type scheme of $\mathbf { t } _ { 1 }$ .

One caveat is here that we need to be careful not to generalize variables ${ \sf T } _ { 1 }$ that are also mentioned in Γ , since these correspond to real constraints between $\ t _ { 1 }$ and its environment. For example, in

λf:X→X. λx:X. let $\scriptstyle { \mathfrak { g } } = { \mathsf { f } }$ in ${ \mathfrak { g } } ( { \boldsymbol { \mathsf { x } } } )$ ;

we should not generalize the variable X in the type $\tt X { \to } \tt X$ of $\mathfrak { g }$ , since doing so would allow us to type wrong programs like this one:

(λf:X→X. λx:X. let $\scriptstyle { \mathfrak { g } } = { \mathsf { f } }$ in ${ \mathfrak { g } } ( 0 )$ ) (λx:Bool. if $\mathbf { x }$ then true else false) true;

4. We extend the context to record the type scheme $\forall { \mathsf { X } } _ { 1 } \ldots \ldots { \mathsf { X } } _ { n } . { \mathsf { T } } _ { 1 }$ for the bound variable $\mathbf { x }$ , and start typechecking the body $\mathbf { t } _ { 2 }$ . In general, the context now associates each free variable with a type scheme, not just a type.

5. Each time we encounter an occurrence of $\mathbf { x }$ in $\mathbf { t } _ { 2 }$ , we look up its type scheme $\forall { \mathsf { X } } _ { 1 } \ldots \ldots { \mathsf { X } } _ { n } . { \mathsf { T } } _ { 1 }$ . We now generate fresh type variables $\mathsf { Y } _ { 1 } \ldots \mathsf { Y } _ { n }$ and use them to instantiate the type scheme, yielding $[ \mathsf { X } _ { 1 } \ \mapsto \ \mathsf { Y } _ { 1 }$ , . . . , ${ \sf X } _ { n } \ \mapsto$ $\mathsf { Y } _ { n } ] \mathsf { T } _ { 1 }$ , which we use as the type of $\mathbf { x }$ . 4

This algorithm is much more efficient than the simplistic approach of substituting away let expressions before typechecking. Indeed, decades of experience have shown that in practice it appears “essentially linear” in the size of the input program. It therefore came as a significant surprise when Kfoury, Tiuryn, and Urzyczyn (1990) and independently Mairson (1990) showed that its worst-case complexity is still exponential! The example they constructed involves using deeply nested sequences of lets in the right-hand sides of other lets—rather than in their bodies, where nesting of lets is common— to build expressions whose types grow exponentially larger than the expressions themselves. For example, the following OCaml program, due to Mairson (1990), is well typed but takes a very long time to typecheck.

let $\mathbf { f } _ { 0 } ~ =$ fun $\mathbf { x } ~ \to ~ ( \mathbf { x } , \mathbf { x } )$ in let $\mathsf { f } _ { 1 } \ =$ fun $\textsf { y } \to \textsf { f } _ { 0 } ( \textsf { f } _ { 0 } \ \mathsf { y } )$ in let $\mathbf { f } _ { 2 } ~ =$ fun $\mathsf { y \to f } _ { 1 } ( \mathsf { f } _ { 1 } $ y) in let $\textsf { f } _ { 3 } ~ =$ fun $\mathbf { y } ~  ~ \mathsf { f } _ { 2 } ( \mathsf { f } _ { 2 } ~ )$ y) in let $\mathsf { f } _ { 4 } \ =$ fun y → f3(f3 y) in $\begin{array} { c } { { \mathrm { l e t } ~ \mathsf { f } _ { 5 } ~ = ~ \mathsf { f u n } ~ \mathsf { y } ~ \to ~ \mathsf { f } _ { 4 } ( \mathsf { f } _ { 4 } ~ \mathsf { y } ) ~ \mathsf { i n } } } \\ { { \mathsf { f } _ { 5 } ~ ( \mathsf { f u n } ~ \mathsf { z } ~ \to ~ \mathsf { z } ) } } \end{array}$

To see why, try entering $\mathsf { f } _ { 0 } , \mathsf { f } _ { 1 }$ , etc., one at a time, into the OCaml top-level.   
See Kfoury, Tiuryn, and Urzyczyn (1994) for further discussion.

A final point worth mentioning is that, in designing full-blown programming languages with let-polymorphism, we need to be a bit careful of the interaction of polymorphism and side-effecting features such as mutable storage cells. A simple example illustrates the danger:

let r = ref (λx. x) in $\mathtt { \backslash r : = } ( \lambda \times : \mathsf { N a t }$ . succ x); (!r)true);

Using the algorithm sketched above, we calculate ${ \sf R e f } ( { \sf X } \mathrm { \to } { \sf X } )$ as the principal type of the right-hand side of the let; since $\mathsf X$ appears nowhere else, this type can be generalized to $\forall { \mathsf { X } } . { \mathsf { R e f } } ( { \mathsf { X } } { \mathsf { \to X } } )$ , and we assign this type scheme to r when we add it to the context. When typechecking the assignment in the second line, we instantiate this type to Ref(Nat→Nat). When typechecking the third line, we instantiate it to ${ \mathsf { R e f } } ( { \mathsf { B o o } } ] \to { \mathsf { B o o l } } \rangle$ ). But this is unsound, since when the term is evaluated it will end up applying succ to true.

The problem here is that the typing rules have gotten out of sync with the evaluation rules. The typing rules introduced in this section tell us that, when we see a let expression, we should immediately substitute the righthand side into the body. But the evaluation rules tell us that we may perform this substitution only after the right-hand side has been reduced to a value. The typing rules see two uses of the ref constructor, and analyze them under different assumptions, but at run time only one ref is actually allocated.

We can correct this mismatch in two ways—by adjusting evaluation or typing. In the former case, the evaluation rule for let would become5

$$
\mathsf { l e t } \ \mathbf { x } \mathbf { = } \mathbf { t } _ { 1 } \ \mathsf { i n t } _ { 2 } \ \longrightarrow \ [ \mathbf { x } \mapsto \mathbf { t } _ { 1 } ] \mathbf { t } _ { 2 }
$$

Under this strategy, the first step in evaluating our dangerous example from above would replace r by its definition, yielding

$$
\begin{array} { r l } & { \mathsf { ( r e f ~ \omega ( \lambda x . ~ \lambda x ) ) ~ \omega : = ~ ( \lambda x : N a t . ~ \mathsf { s u c c ~ \lambda x } ) ~ \mathsf { i n } ~ } } \\ & { \mathsf { ( ! ( r e f ~ \omega ( \lambda x . ~ \lambda x ) ) ) ~ \omega t r u e ; } } \end{array}
$$

which is perfectly safe! The first line creates a reference cell initially containing the identity function, and stores (λx:Nat. succ x) into it. The second creates another reference containing the identity, extracts its contents, and applies it to true. However, this calculation also demonstrates that changing the evaluation rule to fit the typing rule gives us a language with a rather strange semantics that no longer matches standard intuitions about call-byvalue evaluation order. (Imperative languages with non-CBV evaluation strategies are not unheard-of [Augustsson, 1984], but they have never become popular because of the difficulty of understanding and controlling the ordering of side effects at run time.)

It is better to change the typing rule to match the evaluation rule. Fortunately, this is easy: we just impose the restriction (often called the value restriction) that a let-binding can be treated polymorphically—i.e., its free type variables can be generalized—only if its right-hand side is a syntactic value. This means that, in the dangerous example, the type assigned to r when we add it to the context will be $\tt X \to \tt X$ , not $\forall { \mathsf { X } } . { \mathsf { X } } \to { \mathsf { X } } .$ The constraints imposed by the second line will force X to be Nat, and this will cause the typechecking of the third line to fail, since Nat cannot be unified with Bool.

The value restriction solves our problem with type safety, at some cost in expressiveness: we can no longer write programs in which the right-hand sides of let expressions can both perform some interesting computation and be assigned a polymorphic type scheme. What is surprising is that this restriction makes hardly any difference in practice. Wright (1995) settled this point by analyzing a huge corpus of code written in an ML dialect—the 1990 definition of Standard ML (Milner, Tofte, and Harper, 1990)—that provided a more flexible let-typing rule based on weak type variables and observing that all but a tiny handful of right-hand sides were syntactic values anyway. This observation more or less closed the argument, and all major languages with ML-style let-polymorphism now adopt the value restriction.

22.7.1 Exercise $[ \star \star \star \star ]$ : Implement the algorithm sketched in this section.

# 22.8 Notes

Notions of principal types for the lambda-calculus go back at least to the work of Curry in the 1950s (Curry and Feys, 1958). An algorithm for calculating principal types based on Curry’s ideas was given by Hindley (1969); similar algorithms were discovered independently by Morris (1968) and Milner (1978). In the world of propositional logic, the ideas go back still further, perhaps to Tarski in the 1920s and certainly to the Meredith cousins in the 1950s (Lemmon, Meredith, Meredith, Prior, and Thomas, 1957); their first implementation on a computer was by David Meredith in 1957. Additional historical remarks on principal types can be found in Hindley (1997).

Unification (Robinson, 1971) is fundamental to many areas of computer science. Thorough introductions can be found, for example, in Baader and Nipkow (1998), Baader and Siekmann (1994), and Lassez and Plotkin (1991).

ML-style let-polymorphism was first described by Milner (1978). A number of type reconstruction algorithms have been proposed, notably the classic Algorithm W (Damas and Milner) of Damas and Milner (1982; also see Lee and Yi, 1998). The main difference between Algorithm W and the presentation in this chapter is that the former is specialized for “pure type reconstruction”—assigning principal types to completely untyped lambdaterms—while we have mixed type checking and type reconstruction, permitting terms to include explicit type annotations that may, but need not, contain variables. This makes our technical presentation a bit more involved (especially the proof of completeness, Theorem 22.3.7, where we must be careful to keep the programmer’s type variables separate from the ones introduced by the constraint generation rules), but it meshes better with the style of the other chapters.

A classic paper by Cardelli (1987) lays out a number of implementation issues. Other expositions of type reconstruction algorithms can be found in Appel (1998), Aho et al. (1986), and Reade (1989). A particularly elegant presentation of the core system called mini-ML (Clement, Despeyroux, Despeyroux, and Kahn, 1986) often forms the basis for theoretical discussions. Tiuryn (1990) surveys a range of type reconstruction problems.

Principal types should not be confused with the similar notion of principal typings. The difference is that, when we calculate principal types, the context $\Gamma$ and term t are considered as inputs to the algorithm, while the principal type T is the output. An algorithm for calculating principal typings takes just t as input and yields both Γ and T as outputs—i.e., it calculates the minimal assumptions about the types of the free variables in t. Principal typings are useful in supporting separate compilation and “smartest recompilation,” performing incremental type inference, and pinpointing type errors. Unfortunately, many languages, in particular ML, have principal types but not principal typings. See Jim (1996).

ML-style polymorphism, with its striking combination of power and simplicity, hits a “sweet spot” in the language design space; mixing it with other sophisticated typing features has often proved quite delicate. The biggest success story in this arena is the elegant account of type reconstruction for record types proposed by Wand (1987) and further developed by Wand (1988, 1989b), Remy (1989, 1990; 1992a, 1992b, 1998), and many others. The idea is to introduce a new kind of variable, called a row variable, that ranges not over types but over entire “rows” of field labels and associated types. A simple form of equational unification is used solve constraint sets involving row variables. See Exercise 22.5.6. Garrigue (1994) and others have developed related methods for variant types. These techniques have been extended to general notions of type classes (Kaes, 1988; Wadler and Blott, 1989), constraint types (Odersky, Sulzmann, and Wehr, 1999), and qualified types (Jones, 1994b,a), which form the basis of Haskell’s system of type classes (Hall et al., 1996; Hudak et al., 1992; Thompson, 1999); similar ideas appear in Mercury (Somogyi, Henderson, and Conway, 1996) and Clean (Plasmeijer, 1998).

Type reconstruction for the more powerful form of impredicative polymorphism discussed in Chapter 23 was shown to be undecidable by Wells (1994). Indeed, several forms of partial type reconstruction for this system also turn out to be undecidable. §23.6 and $\ S 2 3 . 8$ give more information on these results and on methods for combining ML-style type reconstruction with stronger forms of polymorphism such as rank-2 polymorphism.

For the combination of subtyping with ML-style type reconstruction, some promising initial results have been reported (Aiken and Wimmers, 1993; Eifrig, Smith, and Trifonov, 1995; Jagannathan and Wright, 1995; Trifonov and Smith, 1996; Odersky, Sulzmann, and Wehr, 1999; Flanagan and Felleisen, 1997; Pottier, 1997), but practical checkers have yet to see widespread use.

Extending ML-style type reconstruction to handle recursive types (Chapter 20) has been shown not to pose significant difficulties (Huet, 1975, 1976). The only significant difference from the algorithms presented in this chapter appears in the definition of unification, where we omit the occur check (which ordinarily ensures that the substitution returned by the unification algorithm is acyclic). Having done this, to ensure termination we also need to modify the representation used by the unification algorithm so that it maintains sharing, e.g., using by destructive operations on (potentially cyclic) pointer structures. Such representations are common in high-performance implementations.

The mixture of type reconstruction with recursively defined terms, on the other hand, raises one tricky problem, known as polymorphic recursion. A simple (and unproblematic) typing rule for recursive function definitions in ML specifies that a recursive function can be used within the body of its definition only monomorphically (i.e., all recursive calls must have identically typed arguments and results), while occurrences in the rest of the program may be used polymorphically (with arguments and results of different types). Mycroft (1984) and Meertens (1983) proposed a polymorphic typing rule for recursive definitions that allows recursive calls to a recursive function from its own body to be instantiated with different types. This extension, often called the Milner-Mycroft Calculus, was shown to have an undecidable reconstruction problem by Henglein (1993) and independently by Kfoury, Tiuryn, and Urzyczyn (1993a); both of these proofs depend on the undecidability of the (unrestricted) semi-unification problem, shown by Kfoury, Tiuryn, and Urzyczyn (1993b).