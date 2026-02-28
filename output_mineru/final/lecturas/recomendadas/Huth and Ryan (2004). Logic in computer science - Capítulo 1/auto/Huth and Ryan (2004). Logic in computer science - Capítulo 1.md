1

# Propositional logic

The aim of logic in computer science is to develop languages to model the situations we encounter as computer science professionals, in such a way that we can reason about them formally. Reasoning about situations means constructing arguments about them; we want to do this formally, so that the arguments are valid and can be defended rigorously, or executed on a machine.

Consider the following argument:

Example 1.1 If the train arrives late and there are no taxis at the station, then John is late for his meeting. John is not late for his meeting. The train did arrive late. Therefore, there were taxis at the station.

Intuitively, the argument is valid, since if we put the first sentence and the third sentence together, they tell us that if there are no taxis, then John will be late. The second sentence tells us that he was not late, so it must be the case that there were taxis.

Much of this book will be concerned with arguments that have this structure, namely, that consist of a number of sentences followed by the word ‘therefore’ and then another sentence. The argument is valid if the sentence after the ‘therefore’ logically follows from the sentences before it. Exactly what we mean by ‘follows from’ is the subject of this chapter and the next one.

Consider another example:

Example 1.2 If it is raining and Jane does not have her umbrella with her, then she will get wet. Jane is not wet. It is raining. Therefore, Jane has her umbrella with her.

This is also a valid argument. Closer examination reveals that it actually has the same structure as the argument of the previous example! All we have done is substituted some sentence fragments for others:

<table><tr><td>Example 1.1</td><td>Example 1.2</td></tr><tr><td>the train is late</td><td>it is raining</td></tr><tr><td>there are taxis at the station John is late for his meeting</td><td>Jane has her umbrella with her Jane gets wet.</td></tr></table>

The argument in each example could be stated without talking about trains and rain, as follows:

If $p$ and not $q$ , then $r$ . Not $r$ . p. Therefore, q.

In developing logics, we are not concerned with what the sentences really mean, but only in their logical structure. Of course, when we apply such reasoning, as done above, such meaning will be of great interest.

# 1.1 Declarative sentences

In order to make arguments rigorous, we need to develop a language in which we can express sentences in such a way that brings out their logical structure. The language we begin with is the language of propositional logic. It is based on propositions, or declarative sentences which one can, in principle, argue as being true or false. Examples of declarative sentences are:

(1)(2) The sum of the numbers 3 and 5 equals 8.   
Jane reacted violently to Jack’s accusations.   
(3) Every even natural number ${ > } 2$ is the sum of two prime numbers.   
(4) All Martians like pepperoni on their pizza.   
(5) Albert Camus ´etait un ´ecrivain fran¸cais.   
(6) Die W¨urde des Menschen ist unantastbar.

These sentences are all declarative, because they are in principle capable of being declared ‘true’, or ‘false’. Sentence (1) can be tested by appealing to basic facts about arithmetic (and by tacitly assuming an Arabic, decimal representation of natural numbers). Sentence (2) is a bit more problematic. In order to give it a truth value, we need to know who Jane and Jack are and perhaps to have a reliable account from someone who witnessed the situation described. In principle, e.g., if we had been at the scene, we feel that we would have been able to detect Jane’s violent reaction, provided that it indeed occurred in that way. Sentence (3), known as Goldbach’s conjecture, seems straightforward on the face of it. Clearly, a fact about all even numbers >2 is either true or false. But to this day nobody knows whether sentence (3) expresses a truth or not. It is even not clear whether this could be shown by some finite means, even if it were true. However, in this text we will be content with sentences as soon as they can, in principle, attain some truth value regardless of whether this truth value reflects the actual state of affairs suggested by the sentence in question. Sentence (4) seems a bit silly, although we could say that if Martians exist and eat pizza, then all of them will either like pepperoni on it or not. (We have to introduce predicate logic in Chapter 2 to see that this sentence is also declarative if no Martians exist; it is then true.) Again, for the purposes of this text sentence (4) will do. Et alors, qu’est-ce qu’on pense des phrases (5) et (6)? Sentences (5) and (6) are fine if you happen to read French and German a bit. Thus, declarative statements can be made in any natural, or artificial, language.

The kind of sentences we won’t consider here are non-declarative ones, like

� Could you please pass me the salt? � Ready, steady, go! � May fortune come your way.

Primarily, we are interested in precise declarative sentences, or statements about the behaviour of computer systems, or programs. Not only do we want to specify such statements but we also want to check whether a given program, or system, fulfils a specification at hand. Thus, we need to develop a calculus of reasoning which allows us to draw conclusions from given assumptions, like initialised variables, which are reliable in the sense that they preserve truth: if all our assumptions are true, then our conclusion ought to be true as well. A much more difficult question is whether, given any true property of a computer program, we can find an argument in our calculus that has this property as its conclusion. The declarative sentence (3) above might illuminate the problematic aspect of such questions in the context of number theory.

The logics we intend to design are symbolic in nature. We translate a certain sufficiently large subset of all English declarative sentences into strings of symbols. This gives us a compressed but still complete encoding of declarative sentences and allows us to concentrate on the mere mechanics of our argumentation. This is important since specifications of systems or software are sequences of such declarative sentences. It further opens up the possibility of automatic manipulation of such specifications, a job that computers just love to do1. Our strategy is to consider certain declarative sentences as being atomic, or indecomposable, like the sentence

‘The number 5 is even.’

We assign certain distinct symbols $p , q , r , \ldots$ , or sometimes $p _ { 1 } , p _ { 2 } , p _ { 3 } , . . .$ to each of these atomic sentences and we can then code up more complex sentences in a compositional way. For example, given the atomic sentences

$p$ : ‘I won the lottery last week.’ $q$ : ‘I purchased a lottery ticket.’ $r$ : ‘I won last week’s sweepstakes.’

we can form more complex sentences according to the rules below:

¬: The negation of $p$ is denoted by $\neg p$ and expresses ‘I did not win the lottery last week,’ or equivalently ‘It is not true that I won the lottery last week.’   
: Given $p$ and $r$ we may wish to state that at least one of them is true: ‘I won the lottery last week, or I won last week’s sweepstakes;’ we denote this declarative sentence by $p \vee r$ and call it the disjunction of $p$ and $r ^ { 2 }$ .   
: Dually, the formula $p \wedge r$ denotes the rather fortunate conjunction of $p$ and $r$ : ‘Last week I won the lottery and the sweepstakes.’   
: Last, but definitely not least, the sentence ‘If I won the lottery last week, then I purchased a lottery ticket.’ expresses an implication between $p$ and $q$ , suggesting that $q$ is a logical consequence of $p$ . We write $p \longrightarrow q$ for that3. We call $p$ the assumption of $p \longrightarrow q$ and $q$ its conclusion.

Of course, we are entitled to use these rules of constructing propositions repeatedly. For example, we are now in a position to form the proposition

$$
p \land q \to \neg r \lor q
$$

which means that ‘if $p$ and $q$ then not $r$ or $q ^ { \prime }$ . You might have noticed a potential ambiguity in this reading. One could have argued that this sentence has the structure ‘p is the case and if q then . . . ’ A computer would require the insertion of brackets, as in

$$
( p \land q ) \to ( ( \neg r ) \lor q )
$$

to disambiguate this assertion. However, we humans get annoyed by a proliferation of such brackets which is why we adopt certain conventions about the binding priorities of these symbols.

Convention $\mathbf { 1 . 3 \_ }$ binds more tightly than ∨ and $\wedge$ , and the latter two bind more tightly than $\longrightarrow$ . Implication $\longrightarrow$ is right-associative: expressions of the form $p  q  r$ denote $p \to ( q \to r )$ .

# 1.2 Natural deduction

How do we go about constructing a calculus for reasoning about propositions, so that we can establish the validity of Examples 1.1 and 1.2? Clearly, we would like to have a set of rules each of which allows us to draw a conclusion given a certain arrangement of premises.

In natural deduction, we have such a collection of proof rules. They allow us to infer formulas from other formulas. By applying these rules in succession, we may infer a conclusion from a set of premises.

Let’s see how this works. Suppose we have a set of formulas4 $\phi _ { 1 }$ , $\phi _ { 2 }$ , $\phi _ { 3 }$ , . . . , $\phi _ { n }$ , which we will call premises, and another formula, $\psi$ , which we will call a conclusion. By applying proof rules to the premises, we hope to get some more formulas, and by applying more proof rules to those, to eventually obtain the conclusion. This intention we denote by

$$
\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi .
$$

This expression is called a sequent; it is valid if a proof for it can be found. The sequent for Examples 1.1 and 1.2 is $p \land \lnot q \to r , \lnot r , p \vdash q$ . Constructing such a proof is a creative exercise, a bit like programming. It is not necessarily obvious which rules to apply, and in what order, to obtain the desired conclusion. Additionally, our proof rules should be carefully chosen; otherwise, we might be able to ‘prove’ invalid patterns of argumentation. For example, we expect that we won’t be able to show the sequent $p , q \vdash p \land \lnot q$ . For example, if $p$ stands for ‘Gold is a metal.’ and $q$ for ‘Silver is a metal,’ then knowing these two facts should not allow us to infer that ‘Gold is a metal whereas silver isn’t.’

Let’s now look at our proof rules. We present about fifteen of them in total; we will go through them in turn and then summarise at the end of this section.

# 1.2.1 Rules for natural deduction

The rules for conjunction Our first rule is called the rule for conjunction $( \wedge )$ : and-introduction. It allows us to conclude $\phi \wedge \psi$ , given that we have already concluded $\phi$ and $\psi$ separately. We write this rule as

$$
{ \frac { \phi } { \phi \wedge \psi } } \wedge \mathrm { i } .
$$

Above the line are the two premises of the rule. Below the line goes the conclusion. (It might not yet be the final conclusion of our argument; we might have to apply more rules to get there.) To the right of the line, we write the name of the rule; ∧i is read ‘and-introduction’. Notice that we have introduced a $\wedge$ (in the conclusion) where there was none before (in the premises).

For each of the connectives, there is one or more rules to introduce it and one or more rules to eliminate it. The rules for and-elimination are these two:

$$
{ \frac { \phi \wedge \psi } { \phi } } \wedge \mathbf { e } _ { 1 } \qquad { \frac { \phi \wedge \psi } { \psi } } \wedge \mathbf { e } _ { 2 } .
$$

The rule $\wedge \mathrm { e } _ { 1 }$ says: if you have a proof of $\phi \wedge \psi$ , then by applying this rule you can get a proof of $\phi$ . The rule $\Lambda \mathrm { e _ { 2 } }$ says the same thing, but allows you to conclude $\psi$ instead. Observe the dependences of these rules: in the first rule of (1.1), the conclusion $\phi$ has to match the first conjunct of the premise, whereas the exact nature of the second conjunct $\psi$ is irrelevant. In the second rule it is just the other way around: the conclusion $\psi$ has to match the second conjunct $\psi$ and $\phi$ can be any formula. It is important to engage in this kind of pattern matching before the application of proof rules.

Example 1.4 Let’s use these rules to prove that $p \wedge q$ , $r \vdash q \land r$ is valid. We start by writing down the premises; then we leave a gap and write the

conclusion:

$$
\begin{array} { l } { p \wedge q } \\ { r } \\ { q \wedge r } \end{array}
$$

The task of constructing the proof is to fill the gap between the premises and the conclusion by applying a suitable sequence of proof rules. In this case, we apply $\Lambda \mathrm { e _ { 2 } }$ to the first premise, giving us $q$ . Then we apply ∧i to this $q$ and to the second premise, $r$ , giving us $q \wedge r$ . That’s it! We also usually number all the lines, and write in the justification for each line, producing this:

$$
{ \begin{array} { l l l l } { 1 } & { } & { } & { p \wedge q } & { { \mathrm { p r e m i s e } } } \\ { 2 } & { } & { } & { r } & { { \mathrm { p r e m i s e } } } \\ { 3 } & { } & { } & { q } & { \wedge \mathrm { e } _ { 2 } \ 1 } \\ { 4 } & { } & { } & { q \wedge r } & { \wedge \mathrm { i } 3 , 2 } \end{array} }
$$

Demonstrate to yourself that you’ve understood this by trying to show on your own that $( p \land q ) \land r$ , $s \wedge t \vdash q \wedge s$ is valid. Notice that the $\phi$ and $\psi$ can be instantiated not just to atomic sentences, like $p$ and $q$ in the example we just gave, but also to compound sentences. Thus, from $( p \land q ) \land r$ we can deduce $p \wedge q$ by applying $\wedge \mathrm { e } _ { 1 }$ , instantiating $\phi$ to $p \wedge q$ and $\psi$ to $r$ .

If we applied these proof rules literally, then the proof above would actually be a tree with root $q \wedge r$ and leaves $p \wedge q$ and $r$ , like this:

$$
{ \frac { { \frac { p \wedge q } { q } } \wedge \mathrm { e } _ { 2 } } { \frac { q } { q \wedge r } } } \wedge \mathrm { i }
$$

However, we flattened this tree into a linear presentation which necessitates the use of pointers as seen in lines 3 and 4 above. These pointers allow us to recreate the actual proof tree. Throughout this text, we will use the flattened version of presenting proofs. That way you have to concentrate only on finding a proof, not on how to fit a growing tree onto a sheet of paper.

If a sequent is valid, there may be many different ways of proving it. So if you compare your solution to these exercises with those of others, they need not coincide. The important thing to realise, though, is that any putative proof can be checked for correctness by checking each individual line, starting at the top, for the valid application of its proof rule.

The rules of double negation Intuitively, there is no difference between a formula $\phi$ and its double negation $\neg \neg \phi$ , which expresses no more and nothing less than $\phi$ itself. The sentence

‘It is not true that it does not rain.’ is just a more contrived way of saying

‘It rains.’

Conversely, knowing ‘It rains,’ we are free to state this fact in this more complicated manner if we wish. Thus, we obtain rules of elimination and introduction for double negation:

$$
\frac { \neg \neg \phi } { \phi } \neg \neg \mathrm { e } \qquad \frac { \phi } { \neg \neg \phi } \neg \neg \mathrm { i } .
$$

(There are rules for single negation on its own, too, which we will see later.)

Example 1.5 The proof of the sequent $p , \neg \neg ( q \land r ) \vdash \neg \neg p \land r$ below uses most of the proof rules discussed so far:

$$
\begin{array} { l l l l } { { 1 } } & { { } } & { { p } } & { { \mathrm { p r e m i s e } } } \\ { { 2 } } & { { } } & { { \quad - \lnot ( q \land r ) } } & { { \mathrm { p r e m i s e } } } \\ { { 3 } } & { { } } & { { \quad \lnot \lnot p } } & { { \quad \lnot \mathrm { i } } } \\ { { 4 } } & { { } } & { { q \land r } } & { { \quad \lnot \mathrm { e } \ 2 } } \\ { { 5 } } & { { } } & { { r } } & { { \quad \land \lor 2 4 } } \\ { { 6 } } & { { } } & { { \quad \lnot \lnot p \land r } } & { { \quad \land 3 . 5 } } \end{array}
$$

Example 1.6 We now prove the sequent $( p \land q ) \land r$ , $s \wedge t \vdash q \wedge s$ which you were invited to prove by yourself in the last section. Please compare the proof below with your solution:

$$
\begin{array} { l l l l } { { 1 } } & { { } } & { { ( p \wedge q ) \wedge r } } & { { \mathrm { p r e m i s e } } } \\ { { 2 } } & { { } } & { { s \wedge t } } & { { \mathrm { p r e m i s e } } } \\ { { 3 } } & { { } } & { { p \wedge q } } & { { \wedge \mathrm { e } _ { 1 } 1 } } \\ { { 4 } } & { { } } & { { q } } & { { \wedge \mathrm { e } _ { 2 } 3 } } \\ { { 5 } } & { { } } & { { s } } & { { \wedge \mathrm { e } _ { 1 } 2 } } \\ { { 6 } } & { { } } & { { q \wedge s } } & { { \wedge \mathrm { i } 4 , 5 } } \end{array}
$$

The rule for eliminating implication There is one rule to introduce $\longrightarrow$ and one to eliminate it. The latter is one of the best known rules of propositional logic and is often referred to by its Latin name modus ponens. We will usually call it by its modern name, implies-elimination (sometimes also referred to as arrow-elimination). This rule states that, given $\phi$ and knowing that $\phi$ implies $\psi$ , we may rightfully conclude $\psi$ . In our calculus, we write this as

$$
{ \frac { \phi \phi \phi \longrightarrow \psi } { \psi } } \to \mathrm { e } .
$$

Let us justify this rule by spelling out instances of some declarative sentences $p$ and $q$ . Suppose that

$$
\begin{array} { c } { p \colon \mathrm { I t ~ r a i n e d . } } \\ { p \to q \colon \mathrm { I f ~ i t ~ r a i n e d , ~ t h e n ~ t h e ~ s t r e e t ~ i s ~ w e t . } } \end{array}
$$

so $q$ is just ‘The street is wet.’ Now, if we know that it rained and if we know that the street is wet in the case that it rained, then we may combine these two pieces of information to conclude that the street is indeed wet. Thus, the justification of the →e rule is a mere application of common sense. Another example from programming is:

$p$ : The value of the program’s input is an integer. $p \longrightarrow q$ : If the program’s input is an integer, then the program outputs a boolean.

Again, we may put all this together to conclude that our program outputs a boolean value if supplied with an integer input. However, it is important to realise that the presence of $p$ is absolutely essential for the inference to happen. For example, our program might well satisfy $p \longrightarrow q$ , but if it doesn’t satisfy $p - \mathrm { e . g }$ . if its input is a surname – then we will not be able to derive $q$ .

As we saw before, the formal parameters $\phi$ and the $\psi$ for $ \mathrm { e }$ can be instantiated to any sentence, including compound ones:

$$
\begin{array} { l l l } { { 1 } } & { { \qquad } } & { { \neg p \wedge q } } & { { \mathrm { p r e m i s e } } } \\ { { } } & { { } } & { { } } & { { } } \\ { { 2 } } & { { \qquad } } & { { \neg p \wedge q \longrightarrow r \vee \neg p } } & { { \mathrm { p r e m i s e } } } \\ { { } } & { { 3 } } & { { \qquad } } & { { r \vee \neg p } } & { { \longrightarrow { \mathrm { e } } 2 , 1 } } \end{array}
$$

Of course, we may use any of these rules as often as we wish. For example, given $p$ , $p \longrightarrow q$ and $p \to ( q \to r )$ , we may infer $r$ :

$$
\begin{array} { l l l l } { { 1 } } & { { \qquad } } & { { p  ( q  r ) } } & { { \mathrm { p r e m i s e } } } \\ { { 2 } } & { { \qquad } } & { { p  q } } & { { \mathrm { p r e m i s e } } } \\ { { 3 } } & { { \qquad } } & { { p } } & { { \mathrm { p r e m i s e } } } \\ { { 4 } } & { { \qquad } } & { { q  r } } & { { \qquad { \mathrm { e } } 1 , 3 } } \\ { { 5 } } & { { \qquad } } & { { q } } & { { \qquad { \mathrm { e } } 2 , 3 } } \\ { { 6 } } & { { \qquad } } & { { r } } & { { \qquad { \mathrm { e } } 4 , 5 } } \end{array}
$$

Before turning to implies-introduction, let’s look at a hybrid rule which has the Latin name modus tollens. It is like the $ \mathrm { e }$ rule in that it eliminates an implication. Suppose that $p \longrightarrow q$ and ¬q are the case. Then, if $p$ holds we can use →e to conclude that $q$ holds. Thus, we then have that $q$ and $\neg q$ hold, which is impossible. Therefore, we may infer that $p$ must be false. But this can only mean that $\neg p$ is true. We summarise this reasoning into the rule modus tollens, or MT for short:5

$$
{ \frac { \phi \to \psi \quad \neg \psi } { \neg \phi } } \mathrm { M T } .
$$

Again, let us see an example of this rule in the natural language setting: ‘If Abraham Lincoln was Ethiopian, then he was African. Abraham Lincoln was not African; therefore he was not Ethiopian.’

Example 1.7 In the following proof of

$$
p \to ( q \to r ) , p , \neg r \vdash \neg q
$$

we use several of the rules introduced so far:

$$
\begin{array} { l l l l } { { 1 } } & { { } } & { { p  ( q  r ) } } & { { \mathrm { p r e m i s e } } } \\ { { 2 } } & { { } } & { { p } } & { { \mathrm { p r e m i s e } } } \\ { { 3 } } & { { } } & { { \lnot r } } & { { \mathrm { p r e m i s e } } } \\ { { 4 } } & { { } } & { { q  r } } & { {  { \mathrm { e 1 , 2 } } } } \\ { { 5 } } & { { } } & { { \lnot q } } & { { \bf { M } T \ 4 , 3 } } \end{array}
$$

Examples 1.8 Here are two example proofs which combine the rule MT with either ¬¬e or $\neg \neg \mathrm { i }$ :

$$
\begin{array} { l l l l l } { { 1 } } & { { } } & { { } } & { { \lnot p \to q } } & { { \mathrm { p r e m i s e } } } \\ { { \ : 2 } } & { { } } & { { } } & { { \lnot q } } & { { \mathrm { p r e m i s e } } } \\ { { \ : 3 } } & { { } } & { { } } & { { \lnot \lnot p } } & { { } } & { { \mathrm { M T \ 1 , 2 } } } \\ { { \ : 4 } } & { { } } & { { p } } & { { } } & { { \lnot \lnot \lnot \ l } } \end{array}
$$

proves that the sequent $\neg p \to q$ , $\neg q \vdash p$ is valid; and

$$
\begin{array} { l l l l l } { { 1 } } & { { } } & { { } } & { { p  \lnot q } } & { { \mathrm { p r e m i s e } } } \\ { { } } & { { } } & { { } } & { { } } & { { } } \\ { { 2 } } & { { } } & { { q } } & { { \mathrm { p r e m i s e } } } \\ { { } } & { { 3 } } & { { } } & { { \lnot \lnot q } } & { { \lnot \lnot \mathrm { i } \ 2 } } \\ { { } } & { { } } & { { } } & { { } } & { { } } \\ { { 4 } } & { { } } & { { \lnot p } } & { { } } & { { { \mathrm { M T \ 1 } } , 3 } } \end{array}
$$

shows the validity of the sequent $p \to \neg q$ , $q \vdash \lnot p$ .

Note that the order of applying double negation rules and MT is different in these examples; this order is driven by the structure of the particular sequent whose validity one is trying to show.

The rule implies introduction The rule MT made it possible for us to show that $p \longrightarrow q$ , $\neg q \vdash \neg p$ is valid. But the validity of the sequent $p  q \vdash$ $\neg q  \neg p$ seems just as plausible. That sequent is, in a certain sense, saying the same thing. Yet, so far we have no rule which builds implications that do not already occur as premises in our proofs. The mechanics of such a rule are more involved than what we have seen so far. So let us proceed with care. Let us suppose that $p \longrightarrow q$ is the case. If we temporarily assume that $\neg q$ holds, we can use MT to infer $\neg p$ . Thus, assuming $p \longrightarrow q$ we can show that $\neg q$ implies $\neg p$ ; but the latter we express symbolically as $\neg q  \neg p$ . To summarise, we have found an argumentation for $p \to q \vdash \lnot q \to \lnot p$ :

<table><tr><td>1</td><td>p→q</td><td>premise</td></tr><tr><td>2</td><td>-q</td><td>assumption</td></tr><tr><td>3</td><td>P</td><td>MT 1,2</td></tr><tr><td>4</td><td>-q→-p</td><td>→i 2-3</td></tr></table>

The box in this proof serves to demarcate the scope of the temporary assumption $\neg q$ . What we are saying is: let’s make the assumption of $\neg q$ . To do this, we open a box and put $\neg q$ at the top. Then we continue applying other rules as normal, for example to obtain $\neg p$ . But this still depends on the assumption of $\neg q$ , so it goes inside the box. Finally, we are ready to apply →i. It allows us to conclude $\neg q  \neg p$ , but that conclusion no longer depends on the assumption $\neg q$ . Compare this with saying that ‘If you are French, then you are European.’ The truth of this sentence does not depend on whether anybody is French or not. Therefore, we write the conclusion $\neg q  \neg p$ outside the box.

This works also as one would expect if we think of $p \longrightarrow q$ as a type of a procedure. For example, $p$ could say that the procedure expects an integer value $x$ as input and $q$ might say that the procedure returns a boolean value $y$ as output. The validity of $p \longrightarrow q$ amounts now to an assume-guarantee assertion: if the input is an integer, then the output is a boolean. This assertion can be true about a procedure while that same procedure could compute strange things or crash in the case that the input is not an integer. Showing $p \longrightarrow q$ using the rule $ \mathrm { i }$ is now called type checking, an important topic in the construction of compilers for typed programming languages.

We thus formulate the rule →i as follows:

$$
 \begin{array} { c } { { [ \phi ] } } \\ { { \vdots } } \\ { { \psi } } \\ { { \phi  \psi } } \end{array}  { } _ {  } \mathrm { i } .
$$

It says: in order to prove $\phi  \psi$ , make a temporary assumption of $\phi$ and then prove $\psi$ . In your proof of $\psi$ , you can use $\phi$ and any of the other formulas such as premises and provisional conclusions that you have made so far. Proofs may nest boxes or open new boxes after old ones have been closed. There are rules about which formulas can be used at which points in the proof. Generally, we can only use a formula $\phi$ in a proof at a given point if that formula occurs prior to that point and if no box which encloses that occurrence of $\phi$ has been closed already.

The line immediately following a closed box has to match the pattern of the conclusion of the rule that uses the box. For implies-introduction, this means that we have to continue after the box with $\phi  \psi$ , where $\phi$ was the first and $\psi$ the last formula of that box. We will encounter two more proof rules involving proof boxes and they will require similar pattern matching.

Example 1.9 Here is another example of a proof using $\longrightarrow$ i:

<table><tr><td>1</td><td>-q→-p</td><td>premise</td></tr><tr><td>2</td><td>p</td><td>assumption</td></tr><tr><td>3</td><td>--p</td><td>--i2</td></tr><tr><td>4</td><td>q</td><td>MT 1,3</td></tr><tr><td>5</td><td>p→」-q</td><td>→i 2-4</td></tr></table>

which verifies the validity of the sequent $\neg q \to \neg p \vdash p \to \neg \neg q$ . Notice that we could apply the rule MT to formulas occurring in or above the box: at line 4, no box has been closed that would enclose line 1 or 3.

At this point it is instructive to consider the one-line argument

1

which demonstrates $p \vdash p$ . The rule $ \mathrm { i }$ (with conclusion $\phi  \psi$ ) does not prohibit the possibility that $\phi$ and $\psi$ coincide. They could both be instantiated to $p$ . Therefore we may extend the proof above to

$$
\begin{array} { r l r l } { 1 } & { { } } & { [ { \begin{array} { l l l } { } & { { } \underbrace { p } } & { \mathrm { a s s u m p t i o n } } } \\ { \qquad p  p } & {  \mathrm { i } \ 1 - 1 } \end{array} } ]  \end{array}
$$

We write $\vdash p  p$ to express that the argumentation for $p \longrightarrow p$ does not depend on any premises at all.

Definition 1.10 Logical formulas $\phi$ with valid sequent $\vdash \phi$ are theorems.

Example 1.11 Here is an example of a theorem whose proof utilises most of the rules introduced so far:

<table><tr><td>1</td><td>q→r</td><td>assumption</td></tr><tr><td>2</td><td>-q→-p</td><td>assumption</td></tr><tr><td>3</td><td>p</td><td>assumption</td></tr><tr><td>4</td><td>-jp</td><td>--i3</td></tr><tr><td>5</td><td>jq</td><td>MT 2,4</td></tr><tr><td>6</td><td></td><td>--e 5</td></tr><tr><td>7</td><td>q</td><td></td></tr><tr><td>8</td><td>r</td><td>→e 1,6</td></tr><tr><td>9</td><td>p→r</td><td>→i3-7</td></tr><tr><td>(-q→-p)→(p→r) 10</td><td>i1 0</td><td>→i2-8</td></tr></table>

![](images/a2f25503d58d63a5f6b648e683a8da968729940667bebd212096508a4bc3737e.jpg)  
Figure 1.1. Part of the structure of the formula $( q \to r ) \to ( ( \neg q \to \neg p ) \to$ $( p \to r )$ ) to show how it determines the proof structure.

Therefore the sequent $\vdash ( q \longrightarrow r ) \to ( ( \neg q \to \neg p ) \to ( p \to r ) )$ is valid, showing that $( q \to r ) \to ( ( \neg q \to \neg p ) \to ( p \to r ) )$ is another theorem.

Remark 1.12 Indeed, this example indicates that we may transform any proof of $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ in such a way into a proof of the theorem

$$
\vdash \phi _ { 1 } \longrightarrow ( \phi _ { 2 } \longrightarrow ( \phi _ { 3 } \longrightarrow ( \cdots  ( \phi _ { n } \longrightarrow \psi ) \ldots ) ) )
$$

by ‘augmenting’ the previous proof with $n$ lines of the rule $ \mathrm { i }$ applied to $\phi _ { n }$ , $\phi _ { n - 1 } , . . .$ , $\phi _ { 1 }$ in that order.

The nested boxes in the proof of Example 1.11 reveal a pattern of using elimination rules first, to deconstruct assumptions we have made, and then introduction rules to construct our final conclusion. More difficult proofs may involve several such phases.

Let us dwell on this important topic for a while. How did we come up with the proof above? Parts of it are determined by the structure of the formulas we have, while other parts require us to be creative. Consider the logical structure of $( q \to r ) \to ( ( \neg q \to \neg p ) \to ( p \to r ) )$ schematically depicted in Figure 1.1. The formula is overall an implication since $\longrightarrow$ is the root of the tree in Figure 1.1. But the only way to build an implication is by means of the rule →i. Thus, we need to state the assumption of that implication as such (line 1) and have to show its conclusion (line 9). If we managed to do that, then we know how to end the proof in line 10. In fact, as we already remarked, this is the only way we could have ended it. So essentially lines 1, 9 and 10 are completely determined by the structure of the formula; further, we have reduced the problem to filling the gaps in between lines 1 and 9. But again, the formula in line 9 is an implication, so we have only one way of showing it: assuming its premise in line 2 and trying to show its conclusion in line 8; as before, line 9 is obtained by i. The formula $p \longrightarrow r$ in line 8 is yet another implication. Therefore, we have to assume $p$ in line 3 and hope to show $r$ in line 7, then $\longrightarrow$ i produces the desired result in line 8.

The remaining question now is this: how can we show $r$ , using the three assumptions in lines 1–3? This, and only this, is the creative part of this proof. We see the implication $q \longrightarrow r$ in line 1 and know how to get $r$ (using $\mathrm { \Gamma \to e }$ ) if only we had $q$ . So how could we get $q$ ? Well, lines 2 and 3 almost look like a pattern for the MT rule, which would give us $\neg \neg q$ in line 5; the latter is quickly changed to $q$ in line 6 via $\neg \neg \mathrm { e }$ . However, the pattern for MT does not match right away, since it requires $\neg \neg p$ instead of $p$ . But this is easily accomplished via i in line 4.

The moral of this discussion is that the logical structure of the formula to be shown tells you a lot about the structure of a possible proof and it is definitely worth your while to exploit that information in trying to prove sequents. Before ending this section on the rules for implication, let’s look at some more examples (this time also involving the rules for conjunction).

Example 1.13 Using the rule $\wedge \mathrm { i }$ , we can prove the validity of the sequent

$$
p \wedge q \longrightarrow r \vdash p \to ( q \to r ) :
$$

1 $p \land q  r$ premise

<table><tr><td>2</td><td>p</td><td>assumption</td></tr><tr><td>3</td><td>q</td><td>assumption</td></tr><tr><td>4</td><td>p&gt;q</td><td>∧i 2,3</td></tr><tr><td>5</td><td>r</td><td>→e 1,4</td></tr><tr><td>6</td><td>q→r</td><td>→i3-5</td></tr><tr><td>7</td><td>p→(q→r)</td><td>→i2-6</td></tr></table>

Example 1.14 Using the two elimination rules $\wedge \mathrm { e } _ { 1 }$ and ∧e2, we can show that the ‘converse’ of the sequent above is valid, too:

<table><tr><td>1</td><td>p→(q→r)</td><td>premise</td></tr><tr><td>2</td><td>p&gt;q</td><td>assumption</td></tr><tr><td>3</td><td>p</td><td>&gt;e1 2</td></tr><tr><td>4</td><td>q</td><td>∧e2 2</td></tr><tr><td>5</td><td>q→r</td><td>→e 1,3</td></tr><tr><td>6</td><td>r</td><td>→e 5,4</td></tr><tr><td>7</td><td>p&gt;q→r</td><td>→i2-6</td></tr></table>

The validity of $p \to ( q \to r ) \vdash p \land q \to r$ and $p \wedge q \longrightarrow r \vdash p \longrightarrow ( q \longrightarrow r )$ means that these two formulas are equivalent in the sense that we can prove one from the other. We denote this by

$$
p \land q \to r + \vdash p \to ( q \to r ) .
$$

Since there can be only one formula to the right of $\vdash$ , we observe that each instance of $\twoheadrightarrow$ can only relate two formulas to each other.

Example 1.15 Here is an example of a proof that uses introduction and elimination rules for conjunction; it shows the validity of the sequent $p \longrightarrow$ $q \vdash p \land r  q \land r$ :

<table><tr><td>1</td><td>p→q</td><td>premise</td></tr><tr><td>2</td><td>p&gt;r</td><td>assumption</td></tr><tr><td>3</td><td>p</td><td>&gt;e12</td></tr><tr><td>4</td><td>r</td><td>∧e2 2</td></tr><tr><td>5</td><td>q</td><td>→e 1,3</td></tr><tr><td>6</td><td>q&gt;r</td><td>∧i 5,4</td></tr><tr><td>7</td><td>p&gt;r→q&gt;r</td><td>→i2-6</td></tr></table>

The rules for disjunction The rules for disjunction are different in spirit from those for conjunction. The case for conjunction was concise and clear: proofs of $\phi \wedge \psi$ are essentially nothing but a concatenation of a proof of $\phi$ and a proof of $\psi$ , plus an additional line invoking ∧i. In the case of disjunctions, however, it turns out that the introduction of disjunctions is by far easier to grasp than their elimination. So we begin with the rules $\vee \mathrm { i } _ { 1 }$ and $\vee \mathrm { i } _ { 2 }$ . From the premise $\phi$ we can infer that $\cdot _ { \phi }$ or $\psi ^ { , }$ holds, for we already know that $\phi$ holds. Note that this inference is valid for any choice of $\psi$ . By the same token, we may conclude $\cdot \phi$ or $\psi ^ { \dagger }$ if we already have $\psi$ . Similarly, that inference works for any choice of $\phi$ . Thus, we arrive at the proof rules

$$
\frac { \phi } { \phi \vee \psi } \vee \mathrm { i } _ { 1 } \qquad \frac { \psi } { \phi \vee \psi } \vee \mathrm { i } _ { 2 } .
$$

So if $p$ stands for ‘Agassi won a gold medal in 1996.’ and $q$ denotes the sentence ‘Agassi won Wimbledon in 1996.’ then $p \vee q$ is the case because $p$ is true, regardless of the fact that $q$ is false. Naturally, the constructed disjunction depends upon the assumptions needed in establishing its respective disjunct $p$ or $q$ .

Now let’s consider or-elimination. How can we use a formula of the form $\phi \lor \psi$ in a proof? Again, our guiding principle is to disassemble assumptions into their basic constituents so that the latter may be used in our argumentation such that they render our desired conclusion. Let us imagine that we want to show some proposition $\chi$ by assuming $\phi \lor \psi$ . Since we don’t know which of $\phi$ and $\psi$ is true, we have to give two separate proofs which we need to combine into one argument:

1. First, we assume $\phi$ is true and have to come up with a proof of $\chi$ . 2. Next, we assume $\psi$ is true and need to give a proof of $\chi$ as well. 3. Given these two proofs, we can infer $\chi$ from the truth of $\phi \lor \psi$ , since our case analysis above is exhaustive.

Therefore, we write the rule ∨e as follows:

It is saying that: if $\phi \lor \psi$ is true and – no matter whether we assume $\phi$ or we assume $\psi \mathrm { ~ - ~ } \mathrm { w e }$ can get a proof of $\chi$ , then we are entitled to deduce $\chi$ anyway. Let’s look at a proof that $p \lor q \vdash q \lor p$ is valid:

<table><tr><td>1</td><td>pvq premise</td></tr><tr><td>2</td><td>p assumption</td></tr><tr><td>3</td><td>qvp Vi2 2</td></tr><tr><td>4</td><td>q assumption</td></tr><tr><td>5</td><td>qvp Vi1 4</td></tr><tr><td>6</td><td>qvp Ve 1,2-3,4-5</td></tr></table>

Here are some points you need to remember about applying the ∨e rule.

� For it to be a sound argument we have to make sure that the conclusions in each of the two cases (the $\chi$ in the rule) are actually the same formula.   
� The work done by the rule e is the combining of the arguments of the two cases into one.   
� In each case you may not use the temporary assumption of the other case, unless it is something that has already been shown before those case boxes began.   
� The invocation of rule e in line 6 lists three things: the line in which the disjunction appears (1), and the location of the two boxes for the two cases (2–3 and 4–5).

If we use $\phi \lor \psi$ in an argument where it occurs only as an assumption or a premise, then we are missing a certain amount of information: we know $\phi$ , or $\psi$ , but we don’t know which one of the two it is. Thus, we have to make a solid case for each of the two possibilities $\phi$ or $\psi$ ; this resembles the behaviour of a CASE or IF statement found in most programming languages.

Example 1.16 Here is a more complex example illustrating these points. We prove that the sequent $q \to r \vdash p \lor q \to p \lor r$ is valid:

<table><tr><td>1</td><td>q→r</td><td>premise</td></tr><tr><td>2</td><td>pVq</td><td>assumption</td></tr><tr><td>3</td><td>p</td><td>assumption</td></tr><tr><td>4</td><td>pvr</td><td>Vi1 3</td></tr><tr><td>5</td><td>q</td><td>assumption</td></tr><tr><td>6</td><td>r</td><td>→e 1,5</td></tr><tr><td>7</td><td>pVr</td><td>Vi2 6</td></tr><tr><td>8</td><td>pvr</td><td>Ve 2,3-4,5-7</td></tr><tr><td>9</td><td>pvq→pvr</td><td>→i2-8</td></tr></table>

Note that the propositions in lines 4, 7 and 8 coincide, so the application of ∨e is legitimate.

We give some more example proofs which use the rules ∨e, ∨i1 and $\vee \mathrm { i } _ { 2 }$

Example 1.17 Proving the validity of the sequent $( p \vee q ) \vee r \vdash p \vee ( q \vee r )$ is surprisingly long and seemingly complex. But this is to be expected, since the elimination rules break $( p \lor q ) \lor r$ up into its atomic constituents $p , \ q$ and $r$ , whereas the introduction rules then built up the formula $p \vee ( q \vee r )$ .

<table><tr><td>1</td><td>(pvq)vr I</td><td>premise</td></tr><tr><td>2</td><td>(pvq)</td><td>assumption</td></tr><tr><td>3</td><td>p</td><td>assumption</td></tr><tr><td>4</td><td>pV(qVr)</td><td>Vi1 3</td></tr><tr><td>5</td><td>q</td><td>assumption</td></tr><tr><td>6</td><td>qVr</td><td>Vi1 5</td></tr><tr><td>7</td><td>pV(qVr)</td><td>Vi2 6</td></tr><tr><td>8</td><td>pV(qVr)</td><td>Ve 2,3-4,5-7</td></tr><tr><td>9</td><td>r</td><td> assumption</td></tr><tr><td>10</td><td>qVr</td><td>Vi2 9</td></tr><tr><td>11</td><td>pV(qVr)</td><td>Vi2 10</td></tr><tr><td>12</td><td>pV (qvr)</td><td>Ve1,2-8,9-11</td></tr></table>

Example 1.18 From boolean algebra, or circuit theory, you may know that disjunctions distribute over conjunctions. We are now able to prove this in natural deduction. The following proof:

<table><tr><td>1</td><td>p&gt;(qvr)</td><td>premise</td></tr><tr><td>2</td><td>p</td><td>&gt;e1 1</td></tr><tr><td>3</td><td>qVr</td><td>&gt;e2 1</td></tr><tr><td>4</td><td>q</td><td>assumption</td></tr><tr><td>5</td><td>p&gt;q</td><td>∧i 2,4</td></tr><tr><td>6</td><td>(p&gt;q)ν(p&gt;r)</td><td>Vi1 5</td></tr><tr><td>7</td><td>r</td><td>assumption</td></tr><tr><td>8</td><td>p&gt;r</td><td>∧i 2,7</td></tr><tr><td>9</td><td>(p&gt;q)ν(𝑝&gt;r)</td><td>Vi2 8</td></tr><tr><td>10</td><td>(𝑝&gt;q)ν(p&gt;r)</td><td>Ve 3,4-6,7-9</td></tr></table>

verifies the validity of the sequent $p \wedge ( q \vee r ) \vdash ( p \wedge q ) \vee ( p \wedge r )$ and you are encouraged to show the validity of the ‘converse’ $( p \wedge q ) \vee ( p \wedge r ) \vdash p \wedge$ $( q \lor r )$ yourself.

A final rule is required in order to allow us to conclude a box with a formula which has already appeared earlier in the proof. Consider the sequent $\vdash p \to ( q \to p )$ , whose validity may be proved as follows:

<table><tr><td>1</td><td>p</td><td>assumption</td></tr><tr><td>2</td><td>q</td><td>assumption</td></tr><tr><td>3</td><td>p</td><td>copy 1</td></tr><tr><td>4</td><td>q→p</td><td>→i 2-3</td></tr><tr><td>5</td><td>p→(q→p)</td><td>→i1-4</td></tr></table>

The rule ‘copy’ allows us to repeat something that we know already. We need to do this in this example, because the rule $\longrightarrow$ i requires that we end the inner box with $p$ . The copy rule entitles us to copy formulas that appeared before, unless they depend on temporary assumptions whose box has already been closed. Though a little inelegant, this additional rule is a small price to pay for the freedom of being able to use premises, or any other ‘visible’ formulas, more than once.

The rules for negation We have seen the rules ¬¬i and ¬¬e, but we haven’t seen any rules that introduce or eliminate single negations. These rules involve the notion of contradiction. This detour is to be expected since our reasoning is concerned about the inference, and therefore the preservation, of truth. Hence, there cannot be a direct way of inferring $\lnot \phi$ , given $\phi$ .

Definition 1.19 Contradictions are expressions of the form $\phi \wedge \neg \phi$ or $\lnot \phi \wedge$ $\phi$ , where $\phi$ is any formula.

Examples of such contradictions are $r \wedge \neg r$ , $( p \to q ) \land \neg ( p \to q )$ and $\neg ( r \vee$ $s \to q ) \land ( r \lor s \to q )$ . Contradictions are a very important notion in logic. As far as truth is concerned, they are all equivalent; that means we should be able to prove the validity of

$$
\neg ( r \vee s  q ) \wedge ( r \vee s  q ) + \mid - ( p  q ) \wedge \neg ( p  q )
$$

since both sides are contradictions. We’ll be able to prove this later, when we have introduced the rules for negation.

Indeed, it’s not just that contradictions can be derived from contradictions; actually, any formula can be derived from a contradiction. This can be

confusing when you first encounter it; why should we endorse the argument $p \wedge \neg p \vdash q$ , where

$$
\begin{array} { r l } & { p \colon \mathrm { T h e ~ m o o n ~ i s ~ m a d e ~ o f ~ g r e e n ~ c h e e s e } . } \\ & { q \colon \mathrm { I ~ l i k e ~ p e p p e r o n i ~ o n ~ m y ~ p i z z a } . } \end{array}
$$

considering that our taste in pizza doesn’t have anything to do with the constitution of the moon? On the face of it, such an endorsement may seem absurd. Nevertheless, natural deduction does have this feature that any formula can be derived from a contradiction and therefore it makes this argument valid. The reason it takes this stance is that  tells us all the things we may infer, provided that we can assume the formulas to the left of it. This process does not care whether such premises make any sense. This has at least the advantage that we can match $\vdash$ to checks based on semantic intuitions which we formalise later by using truth tables: if all the premises compute to ‘true’, then the conclusion must compute ‘true’ as well. In particular, this is not a constraint in the case that one of the premises is (always) false.

The fact that $\perp$ can prove anything is encoded in our calculus by the proof rule bottom-elimination:

$$
{ \frac { \bot } { \phi } } \bot \mathrm { e } .
$$

The fact that $\perp$ itself represents a contradiction is encoded by the proof rule not-elimination:

$$
{ \frac { \phi \ \not \to \phi } { \bot } } \not = \not \mathrm { e } .
$$

Example 1.20 We apply these rules to show that $\neg p \lor q \vdash p \to q$ is valid:

$\neg p \lor q$

<table><tr><td>2</td><td>-p</td><td>premise</td><td>q premise</td></tr><tr><td>3</td><td>p</td><td rowspan="3">assumption -e 3,2</td><td rowspan="3">P assumption q copy 2</td></tr><tr><td>4</td><td>上</td></tr><tr><td>5</td><td>⊥e 4 q</td></tr><tr><td>6</td><td>→i3-5 p→q</td><td>p→q →→i3-4</td></tr><tr><td>7 p→q</td><td colspan="2">Ve 1,2-6</td></tr></table>

Notice how, in this example, the proof boxes for ∨e are drawn side by side instead of on top of each other. It doesn’t matter which way you do it.

What about introducing negations? Well, suppose we make an assumption which gets us into a contradictory state of affairs, i.e. gets us $\perp$ . Then our assumption cannot be true; so it must be false. This intuition is the basis for the proof rule i:

$$
\left[ \begin{array} { l } { \phi } \\ { \vdots } \\ { \underline { { \perp } } } \\ { \neg \phi } \end{array} \right] _ { \bf { \bar { \phi } } ^ { \bar { \phi } } \bar { \bf { \Phi } } ^ { \bar { \phi } ^ { \bar { \phi } ^ { \bar { \phi } ^ { \bar { \phi } ^ { \bar { \phi } ^ { \bar { \phi } ^ { \ddots } } } } } } } \bar { \bf { \Phi } } ^ { \bar { \phi } ^ { \bar { \phi } ^ { \bar { \phi } ^ { \bar { \phi } ^ { \ddots } } } } } } \mathrm { ~ . ~ }
$$

Example 1.21 We put these rules in action, demonstrating that the sequent $p \longrightarrow q$ , $p \to \neg q \vdash \neg p$ is valid:

<table><tr><td>1</td><td>p→q</td><td>premise premise</td></tr><tr><td>2 3</td><td>p→-q p</td><td>assumption</td></tr><tr><td>4</td><td>q</td><td>→e 1,3</td></tr><tr><td>5</td><td>q</td><td>→e 2,3</td></tr><tr><td>6</td><td>上</td><td>-e 4,5</td></tr><tr><td>7</td><td>-p</td><td>-i3-6</td></tr></table>

Lines 3–6 contain all the work of the $\neg \mathrm { i }$ rule. Here is a second example, showing the validity of a sequent, $p \longrightarrow \neg p \vdash \neg p$ , with a contradictory formula as sole premise:

<table><tr><td>1</td><td>p→-p</td><td>premise</td></tr><tr><td>2</td><td>p</td><td>assumption</td></tr><tr><td>3</td><td>-p</td><td>→e 1,2</td></tr><tr><td>4</td><td>上</td><td>-e 2,3</td></tr><tr><td>5</td><td>-p</td><td>-i2-4</td></tr></table>

Example 1.22 We prove that the sequent $p \to ( q \to r )$ , p, $\neg r \vdash \neg q$ is valid,

without using the MT rule:

<table><tr><td colspan="2">1</td><td rowspan="2">p→(q→r)</td><td rowspan="2">premise premise</td></tr><tr><td>2</td><td>p</td></tr><tr><td colspan="2">3</td><td>-r</td><td>premise</td></tr><tr><td>4</td><td>q</td><td></td><td>assumption</td></tr><tr><td>5</td><td>q→r</td><td></td><td>→e 1,2</td></tr><tr><td>6</td><td>r</td><td></td><td>→e 5,4</td></tr><tr><td>7</td><td>上</td><td></td><td>-e 6,3</td></tr><tr><td colspan="2">8</td><td>-q</td><td>-i 4-7</td></tr></table>

Example 1.23 Finally, we return to the argument of Examples 1.1 and 1.2, which can be coded up by the sequent $p \wedge \neg q \longrightarrow r$ , $\neg r$ , $p \vdash q$ whose validity we now prove:

![](images/d085916c3bb99a60e31f1f31435dafb351b6216a7b645fb2149b64e907e78d94.jpg)

# 1.2.2 Derived rules

When describing the proof rule modus tollens (MT), we mentioned that it is not a primitive rule of natural deduction, but can be derived from some of the other rules. Here is the derivation of

$$
{ \frac { \phi \to \psi \quad \neg \psi } { \neg \phi } } \mathrm { M T }
$$

from $ \mathrm { e }$ , ¬e and ¬i:

<table><tr><td>1</td><td>→</td><td>premise</td></tr><tr><td>2</td><td>1</td><td>premise</td></tr><tr><td>3</td><td>?</td><td>assumption</td></tr><tr><td>4</td><td>4</td><td>→e 1,3</td></tr><tr><td>5</td><td>上</td><td>-e 4,2</td></tr><tr><td>6</td><td>-</td><td>-i3-5</td></tr></table>

We could now go back through the proofs in this chapter and replace applications of MT by this combination of $ \mathrm { e }$ , $\neg \mathrm { e }$ and $\mathrm { \Gamma } \to \mathrm { i }$ . However, it is convenient to think of MT as a shorthand (or a macro).

The same holds for the rule

$$
\frac { \phi } { \neg \neg \phi } \neg \neg \mathrm { i . }
$$

It can be derived from the rules $\neg \mathrm { i }$ and $\neg \mathrm { e }$ , as follows:

<table><tr><td>1</td><td>?</td><td>premise</td></tr><tr><td>2</td><td></td><td>assumption</td></tr><tr><td>3</td><td>上</td><td>-e 1,2</td></tr><tr><td>4</td><td>-</td><td>-i2-3</td></tr></table>

There are (unboundedly) many such derived rules which we could write down. However, there is no point in making our calculus fat and unwieldy; and some purists would say that we should stick to a minimum set of rules, all of which are independent of each other. We don’t take such a purist view. Indeed, the two derived rules we now introduce are extremely useful. You will find that they crop up frequently when doing exercises in natural deduction, so it is worth giving them names as derived rules. In the case of the second one, its derivation from the primitive proof rules is not very obvious.

The first one has the Latin name reductio ad absurdum. It means ‘reduction to absurdity’ and we will simply call it proof by contradiction (PBC for short). The rule says: if from $\lnot \phi$ we obtain a contradiction, then we are entitled to deduce $\phi$ :

![](images/15d1e7064511916c240c66cef36bb957d452e1f7fef7d1f602c2157dc4cd85d6.jpg)

This rule looks rather similar to $\mathrm { \Gamma } \to \mathrm { i }$ , except that the negation is in a different place. This is the clue to how to derive PBC from our basic proof rules. Suppose we have a proof of $\perp$ from $\lnot \phi$ . By $ \mathrm { i }$ , we can transform this into a proof of $\neg \phi \to \bot$ and proceed as follows:

<table><tr><td>1</td><td>}→↓</td><td>given</td></tr><tr><td>2</td><td></td><td>assumption</td></tr><tr><td>3</td><td>上</td><td>→e1,2</td></tr><tr><td>4</td><td>}i</td><td>-i2-3</td></tr><tr><td>5</td><td>?</td><td>--e 4</td></tr></table>

This shows that PBC can be derived from $\longrightarrow$ i, ¬i, →e and $\neg \neg \mathrm { e }$ .

The final derived rule we consider in this section is arguably the most useful to use in proofs, because its derivation is rather long and complicated, so its usage often saves time and effort. It also has a Latin name, tertium non datur; the English name is the law of the excluded middle, or LEM for short. It simply says that $\phi \lor \neg \phi$ is true: whatever $\phi$ is, it must be either true or false; in the latter case, $\lnot \phi$ is true. There is no third possibility (hence excluded middle): the sequent $\vdash \phi \lor \lnot \phi$ is valid. Its validity is implicit, for example, whenever you write an if-statement in a programming language: ‘if $B \ \{ C _ { 1 } \}$ else $\{ C _ { 2 } \} ^ { , }$ relies on the fact that $B \lor \lnot B$ is always true (and that $B$ and $\neg B$ can never be true at the same time). Here is a proof in natural deduction that derives the law of the excluded middle from basic proof rules:

<table><tr><td>1</td><td>-(Φv-Φ)</td><td>assumption</td></tr><tr><td>2</td><td>?</td><td>assumption</td></tr><tr><td>3</td><td>v-</td><td>Vi1 2</td></tr><tr><td>4</td><td>上</td><td>-e 3,1</td></tr><tr><td>5</td><td>-</td><td>-i 2-4</td></tr><tr><td>6</td><td>v-</td><td>Vi2 5</td></tr><tr><td>7</td><td>上</td><td>-e 6,1</td></tr><tr><td>8</td><td>」-(Φ&lt;-Φ)</td><td>-i1-7</td></tr><tr><td>9</td><td>v-Φ</td><td>-je 8</td></tr></table>

Example 1.24 Using LEM, we show that $p \to q \vdash \lnot p \lor q$ is valid:

<table><tr><td>1 2</td><td>p→q -pvp</td><td>premise LEM</td></tr><tr><td>3</td><td rowspan="3">-p</td><td rowspan="3">assumption</td></tr><tr><td></td></tr><tr><td>4 -pVqVi13</td></tr><tr><td>5</td><td>p assumption</td><td rowspan="3"></td></tr><tr><td>6</td><td>→e 1,5 q</td></tr><tr><td>7</td><td>-pVq Vi26</td></tr><tr><td colspan="2">8 -pvq</td><td>Ve 2,3-4,5-7</td></tr></table>

It can be difficult to decide which instance of LEM would benefit the progress of a proof. Can you re-do the example above with $q \lor \lnot q$ as LEM?

# 1.2.3 Natural deduction in summary

The proof rules for natural deduction are summarised in Figure 1.2. The explanation of the rules we have given so far in this chapter is declarative; we have presented each rule and justified it in terms of our intuition about the logical connectives. However, when you try to use the rules yourself, you’ll find yourself looking for a more procedural interpretation; what does a rule do and how do you use it? For example,

� ∧i says: to prove $\phi \wedge \psi$ , you must first prove $\phi$ and $\psi$ separately and then use the rule i. $\wedge \mathrm { e } _ { 1 }$ says: to prove $\phi$ , try proving $\phi \wedge \psi$ and then use the rule $\wedge \mathrm { e } _ { 1 }$ . Actually, this doesn’t sound like very good advice because probably proving $\phi \wedge \psi$ will be harder than proving $\phi$ alone. However, you might find that you already have $\phi \wedge \psi$ lying around, so that’s when this rule is useful. Compare this with the example sequent in Example 1.15. $\vee \mathrm { i } _ { 1 }$ says: to prove $\phi \lor \psi$ , try proving $\phi$ . Again, in general it is harder to prove $\phi$ than it is to prove $\phi \lor \psi$ , so this will usually be useful only if you’ve already managed to prove $\phi$ . For example, if you want to prove $q \vdash p \lor q$ , you certainly won’t be able simply to use the rule $\vee \mathrm { i } _ { 1 }$ , but $\vee \mathtt { i } _ { 2 }$ will work. ∨e has an excellent procedural interpretation. It says: if you have $\phi \lor \psi$ , and you want to prove some $\chi$ , then try to prove $\chi$ from $\phi$ and from $\psi$ in turn. (In those subproofs, of course you can use the other prevailing premises as well.)   
� Similarly, →i says, if you want to prove $\phi  \psi$ , try proving $\psi$ from $\phi$ (and the other prevailing premises).   
� ¬i says: to prove $\lnot \phi$ , prove $\perp$ from $\phi$ (and the other prevailing premises).

The basic rules of natural deduction:

<table><tr><td></td><td>introduction</td><td colspan="2">elimination</td></tr><tr><td>&gt;</td><td>Ai Vi2</td><td>&gt; &gt;e1 .</td><td>&gt; 2 4 Ve</td></tr><tr><td>V</td><td>? 4 Vi1 v v ? ：</td><td></td><td>X X X →</td></tr><tr><td></td><td>山 → →i ?</td><td></td><td>→e 2</td></tr><tr><td></td><td>-i - (no introduction rule for ⊥)</td><td></td><td>-e 上</td></tr><tr><td>上</td><td rowspan="2"></td><td rowspan="2"></td><td>⊥ ? Le</td></tr><tr><td></td></tr><tr><td></td><td rowspan="2"></td><td rowspan="2">-- -e ?</td></tr><tr><td></td></tr></table>

Some useful derived rules:

![](images/b70b4f3824d98001edeaa0a2b7b69025a43f010cb3574a1dbd80c17bab0b1c51.jpg)  
Figure 1.2. Natural deduction rules for propositional logic.

At any stage of a proof, it is permitted to introduce any formula as assumption, by choosing a proof rule that opens a box. As we saw, natural deduction employs boxes to control the scope of assumptions. When an assumption is introduced, a box is opened. Discharging assumptions is achieved by closing a box according to the pattern of its particular proof rule. It’s useful to make assumptions by opening boxes. But don’t forget you have to close them in the manner prescribed by their proof rule.

OK, but how do we actually go about constructing a proof? Given a sequent, you write its premises at the top of your page and its conclusion at the bottom. Now, you’re trying to fill in the gap, which involves working simultaneously on the premises (to bring them towards the conclusion) and on the conclusion (to massage it towards the premises).

Look first at the conclusion. If it is of the form $\phi  \psi$ , then apply $_ 6$ the rule $\longrightarrow$ i. This means drawing a box with $\phi$ at the top and $\psi$ at the bottom. So your proof, which started out like this:

$$
\phi  \psi
$$

now looks like this:

![](images/baf0b12da1af7e6992125de0297b75a8747310cb46bd9a27995ec247ce0ec72c.jpg)

You still have to find a way of filling in the gap between the $\phi$ and the $\psi$ . But you now have an extra formula to work with and you have simplified the conclusion you are trying to reach.

The proof rule ¬i is very similar to $ \mathrm { i }$ and has the same beneficial effect on your proof attempt. It gives you an extra premise to work with and simplifies your conclusion.

At any stage of a proof, several rules are likely to be applicable. Before applying any of them, list the applicable ones and think about which one is likely to improve the situation for your proof. You’ll find that →i and ¬i most often improve it, so always use them whenever you can. There is no easy recipe for when to use the other rules; often you have to make judicious choices.

# 1.2.4 Provable equivalence

Definition 1.25 Let $\phi$ and $\psi$ be formulas of propositional logic. We say that $\phi$ and $\psi$ are provably equivalent iff (we write ‘iff’ for ‘if, and only if’ in the sequel) the sequents $\phi \vdash \psi$ and $\psi \vdash \phi$ are valid; that is, there is a proof of $\psi$ from $\phi$ and another one going the other way around. As seen earlier, we denote that $\phi$ and $\psi$ are provably equivalent by $\phi \mathrel { - } \Vdash \psi$ .

Note that, by Remark 1.12, we could just as well have defined $\phi \mathrel { - } \Vdash \psi$ to mean that the sequent $\vdash ( \phi  \psi ) \land ( \psi  \phi )$ is valid; it defines the same concept. Examples of provably equivalent formulas are

$$
\begin{array} { r l } & { \neg ( p \wedge q ) \dashv \Vdash \neg q \lor \neg p \quad \neg ( p \lor q ) \to \emptyset \to q \land \neg p } \\ & { p \to q \to \neg q \to \neg p \quad p \to q \to \neg p \lor q } \\ & { p \land q \to p \to \downarrow - r \lor \neg r \quad p \land q \to r \ H \to p \to ( q \to r ) . } \end{array}
$$

The reader should prove all of these six equivalences in natural deduction.

# 1.2.5 An aside: proof by contradiction

Sometimes we can’t prove something directly in the sense of taking apart given assumptions and reasoning with their constituents in a constructive way. Indeed, the proof system of natural deduction, summarised in Figure 1.2, specifically allows for indirect proofs that lack a constructive quality: for example, the rule

![](images/7df61075f3df07dc56f3cdb427eed3203602a391fd644c0ab2d979ce2da5a5eb.jpg)

allows us to prove $\phi$ by showing that $\lnot \phi$ leads to a contradiction. Although ‘classical logicians’ argue that this is valid, logicians of another kind, called ‘intuitionistic logicians,’ argue that to prove $\phi$ you should do it directly, rather than by arguing merely that $\lnot \phi$ is impossible. The two other rules on which classical and intuitionistic logicians disagree are

$$
\frac { \cos \theta } { \phi \lor \neg \phi } \quad \mathrm { L E M } \qquad \frac { \neg \neg \phi } { \phi } \neg \neg \mathrm { e . }
$$

Intuitionistic logicians argue that, to show $\phi \lor \neg \phi$ , you have to show $\phi$ , or $\lnot \phi$ . If neither of these can be shown, then the putative truth of the disjunction has no justification. Intuitionists reject $\neg \neg \mathrm { e }$ since we have already used this rule to prove LEM and PBC from rules which the intuitionists do accept. In the exercises, you are asked to show why the intuitionists also reject PBC.

Let us look at a proof that shows up this difference, involving real numbers. Real numbers are floating point numbers like 23.54721, only some of them might actually be infinitely long such as 23.138592748500123950734 . . ., with no periodic behaviour after the decimal point.

Given a positive real number $a$ and a natural (whole) number $b$ , we can calculate $a ^ { b }$ : it is just $a$ times itself, $b$ times, so $2 ^ { 2 } = 2 \cdot 2 = 4$ , $2 ^ { 3 } = 2 \cdot 2 \cdot 2 =$ 8 and so on. When $b$ is a real number, we can also define $a ^ { b }$ , as follows. We say that $a ^ { 0 } \ { \stackrel { \mathrm { d e f } } { = } } \ 1$ and, for a non-zero rational number $k / n$ , where $n \neq 0$ , we let $a ^ { k / n } \ { \stackrel { \mathrm { d e f } } { = } } \ { \sqrt [ n ] { a ^ { k } } }$ where $\sqrt [ n ] { x }$ is the real number $y$ such that $y ^ { n } = x$ . From real analysis one knows that any real number $b$ can be approximated by a sequence of rational numbers $k _ { 0 } / n _ { 0 }$ , $k _ { 1 } / n _ { 1 }$ , . . . Then we define $a ^ { b }$ to be the real number approximated by the sequence $a ^ { k _ { 0 } / n _ { 0 } }$ , $a ^ { k _ { 1 } / n _ { 1 } }$ , . . . (In calculus, one can show that this ‘limit’ $a ^ { b }$ is unique and independent of the choice of approximating sequence.) Also, one calls a real number irrational if it can’t be written in the form $k / n$ for some integers $k$ and $n \neq 0$ . In the exercises you will be asked to find a semi-formal proof showing that $\sqrt { 2 }$ is irrational.

We now present a proof of a fact about real numbers in the informal style used by mathematicians (this proof can be formalised as a natural deduction proof in the logic presented in Chapter 2). The fact we prove is:

Theorem 1.26 There exist irrational numbers a and b such that $a ^ { b }$ is rational.

Proof: We choose $b$ to be $\sqrt { 2 }$ and proceed by a case analysis. Either $b ^ { b }$ is irrational, or it is not. (Thus, our proof uses ∨e on an instance of LEM.)

(i) Assume that $b ^ { b }$ is rational. Then this proof is easy since we can choose irrational numbers $a$ and $b$ to be $\sqrt { 2 }$ and see that $a ^ { b }$ is just $b ^ { b }$ which was assumed to be rational.   
(ii) Assume that $b ^ { b }$ is ir rational. Then we change our strategy slightly and choose $a$ to be ${ \sqrt { 2 } } ^ { \sqrt { 2 } }$ . Clearly, $a$ is irrational by the assumption of case (ii). But we know that $b$ is irrational (this was known by the ancient Greeks; see the proof outline in the exercises). So $a$ and $b$ are both irrational numbers and

$$
a ^ { b } = \left( { \sqrt { 2 } } ^ { \sqrt { 2 } } \right) ^ { \sqrt { 2 } } = { \sqrt { 2 } } ^ { \left( { \sqrt { 2 } } \cdot { \sqrt { 2 } } \right) } = \left( { \sqrt { 2 } } \right) ^ { 2 } = 2
$$

is rational, where we used the law $( x ^ { y } ) ^ { z } = x ^ { ( y \cdot z ) }$ .

Since the two cases above are exhaustive (either $b ^ { b }$ is irrational, or it isn’t) we have proven the theorem. ✷

This proof is perfectly legitimate and mathematicians use arguments like that all the time. The exhaustive nature of the case analysis above rests on the use of the rule LEM, which we use to prove that either $b$ is rational or it is not. Yet, there is something puzzling about it. Surely, we have secured the fact that there are irrational numbers $a$ and $b$ such that $a ^ { b }$ is rational, but are we in a position to specify an actual pair of such numbers satisfying this theorem? More precisely, which of the pairs $( a , b )$ above fulfils the assertion of the theorem, the pair $( { \sqrt { 2 } } , { \sqrt { 2 } } )$ , or the pair $( { \sqrt { 2 } } { \sqrt { 2 } } , { \sqrt { 2 } } ) \}$ ? Our proof tells us nothing about which of them is the right choice; it just says that at least one of them works.

Thus, the intuitionists favour a calculus containing the introduction and elimination rules shown in Figure 1.2 and excluding the rule $\neg \neg \mathrm { e }$ and the derived rules. Intuitionistic logic turns out to have some specialised applications in computer science, such as modelling type-inference systems used in compilers or the staged execution of program code; but in this text we stick to the full so-called classical logic which includes all the rules.

# 1.3 Propositional logic as a formal language

In the previous section we learned about propositional atoms and how they can be used to build more complex logical formulas. We were deliberately informal about that, for our main focus was on trying to understand the precise mechanics of the natural deduction rules. However, it should have been clear that the rules we stated are valid for any formulas we can form, as long as they match the pattern required by the respective rule. For example, the application of the proof rule $ \mathrm { e }$ in

$$
{ \begin{array} { l l l l } { 1 } & { } & { } & { p \to q } & { { \mathrm { p r e m i s e } } } \\ { 2 } & { } & { } & { p } & { { \mathrm { p r e m i s e } } } \\ { 3 } & { } & { } & { q } & { } & { \to { \mathrm { e } } 1 , 2 } \end{array} }
$$

is equally valid if we substitute $p$ with $p \vee \neg r$ and $q$ with $r \longrightarrow p$

$$
{ \begin{array} { l l l l } { 1 } & { } & { \qquad p \lor \lnot r \to ( r \to p ) } & { { \mathrm { p r e m i s e } } } \\ { 2 } & { } & { } & { \qquad p \lor \lnot r } \\ { 3 } & { } & { } & { \qquad r \to p } & { \lnot { \mathrm { e l } } , 2 } \end{array} }
$$

This is why we expressed such rules as schemes with Greek symbols standing for generic formulas. Yet, it is time that we make precise the notion of ‘any formula we may form.’ Because this text concerns various logics, we will introduce in (1.3) an easy formalism for specifying well-formed formulas. In general, we need an unbounded supply of propositional atoms $p , q , r , \ldots$ , or $p _ { 1 } , p _ { 2 } , p _ { 3 } , . . .$ You should not be too worried about the need for infinitely many such symbols. Although we may only need finitely many of these propositions to describe a property of a computer program successfully, we cannot specify how many such atomic propositions we will need in any concrete situation, so having infinitely many symbols at our disposal is a cheap way out. This can be compared with the potentially infinite nature of English: the number of grammatically correct English sentences is infinite, but finitely many such sentences will do in whatever situation you might be in (writing a book, attending a lecture, listening to the radio, having a dinner date, . . . ).

Formulas in our propositional logic should certainly be strings over the alphabet $\{ p , q , r , \dots \} \cup \{ p _ { 1 } , p _ { 2 } , p _ { 3 } , \dots \} \cup \{ \neg , \land , \lor , \dots , ( , ) \}$ . This is a trivial observation and as such is not good enough for what we are trying to capture. For example, the string $( \neg ) ( ) \lor p q $ is a word over that alphabet, yet, it does not seem to make a lot of sense as far as propositional logic is concerned. So what we have to define are those strings which we want to call formulas. We call such formulas well-formed.

Definition 1.27 The well-formed formulas of propositional logic are those which we obtain by using the construction rules below, and only those, finitely many times:

atom: Every propositional atom $p , q , r , \ldots$ and $p _ { 1 } , p _ { 2 } , p _ { 3 } , . . .$ is a wellformed formula.

$\neg :$ If $\phi$ is a well-formed formula, then so is $\left( \lnot \phi \right)$ .   
∧: If $\phi$ and $\psi$ are well-formed formulas, then so is $( \phi \land \psi )$ .   
∨: If $\phi$ and $\psi$ are well-formed formulas, then so is $( \phi \lor \psi )$ .   
$\longrightarrow$ : If $\phi$ and $\psi$ are well-formed formulas, then so is $( \phi  \psi )$ ).

It is most crucial to realize that this definition is the one a computer would expect and that we did not make use of the binding priorities agreed upon in the previous section.

Convention. In this section we act as if we are a rigorous computer and we call formulas well-formed iff they can be deduced to be so using the definition above.

Further, note that the condition ‘and only those’ in the definition above rules out the possibility of any other means of establishing that formulas are well-formed. Inductive definitions, like the one of well-formed propositional logic formulas above, are so frequent that they are often given by a defining grammar in Backus Naur form (BNF). In that form, the above definition reads more compactly as

$$
\phi : : = p \mid ( \neg \phi ) \mid ( \phi \land \phi ) \mid ( \phi \lor \phi ) \mid ( \phi \to \phi )
$$

where $p$ stands for any atomic proposition and each occurrence of $\phi$ to the right of :: $: =$ stands for any already constructed formula.

So how can we show that a string is a well-formed formula? For example, how do we answer this for $\phi$ being

$$
( ( ( \neg p ) \land q ) \to ( p \land ( q \lor ( \neg r ) ) ) ) \ ?
$$

Such reasoning is greatly facilitated by the fact that the grammar in (1.3) satisfies the inversion principle, which means that we can invert the process of building formulas: although the grammar rules allow for five different ways of constructing more complex formulas – the five clauses in (1.3) – there is always a unique clause which was used last. For the formula above, this last operation was an application of the fifth clause, for $\phi$ is an implication with the assumption $( ( \neg p ) \land q )$ and conclusion $( p \land ( q \lor ( \neg r ) ) )$ ). By applying the inversion principle to the assumption, we see that it is a conjunction of $( \neg p )$ and $q$ . The former has been constructed using the second clause and is well-formed since $p$ is well-formed by the first clause in (1.3). The latter is well-formed for the same reason. Similarly, we can apply the inversion principle to the conclusion $( p \land ( q \lor ( \neg r ) ) )$ , inferring that it is indeed wellformed. In summary, the formula in (1.4) is well-formed.

![](images/3eef0cade066d51b77f729dfb2e191159f0ed590b3d30d977ba44fa7b5116bf4.jpg)  
Figure 1.3. A parse tree representing a well-formed formula.

For us humans, dealing with brackets is a tedious task. The reason we need them is that formulas really have a tree-like structure, although we prefer to represent them in a linear way. In Figure 1.3 you can see the parse tree7 of the well-formed formula $\phi$ in (1.4). Note how brackets become unnecessary in this parse tree since the paths and the branching structure of this tree remove any possible ambiguity in interpreting $\phi$ . In representing $\phi$ as a linear string, the branching structure of the tree is retained by the insertion of brackets as done in the definition of well-formed formulas.

So how would you go about showing that a string of symbols $\psi$ is not wellformed? At first sight, this is a bit trickier since we somehow have to make sure that $\psi$ could not have been obtained by any sequence of construction rules. Let us look at the formula $( \neg ) ( ) \lor p q $ from above. We can decide this matter by being very observant. The string $( \neg ) ( ) \lor p q \to \mathrm { c o n t a i n s } \neg )$ and $\neg$ cannot be the rightmost symbol of a well-formed formula (check all the rules to verify this claim!); but the only time we can put a ‘)’ to the right of something is if that something is a well-formed formula (again, check all the rules to see that this is so). Thus, $( \neg ) ( ) \lor p q $ is not well-formed.

Probably the easiest way to verify whether some formula $\phi$ is well-formed is by trying to draw its parse tree. In this way, you can verify that the formula in (1.4) is well-formed. In Figure 1.3 we see that its parse tree has → as its root, expressing that the formula is, at its top level, an implication. Using the grammar clause for implication, it suffices to show that the left and right subtrees of this root node are well-formed. That is, we proceed in a top-down fashion and, in this case, successfully. Note that the parse trees of well-formed formulas have either an atom as root (and then this is all there is in the tree), or the root contains $\neg$ , , $\wedge$ or $\longrightarrow$ . In the case of $\neg$ there is only one subtree coming out of the root. In the cases $\wedge$ , ∨ or $\longrightarrow$ we must have two subtrees, each of which must behave as just described; this is another example of an inductive definition.

Thinking in terms of trees will help you understand standard notions in logic, for example, the concept of a subformula. Given the well-formed formula $\phi$ above, its subformulas are just the ones that correspond to the subtrees of its parse tree in Figure 1.3. So we can list all its leaves $p$ , $q$ (occurring twice), and $r$ , then $( \neg p )$ and $( ( \neg p ) \land q )$ on the left subtree of $\longrightarrow$ and $( \neg r )$ , $( q \lor ( \neg r ) )$ and ( $( p \land ( q \lor ( \neg p ) ) ) \rangle$ ) on the right subtree of $\longrightarrow$ . The whole tree is a subtree of itself as well. So we can list all nine subformulas of $\phi$ as

$$
\begin{array} { r l } & { p } \\ & { q } \\ & { r } \\ & { ( - p ) } \\ & { ( ( - p ) \wedge q ) } \\ & { ( - r ) } \\ & { ( q \vee ( - r ) ) } \\ & { ( ( p \wedge ( q \vee ( - r ) ) ) ) } \\ & { ( ( ( - p ) \wedge q )  ( p \wedge ( q \vee ( - r ) ) ) ) . } \end{array}
$$

Let us consider the tree in Figure 1.4. Why does it represent a well-formed formula? All its leaves are propositional atoms ( $p$ twice, $q$ and $r$ ), all branching nodes are logical connectives (¬ twice, ∧, ∨ and $\longrightarrow$ ) and the numbers of subtrees are correct in all those cases (one subtree for a ¬ node and two subtrees for all other non-leaf nodes). How do we obtain the linear representation of this formula? If we ignore brackets, then we are seeking nothing but the in-order representation of this tree as a list8. The resulting well-formed formula is ( $( \neg ( p \lor ( q \neg p ( \neg p ) ) ) ) \land r )$ .

![](images/5f3a4cbbd3ffc0ead37d9722a6e9a12e5339c83ffcf6c99fd593bfaee86090bf.jpg)  
Figure 1.4. Given: a tree; wanted: its linear representation as a logical formula.

The tree in Figure 1.21 on page 82, however, does not represent a wellformed formula for two reasons. First, the leaf $\wedge$ (and a similar argument applies to the leaf $\neg$ ), the left subtree of the node $\longrightarrow$ , is not a propositional atom. This could be fixed by saying that we decided to leave the left and right subtree of that node unspecified and that we are willing to provide those now. However, the second reason is fatal. The $p$ node is not a leaf since it has a subtree, the node $\neg$ . This cannot make sense if we think of the entire tree as some logical formula. So this tree does not represent a well-formed logical formula.

# 1.4 Semantics of propositional logic

# 1.4.1 The meaning of logical connectives

In the second section of this chapter, we developed a calculus of reasoning which could verify that sequents of the form $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ are valid, which means: from the premises $\phi _ { 1 }$ , $\phi _ { 2 }$ , . . . , $\phi _ { n }$ , we may conclude $\psi$ .

In this section we give another account of this relationship between the premises $\phi _ { 1 }$ , $\phi _ { 2 }$ , . . . , $\phi _ { n }$ and the conclusion $\psi$ . To contrast with the sequent

above, we define a new relationship, written

$$
\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi .
$$

This account is based on looking at the ‘truth values’ of the atomic formulas in the premises and the conclusion; and at how the logical connectives manipulate these truth values. What is the truth value of a declarative sentence, like sentence (3) ‘Every even natural number $> 2$ is the sum of two prime numbers’ ? Well, declarative sentences express a fact about the real world, the physical world we live in, or more abstract ones such as computer models, or our thoughts and feelings. Such factual statements either match reality (they are true), or they don’t (they are false).

If we combine declarative sentences $p$ and $q$ with a logical connective, say $\wedge$ , then the truth value of $p \wedge q$ is determined by three things: the truth value of $p$ , the truth value of $q$ and the meaning of $\wedge$ . The meaning of $\wedge$ is captured by the observation that $p \wedge q$ is true iff $p$ and $q$ are both true; otherwise $p \wedge q$ is false. Thus, as far as $\wedge$ is concerned, it needs only to know whether $p$ and $q$ are true, it does not need to know what $p$ and $q$ are actually saying about the world out there. This is also the case for all the other logical connectives and is the reason why we can compute the truth value of a formula just by knowing the truth values of the atomic propositions occurring in it.

Definition 1.28 1. The set of truth values contains two elements T and $\mathbf { F }$ , where T represents ‘true’ and F represents ‘false’.   
2. A valuation or model of a formula $\phi$ is an assignment of each propositional atom in $\phi$ to a truth value.

Example 1.29 The map which assigns T to $q$ and $\mathbf { F }$ to $p$ is a valuation for $p \vee \neg q$ . Please list the remaining three valuations for this formula.

We can think of the meaning of $\wedge$ as a function of two arguments; each argument is a truth value and the result is again such a truth value. We specify this function in a table, called the truth table for conjunction, which you can see in Figure 1.5. In the first column, labelled $\phi$ , we list all possible

$$
\begin{array} { r l } & { \frac { \phi ~ \middle | ~ \psi ~ \middle | ~ \phi ~ \land ~ \psi ~ } { \mathrm {  ~ \hat { T } ~ \unboldmath } } ~ \mathrm {  ~ \hat { T } ~ \unboldmath } } \\ & { \mathrm {  ~ \hat { T } ~ \unboldmath } ~ \mathrm {  ~ \hat { F } ~ \unboldmath } } \\ & { \mathrm { \textbf { F } ~ \unboldmath } ~ \mathrm {  ~ \hat { T } ~ \unboldmath } ~ \mathrm {  ~ \hat { F } ~ \unboldmath } } \\ & { \mathrm { \textbf { F } ~ \unboldmath } ~ \mathrm {  ~ \hat { F } ~ \unboldmath } ~ \mathrm {  ~ \hat { F } ~ \unboldmath } } \end{array}
$$

![](images/f986f1238754731adf8bfcfbc99d0c45bce4c7d5cf108f328f5478355dbc8c2d.jpg)  
Figure 1.6. The truth tables for all the logical connectives discussed so far.

truth values of $\phi$ . Actually we list them twice since we also have to deal with another formula $\psi$ , so the possible number of combinations of truth values for $\phi$ and $\psi$ equals $2 \cdot 2 = 4$ . Notice that the four pairs of $\phi$ and $\psi$ values in the first two columns really exhaust all those possibilities (TT, TF, FT and FF). In the third column, we list the result of $\phi \wedge \psi$ according to the truth values of $\phi$ and $\psi$ . So in the first line, where $\phi$ and $\psi$ have value T, the result is $\mathrm { T }$ again. In all other lines, the result is $\mathtt { F }$ since at least one of the propositions $\phi$ or $\psi$ has value $\mathtt { F }$ .

In Figure 1.6 you find the truth tables for all logical connectives of propositional logic. Note that $\neg$ turns T into $\mathtt { F }$ and vice versa. Disjunction is the mirror image of conjunction if we swap $\mathrm { T }$ and F, namely, a disjunction returns F iff both arguments are equal to F, otherwise (= at least one of the arguments equals T) it returns T. The behaviour of implication is not quite as intuitive. Think of the meaning of $\longrightarrow$ as checking whether truth is being preserved. Clearly, this is not the case when we have $\mathrm { T } \longrightarrow \mathrm { F }$ , since we infer something that is false from something that is true. So the second entry in the column $\phi  \psi$ equals F. On the other hand, $\mathrm { T } \longrightarrow \mathrm { T }$ obviously preserves truth, but so do the cases $\mathbf F \longrightarrow \mathrm T$ and $\mathbb { F } \longrightarrow \mathbb { F }$ , because there is no truth to be preserved in the first place as the assumption of the implication is false.

If you feel slightly uncomfortable with the semantics ( $=$ the meaning) of $\longrightarrow$ , then it might be good to think of $\phi  \psi$ as an abbreviation of the formula $\neg \phi \lor \psi$ as far as meaning is concerned; these two formulas are very different syntactically and natural deduction treats them differently as well. But using the truth tables for $\neg$ and ∨ you can check that $\phi  \psi$ evaluates to T iff $\neg \phi \lor \psi$ does so. This means that $\phi  \psi$ and $\neg \phi \lor \psi$ are semantically equivalent; more on that in Section 1.5.

Given a formula $\phi$ which contains the propositional atoms $p 1 , p 2 , \ldots , p _ { n }$ , we can construct a truth table for $\phi$ , at least in principle. The caveat is that this truth table has $2 ^ { n }$ many lines, each line listing a possible combination of truth values for $p 1 , p 2 , \ldots , p _ { n }$ ; and for large $n$ this task is impossible to complete. Our aim is thus to compute the value of $\phi$ for each of these $2 ^ { \pi }$ cases for moderately small values of $n$ . Let us consider the example $\phi$ in Figure 1.3. It involves three propositional atoms ( $n = 3$ ) so we have $2 ^ { 3 } = 8$ cases to consider.

We illustrate how things go for one particular case, namely for the valuation in which $q$ evaluates to F; and $p$ and $r$ evaluate to T. What does $\neg p \land q \to p \land ( q \lor \neg r )$ evaluate to? Well, the beauty of our semantics is that it is compositional. If we know the meaning of the subformulas $\neg p \land q$ and $p \wedge ( q \vee \neg r )$ , then we just have to look up the appropriate line of the $\longrightarrow$ truth table to find the value of $\phi$ , for $\phi$ is an implication of these two subformulas. Therefore, we can do the calculation by traversing the parse tree of $\phi$ in a bottom-up fashion. We know what its leaves evaluate to since we stated what the atoms $p$ , $q$ and $r$ evaluated to. Because the meaning of $p$ is T, we see that $\neg p$ computes to F. Now $q$ is assumed to represent $\mathtt { F }$ and the conjunction of $\mathtt { F }$ and $\mathtt { F }$ is F. Thus, the left subtree of the node $\longrightarrow$ evaluates to F. As for the right subtree of $\longrightarrow$ , $r$ stands for T so $\neg r$ computes to $\mathtt { F }$ and $q$ means F, so the disjunction of $\mathtt { F }$ and $\mathbf { F }$ is still F. We have to take that result, F, and compute its conjunction with the meaning of $p$ which is T. Since the conjunction of T and $\mathtt { F }$ is $\mathbf { F }$ , we get $\mathtt { F }$ as the meaning of the right subtree of $\longrightarrow$ . Finally, to evaluate the meaning of $\phi$ , we compute $\mathbb { F } \longrightarrow \mathbb { F }$ which is T. Figure 1.7 shows how the truth values propagate upwards to reach the root whose associated truth value is the truth value of $\phi$ given the meanings of $p$ , $q$ and $r$ above.

It should now be quite clear how to build a truth table for more complex formulas. Figure 1.8 contains a truth table for the formula $( p \to \lnot q ) \to$ $( q \lor \neg p )$ . To be more precise, the first two columns list all possible combinations of values for $p$ and $q$ . The next two columns compute the corresponding values for $\neg p$ and $\neg q$ . Using these four columns, we may compute the column for $p \to \neg q$ and $q \lor \lnot p$ . To do so we think of the first and fourth columns as the data for the $\longrightarrow$ truth table and compute the column of $p \to \neg q$ accordingly. For example, in the first line $p$ is $\mathrm { T }$ and $\neg q$ is $\mathbf { F }$ so the entry for $p \to \neg q$ is $\mathbf { T } \longrightarrow \mathbf { F } = \mathbf { F }$ by definition of the meaning of $\longrightarrow$ . In this fashion, we can fill out the rest of the fifth column. Column 6 works similarly, only we now need to look up the truth table for ∨ with columns 2 and 3 as input.

![](images/bfff9968a82d564feab85734736194ef3b863e371a2230eb7b389605898f2f49.jpg)  
Figure 1.7. The evaluation of a logical formula under a given valuation.   
Figure 1.8. An example of a truth table for a more complex logical formula.

$$
{ \begin{array} { l l } { \underbrace { p \ | \ q \ | \ \neg p \ | \ \neg q \ | \ p  \neg q \ | \ q \ \lor \neg p \ | \ ( p  \neg q )  ( q \lor \neg p ) } _ { \mathrm { T } } \ } & { } \\ { \mathrm { T } \ | \ \textrm { F } \ | \ \textrm { F } } & { \mathbf { F } \ } & { \mathbf { F } \ } & { \mathbf { T } \ } \\ { \ \mathbf { F } \ } & { \mathbf { T } \ } & { \mathbf { F } \ } & { \mathbf { T } \ } \\ { \mathbf { F } \ } & { \mathbf { T } \ } & { \mathbf { T } \ } & { \ \qquad \mathrm { T } \ } & { \mathbf { T } \ } \\ { \mathbf { F } \ } & { \mathbf { T } \ } & { \mathbf { T } \ } & { \ \qquad \mathrm { T } \ } & { \qquad \mathrm { T } } \end{array} }
$$

Finally, column 7 results from applying the truth table o $\dot { \cdot }  \mathrm { t o }$ columns 5 and 6.

# 1.4.2 Mathematical induction

Here is a little anecdote about the German mathematician Gauss who, as a pupil at age 8, did not pay attention in class (can you imagine?), with the result that his teacher made him sum up all natural numbers from 1 to 100. The story has it that Gauss came up with the correct answer 5050 within seconds, which infuriated his teacher. How did Gauss do it? Well, possibly he knew that

$$
1 + 2 + 3 + 4 + \cdots + n = { \frac { n \cdot ( n + 1 ) } { 2 } }
$$

for all natural numbers $n$ . 9 Thus, taking $n = 1 0 0$ , Gauss could easily calculate:

$$
1 + 2 + 3 + 4 + \cdots + 1 0 0 = { \frac { 1 0 0 \cdot 1 0 1 } { 2 } } = 5 0 5 0 .
$$

Mathematical induction allows us to prove equations, such as the one in (1.5), for arbitrary $n$ . More generally, it allows us to show that every natural number satisfies a certain property. Suppose we have a property $M$ which we think is true of all natural numbers. We write $M ( 5 )$ to say that the property is true of 5, etc. Suppose that we know the following two things about the property $M$ :

1. Base case: The natural number 1 has property $M$ , i.e. we have a proof of $M ( 1 )$ .   
2. Inductive step: If $n$ is a natural number which we assume to have property $M ( n )$ , then we can show that $n + 1$ has property $M ( n + 1 )$ ; i.e. we have a proof of $M ( n ) \to M ( n + 1 )$ .

Definition 1.30 The principle of mathematical induction says that, on the grounds of these two pieces of information above, every natural number $n$ has property $M ( n )$ . The assumption of $M ( n )$ in the inductive step is called the induction hypothesis.

Why does this principle make sense? Well, take any natural number $k$ . If $k$ equals 1, then $k$ has property $M ( 1 )$ using the base case and so we are done. Otherwise, we can use the inductive step, applied to $n = 1$ , to infer that $2 = 1 + 1$ has property $M ( 2 )$ . We can do that using →e, for we know that 1 has the property in question. Now we use that same inductive step on $n = 2$ to infer that 3 has property $M ( 3 )$ and we repeat this until we reach $n = k$ (see Figure 1.9). Therefore, we should have no objections about using the principle of mathematical induction for natural numbers.

Returning to Gauss’ example we claim that the sum $1 + 2 + 3 + 4 + \cdot \cdot +$ $n$ equals $n \cdot ( n + 1 ) / 2$ for all natural numbers $n$ .

Theorem 1.31 The sum $1 + 2 + 3 + 4 + \cdot \cdot + n$ equals $n \cdot ( n + 1 ) / 2$ for all natural numbers $n$ .

![](images/89687685c8f50313730b454dac375d30dc679f13f2ba4027112d4b7f1bda6800.jpg)  
Figure 1.9. How the principle of mathematical induction works. By proving just two facts, $M ( 1 )$ and $M ( n ) \to M ( n + 1 )$ for a formal (and unconstrained) parameter $n _ { \iota }$ , we are able to deduce $M ( k )$ for each natural number $k$ .

Proof: We use mathematical induction. In order to reveal the fine structure of our proof we write $\mathrm { L H S } _ { n }$ for the expression $1 + 2 + 3 + 4 + \cdot \cdot + n$ and ${ \mathrm { R H S } } _ { n }$ for $n \cdot ( n + 1 ) / 2$ . Thus, we need to show $\mathrm { L H S } _ { n } = \mathrm { R H S } _ { n }$ for all $n \geq 1$ .

Base case: If $n$ equals 1, then $\mathrm { L H S _ { 1 } }$ is just 1 (there is only one summand), which happens to equal $\mathrm { R H S } _ { 1 } = 1 \cdot ( 1 + 1 ) / 2$ .

Inductive step: Let us assume that $\mathrm { L H S } _ { n } = \mathrm { R H S } _ { n }$ . Recall that this assumption is called the induction hypothesis; it is the driving force of our argument. We need to show $\mathrm { L H S } _ { n + 1 } = \mathrm { R H S } _ { n + 1 }$ , i.e. that the longer sum $1 + 2 + 3 + 4 + \cdots + ( n + 1 )$ equals $( n + 1 ) \cdot ( ( n + 1 ) + 1 ) / 2$ . The key observation is that the sum $1 + 2 + 3 + 4 + \cdots + ( n + 1 )$ is nothing but the sum $( 1 + 2 + 3 + 4 + \cdots + n ) + ( n + 1 )$ of two summands, where the first one is the sum of our induction hypothesis. The latter says that $1 + 2 + 3 + 4 + \cdot \cdot + n$ equals $n \cdot ( n + 1 ) / 2$ , and we are certainly entitled to substitute equals for equals in our reasoning. Thus, we compute

$$
\begin{array} { r l } { \small } & { \mathrm { L H S } _ { n + 1 } } \\ & { = 1 + 2 + 3 + 4 + \cdots + ( n + 1 ) } \\ & { = \mathrm { L H S } _ { n } + ( n + 1 ) \mathrm { r e g r o u p i n g ~ } } \end{array}
$$

$$
{ \begin{array} { r l } & { = { \mathrm { R H S } } _ { n } + ( n + 1 ) ~ { \mathrm { b y ~ o u r ~ i n d u } } } \\ & { = { \frac { n \cdot ( n + 1 ) } { 2 } } + ( n + 1 ) } \\ & { = { \frac { n \cdot ( n + 1 ) } { 2 } } + { \frac { 2 \cdot ( n + 1 ) } { 2 } } ~ { \mathrm { a r i t h m e t i c } } } \\ & { = { \frac { ( n + 2 ) \cdot ( n + 1 ) } { 2 } } ~ { \mathrm { a r i t h m e t i c } } } \\ & { = { \frac { ( ( n + 1 ) + 1 ) \cdot ( n + 1 ) } { 2 } } ~ { \mathrm { a r i t h m e t i c } } } \\ & { = { \mathrm { R H S } } _ { n + 1 } . } \end{array} }
$$

Since we successfully showed the base case and the inductive step, we can use mathematical induction to infer that all natural numbers $n$ have the property stated in the theorem above. ✷

Actually, there are numerous variations of this principle. For example, we can think of a version in which the base case is $n = 0$ , which would then cover all natural numbers including 0. Some statements hold only for all natural numbers, say, greater than 3. So you would have to deal with a base case 4, but keep the version of the inductive step (see the exercises for such an example). The use of mathematical induction typically suceeds on properties $M ( n )$ that involve inductive definitions (e.g. the definition of $k ^ { l }$ with $l \geq 0$ ). Sentence (3) on page 2 suggests there may be true properties $M ( n )$ for which mathematical induction won’t work.

Course-of-values induction. There is a variant of mathematical induction in which the induction hypothesis for proving $M ( n + 1 )$ is not just $M ( n )$ , but the conjunction $M ( 1 ) \wedge M ( 2 ) \wedge \cdots \wedge M ( n )$ . In that variant, called courseof-values induction, there doesn’t have to be an explicit base case at all – everything can be done in the inductive step.

How can this work without a base case? The answer is that the base case is implicitly included in the inductive step. Consider the case $n = 3$ : the inductive-step instance is $M ( 1 ) \land M ( 2 ) \land M ( 3 )  M ( 4 )$ . Now consider $n = 1$ : the inductive-step instance is $M ( 1 ) \longrightarrow M ( 2 )$ . What about the case when $n$ equals 0? In this case, there are zero formulas on the left of the $\longrightarrow$ , so we have to prove $M ( 1 )$ from nothing at all. The inductive-step instance is simply the obligation to show $M ( 1 )$ . You might find it useful to modify Figure 1.9 for course-of-values induction.

Having said that the base case is implicit in course-of-values induction, it frequently turns out that it still demands special attention when you get inside trying to prove the inductive case. We will see precisely this in the two applications of course-of-values induction in the following pages.

![](images/67a294f96bd07492e978a6f1b25e092629caddeb3a169625e67abdf3a47a0bf2.jpg)  
Figure 1.10. A parse tree with height 5.

In computer science, we often deal with finite structures of some kind, data structures, programs, files etc. Often we need to show that every instance of such a structure has a certain property. For example, the well-formed formulas of Definition 1.27 have the property that the number of ‘(’ brackets in a particular formula equals its number of ‘)’ brackets. We can use mathematical induction on the domain of natural numbers to prove this. In order to succeed, we somehow need to connect well-formed formulas to natural numbers.

Definition 1.32 Given a well-formed formula $\phi$ , we define its height to be 1 plus the length of the longest path of its parse tree.

For example, consider the well-formed formulas in Figures 1.3, 1.4 and 1.10. Their heights are 5, 6 and 5, respectively. In Figure 1.3, the longest path goes from $\longrightarrow$ to ∧ to ∨ to $\neg$ to $r$ , a path of length 4, so the height is $4 + 1 = 5$ . Note that the height of atoms is $1 + 0 = 1$ . Since every well-formed formula has finite height, we can show statements about all well-formed formulas by mathematical induction on their height. This trick is most often called structural induction, an important reasoning technique in computer science. Using the notion of the height of a parse tree, we realise that structural induction is just a special case of course-of-values induction.

Theorem 1.33 For every well-formed propositional logic formula, the number of left brackets is equal to the number of right brackets.

Proof: We proceed by course-of-values induction on the height of wellformed formulas $\phi$ . Let $M ( n )$ mean ‘All formulas of height $n$ have the same number of left and right brackets.’ We assume $M ( k )$ for each $k < n$ and try to prove $M ( n )$ . Take a formula $\phi$ of height $n$ .

� Base case: Then $n = 1$ . This means that $\phi$ is just a propositional atom. So there are no left or right brackets, 0 equals 0.   
. Course-of-values inductive step: Then $n > 1$ and so the root of the parse tree of $\phi$ must be $\neg$ , $\longrightarrow$ , or $\wedge$ , for $\phi$ is well-formed. We assume that it is $\longrightarrow$ , the other three cases are argued in a similar way. Then $\phi$ equals ( $\phi _ { 1 } \to \phi _ { 2 }$ ) for some wellformed formulas $\phi _ { 1 }$ and $\phi _ { 2 }$ (of course, they are just the left, respectively right, linear representations of the root’s two subtrees). It is clear that the heights of $\phi _ { 1 }$ and $\phi _ { 2 }$ are strictly smaller than $n$ . Using the induction hypothesis, we therefore conclude that $\phi _ { 1 }$ has the same number of left and right brackets and that the same is true for $\phi _ { 2 }$ . But in $( \phi _ { 1 } \to \phi _ { 2 }$ ) we added just two more brackets, one ‘(’ and one ‘)’. Thus, the number of occurrences of ‘(’ and ‘)’ in $\phi$ is the same. ✷

The formula ( $p \longrightarrow \left( q \land \neg r \right) )$ illustrates why we could not prove the above directly with mathematical induction on the height of formulas. While this formula has height 4, its two subtrees have heights 1 and 3, respectively. Thus, an induction hypothesis for height 3 would have worked for the right subtree but failed for the left subtree.

# 1.4.3 Soundness of propositional logic

The natural deduction rules make it possible for us to develop rigorous threads of argumentation, in the course of which we arrive at a conclusion $\psi$ assuming certain other propositions $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n }$ . In that case, we said that the sequent $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ is valid. Do we have any evidence that these rules are all correct in the sense that valid sequents all ‘preserve truth’ computed by our truth-table semantics?

Given a proof of $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ , is it conceivable that there is a valuation in which $\psi$ above is false although all propositions $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n }$ are true? Fortunately, this is not the case and in this subsection we demonstrate why this is so. Let us suppose that some proof in our natural deduction calculus has established that the sequent $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ is valid. We need to show: for all valuations in which all propositions $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n }$ evaluate to $\mathrm { T }$ , $\psi$ evaluates to T as well.

Definition 1.34 If, for all valuations in which all $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n }$ evaluate to T, $\psi$ evaluates to T as well, we say that

$$
\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi
$$

holds and call $\vDash$ the semantic entailment relation.

Let us look at some examples of this notion.

1. Does $p \wedge q \models p$ hold? Well, we have to inspect all assignments of truth values to $p$ and $q$ ; there are four of these. Whenever such an assignment computes $\mathrm { T }$ for $p \wedge q$ we need to make sure that $p$ is true as well. But $p \wedge q$ computes T only if $p$ and $q$ are true, so $p \wedge q \models p$ is indeed the case.

2. What about the relationship $p \lor q \vdash p$ ? There are three assignments for which $p \vee q$ computes $\mathrm { T }$ , so $p$ would have to be true for all of these. However, if we assign $\mathrm { T }$ to $q$ and $\mathbf { F }$ to $p$ , then $p \vee q$ computes $\mathrm { T }$ , but $p$ is false. Thus, $p \lor q \vdash p$ does not hold.

3. What if we modify the above to $\neg q , p \lor q \vdash p$ ? Notice that we have to be concerned only about valuations in which $\neg q$ and $p \vee q$ evaluate to T. This forces $q$ to be false, which in turn forces $p$ to be true. Hence $\neg q , p \lor q \vdash p$ is the case.

4. Note that $p \models q \lor \neg q$ holds, despite the fact that no atomic proposition on the right of $\vDash$ occurs on the left of $\vDash$ .

From the discussion above we realize that a soundness argument has to show: if $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ is valid, then $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ holds.

Theorem 1.35 (Soundness) Let $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n }$ and $\psi$ be propositional logic formulas. If $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ is valid, then $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ holds.

Proof: Since $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ is valid we know there is a proof of $\psi$ from the premises $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n }$ . We now do a pretty slick thing, namely, we reason by mathematical induction on the length of this proof ! The length of a proof is just the number of lines it involves. So let us be perfectly clear about what it is we mean to show. We intend to show the assertion $M ( k )$ :

‘For all sequents $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ $\left( n \geq 0 \right)$ ) which have a proof of length $k$ , it is the case that $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ holds.’

by course-of-values induction on the natural number $k$ . This idea requires some work, though. The sequent $p \wedge q \longrightarrow r \vdash p \longrightarrow ( q \longrightarrow r )$ has a proof

1 $p \land q  r$ premise

<table><tr><td>2</td><td>p</td><td>assumption</td></tr><tr><td>3</td><td>q</td><td>assumption</td></tr><tr><td>4</td><td>p&gt;q</td><td>Λi 2,3</td></tr><tr><td>5</td><td>r</td><td>→e 1,4</td></tr><tr><td>6</td><td>q→r</td><td>→i3-5</td></tr><tr><td>7</td><td>p→(q→r)</td><td>→i 2-6</td></tr></table>

but if we remove the last line or several of the last lines, we no longer have a proof as the outermost box does not get closed. We get a complete proof, though, by removing the last line and re-writing the assumption of the outermost box as a premise:

<table><tr><td colspan="2">1</td><td rowspan="2">p&gt;q→r </td><td rowspan="2">premise premise</td></tr><tr><td>2</td><td>p</td></tr><tr><td>3</td><td>q</td><td>assumption</td></tr><tr><td>4</td><td>p&gt;q</td><td>∧i 2,3</td></tr><tr><td>5</td><td>r</td><td>→e 1,4</td></tr><tr><td>6</td><td>q→r</td><td>→i3-5</td></tr></table>

This is a proof of the sequent $p \wedge q \to r$ , $p \vdash p \to r$ . The induction hypothesis then ensures that $p \wedge q \to r , ~ p \models p \to r$ holds. But then we can also reason that $p \wedge q \longrightarrow r \models p \longrightarrow ( q \longrightarrow r )$ holds as well – why?

Let’s proceed with our proof by induction. We assume $M ( k ^ { \prime } )$ for each $k ^ { \prime } < k$ and we try to prove $M ( k )$ .

Base case: a one-line proof. If the proof has length 1 ( $k = 1$ ), then it must be of the form

$$
\begin{array} { c c c c c c c c c c c c c c c c c c c c c c c } { { 1 } } & { { } } & { { } } & { { } } & { { } } & { { \phi } } & { { \mathrm { p r e m i s e } } } & { { } } & { { } } & { { } } & { { } } & { { } } & { { } } & { { } } \end{array}
$$

since all other rules involve more than one line. This is the case when $n = 1$ and $\phi _ { 1 }$ and $\psi$ equal $\phi$ , i.e. we are dealing with the sequent $\phi \vdash \phi$ . Of course, since $\phi$ evaluates to T so does $\phi$ . Thus, $\phi \models \phi$ holds as claimed.

Course-of-values inductive step: Let us assume that the proof of the sequent $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ has length $k$ and that the statement we want to prove is true for all numbers less than $k$ . Our proof has the following structure:

1 $\phi _ { 1 }$ premise   
2 $\phi _ { 2 }$ premise .. $n$ $\phi _ { n }$ premise .. $k$ $\psi$ justification

There are two things we don’t know at this point. First, what is happening in between those dots? Second, what was the last rule applied, i.e. what is the justification of the last line? The first uncertainty is of no concern; this is where mathematical induction demonstrates its power. The second lack of knowledge is where all the work sits. In this generality, there is simply no way of knowing which rule was applied last, so we need to consider all such rules in turn.

1. Let us suppose that this last rule is $\wedge \mathrm { i }$ . Then we know that $\psi$ is of the form $\psi _ { 1 } \wedge \psi _ { 2 }$ and the justification in line $k$ refers to two lines further up which have $\psi _ { 1 }$ , respectively $\psi _ { 2 }$ , as their conclusions. Suppose that these lines are $k _ { 1 }$ and $k _ { 2 }$ . Since $k _ { 1 }$ and $k _ { 2 }$ are smaller than $k$ , we see that there exist proofs of the sequents $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi _ { 1 }$ and $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi _ { 2 }$ with length less than $k$ – just take the first $k _ { 1 }$ , respectively $k _ { 2 }$ , lines of our original proof. Using the induction hypothesis, we conclude that $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi _ { 1 }$ and $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi _ { 2 }$ holds. But these two relations imply that $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi _ { 1 } \land \psi _ { 2 }$ holds as well – why?

2. If $\psi$ has been shown using the rule e, then we must have proved, assumed or given as a premise some formula $\eta _ { 1 } \vee \eta _ { 2 }$ in some line $k ^ { \prime }$ with $k ^ { \prime } < k$ , which was referred to via ∨e in the justification of line $k$ . Thus, we have a shorter proof of the sequent $\phi _ { 1 } , \phi _ { 2 } , . . . , \phi _ { n } \vdash \eta _ { 1 } \lor \eta _ { 2 }$ within that proof, obtained by turning all assumptions of boxes that are open at line $k ^ { \prime }$ into premises. In a similar way we obtain proofs of the sequents $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } , \eta _ { 1 } \vdash \psi$ and $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } , \eta _ { 2 } \vdash \psi$ from the case analysis of ∨e. By our induction hypothesis, we conclude that the relations $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash$ $\eta _ { 1 } \lor \eta _ { 2 }$ , $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } , \eta _ { 1 } \vdash \psi$ and $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } , \eta _ { 2 } \vdash \psi$ hold. But together these three relations then force that $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ holds as well why?

3. You can guess by now that the rest of the argument checks each possible proof rule in turn and ultimately boils down to verifying that our natural deduction rules behave semantically in the same way as their corresponding truth tables evaluate. We leave the details as an exercise. ✷

The soundness of propositional logic is useful in ensuring the non-existence of a proof for a given sequent. Let’s say you try to prove that $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { 2 } \vdash \psi$ is valid, but that your best efforts won’t succeed. How could you be sure that no such proof can be found? After all, it might just be that you can’t find a proof even though there is one. It suffices to find a valuation in which $\phi _ { i }$ evaluate to T whereas $\psi$ evaluates to F. Then, by definition of $\vDash$ , we don’t have $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { 2 } \vdash \psi$ . Using soundness, this means that $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { 2 } \vdash \psi$ cannot be valid. Therefore, this sequent does not have a proof. You will practice this method in the exercises.

# 1.4.4 Completeness of propositional logic

In this subsection, we hope to convince you that the natural deduction rules of propositional logic are complete: whenever $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ holds, then there exists a natural deduction proof for the sequent $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ . Combined with the soundness result of the previous subsection, we then obtain

This gives you a certain freedom regarding which method you prefer to use. Often it is much easier to show one of these two relationships (although neither of the two is universally better, or easier, to establish). The first method involves a proof search, upon which the logic programming paradigm is based. The second method typically forces you to compute a truth table which is exponential in the size of occurring propositional atoms. Both methods are intractable in general but particular instances of formulas often respond differently to treatment under these two methods.

The remainder of this section is concerned with an argument saying that if $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ holds, then $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ is valid. Assuming that $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ holds, the argument proceeds in three steps:

Step 1: We show that $\models \phi _ { 1 } \longrightarrow \left( \phi _ { 2 } \longrightarrow \left( \phi _ { 3 } \longrightarrow \left( \dots ( \phi _ { n } \longrightarrow \psi \right) \dots \right) \right)$ )) holds.   
Step 2: We show that $\vdash \phi _ { 1 } \longrightarrow ( \phi _ { 2 } \longrightarrow ( \phi _ { 3 } \longrightarrow ( \ldots ( \phi _ { n } \longrightarrow \psi ) \ldots ) )$ )) is valid.   
Step 3: Finally, we show that $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ is valid.

The first and third steps are quite easy; all the real work is done in the second one.

![](images/8ac440c4e761ab6e0bd26d9d19dd401d12a1255075c757409c26509ce588dd0d.jpg)  
Figure 1.11. The only way this parse tree can evaluate to F. We represent parse trees for $\phi _ { 1 } , \phi _ { 2 } , . . . , \phi _ { n }$ as triangles as their internal structure does not concern us here.

Step 1:

Definition 1.36 A formula of propositional logic $\phi$ is called a tautology iff it evaluates to $\mathrm { T }$ under all its valuations, i.e. iff $\models \phi$ .

Supposing that $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ holds, let us verify that $\phi _ { 1 }  ( \phi _ { 2 } $ $( \phi _ { 3 } \to ( . . . ( \phi _ { n } \to \psi ) \dots ) )$ )) is indeed a tautology. Since the latter formula is a nested implication, it can evaluate to $\mathtt { F }$ only if all $\phi _ { 1 }$ , $\phi _ { 2 } , . . , \phi _ { n }$ evaluate to T and $\psi$ evaluates to $\mathtt { F }$ ; see its parse tree in Figure 1.11. But this contradicts the fact that $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ holds. Thus, $\models \phi _ { 1 } \longrightarrow ( \phi _ { 2 } \longrightarrow ( \phi _ { 3 } \longrightarrow ( . . . ( \phi _ { n } \longrightarrow$ $\left. { \psi } \right. \ldots \left) \right|$ )) holds.

# Step 2:

Theorem 1.37 $I f \models \eta$ holds, then  η is valid. In other words, if $\eta$ is a tautology, then η is a theorem.

This step is the hard one. Assume that $\models \eta$ holds. Given that $\eta$ contains $n$ distinct propositional atoms $p _ { 1 } , p _ { 2 } , \ldots , p _ { n }$ we know that $\eta$ evaluates to T for all $2 ^ { n }$ lines in its truth table. (Each line lists a valuation of $\eta$ .) How can we use this information to construct a proof for $\eta \smash { ? }$ In some cases this can be done quite easily by taking a very good look at the concrete structure of $\eta$ . But here we somehow have to come up with a uniform way of building such a proof. The key insight is to ‘encode’ each line in the truth table of $\eta$ as a sequent. Then we construct proofs for these $2 ^ { n }$ sequents and assemble them into a proof of $\eta$ .

Proposition 1.38 Let $\phi$ be a formula such that $p _ { 1 } , p _ { 2 } , \ldots , p _ { n }$ are its only propositional atoms. Let $l$ be any line number in $\phi$ ’s truth table. For all $1 \leq i \leq n$ let $\hat { p } _ { i }$ be $p _ { i }$ if the entry in line $l$ of $p _ { i }$ is T, otherwise $\hat { p } _ { i }$ is $\neg p _ { i }$ . Then we have

1. $\hat { p } _ { 1 } , \hat { p } _ { 2 } , \dots , \hat { p } _ { n } \vdash \phi$ is provable if the entry for $\phi$ in line $l$ is T $\mathcal { Q }$ . $\hat { p } _ { 1 } , \hat { p } _ { 2 } , \dotsc , \hat { p } _ { n } \vdash \dotsc \phi$ is provable if the entry for $\phi$ in line $l$ is F

Proof: This proof is done by structural induction on the formula $\phi$ , that is, mathematical induction on the height of the parse tree of $\phi$ .

1. If $\phi$ is a propositional atom $p$ , we need to show that $p \vdash p$ and $\neg p \vdash \neg p$ . These have one-line proofs.   
2. If $\phi$ is of the form $\lnot \phi _ { 1 }$ we again have two cases to consider. First, assume that $\phi$ evaluates to T. In this case $\phi _ { 1 }$ evaluates to F. Note that $\phi _ { 1 }$ has the same atomic propositions as $\phi$ . We may use the induction hypothesis on $\phi _ { 1 }$ to conclude that $\hat { p } _ { 1 } , \hat { p } _ { 2 } , \dotsc , \dotsc , \hat { p } _ { n } \vdash \dotsc \phi _ { 1 }$ ; but $\lnot \phi _ { 1 }$ is just $\phi$ , so we are done. Second, if $\phi$ evaluates to $\mathtt { F }$ , then $\phi _ { 1 }$ evaluates to T and we get $\hat { p } _ { 1 } , \hat { p } _ { 2 } , \dotsc , \hat { p } _ { n } \vdash \phi _ { 1 }$ by induction. Using the rule $\neg \neg \mathrm { i }$ , we may extend the proof of $\hat { p } _ { 1 } , \hat { p } _ { 2 } , \dots , \hat { p } _ { n } \vdash \phi _ { 1 }$ to one for $\hat { p } _ { 1 } , \hat { p } _ { 2 } , \ldots , \hat { p } _ { n } \vdash \lnot \lnot \phi _ { 1 }$ ; but $\neg \neg \phi _ { 1 }$ is just $\lnot \phi$ , so again we are done.

The remaining cases all deal with two subformulas: $\phi$ equals $\phi _ { 1 } \circ \phi _ { 2 }$ , where $\bigcirc$ is $ , \wedge$ or $\vee$ . In all these cases let $q _ { 1 } , \ldots , q _ { l }$ be the propositional atoms of $\phi _ { 1 }$ and $r _ { 1 } , \ldots , r _ { k }$ be the propositional atoms of $\phi _ { 2 }$ . Then we certainly have $\{ q 1 , \dots , q _ { l } \} \cup \{ r _ { 1 } , \dots , r _ { k } \} = \{ p _ { 1 } , \dots , p _ { n } \}$ . Therefore, whenever $\hat { q } _ { 1 } , \dotsc , \hat { q } _ { l } \vdash \psi _ { 1 }$ and $\hat { r } _ { 1 } , \dotsc , \hat { r } _ { k } \vdash \psi _ { 2 }$ are valid so is $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \psi _ { 1 } \land \psi _ { 2 }$ using the rule $\wedge \mathrm { i }$ . In this way, we can use our induction hypothesis and only owe proofs that the conjunctions we conclude allow us to prove the desired conclusion for $\phi$ or $\lnot \phi$ as the case may be.

3. To wit, let $\phi$ be $\phi _ { 1 }  \phi _ { 2 }$ . If $\phi$ evaluates to $\mathtt { F }$ , then we know that $\phi _ { 1 }$ evaluates to $\mathrm { T }$ and $\phi _ { 2 }$ to $\mathtt { F }$ . Using our induction hypothesis, we have $\hat { q } _ { 1 } , \dotsc , \hat { q } _ { l } \vdash \phi _ { 1 }$ and $\boldsymbol { \hat { r } } _ { 1 } , \ldots , \boldsymbol { \hat { r } } _ { k } \vdash \lnot \phi _ { 2 }$ , so $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \phi _ { 1 } \land \lnot \phi _ { 2 }$ follows. We need to show $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \lnot ( \phi _ { 1 } \to \phi _ { 2 } )$ ; but using $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \phi _ { 1 } \land \lnot \phi _ { 2 }$ , this amounts to proving the sequent $\phi _ { 1 } \wedge \neg \phi _ { 2 } \vdash \neg ( \phi _ { 1 } \to \phi _ { 2 } )$ , which we leave as an exercise. If $\phi$ evaluates to $\mathrm { T }$ , then we have three cases. First, if $\phi _ { 1 }$ evaluates to $\boldsymbol { \mathrm { F } }$ and $\phi _ { 2 }$ to $\mathtt { F }$ , then we get, by our induction hypothesis, that $\hat { q } _ { 1 } , \dotsc , \hat { q } _ { l } \vdash \dotsc \phi _ { 1 }$ and $\hat { r } _ { 1 } , \ldots , \hat { r } _ { k } \vdash \lnot \phi _ { 2 }$ , so $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \lnot \phi _ { 1 } \land \lnot \phi _ { 2 }$ follows. Again, we need only to show the sequent $\lnot \phi _ { 1 } \wedge \lnot \phi _ { 2 } \vdash \phi _ { 1 }  \phi _ { 2 }$ , which we leave as an exercise. Second, if $\phi _ { 1 }$ evaluates to $\boldsymbol { \mathrm { F } }$ and $\phi _ { 2 }$ to $\mathrm { T }$ , we use our induction hypothesis to arrive at $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \lnot \phi _ { 1 } \land \phi _ { 2 }$ and have to prove $\lnot \phi _ { 1 } \wedge \phi _ { 2 } \vdash \phi _ { 1 } \to \phi _ { 2 }$ , which we leave as an exercise. Third, if $\phi _ { 1 }$ and $\phi _ { 2 }$ evaluate to $\mathrm { T }$ , we arrive at $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \phi _ { 1 } \land \phi _ { 2 }$ , using our induction hypothesis, and need to prove $\phi _ { 1 } \wedge \phi _ { 2 } \vdash \phi _ { 1 } \to \phi _ { 2 }$ , which we leave as an exercise as well.

4. If $\phi$ is of the form $\phi _ { 1 } \wedge \phi _ { 2 }$ , we are again dealing with four cases in total. First, if $\phi _ { 1 }$ and $\phi _ { 2 }$ evaluate to $\mathrm { T }$ , we get $\hat { q } _ { 1 } , \dotsc , \hat { q } _ { l } \vdash \phi _ { 1 }$ and $\hat { r } _ { 1 } , \ldots , \hat { r } _ { k } \vdash \phi _ { 2 }$ by our induction hypothesis, so $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \phi _ { 1 } \land \phi _ { 2 }$ follows. Second, if $\phi _ { 1 }$ evaluates to $\mathtt { F }$ and $\phi _ { 2 }$ to $\mathrm { T }$ , then we get $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \lnot \phi _ { 1 } \land \phi _ { 2 }$ using our induction hypothesis and the rule $\wedge \mathrm { i }$ as above and we need to prove $\lnot \phi _ { 1 } \land \phi _ { 2 } \vdash \lnot ( \phi _ { 1 } \land \phi _ { 2 } )$ , which we leave as an exercise. Third, if $\phi _ { 1 }$ and $\phi _ { 2 }$ evaluate to $\mathtt { F }$ , then our induction hypothesis and the rule $\wedge \mathrm { i }$ let us infer that $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \lnot \phi _ { 1 } \land \lnot \phi _ { 2 }$ ; so we are left with proving $\lnot \phi _ { 1 } \land \lnot \phi _ { 2 } \vdash \lnot ( \phi _ { 1 } \land \phi _ { 2 } )$ , which we leave as an exercise. Fourth, if $\phi _ { 1 }$ evaluates to $\mathrm { T }$ and $\phi _ { 2 }$ to $\mathtt { F }$ , we obtain $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \phi _ { 1 } \land \lnot \phi _ { 2 }$ by our induction hypothesis and we have to show $\phi _ { 1 } \wedge \neg \phi _ { 2 } \vdash \neg ( \phi _ { 1 } \wedge \phi _ { 2 } )$ , which we leave as an exercise.

5. Finally, if $\phi$ is a disjunction $\phi _ { 1 } \lor \phi _ { 2 }$ , we again have four cases. First, if $\phi _ { 1 }$ and $\phi _ { 2 }$ evaluate to $\mathtt { F }$ , then our induction hypothesis and the rule $\wedge \mathrm { i }$ give us $\hat { p } _ { 1 } , \dotsc , \hat { p } _ { n } \vdash$ $\lnot \phi _ { 1 } \land \lnot \phi _ { 2 }$ and we have to show $\neg \phi _ { 1 } \land \neg \phi _ { 2 } \vdash \neg ( \phi _ { 1 } \lor \phi _ { 2 } )$ , which we leave as an exercise. Second, if $\phi _ { 1 }$ and $\phi _ { 2 }$ evaluate to $\mathrm { T }$ , then we obtain $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \phi _ { 1 } \land \phi _ { 2 }$ , by our induction hypothesis, and we need a proof for $\phi _ { 1 } \wedge \phi _ { 2 } \vdash \phi _ { 1 } \lor \phi _ { 2 }$ , which we leave as an exercise. Third, if $\phi _ { 1 }$ evaluates to $\mathtt { F }$ and $\phi _ { 2 }$ to $\mathrm { T }$ , then we arrive at $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \lnot \phi _ { 1 } \land \phi _ { 2 }$ , using our induction hypothesis, and need to establish $\neg \phi _ { 1 } \land \phi _ { 2 } \vdash \phi _ { 1 } \lor \phi _ { 2 }$ , which we leave as an exercise. Fourth, if $\phi _ { 1 }$ evaluates to T and $\phi _ { 2 }$ to $\mathtt { F }$ , then $\hat { p } _ { 1 } , . . . , \hat { p } _ { n } \vdash \phi _ { 1 } \land \lnot \phi _ { 2 }$ results from our induction hypothesis and all we need is a proof for $\phi _ { 1 } \wedge \neg \phi _ { 2 } \vdash \phi _ { 1 } \lor \phi _ { 2 }$ , which we leave as an exercise. ✷

We apply this technique to the formula $\models \phi _ { 1 } \longrightarrow ( \phi _ { 2 } \longrightarrow ( \phi _ { 3 } \longrightarrow ( . . . ( \phi _ { n } \longrightarrow$ $\left. { \psi } \right. \ldots \left) \right.$ )). Since it is a tautology it evaluates to T in all $2 ^ { n }$ lines of its truth table; thus, the proposition above gives us $2 ^ { n }$ many proofs of $\hat { p } _ { 1 } , \hat { p } _ { 2 } , \dots , \hat { p } _ { n } \vdash$ $\eta$ , one for each of the cases that $\hat { p } _ { i }$ is $p _ { i }$ or $\neg p _ { i }$ . Our job now is to assemble all these proofs into a single proof for $\eta$ which does not use any premises. We illustrate how to do this for an example, the tautology $p \land q  p$ .

The formula $p \land q  p$ has two propositional atoms $p$ and $q$ . By the proposition above, we are guaranteed to have a proof for each of the four sequents

$$
\begin{array} { r } { p , q \vdash p \land q \longrightarrow p } \\ { \neg p , q \vdash p \land q \longrightarrow p } \\ { p , \neg q \vdash p \land q \longrightarrow p } \\ { \neg p , \neg q \vdash p \land q \longrightarrow p . } \end{array}
$$

Ultimately, we want to prove $p \land q  p$ by appealing to the four proofs of the sequents above. Thus, we somehow need to get rid of the premises on the left-hand sides of these four sequents. This is the place where we rely on the law of the excluded middle which states $r \vee \neg r$ , for any $r$ . We use LEM for all propositional atoms (here $p$ and $q$ ) and then we separately assume all the four cases, by using ∨e. That way we can invoke all four proofs of the sequents above and use the rule ∨e repeatedly until we have got rid of all our premises. We spell out the combination of these four phases schematically:

<table><tr><td colspan="5">1 pv-p LEM</td></tr><tr><td>2 P</td><td colspan="2">ass</td><td colspan="2">-p</td></tr><tr><td>3</td><td colspan="2">qV-q LEM</td><td colspan="2">qV-q</td></tr><tr><td></td><td>ass q ：</td><td>1 ass</td><td>q ass ：</td><td>LEM -q ass</td></tr><tr><td></td><td colspan="2"></td><td colspan="2">：</td></tr><tr><td></td><td colspan="2">p&gt;q→p</td><td colspan="2">p&gt;q→p</td></tr><tr><td>7</td><td colspan="2">p&gt;q→p p&gt;q→p</td><td colspan="2">p&gt;q→p p&gt;q→p Ve</td></tr><tr><td>8 9</td><td colspan="4">Ve p&gt;q→p Ve</td></tr></table>

As soon as you understand how this particular example works, you will also realise that it will work for an arbitrary tautology with $n$ distinct atoms. Of course, it seems ridiculous to prove $p \land q  p$ using a proof that is this long. But remember that this illustrates a uniform method that constructs a proof for every tautology $\eta$ , no matter how complicated it is.

Step 3: Finally, we need to find a proof for $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ . Take the proof for $\vdash \phi _ { 1 } \longrightarrow ( \phi _ { 2 } \longrightarrow ( \phi _ { 3 } \longrightarrow ( \ldots ( \phi _ { n } \longrightarrow \psi ) \ldots ) )$ ) given by step 2 and augment its proof by introducing $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n }$ as premises. Then apply →e $n$ times on each of these premises (starting with $\phi _ { 1 }$ , continuing with $\phi _ { 2 }$ etc.). Thus, we arrive at the conclusion $\psi$ which gives us a proof for the sequent $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ .

Corollary 1.39 (Soundness and Completeness) Let $\phi _ { 1 } , \phi _ { 2 } , . . . , \phi _ { n } , \psi$ be formulas of propositional logic. Then $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ is holds iff the sequent $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ is valid.

# 1.5 Normal forms

In the last section, we showed that our proof system for propositional logic is sound and complete for the truth-table semantics of formulas in Figure 1.6.

Soundness means that whatever we prove is going to be a true fact, based on the truth-table semantics. In the exercises, we apply this to show that a sequent does not have a proof: simply show that $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { 2 }$ does not semantically entail $\psi$ ; then soundness implies that the sequent $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { 2 } \vdash \psi$ does not have a proof. Completeness comprised a much more powerful statement: no matter what (semantically) valid sequents there are, they all have syntactic proofs in the proof system of natural deduction. This tight correspondence allows us to freely switch between working with the notion of proofs $( \vdash )$ and that of semantic entailment (�).

Using natural deduction to decide the validity of instances of $\vdash$ is only one of many possibilities. In Exercise 1.2.6 we sketch a non-linear, tree-like, notion of proofs for sequents. Likewise, checking an instance of $\vDash$ by applying Definition 1.34 literally is only one of many ways of deciding whether $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ holds. We now investigate various alternatives for deciding $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ which are based on transforming these formulas syntactically into ‘equivalent’ ones upon which we can then settle the matter by purely syntactic or algorithmic means. This requires that we first clarify what exactly we mean by equivalent formulas.

# 1.5.1 Semantic equivalence, satisfiability and validity

Two formulas $\phi$ and $\psi$ are said to be equivalent if they have the same ‘meaning.’ This suggestion is vague and needs to be refined. For example, $p \longrightarrow q$ and $\neg p \lor q$ have the same truth table; all four combinations of T and F for $p$ and $q$ return the same result. ’Coincidence of truth tables’ is not good enough for what we have in mind, for what about the formulas $p \land q  p$ and $r \vee \neg r$ ? At first glance, they have little in common, having different atomic formulas and different connectives. Moreover, the truth table for $p \land q  p$ is four lines long, whereas the one for $r \vee \neg r$ consists of only two lines. However, both formulas are always true. This suggests that we define the equivalence of formulas $\phi$ and $\psi$ via $\vDash$ : if $\phi$ semantically entails $\psi$ and vice versa, then these formulas should be the same as far as our truth-table semantics is concerned.

Definition 1.40 Let $\phi$ and $\psi$ be formulas of propositional logic. We say that $\phi$ and $\psi$ are semantically equivalent iff $\phi \models \psi$ and $\psi \models \phi$ hold. In that case we write $\phi \equiv \psi$ . Further, we call $\phi$ valid if $\models \phi$ holds.

Note that we could also have defined $\phi \equiv \psi$ to mean that $\vdash ( \phi  \psi ) \land$ ( $\psi  \phi \}$ ) holds; it amounts to the same concept. Indeed, because of soundness and completeness, semantic equivalence is identical to provable equivalence (Definition 1.25). Examples of equivalent formulas are

$$
\begin{array} { c } { p  q \equiv \neg q  \neg p } \\ { p  q \equiv \neg p \vee q } \\ { p \wedge q  p \equiv r \vee \neg r } \\ { p \wedge q  r \equiv p  ( q  r ) . } \end{array}
$$

Recall that a formula $\eta$ is called a tautology if $\models \eta$ holds, so the tautologies are exactly the valid formulas. The following lemma says that any decision procedure for tautologies is in fact a decision procedure for the validity of sequents as well.

Lemma 1.41 Given formulas $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n }$ and $\psi$ of propositional logic, $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ holds iff $\models \phi _ { 1 } \to ( \phi _ { 2 } \to ( \phi _ { 3 } \to \cdot \cdot \cdot \to ( \phi _ { n } \to \psi ) )$ ) holds.

Proof: First, suppose that $\models \phi _ { 1 } \to ( \phi _ { 2 } \to ( \phi _ { 3 } \to \cdot \cdot \cdot \to ( \phi _ { n } \to \psi ) ) )$ holds. If $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n }$ are all true under some valuation, then $\psi$ has to be true as well for that same valuation. Otherwise, $\models \phi _ { 1 } \longrightarrow ( \phi _ { 2 } \longrightarrow ( \phi _ { 3 } \longrightarrow \cdot \cdot \cdot \longrightarrow$ $( \phi _ { n }  \psi ) \rangle$ ) would not hold (compare this with Figure 1.11). Second, if $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ holds, we have already shown that $\models \phi _ { 1 } \to ( \phi _ { 2 } \to ( \phi _ { 3 } \to$ $\cdots \to ( \phi _ { n } \to \psi ) )$ ) follows in step 1 of our completeness proof. ✷

For our current purposes, we want to transform formulas into ones which don’t contain $\longrightarrow$ at all and the occurrences of $\wedge$ and  are confined to separate layers such that validity checks are easy. This is being done by

1. using the equivalence $\phi \longrightarrow \psi \equiv \lnot \phi \vee \psi$ to remove all occurrences of $\longrightarrow$ from a formula and   
2. by specifying an algorithm that takes a formula without any $\longrightarrow$ into a normal form (still without $\longrightarrow$ ) for which checking validity is easy.

Naturally, we have to specify which forms of formulas we think of as being ‘normal.’ Again, there are many such notions, but in this text we study only two important ones.

Definition 1.42 A literal $L$ is either an atom $p$ or the negation of an atom $\neg p$ . A formula $C$ is in conjunctive normal form (CNF) if it is a conjunction of clauses, where each clause $D$ is a disjunction of literals:

$$
\begin{array} { r } { \begin{array} { l } { L : = p \enspace \vert \enspace \neg p } \\ { D : = L \enspace \vert \enspace L \vee D } \\ { C : = D \enspace \vert \enspace D \wedge C . } \end{array} } \end{array}
$$

Examples of formulas in conjunctive normal form are

$$
( i ) \quad ( \neg q \lor p \lor r ) \land ( \neg p \lor r ) \land q \qquad ( i i ) \quad ( p \lor r ) \land ( \neg p \lor r ) \land ( p \lor \neg r )
$$

In the first case, there are three clauses of type $D \colon \lnot q \lor p \lor r , \lnot p \lor r$ , and $q -$ which is a literal promoted to a clause by the first rule of clauses in (1.6). Notice how we made implicit use of the associativity laws for $\wedge$ and $\vee$ , saying that $\phi \lor ( \psi \lor \eta ) \equiv ( \phi \lor \psi ) \lor \eta$ and $\phi \wedge ( \psi \wedge \eta ) \equiv ( \phi \wedge \psi ) \wedge \eta$ , since we omitted some parentheses. The formula $( \neg ( q \lor p ) \lor r ) \land ( q \lor r )$ is not in CNF since $q \vee p$ is not a literal.

Why do we care at all about formulas $\phi$ in CNF? One of the reasons for their usefulness is that they allow easy checks of validity which otherwise take times exponential in the number of atoms. For example, consider the formula in CNF from above: $( \neg q \lor p \lor r ) \land ( \neg p \lor r ) \land q$ . The semantic entailment $\models ( \neg q \lor p \lor r ) \land ( \neg p \lor r ) \land q$ holds iff all three relations

$$
 \begin{array} { r l r l } { \models \neg q \lor p \lor r } & { { } } & { \models \neg p \lor r } & { } & { { } \models q } \end{array}
$$

hold, by the semantics of $\wedge$ . But since all of these formulas are disjunctions of literals, or literals, we can settle the matter as follows.

Lemma 1.43 $A$ disjunction of literals $L _ { 1 } \lor L _ { 2 } \lor \cdots \lor L _ { m }$ is valid iff there are $1 \leq i , j \leq m$ such that $L _ { i }$ is $\neg L _ { j }$ .

Proof: If $L _ { i }$ equals $\neg L _ { j }$ , then $L _ { 1 } \lor L _ { 2 } \lor \cdots \lor L _ { m }$ evaluates to T for all valuations. For example, the disjunct $p \vee q \vee r \vee \neg q$ can never be made false.

To see that the converse holds as well, assume that no literal $L _ { k }$ has a matching negation in $L _ { 1 } \lor L _ { 2 } \lor \cdots \lor L _ { m }$ . Then, for each $k$ with $1 \leq k \leq n$ , we assign $\mathtt { F }$ to $L _ { k }$ , if $L _ { k }$ is an atom; or $\mathrm { T }$ , if $L _ { k }$ is the negation of an atom. For example, the disjunct $\neg q \lor p \lor r$ can be made false by assigning $\mathtt { F }$ to $p$ and $r$ and $\mathrm { T }$ to $q$ . ✷

Hence, we have an easy and fast check for the validity of $\models \phi$ , provided that $\phi$ is in CNF; inspect all conjuncts $\psi _ { k }$ of $\phi$ and search for atoms in $\psi _ { k }$ such that $\psi _ { k }$ also contains their negation. If such a match is found for all conjuncts, we have $\models \phi$ . Otherwise ( $=$ some conjunct contains no pair $L _ { i }$ and $\neg L _ { i } )$ , $\phi$ is not valid by the lemma above. Thus, the formula $\left( \neg q \lor p \lor r \right) \land$ $( \neg p \lor r ) \land q$ above is not valid. Note that the matching literal has to be found in the same conjunct $\psi _ { k }$ . Since there is no free lunch in this universe, we can expect that the computation of a formula $\phi ^ { \prime }$ in CNF, which is equivalent to a given formula $\phi$ , is a costly worst-case operation.

Before we study how to compute equivalent conjunctive normal forms, we introduce another semantic concept closely related to that of validity.

Definition 1.44 Given a formula $\phi$ in propositional logic, we say that $\phi$ is satisfiable if it has a valuation in which is evaluates to T.

For example, the formula $p \vee q \longrightarrow p$ is satisfiable since it computes T if we assign T to $p$ . Clearly, $p \vee q  p$ is not valid. Thus, satisfiability is a weaker concept since every valid formula is by definition also satisfiable but not vice versa. However, these two notions are just mirror images of each other, the mirror being negation.

Proposition 1.45 Let $\phi$ be a formula of propositional logic. Then $\phi$ is satisfiable iff ¬ $\phi$ is not valid.

Proof: First, assume that $\phi$ is satisfiable. By definition, there exists a valuation of $\phi$ in which $\phi$ evaluates to $\mathrm { T }$ ; but that means that $\lnot \phi$ evaluates to $\mathtt { F }$ for that same valuation. Thus, $\lnot \phi$ cannot be valid.

Second, assume that $\lnot \phi$ is not valid. Then there must be a valuation of $\lnot \phi$ in which $\lnot \phi$ evaluates to F. Thus, $\phi$ evaluates to T and is therefore satisfiable. (Note that the valuations of $\phi$ are exactly the valuations of ¬ $\phi$ .) ✷

This result is extremely useful since it essentially says that we need provide a decision procedure for only one of these concepts. For example, let’s say that we have a procedure $\mathrm { P }$ for deciding whether any $\phi$ is valid. We obtain a decision procedure for satisfiability simply by asking P whether $\lnot \phi$ is valid. If it is, $\phi$ is not satisfiable; otherwise $\phi$ is satisfiable. Similarly, we may transform any decision procedure for satisfiability into one for validity. We will encounter both kinds of procedures in this text.

There is one scenario in which computing an equivalent formula in CNF is really easy; namely, when someone else has already done the work of writing down a full truth table for $\phi$ . For example, take the truth table of $( p \to \neg q ) \to ( q \lor \neg p )$ in Figure 1.8 (page 40). For each line where ( $p \longrightarrow$ $\neg q ) \neg p ( q \lor \neg p )$ computes $\mathtt { F }$ we now construct a disjunction of literals. Since there is only one such line, we have only one conjunct $\psi _ { 1 }$ . That conjunct is now obtained by a disjunction of literals, where we include literals $\neg p$ and $q$ . Note that the literals are just the syntactic opposites of the truth values in that line: here $p$ is $\mathrm { T }$ and $q$ is F. The resulting formula in CNF is thus $\neg p \lor q$ which is readily seen to be in CNF and to be equivalent to $( p \to \neg q ) \to ( q \lor \neg p )$ .

Why does this always work for any formula $\phi$ ? Well, the constructed formula will be false iff at least one of its conjuncts $\psi _ { i }$ will be false. This means that all the disjuncts in such a $\psi _ { i }$ must be F. Using the de Morgan rule $\lnot \phi _ { 1 } \lor \lnot \phi _ { 2 } \lor \lnot \lor \lnot \phi _ { n } \equiv \lnot ( \phi _ { 1 } \land \phi _ { 2 } \land \ l \cdots \land \phi _ { n } )$ , we infer that the conjunction of the syntactic opposites of those literals must be true. Thus, $\phi$ and the constructed formula have the same truth table.

Consider another example, in which $\phi$ is given by the truth table:

<table><tr><td>p</td><td>q</td><td>r</td><td>?</td></tr><tr><td>T</td><td>T</td><td>T</td><td>T</td></tr><tr><td>T</td><td>T</td><td>F</td><td></td></tr><tr><td>T</td><td>F</td><td>T</td><td></td></tr><tr><td>T</td><td>F</td><td>F</td><td></td></tr><tr><td>F</td><td>T</td><td>T</td><td></td></tr><tr><td>F</td><td>T</td><td>F</td><td>ＦＴＴＦＦ</td></tr><tr><td>F</td><td>F</td><td>T</td><td>F</td></tr><tr><td>F</td><td>F</td><td>F</td><td></td></tr></table>

Note that this table is really just a specification of $\phi$ ; it does not tell us what $\phi$ looks like syntactically, but it does tells us how it ought to ‘behave.’ Since this truth table has four entries which compute F, we construct four conjuncts $\psi _ { i }$ ( $1 \leq i \leq 4 $ ). We read the $\psi _ { i }$ off that table by listing the disjunction of all atoms, where we negate those atoms which are true in those lines:

$$
{ \begin{array} { r l r l } & { \psi _ { 1 } \stackrel { \scriptscriptstyle \mathrm { d e f } } { = } \neg p \vee \neg q \vee r ( \mathrm { l i n e ~ 2 } ) } & & { \psi _ { 2 } \stackrel { \scriptscriptstyle \mathrm { d e f } } { = } p \vee \neg q \vee \neg r ( \mathrm { l i n e ~ 5 } ) } \\ & { \psi _ { 3 } \stackrel { \scriptscriptstyle \mathrm { d e f } } { = } p \vee \neg q \vee r \quad \mathrm { e t c } } & & { \psi _ { 4 } \stackrel { \scriptscriptstyle \mathrm { d e f } } { = } p \vee q \vee \neg r . } \end{array} }
$$

The resulting $\phi$ in CNF is therefore

$$
( \neg p \lor \neg q \lor r ) \land ( p \lor \neg q \lor \neg r ) \land ( p \lor \neg q \lor r ) \land ( p \lor q \lor \neg r ) .
$$

If we don’t have a full truth table at our disposal, but do know the structure of $\phi$ , then we would like to compute a version of $\phi$ in CNF. It should be clear by now that a full truth table of $\phi$ and an equivalent formula in CNF are pretty much the same thing as far as questions about validity are concerned – although the formula in CNF may be much more compact.

# 1.5.2 Conjunctive normal forms and validity

We have already seen the benefits of conjunctive normal forms in that they allow for a fast and easy syntactic test of validity. Therefore, one wonders whether any formula can be transformed into an equivalent formula in CNF. We now develop an algorithm achieving just that. Note that, by Definition 1.40, a formula is valid iff any of its equivalent formulas is valid. We reduce the problem of determining whether any $\phi$ is valid to the problem of computing an equivalent $\psi \equiv \phi$ such that $\psi$ is in CNF and checking, via Lemma 1.43, whether $\psi$ is valid.

Before we sketch such a procedure, we make some general remarks about its possibilities and its realisability constraints. First of all, there could be more or less efficient ways of computing such normal forms. But even more so, there could be many possible correct outputs, for $\psi _ { 1 } \equiv \phi$ and $\psi _ { 2 } \equiv \phi$ do not generally imply that $\psi _ { 1 }$ is the same as $\psi _ { 2 }$ , even if $\psi _ { 1 }$ and $\psi _ { 2 }$ are in CNF. For example, take $\phi \ { \stackrel { \mathrm { d e f } } { = } } \ p$ , $\psi _ { 1 } \stackrel { \mathrm { d e f } } { = } p$ and $\psi _ { 2 } \ { \stackrel { \mathrm { d e f } } { = } } \ p \wedge ( p \vee q )$ ; then convince yourself that $\phi \equiv \psi _ { 2 }$ holds. Having this ambiguity of equivalent conjunctive normal forms, the computation of a CNF for $\phi$ with minimal ‘cost’ (where ‘cost’ could for example be the number of conjuncts, or the height of $\phi$ ’s parse tree) becomes a very important practical problem, an issue persued in Chapter 6. Right now, we are content with stating a deterministic algorithm which always computes the same output CNF for a given input $\phi$ .

This algorithm, called CNF, should satisfy the following requirements:

(1) CNF terminates for all formulas of propositional logic as input; (2) for each such input, CNF outputs an equivalent formula; and (3) all output computed by CNF is in CNF.

If a call of CNF with a formula $\phi$ of propositional logic as input terminates, which is enforced by (1), then (2) ensures that $\psi \equiv \phi$ holds for the output $\psi$ . Thus, (3) guarantees that $\psi$ is an equivalent CNF of $\phi$ . So $\phi$ is valid iff $\psi$ is valid; and checking the latter is easy relative to the length of $\psi$ .

What kind of strategy should CNF employ? It will have to function correctly for all, i.e. infinitely many, formulas of propositional logic. This strongly suggests to write a procedure that computes a CNF by structural induction on the formula $\phi$ . For example, if $\phi$ is of the form $\phi _ { 1 } \wedge \phi _ { 2 }$ , we may simply compute conjunctive normal forms $\eta _ { i }$ for $\phi _ { i }$ $( i = 1 , 2$ ), whereupon $\eta _ { 1 } \wedge \eta _ { 2 }$ is a conjunctive normal form which is equivalent to $\phi$ provided that $\eta _ { i } \equiv \phi _ { i }$ $( i = 1 , 2 )$ ). This strategy also suggests to use proof by structural induction on $\phi$ to prove that CNF meets the requirements (1–3) stated above.

Given a formula $\phi$ as input, we first do some preprocessing. Initially, we translate away all implications in $\phi$ by replacing all subformulas of the form $\psi \to \eta$ by $\neg \psi \lor \eta$ . This is done by a procedure called IMPL FREE. Note that this procedure has to be recursive, for there might be implications in $\psi$ or $\eta$ as well.

The application of IMPL FREE might introduce double negations into the output formula. More importantly, negations whose scopes are non-atomic formulas might still be present. For example, the formula $p \land \neg ( p \land q )$ has such a negation with $p \wedge q$ as its scope. Essentially, the question is whether one can efficiently compute a CNF for $\lnot \phi$ from a CNF for $\phi$ . Since nobody seems to know the answer, we circumvent the question by translating $\lnot \phi$ into an equivalent formula that contains only negations of atoms. Formulas which only negate atoms are said to be in negation normal form (NNF). We spell out such a procedure, NNF, in detail later on. The key to its specification for implication-free formulas lies in the de Morgan rules. The second phase of the preprocessing, therefore, calls NNF with the implication-free output of IMPL FREE to obtain an equivalent formula in NNF.

After all this preprocessing, we obtain a formula $\phi ^ { \prime }$ which is the result of the call NNF (IMPL FREE $\left( \phi \right)$ ). Note that $\phi ^ { \prime } \equiv \phi$ since both algorithms only transform formulas into equivalent ones. Since $\phi ^ { \prime }$ contains no occurrences of $\longrightarrow$ and since only atoms in $\phi ^ { \prime }$ are negated, we may program CNF by an analysis of only three cases: literals, conjunctions and disjunctions.

� If $\phi$ is a literal, it is by definition in CNF and so CNF outputs $\phi$ . � If $\phi$ equals $\phi _ { 1 } \wedge \phi _ { 2 }$ , we call CNF recursively on each $\phi _ { i }$ to get the respective output $\eta _ { i }$ and return the CNF $\eta _ { 1 } \wedge \eta _ { 2 }$ as output for input $\phi$ . � If $\phi$ equals $\phi _ { 1 } \lor \phi _ { 2 }$ , we again call CNF recursively on each $\phi _ { i }$ to get the respective output $\eta _ { i }$ ; but this time we must not simply return $\eta _ { 1 } \vee \eta _ { 2 }$ since that formula is certainly not in CNF, unless $\eta _ { 1 }$ and $\eta _ { 2 }$ happen to be literals.

So how can we complete the program in the last case? Well, we may resort to the distributivity laws, which entitle us to translate any disjunction of conjunctions into a conjunction of disjunctions. However, for this to result in a CNF, we need to make certain that those disjunctions generated contain only literals. We apply a strategy for using distributivity based on matching patterns in $\phi _ { 1 } \lor \phi _ { 2 }$ . This results in an independent algorithm called DISTR which will do all that work for us. Thus, we simply call DISTR with the pair $( \eta _ { 1 } , \eta _ { 2 } )$ as input and pass along its result.

Assuming that we already have written code for IMPL FREE, NNF and DISTR, we may now write pseudo code for CNF:

# function CNF $\left( \phi \right)$ :

$/ ^ { * }$ precondition: $\phi$ implication free and in NNF \*/   
$/ ^ { * }$ postcondition: CNF $\left( \phi \right)$ computes an equivalent CNF for $\phi ^ { \ast } /$   
begin function case $\phi$ is a literal : return $\phi$ $\phi$ is $\phi _ { 1 } \wedge \phi _ { 2 }$ : return $\mathrm { C N F } \left( \phi _ { 1 } \right) \land \mathrm { C N F } \left( \phi _ { 2 } \right)$ $\phi$ is $\phi _ { 1 } \lor \phi _ { 2 }$ : return DISTR (CNF $\left( \phi _ { 1 } \right)$ , CNF $\left( \phi _ { 2 } \right)$ ) end case   
end function

Notice how the calling of DISTR is done with the computed conjunctive normal forms of $\phi _ { 1 }$ and $\phi _ { 2 }$ . The routine DISTR has $\eta _ { 1 }$ and $\eta _ { 2 }$ as input parameters and does a case analysis on whether these inputs are conjunctions. What should DISTR do if none of its input formulas is such a conjunction? Well, since we are calling DISTR for inputs $\eta _ { 1 }$ and $\eta _ { 2 }$ which are in CNF, this can only mean that $\eta _ { 1 }$ and $\eta _ { 2 }$ are literals, or disjunctions of literals. Thus, $\eta _ { 1 } \lor \eta _ { 2 }$ is in CNF.

Otherwise, at least one of the formulas $\eta _ { 1 }$ and $\eta _ { 2 }$ is a conjunction. Since one conjunction suffices for simplifying the problem, we have to decide which conjunct we want to transform if both formulas are conjunctions. That way we maintain that our algorithm CNF is deterministic. So let us suppose that $\eta _ { 1 }$ is of the form $\eta _ { 1 1 } \wedge \eta _ { 1 2 }$ . Then the distributive law says that $\eta _ { 1 } \vee \eta _ { 2 } \equiv$ $\left( \eta _ { 1 1 } \vee \eta _ { 2 } \right) \wedge \left( \eta _ { 1 2 } \vee \eta _ { 2 } \right)$ . Since all participating formulas $\eta _ { 1 1 }$ , $\eta _ { 1 2 }$ and $\eta _ { 2 }$ are in CNF, we may call DISTR again for the pairs $( \eta _ { 1 1 } , \eta _ { 2 } )$ and $( \eta _ { 1 2 } , \eta _ { 2 } )$ , and then simply form their conjunction. This is the key insight for writing the function DISTR.

The case when $\eta _ { 2 }$ is a conjunction is symmetric and the structure of the recursive call of DISTR is then dictated by the equivalence $\eta _ { 1 } \vee \eta _ { 2 } \equiv$ $\left( \eta _ { 1 } \lor \eta _ { 2 1 } \right) \land \left( \eta _ { 1 } \lor \eta _ { 2 2 } \right)$ , where $\eta _ { 2 } = \eta _ { 2 1 } \wedge \eta _ { 2 2 }$ :

function DISTR $( \eta _ { 1 } , \eta _ { 2 } )$ :   
$/ ^ { * }$ precondition: $\eta _ { 1 }$ and $\eta _ { 2 }$ are in CNF \*/   
$/ ^ { * }$ postcondition: DISTR $( \eta _ { 1 } , \eta _ { 2 } )$ computes a CNF for $\eta _ { 1 } \vee \eta _ { 2 } { ~ ^ { * } } /$   
begin function case $\eta _ { 1 }$ is $\eta _ { 1 1 } \wedge \eta _ { 1 2 }$ : return DISTR $\left( \eta _ { 1 1 } , \eta _ { 2 } \right) \wedge \mathsf { D I S T R } \left( \eta _ { 1 2 } , \eta _ { 2 } \right)$ $\eta _ { 2 }$ is $\eta _ { 2 1 } \wedge \eta _ { 2 2 }$ : return DISTR $\left( \eta _ { 1 } , \eta _ { 2 1 } \right) \wedge \mathsf { D I S T R } \left( \eta _ { 1 } , \eta _ { 2 2 } \right)$ otherwise ( $=$ no conjunctions): return $\eta _ { 1 } \lor \eta _ { 2 }$ end case   
end function

Notice how the three clauses are exhausting all possibilities. Furthermore, the first and second cases overlap if $\eta _ { 1 }$ and $\eta _ { 2 }$ are both conjunctions. It is then our understanding that this code will inspect the clauses of a case statement from the top to the bottom clause. Thus, the first clause would apply.

Having specified the routines CNF and DISTR, this leaves us with the task of writing the functions IMPL FREE and NNF. We delegate the design of IMPL FREE to the exercises. The function NNF has to transform any implication-free formula into an equivalent one in negation normal form. Four examples of formulas in NNF are

$$
\begin{array} { l l } { { p } } & { { \qquad \neg p } } \\ { { \neg p \wedge ( p \wedge q ) } } & { { \qquad \neg p \wedge ( p \to q ) , } } \end{array}
$$

although we won’t have to deal with a formula of the last kind since $\longrightarrow$ won’t occur. Examples of formulas which are not in NNF are $\neg \neg p$ and $\neg ( p \land q )$ .

Again, we program NNF recursively by a case analysis over the structure of the input formula $\phi$ . The last two examples already suggest a solution for two of these clauses. In order to compute a NNF of $\neg \neg \phi$ , we simply compute a NNF of $\phi$ . This is a sound strategy since $\phi$ and $\neg \neg \phi$ are semantically equivalent. If $\phi$ equals $\neg ( \phi _ { 1 } \land \phi _ { 2 } )$ , we use the de Morgan rule $\neg ( \phi _ { 1 } \land \phi _ { 2 } ) \equiv$ $\lnot \phi _ { 1 } \lor \lnot \phi _ { 2 }$ as a recipe for how NNF should call itself recursively in that case. Dually, the case of $\phi$ being $\lnot ( \phi _ { 1 } \lor \phi _ { 2 } )$ appeals to the other de Morgan rule $\neg ( \phi _ { 1 } \lor \phi _ { 2 } ) \equiv \neg \phi _ { 1 } \land \neg \phi _ { 2 }$ and, if $\phi$ is a conjunction or disjunction, we simply let NNF pass control to those subformulas. Clearly, all literals are in NNF. The resulting code for NNF is thus

function NNF $\left( \phi \right)$ :   
$/ ^ { * }$ precondition: $\phi$ is implication free \*/   
$/ ^ { * }$ postcondition: NNF $\left( \phi \right)$ computes a NNF for $\phi ^ { \ast } /$   
begin function case $\phi$ is a literal : return $\phi$ $\phi$ is $\neg \neg \phi _ { 1 }$ : return NNF $\left( \phi _ { 1 } \right)$ $\phi$ is $\phi _ { 1 } \wedge \phi _ { 2 }$ : return NNF ( $( \phi _ { 1 }$ ) ∧ NNF $\left( \phi _ { 2 } \right)$ $\phi$ is $\phi _ { 1 } \lor \phi _ { 2 }$ : return NNF (φ1) ∨ NNF $\left( \phi _ { 2 } \right)$ $\phi$ is $\neg ( \phi _ { 1 } \land \phi _ { 2 } )$ : return NNF (¬φ1) ∨ NNF $\left( \lnot \phi _ { 2 } \right)$ $\phi$ is $\lnot ( \phi _ { 1 } \lor \phi _ { 2 } )$ : return NNF $\left( \neg \phi _ { 1 } \right) \land \mathtt { N N F } \left( \neg \phi _ { 2 } \right)$ end case   
end function

Notice that these cases are exhaustive due to the algorithm’s precondition. Given any formula $\phi$ of propositional logic, we may now convert it into an equivalent CNF by calling CNF (NNF (IMPL FREE $\left( \phi \right)$ )). In the exercises, you are asked to show that

� all four algorithms terminate on input meeting their preconditions, � the result of CNF (NNF (IMPL FREE $\left( \phi \right)$ )) is in CNF and � that result is semantically equivalent to $\phi$ .

We will return to the important issue of formally proving the correctness of programs in Chapter 4.

Let us now illustrate the programs coded above on some concrete examples. We begin by computing CNF (NNF (IMPL FREE ( $\neg p \land q \to p \land ( r \to q ) ) )$ ). We show almost all details of this computation and you should compare this with how you would expect the code above to behave. First, we compute IMPL FREE $\left( \phi \right)$ :

$$
\begin{array} { r l } & { | = - \widetilde { \mathrm { I R P L F } } ( \neg \psi \wedge \ q ) \ \vee \ \mathrm { I R P L F } ( \neg \ q ) \rangle } \\ & { = - \big ( ( \Pi \mathbb { R } \mathrm { E } , \mathrm { F R E E } - \ p ) \wedge ( \Pi \mathbb { R } \mathrm { P L F } \mathrm { H E } \ q ) \big ) \ \vee \ \mathrm { I R P L E } \mathrm { F R E } \big ( p \wedge ( r  q ) \big ) } \\ & { = - ( ( \neg p ) \wedge \ \mathrm { I I P L E } \mathrm { F R E } \ q ) \ \vee \ \mathrm { I I R P L F } \mathrm { R E E } \ q ( p \wedge ( r  q ) ) } \\ & { = - ( - p \wedge \ q ) \ \vee \ \mathrm { I R P L F } \mathrm { R E E } \ q \wedge ( r  q ) \big ) } \\ & { = - ( - p \wedge \ q ) \ \vee ( ( \Pi \mathbb { R } \mathrm { E } , \mathrm { F R E E } \ p ) \wedge \ \mathrm { I R P L E } \mathrm { F R E } \ ( r  q ) ) } \\ & { = - ( - p \wedge \ q ) \vee \big ( ( \mathtt { J } \mathtt { M P L } \mathrm { E R E } \ p ) \wedge \ \mathrm { I R P L } \_ { - } \mathtt { F R E } \big ( r  q ) \big ) } \\ & { = - ( - p \wedge \ q ) \vee ( p \wedge \ \mathrm { I R P L F } \mathrm { R E } \ q \wedge \ \neg \ q ) ) } \\ & { = - ( - p \wedge q ) \vee ( p \wedge ( \ \mathrm { - } \big ( \mathtt { I M P L } \mathrm { . F R E } \ p \vee \ \mathrm { I V } \mathrm { L P E } \mathrm { E } \ q ) ) ) } \\ & { = - ( - p \wedge q ) \vee ( p \wedge ( \mathrm { - } \mathrm { r V } \ \big ( \mathtt { I M P L } \mathrm { . F R E } \ q ) ) ) } \\ & { = - ( - p \wedge \ q ) \vee ( p \wedge ( \mathrm { - } \mathrm { r V } \ q ) ) . } \end{array}
$$

Second, we compute NNF (IMPL FREE $\phi$ ):

$$
{ \begin{array} { r l } { | } & { = \mathbb { R } \mathbb { R } ( - ( \gamma \circ \wedge q ) ) \vee \mathbb { R } \mathbb { R } ( \rho \wedge ( \gamma \circ \wedge \gamma q ) ) } \\ & { = \mathbb { R } \mathbb { R } ( - ( \gamma \circ \gamma ) \vee - q ) \vee \mathbb { R } \mathbb { R } \mathbb { P } ( \rho \wedge ( \gamma \circ \gamma \vee q ) ) } \\ & { = ( \mathbb { R } \mathbb { R } \mathbb { F } ( \cdot \circ \gamma ) ) \vee ( \mathbb { R } \mathbb { R } ( - q ) ) \vee \mathbb { R } \mathbb { R } \mathbb { F } ( \rho \wedge ( - \gamma \vee q ) ) } \\ & { = ( p \vee ( \mathbb { R } \mathbb { R } \mathbb { F } ( \cdot \circ q ) ) ) \vee \mathbb { R } \mathbb { R } \mathbb { P } ( \rho \wedge ( - \gamma \vee q ) ) } \\ & { = ( p \vee \circ q ) \vee \mathbb { R } \mathbb { R } \mathbb { F } ( \rho \wedge ( - \gamma \vee q ) ) } \\ & { = ( p \vee - q ) \vee ( ( \mathbb { R } \mathbb { R } \ p \wedge ( \mathbb { R } \mathbb { R } ( \rho \cdots \vee q ) ) ) } \\ & { - ( p \vee - q ) \vee ( p \wedge ( \mathbb { R } \mathbb { R } \mathbb { R } ( \cdot \circ \gamma \vee q ) ) ) } \\ & { = ( p \vee - q ) \vee ( p \wedge ( \mathbb { R } \mathbb { R } ( \cdot \circ \gamma ) ) \vee ( \mathbb { R } \mathbb { R } \mathbb { F } q ) ) ) } \\ & { = ( p \vee - q ) \vee ( p \wedge ( - r \vee ( \mathbb { R } \mathbb { R } \mathbb { F } q ) ) ) } \\ & { = ( p \vee - q ) \vee ( p \wedge ( - r \vee ( \mathbb { R } \mathbb { R } \mathbb { F } q ) ) ) } \\ & { = ( p \vee - q ) \vee ( p \wedge ( - r \vee q ) ) . } \end{array} }
$$

Third, we finish it off with

$$
\begin{array} { r l } & { \mathbb { V } \left( \mathbb { N } \mathbb { H F } \left( \mathbb { I } \mathbb { H } \mathbb { P } \mathrm { L } \mathrm { \mathrm { ~ F R E } ~ } \phi \right) \right) = \operatorname { C N F } \left( ( p \vee \neg q ) \vee \left( p \wedge \left( \neg r \vee q \right) \right) \right) } \\ & { \qquad = \mathbb { D } \mathrm { T S } \mathrm { T R } \left( \operatorname { C R F } \left( p \vee \neg q \right) , \operatorname { C h F } \left( p \wedge \left( \neg r \vee q \right) \right) \right) } \\ & { \qquad = \mathbb { D } \mathrm { T S } \mathrm { T R } \left( p \vee \neg q , \operatorname { C u F } \left( p \wedge \left( \neg r \vee q \right) \right) \right) } \\ & { \qquad = \mathbb { D } \mathrm { T S } \mathrm { T R } \left( p \vee \neg q , p \wedge \left( \neg r \vee q \right) \right) } \\ & { \qquad = \mathbb { D } \mathrm { T S } \mathrm { T R } \left( p \vee \neg q , p \right) \wedge \mathrm { D I S T R } \left( p \vee \neg q , \neg r \vee q \right) } \\ & { \qquad = \left( p \vee \neg q \vee p \right) \wedge \mathrm { D I S T R } \left( p \vee \neg q , \neg r \vee q \right) } \\ & { \qquad = \left( p \vee \neg q \vee p \right) \wedge \left( p \vee \neg q \vee \neg r \vee q \right) . } \end{array}
$$

The formula $( p \lor \neg q \lor p ) \land ( p \lor \neg q \lor \neg r \lor q )$ is thus the result of the call CNF (NNF (IMPL FREE $\phi$ )) and is in conjunctive normal form and equivalent to $\phi$ . Note that it is satisfiable (choose $p$ to be true) but not valid (choose $p$ to be false and $q$ to be true); it is also equivalent to the simpler conjunctive normal form $p \vee \neg q$ . Observe that our algorithm does not do such optimisations so one would need a separate optimiser running on the output. Alternatively, one might change the code of our functions to allow for such optimisations ‘on the fly,’ a computational overhead which could prove to be counterproductive.

You should realise that we omitted several computation steps in the subcalls CNF $( p \lor \neg q )$ and CNF $( p \land ( \neg r \lor q ) )$ . They return their input as a result since the input is already in conjunctive normal form.

As a second example, consider $\phi \ { \stackrel { \mathrm { d e f } } { = } } \ r \to ( s \to ( t \land s \to r ) )$ ). We compute

$$
\begin{array} { r l } & { \mathsf { \Gamma } = \mathsf { \gamma } \mathsf { V } ( \mathsf { - } ( \Pi \mathbb { P } \mathrm { L } . \mathsf { F R E } \mathsf { E } ) \vee \Pi \mathbb { P } \mathrm { L } . \mathsf { F R E } ( t \wedge s \to r ) ) } \\ & { = \mathsf { - } \mathsf { r } \vee ( \mathsf { - } s \vee \Pi \mathbb { P } \mathrm { L } . \mathsf { F R E } ( t \wedge s \to r ) ) } \\ & { = \mathsf { - } \mathsf { r } \vee ( \mathsf { - } s \vee ( \mathsf { - } ( \Pi \mathbb { P } \mathrm { L } . \mathsf { F R E } ( t \wedge s ) ) \vee \Pi \mathbb { P } \mathrm { L } . \mathsf { F R E } \mathrm { F } r ) ) } \\ & { = \mathsf { - } \mathsf { r } \vee ( \mathsf { - } s \vee ( \mathsf { - } ( ( \Pi \mathbb { P } \mathrm { L } . \mathsf { F R E } \mathrm { E } \mathrm { f } ) \wedge ( \Pi \mathbb { P } \mathrm { L } . \mathsf { F R E } \mathrm { E } ) ) \vee \Pi \mathbb { P } \mathrm { L } . \mathsf { F R E } \mathrm { E } \mathrm { F } r ) ) } \\ & { = \mathsf { - } \mathsf { r } \vee ( \mathsf { - } s \vee ( \mathsf { - } ( t \wedge ( \Pi \mathbb { P } \mathrm { L } . \mathsf { F R E } \mathrm { s } ) \vee ( \Pi \mathbb { P } \mathrm { L } . \mathsf { F R E } \mathrm { E } ) ) ) } \\ & { = \mathsf { - } \mathsf { r } \vee ( \mathsf { - } s \vee ( \mathsf { - } ( t \wedge \mathsf { s } ) ) \vee ( \Pi \mathbb { P } \mathrm { L } . \mathsf { F R E } \mathrm { F } \mathrm { F } ) ) } \\ & { = \mathsf { - } \mathsf { r } \vee ( \mathsf { - } s \vee ( \mathsf { - } ( t \wedge s ) ) \vee ( \Pi \mathbb { P } \mathrm { L } . \mathsf { F R E } \mathrm { F } \mathrm { F } ) ) } \\ & { = \mathsf { - } \mathsf { r } \vee ( \mathsf { - } s \vee ( \mathsf { - } ( t \wedge s ) ) \vee \mathsf { r } ) } \end{array}
$$

$$
\begin{array} { r l } & { \mathbf { j } = \mathbf { B } \mathbf { B } \mathbf { f } ( \mathbf { \Psi } \times \nabla ( \cdot ( \cdot ( \cdot \boldsymbol { A } \cdot \delta ) \nabla v ) )  } \\ & {  = ( \cdot ( \cdot \boldsymbol { \mathfrak { a } } \mathbf { N } \cdot \mathbf { \Psi } ) \cdot \mathbf { \Psi } ) \cdot \mathbf { \Psi } ( \mathbf { \Psi } \cdot ( \cdot ( \cdot \boldsymbol { A } \cdot \delta ) \nabla v ) ) } \\ & {  = \mathbf { \Psi } \cdot \nabla \cdot \Phi \mathbf { \Psi } ) \cdot ( \mathbf { \Psi } \cdot \nabla \cdot ( \cdot \boldsymbol { A } \cdot \mathbf { \Psi } ) \times \mathbf { \Psi } ) } \\ & {  = \mathbf { \Psi } \cdot \nabla \cdot ( \cdot \mathbf { \Psi } ) \cdot \nabla \cdot \mathbf { \Psi } | \cdot \mathbf { \Psi } ( \cdot ( \cdot \boldsymbol { A } \cdot \mathbf { \Psi } ) \times \mathbf { \Psi } ) } \\ & {  = - \mathbf { \Psi } \cdot ( \cdot \mathbf { \Psi } \cdot \nabla \cdot \nabla \cdot \mathbf { \Psi } ) \cdot ( \cdot \cdot ( \cdot \boldsymbol { A } \cdot \delta ) \nabla v ) \cdot \mathbf { \Psi } ) } \\ & {  = - \mathbf { \Psi } \cdot ( \cdot \mathbf { \Psi } \cdot \nabla \cdot \nabla \cdot ( \cdot ( \cdot \boldsymbol { A } \cdot \delta ) \nabla v ) ) } \\ & {  = - \mathbf { \Psi } \cdot ( \cdot \mathbf { \Psi } \cdot \nabla \cdot ( \cdot ( \cdot \cdot \boldsymbol { A } \cdot \delta ) \nabla v ) \cdot \nabla \cdot \mathbf { \Psi } ) ) } \\ & {  = - \mathbf { \Psi } \cdot ( \cdot \mathbf { \Psi } \cdot \nabla \cdot ( \cdot \cdot \boldsymbol { \Psi } \cdot \nabla \cdot \mathbf { \Psi } ) \cdot \nabla \cdot \mathbf { \Psi } ) \cdot \nabla \cdot \mathbf { \Psi } | \cdot \mathbf { \Psi } \cdot \mathbf { \Psi } \cdot \mathbf { \Psi } ) } \\ & {  = - \mathbf { \Psi } \cdot ( \cdot \mathbf { \Psi } \cdot \nabla \cdot ( \cdot \mathbf { \Psi } \cdot ( \cdot \cdot \boldsymbol { \Psi } ) \cdot \nabla \cdot \mathbf { \Psi } ) \cdot \nabla \cdot \mathbf { \Psi } ) \cdot \nabla \cdot \mathbf { \Psi } | \cdot \mathbf { \Psi } \cdot \mathbf { \Psi } ) } \\ &   = - \mathbf { \Psi } \cdot \nabla \cdot  \end{array}
$$

where the latter is already in CNF and valid as $r$ has a matching $\neg r$ .

# 1.5.3 Horn clauses and satisfiability

We have already commented on the computational price we pay for transforming a propositional logic formula into an equivalent CNF. The latter class of formulas has an easy syntactic check for validity, but its test for satisfiability is very hard in general. Fortunately, there are practically important subclasses of formulas which have much more efficient ways of deciding their satisfiability. One such example is the class of Horn formulas; the name ‘Horn’ is derived from the logician A. Horn’s last name. We shortly define them and give an algorithm for checking their satisfiability.

Recall that the logical constants $\perp$ (‘bottom’) and $\top$ (‘top’) denote an unsatisfiable formula, respectively, a tautology.

Definition 1.46 A Horn formula is a formula $\phi$ of propositional logic if it can be generated as an instance of $H$ in this grammar:

$$
\begin{array} { r l } & { P \mathrel { \mathop : } = \bot \ P \ \vdash \ | \ P \ } \\ & { A \mathrel { \mathop : } = P \ | \ P \land A } \\ & { C \mathrel { \mathop : } = A \to P } \\ & { H \mathrel { \mathop : } = C \ | \ C \land H . } \end{array}
$$

We call each instance of $C$ a Horn clause.

Horn formulas are conjunctions of Horn clauses. A Horn clause is an implication whose assumption $A$ is a conjunction of propositions of type $P$ and whose conclusion is also of type $P$ . Examples of Horn formulas are

$$
\begin{array} { r l } & { ( p \wedge q \wedge s \to p ) \wedge ( q \wedge r \to p ) \wedge ( p \wedge s \to s ) } \\ & { ( p \wedge q \wedge s \to \perp ) \wedge ( q \wedge r \to p ) \wedge ( \mathsf { T } \to s ) } \\ & { ( p _ { 2 } \wedge p _ { 3 } \wedge p _ { 5 } \to p _ { 1 3 } ) \wedge ( \mathsf { T } \to p _ { 5 } ) \wedge ( p _ { 5 } \wedge p _ { 1 1 } \to \perp ) . } \end{array}
$$

Examples of formulas which are not Horn formulas are

$$
\begin{array} { r l } & { ( p \wedge q \wedge s \to \neg p ) \wedge ( q \wedge r \to p ) \wedge ( p \wedge s \to s ) } \\ & { ( p \wedge q \wedge s \to \bot ) \wedge ( \neg q \wedge r \to p ) \wedge ( \top \to s ) } \\ & { ( p _ { 2 } \wedge p _ { 3 } \wedge p _ { 5 } \to p _ { 1 3 } \wedge p _ { 2 7 } ) \wedge ( \top \to p _ { 5 } ) \wedge ( p _ { 5 } \wedge p _ { 1 1 } \to \bot ) } \\ & { ( p _ { 2 } \wedge p _ { 3 } \wedge p _ { 5 } \to p _ { 1 3 } \wedge p _ { 2 7 } ) \wedge ( \top \to p _ { 5 } ) \wedge ( p _ { 5 } \wedge p _ { 1 1 } \vee \bot ) . } \end{array}
$$

The first formula is not a Horn formula since $\neg p$ , the conclusion of the implication of the first conjunct, is not of type $P$ . The second formula does not qualify since the premise of the implication of the second conjunct, $\neg q \land r$ , is not a conjunction of atoms, $\perp$ , or $\top$ . The third formula is not a Horn formula since the conclusion of the implication of the first conjunct, $p _ { 1 3 } \wedge p _ { 2 7 }$ , is not of type $P$ . The fourth formula clearly is not a Horn formula since it is not a conjunction of implications.

The algorithm we propose for deciding the satisfiability of a Horn formula $\phi$ maintains a list of all occurrences of type $P$ in $\phi$ and proceeds like this:

1. It marks $\top$ if it occurs in that list.   
2. If there is a conjunct $P _ { 1 } \wedge P _ { 2 } \wedge \cdots \wedge P _ { k _ { i } } \longrightarrow P ^ { \prime }$ of $\phi$ such that all $P _ { j }$ with $1 \le j \le$ $k _ { i }$ are marked, mark $P ^ { \prime }$ as well and go to 2. Otherwise ( $=$ there is no conjunct $P _ { 1 } \wedge P _ { 2 } \wedge \cdots \wedge P _ { k _ { i } } \longrightarrow P ^ { \prime }$ such that all $P _ { j }$ are marked) go to 3.   
3. If $\perp$ is marked, print out ‘The Horn formula $\phi$ is unsatisfiable.’ and stop. Otherwise, go to 4.   
4. Print out ‘The Horn formula $\phi$ is satisfiable.’ and stop.

In these instructions, the markings of formulas are shared by all other occurrences of these formulas in the Horn formula. For example, once we mark $p _ { 2 }$ because of one of the criteria above, then all other occurrences of $p _ { 2 }$ are marked as well. We use pseudo code to specify this algorithm formally:

function HORN $\left( \phi \right)$ :   
$/ ^ { * }$ precondition: $\phi$ is a Horn formula $^ * /$   
$/ ^ { * }$ postcondition: HORN $\left( \phi \right)$ decides the satisfiability for $\phi ^ { * } /$   
begin function mark all occurrences of $\top$ in $\phi$ ; while there is a conjunct $P _ { 1 } \wedge P _ { 2 } \wedge \cdots \wedge P _ { k _ { i } } \longrightarrow P ^ { \prime }$ of $\phi$ such that all $P _ { j }$ are marked but $P ^ { \prime }$ isn’t do mark $P ^ { \prime }$ end while if $\perp$ is marked then return ‘unsatisfiable’ else return ‘   
end function

We need to make sure that this algorithm terminates on all Horn formulas $\phi$ as input and that its output ( $=$ its decision) is always correct.

Theorem 1.47 The algorithm HORN is correct for the satisfiability decision problem of Horn formulas and has no more than $n + 1$ cycles in its whilestatement if n is the number of atoms in $\phi$ . In particular, HORN always terminates on correct input.

Proof: Let us first consider the question of program termination. Notice that entering the body of the while-statement has the effect of marking an unmarked $P$ which is not . Since this marking applies to all occurrences of $P$ in $\phi$ , the while-statement can have at most one more cycle than there are atoms in $\phi$ .

Since we guaranteed termination, it suffices to show that the answers given by the algorithm HORN are always correct. To that end, it helps to reveal the functional role of those markings. Essentially, marking a $P$ means that that $P$ has got to be true if the formula $\phi$ is ever going to be satisfiable. We use mathematical induction to show that

‘All marked $P$ are true for all valuations in which $\phi$ evaluates to T.’ holds after any number of executions of the body of the while-statement above. The base case, zero executions, is when the while-statement has not yet been entered but we already and only marked all occurrences of $\top$ . Since must be true in all valuations, (1.8) follows.

In the inductive step, we assume that (1.8) holds after $k$ cycles of the while-statement. Then we need to show that same assertion for all marked $P$ after $k + 1$ cycles. If we enter the $( k + 1 ) \mathrm { t h }$ cycle, the condition of the while-statement is certainly true. Thus, there exists a conjunct $P _ { 1 } \land P _ { 2 } \land$ $\cdots \wedge P _ { k _ { i } } \to P ^ { \prime }$ of $\phi$ such that all $P _ { j }$ are marked. Let $v$ be any valuation in which $\phi$ is true. By our induction hypothesis, we know that all $P _ { j }$ and therefore $P _ { 1 } \wedge P _ { 2 } \wedge \cdots \wedge P _ { k _ { i } }$ have to be true in $v$ as well. The conjunct $P _ { 1 } \wedge$ $P _ { 2 } \wedge \cdot \cdot \cdot \wedge P _ { k _ { i } } \to P ^ { \prime }$ of $\phi$ has be to true in $v$ , too, from which we infer that $P ^ { \prime }$ has to be true in $v$ .

By mathematical induction, we therefore secured that (1.8) holds no matter how many cycles that while-statement went through.

Finally, we need to make sure that the if-statement above always renders correct replies. First, if $\perp$ is marked, then there has to be some conjunct $P _ { 1 } \land P _ { 2 } \land \dots \land P _ { k _ { i } } \to \bot$ of $\phi$ such that all $P _ { i }$ are marked as well. By (1.8) that conjunct of $\phi$ evaluates to $\mathbf { T } \longrightarrow \mathbf { F } = \mathbf { F }$ whenever $\phi$ is true. As this is impossible the reply ‘unsatisfiable’ is correct. Second, if $\perp$ is not marked, we simply assign T to all marked atoms and $\mathtt { F }$ to all unmarked atoms and use proof by contradiction to show that $\phi$ has to be true with respect to that valuation.

If $\phi$ is not true under that valuation, it must make one of its principal conjuncts $P _ { 1 } \wedge P _ { 2 } \wedge \cdots \wedge P _ { k _ { i } } \longrightarrow P ^ { \prime }$ false. By the semantics of implication this can only mean that all $P _ { j }$ are true and $P ^ { \prime }$ is false. By the definition of our valuation, we then infer that all $P _ { j }$ are marked, so $P _ { 1 } \wedge P _ { 2 } \wedge \cdots \wedge P _ { k _ { i } } \longrightarrow P ^ { \prime }$ is a conjunct of $\phi$ that would have been dealt with in one of the cycles of the while-statement and so $P ^ { \prime }$ is marked, too. Since $\perp$ is not marked, $P ^ { \prime }$ has to be $\top$ or some atom $q$ . In any event, the conjunct is then true by (1.8), a contradiction ✷

Note that the proof by contradiction employed in the last proof was not really needed. It just made the argument seem more natural to us. The literature is full of such examples where one uses proof by contradiction more out of psychological than proof-theoretical necessity.

# 1.6 SAT solvers

The marking algorithm for Horn formulas computes marks as constraints on all valuations that can make a formule true. By (1.8), all marked atoms have to be true for any such valuation. We can extend this idea to general formulas $\phi$ by computing constraints saying which subformulas of $\phi$ require a certain truth value for all valuations that make $\phi$ true:

‘All marked subformulas evaluate to their mark value for all valuations in which $\phi$ evaluates to T.’

In that way, marking atomic formulas generalizes to marking subformulas; and ‘true’ marks generalize into ‘true’ and ‘false’ marks. At the same time, (1.9) serves as a guide for designing an algorithm and as an invariant for proving its correctness.

# 1.6.1 A linear solver

We will execute this marking algorithm on the parse tree of formulas, except that we will translate formulas into the adequate fragment

$$
\phi : : = p | ( \neg \phi ) | ( \phi \land \phi )
$$

and then share common subformulas of the resulting parse tree, making the tree into a directed, acyclic graph (DAG). The inductively defined translation

$$
\begin{array} { l l } { { T ( p ) = p } } & { { T ( \neg \phi ) = \neg T ( \phi ) } } \\ { { T ( \phi _ { 1 } \wedge \phi _ { 2 } ) = T ( \phi _ { 1 } ) \wedge T ( \phi _ { 2 } ) } } & { { T ( \phi _ { 1 } \vee \phi _ { 2 } ) = \neg ( \neg T ( \phi _ { 1 } ) \wedge \neg T ( \phi _ { 2 } ) ) } } \\ { { T ( \phi _ { 1 } \to \phi _ { 2 } ) = \neg ( T ( \phi _ { 1 } ) \wedge \neg T ( \phi _ { 2 } ) ) } } & { { } } \end{array}
$$

transforms formulas generated by (1.3) into formulas generated by (1.10) such that $\phi$ and $T ( \phi )$ are semantically equivalent and have the same propositional atoms. Therefore, $\phi$ is satisfiable iff $T ( \phi )$ is satisfiable; and the set of valuations for which $\phi$ is true equals the set of valuations for which $T ( \phi )$ is true. The latter ensures that the diagnostics of a SAT solver, applied to $T ( \phi )$ , is meaningful for the original formula $\phi$ . In the exercises, you are asked to prove these claims.

Example 1.48 For the formula $\phi$ being $p \wedge \neg ( q \vee \neg p )$ we compute $T ( \phi ) =$ $p \land \neg \neg ( \neg q \land \neg \neg p )$ . The parse tree and DAG of $T ( \phi )$ are depicted in Figure 1.12.

Any valuation that makes $p \land \neg \neg ( \neg q \land \neg \neg p )$ true has to assign T to the topmost $\wedge$ -node in its DAG of Figure 1.12. But that forces the mark T on the $p$ -node and the topmost $\neg$ -node. In the same manner, we arrive at a complete set of constraints in Figure 1.13, where the time stamps ‘1:’ etc indicate the order in which we applied our intuitive reasoning about these constraints; this order is generally not unique.

The formal set of rules for forcing new constraints from old ones is depicted in Figure 1.14. A small circle indicates any node (¬, ∧ or atom). The force laws for negation, $\neg _ { \mathrm { t } }$ and $\neg \mathrm { f }$ , indicate that a truth constraint on a $\neg$ -node forces its dual value at its sub-node and vice versa. The law $\wedge _ { \mathrm { t e } }$ propagates a T constraint on a -node to its two sub-nodes; dually, $\wedge _ { \mathrm { t i } }$ forces a T mark on a $\wedge$ -node if both its children have that mark. The laws $\wedge _ { \mathrm { { f } } }$ and $\wedge _ { \mathrm { f r } }$ force a $\boldsymbol { \mathrm { F } }$ constraint on a $\wedge$ -node if any of its sub-nodes has a $\mathtt { F }$ value. The laws $\wedge _ { \mathrm { f l l } }$ and $\wedge _ { \mathrm { f r r } }$ are more complex: if an $\wedge$ -node has a $\mathtt { F }$ constraint and one of its sub-nodes has a T constraint, then the other sub-node obtains a F-constraint. Please check that all constraints depicted in Figure 1.13 are derivable from these rules. The fact that each node in a DAG obtained a forced marking does not yet show that this is a witness to the satisfiability of the formula

![](images/a6bf0ae9e29d9dbcde997b1efae0db12e729b3b1821a6c1af57b48e6d0516d12.jpg)  
Figure 1.12. Parse tree (left) and directed acyclic graph (right) of the formula from Example 1.48. The $p$ -node is shared on the right.

![](images/a231e9f92ca9df90422ce3cc45896cc60e13183317f1e9193ed64cd56d14de42.jpg)  
Figure 1.13. A witness to the satisfiability of the formula represented by this DAG.

![](images/ca452842007a46b5adcd80926a6c1d249e3e306db5397bba8fa78b99c8732feb.jpg)  
true conjunctions force true conjunction

true conjunction forces true conjuncts

![](images/aaa96d91d670790181143bcf4530d2784240ecc996975007050cfccb6d42a705.jpg)  
Figure 1.14. Rules for flow of constraints in a formula’s DAG. Small circles indicate arbitrary nodes $( \neg , \land$ or atom). Note that the rules $\land \mathrm { { ‰ } }$ $\wedge _ { \mathrm { f r r } }$ and $\wedge _ { \mathrm { t i } }$ require that the source constraints of both $\Longrightarrow$ are present.

represented by this DAG. A post-processing phase takes the marks for all atoms and re-computes marks of all other nodes in a bottom-up manner, as done in Section 1.4 on parse trees. Only if the resulting marks match the ones we computed have we found a witness. Please verify that this is the case in Figure 1.13.

We can apply SAT solvers to checking whether sequents are valid. For example, the sequent $p \wedge q \longrightarrow r \vdash p \longrightarrow q \longrightarrow r$ is valid iff $( p \land q \to r ) \to p \to$ $q \longrightarrow r$ is a theorem (why?) iff $\phi = \neg ( ( p \land q  r )  p \to q \to r )$ ) is not satisfiable. The DAG of $T ( \phi )$ is depicted in Figure 1.15. The annotations $^ { 6 6 } 1 ^ { \mathfrak { p } }$ etc indicate which nodes represent which sub-formulas. Notice that such DAGs may be constructed by applying the translation clauses for $T$ to sub-formulas in a bottom-up manner – sharing equal subgraphs were applicable.

The findings of our SAT solver can be seen in Figure 1.16. The solver concludes that the indicated node requires the marks T and F for (1.9) to be met. Such contradictory constraints therefore imply that all formulas $T ( \phi )$ whose DAG equals that of this figure are not satisfiable. In particular, all such $\phi$ are unsatisfiable. This SAT solver has a linear running time in the size of the DAG for $T ( \phi )$ . Since that size is a linear function of the length of $\phi$ – the translation $T$ causes only a linear blow-up – our SAT solver has a linear running time in the length of the formula. This linearity came with a price: our linear solver fails for all formulas of the form $\lnot ( \phi _ { 1 } \land \phi _ { 2 } )$ .

![](images/80be755c45ba9efeef6a2ad9529dd835a768ba3c88c720f61ebaaa7fc97f781e.jpg)  
Figure 1.15. The DAG for the translation of $\neg ( ( p \land q \to r ) \to p \to q \to$ $r$ ). Labels ‘‘1’’ etc indicate which nodes represent what subformulas.

# 1.6.2 A cubic solver

When we applied our linear SAT solver, we saw two possible outcomes: we either detected contradictory constraints, meaning that no formula represented by the DAG is satisfiable (e.g. Fig. 1.16); or we managed to force consistent constraints on all nodes, in which case all formulas represented by this DAG are satisfiable with those constraints as a witness (e.g. Fig. 1.13). Unfortunately, there is a third possibility: all forced constraints are consistent with each other, but not all nodes are constrained! We already remarked that this occurs for formulas of the form $\neg ( \phi _ { 1 } \land \phi _ { 2 } )$ .

![](images/073fdaa9bd2f1a62703aef74efee7958385b0e0a866eae800562f9cd5c9e6f48.jpg)  
Figure 1.16. The forcing rules, applied to the DAG of Figure 1.15, detect contradictory constraints at the indicated node – implying that the initial constraint ‘1:T’ cannot be realized. Thus, formulas represented by this DAG are not satisfiable.

Recall that checking validity of formulas in CNF is very easy. We already hinted at the fact that checking satisfiability of formulas in CNF is hard. To illustrate, consider the formula

$$
( ( p \vee ( q \vee r ) ) \wedge ( ( p \vee \neg q ) \wedge ( ( q \vee \neg r ) \wedge ( ( r \vee \neg p ) \wedge ( \neg p \vee ( \neg q \vee \neg r ) ) ) ) ) )
$$

in CNF – based on Example 4.2, page 77, in [Pap94]. Intuitively, this formula should not be satisfiable. The first and last clause in (1.11) ‘say’ that at least one of $p , \ q$ , and $r$ are false and true (respectively). The remaining three clauses, in their conjunction, ‘say’ that $p$ , $q$ , and $r$ all have the same truth value. This cannot be satisfiable, and a good SAT solver should discover this without any user intervention. Unfortunately, our linear SAT solver can neither detect inconsistent constraints nor compute constraints for all nodes. Figure 1.17 depicts the DAG for $T ( \phi )$ , where $\phi$ is as in (1.11); and reveals that our SAT solver got stuck: no inconsistent constraints were found and not all nodes obtained constraints; in particular, no atom received a mark! So how can we improve this analysis? Well, we can mimic the role of LEM to improve the precision of our SAT solver. For the DAG with marks as in Figure 1.17, pick any node $n$ that is not yet marked. Then test node $n$ by making two independent computations:

![](images/6ae0904fb17993dd8d3a42564cec625db56acfc04e2fc915ed10b18d26f3f7bd.jpg)  
Figure 1.17. The DAG for the translation of the formula in (1.11). It has a $\wedge$ -spine of length 4 as it is a conjunction of five clauses. Its linear analysis gets stuck: all forced constraints are consistent with each other but several nodes, including all atoms, are unconstrained.

1. determine which temporary marks are forced by adding to the marks in Figure 1.17 the T mark only to $_ { n }$ ; and   
2. determine which temporary marks are forced by adding, again to the marks in Figure 1.17, the F mark only to $_ { n }$ .

![](images/daef02c56abf18379cbf18418758c8e7178401c2f97dde39d186f15f250aa035.jpg)  
Figure 1.18. Marking an unmarked node with T and exploring what new constraints would follow from this. The analysis shows that this test marking causes contradictory constraints. We use lowercase letters ‘a:’ etc to denote temporary marks.

If both runs find contradictory constraints, the algorithm stops and reports that $T ( \phi )$ is unsatisfiable. Otherwise, all nodes that received the same mark in both of these runs receive that very mark as a permanent one; that is, we update the mark state of Figure 1.17 with all such shared marks.

We test any further unmarked nodes in the same manner until we either find contradictory permanent marks, a complete witness to satisfiability (all nodes have consistent marks), or we have tested all currently unmarked nodes in this manner without detecting any shared marks. Only in the latter case does the analysis terminate without knowing whether the formulas represented by that DAG are satisfiable.

Example 1.49 We revisit our stuck analysis of Figure 1.17. We test a ¬- node and explore the consequences of setting that $\lnot$ -node’s mark to T; Figure 1.18 shows the result of that analysis. Dually, Figure 1.19 tests the consequences of setting that $\neg \cdot$ -node’s mark to F. Since both runs reveal a contradiction, the algorithm terminates, ruling that the formula in (1.11) is not satisfiable.

In the exercises, you are asked to show that the specification of our cubic SAT solver is sound. Its running time is indeed cubic in the size of the DAG (and the length of original formula). One factor stems from the linear SAT solver used in each test run. A second factor is introduced since each unmarked node has to be tested. The third factor is needed since each new permanent mark causes all unmarked nodes to be tested again.

![](images/0064cd5c488c856680a860864da11bd07059c538678b24b28a04eb55e1bdda6a.jpg)  
Figure 1.19. Marking the same unmarked node with $\mathtt { F }$ and exploring what new constraints would follow from this. The analysis shows that this test marking also causes contradictory constraints.

![](images/9d04f300f118f6dc2f2ae012ce0a46c74402f591de7956c5bfac2dda8388f54d.jpg)  
Figure 1.20. Testing the indicated node with $\mathrm { T }$ causes contradictory constraints, so we may mark that node with $\mathtt { F }$ permanently. However, our algorithm does not seem to be able to decide satisfiability of this DAG even with that optimization.

We deliberately under-specified our cubic SAT solver, but any implementation or optimization decisions need to secure soundness of the analysis. All replies of the form

1. ‘The input formula is not satisfiable’ and   
2. ‘The input formula is satisfiable under the following valuation . . . ’

have to be correct. The third form of reply ‘Sorry, I could not figure this one out.’ is correct by definition. :-) We briefly discuss two sound modifications to the algorithm that introduce some overhead, but may cause the algorithm to decide many more instances. Consider the state of a DAG right after we have explored consequences of a temporary mark on a test node.

1. If that state – permanent plus temporary markings – contains contradictory constraints, we can erase all temporary marks and mark the test node permanently with the dual mark of its test. That is, if marking node $n$ with $v$ resulted in a contradiction, it will get a permanent mark $\overline { { v } }$ , where ${ \overline { { \boldsymbol { \mathsf { T } } } } } = { \boldsymbol { \mathsf { F } } }$ and $\overline { { \mathsf { F } } } = \mathrm { T }$ ; otherwise   
2. if that state managed to mark all nodes with consistent constraints, we report these markings as a witness of satisfiability and terminate the algorithm.

If none of these cases apply, we proceed as specified: promote shared marks of the two test runs to permanent ones, if applicable.

Example 1.50 To see how one of these optimizations may make a difference, consider the DAG in Figure 1.20. If we test the indicated node with

T, contradictory constraints arise. Since any witness of satisfiability has to assign some value to that node, we infer that it cannot be T. Thus, we may permanently assign mark F to that node. For this DAG, such an optimization does not seem to help. No test of an unmarked node detects a shared mark or a shared contradiction. Our cubic SAT solver fails for this DAG.

# 1.7 Exercises

# Exercises 1.1

1. Use $\neg$ , $\longrightarrow$ , $\wedge$ and ∨ to express the following declarative sentences in propositional logic; in each case state what your respective propositional atoms $p$ , $q$ , etc. mean:

(a)\* If the sun shines today, then it won’t shine tomorrow. (b) Robert was jealous of Yvonne, or he was not in a good mood. (c) If the barometer falls, then either it will rain or it will snow.   
(d)\* If a request occurs, then either it will eventually be acknowledged, or the requesting process won’t ever be able to make progress. (e) Cancer will not be cured unless its cause is determined and a new drug for cancer is found. (f) If interest rates go up, share prices go down. (g) If Smith has installed central heating, then he has sold his car or he has not paid his mortgage.   
(h)\* Today it will rain or shine, but not both.   
(i)\* If Dick met Jane yesterday, they had a cup of coffee together, or they took a walk in the park. (j) No shoes, no shirt, no service. (k) My sister wants a black and white cat.

2. The formulas of propositional logic below implicitly assume the binding priorities of the logical connectives put forward in Convention 1.3. Make sure that you fully understand those conventions by reinserting as many brackets as possible. For example, given $p \land q  r$ , change it to $( p \land q ) \to r$ since $\wedge$ binds more tightly than $\longrightarrow$ .

(a)\* $\neg p \land q  r$ (b) $( p \to q ) \land \neg ( r \lor p \to q )$   
(c)\* $( p \to q ) \to ( r \to s \lor t )$ (d) $p \vee ( \neg q  p \wedge r )$   
(e)\* $p \vee q \longrightarrow \neg p \wedge r$ (f) $p \vee p  \neg q$   
(g)\* Why is the expression $p \vee q \wedge r$ problematic?

# Exercises 1.2

1. Prove the validity of the following sequents:

(a) $( p \wedge q ) \wedge r , s \wedge t \vdash q \wedge s$

(b) $p \wedge q \vdash q \wedge p$ (c)\* $( p \wedge q ) \wedge r \vdash p \wedge ( q \wedge r )$ (d) $p \to ( p \to q ) , p \vdash q$ (e)\* $q \to ( p \to r ) , \neg r , q \vdash \neg p$ (f)\*  (p ∧ q) → p (g) $p \vdash q  ( p \land q )$ (h)\* $p \vdash ( p  q )  q$ (i)\* $( p \to r ) \land ( q \to r ) \vdash p \land q \to r$ \* (j) $q \to r \vdash ( p \to q ) \to ( p \to r )$ (k) $p \to ( q \to r ) , p \to q \vdash p \to r$ (l)\* $p \to q , r \to s \vdash p \lor r \to q \lor s$ (m) $p \vee q \vdash r  ( p \vee q ) \wedge r$ (n)\* $( p \lor ( q \to p ) ) \land q \vdash p$ (o)\* $p \longrightarrow q$ , $r \to s \vdash p \land r \to q \land s$ (p) $p \to q \vdash ( ( p \land q ) \to p ) \land ( p \to ( p \land q ) )$ (q) $\vdash q  ( p  ( p  ( q  p ) ) )$ ) \* (r) $p \to q \land r \vdash ( p \to q ) \land ( p \to r )$ (s) $( p \to q ) \land ( p \to r ) \vdash p \to q \land r$ (t) $\vdash ( p  q )  ( ( r  s )  ( p \land r  q \land s ) )$ ); here you might be able to ‘recycle’ and augment a proof from a previous exercise. (u) $p \to q \vdash \lnot q \to \lnot p$ (v)\* $p \vee ( p \wedge q ) \vdash p$ (w) $r , p \to ( r \to q ) \vdash p \to ( q \land r )$ (x)\* $p \to ( q \lor r ) , q \to s , r \to s \vdash p \to s$ (y)\* $( p \wedge q ) \vee ( p \wedge r ) \vdash p \wedge ( q \vee r )$ .

2. For the sequents below, show which ones are valid and which ones aren’t:

(a)\* $\neg p \to \neg q \vdash q \to p$   
(b)\* $\neg p \lor \neg q \vdash \neg ( p \land q )$   
(c)\* ¬p, p ∨ q  q   
(d)\* $p \vee q , \neg q \vee r \vdash p \vee r$   
(e)\* $p \to ( q \lor r ) , \neg q , \neg r \vdash \neg p$ without using the MT rule (f)\* $\neg p \land \neg q \vdash \neg ( p \lor q )$   
(g)\* $p \wedge \neg p \vdash \neg ( r  q ) \wedge ( r  q )$   
(h) $p \to q , s \to t \vdash p \lor s \to q \land t$   
(i)\* $\neg ( \neg p \lor q ) \vdash p$ .

3. Prove the validity of the sequents below:

(a) $\neg p \to p \vdash p$   
(b) $\neg p \vdash p \to q$ (c) $p \lor q , \neg q \vdash p$   
(d)\* $\vdash \lnot p \to ( p \to ( p \to q ) )$   
(e) $\neg ( p \to q ) \vdash q \to p$ (f) $p \to q \vdash \lnot p \lor q$ (g) $\vdash \lnot p \lor q \to ( p \to q )$ (h) $p \to ( q \lor r )$ , $\neg q , \neg r \vdash \neg p$ (i) $( c \wedge n ) \to t , \ h \wedge \neg s , \ h \wedge \neg ( s \vee c ) \to p \vdash ( n \wedge \neg t ) \to p$ (j) the two sequents implict in (1.2) on page 20 (k) $q \vdash ( p \land q ) \lor ( \lnot p \land q )$ using LEM (l) $\neg ( p \wedge q ) \vdash \neg p \vee \neg q$   
(m) $p \land q \to r \vdash ( p \to r ) \lor ( q \to r )$   
(n)\* $p \wedge q \vdash \neg ( \neg p \vee \neg q )$ (o) $\neg ( \neg p \lor \neg q ) \vdash p \land q$ (p) $p \to q \vdash \lnot p \lor q$ possibly without using LEM?   
${ } ^ { * } \ ( \mathrm { q } ) \ \vdash \ ( p \to q ) \lor ( q \to r )$ using LEM (r) $p \longrightarrow q$ $, \neg p \to r , \neg q \to \neg r \vdash q$ (s) $p  q , \ r  \lnot t , \ q  r \vdash p  \lnot t$ (t) $( p \to q ) \to r , \ s \to \lnot p , \ t , \ \lnot s \wedge t \to q \vdash r$ (u) $( s \to p ) \lor ( t \to q ) \vdash ( s \to q ) \lor ( t \to p )$ (v) $( p \land q ) \to r , \ r \to s , \ q \land \lnot s \vdash \lnot p$ .

4. Explain why intuitionistic logicians also reject the proof rule PBC.

5. Prove the following theorems of propositional logic:

(a)\* $( ( p \to q ) \to q ) \to ( ( q \to p ) \to p )$ (b) Given a proof for the sequent of the previous item, do you now have a quick argument for $( ( q \to p ) \to p ) \to ( ( p \to q ) \to q ) ^ { \cdot }$ ? (c) $( ( p \to q ) \land ( q \to p ) ) \to ( ( p \lor q ) \to ( p \land q ) )$   
(d)\* $( p \to q ) \to ( ( \neg p \to q ) \to q$ ).

6. Natural deduction is not the only possible formal framework for proofs in propositional logic. As an abbreviation, we write $\Gamma$ to denote any finite sequence of formulas $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n }$ ( $n \geq 0$ ). Thus, any sequent may be written as $\Gamma \vdash \psi$ for an appropriate, possibly empty, $\Gamma$ . In this exercise we propose a different notion of proof, which states rules for transforming valid sequents into valid sequents. For example, if we have already a proof for the sequent $\Gamma , \phi \vdash \psi$ , then we obtain a proof of the sequent $\Gamma \vdash \phi  \psi$ by augmenting this very proof with one application of the rule $\longrightarrow$ i. The new approach expresses this as an inference rule between sequents:

$$
\frac { \Gamma , \phi \vdash \psi } { \Gamma \vdash \phi \to \psi }  \mathrm { i } .
$$

The rule ‘assumption’ is written as

$$
\overline { { \phi \vdash \phi } } ^ { \mathrm { ~ \mathrm { a s s u m p t i o n } } }
$$

i.e. the premise is empty. Such rules are called axioms.

(a) Express all remaining proof rules of Figure 1.2 in such a form. (Hint: some of your rules may have more than one premise.)   
(b) Explain why proofs of $\Gamma \vdash \psi$ in this new system have a tree-like structure with $\Gamma \vdash \psi$ as root.   
(c) Prove $p \vee ( p \wedge q ) \vdash p$ in your new proof system.

7. Show that $\sqrt { 2 }$ cannot be a rational number. Proceed by proof by contradiction: assume that $\sqrt { 2 }$ is a fraction $k / l$ with integers $k$ and $l \neq 0$ . On squaring both sides we get $2 = k ^ { 2 } / l ^ { 2 }$ , or equivalently $2 l ^ { 2 } = k ^ { 2 }$ . We may assume that any common 2 factors of $k$ and $l$ have been cancelled. Can you now argue that $2 l ^ { 2 }$ has a different number of 2 factors from $k ^ { 2 }$ ? Why would that be a contradiction and to what?

8. There is an alternative approach to treating negation. One could simply ban the operator $\neg$ from propositional logic and think of $\phi  \bot$ as ‘being’ $\lnot \phi$ . Naturally, such a logic cannot rely on the natural deduction rules for negation. Which of the rules $\neg \mathrm { i }$ , $\neg \mathrm { e }$ , $\neg \neg \mathrm { e }$ and $\neg \neg \mathrm { i }$ can you simulate with the remaining proof rules by letting $\lnot \phi$ be $\phi  \bot$ ?

9. Let us introduce a new connective $\phi  \psi$ which should abbreviate $\left( \phi \to \psi \right) \wedge$ ( $\psi  \phi \Biggr .$ ). Design introduction and elimination rules for $\longleftrightarrow$ and show that they are derived rules if $\phi  \psi$ is interpreted as $( \phi \to \psi ) \land ( \psi \to \phi )$ .

# Exercises 1.3

In order to facilitate reading these exercises we assume below the usual conventions about binding priorities agreed upon in Convention 1.3.

1. Given the following formulas, draw their corresponding parse tree:

(a) $p$   
(b)\* $p \wedge q$ (c) $p \wedge \neg q \longrightarrow \neg p$   
(d)\* $p \wedge ( \neg q \to \neg p )$ (e) $p \longrightarrow ( \neg q \lor ( q \to p ) )$ )   
(f)\* $\neg ( ( \neg q \land ( p \to r ) ) \land ( r \to q ) )$ ） (g) $\neg p \lor ( p \to q )$ (h) $( p \land q ) \to ( \neg r \lor ( q \to r ) )$ (i) $( ( s \lor ( \neg p ) ) \to ( \neg p ) )$ (j) $( s \vee ( ( \neg p ) \neg ( \neg p ) )$ ) (k) ( $( ( s \to ( r \vee l ) ) \vee ( ( \neg q ) \wedge r ) ) \to ( ( \neg ( p \to s ) ) \to r ) \qquad $ ) (l) $( p \to q ) \land ( \neg r \to ( q \lor ( \neg p \land r ) ) )$ .

2. For each formula below, list all its subformulas:

(a)\* $p \to ( \neg p \lor ( \neg \neg q \to ( p \land q ) ) )$ ) (b) $( s \to r \vee l ) \vee ( \neg q \wedge r ) \to ( \neg ( p \to s ) \to r )$ (c) $( p \to q ) \land ( \neg r \to ( q \lor ( \neg p \land r ) ) )$ .

3. Draw the parse tree of a formula $\phi$ of propositional logic which is

(a)\* a negation of an implication (b) a disjunction whose disjuncts are both conjunctions   
(c)\* a conjunction of conjunctions.

4. For each formula below, draw its parse tree and list all subformulas:

(a)\* $\neg ( s \to ( \neg ( p \to ( q \lor \neg s ) ) ) )$ ) (b) $( ( p \to \neg q ) \lor ( p \land r ) \to s ) \lor \neg r .$

![](images/184613a3e9438e69274e1d152fffb0d0e696bd4fd5a636249d7678c221366668.jpg)  
Figure 1.21. A tree that represents an ill-formed formula.

5.\* For the parse tree in Figure 1.22 find the logical formula it represents.

6. For the trees below, find their linear representations and check whether they correspond to well-formed formulas: (a) the tree in Figure 1.10 on page 44 (b) the tree in Figure 1.23.

7.\* Draw a parse tree that represents an ill-formed formula such that

(a) one can extend it by adding one or several subtrees to obtain a tree that represents a well-formed formula;   
(b) it is inherently ill-formed; i.e. any extension of it could not correspond to a well-formed formula.

8. Determine, by trying to draw parse trees, which of the following formulas are well-formed:

(a) $p \wedge \neg ( p \vee \neg q ) \neg ( r  s )$ (b) $p \wedge \neg ( p \vee q \wedge s ) \to ( r \longrightarrow s )$ (c) $p \wedge \neg ( p \vee \wedge s ) \longrightarrow ( r \longrightarrow s )$ .

Among the ill-formed formulas above which ones, and in how many ways, could you ‘fix’ by the insertion of brackets only?

# Exercises 1.4

1.\* Construct the truth table for $\neg p \lor q$ and verify that it coincides with the one for $p \longrightarrow q$ . (By ‘coincide’ we mean that the respective columns of $\mathrm { T }$ and $\mathbf { F }$ values are the same.)

2. Compute the complete truth table of the formula (a)\* $( ( p \to q ) \to p ) \to p$ (b) represented by the parse tree in Figure 1.3 on page 34 (c)\* $p \vee ( \neg ( q \wedge ( r  q ) ) )$ (d) $( p \land q ) \to ( p \lor q )$ (e) $( ( p \to \neg q ) \to \neg p ) \to q$ (f) $( p \to q ) \lor ( p \to \neg q )$ (g) $( ( p \to q ) \to p ) \to p$ (h) $( ( p \lor q ) \to r ) \to ( ( p \to r ) \lor ( q \to r ) )$ (i) $( p \to q ) \to ( \neg p \to \neg q )$ .

![](images/0d80a4d2881c6a5456fabe4e4778a5e0bac03b2ed7500eee411eed014e4ce014.jpg)  
Figure 1.22. A parse tree of a negated implication.

![](images/22eb33fc0a182d1a4aa24da5c9bee846e1dd626a912e711d0141954575fb3fab.jpg)  
Figure 1.23. Another parse tree of a negated implication.

3. Given a valuation and a parsetree of a formula, compute the truth value of the formula for that valuation (as done in a bottom-up fashion in Figure 1.7 on page 40) with the parse tree in

(a)\* Figure 1.10 on page 44 and the valuation in which $q$ and $r$ evaluate to T and $p$ to $\boldsymbol { \mathrm { F } }$ ; (b) Figure 1.4 on page 36 and the valuation in which $q$ evaluates to $\mathrm { T }$ and $p$ and $r$ evaluate to F; (c) Figure 1.23 where we let $p$ be $\mathrm { T }$ , $q$ be $\boldsymbol { \mathrm { F } }$ and $r$ be $\mathrm { T }$ ; and (d) Figure 1.23 where we let $p$ be $\boldsymbol { \mathrm { F } }$ , $q$ be $\mathrm { T }$ and $r$ be $\mathbf { F }$ .

4. Compute the truth value on the formula’s parse tree, or specify the corresponding line of a truth table where

$^ *$ (a) $p$ evaluates to $\boldsymbol { \mathrm { F } }$ , $q$ to $\mathrm { T }$ and the formula is $p \to ( \neg q \lor ( q \to p ) )$ $^ *$ (b) the formula is $\neg ( ( \neg q \land ( p \to r ) ) \land ( r \to q ) )$ , $p$ evaluates to $\mathbf { F }$ , $q$ to $\mathrm { T }$ and $r$ evaluates to T.

5.\* A formula is valid iff it computes T for all its valuations; it is satisfiable iff it computes T for at least one of its valuations. Is the formula of the parse tree in Figure 1.10 on page 44 valid? Is it satisfiable?

6. Let $^ *$ be a new logical connective such that $p \ast q$ does not hold iff $p$ and $q$ are either both false or both true. (a) Write down the truth table for $p \ast q$ . (b) Write down the truth table for $( p * p ) * ( q * q )$ . (c) Does the table in (b) coincide with a table in Figure 1.6 (page 38)? If so, which one? (d) Do you know $^ *$ already as a logic gate in circuit design? If so, what is it called?

7. These exercises let you practice proofs using mathematical induction. Make sure that you state your base case and inductive step clearly. You should also indicate where you apply the induction hypothesis.

(a) Prove that

$$
( 2 \cdot 1 - 1 ) + ( 2 \cdot 2 - 1 ) + ( 2 \cdot 3 - 1 ) + \cdot \cdot \cdot + ( 2 \cdot n - 1 ) = n ^ { 2 }
$$

by mathematical induction on $n \geq 1$ .

(b) Let $k$ and $l$ be natural numbers. We say that $k$ is divisible by $l$ if there exists a natural number $p$ such that $k = p \cdot l$ . For example, 15 is divisible by 3 because $1 5 = 5 \cdot 3$ . Use mathematical induction to show that $1 1 ^ { n } - 4 ^ { n }$ is divisible by 7 for all natural numbers $n \geq 1$ .

$^ *$ (c) Use mathematical induction to show that

$$
1 ^ { 2 } + 2 ^ { 2 } + 3 ^ { 2 } + \cdots + n ^ { 2 } = { \frac { n \cdot ( n + 1 ) \cdot ( 2 n + 1 ) } { 6 } }
$$

for all natural numbers $n \geq 1$ .

(d)\* Prove that $2 ^ { n } \geq n + 1 2$ for all natural numbers $n \geq 4$ . Here the base case is $n = 4$ . Is the statement true for any $n < 4$ ?

(e) Suppose a post office sells only $2 \phi$ and $3 \phi$ stamps. Show that any postage of $2 \phi$ , or over, can be paid for using only these stamps. Hint: use mathematical induction on $n$ , where $n \mathrm { { \ddag } }$ is the postage. In the inductive step consider two possibilities: first, $n \mathrm { { d } }$ can be paid for using only $2 \phi$ stamps. Second, paying $n \mathrm { \ddag }$ requires the use of at least one $3 \mathrm { { d } }$ stamp.

(f) Prove that for every prefix of a well-formed propositional logic formula the number of left brackets is greater or equal to the number of right brackets.

8.\* The Fibonacci numbers are most useful in modelling the growth of populations. We define them by $F _ { 1 } \ { \stackrel { \mathrm { d e f } } { = } } \ 1$ , $F _ { 2 } \ { \stackrel { \mathrm { d e f } } { = } } \ 1$ and $F _ { n + 1 } \stackrel { \mathrm { d e f } } { = } F _ { n } + F _ { n - 1 }$ for all $n \geq 2$ . So $F _ { 3 } \ { \stackrel { \mathrm { d e f } } { = } } \ F _ { 1 } + F _ { 2 } = 1 + 1 = 2$ etc. Show the assertion $\cdot F _ { 3 n }$ is even.’ by mathematical induction on $n \geq 1$ . Note that this assertion is saying that the sequence $F _ { 3 } , F _ { 6 } ^ { \mathrm { ~ } } , F _ { 9 } ^ { \mathrm { ~ } } , \ldots$ consists of even numbers only.

9. Consider the function rank, defined by

$$
\begin{array} { r l } & { \mathsf { r a n k } ( p ) \overset { \mathrm { d e f } } { = } 1 } \\ & { \mathsf { r a n k } ( \lnot \phi ) \overset { \mathrm { d e f } } { = } 1 + \mathsf { r a n k } ( \phi ) } \\ & { \mathsf { r a n k } ( \phi \circ \psi ) \overset { \mathrm { d e f } } { = } 1 + \operatorname* { m a x } ( \mathsf { r a n k } ( \phi ) , \mathsf { r a n k } ( \psi ) ) } \end{array}
$$

where $p$ is any atom, $\circ \in \{  , \lor , \land \}$ and $\operatorname* { m a x } ( n , m )$ is $n$ if $n \geq m$ and ${ m }$ otherwise. Recall the concept of the height of a formula (Definition 1.32 on page 44). Use mathematical induction on the height of $\phi$ to show that $\mathsf { r a n k } ( \phi )$ is nothing but the height of $\phi$ for all formulas $\phi$ of propositional logic.

$^ \ast 1 0$ . Here is an example of why we need to secure the base case for mathematical induction. Consider the assertion

‘The number $n ^ { 2 } + 5 n + 1$ is even for all $n \geq 1$ .’

(a) Prove the inductive step of that assertion.   
(b) Show that the base case fails to hold.   
(c) Conclude that the assertion is false.   
(d) Use mathematical induction to show that $n ^ { 2 } + 5 n + 1$ is odd for all $n \geq 1$ .

11. For the soundness proof of Theorem 1.35 on page 46,

(a) explain why we could not use mathematical induction but had to resort to course-of-values induction;   
(b) give justifications for all inferences that were annotated with ‘why?’ and   
(c) complete the case analysis ranging over the final proof rule applied; inspect the summary of natural deduction rules in Figure 1.2 on page 27 to see which cases are still missing. Do you need to include derived rules?

12. Show that the following sequents are not valid by finding a valuation in which the truth values of the formulas to the left of $\vdash$ are T and the truth value of the formula to the right of $\vdash$ is $\boldsymbol { \mathrm { F } }$ .

(a) $\neg p \lor ( q \to p ) \vdash \neg p \land q$ (b) $\neg r \to ( p \lor q ) , r \land \neg q \vdash r \to q$ (c)\* $p \to ( q \to r ) \vdash p \to ( r \to q )$ (d) $\neg p , p \lor q \vdash \neg q$ (e) $p \to ( \neg q \lor r ) , \neg r \vdash \neg q \to \neg p$ .

13. For each of the following invalid sequents, give examples of natural language declarative sentences for the atoms $p$ , $q$ and $r$ such that the premises are true, but the conclusion false.

$^ *$ (a) $p \vee q \vdash p \wedge q$   
(b)\* $\neg p \to \neg q \vdash \neg q \to \neg p$ (c) $p \to q \vdash p \lor q$ (d) $p \to ( q \lor r ) \vdash ( p \to q ) \land ( p \to r )$ .

14. Find a formula of propositional logic $\phi$ which contains only the atoms $p , \ q$ and $r$ and which is true only when $p$ and $q$ are false, or when $\neg q \land ( p \lor r )$ is true.

15. Use mathematical induction on $n$ to prove the theorem ( $( \phi _ { 1 } \wedge ( \phi _ { 2 } \wedge ( \cdot \cdot \cdot \wedge$ $\phi _ { n } ) \ldots )  \psi )  ( \phi _ { 1 }  ( \phi _ { 2 }  ( \ldots ( \phi _ { n }  \psi ) \ldots ) ) _ { \cal { L } }$ )).

16. Prove the validity of the following sequents needed to secure the completeness result for propositional logic:

(a) $\phi _ { 1 } \wedge \neg \phi _ { 2 } \vdash \neg ( \phi _ { 1 } \to \phi _ { 2 } )$   
(b) $\lnot \phi _ { 1 } \wedge \lnot \phi _ { 2 } \vdash \phi _ { 1 }  \phi _ { 2 }$   
(c) $\lnot \phi _ { 1 } \wedge \phi _ { 2 } \vdash \phi _ { 1 } \to \phi _ { 2 }$   
(d) $\phi _ { 1 } \wedge \phi _ { 2 } \vdash \phi _ { 1 } \to \phi _ { 2 }$   
(e) $\lnot \phi _ { 1 } \land \phi _ { 2 } \vdash \lnot ( \phi _ { 1 } \land \phi _ { 2 } )$   
(f) $\neg \phi _ { 1 } \land \neg \phi _ { 2 } \vdash \neg ( \phi _ { 1 } \land \phi _ { 2 } )$ $\phi _ { 1 } \wedge \neg \phi _ { 2 } \vdash \neg ( \phi _ { 1 } \wedge \phi _ { 2 } )$ $\neg \phi _ { 1 } \land \neg \phi _ { 2 } \vdash \neg ( \phi _ { 1 } \lor \phi _ { 2 } )$ $\phi _ { 1 } \wedge \phi _ { 2 } \vdash \phi _ { 1 } \lor \phi _ { 2 }$ $\neg \phi _ { 1 } \land \phi _ { 2 } \vdash \phi _ { 1 } \lor \phi _ { 2 }$   
(k) $\phi _ { 1 } \wedge \neg \phi _ { 2 } \vdash \phi _ { 1 } \lor \phi _ { 2 }$ .

17. Does $\models \phi$ hold for the $\phi$ below? Please justify your answer.

(a) $( p \to q ) \lor ( q \to r )$ (b)\* ( $( q \to ( p \lor ( q \to p ) ) ) \lor \neg ( p \to q ) ) \to p$ .

# Exercises 1.5

1. Show that a formula $\phi$ is valid iff ${ \mathsf { T } } \equiv \phi$ , where $\top$ is an abbreviation for an instance $p \lor \neg p$ of LEM.

2. Which of these formulas are semantically equivalent to $p \to ( q \lor r ) ^ { \cdot }$ ?

(a) $q \vee ( \neg p \vee r )$ (b)\* q ∧ ¬r → p (c) $p \wedge \neg r \to q$ (d)\* $\neg q \land \neg r  \neg p$

3. An adequate set of connectives for propositional logic is a set such that for every formula of propositional logic there is an equivalent formula with only connectives from that set. For example, the set $\{ \neg , \lor \}$ is adequate for propositional logic, because any occurrence of $\wedge$ and $\longrightarrow$ can be removed by using the equivalences $\phi \longrightarrow \psi \equiv \lnot \phi \vee \psi$ and $\phi \wedge \psi \equiv \neg ( \neg \phi \vee \neg \psi )$ .

(a) Show that $\{ \neg , \land \}$ , $\{ \neg , \to \}$ and $\{  , \bot \}$ are adequate sets of connectives for propositional logic. (In the latter case, we are treating $\perp$ as a nullary connective.)   
(b) Show that, if $C \subseteq \{ \neg , \land , \lor , \to , \bot \}$ is adequate for propositional logic, then $\lnot \in C$ or $\perp \in C$ . (Hint: suppose $C$ contains neither $\neg$ nor $\perp$ and consider the truth value of a formula $\phi$ , formed by using only the connectives in $C$ , for a valuation in which every atom is assigned T.)   
(c) Is $\{  , \neg \}$ adequate? Prove your answer.

4. Use soundness or completeness to show that a sequent $\phi _ { 1 } , \phi _ { 2 } , \ldots , \phi _ { n } \vdash \psi$ has a proof iff $\phi _ { 1 } \longrightarrow \phi _ { 2 } \longrightarrow \ldots \phi _ { n } \longrightarrow \psi$ is a tautology.

5. Show that the relation $\equiv$ is (a) reflexive: $\phi \equiv \phi$ holds for all $\phi$ (b) symmetric: $\phi \equiv \psi$ implies $\psi \equiv \phi$ and (c) transitive: $\phi \equiv \psi$ and $\psi \equiv \eta$ imply $\phi \equiv \eta$

6. Show that, with respect to ≡, (a) $\wedge$ and $\vee$ are idempotent: i. $\phi \wedge \phi \equiv \phi$ ii. $\phi \vee \phi \equiv \phi$

(b) $\wedge$ and $\vee$ are commutative: i. $\phi \wedge \psi \equiv \psi \wedge \phi$ ii. $\phi \lor \psi \equiv \psi \lor \phi$

(c) $\wedge$ and $\vee$ are associative: i. $\phi \wedge ( \psi \wedge \eta ) \equiv ( \phi \wedge \psi ) \wedge \eta$ ii. $\phi \lor ( \psi \lor \eta ) \equiv ( \phi \lor \psi ) \lor \eta$ (d) $\wedge$ and $\vee$ are absorptive: i.\* $\phi \wedge ( \phi \vee \eta ) \equiv \phi$ ii. $\phi \vee ( \phi \wedge \eta ) \equiv \phi$

(e) $\wedge$ and $\vee$ are distributive: i. $\phi \wedge ( \psi \vee \eta ) \equiv ( \phi \wedge \psi ) \vee ( \phi \wedge \eta )$ ii.\* $\phi \vee ( \psi \wedge \eta ) \equiv ( \phi \vee \psi ) \wedge ( \phi \vee \eta )$

$\mathbf { ( f ) \equiv } { } \equiv$ allows for double negation: $\phi \equiv \neg \neg \phi$ and (g) $\wedge$ and $\vee$ satisfies the de Morgan rules:

i. $\neg ( \phi \wedge \psi ) \equiv \neg \phi \vee \neg \psi$ ii.\* $\neg ( \phi \lor \psi ) \equiv \neg \phi \land \neg \psi$ .

7. Construct a formula in CNF based on each of the following truth tables: (a)\*

<table><tr><td>p</td><td>q</td><td>1</td></tr><tr><td>T</td><td>T</td><td>F</td></tr><tr><td>F</td><td>T</td><td>F</td></tr><tr><td>T</td><td>F</td><td>F</td></tr><tr><td>F</td><td>F</td><td>T</td></tr></table>

<table><tr><td>p</td><td>q</td><td>r</td><td>2</td></tr><tr><td>T</td><td>T</td><td></td><td>T</td></tr><tr><td>T</td><td></td><td></td><td></td></tr><tr><td>T</td><td></td><td></td><td></td></tr><tr><td>F</td><td></td><td></td><td></td></tr><tr><td>T</td><td></td><td></td><td></td></tr><tr><td>F</td><td></td><td></td><td></td></tr><tr><td>F</td><td>ＴＦＴＦＴＦＦ</td><td>ＴFＴＴFFＴF</td><td></td></tr><tr><td>F</td><td></td><td></td><td></td></tr><tr><td>r</td><td>S</td><td>q</td><td>3</td></tr><tr><td>T</td><td>T</td><td></td><td>F</td></tr><tr><td>T</td><td></td><td></td><td></td></tr><tr><td>T</td><td></td><td></td><td></td></tr><tr><td>F</td><td></td><td></td><td></td></tr><tr><td>T</td><td></td><td></td><td></td></tr><tr><td>F</td><td></td><td></td><td></td></tr><tr><td>F</td><td></td><td>ＴFＴＴFFＴF</td><td></td></tr><tr><td>F</td><td></td><td></td><td></td></tr></table>

8.\* Write a recursive function IMPL FREE which requires a (parse tree of a) propositional formula as input and produces an equivalent implication-free formula as output. How many clauses does your case statement need? Recall Definition 1.27 on page 32.

9.\* Compute CNF (NNF (IMPL FREE $\neg ( p \neg ( \neg ( q \land ( \neg p \to q ) ) ) ) )$ ).

10. Use structural induction on the grammar of formulas in CNF to show that the ‘otherwise’ case in calls to DISTR applies iff both $\eta _ { 1 }$ and $\eta _ { 2 }$ are of type $D$ in (1.6) on page 55.

11. Use mathematical induction on the height of $\phi$ to show that the call CNF (NNF (IMPL FREE $\phi$ )) returns, up to associativity, $\phi$ if the latter is already in CNF.

12. Why do the functions CNF and DISTR preserve NNF and why is this important?

13. For the call CNF (NNF (IMPL FREE $\big ( \phi \big )$ )) on a formula $\phi$ of propositional logic, explain why

(a) its output is always a formula in CNF (b) its output is semantically equivalent to $\phi$ (c) that call always terminates.

14. Show that all the algorithms presented in Section 1.5.2 terminate on any input meeting their precondition. Can you formalise some of your arguments? Note that algorithms might not call themselves again on formulas with smaller height. E.g. the call of $\mathsf { C N F } \left( \phi _ { 1 } \vee \phi _ { 2 } \right)$ results in a call DISTR $\big ( \mathrm { C N F } ( \phi _ { 1 } ) , \mathrm { C N F } ( \phi _ { 2 } ) \big )$ , where $\mathrm { C N F } ( \phi _ { i } )$ may have greater height than $\phi _ { i }$ . Why is this not a problem?

15. Apply algorithm HORN from page 66 to each of these Horn formulas:

(a)\* $( p \wedge q \wedge w \to \bot ) \wedge ( t \to \bot ) \wedge ( r \to p ) \wedge ( \top \to r ) \wedge ( \top \to q ) \wedge ( u \to \infty )$ $s ) \wedge ( \top  u )$ (b) $\begin{array} { r l } & { \begin{array} { r l } & { \bigl ( p \wedge q \wedge w \to \perp \bigr ) \wedge ( t \to \perp ) \wedge ( r \to p ) \wedge ( \mathsf { T } \to r ) \wedge ( \mathsf { T } \to q ) \wedge ( \mathsf { T } \wedge u \to \mathsf { I } ) } \\ & { w \wedge ( u \to s ) \wedge ( \mathsf { T } \to u ) } \\ & { \bigl ( p \wedge q \wedge s \to p \bigr ) \wedge ( q \wedge r \to p ) \wedge ( p \wedge s \to s ) } \end{array} } \\ & { \begin{array} { r l } & { \bigl ( p \wedge q \wedge s \to \perp \bigr ) \wedge ( q \wedge r \to p ) \wedge ( \mathsf { T } \to s ) } \\ & { \bigl ( p _ { 5 } \to p _ { 1 1 } \bigr ) \wedge ( p _ { 2 } \wedge p _ { 3 } \wedge p _ { 5 } \to p _ { 1 3 } \bigr ) \wedge ( \mathsf { T } \to p _ { 5 } ) \wedge ( p _ { 5 } \wedge p _ { 1 1 } \to \perp \bigr ) } \\ & { \bigl ( \top \to q \bigr ) \wedge ( \mathsf { T } \to s ) \wedge ( w \to \perp ) \wedge ( p \wedge q \wedge s \to \perp ) \wedge ( v \to s ) \wedge ( \mathsf { T } \to \mathsf { I } \to \mathsf { I } ) } \end{array} } \end{array}$ (c) (d) (e) (f) $r ) \wedge ( r \to p )$

(g)\* $( \top  q ) \wedge ( \top  s ) \wedge ( w  \bot ) \wedge ( p \wedge q \wedge s  v ) \wedge ( v  s ) \wedge ( \top  v )$ $r ) \wedge ( r \to p )$ .

16. Explain why the algorithm HORN fails to work correctly if we change the concept of Horn formulas by extending the clause for $P$ on page 65 to $P : : = \perp$ |  | $p \mid \neg p ?$

17. What can you say about the CNF of Horn formulas. More precisely, can you specify syntactic criteria for a CNF that ensure that there is an equivalent Horn formula? Can you describe informally programs which would translate from one form of representation into another?

# Exercises 1.6

1. Use mathematical induction to show that, for all $\phi$ of (1.3) on page 33,

(a) $T ( \phi )$ can be generated by (1.10) on page 69,   
(b) $T ( \phi )$ has the same set of valuations as $\phi$ , and   
(c) the set of valuations in which $\phi$ is true equals the set of valuations in which $T ( \phi )$ is true.

$^ \ast \mathrm { ~  ~ { ~ 2 ~ } ~ }$ . Show that all rules of Figure 1.14 (page 71) are sound: if all current marks satisfy the invariant (1.9) from page 68, then this invariant still holds if the derived constraint of that rule becomes an additional mark.

3. In Figure 1.16 on page 73 we detected a contradiction which secured the validity of the sequent $p \wedge q \longrightarrow r \vdash p \to q \longrightarrow r$ . Use the same method with the linear SAT solver to show that the sequent $\vdash ( p  q ) \lor ( r  p )$ is valid. (This is interesting since we proved this validity in natural deduction with a judicious choice of the proof rule LEM; and the linear SAT solver does not employ any case analysis.)

4.\* Consider the sequent $p \vee q , p  r \vdash r$ . Determine a DAG which is not satisfiable iff this sequent is valid. Tag the DAG’s root node with ‘1: T,’ apply the forcing laws to it, and extract a witness to the DAG’s satisfiability. Explain in what sense this witness serves as an explanation for the fact that $p \vee q , p  r \vdash r$ is not valid.

5. Explain in what sense the SAT solving technique, as presented in this chapter, can be used to check whether formulas are tautologies.

6. For $\phi$ from (1.10), can one reverse engineer $\phi$ from the DAG of $T ( \phi )$ ?

7. Consider a modification of our method which initially tags a DAG’s root node with ‘1: F.’ In that case,

(a) are the forcing laws still sound? If so, state the invariant. (b) what can we say about the formula(s) a DAG represents if i. we detect contradictory constraints? ii. we compute consistent forced constraints for each node?

8. Given an arbitrary Horn formula $\phi$ , compare our linear SAT solver – applied to $T ( \phi ) \textrm { - }$ to the marking algorithm – applied to $\phi$ . Discuss similarities and differences of these approaches.

9. Consider Figure 1.20 on page 77. Verify that

(a) its test produces contradictory constraints   
(b) its cubic analysis does not decide satisfiability, regardless of whether the two optimizations we described are present.

10. Verify that the DAG of Figure 1.17 (page 74) is indeed the one obtained for $T ( \phi )$ , where $\phi$ is the formula in (1.11) on page 73.

$^ \ast 1 1$ . An implementor may be concerned with the possibility that the answers to the cubic SAT solver may depend on a particular order in which we test unmarked nodes or use the rules in Figure 1.14. Give a semi-formal argument for why the analysis results don’t depend on such an order.

12. Find a formula $\phi$ such that our cubic SAT solver cannot decide the satisfiability of $T ( \phi )$ .

13. Advanced Project: Write a complete implementation of the cubic SAT solver described in Section 1.6.2. It should read formulas from the keyboard or a file; should assume right-associativity of ∨, $\wedge$ , and $\longrightarrow$ (respectively); compute the DAG of $T ( \phi )$ ; perform the cubic SAT solver next. Think also about including appropriate user output, diagnostics, and optimizations.

14. Show that our cubic SAT solver specified in this section

(a) terminates on all syntactically correct input;   
(b) satisfies the invariant (1.9) after the first permanent marking;   
(c) preserves (1.9) for all permanent markings it makes;   
(d) computes only correct satisfiability witnesses;   
(e) computes only correct ‘not satisfiable’ replies; and   
(f) remains to be correct under the two modifications described on page 77 for handling results of a node’s two test runs.

# 1.8 Bibliographic notes

Logic has a long history stretching back at least 2000 years, but the truthvalue semantics of propositional logic presented in this and every logic textbook today was invented only about 160 years ago, by G. Boole [Boo54]. Boole used the symbols $+$ and · for disjunction and conjunction.

Natural deduction was invented by G. Gentzen [Gen69], and further developed by D. Prawitz [Pra65]. Other proof systems existed before then, notably axiomatic systems which present a small number of axioms together with the rule modus ponens (which we call →e). Proof systems often present as small a number of axioms as possible; and only for an adequate set of connectives such as $\longrightarrow$ and ¬. This makes them hard to use in practice. Gentzen improved the situation by inventing the idea of working with assumptions (used by the rules →i, ¬i and ∨e) and by treating all the connectives separately.

Our linear and cubic SAT solvers are variants of St˚almarck’s method [SS90], a SAT solver which is patented in Sweden and in the United States of America.

Further historical remarks, and also pointers to other contemporary books about propositional and predicate logic, can be found in the bibliographic remarks at the end of Chapter 2. For an introduction to algorithms and data structures see e.g. [Wei98].