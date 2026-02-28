<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td></td></tr></table>

# Un lenguaje funcional puro sencillo (SFL) y su intérprete

Eduardo Bonelli

Departamento de Computación FCEyN UBA

3 de octubre, 2006

<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td></td></tr></table>

Intérprete para un lenguaje funcional sencillo (SFL)

· Componentes de un intérprete • Sintaxis concreta y abstracta de SFL

· Intérprete • Extensiones

O binding local (let)

@ procedimientos (proc)

3 recursion (letrec)

<table><tr><td></td><td>Eduardo Bonelli</td><td>purosencillg</td><td>o (SFL)ysuintérprete</td></tr></table>

<table><tr><td>Sintaxis Ejemplos Intérprete Extensiones Recursion</td><td></td></tr></table>

Definicion inductiva de

. las expresiones sintácticamente correctas (sintaxis concreta) 。 la representaci6n interna de las expresiones (sintaxis abstracta)

Designar los valores expresados: subconjunto de expresiones a los que puede evaluar una expresión arbitraria

Un entorno ("environment"): estructura de datos que liga variables con valores denotados

Un entorno inicial

Intérprete como funcion recursiva sobre el conjunto inductivo de las expresiones (ie. de la sintaxis abstracta)

Salida del intérprete: valores expresados

SintaxisyEjemplos Intérprete Extensiones Recursion

SintaxisConcreta Sintaxis Abstracta Valores

La sintaxis de SFL viene dada por la siguiente gramática BNF:

Un lenguaje funcional puro sencillo (SFL) y su interprete

<program> := <expr>   
<expr> ::= <number> | <identifier> I <primitive> ( $\{ < \tt e x p r > ^ { * ( \tt , ) } \} ;$ | if <expr> then <expr> else <expr>   
<primitive> ::= + | - | \* | add1 | sub1 | isZero

# Eduardo Bonelli

Sintaxisy Ejemplos Intérprete Extensiones Recursion

# Ejemplos de expresiones validas:

3   
n   
${ \mathfrak { + ( 3 , n ) } }$   
add1(add1(3,n),4)   
if -(2,+(3,4)) then 2 else 3   
+(if 2 then 3 else 3,7)

NOTA: if testea valores expresados

falso: 0   
verdadero: cualquier valor expresado distinto de 0

Sintaxisy Ejemplos Interprete Extensiones Recursion

Sintaxis Concreta SintaxisAbstracta Valores

data Program $=$ Pgm Exp data Exp $=$ LitExp Int I VarExp Symbol I IfExp Exp Exp Exp I PrimApp PrimOp [Exp] data PrimOp $=$ AddPrim I SubtractPrim I MultPrim | IncrPrim DecrPrim | ZeroTestPrim

type Symbol $=$ String

<table><tr><td></td><td>Eduardo Bonelli</td><td>purosencillg TSFLI ysuintérprete</td></tr></table>

Sintaxisy Ejemplos Intérprete Extensiones Recursion

Sintaxis Concreta SintaxisAbstracta Valores

El mapeo de sintaxis concreta a sintaxis abstracta se realiza en dos pasos:

Anälisis léxico（"lexer"） Anälisis sintáctico （"parser")

La cätedra los proveerä de modo que puedan probar el intérprete

Para el ejemplo:let $\mathtt { x } = 3$ in \*(2,x)

salida del lexer: [TokenLet,TokenVar "x",TokenEq,TokenInt3,TokenIn,TokenTimes， Token0B， TokenInt 2， TokenComma,TokenVar "x"， TokenCB]

O salida del parser: Pgm (LetExp ["x"] [LitExp 3] (PrimApp MultPrim [LitExp 2,VarExp "x"]))

<table><tr><td>Eduardo Bonelli</td><td>Unlenguajefuncional purosencillg （SFL） )ysuintérprete</td></tr></table>

Sintaxisy Ejemplos Intérprete Extensiones Recursion

Sintaxis Concreta SintaxisAbstracta Valores

El mapeo de sintaxis concreta a sintaxis abstracta se realiza en dos pasos:

Anälisis léxico（"lexer"） Anälisis sintáctico（"parser"）

La cätedra los proveerä de modo que puedan probar el   
intérprete   
Para el ejemplo: let $\mathtt { x } = 3$ in \*(2,x)   
salida del lexer: [TokenLet,TokenVar "x",TokenEq,TokenInt   
3,TokenIn,TokenTimes，TokenOB，TokenInt 2，TokenComma,   
TokenVar "x"，TokenCB]

# Mapeo de Sintaxis Concreta a Abstracta

El mapeo de sintaxis concreta a sintaxis abstracta se realiza en dos pasos:

Anälisis léxico（"lexer"） Anälisis sintáctico（"parser"）

La cätedra los proveerä de modo que puedan probar el   
intérprete   
Para el ejemplo: let $\mathtt { x } = 3$ in \*(2,x)   
salida del lexer: [TokenLet,TokenVar "x",TokenEq,TokenInt   
3,TokenIn,TokenTimes，TokenOB，TokenInt 2，TokenComma,   
TokenVar "x"，TokenCB]   
salida del parser: Pgm (LetExp ["x"] [LitExp 3] (PrimApp   
MultPrim [LitExp 2,VarExp "x"]))

Sintaxisy Ejemplos Intérprete Extensiones Recursion

Sintaxis Concreta Sintaxis Abstracta Valores

Valores que puede arojar la evaluación de una expresión. · Ej. numeros, procedimientos

# Valoresdenotados

Valores que se ligan a los identificadores (ie. a las variables).

。 Ej. numeros, procedimientos Mas adelante: referencias

NOTA: Con la simple descripcion del conjunto de valores expresados y denotas ya se dice bastante sobre el lenguaje objeto.

Sintaxisy Ejemplos Intérprete Extensiones Recursion

El valor expresado resultante de evaluar $^ +$ (3,4) es claro.

iQué sucede con la expresión $+ ( \mathbf { x } , 5 ) ?$ iA qué valor expresado debe evaluar?

Es necesario contar con un entorno: estructura de datos que liga variables con valores denotados   
Dado el entorno que liga el valor 2 a la variable,podemos   
responder que $^ +$ (x,5) debe evaluar al valor 7.   
Asumiremos que el intérprete comienza su ejecución contando con un entorno inicial.

Representación de entornos en Haskell

<table><tr><td rowspan="11">data Env = EmptyEnv l</td></tr><tr><td>ExtendedEnvRecord [Symbol]</td></tr><tr><td>[ExpressedValue]</td></tr><tr><td>Env</td></tr><tr><td></td></tr><tr><td>data ExpressedValue = Nro {stripNro::Int}</td></tr><tr><td></td></tr><tr><td>-- extender entorno con nuevo rib</td></tr><tr><td>extendEnv: :[Symbol]-&gt;[ExpressedValue]-&gt;Env-&gt;Env</td></tr><tr><td>extendEnv ids vals env = ExtendedEnvRecord ids vals env</td></tr></table>

Buscar el valor expresado asociado a una variable

applyEnv: : Env->Symbol->ExpressedValue   
applyEnv EmptyEnv sym $=$ error ("applyEnv: Sin binding para "++ show sym)   
applyEnv (ExtendedEnvRecord syms vals env) sym $=$ case findInList syms sym of (Just n) -> vals!!n - -> applyEnv env sym

-- buscar simbolo en lista de simbolos (retornar posicion) findInList:: [a]->a->Maybe Int

Sintaxisy Ejemplos Intérprete Extensiones Recursion

# Intérpete de programas

-- interprete de programas   
evalProgram (Pgm body) $=$ evalExpr body initEnv entorno inicial   
initEnv $=$ ExtendedEnvRecord ["i","v","x"] [Nro 1,Nro 5,Nro 10] EmptyEnv

Sintaxisy Ejemplos Intérprete Extensiones Recursion

evalExpr (LitExp n) env $=$ Nro n   
evalExpr (VarExp id) env $=$ applyEnv env id   
evalExpr (PrimApp prim rands) env $=$ let args $=$ map (\x->evalExpr x env) rands in applyPrimitive prim args   
evalExpr (IfExp testExp trueExp falseExp) env $=$ if isTrueValue (evalExpr testExp env) then evalExpr trueExp env else evalExpr falseExp env

isTrueValue: :ExpressedValue->Bool isTrueValue $=$ not. $\scriptstyle ( = = 0 )$ ）.stripNro

Sintaxisy Ejemplos Intérprete Extensiones Recursion

applyPrimitive AddPrim args $=$ Nro (stripNro (args!!0) $^ +$ stripNro (args!!1))   
applyPrimitive SubtractPrim args $=$

Nro (stripNro (args!!O) - stripNro (args!!1)) applyPrimitive MultPrim args $=$

Nro (stripNro (args!!0) $^ *$ stripNro (args!!1)) applyPrimitive IncrPrim args $=$ Nro (stripNro (args!!0) + 1) applyPrimitive DecrPrim args $=$ Nro (stripNro (args!!0) - 1) applyPrimitive ZeroTestPrim args =

Nro (if stripNro $( \mathsf { a r g s } ! ! 0 ) \mathsf { = } \mathsf { = } 0$ then 1 else 0)

<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Declaracioneslocales:ejemplosysintaxis Procedimientos:ejemplosysintaxis Declaracioneslocales:extensiondel intérprete Procedimientos:extensiondel intérprete</td></tr></table>

# Declaraciones localesa travésde ejemplos

let $\texttt { x } = \texttt { 5 }$ ， $\mathtt { y } \ = \ 6$   
in ${ \bf \Xi } + ( { \bf x } , { \bf y } )$ dependencia entre declaraciones   
let $\texttt { x } = \texttt { 3 }$ in let $y ~ = ~ + ( \mathbf { x } , 4 )$ $\mathrm { i n } \ * ( \mathbf { x } , \mathbf { y } )$   
let $\texttt { x } = \texttt { 3 }$ ， $y ~ = ~ + ( \mathbf { x } , 4 )$   
in $\mathbf { \boldsymbol { * } } ( \mathbf { \boldsymbol { x } } , \mathbf { \boldsymbol { y } } )$

<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Declaracioneslocales:ejemplosysintaxis Procedimientos:ejemplosysintaxis Declaracioneslocales:extensiondel interprete Procedimientos:extensiondel intérprete</td></tr></table>

# Declaraciones locales a traves de ejemplos

-- declaraciones internas enmascaran las externas

let $\texttt { x } = \texttt { 3 }$ in let $\textbf { x } = { \boldsymbol { \mathbf { \rho } } } { * } \left( \mathbf { x } , \mathbf { x } \right)$ in ${ \bf { \Psi } } + ( { \bf { x } } , { \bf { x } } )$

<table><tr><td></td><td>Eduardo Bonelli</td><td>Unlenguaje funcionalpuro sencillo</td><td>lo(SFL)ysuintérprete</td></tr><tr><td></td><td></td><td></td><td></td></tr></table>

Sintaxisy Ejemplos Interprete Extensiones Recursion

Declaracioneslocales:ejemplosy sintaxis Procedimientos:ejemplosy sintaxis Declaraciones locales: extension del interprete Procedimientos:extensiondel interprete

let var1 = exp1, varn-1 = expn-1, varn $=$ expn in cuerpo

# Sintaxis concreta

<expr> := let {<ident> = <expr>}\*(） in <expr>

Region La region asociada con var1...,varn es cuerpo Evaluación

cada expi (en ningun orden en particular!)   
ligar cada vari al valor de expi   
evaluar cuerpo y retornar su resultado como el resultado de toda la expresion.

<table><tr><td>Eduardo Bonelli</td><td>Unlenguajefuncional purosencillg (SFL)ysuintérprete</td></tr><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Declaraciones locales:ejemplosysintaxis Procedimientos:ejemplosysintaxis Declaracioneslocales:extensiondel intérprete Procedimientos:extensiondel intérprete</td></tr></table>

# Procedimientos a través de ejemplos

let f = proc (y,z) +(y,-(z,5)) in (f 2 28)   
(proc (y,z) +(y,-(z,5)) 2 28)   
-- si bien no tenemos letrec， podemos hacer esto   
let factAux $=$ proc(next,x) if zero?(x) then 1 else (next next sub1(x))   
in let fact $=$ proc(x) (factAux factAux x) in (fact 3)

Sintaxisy Ejemplos Interprete Extensiones Recursion

Declaraciones locales:ejemplosy sintaxis Procedimientos:ejemplosysintaxis Declaraciones locales:extensiondel interprete Procedimientos: extensiondel interprete

# Sintaxis concreta

e

# Sintaxis abstracta

data Exp $=$ LitExp Int | VarExp Symbol I IfExp Exp Exp Exp I PrimApp PrimOp [Exp]I LetExp[Symbol] [Exp] Exp ProcExp [Symbol] Exp I AppExp Exp [Exp]

Sintaxisy Ejemplos Intérprete Extensiones Recursion

Declaraciones locales:ejemplosy sintaxis Procedimientos:ejemplos y sintaxis Declaraciones locales:extensiondel interprete Procedimientos:extensiondel interprete

# Extendiendo el intérprete (let)

evalExpr (LitExp n） env $=$ Nro n  
evalExpr (LetExp ids rands body) env =let args $=$ map ( $\left( \mathbf { \boldsymbol { x } } - \mathbf { \boldsymbol { > } } \right)$ evalExpr x env) randsinevalExpr body (extendEnv ids args env)

<table><tr><td></td><td>Eduardo Bonelli</td><td>Unlenguaje funcional purosencillg</td><td></td></tr></table>

<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Declaraciones locales:ejemplosysintaxis Procedimientos:ejemplosy sintaxis Declaracioneslocales:extensiondel interprete Procedimientos:extensiondel intérprete</td></tr></table>

# Extendiendo el intérprete (proced.)

iA qué valor deberia evaluar un procedimiento? Ejemplo:

let $\texttt { x } = \texttt { 5 }$   
in let f = proc (y,z) +(y，-(z,x)) $\mathrm { ~ x ~ } = \ 2 8$ in (f 2 x)

Observar: el cuerpo es evaluado

。 solamente cuando es aplicado en un entorno que liga los parámetros formales a los argumentos de la aplicacion iY qué hay de las variables que ocurren libres en el procedimiento?

Sintaxisy Ejemplos Interprete Extensiones Recursion

Declaraciones locales:ejemplosy sintaxis Procedimientos:ejemplosy sintaxis Declaraciones locales:extension del interprete Procedimientos:extensiondel interprete

# Ejemplo:

let $\texttt { x } = \texttt { 5 }$   
in let f = proc (y,z) +(y，-(z,x)) $\mathrm { ~ x ~ } = \ 2 8$ in (f 2 x)

Respecto a las variables que ocurren libres en el procedimiento deben respetar scoping leéxico (o estätico)

. deben evaluarse usando el entorno en efecto en el momento de la creación

Por lo tanto, debemos retener (junto con el cuerpo y los parämetros formales) las valores asociados a las variables libres en el momento en el que el procedimiento fue creado

<table><tr><td>Eduardo Bonelli</td><td>Unlenguajefuncional purosencillg (SFL) ）ysuintérprete</td></tr></table>

Sintaxisy Ejemplos Interprete Extensiones Recursion

Declaraciones locales:ejemplosy sintaxis Procedimientos:ejemplosy sintaxis Declaraciones locales: extension del interprete Procedimientos:extensiondelinterprete

cuerpo junto con un entorno y parámetros formales data ExpressedValue $=$ Nro {stripNro::Int} l Closure [Symbol] Exp Env

Volviendo a los valores expresados/denotados:

· Valores expresados = Numeros + Clausuras • Valores denotados = Numeros + Clausuras

Sintaxisy Ejemplos Interprete Extensiones Recursion

Declaraciones locales:ejemplosy sintaxis Procedimientos:ejemplosy sintaxis Declaraciones locales:extension del interprete Procedimientos:extensiondel intérprete

evalExpr (ProcExp ids body) env $=$ Closure ids body env   
evalExpr (AppExp rator rands) env $=$ let proc $=$ evalExpr rator env args $=$ map (\x->evalExpr x env) rands in case proc of (Closure - - -) -> applyProcVal proc args - -> error ("evalExpr: Intento de aplicar un no-procedimiento "++show proc)   
applyProcVal (Closure ids body env) args = evalExpr body (extendEnv ids args env)

<table><tr><td>Sintaxisy Ejemplos</td><td>Intérprete Extensiones Recursion</td><td>Sintaxisconcretayabstracta:ejemplos Implementacioningenua Creacion de clausurasal hacer lookup Creacionunicadeclausuras</td></tr></table>

# Extendiendo el intérprete para SFL con recursion

Ejemplos

Sintaxis concreta y abstracta

Implementando recursión a través de la creación de clausuras durante el lookup (V1)

Entornos en notacion de sintaxis abstracta (anexando un nuevo tipo de rib) 。 Entornos en notacion procedural

Implementando recursión armando clausura una ünica vez (V2)

Entornos en notación de sintaxis abstracta (utilizando estructuras circulares)

<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Sintaxisconcretayabstracta:ejemplos Implementacioningenua Creacion de clausuras al hacer lookup Creacionunicadeclausuras</td></tr></table>

# Ejemplos en SFL con recursion

letrec fact(x) = if zero?(x) then 1 else ${ \ast } \left( \mathbf { \bar { x } } \right.$ ,(odd sub1(x)))   
in (fact 6)   
letrec $\mathtt { e v e n } ( \mathbf { x } ) \ = \ \mathtt { i f } \ \mathtt { z e r o ? } ( \mathbf { x } )$ then 1 else (odd sub1(x)) odd(x) = if zero?(x) then 0 else (even sub1(x)) ()da 12)

Sintaxisy Ejemplos Intérprete Extensiones Recursion intaxisconcretayabstracta:ejemplos mplementacioningenua Lreacionde clausurasal hacer lookup Treacionunica de clausuras

# Sintaxis concreta y abstracta

# Sintaxis concreta

<expr> ::= letrec {<identifier> $( \{ < { \mathrm { i } } { \mathrm { d e n t i f } } { \mathrm { i } } { \mathrm { e r } } > \} ^ { * ( , ) } ) ~ = ~ < { \mathrm { e x p r } } > \} ^ { * }$ in <expr>

# Sintaxis abstracta

data Exp $=$ LitExp Int I LetRecExp [Symbol] [Symbol] [Exp] Exp

<table><tr><td></td><td>Eduardo Bonelli</td><td>Unlenguaje funcional puro sencillo</td><td></td></tr></table>

<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Sintaxisconcretayabstracta:ejemplos Implementacioningenua Creacion de clausurasal hacer lookup Creacionunica de clausuras</td></tr></table>

# Implementacion: version ingenua

letrec

even(x) = if zero?(x) then 1 else (odd sub1(x)) odd(x) $=$ if zero?(x) then O else (even sub1(x)) in (odd 13)

Manipulaci6n ingenua de entornos y clausuras:

/ /+--- -+ 一 丨丨 var1丨val1| 一 —+-- -+- ---+ l old-env 一 一 —+- -+ envi Il varn| valnI 一 +-------+-------+ 一 levenI (Clausura ... old-env) 一 +-- -+ 一 丨 oddI (Clausura ...old-env) +--- + ----+

# Clausuras deben referenciar env (y no old-env). Circularidadl &@

<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Sintaxisconcretayabstracta:ejemplos Implementacion ingenua Creaciondeclausurasal hacerlookup Creacionunicadeclausuras</td></tr></table>

# Implementacion: Creacion de clausuras al hacer lookup

Idea: demorar creación de clausuras hasta que el procedimiento recursivo es llamado

/ /+--- --+ 一 Il var1Ival1I 一 —+-- + --+ i old-env 一 ： 一 —+-- + --+ env Il varn 丨 valnI 一 +-------+-------+ 一 l even 丨 al hacer lookup (Closure ... env) 一 +---- -+ 一 丨 odd丨 al hacer lookup (Closure ... env) +--- -+- ---+

<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Sintaxisconcretayabstracta:ejemplos Implementacion ingenua Creaciondeclausurasal hacer lookup Creacionunicade clausuras</td></tr></table>

# Creacion de clausuras al hacer Lookup - v1

En ésta versión los entornos se representan como un tipo algebraico . Se agrega un nuevo constructor para extender entornos con declaraciones recursivas locales

data Env $=$ EmptyEnv I ExtendedEnvRecord [Symbol] [ExpressedValue] Env| RecursivelyExtendedEnvRecord [Symbol] [[Symbol]] [Exp] Env

<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Sintaxisconcretayabstracta:ejemplos Implementacion ingenua Creaciondeclausurasal hacer lookup Creacionunicade clausuras</td></tr></table>

# Creacion de clausuras al hacer Lookup - v1

El c6digo para evalExpr es el esperado

evalExpr (LetRecExp procNames idss bodies letrecBody) env = (evalExpr letrecBody (extendEnvRecursively procNames idss bodies env))   
extendEnvRecursively procNames idss bodies env $=$ RecursivelyExtendedEnvRecord procNames idss bodies

Lo interesante es cómo se realiza el lookup de un procedimiento recursivo en el entorno...

<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Sintaxisconcretayabstracta:ejemplos Implementacion ingenua Creaciondeclausurasal hacer lookup Creacionunicadeclausuras</td></tr></table>

# Creacion de clausuras al hacer Lookup - v1

applyEnv: : Env->Symbol->ExpressedValue   
applyEnv EmptyEnv sym $=$ error ("applyEnv: Sin binding para $" + +$ show sym)   
applyEnv (ExtendedEnvRecord syms vals env) sym $=$ case findInList syms sym of (Just n) -> vals!!n _ -> applyEnv env sym   
applyEnv env@(RecursivelyExtendedEnvRecord procNames idss bodie: $=$ case findInList procNames sym of (Just n) -> Closure (idss!!n) (bodies!!n) env - -> applyEnv oldEnv sym

<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Sintaxisconcretayabstracta:ejemplos Implementacioningenua Creaciondeclausurasal hacer lookup Creacionunicade clausuras</td></tr></table>

# Creacion de clausuras al hacer Lookup - v2

Entornos representados como funciones

empty-env sym $=$ error ("empty-env: Sin binding para "++ show sym)   
extend-env syms vals env sym = let pos $=$ findInList sym syms in case pos of (Just n) -> vals!!n 1V apply-env env sym

apply-env env sym $=$ env sym

<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Sintaxisconcretayabstracta:ejemplos Implementacioningenua Creaciondeclausurasal hacer lookup Creacionunicade clausuras</td></tr></table>

# Creacion de clausuras al hacer Lookup - v2

Agregamos una nueva operación para extender entornos extend-env-recursively proc-names idss bodies old-env $=$ let rec-env sym $=$ let pos $=$ findInList sym proc-names in case pos of (Just n) -> Closure idss!!pos bodies!!pos rec-env _ -> apply-env old-env sym in rec-env

<table><tr><td></td><td>Eduardo Bonelli</td><td>purosencillg TSFL</td><td>）ysuintérprete</td></tr></table>

<table><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Sintaxisconcretayabstracta:ejemplos Implementacioningenua Creaciondeclausurasal hacer lookup Creacionunica declausuras</td></tr></table>

# Creacion de clausuras al hacer Lookup - v2

。 evalExpr: sin cambios respecto a v1

evalExpr (LetRecExp procNames idss bodies letrecBody) env = (evalExpr letrecBody (extendEnvRecursively procNames idss bodies env))   
extendEnvRecursively procNames idss bodies env $=$ RecursivelyExtendedEnvRecord procNames idss bodies env

<table><tr><td></td><td>Eduardo Bonelli</td><td>o(SFL)ysuintérprete</td></tr></table>

Sintaxisy Ejemplos Intérprete Extensiones Recursion

Sintaxis concretay abstracta: ejemplos Implementacion ingenua Creacionde clausuras al hacer lookup Creacionunicadeclausuras

# Creacion ünica de clausuras

En los dos casos previos las clausuras se creaban a la hora de hacer lookup . Esto no es necesario dado que el entorno de la clausura creada siempre es el mismo Utilizando estructuras circulares podemos limitarnos a construir clausuras una sola vez Asumimos representación eständar de entornos

<table><tr><td colspan="3">data Env = EmptyEnv I</td></tr><tr><td rowspan="3"></td><td> ExtendedEnvRecord [Symbol]</td><td></td></tr><tr><td></td><td>[ExpressedValue]</td></tr><tr><td>Env</td><td></td></tr></table>

<table><tr><td>Eduardo Bonelli</td><td>SFL ）ysuintérprete</td></tr><tr><td>Sintaxisy Ejemplos Intérprete Extensiones Recursion</td><td>Sintaxisconcretayabstracta:ejemplos Implementacion ingenua Creacion de clausurasal hacer lookup Creacionunicadeclausuras</td></tr></table>

# Implementacion: Creacion unica de clausuras

El evaluador de expresiones es el mismo que antes evalExpr (LetRecExp procNames idss bodies letrecBody) env = (evalExpr letrecBody (extendEnvRecursively procNames idss bodies env))

Pero las clausuras se crean al procesar la declaración extendEnvRecursively procNames idss bodies oldEnv $=$ let env $=$ ExtendedEnvRecord procNames lst oldEnv lst $=$ map (\(xs,y) -> Closure xs y env) (zip idss bodies) in env

<table><tr><td>Eduardo Bonelli</td><td></td><td>SFL) )ysuintérprete</td></tr></table>