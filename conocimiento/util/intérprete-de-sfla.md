# Extendiendo SFL con asignacion (SFLA) (SFLA = Prog. Funcional Imperativa)

# Eduardo Bonelli

Departamento de Computación FCEyN UBA

3 de octubre, 2006

SFL es un lenguaje funcional puro

• Toda expresión se evalua exclusivamente para obtener su valor

Sin embargo, a veces es necesario utilizar recursos imperativos (principalmente por cuestiones de eficiencia) como:

• Asignación de valores a variables   
● Actualización in-place de estructuras de datos   
• Operaciones de Entrada/Salida

Todas estas expresiones se evaluan para obtener un efecto

Hoy retomamos SFL， nuestro lenguaje funcional puro

En SFL el valor asignado a un identificador (o variable) no puede alterarse; en este sentido las variables de SFL se asemejan a las variables usadas en Matemäticas o en Lógica

En SFL a las variables se les asignaban valores expresados (valores que retornan las expresiones al ser evaluadas)

Esto se resume como sigue

· Valores denotados $=$ Number $^ +$ Procval

· Valores expresados $=$ Number $^ +$ Procval

Hoy vamos a extender SFL con una operación de asignación

La expresion set $\mathrm { ~ x ~ } =$ e representa la operacion de asignacin

· Primero se evalua e para obtener un valor v Luego se obtiene la dirección de memoria asociada a x Finalmente se asigna v al contenido de la dirección de x

Observar que en set $\textbf { x } = \mathbf { \kappa } + ( \mathbf { x } , 2 )$

La ocurrencia de x a la derecha del $" = "$ se refiere a su contenido ("r-value" de x)

La ocurrencia de x a la izquierda del $" = "$ se refiere a su dirección de memoria ("l-value” de x)

Ahora a las variables se les asignan

• referencias a una dirección mutable de memoria

• cuyo contenido puede ser modificado a través la operación de asignación

Por lo tanto,ahora tendremos

· Valores denotados $=$ ReferenciaA(Number + Procval) • Valores expresados $=$ Number + Procval

# Asignacion

Representaciondeestadolocal Modalidadesde pasaje de parametro Secuenciamiento

Extendemos la sintaxis concreta de SFL con una operacion de asignacion (SFLA):

<expr> ::= ... | set <identifier> = <expr>

# Ejemplo

let $\scriptstyle { \mathtt { y } } = 3$ in let dummy $=$ set y = 4 in y

Evalua a 4

<table><tr><td></td><td>Eduardo Bonelli</td><td></td><td></td></tr></table>

# Asignacion

Representaciondeestadolocal Modalidadesde pasaje de parametro Secuenciamiento

Pregunta: iA qué valor debe evaluar la siguiente expresión?

let $\texttt { x } = \texttt { 2 }$ in set x = 3

# Respuesta:

O a ninguno (o bien a cualquier valor arbitrario que designemos)   
o la expresion se evalua exclusivamente por su efecto (el de cambiar el contenido de x) NO se espera ningun valor como resultado de la evaluacion de una asignacion Asumimos (arbitrariamente) que toda asignación evalua a 0

# Asignacion

Representaciondeestadolocal Modalidadesde pasaje de parametro Secuenciamiento

Pregunta: iA qué valor debe evaluar la siguiente expresión?

let $\texttt { x } = \texttt { 2 }$ in set $\texttt { x } = \texttt { 3 }$

# Respuesta:

a ninguno (o bien a cualquier valor arbitrario que designemos)

la expresión se evalua exclusivamente por su efecto (el de cambiar el contenido de x)

NO se espera ningun valor como resultado de la evaluación de una asignacion

? Asumimos (arbitrariamente) que toda asignación evalua a 0

Asignacion   
Representaciondeestado local   
Modalidadesdepasajedeparametro   
Secuenciamiento

Pregunta: iA qué valor debe evaluar la siguiente expresión?

let count $=$ let localState = 0   
in proc () let dummy $=$ set localState $=$ add1(localState) in localState   
in $^ +$ ((count),(count))

# Respuesta:

count mantiene una variable privada localState esta variable privada representa su estado local localState lleva la cuenta de cuantas veces fue llamad o la expresion evalua a 3

<table><tr><td>Eduardo Bonelli</td><td>Extendiendo SFLconasignacion</td><td></td></tr></table>

Asignacion   
Representaciondeestado local   
Modalidadesdepasajedeparametro   
Secuenciamiento

Pregunta: iA qué valor debe evaluar la siguiente expresión?

let count $=$   
let localState = 0   
in proc () let dummy $=$ set localState $=$ add1(localState) in localState   
in $^ +$ ((count),(count))

# Respuesta:

count mantiene una variable privada localState esta variable privada representa su estado local localState lleva la cuenta de cuäntas veces fue llamado la expresión evaluaa 3

Asignacion   
Representacion de estado local   
Modalidadesdepasajedeparametro   
Secuenciamiento

# Modalidades de pasaje de parámetros

let $\mathtt { x } = 1 0 0$

in let p = proc (y) let d = set y = add1(y) in y in $+ ( \textbf { ( p ) } \textbf { x } )$ ,(p x))

Hay dos modalidades de pasaje de parámetros bien diferenciadas

Pasaje por valor: crear una nueva referencia (ie. una copia) por cada parämetro formal   
Pasaje por referencia: pasar la referencia existente como parämetro en lugar de una copia   
Asignacion   
Representacion de estado local   
Modalidadesdepasajedeparametro   
Secuenciamiento

# Modalidades de pasaje de parámetros

let $\mathtt { x } = 1 0 0$

in let p = proc (y) let d = set y = add1(y) in y in $+ ( \textbf { ( p ) } \textbf { x } )$ ,(p x))

Hay dos modalidades de pasaje de parámetros bien diferenciadas

·Pasaje por valor: retorna 202   
·Pasaje por referencia: retorna 203

Asignacion   
Representacion de estado local   
Modalidadesde pasajede parametro   
Secuenciamiento   
En la presencia de expresiones que arrojan efectos el orden de   
evaluación es crucial   
Considere la siguiente expresion

let in +(y,let d = set y= 4 in y) $\scriptstyle \mathtt { y } = 2$

Si los argumentos se evaluan de izquierda a derecha,arroja 6 como resultado   
Si los argumentos se evaluan de derecha a izquierda,arroja 8 como resultado   
Asignacion   
Representacion de estado local   
Modalidadesde pasajede parametro   
Secuenciamiento

Como consecuencia,un mecanismo explicito de secuenciamiento es necesario

Extendemos la sintaxis concreta de SFL <expr> ::= ... | set <identifier> = <expr> I (begin {<expr>}\*)

En la expresión (begin e1 e2 ... en)

。 las expresiones e1，e2，.., en se evaluan en ese orden • los valores retornados por e1，e2，..， en-1 son descartados 。 el valor retornado por en es el resultado de toda la expresión

Asignacion   
Representacion de estado local   
Modalidadesde pasaje de parametro   
Secuenciamiento

El siguiente ejemplo evalua a 4 let $\tt { y } = \tt { 2 }$ in (begin set y = 4, y)

El siguiente ejemplo evalua a O. El valor de la primera expresión argumento de begin (ie. y) se descarta.

let $\tt { y } = \tt { 2 }$ in (begin y, set $\ y \ = \ 4 )$

Introduccion Ejemplos en SFL con asignacion Intérprete para SFL con asignacion

Sintaxisabstracta   
Entornos   
Lamemoria ("Store")   
Elinterprete

data Program = Pgm Exp

data Exp = LitExp Int | VarExp Symbol I ... SetExp Symbol Exp I BeginExp [Exp] data PrimOp $=$ AddPrim I SubtractPrim I MultPrim | IncrPrim l DecrPrim I ZeroTestPrim

type Symbol = String

<table><tr><td></td><td>Eduardo Bonelli</td><td>ExtendiendoSFLconasignacion</td><td></td></tr></table>

Sintaxisabstracta   
Entornos   
Lamemoria ("Store")   
Elinterprete

El intérprete ahora toma como entrada una expresión a evaluar

2 un entorno que mapea variables a referencias una memoria (llamada “store") que mapea referencias (direcciones de memoria) a valores expresados (su contenido)

type Store $=$ Reference -> ExpressedValue

<table><tr><td></td><td>Eduardo Bonelli</td><td>(SFLA) 1 (SFLA=Prog. Fu</td></tr></table>

Sintaxisabstracta   
Entornos   
La memoria ("Store")   
El interprete

• El entorno mapea variables a referencias

Las referencias representan direcciones de memoria Se implementan como enteros

type Reference $=$ Int data Env $=$ EmptyEnv

I ExtendedEnvRecord [Symbol] [Reference] Env

<table><tr><td></td><td>Eduardo Bonelli ExtendiendoSFLconasignacion</td></tr></table>

Sintaxisabstracta   
Entornos   
La memoria ("Store")   
El interprete

Creación de entorno vacio emptyEnv :: Env emptyEnv $=$ EmptyEnv

Extensión de un entorno con lista de variables extendEnv :: [Symbol] -> Reference -> Env -> Env extendEnv ids ref env $=$ ExtendedEnvRecord ids [ref..ref $^ +$ (length ids)-1] env

Sintaxisabstracta   
Entornos   
La memoria ("Store")   
El interprete

Lookup en un entorno

applyEnv:: Env -> Store -> Symbol -> ExpressedValue applyEnv env st sym $=$ st (applyEnvRef env sym)

applyEnvRef:: Env -> Symbol -> Reference   
applyEnvRef EmptyEnv sym $=$ error ("applyEnv: Sin binding para "++ show sym)   
applyEnvRef (ExtendedEnvRecord syms refs env) sym $=$ case findInList syms sym of (Just n) -> refs!!n -> applyEnvRef env sym   
Sintaxisabstracta   
Entornos   
La memoria ("Store")   
Elinterprete

La memoria se llama store Un store mapea referencias a valores expresados type Store $=$ Reference -> ExpressedValue

Asumimos que si s es un store,entonces s aplicado a O indica   
la siguiente referencia libre para ser asignada   
Vamos a ver algunas operaciones sobre stores   
Sintaxisabstracta   
Entornos   
Lamemoria("Store")   
El interprete

Creacion de un store vacio

emptyStore :: Store   
emptyStore = \ref-> if ref==0 then Nro 1 else error "Store vacio!"

Siguiente referencia disponible para ser asignada nextAvail :: Store -> Reference nextAvail $\mathrm { ~ \bf ~ s ~ } =$ stripNro (s 0)

Sintaxisabstracta   
Entornos   
Lamemoria("Store")   
El interprete

Actualizar contenido de una referencia

updateStore :: Store -> Reference -> ExpressedValue -> Store   
updateStore s ref a $=$ let newStore r | ref==r = a l otherwise = s r in newStore   
Sintaxisabstracta   
Entornos   
Lamemoria("Store")   
El interprete

Asignar espacio nuevo en la memoria e inicializar

extendStoreUnit :: ExpressedValue -> Store -> Store   
extendStoreUnit a $\tt { s } = \tt { l e t }$ nextPos $=$ nextAvail s in let newStore ref 一 $\mathtt { r e f } \mathtt { = } \mathtt { = } 0 \ = \ \mathtt { N r o }$ (nextPos+1) l ref==nextPos = a l otherwise $=$ s ref in newStore   
extendStore :: Store -> [ExpressedValue] -> Store   
extendStore s xs $=$ foldr extendStoreUnit s (reverse xs)   
Sintaxisabstracta   
Entornos   
Lamemoria ("Store")   
Elinterprete

Antes el resultado de evaluar una expresion consistia solo en un valor expresado (numero o clausura)

data ExpressedValue $=$ Nro {stripNro: :Int} l Closure [Symbol] Exp Env

Ahora una expresión puede tener un efecto (alterar la memoria) El resultado de evaluar una expresión consiste en Un valor expresado (numero o clausura) 。 Un store: el estado resultante de la memoria

data Answer $=$ AnAnswer {value::ExpressedValue, store: :Store]

Sintaxis abstracta   
Entornos   
La memoria ("Store")   
Elinterprete

Intérprete de programas

evalProgram :: Program -> Answer   
evalProgram (Pgm body) $=$ evalExpression body emptyEnv emptyStore

Intérprete de expresiones

evalExpression :: Exp -> Env -> Store -> AnswerevalExpression (LitExp n) env st $=$ AnAnswer (Nro n） stevalExpression (VarExp id) env st $=$ AnAnswer (applyEnv env st id） st

Sintaxisabstracta   
Entornos   
Lamemoria ("Store")   
Elinterprete

Operaciones primitivas

evalExpression (PrimApp prim rands) env st = let (args,s1) $=$ foldl (\(xs,s) x-> let ans=evalExpression x env s in ((value ans):xs,store ans)) ([],st) rands in AnAnswer (applyPrimitive prim (reverse args)） s1

Sintaxisabstracta   
Entornos   
Lamemoria ("Store")   
Elinterprete

Interpretando if-then-else

evalExpression (IfExp testExp trueExp falseExp) env st = let ans $=$ evalExpression testExp env st in if isTrueValue (value ans) then evalExpression trueExp env (store ans) else evalExpression falseExp env (store ans)

<table><tr><td></td><td>Eduardo Bonelli</td><td>ExtendiendoSFLconasignacion （SFLA) 1 (SFLA=Prog. Fu</td></tr></table>

Sintaxisabstracta   
Entornos   
Lamemoria ("Store")   
Elinterprete

Interpretando la asignacion

evalExpression (SetExp id rhs) env st = let ans=evalExpression rhs env st in let ref=applyEnvRef env id in AnAnswer (Nro O) (updateStore (store ans) ref (value ans))

El valor expresado resultante de evaluar una asignación es (Nro 0) 。 Es el valor que fijamos (arbitrariamente) al principio de la clase 。 De interés es el store actualizado que es retornado

Sintaxisabstracta   
Entornos   
Lamemoria ("Store")   
Elinterprete

Interpretando begin

evalExpression (BeginExp exps) env st = let (args,s1) $=$ foldl (\(xs,s) x-> let ans=evalExpression x env s in ((value ans):xs,store ans)) ([],st) exps in if (null args) then AnAnswer (Nro O) s1 else AnAnswer (head args) s1