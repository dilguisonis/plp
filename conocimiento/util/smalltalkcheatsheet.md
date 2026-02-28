#(1 2 3 4) collect: [ :each | each $^ { \star }$ 2 ] ≠æ #( 2 4 6 8 )   
#(1 2 3 4) inject: 0 into: [ :each :result | each $^ +$ result ] ≠æ 10

" testing " #( 2 4 ) anySatisfy: [ :each | each odd ] $\longrightarrow$ false #( 2 4 ) allSatisfy: [ :each | each even ] $\longrightarrow$ true

" finding "   
'abcdef' includes: $\$ 123,456$ true   
'abcdef' contains: [ :each | each isUppercase ] ≠æ false   
'abcdef' detect: [ :each | each isVowel ] ifNone: $[ \$ 4] \quad \longrightarrow \quad \$ 2$

" String – a collection of characters " string $: =$ 'abc'. string $: =$ string , 'DEF' æ 'abcDEF' string beginsWith: 'abc' $\longrightarrow$ true string endsWith: 'abc' $\longrightarrow$ false string includesSubString: 'cD' $\longrightarrow$ true string asLowercase 'abcdef string asUppercase $\longrightarrow$ 'ABCDEF'

" OrderedCollection – an ordered collection of objects " ordered $: =$ OrderedCollection new.   
ordered addLast: 'world'.   
ordered addFirst: 'hello'.   
ordered size ≠æ 2   
ordered at: 2 $\longrightarrow$ 'world'   
ordered removeLast $\longrightarrow$ 'world'   
ordered removeFirst $\longrightarrow$ 'hello'   
ordered isEmpty ≠æ true " Set – an unordered collection of objects without duplicates " set $: =$ Set new.   
set add 'hello'; add: 'hello'.   
set size $\longrightarrow$ 1 " Bag – an unordered collection of objects with duplicates " bag $: =$ Bag new.   
bag add: 'this'; add: 'that'; add: 'that'.   
bag occurrencesOf: 'that' $\qquad \quad 2$   
bag remove: 'that'.   
bag occurrencesOf: 'that' ≠æ 1 " Dictionary – associates unique keys with objects " dictionary $: =$ Dictionary new.   
dictionary at: 'smalltalk' put: 80.   
dictionary at: 'smalltalk' $\qquad \longrightarrow \qquad 8 0$   
dictionary at: 'squeak' ifAbsent: [ 82 ] 一 82 dictionary removeKey: 'smalltalk'.   
dictionary isEmpty $\longrightarrow$ true

# Streams

" ReadStream – to read a sequence of objects from a collection

stream $: =$ 'Hello World' readStream. stream next $\longrightarrow$ $\$ 1$ stream upTo: \$o ≠æ 'ell' stream skip: 2. stream peek $\qquad \$ \$ 90$ stream upToEnd $\longrightarrow$ 'orld'

" WriteStream – to write a sequence of objects to a collection " stream $: =$ WriteStream on: Array new.   
stream nextPut: 'Hello'.   
stream nextPutAll: #( 1 2 3 ).   
stream contents #( 'Hello' 1 2 3 )

# File Streams

fileStream $: =$ FileDirectory default newFileNamed: 'tmp.txt'.   
fileStream nextPutAll: 'my cool stuff'.   
fileStream close.

fileStream $: =$ FileDirectory default oldFileNamed: 'tmp.txt'. fileStream contents $\longrightarrow$ 'my cool stuff'

# Method Definition

messageSelectorAndArgumentNames "comment stating purpose of message" | temporary variable names | statements

# Class Definition

Object subclass: #NameOfSubclass instanceVariableNames: 'instVar1 instVar2' classVariableNames: '' poolDictionaries: '' category: 'Category--Name'

# References

1. Andrew Black, Stéphane Ducasse, Oscar Nierstrasz and Damien Pollet, Squeak by Example, Square Bracket Associates, 2007, squeakbyexample.org.   
2. Chris Rathman, Terse guide to Squeak, wiki.squeak. org/squeak/5699.   
3. Smalltalk, Wikipedia, the free encyclopedia, en. wikipedia.org/wiki/Smalltalk.

# Smalltalk Cheat Sheet

Software Composition Group University of Bern

May 21, 2008

# 1. The Environment

![](images/d86790beb32f420a028d9b7904002f606dafa7a36748966dd4a8091f4da1e89d.jpg)  
Figure 1: The Smalltalk Code Browser

• Do it (CMD–D): Evaluate selected code.   
• Print it (CMD–P): Display the result of evaluating selected code.   
• Debug it: Evaluate selected code step-by-step with the integrated debugger.   
• Inspect it (CMD–I): Show an object inspector on the result of evaluating selected code.   
• Explore it (CMD–SHIFT–I): Show an object explorer on the result of evaluating selected code.

# 2. The Language

• Everything is an object.   
• Everything happens by sending messages.   
• Single inheritance.   
• Methods are public.   
• Instance variables are private to objects.

# Keywords

• self, the receiver.   
• super, the receiver, method lookup starts in superclass.   
• nil, the unique instance of the class UndefinedObject.   
• true, the unique instance of the class True.   
• false, the unique instance of the class False.   
• thisContext, the current execution context.

# Literals

• Integer 123 2r1111011 (123 in binary) 16r7B (123 in hexadecimal)   
• Float 123.4 1.23e--4   
• Character \$a   
• String 'abc'   
• Symbol #abc   
• Array #(123 123.4 \$a 'abc' #abc)

# Message Sends

1. Unary messages take no argument. 1 factorial sends the message factorial to the object 1.

2. Binary messages take exactly one argument. $3 + 4$ sends message $^ +$ with argument 4 to the object 3. #answer $- > 4 2$ sends $- >$ with argument 42 to #answer. Binary selectors are built from one or more of the characters $+ , - , \star , = , < , > ,$ ...

3. Keyword messages take one or more arguments.

2 raisedTo: 6 modulo: 10 sends the message named raisedTo:modulo: with arguments 6 and 10 to the object 2.

Unary messages are sent first, then binary messages and finally keyword messages:

2 raisedTo: $1 + 3$ factorial $\begin{array} { r l r } { \longrightarrow } & { { } } & { 1 2 8 } \end{array}$

Messages are sent left to right. Use parentheses to change the order:

$$
\begin{array} { c c c } { { 1 + 2 \star 3 } } & { { \longrightarrow } } & { { 9 } } \\ { { 1 + ( 2 \star 3 ) } } & { { \longrightarrow } } & { { 7 } } \end{array}
$$

# Syntax

• Comments "Comments are enclosed in double quotes"   
• Temporary Variables | var | | var1 var2 |   
• Assignment var $: =$ aStatement var1 $: =$ var2 $: =$ aStatement   
• Statements aStatement1. aStatement2 aStatement1. aStatement2. aStatement3   
• Messages receiver message (unary message) receiver $^ +$ argument (binary message) receiver message: argument (keyword message) receiver message: argument1 with: argument2   
• Cascade receiver message1; message2 receiver message1; message2: arg2; message3: arg3   
• Blocks [ aStatement1. aStatement2 ] [ :argument1 | aStatement1. aStatement2 ] [ :argument1 :argument2 | | temp1 temp2 | aStatement1 ]   
• Return Statement ^ aStatement

# 3. Standard Classes

# Logical expressions

true not $\longrightarrow$ false $1 = 2$ or: $[ 2 = 1 ] \longrightarrow$ false $1 < 2$ and: $[ 2 > 1 ] \longrightarrow$ true

# Conditionals

$1 = 2$ ifTrue: [ Transcript show: '1 is equal to 2' ].   
$1 = 2$ ifFalse: [ Transcript show: '1 isn''t equal to 2' ].

100 factorial / 99 factorial $= 1 0 0$ ifTrue: [ Transcript show: 'condition evaluated to true' ] ifFalse: [ Beeper beep ].

#

" conditional iteration " [ Sensor anyButtonPressed ] whileFalse: [ "wait" ].

pen $: =$ Pen newOnForm: Display. pen place: Sensor cursorPoint. [ Sensor anyButtonPressed ] whileTrue: [ pen goto: Sensor cursorPoint ].

" fixed iteration "   
180 timesRepeat: [ pen turn: 88. pen go: 250 ].

1 to: 100 do: [ :index | pen go: index $\star 4$ . bic turn: 89 ].

" infinite loop (press CMD+. to break) " [ pen goto: Sensor cursorPoint ] repeat.

# Blocks (anonymous functions)

" evaluation "   
$[ 1 + 2 ]$ value $\qquad \ 3$   
$[ \mathbf { \nabla } : \mathbf { x } \mid \mathbf { x } + 2 ]$ value: 1 ≠æ 3   
$[ { \bf \Phi } : { \bf x } : { \bf y } \mid { \bf x } + { \bf y } ]$ value: 1 value: 2 ≠æ 3

" processes " [ (Delay forDuration: 5 seconds) wait. Transcript show: 'done' ] fork $\longrightarrow$ aProcess

# Collections

" iterating "   
'abc' do: [ :each | Transcript show: each ].   
'abc' do: [ :each | Transcript show: each ] separatedBy: [ Transcript cr ].

" transforming " #(1 2 3 4) select: [ :each | each even ] ≠æ #( 2 4 ) #(1 2 3 4) reject: [ :each | each $^ { \circ 2 }$ ] ≠æ #( 1 3 4 )