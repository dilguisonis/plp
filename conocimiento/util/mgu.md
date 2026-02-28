# PLP - Ejemplo de uso del algoritmo de unificac´on

Entrada: $\{ ( X _ { 1 } \to X _ { 2 } \to X _ { 2 } ) \to X _ { 2 } \to [ X _ { 1 } ] \to X _ { 2 } \ \doteq \ ( ( X _ { 3 } \to X _ { 4 } ) \to [ X _ { 3 } ] \to [ X _ { 4 } ] ) \to X _ { 5 } \}$

# Descomposici´on:

$\{ X _ { 1 }  X _ { 2 }  X _ { 2 } ~ \stackrel { . } { = } ~ ( X _ { 3 }  X _ { 4 } )  [ X _ { 3 } ]  [ X _ { 4 } ] , ~ X _ { 2 }  [ X _ { 1 } ]  X _ { 2 } ~ \stackrel { . } { = } ~ X _ { 5 } \}$

Descomposici´on:

$\{ X _ { 1 } \ \doteq \ { X _ { 3 } }  { X _ { 4 } }$ $X _ { 3 }  X _ { 4 } , \ X _ { 2 }  X _ { 2 } \ \doteq \ [ X _ { 3 } ]  [ X _ { 4 } ] , \ X _ { 2 }  [ X _ { 1 } ]  X _ { 2 } \ \doteq \ X _ { 5 } \}$

Eliminaci´on de variable:

$\{ X _ { 2 }  X _ { 2 } ~ \doteq ~ [ X _ { 3 } ]  [ X _ { 4 } ]$ , $X _ { 2 }  [ X _ { 3 }  X _ { 4 } ]  X _ { 2 } \ \doteq \ X _ { 5 } \}$ con $S = \ X _ { 1 } \ : = \ X _ { 3 }  X _ { 4 }$

# Descomposici´on:

$\{ X _ { 2 } ~ \doteq ~ [ X _ { 3 } ]$ , $X _ { 2 } ~ \doteq ~ [ X _ { 4 } ]$ , $X _ { 2 }  [ X _ { 3 }  X _ { 4 } ]  X _ { 2 } \ \doteq \ X _ { 5 } \}$ con $S = \ X _ { 1 } \ : = \ X _ { 3 }  X _ { 4 }$

Eliminaci´on de variable:

$\{ [ X _ { 3 } ] ~ \doteq ~ [ X _ { 4 } ]$ , $[ X _ { 3 } ]  [ X _ { 3 }  X _ { 4 } ]  [ X _ { 3 } ] \ \doteq \ X _ { 5 } \}$ con $S = \ X _ { 2 } \ : = \ [ X _ { 3 } ] \circ X _ { 1 } \ : = \ X _ { 3 }  X _ { 4 }$

Descomposici´on:

$\{ X _ { 3 } ~ \doteq ~ X _ { 4 }$ , $[ X _ { 3 } ]  [ X _ { 3 }  X _ { 4 } ]  [ X _ { 3 } ] \ \doteq \ X _ { 5 } \}$ con $S = \ X _ { 2 } \ : = \ [ X _ { 3 } ] \circ X _ { 1 } \ : = \ X _ { 3 }  X _ { 4 }$

Eliminaci´on de variable1: $\{ [ X _ { 3 } ] \to [ X _ { 3 } \to X _ { 3 } ] \to [ X _ { 3 } ] \ \doteq \ X _ { 5 } \}$ con $. S = X _ { 4 } \ : = \ X _ { 3 } \circ X _ { 2 } \ : = \ [ X _ { 3 } ] \circ X _ { 1 } \ : = \ X _ { 3 }  X _ { 4 }$

$\{ X _ { 5 } \ \doteq \ [ X _ { 3 } ] \to [ X _ { 3 } \to X _ { 3 } ] \to [ X _ { 3 } ] \}$ con $S = \ X _ { 4 } \ : = \ X _ { 3 } \circ X _ { 2 } \ : = \ [ X _ { 3 } ] \circ X _ { 1 } \ : = \ X _ { 3 }  X _ { 4 }$

Eliminaci´on de variable:

$$
{ \begin{array} { r l } { S = { \mathrm {  ~ { \cal { X } } _ { 5 } ~ } } : = \ [ { \mathrm {  ~ { \cal { X } } _ { 3 } } } ]  [ { \mathrm {  ~ { \cal { X } } _ { 3 } } }  { \mathrm {  ~ { \cal { X } } _ { 3 } } } ]  [ { \mathrm {  ~ { \cal { X } } _ { 3 } } } ] \circ { \mathrm {  ~ { \cal { X } } _ { 4 } ~ } } : = { \mathrm {  ~ { \cal { X } } _ { 3 } } } \circ { \mathrm {  ~ { \cal { X } } _ { 2 } ~ } } : = \ [ { \mathrm {  ~ { \cal { X } } _ { 3 } } } ] \circ { \mathrm {  ~ { \cal { X } } _ { 1 } ~ } } : = { \mathrm {  ~ { \cal { X } } _ { 3 } } }  { \mathrm {  ~ { \cal { X } } _ { 4 } ~ } } } \\ { \{ { \mathrm {  ~ { \cal { X } } _ { 5 } ~ } } : = \ [ { \mathrm {  ~ { \cal { X } } _ { 3 } } } ]  [ { \mathrm {  ~ { \cal { X } } _ { 3 } } }  { \mathrm {  ~ { \cal { X } } _ { 3 } } } ]  [ { \mathrm {  ~ { \cal { X } } _ { 3 } } } ] , { \mathrm {  ~ { \cal { X } } _ { 4 } ~ } } : = { \mathrm {  ~ { \cal { X } } _ { 3 } } } , { \mathrm {  ~ { \cal { X } } _ { 2 } ~ } } : = \ [ { \mathrm {  ~ { \cal { X } } _ { 3 } } } ] , { \mathrm {  ~ { \cal { X } } _ { 1 } ~ } } : = { \mathrm {  ~ { \cal { X } } _ { 3 } } }  { \mathrm {  ~ { \cal { X } } _ { 3 } } } \} } \end{array} }
$$