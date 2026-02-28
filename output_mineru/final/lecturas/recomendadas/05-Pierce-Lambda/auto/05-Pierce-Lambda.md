# 5 The Untyped Lambda-Calculus

This chapter reviews the definition and some basic properties of the untyped or pure lambda-calculus, the underlying “computational substrate” for most of the type systems described in the rest of the book.

In the mid 1960s, Peter Landin observed that a complex programming language can be understood by formulating it as a tiny core calculus capturing the language’s essential mechanisms, together with a collection of convenient derived forms whose behavior is understood by translating them into the core (Landin 1964, 1965, 1966; also see Tennent 1981). The core language used by Landin was the lambda-calculus, a formal system invented in the 1920s by Alonzo Church (1936, 1941), in which all computation is reduced to the basic operations of function definition and application. Following Landin’s insight, as well as the pioneering work of John McCarthy on Lisp (1959, 1981), the lambda-calculus has seen widespread use in the specification of programming language features, in language design and implementation, and in the study of type systems. Its importance arises from the fact that it can be viewed simultaneously as a simple programming language in which computations can be described and as a mathematical object about which rigorous statements can be proved.

The lambda-calculus is just one of a large number of core calculi that have been used for similar purposes. The pi-calculus of Milner, Parrow, and Walker (1992, 1991) has become a popular core language for defining the semantics of message-based concurrent languages, while Abadi and Cardelli’s object calculus (1996) distills the core features of object-oriented languages. Most of the concepts and techniques that we will develop for the lambda-calculus can be transferred quite directly to these other calculi. One case study along these lines is developed in Chapter 19.

The lambda-calculus can be enriched in a variety of ways. First, it is often convenient to add special concrete syntax for features like numbers, tuples, records, etc., whose behavior can already be simulated in the core language. More interestingly, we can add more complex features such as mutable reference cells or nonlocal exception handling, which can be modeled in the core language only by using rather heavy translations. Such extensions lead eventually to languages such as ML (Gordon, Milner, and Wadsworth, 1979; Milner, Tofte, and Harper, 1990; Weis, Aponte, Laville, Mauny, and Suárez, 1989; Milner, Tofte, Harper, and MacQueen, 1997), Haskell (Hudak et al., 1992), or Scheme (Sussman and Steele, 1975; Kelsey, Clinger, and Rees, 1998). As we shall see in later chapters, extensions to the core language often involve extensions to the type system as well.

# 5.1 Basics

Procedural (or functional) abstraction is a key feature of essentially all programming languages. Instead of writing the same calculation over and over, we write a procedure or function that performs the calculation generically, in terms of one or more named parameters, and then instantiate this function as needed, providing values for the parameters in each case. For example, it is second nature for a programmer to take a long and repetitive expression like

$$
( 5 ^ { * } 4 ^ { * } 3 ^ { * } 2 ^ { * } 1 ) ~ + ~ ( 7 ^ { * } 6 ^ { * } 5 ^ { * } 4 ^ { * } 3 ^ { * } 2 ^ { * } 1 ) ~ - ~ ( 3 ^ { * } 2 ^ { * } 1 )
$$

and rewrite it as factorial(5) $^ +$ factorial(7) - factorial(3), where:

factorial(n) $=$ if $\scriptstyle \mathtt { n = 0 }$ then 1 else n \* factorial(n-1).

For each nonnegative number n, instantiating the function factorial with the argument n yields the factorial of n as result. If we write “λn. ...” as a shorthand for “the function that, for each n, yields. . .,” we can restate the definition of factorial as:

Then factorial(0) means “the function (λn. if $\scriptstyle { \mathsf { n } } = 0$ then 1 else ...) applied to the argument 0,” that is, “the value that results when the argument variable n in the function body (λn. if $\scriptstyle { \mathsf { n } } = 0$ then 1 else ...) is replaced by 0,” that is, “if $\scriptstyle 0 = 0$ then 1 else ...,” that is, 1.

The lambda-calculus (or $\lambda$ -calculus) embodies this kind of function definition and application in the purest possible form. In the lambda-calculus everything is a function: the arguments accepted by functions are themselves functions and the result returned by a function is another function.

The syntax of the lambda-calculus comprises just three sorts of terms.1 A variable $\mathbf { x }$ by itself is a term; the abstraction of a variable $\mathbf { x }$ from a term $\mathbf { t } _ { 1 }$ , written $\lambda \mathsf { x } . \mathsf { t } _ { 1 }$ , is a term; and the application of a term $\mathbf { t } _ { 1 }$ to another term $\mathbf { t } _ { 2 }$ , written $\ t _ { 1 } \ t _ { 2 }$ , is a term. These ways of forming terms are summarized in the following grammar.

<table><tr><td colspan="2">t:=</td></tr><tr><td>X</td><td>terms: variable</td></tr><tr><td>λx.t</td><td>abstraction</td></tr><tr><td>tt</td><td>application</td></tr></table>

The subsections that follow explore some fine points of this definition.

# Abstract and Concrete Syntax

When discussing the syntax of programming languages, it is useful to distinguish two levels2 of structure. The concrete syntax (or surface syntax) of the language refers to the strings of characters that programmers directly read and write. Abstract syntax is a much simpler internal representation of programs as labeled trees (called abstract syntax trees or ASTs). The tree representation renders the structure of terms immediately obvious, making it a natural fit for the complex manipulations involved in both rigorous language definitions (and proofs about them) and the internals of compilers and interpreters.

The transformation from concrete to abstract syntax takes place in two stages. First, a lexical analyzer (or lexer) converts the string of characters written by the programmer into a sequence of tokens—identifiers, keywords, constants, punctuation, etc. The lexer removes comments and deals with issues such as whitespace and capitalization conventions, and formats for numeric and string constants. Next, a parser transforms this sequence of tokens into an abstract syntax tree. During parsing, various conventions such as operator precedence and associativity reduce the need to clutter surface programs with parentheses to explicitly indicate the structure of compound expressions. For example, \* binds more tightly than $+ _ { - }$ , so the parser interprets the unparenthesized expression $^ { 1 + 2 ^ { * } 3 }$ as the abstract syntax tree to the left below rather than the one to the right:

![](images/16016c5541c5646d408cb3701f6dcb313afa3ec6da9462c83266763be394ac4d.jpg)

The focus of attention in this book is on abstract, not concrete, syntax. Grammars like the one for lambda-terms above should be understood as describing legal tree structures, not strings of tokens or characters. Of course, when we write terms in examples, definitions, theorems, and proofs, we will need to express them in a concrete, linear notation, but we always have their underlying abstract syntax trees in mind.

To save writing too many parentheses, we adopt two conventions when writing lambda-terms in linear form. First, application associates to the left— that is, s t u stands for the same tree as (s t) u:

![](images/336dd6533cb353074f7b9ea4f3cecda132179bb121dfa14a81c4cadfd739651d.jpg)

Second, the bodies of abstractions are taken to extend as far to the right as possible, so that, for example, λx. λy. x y x stands for the same tree as $\lambda \mathbf { x }$ . (λy. $( ( { \bf x } { \bf y } ) { \bf x } ) )$ :

![](images/475ee7a3809362b2bd08bc2ee5896a98f010505f20c94b7929ccd70eedba96a0.jpg)

# Variables and Metavariables

Another subtlety in the syntax definition above concerns the use of metavariables. We will continue to use the metavariable t (as well as s, and u, with or without subscripts) to stand for an arbitrary term.3 Similarly, $\mathbf { x }$ (as well as y and $\textsf { Z }$ ) stands for an arbitrary variable. Note, here, that $\mathbf { x }$ is a metavariable ranging over variables! To make matters worse, the set of short names is limited, and we will also want to use x, y, etc. as object-language variables. In such cases, however, the context will always make it clear which is which. For example, in a sentence like “The term λx. λy. x y has the form $\lambda z . s$ , where $z = \mathsf { x }$ and $\mathsf { \pmb { \mathsf { s } } } = \lambda \mathsf { y } . \mathsf { x } \mathsf { y }$ ,” the names z and s are metavariables, whereas $\mathbf { x }$ and y are object-language variables.

#

A final point we must address about the syntax of the lambda-calculus is the scopes of variables.

An occurrence of the variable $\mathbf { x }$ is said to be bound when it occurs in the body t of an abstraction $\lambda \mathbf { x }$ .t. (More precisely, it is bound by this abstraction. Equivalently, we can say that $\lambda \mathbf { x }$ is a binder whose scope is t.) An occurrence of $\mathbf { x }$ is free if it appears in a position where it is not bound by an enclosing abstraction on x. For example, the occurrences of $\mathbf { x }$ in $\textsf { x y }$ and $\lambda \mathsf { y } . \textsf { x y }$ are free, while the ones in $\lambda { \times } . { \times }$ and $\lambda z$ . λx. λy. x (y z) are bound. In $( \lambda { \bf { x } } . { \bf { x } } ) \ { \bf { x } } ,$ the first occurrence of $\mathbf { x }$ is bound and the second is free.

A term with no free variables is said to be closed; closed terms are also called combinators. The simplest combinator, called the identity function,

does nothing but return its argument.

# Operational Semantics

In its pure form, the lambda-calculus has no built-in constants or primitive operators—no numbers, arithmetic operations, conditionals, records, loops, sequencing, I/O, etc. The sole means by which terms “compute” is the application of functions to arguments (which themselves are functions). Each step in the computation consists of rewriting an application whose left-hand component is an abstraction, by substituting the right-hand component for the bound variable in the abstraction’s body. Graphically, we write

$$
( \lambda \mathbf { x } . \ \mathbf { t } _ { 1 2 } ) \ \mathbf { t } _ { 2 } \longrightarrow [ \mathbf { x } \mapsto \mathbf { t } _ { 2 } ] \mathbf { t } _ { 1 2 } ,
$$

where $[ \mathbf { x _ { \alpha } } \mapsto \mathbf { t } _ { 2 } ] \mathbf { t } _ { 1 2 }$ means “the term obtained by replacing all free occurrences of $\mathbf { x }$ in $\mathbf { t } _ { 1 2 }$ by $\mathbf { t } _ { 2 }$ .” For example, the term $( \lambda { \sf x } . { \sf x } )$ y evaluates to y and the term $( \lambda \mathbf { x } . \ x \ ( \lambda \mathbf { x } . \mathbf { x } ) ) .$ ) (u r) evaluates to u r $( \lambda { \sf x } . { \sf x } )$ . Following Church, a term of the form $( \lambda \mathbf { x } . \ \mathbf { t } _ { 1 2 } ) \ \mathbf { t } _ { 2 }$ is called a redex (“reducible expression”), and the operation of rewriting a redex according to the above rule is called beta-reduction.

Several different evaluation strategies for the lambda-calculus have been studied over the years by programming language designers and theorists. Each strategy defines which redex or redexes in a term can fire on the next step of evaluation.4

• Under full beta-reduction, any redex may be reduced at any time. At each step we pick some redex, anywhere inside the term we are evaluating, and reduce it. For example, consider the term

$$
( \lambda \mathbf { x } . \mathbf { x } ) ( ( \lambda \mathbf { x } . \mathbf { x } ) ( \lambda z . \ ( \lambda \mathbf { x } . \mathbf { x } ) \ z ) ) ,
$$

which we can write more readably as id (id (λz. id z)). This term contains three redexes:

$$
\begin{array} { l } { \displaystyle \frac { \mathrm { ~ i ~ d ~ } ( \mathrm { ~ i ~ d ~ } ( \lambda z . \mathrm { ~ } \mathrm { ~ i ~ d ~ } z ) ) } { \mathrm { ~ i ~ d ~ } ( ( \mathrm { ~ i ~ d ~ } ( \lambda z . \mathrm { ~ } \mathrm { ~ i ~ d ~ } z ) ) ) } ) } \\ { \displaystyle \mathrm { ~ i ~ d ~ } ( \mathrm { ~ i ~ d ~ } ( \lambda z . \mathrm { ~ i ~ d ~ } z ) ) } \end{array}
$$

Under full beta-reduction, we might choose, for example, to begin with the innermost redex, then do the one in the middle, then the outermost:

$$
\begin{array} { r l } & { \textrm { i d } ( \textrm { i d } ( \lambda z . \textrm { i d } z ) ) } \\ { \longrightarrow } & { \textrm { i d } ( \textrm { i d } ( \lambda z . z ) ) } \\ { \longrightarrow } & { \frac { \textrm { i d } ( \lambda z . z ) } { \lambda z . z } } \\ { \longrightarrow } & { \lambda z . z } \\ { \not  } & { } \end{array}
$$

• Under the normal order strategy, the leftmost, outermost redex is always reduced first. Under this strategy, the term above would be reduced as follows:

$$
\begin{array} { r l } & { \frac { \textnormal { i d } ( \textnormal { i d } ( \lambda z . \textnormal { i d } z ) ) } { \textnormal { i d } ( \lambda z . \textnormal { i d } z ) } } \\ { \longrightarrow } & { \frac { \textnormal { i d } ( \lambda z . \textnormal { i d } z ) } { \lambda z . \textnormal { i d } z } } \\ { \longrightarrow } & { \lambda z . z } \\ { \not  } & { } \end{array}
$$

4. Some people use the terms “reduction” and “evaluation” synonymously. Others use “evaluation” only for strategies that involve some notion of “value” and “reduction” otherwise.

Under this strategy (and the ones below), the evaluation relation is actually a partial function: each term t evaluates in one step to at most one term $\mathbf { t } ^ { \prime }$ .

• The call by name strategy is yet more restrictive, allowing no reductions inside abstractions. Starting from the same term, we would perform the first two reductions as under normal-order, but then stop before the last and regard $\lambda z$ . id $\sf { z }$ as a normal form:

$$
\begin{array} { r l } & { \xrightarrow { \textnormal { i d } ( \textnormal { i d } ( \lambda z . \textnormal { i d } z ) ) } } \\ & { \xrightarrow { \textnormal { \scriptsize { i d } } ( \lambda z . \textnormal { \cdot } \textnormal { i d } z ) } } \\ & { \xrightarrow { \textnormal { \scriptsize {  } } } } \end{array}
$$

Variants of call by name have been used in some well-known programming languages, notably Algol-60 (Naur et al., 1963) and Haskell (Hudak et al., 1992). Haskell actually uses an optimized version known as call by need (Wadsworth, 1971; Ariola et al., 1995) that, instead of re-evaluating an argument each time it is used, overwrites all occurrences of the argument with its value the first time it is evaluated, avoiding the need for subsequent re-evaluation. This strategy demands that we maintain some sharing in the run-time representation of terms—in effect, it is a reduction relation on abstract syntax graphs, rather than syntax trees.

• Most languages use a call by value strategy, in which only outermost redexes are reduced and where a redex is reduced only when its right-hand side has already been reduced to a value—a term that is finished computing and cannot be reduced any further.5 Under this strategy, our example term reduces as follows:

$$
\begin{array} { r l } & { \textrm { i d } \frac { ( \textrm { i d } ( \lambda z . \textrm { i d } z ) ) } { \textrm { d } } } \\ { \longrightarrow } & { \frac { \textrm { i d } ( \lambda z . \textrm { \ i d } z ) } { \lambda z . \textrm { \ i d } z } } \\ { \oint } & { } \end{array}
$$

The call-by-value strategy is strict, in the sense that the arguments to functions are always evaluated, whether or not they are used by the body of the function. In contrast, non-strict (or lazy) strategies such as call-by-name and call-by-need evaluate only the arguments that are actually used.

The choice of evaluation strategy actually makes little difference when discussing type systems. The issues that motivate various typing features, and the techniques used to address them, are much the same for all the strategies. In this book, we use call by value, both because it is found in most well-known languages and because it is the easiest to enrich with features such as exceptions (Chapter 14) and references (Chapter 13).

# 5.2 Programming in the Lambda-Calculus

The lambda-calculus is much more powerful than its tiny definition might suggest. In this section, we develop a number of standard examples of programming in the lambda-calculus. These examples are not intended to suggest that the lambda-calculus should be taken as a full-blown programming language in its own right—all widely used high-level languages provide clearer and more efficient ways of accomplishing the same tasks—but rather are intended as warm-up exercises to get the feel of the system.

# Multiple Arguments

To begin, observe that the lambda-calculus provides no built-in support for multi-argument functions. Of course, this would not be hard to add, but it is even easier to achieve the same effect using higher-order functions that yield functions as results. Suppose that s is a term involving two free variables $\mathbf { x }$ and y and that we want to write a function $\mathsf { f }$ that, for each pair $( \mathsf { v } , \mathsf { w } )$ of arguments, yields the result of substituting v for $\mathbf { x }$ and w for y in s. Instead of writing $\mathbf { f } = \lambda ( \mathsf { x } , \mathsf { y } ) \ldots { }$ , as we might in a richer programming language, we write $\boldsymbol { \mathsf { f } } = \lambda \boldsymbol { \mathsf { x } }$ .λy.s. That is, $\mathsf { f }$ is a function that, given a value $\vee$ for $\mathbf { x }$ , yields a function that, given a value $\boldsymbol { \mathsf { W } }$ for y, yields the desired result. We then apply $\boldsymbol { \mathsf { f } }$ to its arguments one at a time, writing $\textsf { f v } _ { \textsf { W } }$ (i.e., $( \mathsf { f } \ \mathsf { v } ) \ \mathsf { w } )$ , which reduces to ( $( \lambda \mathsf { y } . [ \mathsf { x } \mapsto \mathsf { v } ] \mathsf { s } ) \ \mathsf { w } )$ and thence to $[ \mathsf { y } \mapsto \mathsf { w } ] [ \mathsf { x } \mapsto \mathsf { v } ] \mathsf { s }$ . This transformation of multi-argument functions into higher-order functions is called currying in honor of Haskell Curry, a contemporary of Church.

# Church Booleans

Another language feature that can easily be encoded in the lambda-calculus is boolean values and conditionals. Define the terms tru and $\mathsf { f l } \mathsf { s }$ as follows:

tru $\mathbf { \lambda } = \lambda \mathbf { t }$ . λf. t;   
fls $=$ λt. λf. f;

(The abbreviated spellings of these names are intended to help avoid confusion with the primitive boolean constants true and false from Chapter 3.)

The terms tru and fls can be viewed as representing the boolean values “true” and “false,” in the sense that we can use these terms to perform the operation of testing the truth of a boolean value. In particular, we can use application to define a combinator test with the property that test b v w reduces to v when b is tru and reduces to w when b is fls.

test $\ c = \lambda 7$ . λm. λn. l m n;

The test combinator does not actually do much: test b v w just reduces to b v w. In effect, the boolean b itself is the conditional: it takes two arguments and chooses the first (if it is tru) or the second (if it is fls). For example, the term test tru v w reduces as follows:

by definition   
reducing the underlined redex reducing the underlined redex reducing the underlined redex by definition   
reducing the underlined redex reducing the underlined redex

We can also define boolean operators like logical conjunction as functions:

That is, and is a function that, given two boolean values b and c, returns c if b is tru and $\mathsf { f l } \mathsf { s }$ if b is fls; thus and b c yields tru if both b and c are tru and $\mathsf { f l } \mathsf { s }$ if either b or c is fls.

and tru tru; � (λt. λf. t) and tru fls; � (λt. λf. f)

5.2.1 Exercise $[ \star ]$ : Define logical or and not functions.

# Pairs

Using booleans, we can encode pairs of values as terms.

pair $=$ λf.λs.λb. b f s;   
fst $\mathbf { \lambda } = \lambda \mathsf { p }$ . p tru;   
snd $\mathbf { \lambda } = \lambda \mathsf { p }$ . p fls;

That is, pair v w is a function that, when applied to a boolean value b, applies b to $\mathsf { v }$ and $\boldsymbol { \mathsf { W } }$ . By the definition of booleans, this application yields v if b is tru and $\boldsymbol { \mathsf { W } }$ if $\mathsf { b }$ is $\mathsf { f l } \mathsf { s }$ , so the first and second projection functions fst and snd can be implemented simply by supplying the appropriate boolean. To check that fst (pair v w) �→∗ v, calculate as follows:

$\begin{array} { r l } & { \mathbf { \textup { \bf { f s t } } } ( \mathbf { p a } \mathbb { 1 } \mathbf { \textup { r } } \vee \mathsf { w } ) } \\ { = } & { \mathbf { \mathsf { \bf { f s t } } } ( ( \lambda \mathbb { \mathsf { f } } . \ \lambda \mathbb { s } . \ \lambda \mathbb { b } . \ \mathsf { b } \ \mathsf { f } \ \mathsf { s } ) \ \vee } \\ { \longrightarrow } & { \mathbf { \mathsf { f s t } } ( ( \lambda \mathbb { s } . \ \lambda \mathbb { b } . \ \mathsf { b } \ \vee \mathsf { s } ) \ \mathsf { w } ) } \\ { \longrightarrow } & { \mathbf { \mathsf { f s t } } ( \lambda \mathbb { b } . \ \mathsf { b } \vee \mathsf { w } ) } \\ { = } & { \frac { ( \lambda \mathbb { p } . \ \mathsf { p } \ \mathbf { t } \mathsf { r } \mathsf { u } ) \ ( \lambda \mathbb { b } . \ \mathsf { b } \ \vee \mathsf { w } ) } { ( \lambda \mathbb { b } . \ \mathsf { b } \ \vee \mathsf { w } ) \ \mathbf { t } \mathsf { r } \mathsf { u } } } \\ { \longrightarrow } & { \mathbf { \mathsf { t r u } } \mathbf { \textup { v w } } } \\ { \longrightarrow } & { \mathbf { \mathsf { v } } } \end{array}$ w) by definition reducing the underlined redex reducing the underlined redex by definition reducing the underlined redex reducing the underlined redex as before.

# Church Numerals

Representing numbers by lambda-terms is only slightly more intricate than what we have just seen. Define the Church numerals $\mathsf C _ { 0 } , \mathsf C _ { 1 } , \mathsf C _ { 2 }$ , etc., as follows:

${ \sf c } _ { 0 } ~ = ~ \lambda s$ . λz. z;   
${ \sf c } _ { 1 } ~ = ~ \lambda s$ . λz. s z;   
${ \sf c } _ { 2 } ~ = ~ \lambda s$ . λz. s (s z);   
${ \sf c } _ { 3 } ~ = ~ \lambda s$ . λz. s (s (s z));   
etc.

That is, each number $n$ is represented by a combinator ${ \mathsf { c } } _ { n }$ that takes two arguments, s and $\sf { z }$ (for “successor” and “zero”), and applies s, n times, to z. As with booleans and pairs, this encoding makes numbers into active entities: the number $n$ is represented by a function that does something $n$ times—a kind of active unary numeral.

(The reader may already have observed that ${ \mathsf C } _ { 0 }$ and $\mathsf { f l } \mathsf { s }$ are actually the same term. Similar “puns” are common in assembly languages, where the same pattern of bits may represent many different values—an int, a float, an address, four characters, etc.—depending on how it is interpreted, and in low-level languages such as C, which also identifies 0 and false.)

We can define the successor function on Church numerals as follows:

The term scc is a combinator that takes a Church numeral n and returns another Church numeral—that is, it yields a function that takes arguments s and $\textsf { Z }$ and applies s repeatedly to z. We get the right number of applications of s to $\textsf { Z }$ by first passing s and $\sf { z }$ as arguments to n, and then explicitly applying s one more time to the result.

5.2.2 Exercise $[ \star \star ]$ : Find another way to define the successor function on Church numerals.

Similarly, addition of Church numerals can be performed by a term plus that takes two Church numerals, m and n, as arguments, and yields another Church numeral—i.e., a function—that accepts arguments s and z, applies s iterated n times to $\sf { z }$ (by passing s and $\sf { z }$ as arguments to n), and then applies s iterated m more times to the result:

The implementation of multiplication uses another trick: since plus takes its arguments one at a time, applying it to just one argument n yields the function that adds n to whatever argument it is given. Passing this function as the first argument to m and ${ \mathsf { c } } _ { 0 }$ as the second argument means “apply the function that adds n to its argument, iterated m times, to zero,” i.e., “add together m copies of n.”

times $\ c = \lambda \mathfrak { m }$ . λn. m (plus n) ${ \mathsf { c } } _ { 0 }$

5.2.3 Exercise $[ \star \star ]$ : Is it possible to define multiplication on Church numerals without using plus?

5.2.4 Exercise [Recommended, $\bigstar \bigstar \bigstar \bigstar$ : Define a term for raising one number to the power of another. �

To test whether a Church numeral is zero, we must find some appropriate pair of arguments that will give us back this information—specifically, we must apply our numeral to a pair of terms zz and ss such that applying ss to zz one or more times yields fls, while not applying it at all yields tru. Clearly, we should take zz to be just tru. For ss, we use a function that throws away its argument and always returns fls:

![](images/499e42dc3ddf8d6f42213383118d2cc972a74690f7c2bf745564a9c46fedab2f.jpg)  
Figure 5-1: The predecessor function’s “inner loop”

iszro $\ c = \lambda \mathfrak { m }$ . m (λx. fls) tru; iszro $\mathsf { c } _ { 1 }$ ; � (λt. λf. f) iszro (times c0 c2); � (λt. λf. t)

Surprisingly, subtraction using Church numerals is quite a bit more difficult than addition. It can be done using the following rather tricky “predecessor function,” which, given ${ \mathsf { c } } _ { 0 }$ as argument, returns ${ \mathsf { c } } _ { 0 }$ and, given $\mathsf C i + 1$ , returns ${ \mathsf { c } } _ { i }$ :

$z z =$ pair ${ \mathsf { C } } _ { 0 } \ { \mathsf { C } } _ { 0 }$ ;   
${ \mathsf { s s } } { \mathsf { \Omega } } = { \mathsf { \Omega } } \lambda { \mathsf { p } }$ . pair (snd p) (plus $\mathsf { c } _ { 1 }$ (snd p));   
prd $\ l = \lambda \mathfrak { m }$ . fst (m ss zz);

This definition works by using m as a function to apply m copies of the function ss to the starting value zz. Each copy of ss takes a pair of numerals pair ${ \mathsf { C } } _ { i } \ { \mathsf { C } } _ { j }$ as its argument and yields pair $\mathsf { C } _ { j } \mathsf { C } _ { j + 1 }$ as its result (see Figure 5- 1). So applying ss, m times, to pair $\mathsf { C o } \mathsf { C o }$ yields pair $\mathsf { C o } \mathsf { C o }$ when $m = 0$ and pair ${ \mathsf { C } } _ { m - 1 } \ { \mathsf { C } } _ { m }$ when m is positive. In both cases, the predecessor of $\mathsf { m }$ is found in the first component.

5.2.5 Exercise $[ \star \star ]$ : Use prd to define a subtraction function.

5.2.6 Exercise $[ \star \star ]$ : Approximately how many steps of evaluation (as a function of $n$ ) are required to calculate prd $c _ { n }$ ? �

5.2.7 Exercise $[ \star \star ]$ : Write a function equal that tests two numbers for equality and returns a Church boolean. For example,

equal c3 c3; � (λt. λf. t) equal c3 c2; � (λt. λf. f)

Other common datatypes like lists, trees, arrays, and variant records can be encoded using similar techniques.

.2.8 Exercise [Recommended, $\bigstar \bigstar \bigstar ]$ : A list can be represented in the lambdacalculus by its fold function. (OCaml’s name for this function is fold_left; it is also sometimes called reduce .) For example, the list $[ \mathsf { x } , \mathsf { y } , \mathsf { z } ]$ becomes a function that takes two arguments c and n and returns ${ \mathsf { c } } \times ( { \mathsf { c } } { \mathsf { y } } ( { \mathsf { c } } { \mathsf { z } } { \mathsf { n } } ) ) )$ . What would the representation of nil be? Write a function cons that takes an element h and a list (that is, a fold function) $\mathtt { t }$ and returns a similar representation of the list formed by prepending h to t. Write isnil and head functions, each taking a list parameter. Finally, write a tail function for this representation of lists (this is quite a bit harder and requires a trick analogous to the one used to define prd for numbers). �

# Enriching the Calculus

We have seen that booleans, numbers, and the operations on them can be encoded in the pure lambda-calculus. Indeed, strictly speaking, we can do all the programming we ever need to without going outside of the pure system. However, when working with examples it is often convenient to include the primitive booleans and numbers (and possibly other data types) as well. When we need to be clear about precisely which system we are working in, we will use the symbol $\lambda$ for the pure lambda-calculus as defined in Figure 5-3 and λNB for the enriched system with booleans and arithmetic expressions from Figures 3-1 and 3-2.

In λNB, we actually have two different implementations of booleans and two of numbers to choose from when writing programs: the real ones and the encodings we’ve developed in this chapter. Of course, it is easy to convert back and forth between the two. To turn a Church boolean into a primitive boolean, we apply it to true and false:

realbool $\ c = \lambda \mathfrak { b }$ . b true false;

To go the other direction, we use an if expression:

churchbool $\ c = \lambda \mathfrak { b }$ . if b then tru else fls;

We can build these conversions into higher-level operations. Here is an equality function on Church numerals that returns a real boolean:

realeq $\ l = \lambda \mathfrak { m }$ . λn. (equal m n) true false;

In the same way, we can convert a Church numeral into the corresponding primitive number by applying it to succ and 0:

realnat $\ c = \lambda \mathfrak { m }$ . m (λx. succ x) 0;

We cannot apply m to succ directly, because succ by itself does not make syntactic sense: the way we defined the syntax of arithmetic expressions, succ must always be applied to something. We work around this by packaging succ inside a little function that does nothing but return the succ of its argument.

The reasons that primitive booleans and numbers come in handy for examples have to do primarily with evaluation order. For instance, consider the term ${ \mathsf { s c c } } \subset \mathsf { c } _ { 1 }$ . From the discussion above, we might expect that this term should evaluate to the Church numeral c2. In fact, it does not:

scc c1; � (λs. λz. s ((λs’. λz’. s’ z’) s z))

This term contains a redex that, if we were to reduce it, would bring us (in two steps) to $\mathtt { c 2 }$ , but the rules of call-by-value evaluation do not allow us to reduce it yet, since it is under a lambda-abstraction.

There is no fundamental problem here: the term that results from evaluation of ${ \mathsf { s c c } } \subset \mathsf { c } _ { 1 }$ is obviously behaviorally equivalent to ${ \mathsf { C } } _ { 2 }$ , in the sense that applying it to any pair of arguments $\mathsf { v }$ and $\boldsymbol { \mathsf { W } }$ will yield the same result as applying ${ \mathsf { c } } _ { 2 }$ to $\vee$ and w. Still, the leftover computation makes it a bit difficult to check that our scc function is behaving the way we expect it to. For more complicated arithmetic calculations, the difficulty is even worse. For example, times $\mathsf { C 2 \ C 2 }$ evaluates not to ${ \mathsf { C } } 4$ but to the following monstrosity:

times $c _ { 2 } \subset \mathbf { \mathsf { 2 } }$ ;

� (λs. $\lambda z$ . (λs’. λz’. s’ (s’ z’)) s ( $( \lambda s ^ { , }$ .

One way to check that this term behaves like ${ \mathsf { C } } 4$ is to test them for equality:

equal $\mathsf { C } _ { 4 }$ (times c2 c2);

� (λt. λf. t)

But it is more direct to take times $\mathsf { \Gamma } _ { \mathsf { C } 2 } \mathsf { \Gamma } _ { \mathsf { C } 2 }$ and convert it to a primitive number:

realnat (times ${ \sf c } _ { 2 } { \sf c } _ { 2 } )$ ;

� 4

The conversion has the effect of supplying the two extra arguments that times $\mathsf { C 2 \ C 2 }$ is waiting for, forcing all of the latent computation in its body.

# Recursion

Recall that a term that cannot take a step under the evaluation relation is called a normal form. Interestingly, some terms cannot be evaluated to a normal form. For example, the divergent combinator

$$
\mathsf { o m e g a \ = \ ( \lambda x . \lambda x \times \lambda x ) \ ( \lambda x . \lambda x \times \lambda x ) } ;
$$

contains just one redex, and reducing this redex yields exactly omega again! Terms with no normal form are said to diverge.

The omega combinator has a useful generalization called the fixed-point combinator, 6 which can be used to help define recursive functions such as factorial. 7

$$
\lambda \mathbf { f } . \ \mathbf { \lambda } ( \lambda \mathbf { x } . \textbf { \textsf { f } } \mathbf { \lambda } ( \lambda \mathbf { y } . \textbf { \textsf { x } } \times \textbf { \textsf { y } } ) ) \ \left( \lambda \mathbf { x } . \textbf { \textsf { f } } \mathbf { \lambda } ( \lambda \mathbf { y } . \textbf { \textsf { x } } \times \textbf { \textsf { y } } ) \right) ;
$$

Like omega, the fix combinator has an intricate, repetitive structure; it is difficult to understand just by reading its definition. Probably the best way of getting some intuition about its behavior is to watch how it works on a specific example.8 Suppose we want to write a recursive function definition of the form $\boldsymbol { \mathsf { h } } = \langle b o d y$ containing h�—i.e., we want to write a definition where the term on the right-hand side of the $=$ uses the very function that we are defining, as in the definition of factorial on page 52. The intention is that the recursive definition should be “unrolled” at the point where it occurs; for example, the definition of factorial would intuitively be

if $\scriptstyle \mathtt { n = 0 }$ then 1   
else n $^ { * }$ (if $\scriptstyle \mathsf { n - 1 } = 0$ then 1 else (n-1) \* (if (n-2)=0 then 1 else (n-2) \* ...))

or, in terms of Church numerals:

if realeq n ${ \mathsf { c } } _ { 0 }$ then $\mathsf { c } _ { 1 }$   
else times n (if realeq (prd n) ${ \mathsf { c } } _ { 0 }$ then $\mathsf { c } _ { 1 }$ else times (prd n) (if realeq (prd (prd n)) ${ \mathsf { c } } _ { 0 }$ then $\mathsf { c } _ { 1 }$ else times (prd (prd n)) ...))

This effect can be achieved using the fix combinator by first defining ${ \mathfrak { g } } =$ λf.�body containing $\mathsf { f } \rangle$ and then $\mathsf { h } = \mathsf { f i x } \mathsf { g } $ . For example, we can define the factorial function by

${ \mathfrak { g } } ~ = ~ \lambda { \mathsf { f } } { \mathsf { c } } { \mathsf { t } }$ . λn. if realeq n ${ \mathsf { c } } _ { 0 }$ then $\mathsf { c } _ { 1 }$ else (times n (fct (prd n)));   
factorial $=$ fix g;

Figure 5-2 shows what happens to the term factorial $\mathsf { c } _ { 3 }$ during evaluation. The key fact that makes this calculation work is that fct ${ \mathsf { n } } \longrightarrow ^ { * } { \mathsf { g } }$ fct n. That is, fct is a kind of “self-replicator” that, when applied to an argument, supplies itself and n as arguments to g. Wherever the first argument to g appears in the body of g, we will get another copy of fct, which, when applied to an argument, will again pass itself and that argument to g, etc. Each time we make a recursive call using fct, we unroll one more copy of the body of $\mathfrak { g }$ and equip it with new copies of fct that are ready to do the unrolling again.

5.2.9 Exercise $[ \star ]$ : Why did we use a primitive if in the definition of g, instead of the Church-boolean test function on Church booleans? Show how to define the factorial function in terms of test rather than if. �

5.2.10 Exercise $[ \star \star ]$ : Define a function churchnat that converts a primitive natural number into the corresponding Church numeral. �

5.2.11 Exercise [Recommended, $\bigstar \bigstar \bigstar \bigstar$ : Use fix and the encoding of lists from Exercise 5.2.8 to write a function that sums lists of Church numerals. �

factorial c3   
$=$ fix g c3 h h c3 where ${ \textsf { h } } = \lambda \mathbf { x }$ . g (λy. x x y) g fct ${ \mathsf { c } } _ { 3 }$ where fct $\mathbf { \xi } = \lambda \mathbf { y }$ . h h y (λn. if realeq n c0 then $\mathsf { c } _ { 1 }$ else times n (fct (prd n))) c3 if realeq c3 c0 then $\mathsf { c } _ { 1 }$ else times $\mathsf { c 3 }$ (fct (prd c3)) ∗ times $\mathsf { c 3 }$ (fct (prd c3))   
→∗ times $\mathsf { c } _ { 3 }$ (fct ${ \sf c } _ { 2 } ^ { \prime }$ ) where ${ \sf c } _ { 2 } ^ { \prime }$ is behaviorally equivalent to ${ \mathsf { C } } _ { 2 }$ ∗ times $\mathsf { c 3 }$ (g fct ${ \sf c } _ { 2 } ^ { \prime }$ ) ∗ times $\mathsf { c } _ { 3 }$ (times ${ \sf c } _ { 2 } ^ { \prime }$ (g fct ${ \sf c } _ { 1 } ^ { \prime } .$ )). where ${ \sf c } _ { 1 } ^ { \prime }$ is behaviorally equivalent to $\mathsf { c } _ { 1 }$ (by repeating the same calculation for g fct ${ \sf c } _ { 2 } ^ { \prime }$ ) ∗ times $\mathsf { c } _ { 3 }$ (times ${ \sf c } _ { 2 } ^ { \prime }$ (times ${ \sf c } _ { 1 } ^ { \prime }$ (g fct $\mathsf { c } _ { 0 } ^ { \prime } ) )$ )). where $\mathsf { c } _ { 0 } ^ { \prime }$ is behaviorally equivalent to ${ \mathsf { C } } _ { \mathrm { 0 } }$ (similarly) ∗ times $\mathsf { c 3 }$ (times ${ \sf c } _ { 2 } ^ { \prime }$ (times ${ \sf c } _ { 1 } ^ { \prime }$ (if realeq ${ \mathsf C } _ { 0 } ^ { \prime } { \mathsf C } _ { 0 }$ then c1 else ...)))   
→∗ times $\mathsf { c } _ { 3 }$ (times ${ \sf c } _ { 2 } ^ { \prime }$ (times ${ \mathsf C } _ { 1 } ^ { \prime } { \mathsf C } _ { 1 } )$ )   
→∗ ${ \mathsf { c } } _ { 6 } ^ { \prime }$ where ${ \sf c } _ { 6 } ^ { \prime }$ is behaviorally equivalent to ${ \mathsf { C } } _ { 6 }$ .

# Representation

Before leaving our examples behind and proceeding to the formal definition of the lambda-calculus, we should pause for one final question: What, exactly, does it mean to say that the Church numerals represent ordinary numbers?

To answer, we first need to remind ourselves of what the ordinary numbers are. There are many (equivalent) ways to define them; the one we have chosen here (in Figure 3-2) is to give:

• a constant 0,

• an operation iszero mapping numbers to booleans, and • two operations, succ and pred, mapping numbers to numbers.

The behavior of the arithmetic operations is defined by the evaluation rules in Figure 3-2. These rules tell us, for example, that 3 is the successor of 2, and that iszero 0 is true.

The Church encoding of numbers represents each of these elements as a lambda-term (i.e., a function):

• The term c0 represents the number 0. As we saw on page 64, there are also “non-canonical representations” of numbers as terms. For example, λs. λz. $( \lambda \mathbf { x } . ~ \mathbf { x } ) ~ z$ , which is behaviorally equivalent to ${ \mathsf { c } } _ { \mathrm { 0 } }$ , also represents 0.   
• The terms scc and prd represent the arithmetic operations succ and pred, in the sense that, if $\mathtt { t }$ is a representation of the number n, then scc t evaluates to a representation of ${ \mathsf n } + 1$ and prd t evaluates to a representation of n − 1 (or of 0, if $\mathsf { n }$ is 0).   
The term iszro represents the operation iszero, in the sense that, if t is a representation of 0, then iszro t evaluates to true, 9 and if t represents any number other than 0, then iszro t evaluates to false.

Putting all this together, suppose we have a whole program that does some complicated calculation with numbers to yield a boolean result. If we replace all the numbers and arithmetic operations with lambda-terms representing them and evaluate the program, we will get the same result. Thus, in terms of their effects on the overall results of programs, there is no observable difference between the real numbers and their Church-numeral representation.

# 5.3 Formalities

For the rest of the chapter, we consider the syntax and operational semantics of the lambda-calculus in more detail. Most of the structure we need is closely analogous to what we saw in Chapter 3 (to avoid repeating that structure verbatim, we address here just the pure lambda-calculus, unadorned with booleans or numbers). However, the operation of substituting a term for a variable involves some surprising subtleties.

# Syntax

As in Chapter 3, the abstract grammar defining terms (on page 53) should be read as shorthand for an inductively defined set of abstract syntax trees.

5.3.1 Definition [Terms]: Let $\mathcal { V }$ be a countable set of variable names. The set of terms is the smallest set $\mathcal { T }$ such that

1. $\mathbf { \boldsymbol { x } } \in \mathcal { T }$ for every $\mathbf { x } \in \mathcal { V }$ ;   
2. if $\mathbf { t } _ { 1 } \in \mathcal { T }$ and $\mathbf { x } \in \mathcal { V }$ , then $\lambda \mathbf { x } . \mathbf { t } _ { 1 } \in \mathcal { T }$ ;   
3. if $\mathbf { t } _ { 1 } \in \mathcal { T }$ and $\mathbf { t } _ { 2 } \in \mathcal { T }$ , then $\mathbf { t } _ { 1 } \mathbf { t } _ { 2 } \in \mathcal { T }$ .

The size of a term t can be defined exactly as we did for arithmetic expressions in Definition 3.3.2. More interestingly, we can give a simple inductive definition of the set of variables appearing free in a lambda-term.

5.3.2 Definition: The set of free variables of a term t, written $F V ( \mathfrak { t } )$ , is defined as follows:

$$
\begin{array} { l c l } { F V ( \mathbf { x } ) } & { = } & { \{ \mathbf { x } \} } \\ { F V ( \lambda \mathbf { x } . \mathbf { t } _ { 1 } ) } & { = } & { F V ( \mathbf { t } _ { 1 } ) \setminus \{ \mathbf { x } \} } \\ { F V ( \mathbf { t } _ { 1 } \ \mathbf { t } _ { 2 } ) } & { = } & { F V ( \mathbf { t } _ { 1 } ) \cup F V ( \mathbf { t } _ { 2 } ) } \end{array}
$$

5.3.3 Exercise $[ \star \star ]$ : Give a careful proof that $| F V ( \mathbf { t } ) | \le s i z e ( \mathbf { t } )$ for every term t. �

# Substitution

The operation of substitution turns out to be quite tricky, when examined in detail. In this book, we will actually use two different definitions, each optimized for a different purpose. The first, introduced in this section, is compact and intuitive, and works well for examples and in mathematical definitions and proofs. The second, developed in Chapter 6, is notationally heavier, depending on an alternative “de Bruijn presentation” of terms in which named variables are replaced by numeric indices, but is more convenient for the concrete ML implementations discussed in later chapters.

It is instructive to arrive at a definition of substitution via a couple of wrong attempts. First, let’s try the most naive possible recursive definition. (Formally, we are defining a function $[ \mathsf { x } \mapsto \mathsf { s } ]$ by induction over its argument t.)

$$
{ \begin{array} { l l l l } { [ \mathbf { x } \mapsto \mathbf { s } ] \mathbf { x } } & { = } & { \mathbf { s } } \\ { [ \mathbf { x } \mapsto \mathbf { s } ] \mathbf { y } } & { = } & { \mathbf { y } } & { { \mathrm { i f ~ } } \mathbf { x } \neq \mathbf { y } } \\ { [ \mathbf { x } \mapsto \mathbf { s } ] ( \lambda \mathbf { y } . \mathbf { t } _ { 1 } ) } & { = } & { \lambda \mathbf { y } . \ [ \mathbf { x } \mapsto \mathbf { s } ] \mathbf { t } _ { 1 } } \\ { [ \mathbf { x } \mapsto \mathbf { s } ] ( \mathbf { t } _ { 1 } \ \mathbf { t } _ { 2 } ) } & { = } & { ( [ \mathbf { x } \mapsto \mathbf { s } ] \mathbf { t } _ { 1 } ) \ ( [ \mathbf { x } \mapsto \mathbf { s } ] \mathbf { t } _ { 2 } ) } \end{array} }
$$

This definition works fine for most examples. For instance, it gives

$$
\left[ \mathbf { x } \mapsto \left( \lambda z . \ z w \right) \right] \left( \lambda \mathbf { y } . \mathbf { x } \right) = \lambda \mathbf { y } . \lambda z . \ z \mathsf { w } ,
$$

which matches our intuitions about how substitution should behave. However, if we are unlucky with our choice of bound variable names, the definition breaks down. For example:

$$
[ { \pmb x } \mapsto { \pmb y } ] ( \lambda { \pmb x } . { \pmb x } ) = \lambda { \pmb x } . { \pmb y }
$$

This conflicts with the basic intuition about functional abstractions that the names of bound variables do not matter—the identity function is exactly the same whether we write it $\lambda { \times } . { \times }$ or λy.y or λfranz.franz. If these do not behave exactly the same under substitution, then they will not behave the same under reduction either, which seems wrong.

Clearly, the first mistake that we’ve made in the naive definition of substitution is that we have not distinguished between free occurrences of a variable $\mathbf { x }$ in a term t (which should get replaced during substitution) and bound ones, which should not. When we reach an abstraction binding the name $\mathbf { x }$ inside of $\mathtt { t }$ , the substitution operation should stop. This leads to the next attempt:

$$
 \begin{array} { l c l l } { [ \mathbf { x } \mapsto { \mathsf { s } } ] \mathbf { x } } & { = } & { { \mathsf { s } } } & { } \\ { [ \mathbf { x } \mapsto { \mathsf { s } } ] \mathbf { y } } & { = } & { \mathbf { y } } & { { \mathrm { i f ~ } } \mathbf { y } \neq \mathbf { x } } \\ { [ \mathbf { x } \mapsto { \mathsf { s } } ] ( \lambda \mathbf { y } . \mathbf { t } _ { 1 } ) } & { = } & { \left\{ \lambda \mathbf { y } . \ \mathbf { t } _ { 1 } \right. } & { } \\ { \qquad \left. \left\{ \lambda \mathbf { y } . \ [ \mathbf { x } \mapsto { \mathsf { s } } ] \mathbf { t } _ { 1 } \right. \right. } & { } & { { \mathrm { i f ~ } } \mathbf { y } \neq \mathbf { x } } \\ { \mathbf { \left[ \mathbf { x } \mapsto { \mathsf { s } } ] ( \mathbf { t } _ { 1 } \ \mathbf { t } _ { 2 } ) \right.} & { = } & { ( [ \mathbf { x } \mapsto { \mathsf { s } } ] \mathbf { t } _ { 1 } ) \ ( [ \mathbf { x } \mapsto { \mathsf { s } } ] \mathbf { t } _ { 2 } ) } & { } \end{array}  }
$$

This is better, but still not quite right. For example, consider what happens when we substitute the term $\sf { z }$ for the variable $\mathbf { x }$ in the term $\lambda z . \times$ :

$$
[ { \pmb x } \mapsto { \pmb z } ] ( \lambda { \pmb z } . { \pmb x } ) = \lambda { \pmb z } . { \pmb z }
$$

This time, we have made essentially the opposite mistake: we’ve turned the constant function $\lambda z . \times$ into the identity function! Again, this occurred only because we happened to choose z as the name of the bound variable in the constant function, so something is clearly still wrong.

This phenomenon of free variables in a term s becoming bound when s is naively substituted into a term t is called variable capture. To avoid it, we need to make sure that the bound variable names of t are kept distinct from the free variable names of s. A substitution operation that does this correctly is called capture-avoiding substitution. (This is almost always what is meant by the unqualified term “substitution.”) We can achieve the desired effect by adding another side condition to the second clause of the abstraction case:

$$
{ \begin{array} { l l l l } { [ \mathbf { x } \mapsto { \mathsf { s } } ] \mathbf { x } } & { = } & { { \mathsf { s } } } & { } \\ { [ \mathbf { x } \mapsto { \mathsf { s } } ] { \mathsf { y } } } & { = } & { { \mathsf { y } } } & { { \mathrm { i f ~ } } \mathsf { y } \neq \mathbf { x } } \\ { [ \mathbf { x } \mapsto { \mathsf { s } } ] ( \lambda \mathsf { y } . \mathbf { t } _ { 1 } ) } & { = } & {  \{ \lambda \mathsf { y } . ~ \mathbf { t } _ { 1 }  } & { { \mathrm { i f ~ } } \mathsf { y } = \mathbf { x } } \\ { \mathbf { \Delta } [ \mathbf { \mathsf { x } } \mapsto { \mathsf { s } } ] ( \mathbf { t } _ { 1 } ~ \mathbf { t } _ { 2 } ) } & { = } & { ( [ \mathbf { x } \mapsto { \mathsf { s } } ] \mathbf { t } _ { 1 } ~ ( [ \mathbf { x } \mapsto { \mathsf { s } } ] \mathbf { t } _ { 2 } )  } & { } \end{array} }
$$

Now we are almost there: this definition of substitution does the right thing when it does anything at all. The problem now is that our last fix has changed substitution into a partial operation. For example, the new definition does not give any result at all for $[ \mathsf { x } \mapsto \mathsf { y } \mathsf { z } ] ( \lambda \mathsf { y } . \mathsf { x } \mathsf { y } )$ : the bound variable y of the term being substituted into is not equal to $\mathbf { x }$ , but it does appear free in (y z), so none of the clauses of the definition apply.

One common fix for this last problem in the type systems and lambdacalculus literature is to work with terms “up to renaming of bound variables.” (Church used the term alpha-conversion for the operation of consistently renaming a bound variable in a term. This terminology is still common— we could just as well say that we are working with terms “up to alphaconversion.”)

5.3.4 Convention: Terms that differ only in the names of bound variables are interchangeable in all contexts.

What this means in practice is that the name of any $\lambda$ -bound variable can be changed to another name (consistently making the same change in the body of the $\lambda$ ), at any point where this is convenient. For example, if we want to calculate $[ \mathsf { x } \mapsto \mathsf { y } \mathsf { z } ] ( \lambda \mathsf { y } . \mathsf { x } \mathsf { y } )$ , we first rewrite $( \lambda \mathsf { y } . \textsf { x y } )$ as, say, $( \lambda w . \textsf { x w } )$ . We then calculate $[ \textsf { x } \mapsto \textsf { y } z ] ( \lambda \textsf { w } . \textsf { x } \textsf { w } )$ , giving $( \lambda \mathfrak { w } . \ y z \mathfrak { w } )$ .

This convention renders the substitution operation “as good as total,” since whenever we find ourselves about to apply it to arguments for which it is undefined, we can rename as necessary, so that the side conditions are satisfied. Indeed, having adopted this convention, we can formulate the definition of substitution a little more tersely. The first clause for abstractions can be dropped, since we can always assume (renaming if necessary) that the bound variable y is different from both $\mathbf { x }$ and the free variables of s. This yields the final form of the definition.

5.3.5 Definition [Substitution]:

$$
{ \begin{array} { l l l l } { [ \mathbf { x } \mapsto \mathbf { 5 } ] \mathbf { x } } & { = } & { \mathbf { 5 } } \\ { [ \mathbf { x } \mapsto \mathbf { 5 } ] \mathbf { y } } & { = } & { \mathbf { y } } & { { \mathrm { i f ~ } } \mathbf { y } \neq \mathbf { x } } \\ { [ \mathbf { x } \mapsto \mathbf { 5 } ] ( \lambda \mathbf { y } . \mathbf { t } _ { 1 } ) } & { = } & { \lambda \mathbf { y } . \ [ \mathbf { x } \mapsto \mathbf { 5 } ] \mathbf { t } _ { 1 } } & { { \mathrm { i f ~ } } \mathbf { y } \neq \mathbf { x } { \mathrm { ~ a n d ~ } } \mathbf { y } \notin F V ( \mathbf { s } ) } \\ { [ \mathbf { x } \mapsto \mathbf { 5 } ] ( \mathbf { t } _ { 1 } ~ \mathbf { t } _ { 2 } ) } & { = } & { [ \mathbf { x } \mapsto \mathbf { 5 } ] \mathbf { t } _ { 1 } \ [ \mathbf { x } \mapsto \mathbf { 5 } ] \mathbf { t } _ { 2 } } \end{array} }
$$

![](images/f8209163fde7d86427b1688b3d75e3cad653ef1120a6582fc8e6a058d494f9c6.jpg)  
Figure 5-3: Untyped lambda-calculus (λ)

# Operational Semantics

The operational semantics of lambda-terms is summarized in Figure 5-3. The set of values here is more interesting than we saw in the case of arithmetic expressions. Since (call-by-value) evaluation stops when it reaches a lambda, values can be arbitrary lambda-terms.

The evaluation relation appears in the right-hand column of the figure. As in evaluation for arithmetic expressions, there are two sorts of rules: the computation rule E-AppAbs and the congruence rules E-App1 and E-App2.

Notice how the choice of metavariables in these rules helps control the order of evaluation. Since $\mathsf { v } _ { 2 }$ ranges only over values, the left-hand side of rule E-AppAbs can match any application whose right-hand side is a value. Similarly, rule E-App1 applies to any application whose left-hand side is not a value, since $\mathbf { t } _ { 1 }$ can match any term whatsoever, but the premise further requires that $\mathbf { t } _ { 1 }$ can take a step. E-App2, on the other hand, cannot fire until the left-hand side is a value so that it can be bound to the value-metavariable v. Taken together, these rules completely determine the order of evaluation for an application $\ t _ { 1 } \ t _ { 2 }$ : we first use E-App1 to reduce $\mathbf { t } _ { 1 }$ to a value, then use E-App2 to reduce $\mathbf { t } _ { 2 }$ to a value, and finally use E-AppAbs to perform the application itself.

5.3.6 Exercise $[ \star \star ]$ : Adapt these rules to describe the other three strategies for evaluation—full beta-reduction, normal-order, and lazy evaluation. �

Note that, in the pure lambda-calculus, lambda-abstractions are the only possible values, so if we reach a state where E-App1 has succeeded in reducing $\mathbf { t } _ { 1 }$ to a value, then this value must be a lambda-abstraction. This observation fails, of course, when we add other constructs such as primitive booleans to the language, since these introduce forms of values other than abstractions.

5.3.7 Exercise $[ \star \star \ \nrightarrow ]$ : Exercise 3.5.16 gave an alternative presentation of the operational semantics of booleans and arithmetic expressions in which stuck terms are defined to evaluate to a special constant wrong. Extend this semantics to λNB. �

5.3.8 Exercise $[ \star \star ]$ : Exercise 4.2.2 introduced a “big-step” style of evaluation for arithmetic expressions, where the basic evaluation relation is “term t evaluates to final result v.” Show how to formulate the evaluation rules for lambdaterms in the big-step style. �

# 5.4 Notes

The untyped lambda-calculus was developed by Church and his co-workers in the 1920s and ’30s (Church, 1941). The standard text for all aspects of the untyped lambda-calculus is Barendregt (1984); Hindley and Seldin (1986) is less comprehensive, but more accessible. Barendregt’s article (1990) in the Handbook of Theoretical Computer Science is a compact survey. Material on lambda-calculus can also be found in many textbooks on functional programming languages (e.g. Abelson and Sussman, 1985; Friedman, Wand, and Haynes, 2001; Peyton Jones and Lester, 1992) and programming language semantics (e.g. Schmidt, 1986; Gunter, 1992; Winskel, 1993; Mitchell, 1996). A systematic method for encoding a wide variety of data structures as lambdaterms can be found in Böhm and Berarducci (1985).

Despite its name, Curry denied inventing the idea of currying. It is commonly credited to Schönfinkel (1924), but the underlying idea was familiar to a number of 19th-century mathematicians, including Frege and Cantor.

There may, indeed, be other applications of the system than its use as a logic. —Alonzo Church, 1932 long and tricky computation might even diverge, and any typechecker that tries to predict its outcome precisely will then diverge as well.

To extend the type system for booleans to include functions, we clearly need to add a type classifying terms whose evaluation results in a function. As a first approximation, let’s call this type →. If we add a typing rule

giving every $\lambda$ -abstraction the type , we can classify both simple terms like $\lambda { \times } . { \times }$ and compound terms like if true then (λx.true) else $( \lambda \mathsf { x } . \lambda \mathsf { y } . \mathsf { y } )$ as yielding functions.

But this rough analysis is clearly too conservative: functions like λx.true and $\lambda { \times } . \lambda { \bf y } . { \bf y }$ are lumped together in the same type , ignoring the fact that applying the first to true yields a boolean, while applying the second to true yields another function. In general, in order to give a useful type to the result of an application, we need to know more about the left-hand side than just that it is a function: we need to know what type the function returns. Moreover, in order to be sure that the function will behave correctly when it is called, we need to keep track of what type of arguments it expects. To keep track of this information, we replace the bare type by an infinite family of types of the form ${ \mathsf { T } } _ { 1 } \to { \mathsf { T } } _ { 2 }$ , each classifying functions that expect arguments of type ${ \sf T } _ { 1 }$ and return results of type ${ \sf T } _ { 2 }$ .

9.1.1 Definition: The set of simple types over the type Bool is generated by the following grammar:

T ::= Bool T→T

types: type of booleans type of functions

The type constructor is right-associative—that is, the expression ${ \bar { \mathsf { T } } } _ { 1 } { \to } { \mathsf { T } } _ { 2 } { \to } { \mathsf { T } } _ { 3 }$ stands for ${ \mathsf { T } } _ { 1 } \to ( { \mathsf { T } } _ { 2 } \to { \mathsf { T } } _ { 3 } )$ . �

For example Bool→Bool is the type of functions mapping boolean arguments to boolean results. $( 8 0 0 7 \to 8 0 0 7 ) \to ( 8 0 0 7 \to 8 0 0 7 ) \mathop { \longrightarrow } 0 \mathrm { r }$ , equivalently, $( \mathsf { B o o l } \to \mathsf { B o o } 7 ) \to \mathsf { B o o } 7 \to \mathsf { B o o } 7$ —is the type of functions that take boolean-toboolean functions as arguments and return them as results.

# 9.2 The Typing Relation

In order to assign a type to an abstraction like λx.t, we need to calculate what will happen when the abstraction is applied to some argument. The next question that arises is: how do we know what type of arguments to expect? There are two possible responses: either we can simply annotate the $\lambda$ -abstraction with the intended type of its arguments, or else we can analyze the body of the abstraction to see how the argument is used and try to deduce, from this, what type it should have. For now, we choose the first alternative. Instead of just λx.t, we will write $\lambda \mathbf { x } { : } \mathsf { T } _ { 1 } . \mathsf { t } _ { 2 }$ , where the annotation on the bound variable tells us to assume that the argument will be of type ${ \sf T } _ { 1 }$ .

In general, languages in which type annotations in terms are used to help guide the typechecker are called explicitly typed. Languages in which we ask the typechecker to infer or reconstruct this information are called implicitly typed. (In the $\lambda$ -calculus literature, the term type-assignment systems is also used.) Most of this book will concentrate on explicitly typed languages; implicit typing is explored in Chapter 22.

Once we know the type of the argument to the abstraction, it is clear that the type of the function’s result will be just the type of the body $\mathbf { t } _ { 2 }$ , where occurrences of $\mathbf { x }$ in $\mathbf { t } _ { 2 }$ are assumed to denote terms of type ${ \sf T } _ { 1 }$ . This intuition is captured by the following typing rule:

$$
\begin{array} { c } { \displaystyle { \frac { \mathbf { x } : \mathsf { T } _ { 1 } \vdash \mathbf { t } _ { 2 } : \mathsf { T } _ { 2 } } { \vdash \lambda \mathbf { x } : \mathsf { T } _ { 1 } \ldots \mathbf { t } _ { 2 } : \mathsf { T } _ { 1 }  \mathsf { T } _ { 2 } } } } \end{array}
$$

Since terms may contain nested $\lambda$ -abstractions, we will need, in general, to talk about several such assumptions. This changes the typing relation from a two-place relation, $\texttt { t : T }$ , to a three-place relation, $\Gamma \vdash \mathtt { t } : \top$ , where $\Gamma$ is a set of assumptions about the types of the free variables in t.

Formally, a typing context (also called a type environment) $\Gamma$ is a sequence of variables and their types, and the “comma” operator extends Γ by adding a new binding on the right. The empty context is sometimes written $\emptyset$ , but usually we just omit it, writing $\vdash \mathtt { t } : \top$ for “The closed term t has type T under the empty set of assumptions.”

To avoid confusion between the new binding and any bindings that may already appear in Γ , we require that the name x be chosen so that it is distinct from the variables bound by Γ . Since our convention is that variables bound by $\lambda$ -abstractions may be renamed whenever convenient, this condition can always be satisfied by renaming the bound variable if necessary. Γ can thus be thought of as a finite function from variables to their types. Following this intuition, we write $d o m ( \Gamma )$ for the set of variables bound by Γ .

The rule for typing abstractions has the general form

$$
\frac { \Gamma , \mathsf { x } : \mathsf { T } _ { 1 } \vdash \mathsf { t } _ { 2 } : \mathsf { T } _ { 2 } } { \Gamma \vdash \lambda \mathsf { x } : \mathsf { T } _ { 1 } \ldots \mathsf { t } _ { 2 } : \mathsf { T } _ { 1 }  \mathsf { T } _ { 2 } }
$$

where the premise adds one more assumption to those in the conclusion.

The typing rule for variables also follows immediately from this discussion: a variable has whatever type we are currently assuming it to have.

$$
\frac { \mathbf { x } : \mathsf { T } \in \Gamma } { \Gamma \vdash \mathbf { x } : \mathsf { T } }
$$

he premise $\mathbf { \boldsymbol { x } } : \mathsf { T } \in \Gamma$ is read “The type assumed for $\mathbf { x }$ in $\Gamma$ is $\intercal$ .”

Finally, we need a typing rule for applications.

$$
\frac { \Gamma \vdash \mathbf { t } _ { 1 } : \mathbf { \mathsf { T } } _ { 1 1 } \lnot \mathbf { T } _ { 1 2 } \qquad \Gamma \vdash \mathbf { t } _ { 2 } : \mathbf { \mathsf { T } } _ { 1 1 } } { \Gamma \vdash \mathbf { t } _ { 1 } \mathbf { t } _ { 2 } : \mathbf { \mathsf { T } } _ { 1 2 } }
$$

If $\mathbf { t } _ { 1 }$ evaluates to a function mapping arguments in ${ \sf T } _ { 1 1 }$ to results in ${ \sf T } _ { 1 2 }$ (under the assumption that the values represented by its free variables have the types assumed for them in Γ ), and if $\mathbf { t } _ { 2 }$ evaluates to a result in ${ \sf T } _ { 1 1 }$ , then the result of applying $\mathbf { t } _ { 1 }$ to $\mathbf { t } _ { 2 }$ will be a value of type ${ \mathsf T } _ { 1 2 }$ .

The typing rules for the boolean constants and conditional expressions are the same as before (Figure 8-1). Note, though, that the metavariable $\intercal$ in the rule for conditionals

$$
\frac { \Gamma \vdash \mathbf { t } _ { 1 } : \mathsf { B o o l } \quad \Gamma \vdash \mathbf { t } _ { 2 } : \mathsf { T } \quad \Gamma \vdash \mathbf { t } _ { 3 } : \mathsf { T } } { \Gamma \vdash \mathbf { i } \mathsf { f } \mathbf { t } _ { 1 } \ : \mathbf { t h e n } \ : \mathbf { t } _ { 2 } \ : \mathbf { e } \mathsf { l } s \mathbf { e } \ : \mathbf { t } _ { 3 } : \mathsf { T } }
$$

can now be instantiated to any function type, allowing us to type conditionals whose branches are functions:1

if true then (λx:Bool. x) else (λx:Bool. not x); � (λx:Bool. x) : Bool → Bool

These typing rules are summarized in Figure 9-1 (along with the syntax and evaluation rules, for the sake of completeness). The highlighted regions in the figure indicate material that is new with respect to the untyped lambdacalculus—both new rules and new bits added to old rules. As we did with booleans and numbers, we have split the definition of the full calculus into two pieces: the pure simply typed lambda-calculus with no base types at all, shown in this figure, and a separate set of rules for booleans, which we have already seen in Figure 8-1 (we must add a context Γ to every typing statement in that figure, of course).

We often use the symbol $\lambda _ {  }$ to refer to the simply typed lambda-calculus (we use the same symbol for systems with different sets of base types).

9.2.1 Exercise $[ \star ]$ : The pure simply typed lambda-calculus with no base types is actually degenerate, in the sense that it has no well-typed terms at all. Why? �

Instances of the typing rules for $\lambda _ {  }$ can be combined into derivation trees, just as we did for typed arithmetic expressions. For example, here is a derivation demonstrating that the term $( \lambda \mathbf { x } : \mathsf { B o o l } . \mathbf { x } )$ true has type Bool in the empty context.

<table><tr><td colspan="5">→ (typed) Based on λ (5-3)</td></tr><tr><td colspan="3"> Syntax</td><td>Evaluation</td><td>t-t</td></tr><tr><td colspan="2">t:=</td><td>terms:</td><td></td><td></td></tr><tr><td rowspan="4"></td><td>X</td><td>variable</td><td>t-ti</td><td>(E-APP1)</td></tr><tr><td>λx :T.t</td><td>abstraction</td><td>t1t2→t t2</td><td></td></tr><tr><td>tt</td><td>application</td><td>t2-t</td><td>(E-APP2)</td></tr><tr><td>Ax :T.t</td><td>values: abstraction value</td><td>v1 t2 → V1 t2 (λx:T11 .t12) V2 → [X → V2]t12 (E-APPABS)</td><td></td></tr><tr><td>T</td><td>:=</td><td>types:</td><td>Typing</td><td>r-t : T</td></tr><tr><td rowspan="4">T</td><td>T-T</td><td>type of functions</td><td>x:T∈Γ Γ-x: T</td><td>(T-VAR)</td></tr><tr><td>:=</td><td>contexts:</td><td></td><td></td></tr><tr><td>@</td><td>empty context</td><td>Γ,x:T1 - t2 : T2 Γ - λx:T1.t2 : T1→T2</td><td>(T-ABS)</td></tr><tr><td>T, x:T</td><td>term variable binding</td><td></td><td></td></tr><tr><td></td><td></td><td></td><td>Γ ├ t1 : T11→T12 T ├ t2 : T11 Γ ├ t1 t2 : T12</td><td>(T-APP)</td></tr></table>

9.2.2 Exercise $[ \star \ \not \to ]$ : Show (by drawing derivation trees) that the following terms have the indicated types:

1. f:Bool→Bool � f (if false then true else false) : Bool   
2. f:Bool→Bool � λx:Bool. f (if x then false else x) : Bool→Bool �

9.2.3 Exercise $[ \star ]$ : Find a context Γ under which the term f x y has type Bool. Can you give a simple description of the set of all such contexts? �

# 9.3 Properties of Typing

As in Chapter 8, we need to develop a few basic lemmas before we can prove type safety. Most of these are similar to what we saw before—we just need to add contexts to the typing relation and add clauses to each proof for $\lambda$ - abstractions, applications, and variables. The only significant new requirement is a substitution lemma for the typing relation (Lemma 9.3.8).

First off, an inversion lemma records a collection of observations about how typing derivations are built: the clause for each syntactic form tells us “if a term of this form is well typed, then its subterms must have types of these forms. . .”

9.3.1 Lemma [Inversion of the typing relation]:

1. If $\Gamma \vdash \textsf { x } : \textsf { R }$ , then $\mathsf { x } : \mathsf { R } \in \Gamma$ .

2. If $\Gamma \vdash \lambda \mathbf { x } : \mathsf { T } _ { 1 } \ldots \mathbf { t } _ { 2 } : \mathsf { R } .$ , then $\mathsf { R } = \mathsf { T } _ { 1 } \to \mathsf { R } _ { 2 }$ for some ${ \mathsf { R } } _ { 2 }$ with Γ , $\mathbf { x } \colon \mathsf { T } _ { 1 } \vdash \mathbf { t } _ { 2 } : \mathsf { R } _ { 2 }$ .

3. If $\Gamma \vdash \ t _ { 1 } \ t _ { 2 } : \mathsf { R }$ , then there is some type ${ \sf T } _ { 1 1 }$ such that $\Gamma \vdash \mathbf { t } _ { 1 } : \mathsf { T } _ { 1 1 } \lnot \mathsf { R }$ and $\Gamma \vdash \ t _ { 2 } : \top _ { 1 1 }$ .

4. If $\Gamma \vdash \mathtt { t r u e } : \mathbb { R }$ , then $\mathsf { R } = \mathsf { B o o l }$ .

5. If $\Gamma \vdash$ false : R, then $\mathsf { R } = \mathsf { B o o l }$ .

6. If $\Gamma \vdash \mathsf { i f } \mathsf { t } _ { 1 }$ then $\mathbf { t } _ { 2 }$ else $\mathtt { t } _ { 3 } : \mathtt { R } .$ , then $\Gamma \vdash \mathtt { t } _ { 1 }$ : Bool and $\Gamma \vdash \mathtt { t } _ { 2 } , \mathtt { t } _ { 3 } : \mathtt { R }$ . �

Proof: Immediate from the definition of the typing relation.

9.3.2 Exercise [Recommended, $\bigstar \bigstar \bigstar ]$ : Is there any context Γ and type $\intercal$ such that $\Gamma \vdash \textsf { x x : } \top ?$ If so, give $\Gamma$ and $\intercal$ and show a typing derivation for $\Gamma \vdash \mathbf { x } \mathbf { x } : \mathsf { T }$ ; if not, prove it. �

In $\ S 9 . 2$ , we chose an explicitly typed presentation of the calculus to simplify the job of typechecking. This involved adding type annotations to bound variables in function abstractions, but nowhere else. In what sense is this “enough”? One answer is provided by the “uniqueness of types” theorem, which tells us that well-typed terms are in one-to-one correspondence with their typing derivations: the typing derivation can be recovered uniquely from the term (and, of course, vice versa). In fact, the correspondence is so straightforward that, in a sense, there is little difference between the term and the derivation.

9.3.3 Theorem [Uniqueness of Types]: In a given typing context Γ , a term t (with free variables all in the domain of Γ ) has at most one type. That is, if a term is typable, then its type is unique. Moreover, there is just one derivation of this typing built from the inference rules that generate the typing relation. �

Proof: Exercise. The proof is actually so direct that there is almost nothing to say; but writing out some of the details is good practice in “setting up” proofs about the typing relation.

For many of the type systems that we will see later in the book, this simple correspondence between terms and derivations will not hold: a single term will be assigned many types, and each of these will be justified by many typing derivations. In these systems, there will often be significant work involved in showing that typing derivations can be recovered effectively from terms.

Next, a canonical forms lemma tells us the possible shapes of values of various types.

9.3.4 Lemma [Canonical Forms]:

1. If v is a value of type Bool, then v is either true or false.

2. If v is a value of type ${ \mathsf { T } } _ { 1 } \to { \mathsf { T } } _ { 2 }$ , then $\mathsf { v } = \lambda \mathsf { x } \colon \mathsf { T } _ { 1 } . \mathsf { t } _ { 2 }$

Proof: Straightforward. (Similar to the proof of the canonical forms lemma for arithmetic expressions, 8.3.1.)

Using the canonical forms lemma, we can prove a progress theorem analogous to Theorem 8.3.2. The statement of the theorem needs one small change: we are interested only in closed terms, with no free variables. For open terms, the progress theorem actually fails: a term like f true is a normal form, but not a value. However, this failure does not represent a defect in the language, since complete programs—which are the terms we actually care about evaluating—are always closed.

9.3.5 Theorem [Progress]: Suppose t is a closed, well-typed term (that is, � t : T for some T). Then either t is a value or else there is some $\mathbf { t } ^ { \prime }$ with $\mathbf { t } \longrightarrow \mathbf { t } ^ { \prime }$ . �

Proof: Straightforward induction on typing derivations. The cases for boolean constants and conditions are exactly the same as in the proof of progress for typed arithmetic expressions (8.3.2). The variable case cannot occur (because t is closed). The abstraction case is immediate, since abstractions are values.

The only interesting case is the one for application, where $\mathbf { t } = \mathbf { t } _ { 1 } \mathbf { t } _ { 2 }$ with $\vdash \mathbf { t } _ { 1 } : \mathsf { T } _ { 1 1 } \to \mathsf { T } _ { 1 2 }$ and $\vdash \mathtt { t } _ { 2 } : \mathtt { T } _ { 1 1 }$ . By the induction hypothesis, either $\mathbf { t } _ { 1 }$ is a value or else it can make a step of evaluation, and likewise $\scriptstyle \mathbf { t } _ { 2 } ,$ . If $\mathbf { t } _ { 1 }$ can take a step, then rule E-App1 applies to t. If $\mathbf { t } _ { 1 }$ is a value and $\mathbf { t } _ { 2 }$ can take a step, then rule E-App2 applies. Finally, if both $\mathbf { t } _ { 1 }$ and $\mathbf { t } _ { 2 }$ are values, then the canonical forms lemma tells us that $\mathbf { t } _ { 1 }$ has the form $\lambda \mathbf { x } { : } \mathsf { T } _ { 1 1 } \ldots \mathbf { t } _ { 1 2 }$ , and so rule E-AppAbs applies to t.