# A tutorial on the universality and expressiveness of fold

GRAHAM HUTTON University of Nottingham, Nottingham, UK http://www.cs.nott.ac.uk/-gmh

# Abstract

In functional programming, fold is a standard operator that encapsulates a simple pattern of recursion for processing lists. This article is a tutorial on two key aspects of the fold operator for lists. First of all, we emphasize the use of the universal property of fold both as a proof principle that avoids the need for inductive proofs, and as a definition principle that guides the transformation of recursive functions into definitions using fold. Secondly, we show that even though the pattern of recursion encapsulated by fold is simple, in a language with tuples and functions as first-class values the fold operator has greater expressive power than might first be expected.

# Capsule Review

Within the last ten to fifteen years, the algebra of datatypes has become a stable and well understood element of the mathematics of program construction. Graham Hutton’s paper is a highly readable, elementary introduction to the algebra centred on the well-known function on lists. The paper distinguishes itself by focusing on how the properties are used for the crucial task of ‘constructing’ programs, rather than on the post hoc verification of existing programs. Several well-chosen examples are given, beginning at an elementary level and progressing to more advanced applications. The paper concludes with a good overview and bibliography of recent literature which develops the theory and its applications in more depth.

# 1 Introduction

Many programs that involve repetition are naturally expressed using some form of recursion, and properties proved of such programs using some form of induction. Indeed, in the functional approach to programming, recursion and induction are the primary tools for defining and proving properties of programs.

Not surprisingly, many recursive programs will share a common pattern of recursion, and many inductive proofs will share a common pattern of induction. Repeating the same patterns again and again is tedious, time consuming, and prone to error. Such repetition can be avoided by introducing special recursion operators and proof principles that encapsulate the common patterns, allowing us to concentrate on the parts that are different for each application.

In functional programming, fold (also known as foldr) is a standard recursion operator that encapsulates a common pattern of recursion for processing lists. The fold operator comes equipped with a proof principle called universality, which encapsulates a common pattern of inductive proof concerning lists. Fold and its universal property together form the basis of a simple but powerful calculational theory of programs that process lists. This theory generalises from lists to a variety of other datatypes, but for simplicity we restrict our attention to lists.

This article is a tutorial on two key aspects of the fold operator for lists. First of all, we emphasize the use of the universal property of fold (together with the derived fusion property) both as proof principles that avoid the need for inductive proofs, and as definition principles that guide the transformation of recursive functions into definitions using fold. Secondly, we show that even though the pattern of recursion encapsulated by fold is simple, in a language with tuples and functions as first-class values the fold operator has greater expressive power than might first be expected, thus permitting the powerful universal and fusion properties of fold to be applied to a larger class of programs. The article concludes with a survey of other work on recursion operators that we do not have space to pursue here.

The article is aimed at a reader who is familiar with the basics of functional programming, say to the level of Bird and Wadler (1988) and Bird (1998). All programs in the article are written in Haskell (Peterson et al., 1997), the standard lazy functional programming language. However, no special features of Haskell are used, and the ideas can easily be adapted to other functional languages.

# 2 The fold operator

The fold operator has its origins in recursion theory (Kleene, 1952), while the use of fold as a central concept in a programming language dates back to the reduction operator of APL (Iverson, 1962), and later to the insertion operator of FP (Backus, 1978). In Haskell, the fold operator for lists can be defined as follows:

$$
\begin{array} { l l l l } { { f o l d } } & { { : : } } & { { ( \alpha  \beta  \beta )  \beta  ( [ \alpha ]  \beta ) } } \\ { { f o l d ~ f ~ v ~ } } & { { [ ] } } & { { = } } & { { v } } \\ { { f o l d ~ f ~ v ~ ( x : x s ) } } & { { = } } & { { f ~ x ~ ( f o l d ~ f ~ v ~ x s ) } } \end{array}
$$

That is, given a function $f$ of type $\alpha  \beta  \beta$ and a value $v$ of type $\beta$ , the function fold $\textit { f v }$ processes a list of type $[ \alpha ]$ to give a value of type $\beta$ by replacing the nil constructor $[ ]$ at the end of the list by the value $v$ , and each cons constructor (:) within the list by the function $f$ . In this manner, the fold operator encapsulates a simple pattern of recursion for processing lists, in which the two constructors for lists are simply replaced by other values and functions. A number of familiar functions on lists have a simple definition using fold . For example:

$$
\begin{array} { l l l l l l } { s u m } & { : : } & { \left[ I n t \right] \to I n t } & { } & { \qquad } & { p r o d u c t } & { : : } & { \left[ I n t \right] \to I n t } \\ { s u m } & { = } & { f o l d \ ( + ) \ 0 } & { } & { p r o d u c t } & { = } & { f o l d \ ( \times ) \ 1 } \\ { \quad a n d \ } & { : } & { \left[ B o o l \right] \to B o o l } & { } & { \qquad } & { o r \qquad } & { : : } & { \left[ B o o l \right] \to B o o l } \\ { \quad a n d \ } & { = } & { f o l d \ ( \land ) \ T r u e } & { } & { o r \qquad } & { = } & { f o l d \ ( \lor ) \ F a l s e } \end{array}
$$

Recall that enclosing an infix operator $\oplus$ in parentheses $( \oplus )$ converts the operator into a prefix function. This notational device, called sectioning, is often useful when defining simple functions using fold. If required, one of the arguments to the operator can also be enclosed in the parentheses. For example, the function $( + + )$ that appends two lists to give a single list can be defined as follows:

$$
\begin{array} { l c l } { { ( + + ) } } & { { : : } } & { { [ \alpha ]  [ \alpha ]  [ \alpha ] } } \\ { { ( + + \ y s ) } } & { { = } } & { { f o l d ( : ) y s } } \end{array}
$$

In all our examples so far, the constructor (:) is replaced by a built-in function. However, in most applications of fold the constructor (:) will be replaced by a user-defined function, often defined as a nameless function using the $\lambda$ notation, as in the following definitions of standard list-processing functions:

$$
\begin{array} { r c l } { { l e n g t h } } & { { : : } } & { { [ \alpha ]  l n t } } \\ { { } } & { { } } & { { } } \\ { { l e n g t h } } & { { = } } & { { f o l d ( \lambda x n  1 + n ) 0 } } \\ { { } } & { { } } & { { } } \\ { { r e v e r s e } } & { { : } } & { { [ \alpha ]  [ z ] } } \\ { { } } & { { } } & { { } } \\ { { r e v e r s e } } & { { = } } & { { f o l d ( \lambda x x s  x s + [ x ] ) [ ] } } \\ { { } } & { { } } & { { } } \\ { { \begin{array} { r c l } { { } } & { { } } & { { ( x  \beta )  ( [ x ]  [ \beta ] ) } } \\ { { } } & { { } } & { { } } \\ { { m a p f } } & { { = } } & { { f o l d ( \lambda x x s  f x : x s ) [ ] } } \\ { { } } & { { } } & { { } } \\ { { \textmd { e l i t e r } } } & { { : } } & { { ( \alpha  B o o l )  ( [ \sigma ]  [ \sigma ] ) } } \end{array} } } \end{array}
$$

Programs written using fold can be less readable than programs written using explicit recursion, but can be constructed in a systematic manner, and are better suited to transformation and proof. For example, we will see later on in the article how the above definition for map using fold can be constructed from the standard definition using explicit recursion, and more importantly, how the definition using fold simplifies the process of proving properties of the map function.

# 3 The universal property of fold

As with the fold operator itself, the universal property of fold also has its origins in recursion theory. The first systematic use of the universal property in functional programming was by Malcolm (1990a), in his generalisation of Bird and Meerten’s theory of lists (Bird, 1989; Meertens, 1983) to arbitrary regular datatypes. For finite lists, the universal property of fold can be stated as the following equivalence between two definitions for a function $g$ that processes lists:

$$
\begin{array} { l r c l r c l r c l } { g } & { { } [ { } ] } & { { } } & { { = } } & { { v } } & { { } } & { { } } & { { \Leftrightarrow } } & { { } } & { { g } } & { { = } } & { { f o l d f \ v } } \\ { g } & { { ( x : x s ) } } & { { = } } & { { f \ x \ ( g \ x s ) } } & { { } } & { { } } & { { } } & { { } } & { { } } & { { } } \end{array}
$$

In the right-to-left direction, substituting $g = f o l d \textit { f } v$ into the two equations for $g$ gives the recursive definition for fold . Conversely, in the left-to-right direction the two equations for $g$ are precisely the assumptions required to show that $g = f o l d \textit { f } v$ using a simple proof by induction on finite lists (Bird, 1998). Taken as a whole, the universal property states that for finite lists the function fold $\textit { f } \textit { v }$ is not just a solution to its defining equations, but in fact the unique solution.

The key to the utility of the universal property is that it makes explicit the two assumptions required for a certain pattern of inductive proof. For specific cases then, by verifying the two assumptions (which can typically be done without the need for induction) we can then appeal to the universal property to complete the inductive proof that $g = f o l d \textit { f } v$ . In this manner, the universal property of fold encapsulates a simple pattern of inductive proof concerning lists, just as the fold operator itself encapsulates a simple pattern of recursion for processing lists.

The universal property of fold can be generalised to handle partial and infinite lists (Bird, 1998), but for simplicity we only consider finite lists in this article.

# 3.1 Universality as a proof principle

The primary application of the universal property of fold is as a proof principle that avoids the need for inductive proofs. As a simple first example, consider the following equation between functions that process a list of numbers:

$$
( + 1 ) \ \cdot \ s u m = \ f o l d \ ( + ) \ 1
$$

The left-hand function sums a list and then increments the result. The right-hand function processes a list by replacing each (:) by the addition function $( + )$ and the empty list [ ] by the constant 1. The equation asserts that these two functions always give the same result when applied to the same list.

To prove the above equation, we begin by observing that it matches the right-hand side $g = f o l d \textit { f } v$ of the universal property of fold , with $g = ( + 1 )$ · sum, $f = ( + )$ , and $v = 1$ . Hence, by appealing to the universal property, we conclude that the equation to be proved is equivalent to the following two equations:

$$
\begin{array} { l c l } { ( ( + 1 ) \cdot \ s u m ) } & { \left[ \right] } & { = } & { 1 } \\ { ( ( + 1 ) \cdot \ s u m ) } & { ( x : x s ) } & { = } & { ( + ) \ x \ ( ( ( + 1 ) \cdot \ s u m ) \ x s ) } \end{array}
$$

At first sight, these may seem more complicated than the original equation. However, simplifying using the definitions of composition and sectioning gives

$$
\begin{array} { l c l c l } { { s u m } } & { { [ ] } } & { { + } } & { { 1 } } & { { = } } & { { 1 } } \\ { { s u m } } & { { ( x : x s ) } } & { { + } } & { { 1 } } & { { = } } & { { x + ( s u m \ x s s \ + \ 1 ) } } \end{array}
$$

which can now be verified by simple calculations, shown here in two columns:

$$
{ \begin{array} { l c l } & { s u m \ [ ] \ + \ 1 } & { s u m \ ( x : x s ) \ + \ 1 } \\ { = } & { \ \{ \ { \mathrm { D e f i n i t i o n ~ o f } } \ s u m \ \} } & { \qquad = \ } & { \{ \mathrm { D e f i n i t i o n ~ o f } \ s u m \ \} } \\ & { 0 \ + \ 1 } & { \ ( x \ + \ s u m \ x s ) \ + \ 1 } \\ { = } & { \ \{ \mathrm { A r i t h m e t i c } \ \} } & { \ = \ } & { \{ \mathrm { A r i t h m e t i c } \ \} } \\ & { 1 } & { \ x \ + \ ( s u m \ x s \ + \ 1 ) } \end{array} }
$$

This completes the proof. Normally this proof would have required an explicit use of induction. However, in the above proof the use of induction has been encapsulated in the universal property of fold , with the result that the proof is reduced to a simplification step followed by two simple calculations.

In general, any two functions on lists that can be proved equal by induction can also be proved equal using the universal property of the fold operator, provided, of course, that the functions can be expressed using fold. The expressive power of the fold operator will be addressed later on in the article.

# 3.2 The fusion property of fold

Now let us generalise from the sum example and consider the following equation between functions that process a list of values:

$$
h \ \cdot \ f o l d g \ w = f o l d f \ v
$$

This pattern of equation occurs frequently when reasoning about programs written using fold . It is not true in general, but we can use the universal property of fold to calculate conditions under which the equation will indeed be true. The equation matches the right-hand side of the universal property, from which we conclude that the equation is equivalent to the following two equations:

$$
\begin{array} { l c l } { { ( h \cdot f o l d g \enspace w ) } } & { { [ ] } } & { { = } } & { { v } } \\ { { ( h \cdot f o l d g \enspace w ) \enspace ( x : x s ) } } & { { = } } & { { f \enspace x \enspace ( ( h \cdot f o l d g \enspace w ) \enspace x s ) , } } \end{array}
$$

Simplifying using the definition of composition gives

$$
\begin{array} { l c l } { { h \ ( f o l d \ g \ w } } & { { [ ] ) } } & { { = } } & { { v } } \\ { { h \ ( f o l d g \ w \ ( x : x s ) ) } } & { { = } } & { { f \ x \ ( h \ ( f o l d g \ w \ x s ) ) } } \end{array}
$$

which can now be further simplified by two calculations:

$$
\begin{array} { c } { { \begin{array} { l l } { { h \ ( f o l d \ g \ w \left[ \right] ) \ = \ v } } \\ { \Leftrightarrow } \\ { \Leftrightarrow } \end{array} } } \\ { { \begin{array} { l } { { \begin{array} { r l } { \{ \mathrm { D e f n i t i o n \ o f } f o l d \ \} } } \\ { h \ w \ = \ v } \end{array} } } \end{array} }  \end{array}
$$

and

$$
\begin{array} { c } { { \begin{array} { c c c } { { h \ ( f o l d \ g \ w \ ( x : x s ) ) \ = \ f \ x \ ( h \ ( f o l d \ g \ w \ x s ) ) } } \\ { \Leftrightarrow } & { \{ \ \mathrm { D e f i n i t i o n ~ o f } f o l d \} } \\ { h \ ( g \ x \ ( f o l d g \ w \ x s ) ) \ = \ f \ x \ ( h \ ( f o l d \ g \ w \ x s ) ) } \\ { \Leftarrow } & { \{ \mathrm { G e n e r a l i s i n g ~ } ( f o l d \ g \ w \ x s ) \ \mathrm { t o ~ a ~ f r e s h ~ v a r i a b l e \ y ~ } \} } \\ { h \ ( g \ x \ y ) \ = \ f \ x \ ( h \ y ) } \end{array} } } \end{array}
$$

That is, using the universal property of fold we have calculated – without an explicit use of induction – two simple conditions that are together sufficient to ensure for all finite lists that the composition of an arbitrary function and a fold can be fused together to give a single fold . Following this interpretation, this property is called the fusion property of the fold operator, and can be stated as follows:

$$
\begin{array} { r c l c r c l } { h ~ w } & { ~ } & { = ~ } & { v } & { ~ } & { } \\ { h ~ ( g ~ x ~ y ) } & { = ~ } & { f ~ x ~ ( h ~ y ) } & { } & { ~ \Rightarrow ~ } & { ~ h ~ \cdot ~ f o l d ~ g ~ w ~ = ~ f o l d ~ f ~ v } \end{array}
$$

The first systematic use of the fusion property in functional programming was again by Malcolm (1990a), generalising earlier work by Bird (1989) and Meertens (1983). As with the universal property, the primary application of the fusion property is as a proof principle that avoids the need for inductive proofs. In fact, for many practical examples the fusion property is often preferable to the universal property. As a simple first example, consider again the equation:

$$
( + 1 ) \ \cdot \ s u m = \ f o l d \ ( + ) \ 1
$$

In the previous section this equation was proved using the universal property of fold . However, the proof is simpler using the fusion property. First, we replace the function sum by its definition using fold given earlier:

$$
( + 1 ) ~ \cdot ~ f o l d ~ ( + ) ~ 0 ~ = ~ f o l d ~ ( + ) ~ 1
$$

The equation now matches the conclusion of the fusion property, from which we conclude that the equation follows from the following two assumptions:

$$
\begin{array} { l c l } { { ( + 1 ) ~ 0 } } & { { = } } & { { 1 } } \\ { { ( + 1 ) ~ ( ( + ) ~ x ~ y ) } } & { { = } } & { { ( + ) ~ x ~ ( ( + 1 ) ~ y ) } } \end{array}
$$

Simplifying these equations using the definition of sectioning gives $0 + 1 = 1$ and $( x + y ) + 1 = x + ( y + 1 )$ , which are true by simple properties of arithmetic. More generally, by replacing the use of addition in this example by an arbitrary infix operator $\oplus$ that is associative, a simple application of fusion shows that:

$$
\left( \oplus \ a \right) \ \cdot \ f o l d \ \left( \oplus \right) \ b \ = \ f o l d \ \left( \oplus \right) \ \left( b \oplus a \right)
$$

For a more interesting example, consider the following well-known equation, which asserts that the map operator distributes over function composition (·):

$$
m a p \textit { f } \cdot \textit { m a p g } = \textit { m a p } ( f \cdot g )
$$

By replacing the second and third occurrences of the map operator in the equation by its definition using fold given earlier, the equation can be rewritten in a form that matches the conclusion of the fusion property:

$$
\begin{array} { r l r } { { m a p \ f \ \cdot \ f o l d } } & { { } { ( \lambda x \ x s \to g \ x : x s ) \ [ ] } } \\ { ~ } & { { } } & { { = } } \\ { { f o l d } } & { { } { ( \lambda x \ x s \to ( f \cdot g ) \ x : x s ) \ [ ] } } \end{array}
$$

Appealing to the fusion property and then simplifying gives the following two equations, which are trivially true by the definitions of map and (·):

$$
\begin{array} { l r c l } { { m a p \ f } } & { { [ ] } } & { { = } } & { { [ ] } } \\ { { m a p \ f \ ( g \ x \ : \ y ) } } & { { = } } & { { ( f \cdot g ) \ x \ : \ m a p \ f \ y } } \end{array}
$$

In addition to the fusion property, there are a number of other useful properties of the fold operator that can be derived from the universal property (Bird, 1998). However, the fusion property suffices for many practical cases, and one can always revert to the full power of the universal property if fusion is not appropriate.

# 3.3 Universality as a definition principle

As well as being used as a proof principle, the universal property of fold can also be used as a definition principle that guides the transformation of recursive functions into definitions using fold. As a simple first example, consider the recursively defined function sum that calculates the sum of a list of numbers:

$$
\begin{array} { l c l } { { s u m } } & { { : : } } & { { [ I n t ]  I n t } } \\ { { s u m } } &   [ \begin{array} { l l l } { { ] } } & { { = } } & { { 0 } } \\ { { s u m } } & { { ( x : x s ) } } & { { = } } & { { x + s u m \ x s s } } \end{array} \end{array}
$$

Suppose now that we want to redefine sum using fold. That is, we want to solve the equation $s u m = f o l d \textit { f v }$ for a function $f$ and a value $v$ . We begin by observing that the equation matches the right-hand side of the universal property, from which we conclude that the equation is equivalent to the following two equations:

$$
\begin{array} { l c l } { { s u m } } & { { [ ] } } & { { = } } & { { v } } \\ { { s u m } } & { { ( x : x s ) } } & { { = } } & { { f \ x \ ( s u m \ x s ) } } \end{array}
$$

From the first equation and the definition of sum, it is immediate that $v = 0$ . From the second equation, we calculate a definition for $f$ as follows:

$$
\begin{array} { c } { { s u m ~ ( x : x s ) ~ = ~ f ~ x ~ ( s u m ~ x s ) } } \\ { { \Leftrightarrow ~ \{ ~ \mathrm { D e f i n i t i o n ~ o f } ~ s u m ~ \} } } \\ { { x ~ + ~ s u m ~ x s ~ = ~ f ~ x ~ ( s u m ~ x s ) } } \\ { { \Leftrightarrow ~ \{ ~ \dagger ~ \mathrm { G e n e r a l i s i n g ~ ( s u m ~ x s ) ~ t o ~ } y ~ \} } } \\ { { x ~ + ~ y ~ = ~ f ~ x ~ y ~ } } \\ { { \Leftrightarrow ~ \{ ~ \mathrm { F u n c t i o n s } ~ \} } } \\ { { f ~ = ~ ( + ) } } \end{array}
$$

That is, using the universal property we have calculated that:

$$
\begin{array} { r l r } { s u m } & { { } = } & { f o l d \ ( + ) \ 0 } \end{array}
$$

Note that the key step $( \dag )$ above in calculating a definition for $f$ is the generalisation of the expression sum xs to a fresh variable $y$ . In fact, such a generalisation step is not specific to the sum function, but will be a key step in the transformation of any recursive function into a definition using fold in this manner.

Of course, the sum example above is rather artificial, because the definition of sum using fold is immediate. However, there are many examples of functions whose definition using fold is not so immediate. For example, consider the recursively defined function map $f$ that applies a function $f$ to each element of a list:

$$
\begin{array} { l r c l } { { m a p } } & { { : : } } & { { ( \alpha  \beta )  ( [ \alpha ]  [ \beta ] ) } } \\ { { m a p \ f \quad [ ] } } & { { = } } & { { [ ] } } \\ { { m a p \ f \ ( x : x s ) } } & { { = } } & { { f \ x : m a p \ f \ x s } } \end{array}
$$

To redefine map $f$ using fold we must solve the equation map $\textit { f } = f o l d \textit { g } \textit { v }$ for a function $g$ and a value $v$ . By appealing to the universal property, we conclude that this equation is equivalent to the following two equations:

$$
\begin{array} { l c l } { { m a p \ f \ } } & { { [ ] } } & { { = } } & { { v } } \\ { { m a p \ f \ ( x : x s ) } } & { { = } } & { { g \ x \ ( m a p \ f \ x s ) } } \end{array}
$$

From the first equation and the definition of map it is immediate that $v = [ ]$ . From the second equation, we calculate a definition for $g$ as follows:

$$
{ \begin{array} { c } { m a p \ f \ ( x : x s ) \ = \ g \ x \ ( m a p \ f \ x s ) } \\ { \Leftrightarrow \ \qquad \ \vdots \ \scriptstyle { { \mathrm { D e f i n i t i o n ~ o f } } \ m a p } \ \nmid } \\ { \nmid x \ : \ m a p \ f \ x s \ = \ g \ x \ ( m a p \ f \ x s ) } \\ { \Leftarrow \ \{ { \mathrm { G e n e r a l i s i n g } } \ ( m a p \ f \ x s ) \ \mathrm { t o } \ y s \ \} } \\ { \nmid x \ : \ y s \ = \ g \ x \ y s } \\ { \Leftrightarrow \ \{ { \mathrm { F u n c t i o n s } } \ \} } \\ { \nmid g \ = \ \lambda x \ y s  f \ x \ : \ y s } \end{array} }
$$

That is, using the universal property we have calculated that:

$$
\begin{array} { r l r } { m a p \ f } & { { } = } & { f o l d \ ( \lambda x \ y s \to f \ x \ : \ y s ) \ [ ] } \end{array}
$$

In general, any function on lists that can be expressed using the fold operator can be transformed into such a definition using the universal property of fold.

# 4 Increasing the power of fold: generating tuples

As a simple first example of the use of fold to generate tuples, consider the function sumlength that calculates the sum and length of a list of numbers:

$$
\begin{array} { l r c l } { { s u m l e n g t h } } & { { } } & { { : : } } & { { [ I n t ]  ( I n t , I n t ) } } \\ { { s u m l e n g t h \ x s } } & { { } } & { { = } } & { { ( s u m \ x s , \ l e n g t h \ x s ) } } \end{array}
$$

By a straightforward combination of the definitions of the functions sum and length using fold given earlier, the function sumlength can be redefined as a single application of fold that generates a pair of numbers from a list of numbers:

$$
\begin{array} { r l r } { s u m l e n g t h } & { { } = } & { f o l d \ ( \lambda n ( x , y )  ( n + x , \ 1 + y ) ) \ ( 0 , 0 ) } \end{array}
$$

This definition is more efficient than the original definition, because it only makes a single traversal over the argument list, rather than two separate traversals. Generalising from this example, any pair of applications of fold to the same list can always be combined to give a single application of fold that generates a pair, by appealing to the so-called ‘banana split’ property of fold (Meijer, 1992). The strange name of this property derives from the fact that the fold operator is sometimes written using brackets $( ~ )$ that resemble bananas, and the pairing operator is sometimes called split. Hence, their combination can be termed a banana split!

As a more interesting example, let us consider the function dropWhile $p$ that removes initial elements from a list while all the elements satisfy the predicate $p$ :

dropWhile :: $( \alpha  B o o l )  ( [ \alpha ]  [ \alpha ] )$ dropWhile $\begin{array} { r l r l r l } { p } & { { } } & { [ ] } & { } & { { } = } & { [ ] } & { } \end{array}$ dropWhile $\begin{array} { r l r } { p \ \left( x : x s \right) } & { { } = } & { \mathbf { i f } \ p \ x } \end{array}$ then dropWhile $p$ xs else $x : x s$

Suppose now that we want to redefine dropWhile $p$ using the fold operator. By appealing to the universal property, we conclude that the equation dropWhile $p =$ fold $\textit { f } \textit { v }$ is equivalent to the following two equations:

$$
\begin{array} { l c l } { d r o p W h i l e  { p } } & { [ ] } & { = } & { v } \\ { d r o p W h i l e  { p } ( x : x s ) } & { = } & { f  { x } ( d r o p W h i l e  { p } x s ) } \end{array}
$$

¿From the first equation it is immediate that $v = \left[ \begin{array} { r l r l } \end{array} \right]$ . From the second equation, we attempt to calculate a definition for $f$ in the normal manner:

dropWhile $p$ $( x : x s ) \ = \ f \ x$ (dropWhile $p$ xs)   
$\Leftrightarrow$ { Definition of dropWhile $\Bigg \}$ if $p \ x$ then dropWhile $p$ xs else $x : x s \ = \ f \ x$ (dropWhile $p$ xs)   
$\qquad \left. \begin{array} { r l r l } \end{array} \right. \qquad \left\{ \begin{array} { r l r l } \end{array} \right.$ Generalising (dropWhile p xs) to ys } if $p \ x$ then ys else $x : x s \ = \ f \ x$ y s

Unfortunately, the final line above is not a valid definition for $f$ , because the variable xs occurs freely. In fact, it is not possible to redefine dropWhile $p$ directly using fold . However, it is possible indirectly, because the more general function

$$
\begin{array} { r l r l } & { d r o p W h i l e ^ { \prime } } & { : : } & { ( \alpha  B o o l )  ( [ \alpha ]  ( [ \alpha ] , \ [ \alpha ] ) ) } \\ & { d r o p W h i l e ^ { \prime }  { p }  { x s } } & { = } & { ( d r o p W h i l e  { p }  { x s } , \ x s ) } \end{array}
$$

that pairs up the result of applying dropWhile $p$ to a list with the list itself can be redefined using fold. By appealing to the universal property, we conclude that the equation dropWhile\* $\textit { p } = \mathit { f o l d } \textit { f } \textit { v }$ is equivalent to the following two equations:

$$
\begin{array} { l c l } { d r o p W h i l e ^ { \prime } \textit { p } } & { [ ] } & { = } & { v } \\ { d r o p W h i l e ^ { \prime } \textit { p } ( x : x s ) } & { = } & { f \textit { x } ( d r o p W h i l e ^ { \prime } \textit { p } x s ) } \end{array}
$$

A simple calculation from the first equation gives $v = ( [ ] , [ ] )$ . From the second equation, we calculate a definition for $f$ as follows:

$$
{ \begin{array} { r l } & { d r o p W h i l e ^ { \prime } \ p \ ( x : x s ) = \ f \ x \ ( d r o p W h i l e ^ { \prime } \ p \ x s ) } \\ { \Leftrightarrow \ } & { \ \{ \mathrm { ~ D e f i r i t i o n ~ o f ~ } } d r o p W h i l e ^ { \prime } \ \} } \\ & { ( d r o p W h i l e \ p \ ( x : x s ) , \ x : x s ) = \ f \ x \ ( d r o p W h i l e \ p \ x s , \ x s ) } \\ { \Leftrightarrow \ } & { \ \{ \mathrm { ~ D e f i r i t i o n ~ o f ~ } } d r o p W h i l e \ \}  \\ & { ( { \mathbf { i f } } \ p \ x \ \mathbf { t h e n } \ d r o p W h i l e \ p \ x s \ \mathbf { \ e l s e } \ x : x s , \ x : x s ) } \\ & { = \ f \ x \ ( d r o p W h i l e \ p \ x s , \ x s ) } \\ { \Leftarrow \ } & { \{ \mathrm { ~ G e n e r a l i s i n g ~ ( } } d r o p W h i l e \ p \ x s ) \ \in \ \gamma \ x \ ( y s ) \  \\ & { ( { \mathbf { i f } } \ p \ x \ \mathbf { \ t h e n } \ y \ x \mathbf { \ e l s e } \ x \ x \ x \ x \ x ) = \ f \ x \ ( y s , x s ) } \end{array} 
$$

Note that the final line above is a valid definition for $f$ , because all the variables are bound. In summary, using the universal property we have calculated that:

$$
{ \begin{array} { l } { f \ x \ ( y s , x s ) \ = \ ( \mathbf { i f } \ p \ x \ \mathbf { t h e n } \ y s \ \mathbf { e l s e } \ x : x s , \ x : x s ) } \\ { v \ } \end{array} }
$$

This definition satisfies the equation dropWhile\* $\textit { p }  { x s } = ( d r o p W h i l e \textit { p }  { x s , } \ \boldsymbol { x s } ) ,$ but does not make use of dropWhile in its definition. Hence, the function dropWhile itself can now be redefined simply by dropWhile $p \ = \ f s t \cdot d r o p W h i l e ^ { \prime } \ p$ .

In conclusion, by first generalising to a function dropWhile\* that pairs the desired result with the argument list, we have now shown how the function dropWhile can be redefined in terms of fold , as required. In fact, this result is an instance of a general theorem (Meertens, 1992) that states that any function on finite lists that is defined by pairing the desired result with the argument list can always be redefined in terms of fold , although not always in a way that does not make use of the original (possibly recursive) definition for the function.

# 4.1 Primitive recursion

In this section we show that by using the tupling technique from the previous section, every primitive recursive function on lists can be redefined in terms of fold . Let us begin by recalling that the fold operator captures the following simple pattern of recursion for defining a function $h$ that processes lists:

$$
\begin{array} { l c l } { { h } } & { { [ ] } } & { { = } } & { { v } } \\ { { h \ ( x : x s ) } } & { { = } } & { { g \ x \ ( h \ x s ) } } \end{array}
$$

Such functions can be redefined by $\boldsymbol { h } = f o l d \textit { \textbf { g } } \boldsymbol { v }$ . We will generalise this pattern of recursion to primitive recursion in two steps. First of all, we introduce an extra argument $y$ to the function $h$ , which in the base case is processed by a new function $f$ , and in the recursive case is passed unchanged to the functions $g$ and $h$ . That is, we now consider the following pattern of recursion for defining a function $h$ :

$$
\begin{array} { l c l } { { h \ y } } & { { [ ] } } & { { = } } & { { f \ y } } \\ { { h \ y } } & { { ( x : x s ) } } & { { = } } & { { g \ y \ x \ ( h \ y \ x s ) } } \end{array}
$$

By simple observation, or a routine application of the universal property of fold , the function $\textit { h y }$ can be redefined using fold as follows:

$$
\begin{array} { r l r } { h } & { { } y } & { = } & { f o l d \ ( g \ y ) \ ( f \ y ) } \end{array}
$$

For the second step, we introduce the list $x s$ as an extra argument to the auxiliary function $g$ . That is, we now consider the following pattern for defining $h$ :

$$
\begin{array} { l c l c l } { h ~ y } & { [ ] } & { = } & { f ~ y } \\ { h ~ y ~ ( x : x s ) } & { = } & { g ~ y ~ x ~ x s ~ ( h ~ y ~ x s ) } \end{array}
$$

This pattern of recursion on lists is called primitive recursion (Kleene, 1952). Technically, the standard definition of primitive recursion requires that the argument $y$ is a finite sequence of arguments. However, because tuples are first-class values in Haskell, treating the case of a single argument $y$ is sufficient.

In order to redefine primitive recursive functions in terms of fold , we must solve the equation $\textit { h y } = f o l d \textit { i } \textit { j }$ for a function $i$ and a value $j$ . This is not possible directly, but is possible indirectly, because the more general function

$$
\begin{array} { r l r } { k \ y \ x s } & { { } = } & { ( h \ y \ x s , \ x s ) } \end{array}
$$

that pairs up the result of applying $\textit { h y }$ to a list with the list itself can be redefined using fold. By appealing to the universal property of fold, we conclude that the equation $\textit { k } \ y = f o l d i \ j$ is equivalent to the following two equations:

$$
\begin{array} { l c l } { { k \ y } } & { { [ ] } } & { { = } } & { { j } } \\ { { k \ y } } & { { ( x : x s ) } } & { { = } } & { { i \ x \ ( k \ y \ x s ) } } \end{array}
$$

A simple calculation from the first equation gives $j = ( f \ y , \ [ \operatorname { ] } )$ . ¿From the second equation, we calculate a definition for $i$ as follows:

$$
\begin{array} { r l } & {  { k y } ( x : x s ) =  { i x } ( k  { y } x s ) } \\ { \Leftrightarrow } & { \lbrace \mathrm { ~ D e f i n i t i o n ~ o f ~ } k \rbrace } \\ & { ( h  { y } ( x : x s ) ,  { x } : x s ) =  { i x } ( h  { y } x s , \ x s ) } \\ { \Leftrightarrow } & { \lbrace \mathrm { ~ D e f i n i t i o n ~ o f ~ } h \rbrace } \\ & { ( g  { y } x  { x s } ( h  { y } x s ) ,  { x } : x s ) =  { i x } ( h  { y } x s , \ x s ) } \\ { \Leftrightarrow } & { \lbrace \mathrm { ~ G e n e r a l i s i n g ~ } ( h  { y } x s ) \textnormal { t o } z \rbrace } \\ & { ( g  { y } x  { x s } z ,  { x } : x s ) =  { i x } ( z , \ x s ) } \end{array}
$$

In summary, using the universal property we have calculated that:

$$
\begin{array} { r c l } { k } & { y } & { = } & { f o l d i \textit { i j } } \\ & & { \mathbf { w h e r e } } \\ & & { \textit { i x } \left( z , \ x s \right) \ = \ ( g \ y \ x \ x s \ z , \ x : x s ) } \\ & & { \textit { j } } & { = \ ( f \ y , \ [ ] ) } \end{array}
$$

This definition satisfies the equation $k \ y \ x s = ( h \ y \ x s , \ x s )$ , but does not make use of $h$ in its definition. Hence, the primitive recursive function $h$ itself can now be redefined simply by h $\iota \ y = f s t \ \cdot \ k \ y$ . In conclusion, we have now shown how an arbitrary primitive recursive function on lists can be redefined in terms of fold .

Note that the use of tupling to define primitive recursive functions in terms of fold is precisely the key to defining the predecessor function for the Church numerals (Barendregt, 1984). Indeed, the intuition behind the representation of the natural numbers (or more generally, any inductive datatype) in the $\lambda$ -calculus is the idea of representing each number by its fold operator. For example, the number $3 = s u c c$ (succ (succ zero)) is represented by the term $\lambda f \ x \to f \left( f \left( f \ x \right) \right)$ , which is the fold operator for 3 in the sense that the arguments $f$ and $x$ can be viewed as the replacements for the succ and zero constructors respectively.

# 5 Using fold to generate functions

Having functions as first-class values increases the power of primitive recursion, and hence the power of the fold operator. As a simple first example of the use of fold to generate functions, the function compose that forms the composition of a list of functions can be defined using fold by replacing each (:) in the list by the composition function (·), and the empty list $[ ]$ by the identity function $i d$ :

$$
\begin{array} { l l l } { { c o m p o s e } } & { { \because } } & { { [ \alpha  \alpha ]  ( \alpha  \alpha ) } } \\ { { c o m p o s e } } & { { = } } & { { f o l d \ \mathrm { \Omega } \mathrm { \Omega } \mathrm { \Omega } ^ { . } ) i d } } \end{array}
$$

As a more interesting example, let us consider the problem of summing a list of numbers. The natural definition for such a function, $s u m = f o l d \ \left( + \right) \ 0$ , processes the numbers in the list in right-to-left order. However, it is also possible to define a function suml that processes the numbers in left-to-right order. The suml function is naturally defined using an auxiliary function suml\* that is itself defined by explicit recursion and makes use of an accumulating parameter $n$ :

$$
{ \begin{array} { l c l c c l c } { s u m l } & { : : } & { [ I n t ] \to I n t } \\ { s u m l ~ x s } & { = } & { s u m l ^ { \prime } ~ x s ~ 0 } \\ & & { } & { { \mathrm { ~ w h e r e } } } \\ & & { } & { \qquad \quad [ \quad ] } & { n } & { = } & { n } \\ & & { } & { s u m l ^ { \prime } ~ ( x : x s ) ~ n } & { = } & { s u m l ^ { \prime } ~ x s ~ ( n + x ) } \end{array} }
$$

Because the addition function $( + )$ is associative and the constant 0 is unit for addition, the functions suml and sum always give the same result when applied to the same list. However, the function suml has the potential to be more efficient, because it can easily be modified to run in constant space (Bird, 1998).

Suppose now that we want to redefine suml using the fold operator. This is not possible directly, but is possible indirectly, because the auxiliary function

$$
s u m l ^ { \prime } \quad \ \because \quad [ I n t ]  ( I n t  I n t )
$$

can be redefined using fold. By appealing to the universal property, we conclude that the equation $s u m l ^ { \prime } = f o l d \textit { \textbf { f } } v$ is equivalent to the following two equations:

$$
\begin{array} { l r c l } { { s u m l ^ { \prime } } } & { { [ ] } } & { { = } } & { { v } } \\ { { s u m l ^ { \prime } } } & { { ( x : x s ) } } & { { = } } & { { f \ x \ ( s u m l ^ { \prime } \ x s ) } } \end{array}
$$

A simple calculation from the first equation gives $v = i d$ . From the second equation, we calculate a definition for the function $f$ as follows:

$$
\begin{array} { r l } & { ~ s u m l ^ { \prime } ~ ( x : x s ) = ~ f ~ x ~ ( s u m l ^ { \prime } ~ x s ) } \\ { \Leftrightarrow } & { ~ \{ \mathrm { F ~ t u n c t i o n s } \} } \\ & { ~ s u m l ^ { \prime } ~ ( x : x s ) ~ n = ~ f ~ x ~ ( s u m l ^ { \prime } ~ x s ) ~ n } \\ { \Leftrightarrow } & { ~ \{ \mathrm { D e f i n i t i o n ~ o f ~ } s u m l ^ { \prime } \} ~ } \\ & { ~ s u m l ^ { \prime } ~ x s ~ ( n + x ) ~ ( n ~ f ~ x ~ ( s u m l ^ { \prime } ~ x s ) ~ n } \\ { \Leftrightarrow } & { ~ \{ \mathrm { G e n e r a l i s i n g ~ ( s u m l ^ { \prime } ~ x s ) ~ t o ~ g ~ } \} ~ } \\ { ~ } & { ~ g ~ ( n + x ) ~ = ~ f ~ x ~ g ~ n } \\ { \Leftrightarrow } & { ~ \{ \mathrm { ~ F ~ u n c t i o n s } \} ~ } \\ { ~ } & { ~ f ~ = ~ i ~ x ~ g ~  ~ ( \lambda n - g ~ g ~ ( n + x ) ) } \end{array}
$$

In summary, using the universal property we have calculated that:

$$
\begin{array} { r l r } { s u m l ^ { \prime } } & { { } = } & { f o l d \ \left( \lambda x \ g \to \left( \lambda n \to g \ ( n + x ) \right) \right) \ i d } \end{array}
$$

This definition states that suml\* processes a list by replacing the empty list [ ] by the identity function $i d$ on lists, and each constructor (:) by the function that takes a number $x$ and a function $g$ , and returns the function that takes an accumulator value $n$ and returns the result of applying $g$ to the new accumulator value $n + x$ .

Note that the structuring of the arguments to $s u m l ^ { \prime } \because [ I n t ]  ( I n t  I n t )$ is crucial to its definition using fold . In particular, if the order of the two arguments is swapped or they are supplied as a pair, then the type of suml\* means that it can no longer be defined directly using fold. In general, some care regarding the structuring of arguments is required when aiming to redefine functions using fold. Moreover, at first sight one might imagine that fold can only be used to define functions that process the elements of lists in right-to-left order. However, as the definition of suml\* using fold shows, the order in which the elements are processed depends on the arguments of fold , not on fold itself.

In conclusion, by first redefining the auxiliary function suml\* using fold, we have now shown how the function suml can be redefined in terms of fold, as required:

We end this section by remarking that the use of fold to generate functions provides an elegant technique for the implementation of ‘attribute grammars’ in functional languages (Fokkinga et al., 1991; Swierstra et al., 1998).

# 5.1 The foldl operator

Now let us generalise from the suml example and consider the standard operator foldl that processes the elements of a list in left-to-right order by using a function $f$ to combine values, and a value $v$ as the starting value:

$$
\begin{array} { l l l l } { { f o l d l } } & { { \ } } & { { \ : \ } } & { { ( \beta \to \alpha \to \beta ) \to \beta \to ( [ \alpha ] \to \beta ) } } \\ { { f o l d l \ f \ v } } & { { \ [ \ ] } } & { { \ = } } & { { v } } \\ { { f o l d l \ f \ v \ ( x : x s ) } } & { { \ = } } & { { f o l d l \ f \ (  { f } \ v \ x ) \ x s } } \end{array}
$$

Using this operator, suml can be redefined simply by $s u m l = f o l d l \ \left( + \right) \ 0 . \mathrm { { N } }$ Many other functions can be defined in a simple way using foldl. For example, the standard function reverse can redefined using foldl as follows:

$$
\begin{array} { r c l } { { r e v e r s e } } & { { : : } } & { { [ \alpha ]  [ \alpha ] } } \\ { { r e v e r s e } } & { { = } } & { { f o l d l ( \lambda x s \ x  x : x s ) \ [ ] } } \end{array}
$$

This definition is more efficient than our original definition using fold, because it avoids the use of the inefficient append operator $( + + )$ for lists.

A simple generalisation of the calculation in the previous section for the function suml shows how to redefine the function foldl in terms of fold :

$$
\begin{array} { r l r } { \textit { f v } \ = \textit { x s } } & { { } = } & { f o l d \ ( \lambda x \ g  ( \lambda a  g \ ( f \ a \ x ) ) ) \ i d \ x s \ v } \end{array}
$$

In contrast, it is not possible to redefine fold in terms of foldl , due to the fact that foldl is strict in the tail of its list argument but fold is not. There are a number of useful ‘duality theorems’ concerning fold and foldl , and also some guidelines for deciding which operator is best suited to particular applications (Bird, 1998).

# 5.2 Ackermann’s function

For our final example of the power of fold, consider the function ack that processes two lists of integers, and is defined using explicit recursion as follows:

$$
\begin{array} { r c l l } { { \mathrm { } } } & { { : : } } & { { [ I n t ]  ( [ I n t ]  [ I n t ] ) } } \\ { { \mathrm { } } } & { { \mathrm { } } } & { { y s } } & { { = } } & { { 1 : y s } } \\ { { \mathrm { } } } & { { \mathrm { } } } & { { \mathrm { } } } & { { = } } & { { a c k \ x s \ [ 1 ] } } \\ { { \mathrm { } } } & { { \mathrm { } } } & { { \mathrm { } } } & { { = } } & { { a c k \ x s \ ( a c k \ ( x : x s ) \ y s ) } } \end{array}
$$

This is Ackermann’s function, converted to operate on lists rather than natural numbers by representing each number $n$ by a list with $n$ arbitrary elements. This function is the classic example of a function that is not primitive recursion in a first-order programming language. However, in a higher-order language such as Haskell, Ackermann’s function is indeed primitive recursive (Reynolds, 1985). In this section we show how to calculate the definition ack in terms of fold .

First of all, by appealing to the universal property of fold , the equation $a c k =$ fold $\textit { f } \textit { v }$ is equivalent to the following two equations:

$$
\begin{array} { l c l } { { a c k } } & { { [ ] } } & { { = } } & { { v } } \\ { { a c k ~ ( x : x s ) } } & { { = } } & { { f ~ x ~ ( a c k ~ x s ) } } \end{array}
$$

A simple calculation from the first equation gives the definition $v = ( 1 : )$ . From the second equation, proceeding in the normal manner does not result in a definition for the function $f$ , as the reader may wish to verify. However, progress can be made by first using fold to redefine the function ack $( x ~ : x s )$ on the left-hand side of the second equation. By appealing to the universal property, the equation ack $( x : x s ) = f o l d g w$ is equivalent to the following two equations:

The first equation gives $w = a c k$ xs [1], and from the second:

$$
{ \begin{array} { r l } & { \ a c k \ ( \ x : x s ) \ ( y : y s ) \ = \ g \ y \ ( a c k \ ( x : x s ) \ y s ) } \\ { \Leftrightarrow } & { \ \{ \ \operatorname { D e f i n i t i o n } \ \mathrm { o f } \ a c k \ \} } \\ & { \ a c k \ x s \ ( a c k \ ( x : x s ) \ y s ) \ = \ g \ y \ ( a c k \ ( x : x s ) \ y s ) } \\ { \Leftarrow } & { \ \{ \operatorname { G e n e r a l i s i n g } \ ( a c k \ ( x : x s ) \ y s ) \ \mathrm { t o } \ z s \ \} } \\ & { \ a c k \ x s \ z s \ = \ g \ y \ z s } \\ { \Leftrightarrow } & { \ \{ \ \operatorname { F u n c t i o n s } \ \} } \\ { \ g } & { = \ \lambda y  a c k \ x s } \end{array} }
$$

That is, using the universal property we have calculated that:

$$
\begin{array} { r l r } { a c k \ ( x : x s ) } & { { } = } & { f o l d \ ( \lambda y  a c k \ x s ) } \end{array}
$$

Using this result, we can now calculate a definition for $f$ :

$$
\begin{array} { r l } & { \qquad \mathit { a c k \ ( x : x s ) } = f \ x \ ( \mathit { a c k \ x s } ) } \\ { \Leftrightarrow } & { \{ \begin{array} { l l } { \mathrm { R e s u l t \ a b o v e \ } } \end{array} \} } \\ { \mathit { f o l d \ ( \lambda y  a c k \ x s ) } \ ( a c k \ x s \ [ 1 ] ) \ = \ f \ x \ ( a c k \ x s ) } \\ { \Leftarrow } & { \{ \begin{array} { l l } { \mathrm { G e n e r a l i s i n g \ ( } a c k \ x s \ \mathrm { ~ t o } \ g } \\ { \mathrm { ( } \lambda y  g \ ) \ ( g \ [ 1 ] ) \ = \ f \ x \ g } \end{array} \} } \\ { \Leftrightarrow } & { \{ \begin{array} { l l } { \mathrm { F u n c t i o n s } } \end{array} \} } \\ { \mathit { f \ } = \lambda x \ g  \mathit { f o l d \ ( } \lambda y  g \ \mathrm { ( } g \ [ 1 ] ) \ } \end{array}
$$

In summary, using the universal property twice we have calculated that:

$$
\begin{array} { r l r } { a c k } & { { } = } & { f o l d \ ( \lambda x \ g \to f o l d \ ( \lambda y \to g ) \ ( } \end{array}
$$

# 6 Other work on recursion operators

In this final section we briefly survey a selection of other work on recursion operators that we did not have space to pursue in this article.

Fold for regular datatypes. The fold operator is not specific to lists, but can be generalised in a uniform way to ‘regular’ datatypes. Indeed, using ideas from category theory, a single fold operator can be defined that can be used with any regular datatype (Malcolm, $1 9 9 0 b$ ; Meijer et al., 1991; Sheard and Fegaras, 1993).

Fold for nested datatypes. The fold operator can also be generalised in a natural way to ‘nested’ datatypes. However, the resulting operator appears to be too general to be widely useful. Finding solutions to this problem is the subject of current research (Bird and Meertens, 1998; Jones and Blampied, 1998).

Fold for functional datatypes. Generalising the fold operator to datatypes that involve functions gives rise to technical problems, due to the contravariant nature of function types. Using ideas from category theory, a fold operator can be defined that works for such datatypes (Meijer and Hutton, 1995a), but the the use of this operator is not well understood, and practical applications are lacking. However, a simpler but less general solution has given rise to some interesting applications concerning cyclic structures (Fegaras and Sheard, 1996).

Monadic fold. In a series of influential articles, Wadler showed how pure functional programs that require imperative features such as state and exceptions can be modelled using monads (Wadler, 1990, 1992a, 1992b). Building on this work, the notion of a ‘monadic fold’ combines the use of fold operators to structure the processing of recursive values with the use of monads to structure the use of imperative features (Fokkinga, 1994; Meijer and Jeuring, 1995b).

Relational fold. The fold operator can also be generalised in a natural way from functions to relations. This generalisation supports the use of fold as a specification construct, in addition to its use as a programming construct. For example, a relational fold is used in the circuit design calculus Ruby (Jones and Sheeran, 1990; Jones, 1990), the Eindhoven spec calculus (Aarts et al., 1992), and in a recent textbook on the algebra of programming (Bird and de Moor, 1997).

Other recursion operators. The fold operator is not the only useful recursion operator. For example, the dual operator unfold for constructing rather than processing recursive values has been used for specification purposes (Jones, 1990; Bird and de Moor, 1997), to program reactive systems (Kieburtz, 1998), to program operational semantics (Hutton, 1998), and is the subject of current research. Other interesting recursion operators include the so-called paramorphisms (Meertens, 1992), hylomorphisms (Meijer, 1992), and zygomorphisms (Malcolm, 1990a).

Automatic program transformation. Writing programs using recursion operators can simplify the process of optimisation during compilation. For example, eliminating the use of intermediate data structures in programs (deforestation) in considerably simplified when programs are written using recursion operators rather than general recursion (Wadler, 1981; Launchbury and Sheard, 1995; Takano and Meijer, 1995). A generic system for transforming programs written using recursion operators is currently under development (de Moor and Sittampalan, 1998).

Polytypic programming. Defining programs that are not specific to particular datatypes has given rise to a new field, called polytypic programming (Backhouse et al., 1998). Formally, a polytypic program is one that is parameterised by one or more datatypes. Polytypic programs have already been defined for a number of applications, including pattern matching (Jeuring, 1995), unification (Jansson and Jeuring, 1998), and various optimisation problems (Bird and de Moor, 1997).

Programming languages. A number of experimental programming languages have been developed that focus on the use of recursion operators rather than general recursion. Examples include the algebraic design language ADL (Kieburtz and Lewis, 1994), the categorical programming language Charity (Cockett and Fukushima, 1992), and the polytypic programming language PolyP (Jansson and Jeuring, 1997).

# Acknowledgements

I would like to thank Erik Meijer and the members of the Languages and Programming group in Nottingham for many hours of interesting discussions about fold . I am also grateful to Roland Backhouse, Mark P. Jones, Philip Wadler, and the anonymous $J F P$ referees for their detailed comments on the article, which led to a substantial improvement in both the content and presentation. This work is supported by Engineering and Physical Sciences Research Council (EPSRC) research grant GR/L74491, Structured Recursive Programming.

# References

Aarts, C., Backhouse, R., Hoogendijk, P., Voermans, E. and van der Woude, J. (1992) A relational theory of datatypes. Available on the World-Wide-Web: http://www.win.tue.nl/win/cs/wp/papers/papers.html.   
Backhouse, R., Jansson, P., Jeuring, J. and Meertens, L. (1998) Generic programming: An introduction. Lecture Notes of the 3rd International Summer School on Advanced Functional Programming.   
Backus, J. (1978) Can programming be liberated from the Von Neumann style? A functional style and its algebra of programs. Comm. ACM, 9.   
Barendregt, H. (1984) The Lambda Calculus – Its syntax and semantics. North-Holland.   
Bird, R. (1989) Constructive functional programming. Proc. Marktoberdorf International Summer School on Constructive Methods in Computer Science. Springer-Verlag.   
Bird, R. (1998) Introduction to Functional Programming using Haskell (2nd ed.). Prentice Hall.   
Bird, R. and de Moor, O. (1997) Algebra of Programming. Prentice Hall.   
Bird, R. and Meertens, L. (1998) Nested datatypes. In: Jeuring, J. (ed.), Proc. 4th International Conference on Mathematics of Program Construction: Lecture Notes in Computer Science 1422. Springer-Verlag.   
Bird, R. and Wadler, P. (1988) An Introduction to Functional Programming. Prentice Hall.   
Cockett, R. and Fukushima, T. (1992) About Charity. Yellow Series Report No. 92/480/18, Department of Computer Science, The University of Calgary.   
de Moor, O. and Sittampalan, G. (1998) Generic program transformation. Lecture Notes of the 3rd International Summer School on Advanced Functional Programming.   
Fegaras, L. and Sheard, T. (1996) Revisiting catemorphisms over datatypes with embedded functions. Proc. 23rd ACM SIGPLAN-SIGACT Symposium on Principles of Programming Languages.   
Fokkinga, M. (1994) Monadic maps and folds for arbitrary datatypes. Memoranda Informatica 94-28, University of Twente.   
Fokkinga, M., Jeuring, J., Meertens, L. and Meijer, E. (1991) Translating attribute grammars into catamorphisms. The Squiggolist, 2(1).   
Hutton, G. (1998) Fold and unfold for program semantics. Proc. 3rd ACM SIGPLAN International Conference on Functional Programming.   
Iverson, K. E. (1962) A Programming Language. Wiley.   
Jansson, P. and Jeuring, J. (1997) PolyP – a polytypic programming language extension. Proc. 24th ACM SIGPLAN-SIGACT Symposium on Principles of Programming Languages. ACM Press.   
Jansson, P. and Jeuring, J. (1998) Polytypic unification. J. Functional Programming (to appear).   
Jeuring, Jo. (1995) Polytypic pattern matching. Proc. 7th International Conference on Functional Programming and Computer Architecture. ACM Press.   
Jones, G. (1990) Designing circuits by calculation. Technical Report PRG-TR-10-90, Oxford University.   
Jones, G. and Sheeran, M. (1990) Circuit design in Ruby. In: Staunstrup (ed.), Formal Methods for VLSI Design. Elsevier.   
Jones, M. P. and Blampied, P. (1998) A pragmatic approach to maps and folds for parameterized datatypes. Submitted.   
Kieburtz, R. B. (1998) Reactive functional programming. Proc. PROCOMET. Chapman & Hall.   
Kieburtz, R. B. and Lewis, J. (1994) Algebraic Design Language (preliminary definition). Oregon Graduate Institute of Science and Technology.   
Kleene, S. C. (1952) Introduction to Metamathematics. Van Nostrand Rheinhold.   
Launchbury, J. and Sheard, T. (1995) Warm fusion: Deriving build-catas from recursive definitions. Proc. 7th International Conference on Functional Programming and Computer Architecture. ACM Press.   
Malcolm, G. (1990a) Algebraic data types and program transformation. PhD thesis, Groningen University.   
Malcolm, G. (1990b) Algebraic data types and program transformation. Science of Computer Programming, 14(2–3), 255–280.   
Meertens, L. (1983) Algorithmics: Towards programming as a mathematical activity. Proc. CWI Symposium.   
Meertens, L. (1992) Paramorphisms. Formal Aspects of Computing, 4(5), 413–425.   
Meijer, E. (1992) Calculating compilers. PhD thesis, Nijmegen University.   
Meijer, E. and Hutton, G. (1995a) Bananas in space: Extending fold and unfold to exponential types. Proc. 7th International Conference on Functional Programming and Computer Architecture. ACM Press.   
Meijer, E. and Jeuring, J. (1995b) Merging monads and folds for functional programming. In: Jeuring, J. and Meijer, E. (eds.), Advanced Functional Programming: Lecture Notes in Computer Science 925. Springer-Verlag.   
Meijer, E., Fokkinga, M. and Paterson, R. (1991) Functional programming with bananas, lenses, envelopes and barbed wire. In: Hughes, J. (ed.), Proc. Conference on Functional Programming and Computer Architecture: Lecture Notes in Computer Science 523. Springer-Verlag.   
Peterson, J. et al. (1997) The Haskell language report, version 1.4. Available on the World-Wide-Web: http://www.haskell.org.   
Reynolds, J. C. (1985) Three approaches to type structure. Proc. International Joint Conference on Theory and Practice of Software Development: Lecture Notes in Computer Science 185. Springer-Verlag.   
Sheard, T. and Fegaras, L. (1993) A fold for all seasons. Proc. ACM Conference on Functional Programming and Computer Architecture. Springer-Verlag.   
Swierstra, S. D., Alcocer, P. R. A. and Saraiva, J. (1998) Designing and implementing combinator languages. Lecture Notes of the 3rd International Summer School on Advanced Functional Programming.   
Takano, A. and Meijer, E. (1995) Shortcut deforestation in calculational form. Proc. 7th International Conference on Functional Programming and Computer Architecture. ACM Press.   
Wadler, P. (1981) Applicative style programming, program transformation, and list operators. Proc. ACM Conference on Functional Programming Languages and Computer Architecture.   
Wadler, P. (1990) Comprehending monads. Proc. ACM Conference on Lisp and Functional Programming.   
Wadler, P. (1992a). The essence of functional programming. Proc. Principles of Programming Languages.   
Wadler, P. (1992b) Monads for functional programming. In: Broy, M. (ed.), Proc. Marktoberdorf Summer School on Program Design Calculi. Springer-Verlag.