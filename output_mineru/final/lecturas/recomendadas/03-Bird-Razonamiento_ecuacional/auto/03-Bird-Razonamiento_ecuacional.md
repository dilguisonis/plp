# Chapter 6

# Proofs

We have seen a lot of laws in the previous two chapters, though perhaps the word ‘law’ is a little inappropriate because it suggests something that is given to us from on high and which does not have to be proved. At least the word has the merit of being short. All of the laws we have encountered so far assert the equality of two functional expressions, possibly under subsidiary conditions; in other words, laws have been equations or identities between functions, and calculations have been point-free calculations (see Chapter 4, and the answer to Exercise K for more on the point-free style). Given suitable laws to work with, we can then use equational reasoning to prove other laws. Equational logic is a simple but powerful tool in functional programming because it can guide us to new and more efficient definitions of the functions and other values we have constructed. Efficiency is the subject of the following chapter. This one is about another aspect of equational reasoning, proof by induction. We will also show how to shorten proofs by introducing a number of higher-order functions that capture common patterns of computations. Instead of proving properties of similar functions over and over again, we can prove more general results about these higher-order functions, and appeal to them instead.

# 6.1 Induction over natural numbers

Consider the following definition of the exponential function:

$$
\begin{array} { l l } { { \exp \mathrm { ~ : : ~ } \mathrm { N u m ~ a ~ } = > \mathrm { ~ a ~ }  \mathrm { ~ N a t ~ }  \mathrm { ~ a ~ } } } \\ { { \exp \mathrm { ~ x ~ } \mathrm { ~ Z e r o ~ } } } & { { = \mathrm { ~ 1 ~ } } } \\ { { \exp \mathrm { ~ x ~ } \mathrm { ~ ( S u c c ~ n ) ~ = ~ x ~ * ~ } \exp \mathrm { ~ x ~ n ~ } } } \end{array}
$$

In the old days we could have written

$$
\begin{array} { l } { { \exp \mathrm { \Large ~ : ~ } \mathrm { N u m ~ } \mathrm { \Large ~ a ~ } = \mathrm { \Large ~ > ~ \mathrm { \Large ~ a ~ } - > ~ \mathrm { \Large ~ I n t ~ } ~ } \mathrm { \Large ~ \to ~ \mathrm { \Large ~ a ~ } } } } \\ { { \mathrm { e x p ~ \mathrm { \Large ~ x ~ } ~ 0 ~ } = \mathrm { \Large ~ 1 ~ } } } \\ { { \mathrm { e x p ~ \mathrm { \Large ~ x ~ } ~ } \mathrm { \Large ~ ( n + 1 ) ~ } = \mathrm { \Large ~ x ~ * ~ } \exp \mathrm { \Large ~ x ~ } \mathrm { \Large ~ n ~ } } } \end{array}
$$

but this precise form of definition using a $\left( \mathtt { n } + 1 \right)$ -pattern is no longer allowed in the current standard version of Haskell, Haskell 2010.

Anyway, we would expect that the equation

$$
\exp { \mathrm { ~  ~ x ~ } } \left( \mathrm { m } + \mathrm { n } \right) = \exp { \mathrm { ~  ~ x ~ } } \mathrm {  ~ m ~ } ^ { * } \mathrm {  ~ \ e x p { ~ } \mit x ~ } \mathrm {  ~ n ~ }
$$

is true for all m and n. After all, ${ x ^ { m + n } } = { x ^ { m } } { x ^ { n } }$ is a true equation of mathematics. But how can we prove this law?

The answer, of course, is by induction. Every natural number is either Zero or of the form Succ n for some natural number n. That is exactly what the definition

data Nat $=$ Zero | Succ Nat

of the data type Nat tells us. So to prove that $P ( n )$ holds for all natural numbers $n$ , we can prove

1. $P ( 0 )$ holds;

2. For all natural numbers $n$ , that $P ( n + 1 )$ holds assuming that $P ( n )$ does.

We have reverted to writing 0 for Zero and $n + 1$ for Succ n, and we shall continue to do so. In the second proof we can assume $P ( n )$ and use this assumption to prove $P ( n + 1 )$ .

As an example we prove that

$$
\exp { \mathrm { ~  ~ x ~ } } \left( \mathrm { m } + \mathrm { n } \right) = \exp { \mathrm { ~  ~ x ~ } } \mathrm {  ~ m ~ } ^ { * } \mathrm {  ~ \ e x p { ~ } \mit x ~ } \mathrm {  ~ n ~ }
$$

for all $x , m$ and $n$ by induction on m. We could also prove it by induction on $n$ but that turns out to be more complicated. Here is the proof:

# Case 0

$$
\begin{array} { c c } { { \begin{array} { c c } { { \exp \mathrm { ~  ~ x ~ } \mathrm { ~ ( 0 ~ + ~ n ) ~ } } } \\ { { = } } \end{array} } } & { { \begin{array} { r l } { { \mathrm { ~  ~ \ e x p ~ } \mathrm { ~  ~ x ~ } 0 ~ * ~ \mathrm { e x p ~ } \mathrm { ~  ~ x ~ n ~ } } } \\ { { \mathrm { ~  ~ \ f s i n c e ~ } 0 ~ + ~ { \mathrm { ~ n ~ } } = ~ { \mathrm { ~ n ~ } } } } \end{array} } } & { { \mathrm { ~  ~ \Gamma ~ } } } \\ { { \mathrm { ~  ~ \ e x p ~ } \mathrm { ~  ~ x ~ n ~ } } } & { { \mathrm { ~  ~ 1 ~ } * ~ \mathrm { e x p ~ } \mathrm { ~  ~ x ~ n ~ } } } \\ { { \mathrm { ~  ~ \Gamma ~ } } } & { { = } } & { { \begin{array} { r l } { { \mathrm { ~  ~ \{ ~ \ s i n c e ~ } 1 ~ } * ~ \mathrm { x ~ } = ~ { \mathrm { ~ x ~ } } } } \end{array} }  \end{array}
$$

Case $\mathtt { m } + 1$

$$
\begin{array} { r l } & { \mathrm { ~ \exp ~ x ~ \left( ( m ~ + ~ 1 ) ~ + ~ n \right) ) ~ } } \\ { = } & { \mathrm { ~ \{ a r i t h m e t i c \} ~ } } \\ & { \mathrm { ~ \exp ~ x ~ \left( ~ ( m ~ + ~ n ) ~ + ~ 1 ~ \right. ~ } } \\ & { \mathrm { ~ \left. ~ \{ e x p . 2 \} ~ \right. ~ } } \\ & { \mathrm { ~ \textbf { x } ~ * ~ \ e x p ~ x ~ \left( ~ m ~ + ~ n \right) ~ } } \\ { = } & { \mathrm { ~ \{ i n d u c t i o n \} ~ } } \\ & { \mathrm { ~ \textbf { x } ~ * ~ \left( ~ e x p ~ x ~ m ~ * ~ e x p ~ x ~ n \right) ~ } } \end{array}
$$

The above format will be used in all induction proofs. The proof breaks into two cases, the base case 0 and the inductive case $n + 1$ . Each case is laid out in two columns, one for the left-hand side of the equation, and one for the right-hand side. (When there is not enough space for two columns, we display one after the other.) Each side is simplified until one can go no further, and the proof of each case is completed by observing that each side simplifies to the same result. The hints exp.1 and exp.2 refer to the first and second equations defining exp.

Finally, observe that the proof depends on three further laws, namely that

$$
\begin{array} { l c l } { { ( \mathtt { m } ~ + ~ 1 ) ~ + ~ \mathtt { n } ~ = ~ \mathtt { ( m } ~ + ~ \mathtt { n ) } ~ + ~ 1 } } \\ { { \mathtt { 1 } ~ * ~ \mathtt { x } ~ } } & { { = ~ \mathtt { x } ~ } } \\ { { ( \mathtt { x } ~ * ~ \mathtt { y } ) ~ * ~ \mathtt { z } ~ = ~ \mathtt { x } ~ * ~ ( \mathtt { y } ~ * ~ \mathtt { z } ) ~ } } \end{array}
$$

If we were recreating all of arithmetic from scratch – and that would be a tedious thing to do – we would also have to prove these laws. In fact, only the first can be proved because it is entirely about natural numbers and we have defined the operation of addition on natural numbers. The second two rely on the implementation of multiplication prescribed by Haskell for the various instances of the type class Num.

In fact, the associative law breaks down for floating-point numbers:

ghci> $( 9 . 9 { \tt e } 1 0 \ * \ 0 . 5 { \tt e } { - 1 0 } ) \ * \ 0 . 1 { \tt e } { - 1 0 } \ : : \ \mathrm { F } 1 { \tt o } { \tt a } \mathrm { t }$ 4.95e-11  
$\mathrm { g h c i > ~ 9 . 9 e 1 0 ~ * ~ ( 0 . 5 e - 1 0 ~ * ~ 0 . 1 e - 1 0 ) }$ :: Float4.9499998e-11

Recall that in scientific notation $9 . 9 { \tt e } 1 0 $ means $9 . 9 * 1 0 \widehat { \mathrm { \Omega } } 1 0 .$ . So, although our proof was correct mathematically, one of the provisos in it wasn’t, at least in Haskell.

# 6.2 Induction over lists

We have seen that every finite list is either the empty list $\left[ \begin{array} { l l l l l l l } \end{array} \right]$ or of the form $\tt x : \tt x s$ where xs is a finite list. Hence, to prove that $P ( x s )$ holds for all finite lists $x s$ , we can prove:

1. $P ( [ ] )$ holds;

2. For all x and for all finite lists xs, that $P ( { \bf x } : { \bf x } { \bf s } )$ holds assuming $P ( { \bf x } { \bf s } )$ does.

As an example, recall the definition of concatenation $( + + )$ :

$$
\begin{array} { l } { { [ ] \ + + \ \mathrm { y } \mathrm { s } \ \qquad \ = \ \mathrm { y } \mathrm { s } } } \\ { { ( \mathrm { x } : \mathrm { x } \mathrm { s } ) \ + + \ \mathrm { y } \mathrm { s } \ = \ \mathrm { x } \ : \ ( \mathrm { x } \mathrm { s } \ + + \ \mathrm { y } \mathrm { s } ) } } \end{array}
$$

We prove that $^ { + + }$ is associative:

$$
\mathrm { ( x s ~ + + ~ \ y s ) ~ + + ~ z s ~ = ~ x s ~ + + ~ ( y s ~ + + ~ z s ) }
$$

for all finite lists xs and for all lists ys and zs (note that neither of the last two is required to be a finite list), by induction on xs:

# Case []

$$
\begin{array} { c c }   \displaystyle ( \begin{array} { c c } { { [ \begin{array} { c c } { { 2 } } \end{array}  ( + + \begin{array} { c c } { { { \bf y } { \bf s } } } \end{array} ) } } & { { + + \begin{array} { c c } { { { \bf z } { \bf s } } } \end{array}  } } \\ { { \displaystyle = } } & { {  \{ + + \begin{array} { c c } { { { \bf \sigma } } } \end{array}  } } \end{array} \end{array}
$$

$$
\begin{array} { r l r } { \left. { \big [ \big ] } \right)} & { { } + + \mathrm { \nabla \left( y { \bf s } \right. \ s + + \ r z s  } } \\ & { = } & { \left\{ + + { \bf \nabla } . 1 \right\} } \end{array}
$$

Case x:xs

$$
\begin{array} { r l } & { \mathrm { ( \Gamma ( x : x s ) ~ + + ~ y s ) ~ + + ~ z s } } \\ & { = \mathrm { ~ \Gamma ~ \{ + + . 2 \} ~ } } \\ & { \mathrm { ( x : \Gamma ( x s ~ + + ~ y s ) ) ~ + + ~ z s } } \\ & { = \mathrm { ~ \Gamma ~ \{ + + . 2 \} ~ } } \\ & { \mathrm { ~ x : \Gamma ( \Omega ( x s ~ + + ~ y s ) ~ + + ~ z s ) ~ } } \end{array}
$$

$$
\begin{array} { r l } & { \mathrm { ( x : x s ) ~ + + ~ ( y s ~ + + ~ z s ) } } \\ & { \mathrm { = ~ \{ + + . 2 \} ~ } } \\ & { \mathrm { ~ x : ( x s ~ + + ~ ( y s ~ + + ~ z s ) ) } } \\ & { \mathrm { = ~ \{ i n d u c t i o n \} ~ } } \\ & { \mathrm { ~ x : ( ~ ( x s ~ + + ~ y s ) ~ + + ~ z s ) } } \end{array}
$$

As another example, given the definition

$$
\begin{array} { l l l } { { \mathrm { r e v e r s e } } } & { { \mathrm { [ ] } } } & { { = } } & { { \mathrm { [ ] } } } \\ { { \mathrm { r e v e r s e } } } & { { \mathrm { ( x : x s ) } } } & { { = } } & { { \mathrm { r e v e r s e } \mathrm { x s } + + \mathrm { [ x ] } } } \end{array}
$$

We prove that reverse is an involution:

for all finite lists xs. The base case is easy and the inductive case proceeds:

Case x:xs

reverse (reverse (x:xs))   
= {reverse.2} reverse (reverse xs $^ { + + }$ [x])   
= {????} x:reverse (reverse xs)   
= {induction} x:xs

The right-hand column is omitted in this example, since it consists solely of $\tt x : \tt x s$ But we got stuck in the proof halfway through. We need an auxiliary result, namely that

for all finite lists ys. This auxiliary result is also proved by induction:

# Case []

${ \begin{array} { r l } & { { \mathrm { ~ r e v e r s e ~ ( [ \lambda ] ~ + + ~ [ x ] ) } } } \\ { = } & { \left\{ + + . ~ { \mathrm { 1 } } \right\} } \\ & { { \mathrm { ~ r e v e r s e ~ [ x ] } } } \\ { = } & { \left\{ { \mathrm { r e v e r s e ~ } } { \mathrm { 2 } } { \mathrm { } } \right\} } \\ & { { \mathrm { ~ r e v e r s e ~ [ \lambda ] ~ + + ~ [ x ] } } } \\ { = } & { \left\{ { \mathrm { [ r e v e r s e ~ . 1 ~ a n d ~ + + ~ . 1 ] } } \right\} } \\ & { [ { \mathrm { x } } ] } \end{array} }$ = x:reverse [] {reverse.1} [x]

# Case y:ys

reverse ((y:ys) $^ { + + }$ [x]) x:reverse (y:ys)   
= {++.2} = {reverse.2} reverse (y:(ys ++ [x])) x:(reverse ys $^ { + + }$ [y])   
= {reverse.2} reverse (ys ++ [x]) $^ { + + }$ [y]   
= {induction} (x:reverse ys) $^ { + + }$ [y]   
= {++.2} x:(reverse ys $^ { + + }$ [y])

The auxiliary result holds, and therefore so does the main result.

# Induction over partial lists

Every partial list is either the undefined list or of the form $\tt x : \tt x s$ for some $\mathtt { x }$ and some partial list xs. Hence, to prove that $P ( x s )$ holds for all partial lists $x s$ we can prove that

1. $P$ (undefined) holds;

2. $P ( \mathbf { x } : \mathbf { x } \mathbf { s } )$ holds assuming $P ( { \bf x } { \bf s } )$ does, for all $\mathtt { x }$ and all partial lists xs.

As an example, we prove that

$$
\bf { x 8 } _ { \Delta } + \bf { + \Delta } \ y \bf { s } _ { \Delta } = \ x \bf { s }
$$

for all partial lists xs and all lists ys:

Case undefined

$$
\begin{array} { r l r } { = } & { { } } & { \left\{ + + . 0 \right\} } \end{array}
$$

Case x:xs

$$
\begin{array} { c } { { \begin{array} { l } { { \mathrm { ( x : x s ) ~ + + ~ y s } } } \\ { { } } \\ { { = \begin{array} { c } { { \mathrm { \{ + + . 2 \} } } } \\ { { \mathrm { x : ( x s  ~ + + ~ y s ) } } } \end{array} } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \\ { { \mathrm { } } } \end{array} } } \end{array}
$$

In each case the trivial right-hand column is omitted. The hint $\left( + + \right) . 0$ refers to the failing clause in the definition of $( + + ) { : }$ since concatenation is defined by pattern matching on the left-hand argument, the result is undefined if the left-hand argument is.

# Induction over infinite lists

Proving that something is true of all infinite lists requires a bit of background that we will elaborate on in a subsequent chapter. Basically an infinite list can

be thought of as the limit of a sequence of partial lists. For example, [0..] is the limit of the sequence

undefined, 0:undefined, 0:1:undefined, 0:1:2:undefined,

and so on. A property $P$ is called chain complete if whenever $x s _ { 0 } , x s _ { 1 } , \ldots$ is a sequence of partial lists with limit $x s$ , and $P ( x s _ { n } )$ holds for all $n$ , then $P ( x s )$ also holds.

In other words, if $P$ is a chain complete property that holds for all partial lists (and possibly all finite lists too), then it holds for all infinite lists.

Many properties are chain complete; for instance:

• All equations $e 1 = e 2$ , where $_ { e 1 }$ and $^ { e 2 }$ are Haskell expressions involving universally quantified free variables, are chain complete. • If $P$ and $Q$ are chain complete, then so is their conjunction $P \land Q$ .

But inequalities $e 1 \neq e 2$ are not necessarily chain complete, and neither are properties involving existential quantification. For example, consider the assertion

drop n xs $=$ undefined

for some integer n. This property is obviously true for all partial lists, and equally obviously not true for any infinite list.

Here is an example proof. Earlier we proved that

$$
\mathrm { ( x s ~ + + ~ \ y s ) ~ + + ~ z s ~ = ~ x s ~ + + ~ ( y s ~ + + ~ z s ) }
$$

for all finite lists xs and for all lists ys and zs. We can extend this chain complete property to all lists xs by proving

Case undefined

$$
\begin{array} { r l r } { = } & { { } } & { \left\{ + + . 0 \right\} } \end{array}
$$

Thus $^ { + + }$ is a truly associative operation on lists, independent of whether the lists are finite, partial or infinite.

But we have to be careful. Earlier we proved reverse (reverse xs) = xs

for all finite lists xs. Can we extend this property to all lists by proving the following additional case?

Case undefined reverse (reverse undefined) {reverse.0} undefined

That goes through but something is wrong: as a Haskell equation we have for all partial lists xs. What did we miss?

The answer is that in proving the involution property of reverse we made use of an auxiliary result:

for all finite lists ys. This result is not true for all lists, indeed not true for any partial list ys.

It follows that reverse . reverse is not the identity function on lists, A functional equation $\mathbf { f } ~ = ~ \mathbf { g }$ over lists asserts that f $\mathtt { x s } \ = \ \mathtt { g }$ xs for all lists xs, finite, partial and infinite. If the equation is true only for finite lists, we have to say so explicitly.

# 6.3 The function foldr

All the following functions have a common pattern:

$$
\begin{array} { l l l } { \mathbf { s u m } } &  \left[ \begin{array} { l l l } { \right] } & { = ~ 0 } \\ { \mathbf { s u m } } & { \left( \mathbf { x } : \mathbf { x s } \right) } & { = ~ \mathbf { x } ~ + ~ \mathbf { s u m } ~ \mathbf { x } \mathbf { s } } \end{array} \end{array}
$$

filter p [] $= ~ [ ]$ filter p $\begin{array} { r } { \left( \mathbf { x } : \mathbf { x } \mathbf { s } \right) \ = \ \mathrm { i } \mathbf { f } \ \texttt { p } \mathbf { x } } \end{array}$ then x:filter p xs else filter p xs

map f [] = [] map f (x:xs) = f x:map f xs

Similarly, the proofs by induction of the following laws all have a common pattern:

Can we not ensure that the functions above are defined as instances of a more general function, and the laws above as instances of a more general law? That would save a lot of repetitive effort.

The function foldr (fold from the right) is defined by

$$
\begin{array} { l } { { \tt f o l d r \ : \ ( a \ - > \ b \ - > \ b ) \ - > \ b \ - > \ [ a ] \ - > \ b } } \\ { { \tt f o l d r \  f \ { \tt e } \ [ ] \ \ } } \\ { { \tt f o l d r \  f \ \in \ \ ( x : x s ) \ = \ f \ x \ ( f o l d r \  f \ { \tt e } \ x s ) } } \end{array}
$$

To appreciate this definition, consider

$$
\begin{array} { l l l l l l l } { { \bf f o l d r } } & { { ( \circledcirc ) } } & { { \circ } } & { { [ { \bf x } , { \bf y } , { z } ] } } & { { = { \textbf { x } } \otimes { \bf \Xi } ( { \bf y } } } & { { \odot } } & { { ( { \bf z } \otimes { \bf \Xi } \circ { \bf \Lambda } \circ ) ) } } \\ { { } } & { { } } & { { } } & { { [ { \bf x } , { \bf y } , { z } ] } } & { { = { \bf \Lambda } { \bf x } : { \bf \Lambda } ( { \bf y } } } & { { : { \bf \Lambda } ( { \bf z } { \bf \Lambda } : { \bf \Lambda } [ { \bf \Lambda } ] ) ) } } \end{array}
$$

In other words, foldr (@) e applied to a list replaces the empty list by $\ominus$ , and (:) by $( \Subset )$ and evaluates the result. The parentheses group from the right, whence the name.

It follows at once that foldr (:) [] is the identity function on lists. Furthermore,

sum $=$ foldr (+) 0   
concat $=$ foldr $\left( + + \right)$ ) []   
filter $\mathrm { ~ p ~ } =$ foldr (\x xs $- >$ if p x then x:xs else xs) []   
map f $=$ foldr ((:) . f) []

The following fact captures all the identities mentioned above:

for some operation (@) satisfying various properties. We prove this equation by induction on xs. Along the way, we discover what properties of f, e and (@) we need.

# Case []

Hence we need e $\emptyset \texttt { X } = \texttt { X }$ for all $\mathtt { x }$

Case x:xs

$$
\begin{array} { r l } & { \mathrm { ~ f o l d r ~  { \mathrm {  ~ f ~ } } { \mathrm {  ~ \Lambda ~ } } ~ } } \\ & { = \mathrm {  ~  { \left\{ ~ \Lambda ~ \right\} } ~ } } \\ & { \mathrm {  ~  { \ f o l d r } ~ } \mathrm {  ~  { f ~ } { \mathrm {  ~ \Lambda ~ } } ~ } } \\ & { = \mathrm {  ~  { \left\{ ~ f \ o l d r \mathrm {  ~ \Lambda ~ } \right\} ~ } } } \\ & { \mathrm {  ~  { \mathrm {  ~ \Lambda ~ } } ~ } } \\ & { \mathrm {  ~  { \mathrm {  ~ f ~ } } { \mathrm {  ~  { \alpha ~ } } } ~ } } \\ & { = \mathrm {  ~  { \left\{ ~ \Lambda ~ \right\} } ~ } } \\ & { \mathrm {  ~  { \mathrm {  ~ f ~ } } { \mathrm {  ~  { \alpha ~ } } } ~ } } \\ & { = \mathrm {  ~  { \left\{ ~ i n d u c t i o n \right\} ~ } } } \end{array}
$$

The right-hand side in this case simplifies to

f x (foldr f e xs) @ foldr f e ys

So, in summary, we require that

$$
\begin{array} { l l l l l } { \texttt { e } \texttt { \textregistered } \texttt { x } } & { = \texttt { x } } & { } \\ { \texttt { f x } \texttt { ( y \textQ \textsf { z } ) } = \texttt { f x y } \texttt { \textQ z } } & { } \end{array}
$$

for all x, y and z. In particular the two requirements are met if $\begin{array}{c} \begin{array} { l } { \mathbf { \displaystyle f } } \end{array} = \begin{array} { l } { \displaystyle ( \array} { \ I _ { \mathbf { \updownarrow } } } \end{array}  \end{array}$ and (@) is associative with identity e. That immediately proves

$$
\begin{array} { l c l } { { \mathrm { s u m } } } & { { \mathrm { ( x s ~ + + ~ { \ y s } ) } } } & { { = \mathrm { ~ s u m ~ \ x s ~ + ~ { \ s u m } ~ { \ y s } ~ } } } \\ { { \mathrm { c o n c a t } } } & { { \mathrm { ( x s s ~ + + ~ { \ y s s } ) } } } & { { = \mathrm { ~ c o n c a t ~ \ x s s ~ + + ~ { \ c o n s s } ~ { \ t s } ~ } } } \end{array}
$$

For the map law, we require that

$$
\begin{array} { l }  { \left[ \begin{array} { l l l } { {  } } & { { + + } } & { { \bf x s \Delta = \ x s } } \\ { { \bf f \Delta \ x : ( x s { \Delta \bf { s } } + { \bf { \Delta } y } s ) \Delta { \bf { s } } } } \end{array} = \begin{array} { l } { { \left( { \bf { f \Delta \ x } : y } { \bf { s } } \right) { \bf { \Delta } } + { \bf { \Delta } } } } \end{array} { \bf y } { \bf s } } \end{\right]array} \end{array}
$$

Both immediately follow from the definition of concatenation.

For the law of filter we require that

if p x then $\mathbf { x } : \left( \mathbf { y } \mathbf { s } \ \mathbf { \sigma } + \mathbf { + } \mathbf { \sigma } \mathbf { z } \mathbf { s } \right)$ else ys $^ { + + }$ z s $=$ (if p x then x:ys else ys) $^ { + + }$ zs

This is immediate from the definitions of concatenation and conditional expressions.

Fusion

The most important property of foldr is the fusion law, which asserts that

f . foldr $\tt { g } \ a \mathrm { ~ = ~ }$ foldr h b

provided certain properties of the ingredients hold. As two simple examples,

double . sum $=$ foldr ( $( + )$ . double) 0   
length . concat $=$ foldr ( $( + )$ . length) 0

In fact, many of the laws we have seen already are instances of the fusion law for foldr. In a word, the fusion law is a ‘pre-packaged’ form of induction over lists.

To find out what properties we need, we carry out an induction proof of the fusion law. The law is expressed as a functional equation, so we have to show that it holds for all finite and all partial lists:

Case undefined

f (foldr g a undefined) foldr h b undefined = {foldr.0} {foldr.0} f undefined undefined

So the first condition is that f is a strict function.

# Case []

f (foldr g a []) foldr h b [] = {foldr.1} = {foldr.1} f a b

The second condition is that f $a ~ = ~ b$ .

Case x:xs

f (foldr g a (x:xs)) foldr h b (x:xs) = {foldr.2} = {foldr.2} f (g x (foldr g a xs)) h x (foldr h b xs) = {induction} h x (f (foldr g a xs))

The third condition is met by f $( \texttt { g x y } ) \ = \texttt { h x } ( \texttt { f y } )$ for all x and y.

Let us apply the fusion law to show that foldr f a . map $\mathrm { ~ g ~ } =$ foldr h a

Recall that map $\mathrm { ~ g ~ } =$ foldr ((:) . g) []. Looking at the conditions of the fusion law we have that

So the first two fusion conditions are satisfied. The third one is

The left-hand side simplifies to f $( \ g \ x )$ (foldr f a xs)

so we can define h $\texttt { x y } = \texttt { f } \ \left( \texttt { g x } \right)$ y. More briefly, $\mathrm { ~ \tt ~ h ~ } = \mathrm { ~ \tt ~ f ~ }$ . g. Hence we have the useful rule:

foldr f a . map $\mathrm { ~ g ~ } =$ foldr (f . g) a

In particular,

double . sum $=$ sum . map double $=$ foldr ( $( + )$ . double) 0 length . concat $=$ sum . map length $=$ foldr ( $( + )$ . length) 0

Other simple consequences of the fusion law are explored in the exercises.

# A variant

Sometimes having the empty list around is a pain. For example, what is the minimum element in an empty list? For this reason, Haskell provides a variant on foldr, called foldr1, restricted to nonempty lists. The Haskell definition of this function is

$$
\begin{array} { l } { \mathbf { f o l d r 1 } : : \left( \mathbf { a \Sigma } \mathbf { - } > \mathbf { a } - > \mathbf { a } \right) \mathbf { - } > \mathbf { \Sigma } [ \mathbf { a } ] \mathbf { \Sigma } \mathbf { - } > \mathbf { a } } \\ { \mathbf { f o l d r 1 } \mathbf { f } \mathbf { \Sigma } [ \mathbf { x } ] \ \qquad \mathbf { = } \mathbf { x } \qquad \ \ } \\ { \mathbf { f o l d r 1 } \ \mathbf { f } \mathbf { \Sigma } ( \mathbf { x } : \mathbf { x } \mathbf { s } ) \ = \mathbf { f } \ \mathbf { x } \ ( \mathbf { f o l d r 1 } \ \mathbf { f } \mathbf { \Sigma } \mathbf { \ x } \mathbf { s } ) } \end{array}
$$

So we can define

minimum, maximum :: Ord a $\Rightarrow$ [a] -> a   
minimum $=$ foldr1 min   
maximum $=$ foldr1 max

and avoid two other explicit recursions. Actually the Haskell definition of foldr1 is not as general as it should be, but we will leave that discussion to an exercise.

# 6.4 The function foldl

Recall that

$$
\begin{array} { c c l c c c l } { \pmb { \operatorname { f o l d r } } } & { ( \circledcirc ) } & { \textnormal { \texttt { e } } [ \mathbf { w } , \mathbf { x } , \mathbf { y } , \mathbf { z } ] } & { = \textnormal { w } \textnormal { \texttt { \textregistered } } ( \mathbf { x } } & { \textcircled { \circ } } & { ( \mathbf { y } } & { \textcircled { \circ } } & { ( \mathbf { z }  \textnormal { \texttt { \text O } } ) ) ) } \end{array}
$$

Sometimes a more convenient pattern for the right-hand side is

$$
( ( ( { \texttt { e } } { \texttt { Q } } { \texttt { w } } ) \texttt { Q } { \texttt { x } } ) \texttt { Q } { \texttt { y } } ) \texttt { Q } { \texttt { z } }
$$

This pattern is encapsulated by a function foldl (fold from the left):

$$
\begin{array} { l } { \mathtt { f o l d l } \ : : \ \mathtt { ( b \ \ - > \ \mathtt { a } \ - > \ \mathtt { b } ) } \ \mathtt { - > \ \mathtt { b } \ - > \ \mathtt { [ a ] } \ - > \ \mathtt { b } \ \mathtt { b } \ - > \ \mathtt { [ a ] } \ \ - > \ \mathtt { b } \ } } \\ { \mathtt { f o l d l } \ \mathtt { f } \ \mathtt { e } \ \rVert \ } \\ { \mathtt { f o l d l } \ \mathtt { f } \ \mathtt { e } \ \ \mathtt { ( x : x s ) } \ = \ \mathtt { f o l d l } \ \mathtt { f } \ \ ( \mathtt { f } \ \ \mathtt { e } \ \ \mathtt { x } ) \ \mathtt { x s } } \end{array}
$$

As an example, suppose we are given a string, such as 1234.567, representing a real number and we want to compute its integer part and fractional part. We could define

ipart :: String $- >$ Integer ipart xs $=$ read (takeWhile (/= '.') xs) :: Integer fpart :: String $- >$ Float fpart xs $=$ read ('0':dropWhile (/= '.' xs) :: Float

This uses the function read of the type class Read. Note by the way that .567 is not a well-formed literal in Haskell. It is necessary to include at least one digit before and after the decimal point to ensure that the decimal point cannot be mistaken for functional composition. For example,

ghci> :t 3 . 4 3 . 4 :: (Num (b -> c), Num (a -> b)) => a -> c

As an alternative, we can define

We have

$$
\begin{array} { l } { 1 2 3 4 \mathrm { ~  ~ { ~ = ~ } ~ } 1 * 1 0 0 0 \mathrm { ~  ~ { ~ + ~ } ~ } 2 * 1 0 0 \mathrm { ~  ~ { ~ + ~ } ~ } 3 * 1 0 \mathrm { ~  ~ { ~ + ~ } ~ } 4 } \\ { \mathrm { ~  ~ { ~ = ~ } ~ } \left( \left( \left( 0 * 1 0 \mathrm { ~ + ~ } 1 \right) * 1 0 \mathrm { ~ + ~ } 2 \right) * 1 0 \mathrm { ~ + ~ } 3 \right) * 1 0 \mathrm { ~ + ~ } 4 } \\ { 0 . 5 6 7 \mathrm { ~  ~ { ~ = ~ } ~ } 5 / 1 0 \mathrm { ~  ~ { ~ + ~ } ~ } 6 / 1 0 0 \mathrm { ~  ~ { ~ + ~ } ~ } 7 / 1 0 0 0 } \\ { \mathrm { ~  ~ { ~ = ~ } ~ } \left( 5 \mathrm { ~ + ~ } \left( 6 \mathrm { ~ + ~ } \left( 7 \mathrm { ~ + ~ } 0 \right) / 1 0 \right) / 1 0 \right) / 1 0 } \end{array}
$$

so use of foldl for the integer part and foldr for the fractional part are both indicated.

Here is another example. The function reverse was defined above by the equations

$$
\begin{array} { l l l } { { \mathrm { r e v e r s e ~ \left[ \mathrm { 1 } \right] ~ } } } & { { = } } & { { \left[ \mathrm { 1 } \right] } } \\ { { \mathrm { r e v e r s e ~ \left( x : x s \right) ~ } } } & { { = } } & { { \mathrm { r e v e r s e ~ \left[ x s \right] ~ } + + \left[ \mathrm { x } \right] } } \end{array}
$$

We are wiser now and would now write

$$
\begin{array} { l } { { \tt r e v e r s e \ = \  f o l d r ~ s n o c ~ [ ] } } \\ { { { \tt w h e r e ~ s n o c ~ x ~ x s ~ = ~ x s ~ + + ~ [ x ] } } } \end{array}
$$

But a little learning is a dangerous thing: both definitions of reverse are terrible because they take of the order of $n ^ { 2 }$ steps to reverse a list of length n. Much better is to define

where flip f $\texttt { x y } = \texttt { f }$ y x. The new version reverses a list in linear time:

foldl (flip (:)) [] [1,2,3] $=$ foldl (flip (:)) (1:[]) [2,3] $=$ foldl (flip (:)) (2:1:[]) [3] $=$ foldl (flip (:)) (3:2:1:[]) [] = 3:2:1:[]

That seems a bit of a trick, but there is a sound principle at work behind this new definition that we will take up in the following chapter.

As this example suggests, there are the following relationships between foldr and foldl: for all finite lists xs we have

Proofs are left as an exercise. Note the restriction to finite lists, even though both sides reduce to $\perp$ when xs is $\perp$ . That means the proofs have to rely on a subsidiary result that is true only for finite lists.

Here is another relationship between the two folds:

for all finite lists xs, provided that

$$
\begin{array} { l } { \mathrm { ~ ( ~ x ~ < > ~ y ~ ) ~ } \texttt { \ Q } \texttt { z } = \texttt { x } < > \mathrm { ~ ( ~ y ~ \textcircled ~ z ~ ) ~ } } \\ { \texttt { e } \texttt { Q x } } \\ { \texttt { e } \texttt { Q x } } \end{array}
$$

Again, the proof is left as an exercise. As one instructive application of this law, suppose $( < > ) ~ = ~ ( \emptyset )$ and $( \Subset )$ is associative with identity e. Then the two provisos are satisfied and we can conclude that

for all finite lists xs whenever (@) is associative with identity e. In particular, concat xss $=$ foldr $( + + )$ [] xss $=$ foldl $( + + )$ ) [] xss for all finite lists xss. The two definitions are not the same if xss is an infinite list:

ghci> foldl $( + + )$ ) [] [[i] | i <- [1..]] Interrupted.   
ghci> foldr $( + + )$ ) [] [[i] | i <- [1..]] [1,2,3,4,{Interrupted}

In response to the first expression, GHCi went into a long silence that was interrupted by pressing the ‘Stop program execution’ button. In response to the second, GHCi started printing an infinite list.

OK, so the definition in terms of foldr works on infinite lists, but the other one doesn’t. But maybe the definition of concat in terms of foldl leads to a more efficient computation when all the lists are finite? To answer this question, observe that

$$
\begin{array} { l }  \mathtt { f o l d r \_ ( + + ) } \mathtt { [ \begin{array} { l } { \mathtt { [ \begin{array} { l } { \mathtt { \Gamma } } \end{ [ \begin{array} { l } { \mathtt { X } } \end{array} , \mathtt { y } \mathtt { S } , \mathtt { u } \mathtt { S } , \mathtt { v } \mathtt { S } ] } } \\ { \mathtt { [ \begin{array} { l } { \mathtt { X } } \end{ S } \_ + + \mathtt { \Gamma } } \end{array}  ( \mathtt { y } \mathtt { S } \ + + \mathtt { \Gamma } ( \mathtt { u } \mathtt { S } \ + + \mathtt { \Gamma } ( \mathtt { v } \mathtt { S } \ + + \mathtt { \Gamma } [ \mathtt { J } ) ) ) } \end{array} ] } } \end{array} \end{array}
$$

$$
\begin{array} { r } { \begin{array} { l l l l l l l } { \mathtt { f o l d 1 } } & { ( + + ) } & { [ ] } & { [ \mathtt { x s } , \mathtt { y s } , \mathtt { u s } , \mathtt { v s } ] } & & & \\ & { = } & { ( ( ( ( { \mathtt { [ \mathtt { \mathtt { I } } } } \ + \mathtt { \mathtt { x } } \mathtt { s } ) \ + \mathtt { \mathtt { y } } \mathtt { s } ) \ + + \mathtt { \mathtt { y } } \mathtt { s } ) \ + + \mathtt { \mathtt { u s } } ) \ + + \mathtt { \mathtt { v } } \mathtt { s } ) } & & & \end{array} } \end{array}
$$

Let all the component lists have length $n$ . The first expression on the right takes $4 n$ steps to perform all the concatenations, while the second takes $0 + n + ( n + n ) +$ $( n + n + n ) = 6 n$ steps. Enough said, at least for now.

# 6.5 The function scanl

The function scanl f e applies foldl f e to each initial segment of a list. For example

ghci> scanl (+) 0 [1..10] [0,1,3,6,10,15,21,28,36,45,55]

The expression computes the running sums of the first ten positive numbers:

The specification of scanl is

scanl :: $( { b \ - > \ a \ - > \ b } ) - > { b \ - > \ [ a ] \ - > \ [ b ] }$ scanl f e $=$ map (foldl f e) . inits

inits :: [a] -> [[a]]   
inits [] $=$ [[]]   
inits (x:xs) $=$ [] : map (x:) (inits xs)

For example

ghci> inits "barbara" ["","b","ba","bar","barb","barba","barbar","barbara"]

The function inits is in the library Data.List.

But this definition of scanl f involves evaluating f a total of

$$
0 + 1 + 2 + \cdots + n = n ( n + 1 ) / 2
$$

times on a list of length $n$ . Can we do better?

Yes, we can calculate a better definition by doing a kind of induction proof, except that we don’t know what it is we are proving!

Case []

$$
\begin{array} { r l } & { \mathrm { s c a n 1 ~ f ~ e ~ } [ ] } \\ { = } & { \{ \mathrm { d e f i n i t i o n } \} } \\ & { \mathrm { ~ n a p ~ ( \ f o l a l ~ \ f ~ e ~ ) ~ ( i n i t ) } } \\ { = } & { \{ \mathrm { i n i t s . ~ 1 } \} } \\ & { \mathrm { ~ n a p ~ ( \ f o l a l ~ \ f ~ e ~ ) ~ [ I ] ~ } } \\ { = } & { \{ \mathrm { m a p . ~ 1 ~ a n d ~ m a p . ~ 2 } \} } \\ & { \mathrm { ~ [ f o l a l ~  { \mathrm { d } } ~  { \mathrm { e ~ \imath } } ~  { \mathrm { f } } ~  { \mathrm { e ~ \imath } } ~ [  { \mathrm { I } } ] ] } } \\ & { = } & { \{ \mathrm { f o l a l ~  { \mathrm { d } } ~  { \mathrm { 1 } } ~ } \} } \\ & { = } & { \{ \mathrm { f o l a l ~  { \mathrm { 1 } } ~ } \} } \end{array}
$$

Hence we have shown that scanl f e [] = [e]

Case x:xs

$$
{ \begin{array} { r l } & { = \{ \begin{array} { l l } { \operatorname { d e f f i n i t i o n } } \\ & { = \{ \begin{array} { r l } { ( \operatorname { d e f f i n i t i o n } ) } & \\ { \operatorname { i n f } ( \operatorname { d e f f } \operatorname { d } \operatorname { d } \operatorname { d } \operatorname { d } \operatorname { d } \operatorname { d } \operatorname { d } \operatorname { d } \operatorname { \operatorname { \mathbb { \ { \ } } } } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname } \\ { =  { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { } } \operatorname { } \operatorname { } \operatorname { } \operatorname { } \operatorname { }  \operatorname { } \operatorname { } \operatorname { } \operatorname { }  \operatorname { } \operatorname { } \operatorname { }  \operatorname { } \operatorname { } \operatorname { }  \\ { = \operatorname { } { } \operatorname { } { } \operatorname { } { } \operatorname { } { } \operatorname { } } \operatorname { } { } \operatorname { } { } \operatorname { } \operatorname { } { } \operatorname { }  \operatorname { } { } \operatorname { } \operatorname { } { } \operatorname { }  \operatorname { } { } \operatorname { } \operatorname { }  \operatorname { } { } \operatorname { } \{  \operatorname { } \operatorname { }  \operatorname { } { } \operatorname { } \operatorname { }  \operatorname { } { } \operatorname { }  \operatorname { I n i t \ i t \ a } \ \operatorname { } { } \operatorname { } { } \operatorname { }  \operatorname { } { } \operatorname { } \{  \operatorname { } \langle \operatorname { } \operatorname { } { } \operatorname { } \{  \operatorname { } \mathrm { } \{  \operatorname { } \ { } \operatorname { }  \operatorname { } \operatorname { } { } \operatorname { } \  \operatorname { } { } \operatorname { }  { } \operatorname { }  \operatorname { } \{  \operatorname  \end{array} \end{array} \end{array}
$$

The claim is an easy consequence of the definition of foldl. Hence, in summary, we have shown

scanl f e [] = [e] scanl f e (x:xs) $=$ e:scanl f (f e x) xs

This definition evaluates f only a linear number of times.

What we have just done is an example of optimising a function by program calculation. One of the exciting things about Haskell is that you can do this without fuss. There is no need to bring in a totally different logical language to reason about programs.

However, the prelude definition of scanl is a little different:

Whereas for our version scanl f e undefined $=$ undefined, the prelude version has

scanl f e undefined $=$ e:undefined.

The reason is that the right-hand sides of the two clauses defining scanl are both lists that begin with e. We do not have to know anything about the left-hand sides to determine this fact, and laziness dictates that we don’t ask.

The prelude version also uses a case expression. We won’t go into details since such expressions are used rarely in this book. Haskell allows us many ways to say the same thing.

# 6.6 The maximum segment sum

Here is another example of program calculation. The maximum segment sum problem is a famous one and its history is described in J. Bentley’s Programming Pearls (1987). Given is a sequence of integers and it is required to compute the maximum of the sums of all segments in the sequence. A segment is also called a contiguous subsequence. For example, the sequence

$$
[ - 1 , 2 , - 3 , 5 , - 2 , 1 , 3 , - 2 , - 2 , - 3 , 6 ]
$$

has maximum sum 7, the sum of the segment [5,-2,1,3]. On the other hand, the sequence $[ - 1 , - 2 , - 3 ]$ has a maximum segment sum of zero, since the empty sequence is a segment of every list and its sum is zero. It follows that the maximum segment sum is always nonnegative.

Our problem is specified by mss :: [Int] -> Int mss $=$ maximum . map sum . segments where segments returns a list of all segments of a list. This function can be defined in a number of ways, including

segments $=$ concat . map inits . tails where tails is dual to inits and returns all the tail segments of a list:

tails :: [a] -> [[a]] tails [] $=$ [[]] tails (x:xs) $=$ (x:xs):tails xs

The definition of segments describes the process of taking all the initial segments of all the tail segments. For example,

ghci> segments "abc" ["","a","ab","abc","","b","bc","","c",""]

The empty sequence appears four times in this list, once for every tail segment.

Direct evaluation of mss will take a number of steps proportional to $n ^ { 3 }$ on a list of length $n$ . There are about $n ^ { 2 }$ segments, and summing each of them will take $n$ steps, so in total it will take $n ^ { 3 }$ steps. It is not obvious that we can do better than cubic time for this problem.

However, let’s see where some program calculation leads us. We can start by installing the definition of segments:

maximum . map sum . concat . map inits . tails

Searching for a law we can apply, we spot that map f . concat $=$ concat . map (map f)

applies to the subterm map sum . concat. That gives maximum . concat . map (map sum) . map inits . tails

Now we can use the law map f . map g = map (f . g) to give maximum . concat . map (map sum . inits) . tails

Oh, we can also use the law maximum . concat $=$ maximum . map maximum can’t we? No, not unless the argument to concat is a nonempty list of nonempty lists, because the maximum of the empty list is undefined. In the present example the rule is valid because both inits and tails return nonempty lists. That leads to

maximum . map (maximum . map sum . inits) . tails

The next step is to use the property of scanl described in the previous section, namely

That leads to

maximum . map (maximum . scanl $( + ) 0 )$ . tails

Already we have reduced a $n ^ { 3 }$ algorithm to a $n ^ { 2 }$ one, so we are making progress.   
But now we appear stuck since there is no law in our armoury that seems to help.

The next step obviously concerns maximum . scanl $( + )$ 0. So, let’s see what we can prove about

foldr1 max . scanl $( + )$ 0

This looks like a fusion rule, but can scanl $( + ) ~ 0$ be expressed as a foldr? Well, we do have, for instance,

$$
\begin{array} { l l } { { } } & { { \mathrm { s c a n 1 ~ \phi ( + ) ~ 0 ~ [ x , y , z ] } } } \\ { { \mathrm { } } } & { { = } } & { { [ 0 , 0 { + } { \bf x } , ( 0 { + } { \bf x } ) { + } { \bf y } , ( ( 0 { + } { \bf x } ) { + } { \bf y } ) { + } { \bf z } ] } } \\ { { \mathrm { } } } & { { = } } & { { [ 0 , { \bf x } , { \bf x } { + } { \bf y } , { \bf x } { + } { \bf y } { + } { \bf z } ] } } \\ { { \mathrm { } } } & { { = } } &  { 0 : \mathrm { m a p ~ \phi ( { \bf x } { + } ) ~ [ 0 , { \bf y } , { \bf y } { + } { \bf z } ] } } \\ { { \mathrm { } } } & { { = } } & { { 0 : \mathrm { m a p ~ \phi ( { \bf x } { + } ) ~ \left( { \bf s c a n 1 ~ \phi ( + ) ~ 0 ~ [ { \bf y } , { \bf z } { ] } } \right) } } } \end{array}
$$

This little calculation exploits the associativity of $( + )$ and the fact that 0 is the identity element of $( + )$ . The result suggests, more generally, that

provided that (@) is associative with identity e. Let us take this on trust and move on to the conditions under which

foldr1 $( < )$ . foldr f [e] $=$ foldr h b where f x xs $=$ e:map ( $\mathbf { \widetilde { x } } \mathbf { \textcircled { 0 } }$ ) xs

It is immediate that foldr1 $( < > )$ is strict and foldr1 ( ) $\left[ { \Theta } \right] ~ = ~ \mathsf { e }$ , so we have $\mathtt { b } \ = \ \mathtt { e }$ . It remains to check the third proviso of the fusion rule: we require h to satisfy

$$
\operatorname { f o l d r } 1 ( \hookrightarrow ) ( \mathsf { e } : \operatorname* { m a p } ( \mathtt { x } \odot ) \mathrm { x } \mathtt { s } ) = \mathrm { h } \mathrm { ~ x ~ } \left( \operatorname { f o l d r } 1 ( \llangle ) \mathrm { x } \mathtt { s } \right)
$$

for all $x$ and $x s$ . The left-hand side simplifies to

$$
\textsf { e } < > \left( \mathbf { f o l d r } 1 \left( < > \right) \left( \mathtt { m a p } \left( \mathbf { x } \otimes \right) \mathbf { x } \mathbf { s } \right) \right)
$$

Taking the singleton case $\mathbf { x s } ~ = ~ [ \mathbf { y } ]$ , we find that

$$
\texttt { h x y } = \texttt { e } \hookrightarrow \texttt { ( x \Subset y ) }
$$

That gives us our definition of $\mathtt { h }$ , but we still have to check that

$$
\mathtt { f o l d r 1 } \ \mathtt { ( < > ) } \ \mathtt { ( e : m a p ~ \mathtt { ( x 0 ) } ~ \mathtt { x } \mathtt { s } ) } = \mathtt { e } \ \mathtt { < > } \ \mathtt { ( x ~ \mathtt { 0 } ~ f o l d r 1 ~ \mathtt { ( < > ) } ~ \mathtt { x } \mathtt { s } ) }
$$

Simplifying both sides, this equation holds provided

$$
\mathrm { f o l d r 1 ~ \left( < > \right) ~ ~ . ~ } \mathrm { m a p ~ \left( x \odot \right) ~ = ~ \left( x \odot \right) ~ ~ . ~ f o l d r 1 ~ \left( < > \right) }
$$

This final equation holds provided (@) distributes over $( < > )$ ; that is

$$
\texttt { x } \texttt { 0 } \left( \texttt y \texttt { < } \texttt { z } \right) = \texttt { ( x } \texttt { \textcircled { } } \texttt { y } ) \texttt { < > } \left( \texttt { x } \texttt { \textcircled { } } \texttt { z } \right)
$$

The proof is left as an exercise.

Does addition distribute over (binary) maximum? Yes:

$$
\begin{array} { r c l } { \mathrm {  ~ x ~ } + \mathrm {  ~ \left( y ~ \right)} \mathrm {  ~ \hat { ~ } m a x ~ } \mathrm {  ~ z ~ }  \mathrm {  ~ \psi ~ } = \mathrm {  ~ \left( ~ x ~ } + \mathrm {  ~ y ~ } \mathrm {  ~ \hat { ~ } m a x ~ } \mathrm {  ~ \psi ~ } \mathrm {  ~ ( ~ x ~ } + \mathrm {  ~ z ~ } \mathrm {  ~ \right) ~ } } \\ { \mathrm {  ~ x ~ } + \mathrm {  ~ \left( y ~ \right)} \mathrm {  ~ \hat { ~ } m i n ~ } \mathrm {  ~ z ~ }  \mathrm {  ~ \psi ~ } = \mathrm {  ~ \left( ~ x ~ } + \mathrm {  ~ y ~ } \mathrm {  ~ \hat { ~ } m i n ~ } \mathrm {  ~ \psi ~ } \mathrm {  ~ ( ~ x ~ } + \mathrm {  ~ z ~ } \mathrm {  ~ \right) ~ } } \end{array}
$$

Back to the maximum segment sum. We have arrived at

What we have left looks very like an instance of the scanl rule of the previous section, except that we have a foldr not a foldl and a tails not an inits. But a similar calculation to the one about scanl reveals

where

$$
\begin{array} { l } { \mathrm { s c a n r ~ \gamma : ~ ( a ~  ~ b ~  ~ b ) ~  ~ b ~  ~ [ a ] ~  ~ [ b ] ~ } } \\ { \mathrm { s c a n r ~ \gamma \mathrm { ~ f ~ ~ e ~ } ~ [ l ] ~ \sigma ~ = ~ [ e ] ~ } } \\ { \mathrm { s c a n r ~ \gamma \mathrm { ~ f ~ ~ e ~ } ~ ( x : x s ) ~ = ~ f ~ \ x ~ ( h e a d ~ \ y s ) : y s } } \\ { \mathrm { w h e r e ~ \gamma \mathrm { ~ y s ~ = ~ s c a n r ~ \gamma \mathrm { ~ f ~ ~ e ~ } ~ x s ~ } ~ } } \end{array}
$$

The function scanr is also defined in the standard prelude. In summary,

$$
\begin{array} { l } { \mathrm { m s s ~ = ~ \mathrm { m a x i m u m ~ \Omega ~ . ~ \Omega s c a n r ~ \Omega ( \emptyset ) ~ } ~ } 0 } \\ { \mathrm { ~ w h e r e ~ \Omega ~ x ~ \emptyset ~ \mathcal ~ Y ~ = ~ \Omega ~ \setminus m a x ^ { \setminus } ~ \Omega ( x ~ + ~ y ) ~ } } \end{array}
$$

The result is a linear-time program for the maximum segment sum.

# 6.7 Exercises

# Exercise A

In Chapter 3 we defined multiplication on natural numbers. The following definition is slightly different:

mult :: Nat $- >$ Nat $- >$ Nat mult Zero y $=$ Zero mult (Succ x) $=$ mult x y + y

Prove that mult ( $\cdot - x + y$ ) z = mult x z + mult y z. You can use only the facts that $\mathbf { x } { + } 0 \ = \ \mathbf { x }$ and that $( + )$ is associative. That means a long think about which variable x, y or $_ { z }$ is the best one on which to do the induction.

# Exercise B

Prove that

for all finite lists xs and ys. You may assume that $( + + )$ is associative.

# Exercise C

Recall our friends Eager Beaver and Lazy Susan from Exercise D in Chapter 2. Susan happily used the expression head . map f, while Beaver would probably prefer f . head. Wait a moment! Are these two expressions equal? Carry out an induction proof to check.

# Exercise D

Recall the cartesian product function cp :: [[a]] -> [[a]] from the previous chapter. Give a definition of the form cp $=$ foldr f e for suitable f and e. You can use a list comprehension for the definition of $\mathtt { f }$ if you like.

The rest of this exercise concerns the proof of the identity

length . cp $=$ product . map length

where product returns the result of multiplying a list of numbers.

1. Using the fusion theorem, express length.cp as an instance of foldr.

2. Express map length as an instance of foldr.

3. Using the fusion theorem again, express product . map length as an instance of foldr.

4. Check that the two results are identical. If they aren’t, your definition of cp was wrong.

# Exercise E

The first two arguments of foldr are replacements for the constructors

$$
\begin{array} { l } { { \mathrm { ( : ) } \ { \mathrm { : : } \ { \mathrm { a } } \ \to \ { \mathrm { [ a ] } } \ \to \ { \mathrm { [ a ] } } \ \to \ { \mathrm { [ a ] } } } } } \\ { { \mathrm { [ ] } \ { \mathrm { : } \ { \mathrm { : } \ { \mathrm { [ a ] } } } } } } \end{array}
$$

of lists. A fold function can be defined for any data type: just give replacements for the constructors of the data type. For example, consider

To define a fold for Either we have to give replacements for

Left :: a $- >$ Either a b Right :: b $- >$ Either a b

That leads to

$$
\begin{array} { r l } & { \texttt { f o l d E \texttt { : } ( a \texttt { - > c } ) } \texttt { - > ( b \texttt { - > c } ) } \texttt { - > } \texttt { E i t h e r a b - > c } } \\ & { \texttt { f o l d E \texttt { f } g } \texttt { ( L e f t \texttt { x } ) } \texttt { = f x } } \\ & { \texttt { f o l d E \texttt { f g } ( R i g h t \texttt { x } ) } \texttt { = g x } } \end{array}
$$

The type Either is not a recursive data type and foldE is not a recursive function. In fact foldE is a standard prelude function, except that it is called either not foldE.

Now define fold functions for

data Nat $=$ Zero | Succ Nat data NEList a $=$ One a | Cons a (NEList a)

The second declaration introduces nonempty lists.

What is wrong with the Haskell definition of foldr1?

# Exercise F

Prove that

foldl f e xs $=$ foldr (flip f) e (reverse xs) for all finite lists xs. Also prove that

foldl (@) e xs $=$ foldr ( $\mathrm { < } >$ ) e xs for all finite lists xs, provided that

$$
\begin{array} { l } { \mathrm { ~ ( ~ x ~ < > ~ y ~ ) ~ } \texttt { \ Q z = x } \texttt { < > } \mathrm { ~ ( ~ y ~ \textcircled ~ z ~ ) ~ } } \\ { \texttt { \ominus } \texttt { \textQ x } } \\ { \texttt { \& } } \end{array}
$$

# Exercise G

Using

foldl f e (xs ++ ys) $=$ foldl f (foldl f e xs) ys foldr f e (xs ++ ys) $=$ foldr f (foldr f e ys) xs

prove that

foldl f e . concat $=$ foldl (foldl f) e foldr f e . concat $=$ foldr (flip (foldr f)) e

# Exercise H

Mathematically speaking, what is the value of

sum (scanl (/) 1 [1..]) ?

# Exercise I

Calculate the efficient definition of scanr from the specification

scan r f e $=$ map (foldr f e) . tails

# Exercise J

Consider the problem of computing mss :: [Int] -> Int mss $=$ maximum . map sum . subseqs where subseqs returns all the subsequences of a finite list, including the list itself:

subseqs :: [a] $- >$ [[a]]   
subseqs [] $=$ [[]]   
subseqs (x:xs) $=$ xss $^ { + + }$ map (x:) xss where xss $=$ subseqs xs

Find a more efficient alternative for mss.

# Exercise K

This question is in pieces.

1. The function takePrefix p applied to a list xs returns the longest initial segment of $x s$ that satisfies $p$ . Hence

What are the values of the following expressions?

takePrefix nondec [1,3,7,6,8,9] takePrefix (all even) [2,4,7,8]

Complete the right-hand side of

takePrefix ( ${ \sf a l 1 } { \sf p } ) = \ldots$

Give a definition of takePrefix in terms of standard functions, including inits.

We will return to takePrefix in the final part of this question.

2. The functions one and none are defined by the equations

$$
\begin{array} { l c l } { { \mathrm { o n e } \textbf { x } } } & { { = } } & { { \left[ { \bf x } \right] } } \\ { { \mathrm { n o n e } \textbf { x } } } & { { = } } & { { \left[ { \bf \bar { \rho } } \right] } } \end{array}
$$

Complete the right-hand side of the following identities:

$$
\begin{array} { l l l l l } { \mathrm { n o n e } } & { . } & { \mathrm { f } } & { = } & { . ~ . ~ . } \\ { \mathrm { m a p } ~ \mathrm { f } } & { . } & { \mathrm { n o n e } } & { = } & { . ~ . ~ . } \\ { \mathrm { m a p } ~ \mathrm { f } } & { . } & { \mathrm { o n e } } & { = } & { . ~ . ~ . } \end{array}
$$

3. Recall that fork (f,g) $\mathrm { ~ \bf ~ x ~ } = \mathrm { ~ \bf ~ ( ~ f ~ ~ x ~ } , \mathrm { ~ g ~ ~ x ~ ) ~ }$ . Complete the identities

$$
\begin{array} { l l l l l } { { \mathrm { f s t } } } & { { . ~ \mathrm { f o r k } } } & { { ( \pounds , \mathrm { g } ) } } & { { = } } & { { . \cdot . } } \\ { { \mathrm { s n d } } } & { { . ~ \mathrm { f o r k } } } & { { ( \mathrm { f } , \mathrm { g } ) } } & { { = } } & { { . \cdot . } } \\ { { \mathrm { f o r k } } } & { { ( \mathrm { f } , \mathrm { g } ) } } & { { . ~ \mathrm { h } } } & { { = } } & { { . ~ . . } } \end{array}
$$

4. Define

test p (f,g) x = if p x then f x else g x

Complete the right-hand sides of

$$
\begin{array} { r l } { \mathrm { t e s t ~ \ p ~ \Sigma ( f , g ) ~ \Sigma . ~ h ~ \Sigma = ~ \rho ~ . ~ . ~ . ~ } } \\ { \mathrm { ~ h ~ \Sigma . ~ \ t e s t ~ \ p ~ \Sigma ( f , g ) ~ \Sigma = ~ \rho ~ . ~ . ~ . ~ } } \end{array}
$$

The function filter can be defined by

# filter $\mathtt { p } \ =$ concat . map (test p (one,none))

Using the identities above, together with other standard identities, prove using equational reasoning that

filter $\mathtt { p } \ =$ map fst . filter snd . map (fork (id,p))

(Hint: as always in calculations, start with the more complicated side.)

5. Recall the standard prelude functions curry and uncurry from the answer to Exercise K in Chapter 4:

$$
\mathrm { : : ~ ( ( a , b ) ~ - > ~ c ) ~ - > ~ a ~ - > ~ b ~ - > ~ c ~ }
$$

$$
\begin{array} { l } { \mathrm { u n c u r r y ~ : : ~ \left( a ~ - > ~ b ~ - > ~ c \right) ~ - > ~ \left( a , b \right) ~ - > ~ c \ } } \\ { \mathrm { u n c u r r y ~ f ~ \left( x , y \right) ~ = ~ f ~ x ~ y ~ } } \end{array}
$$

Complete the right-hand side of

$$
\begin{array} { c c c c c } { { \mathrm { m a p } } } & { { ( \mathrm { f o r k } } } & { { ( \mathrm { f } , \mathrm { g } ) ) } } & { { = \mathrm { \ u n c u r r y ~ \mathrm { z i p } ~ } . } } & { { ( \mathrm { } } } & { { \ } } \end{array}
$$

6. Returning to takePrefix, use equational reasoning to calculate an efficient program for the expression

takePrefix (p . foldl f e)

that requires only a linear number of applications of $f$ .

# 6.8 Answers

# Answer to Exercise A

The proof is by induction on y:

# Case 0

mult (x+0) z mult x z + mult 0 z   
$\begin{array} { r l } { = { } } & { { } \left\{ { \mathrm { s i n c e ~ x ~ + ~ } } 0 { = } { \bf x } \right\} } \end{array}$ = {mult.1}   
mult x z mult x z + 0 $= \{ \mathrm { s i n c e } \ x \ + \ 0 \ = \ \mathrm { \bf { x } } \}$ mult x z

# Case $\tt y + 1$

mult $\mathbf { \Psi } ( \mathbf { x } + ( \mathbf { y } + 1 )$ ) z   
$=$ {as $( + )$ is associative} mult ( $( { \bf x } + { \bf y } ) + 1 )$ z   
= {mult.2} mult (x+y) z + z   
= {induction} (mult x z $^ +$ mult y z) + z

mult x z + mult ( $\cdot y + 1$ ) z = {mult.2} mult x z + (mult y z + z) $=$ {since $( + )$ is associative} (mult x z $^ +$ mult y z) + z

# Answer to Exercise B

The proof is by induction on xs:

# Case []

reverse ( $[ ] + + y \leq )$ reverse ys $^ { + + }$ reverse []   
$\begin{array} { r l r } { = } & { { } } & { \left\{ + + . 1 \right\} } \end{array}$ $\begin{array} { l } { { = \begin{array} { l } { { \big \{ r e v e r s e . 1 \big \} } } \\ { { \mathrm { ~ } } } \end{array} } } \\ { { \begin{array} { l } { { \mathrm { ~ r e v e r s e ~ y s ~ } + + } } \end{array} \begin{array} { l } { { [ } } \\ { { ] } } \end{array} } } \\ { { = \begin{array} { l } { { \big \{ \mathrm { s i n c e ~ x s ~ } + + } } \end{array} \begin{array} { l } { { [ ] ~ = ~ \mathrm { x s } \big \} } } \end{array} } } \end{array}$   
reverse ys reverse ys

Case x:xs

$$
\begin{array} { r l } & { \mathrm { ~ \gamma ~ \gamma \in \gamma e r s e ~ \Gamma ( ( \chi _ { : } \chi _ { S } \circ \gamma ) + + \gamma _ { S } ) ~ } } \\ & { = \mathrm { ~ \Gamma _ { \left\{ + + , 2 \right\} } ~ } } \\ & { \mathrm { ~ \gamma \ r e v e r s e ~ \Gamma ( x : ( x _ { S } + + y _ { S } \circ \gamma ) ~ } ) } \\ & { = \mathrm { ~ \Gamma _ { \left\{ r e v e r s e \mathrm { ~ 2 } \right\} } ~ } } \\ & { \mathrm { ~ \gamma \in \gamma e r s e ~ \Gamma ( x _ { S } + + y _ { S } \circ \gamma ) ~ \Gamma _ { + + } ~ \Gamma [ x _ { \perp } ] ~ } } \\ & { = \mathrm { ~ \Gamma _ \left\{ i n d u c t i o n \right\} ~ } } \end{array}
$$

and

reverse ys $^ { + + }$ reverse (x:xs) = {reverse.2} reverse ys $^ { + + }$ (reverse xs $^ { + + }$ [x]) $=$ {since $( + + )$ is associative} (reverse ys $^ { + + }$ reverse xs) $^ { + + }$ [x]

# Answer to Exercise C

We have to prove that

head (map f xs) = f (head xs)

for all lists $x s$ , finite, partial or infinite. The case undefined and the inductive case $\tt x : \tt x s$ are okay, but the case [] gives

head (map f []) $=$ head $\left[ \begin{array} { l l } { \right] } & { = } \end{array}$ undefined f (head []) $= \pm$ undefined

Hence the law holds only if $\mathtt { f }$ is a strict function. Eager Beaver is not bothered by this since he can only construct strict functions.

# Answer to Exercise D

We have

$\tt c p \tt =$ foldr op [[]] where op xs xss $=$ [x:ys | x <- xs, ys <- xss]

1. length . cp $=$ foldr h b provided length is strict (it is) and

The first equation gives $\mathrm { ~ \tt ~ b ~ } = \mathrm { ~ \tt ~ 1 ~ }$ and as

length (op xs xss) $=$ length xs $^ *$ length xss the second equation gives $\begin{array} { r l } { \mathrm { ~  ~ h ~ } = } & { { } ( * ) } \end{array}$ . length.

2. map length $=$ foldr f [], where f xs ns $=$ length xs:ns. A shorter definition is $\begin{array} { r } { \mathrm { ~ \underline { ~ } { ~ } ~ } = \mathrm { ~ \tiny ~ ( ~ : ~ ) ~ } } \end{array}$ . length.

3. product . map length $=$ foldr h b provided product is strict (it is) and

product $[ ] = 6$ product (length xs:ns) $=$ h xs (product ns)

The first equation gives b $\mathit { \Theta } = \mathit { \Theta } 1$ , and as

product (length xs:ns) $=$ length xs $^ *$ product ns the second equation gives $\begin{array} { r l } { \mathrm { ~  ~ h ~ } = } & { { } ( * ) } \end{array}$ . length.

4. The two definitions of h and b are identical.

# Answer to Exercise E

The definition of foldN is straightforward:

$$
\begin{array} { r l } & { \mathrm { f o l d N ~ : : ~ ( a ~ - > ~ a ) ~ \Sigma \Sigma \to ~ a ~ - > ~ N a t ~ - > ~ a ~ } } \\ & { \mathrm { f o l d N ~ f ~ \ e ~ \ Z e r o ~ \Sigma ~ \Sigma ~ = ~ e ~ } } \\ & { \mathrm { f o l d N ~ f ~ \ e ~ \Gamma ( S u c c ~ n ) ~ = ~ f ~ \Gamma ~ ( f o l d N ~ f ~ \ e ~ n ) ~ } } \end{array}
$$

In particular,

$$
\begin{array} { l } { \mathrm { m } { + } \mathrm { n } \ = \ \mathrm { f o l d N ~ } \mathrm { S u c c ~ } \mathrm { ~ m ~ } \mathrm { ~ n ~ } } \\ { \mathrm { m } { + } \mathrm { n } \ = \ \mathrm { f o l d N ~ } \left( { + } \mathrm { m } \right) \ \mathrm { Z e r o ~ n ~ } } \\ { \mathrm { m } { \cdot } \mathrm { n } \ = \ \mathrm { f o l d N ~ } \left( { + } \mathrm { m } \right) \ \mathrm { ~ ( } \mathrm { S u c c ~ } \ \mathrm { Z e r o ) ~ } \mathrm { ~ n ~ } } \end{array}
$$

For nonempty lists, the definition of foldNE is:

$$
\begin{array} { r l } & { \mathtt { f o l d N E ~ : : } \quad ( \mathtt { a ~ \to ~ b ~ \to ~ b } ) \ \to \ ( \mathtt { a ~ \to ~ b } ) \ \to \ \mathtt { N E L i s t ~ \mathtt { a ~ \to ~ b } ~ } } \\ & { \mathtt { f o l d N E ~ f ~ \mathtt { g } ~ ( 0 n e ~ x ) ~ \mu ~ = ~ \mathtt { g } ~ x ~ } } \\ & { \mathtt { f o l d N E ~ f ~ \mathtt { g } ~ ( C o n s ~ \mathtt { x } ~ x s ) ~ = ~ \mathtt { f } ~ x ~ ( \mathtt { f o l d N E ~ f ~ \mathtt { g } ~ x s } ) } } \end{array}
$$

To be a proper fold over nonempty lists, the correct definition of foldr1 should have been

$$
\begin{array} { l } { \texttt { f o l d r 1 : : ( a  b \alpha - > b ) } \texttt { - > ( a - > b ) } \texttt { - > [ a ] } \texttt { - > b } } \\ { \texttt { f o l d r 1 f g } \texttt { [ x ] } } \\ { \texttt { f o l d r 1  f g } \texttt { ( x : x s ) } = \texttt { f x } ( \texttt { f o l d r 1 f g x s } ) } \end{array}
$$

The Haskell definition of foldr1 restricts $\mathsf { g }$ to be the identity function.

# Answer to Exercise F

Write $\mathrm { ~ g ~ } =$ flip f for brevity. We prove that

for all finite lists xs by induction:

# Case []

foldl f e [] foldl g e (reverse []) = {foldl.1} $\begin{array} { c } { { \left\lfloor \mathbf { \bar { \tau } } \mathbf { \Theta } \right\rfloor \mathbf { \Psi } = \mathbf { \Phi } \left\{ \mathbf { r e v e r s e } . 1 \right\} } } \\ { { \mathbf { \Psi } \mathrm { ~ f o l d l ~ g ~ e ~ } \left[ \mathbf { \bar { \tau } } \right] } } \\ { { \mathbf { \Psi } = \mathbf { \Phi } \left\{ \mathbf { f o l d l } . 1 \right\} } } \end{array}$ e e

Case x:xs

and

$$
\begin{array} { r l } & { \quad \mathrm { { f o l d r ~ \ g ~ e ~ \ ( r e v e r s e ~ \Gamma ( x : x s ) ) } } } \\ & { = \quad \{ { \mathrm { r e v e r s e ~ . 2 } } \} } \\ & { \quad \mathrm { { f o l d r ~ \ g ~ e ~ \ ( r e v e r s e ~ { \ x s } ~ + \Gamma ( x ] ) } } } \\ & { = \quad \{ { \mathrm { c l a i m : ~ s e e ~ b e l o w } } \} } \\ & { \quad \mathrm { { f o l d i r ~ \ g ~ \ ( f o l d r ~ \ g ~ e ~ { \Gamma ( x ] ) } ~ \Gamma ( r e v e r s e ~ { \ x s } ) } } } \\ & { = \quad \{ { \mathrm { s i n c e ~ f o l d r ~ \ g l i r ~ f o ~ { \Gamma ( r ) } ~ \in ~ [ x ] ~ = ~ f ~ e ~ x \pi _ { k } ~ } } \} } \\ & { \quad \mathrm { { f o l d r ~ \ g ~ \ ( \textbf { f } ~ e ~ { \ x } ~ ) ~ \Gamma ( r e v e r s e ~ { \ x s } ) } } } \end{array}
$$

The claim is that

foldr f e (xs ++ ys) $=$ foldr f (foldr f e ys) xs We leave the proof to the reader. By the way, we have the companion result that

foldl f e (xs ++ ys) $=$ foldl f (foldl f e xs) ys Again, the proof is left to you.

We prove

foldl (@) e xs $=$ foldr (<>) e xs for all finite lists xs by induction. The base case is trivial. For the inductive case:

Case x:xs

$\begin{array} { r l } & { \begin{array} { r l } & { \mathrm { ~ f o l d 1 ~ \Psi ( \odot ) ~ \textsf { e } ~ ( x : x s ) ~ } } \\ { = \quad \left\{ \mathrm { f o l d 1 . 2 } \right\} } \\ { \mathrm { f o l d 1 ~ \Psi ( \odot ) ~ \textsf { ( e ~ \textsf { Q } ~ x ) } ~ x s } } \\ { = \quad \left\{ \mathrm { g i v e n ~ t h a t e ~ \textsf { ( Q } ~ \texttt { x = x } ~ < > ~ \textsf { e } ~ ) } \right. \qquad } & { \mathrm { ~ f o l d r ~ \Psi ( < > ~ ) ~ \textsf { e } ~ \bot ~ x s } } \\ { = \quad \left\{ \mathrm { g i v e n ~ t h a t e ~ \textsf { ( Q } ~ \texttt { x = x } ~ < > ~ \textsf { e } ~ ) } \right. \qquad } & { = \quad \left\{ \mathrm { i n d u c t i o n } \right\} } \end{array} } \end{array}$ s foldl (@) $\mathrm { ~ ( ~ x ~ } < > \ \mathtt { e } ,$ ) xs x $< >$ foldl (@) e xs

The two sides have simplified to different results. We need another induction hypothesis:

The base case is trivial. For the inductive case

Case z:zs

$$
\begin{array} { r l } & { \mathrm { ~ f o l d ~ \begin{array} { c c } { ( \mathfrak { Q } ) } & { ( \mathfrak { x } \ \diamond \ \mathrm { ~ \diamondsuit ~ } \ \mathrm { y } ) } \end{array} ~ \left( z : z \mathbf { s } \right) ~ } } \\ &  = \begin{array} { r l } { \mathrm { ~ \left\{ f o l d \ 1 . ~ 2 \right\} ~ } } & \\ { \mathrm { ~ f o l d ~ \begin{array} { c c } { ( \mathfrak { Q } ) } & { ( ( \mathfrak { x } \ \diamond \ \mathrm { ~ \diamondsuit ~ } \mathrm { y } ) } \end{array} ~ \varnothing ~ \ \mathfrak { Q } ~ z ) ~ \ z \mathbf { s } ~ } } \\ { = } & { \begin{array} { r l } { \mathrm { ~ \left\{ s i n c e ~ \left( \begin{array} { c c } { \mathbf { x } \ e } & { \diamond \ g } \end{array} \right) ~ \varnothing ~ \ \mathfrak { z } ~ = ~ \mathbf { \vec { x } } ~ \ll ~ ( \mathbf { y } ~ \ \varnothing ~ z ) ~ \right\} } } \\ { \mathrm { ~ f o l d ~ \ ( \varnothing ) ~ \ ( x ~ \ll ~ ( \mathbf { y } ~ \varnothing ~ z ) ) ~ \ z \otimes ~ } } \end{array} } \\ & { = \begin{array} { r l } { \mathrm { ~ \left\{ i n d u c t i o n \right\} ~ } } & \\ { \mathrm { ~ x ~ \ll ~ \mathtt { f o l d } ~ \mathtt { a l d } ~ \mathtt { a l d } ~ } } \end{array} } \end{array} \end{array}
$$

and

# Answer to Exercise G

The proofs are by induction. The base cases are easy and the inductive cases are

and

foldr f e (concat (xs:xss))   
= {definition of concat} foldr f e (xs $^ { + + }$ concat xss)   
= {given property of foldr} foldr f (foldr f e (concat xss)) xs   
= {using flip} flip (foldr f) xs (foldr f e (concat xss))   
= {induction} flip (foldr f) xs (foldr (flip (foldr f)) e xss)   
= {definition of foldr} foldr (flip (foldr f)) e (xs:xss)

# Answer to Exercise H

Mathematically speaking, sum (scanl (/) 1 [1..]) = e

since $\textstyle \sum _ { n = 0 } ^ { \infty } 1 / n ! = e$ . Computationally speaking, replacing [1..] by a finite list [1..n] gives an approximation to $e$ . For example,

ghci> sum (scanl (/) 1 [1..20])   
2.7182818284590455   
ghci> exp 1   
2.718281828459045

The standard prelude function exp takes a number $x$ and returns $e ^ { x }$ . By the way, the prelude function log takes a number $x$ and returns $\log _ { e } x .$ . If you want logarithms in another base, use logBase whose type is

logBase :: Floating a $\Rightarrow$ a $- >$ a -> a

# Answer to Exercise I

We synthesise a more efficient definition by cases. The base case yields

scanr f e [] = [e] and the inductive case $\tt x : \tt x s$ is:

scanr f e (x:xs)   
= {specification} map (foldr f e) (tails (x:xs))   
= {tails.2} map (foldr f e) ((x:xs):tails xs)   
= {definition of map} foldr f e (x:xs):map (foldr f e) (tails xs)   
= {foldr.2 and specification} f x (foldr f e xs):scan f e xs   
= {claim: foldr f e xs $=$ head (scanr f e xs)} f x (head ys):ys where ys $=$ scanr f e xs

# Answer to Exercise J

Firstly,

subseqs $=$ foldr op [[]] where op x xss $=$ xss $^ { + + }$ map (x:) xss

Appeal to the fusion law yields

map sum . subseqs $=$ foldr op [0] where op x xs $=$ xs $^ { + + }$ map $\mathbf { \Psi } ( \mathbf { x } + \mathbf { \Psi } )$ ) xs

A second appeal to fusion yields

maximum . map sum . subseqs $=$ foldr op 0 where op $\texttt { x y } = \texttt { y }$ \`max\` $( \tt x + y )$ )

That will do nicely. Of course, sum . filter ( $\mathrm { > } 0 )$ ) also does the job.

# Answer to Exercise K

1. We have

takePrefix nondec [1,3,7,6,8,9] $=$ [1,3,7] takePrefix (all even) $[ 2 , 4 , 7 , 8 ] ~ = ~ [ 2 , 4 ]$

The identity is

takePrefix (all p) $=$ takeWhile p

The specification is

takePrefix p $=$ last . filter p . inits

2. We have

none . f $=$ none map f . none $=$ none map f . one $=$ one . f

3. We have

$$
\begin{array} { l }  { \mathrm { f s t ~ \left( \begin{array} { l } { { \mathbf { \sigma } } } \end{array} \right) ~ \left( \begin{array} { l } { { \mathbf { f } } } \end{array} , \mathbf { g } \right) ~ \mathrm { ~ = ~ { \mathbf { f } } ~ } } } \\  { \mathrm { s n d ~ \left( \begin{array} { l } { { \mathbf { \sigma } } } \end{array} \right) ~ \left( \mathbf { f } ~ , \mathbf { g } \right) ~ \mathrm { ~ = ~ { \mathbf { g } } ~ } } } \\  { \mathrm { f o r k ~ \left( \mathbf { f } ~ , \mathbf { g } \right) ~ \left( \begin{array} { l } { { \mathbf { \sigma } } } \end{array} \right) ~ \left( \begin{array} { l } { { \mathbf { \sigma } } } \end{array} \right) ~ \mathrm { ~ = ~ { \mathbf { f } } ~ o r k ~ \left( \mathbf { f } ~ . { \mathrm { h } } , \mathbf { g } . { \mathrm { h } } \right) } } } \end{array}
$$

4. We have

test p (f,g) . $\mathrm { ~ \tt ~ { ~ h ~ } ~ } =$ test (p.h) (f . h, g . h) h . test p (f,g) $=$ test p (h . f, h . g)

The reasoning is:

map fst . filter snd . map (fork (id,p))   
= {definition of filter} map fst . concat . map (test snd (one,none)) . map (fork (id,p))   
$=$ {since map f . concat $=$ concat . map (map f)} concat . map (map fst . test snd (one,none) . fork (id,p))   
$=$ {second law of test; laws of one and none} concat . map (test snd (one . fst,none) . fork (id,p))   
$=$ {first law of test; laws of fork} concat . map (test p (one . id, none . fork (id,p)))   
$=$ {laws of id and none} concat . map (test p (one,none))   
= {definition of filter} filter p

5. We have

map (fork (f,g)) $=$ uncurry zip . fork (map f,map g)

6. We have

filter (p . foldl f e) . inits   
= {derived law of filter} map fst . filter snd . map (fork (id, p . foldl f e)) . inits   
= {law of zip} map fst . filter snd . uncurry zip . fork (id, map (p . foldl f e)) . inits   
= {law of fork} map fst . filter snd . uncurry zip . fork (inits, map (p . foldl f e) . inits)   
$\begin{array} { r l r } { = { } } & { { } \left\{ { \tt s c a n \ 1 e m m a } \right\} } \end{array}$ map fst . filter snd . uncurry zip . fork (inits, map p . scanl f e)

Hence

takePrefix (p.foldl f e) $=$ fst . last . filter snd . uncurry zip . fork (inits,map p . scanl f e)

# 6.9 Chapter notes

Gofer, an earlier version of Haskell designed by Mark Jones, was so named because it was GOod For Equational Reasoning. HUGS (The Haskell Users Gofer System) was an earlier alternative to GHCi, and used in the second edition of the book on which the current one is based, but is no longer maintained.

Many people have contributed to the understanding of the laws of functional programming, too many to list. The Haskellwiki page

haskell.org/haskellwiki/Equational_reasoning_examples contains examples of equational reasoning and links to various discussions about the subject.

The fascinating history of the maximum segment sum problem is discussed in Jon Bentley’s Programming Pearls (second edition) (Addison-Wesley, 2000).