# Ejercicio 1

Dos tipos son isomorfos si existen 2 funciones:

。 $\mathsf { f } \mathrel { \mathop : } \mathrel { \mathsf { a } } \mathrel { \mathop  } \mathsf { b } ,$   
g :: b -> a   
tales que f . g = id y g . f = id

Teniendo los siguientes tipos de dato:

Either a b $=$ left a | right b   
AB a $=$ nil | bin a (AB a) (AB a)   
AX a b $=$ vacio | nodoA a (AX a b) (AX a b) | nodoAB a b (AX a) (AX a)

Demostrar que los tipos (AX a b) y AB (either a (a,b)) son isomorfos.

# Ejercicio 2

Se cuenta con cálculo lambda extendido con booleanos y pares. Se quiere extender para introducir pattern matching. El patrón P puede tomar las siguientes formas:

P ::= x | V | <P, P>

Que representan una variable, un valor, y un par de patrones respectivamente.

Se agrega el siguiente término:

Match P \~ M1 then M2 else M3

El comportamiento esperado es el siguiente:

Se evalua M1 hasta obtener un valor.   
Si ese valor "concuerda" con P, se procede a evaluar M2.   
De lo contrario se evalua M3.

P y M1 "concuerdan" de la siguente manera:

Si P es una variable x , concuerda con cualquier valor ligandose a ese valor.   
Si P es un valor , solo concuerda con el mismo valor.   
Si P es un par ${ \tt - P 1 }$ , $\mathsf { P } 2 \mathsf { > }$ , concuerda con otro valor si ese valor es un par <x, y> donde P1 concuerda con x y P2 concuerda con y.

a) Extender las reglas de tipado para que los patrones esten tipados correctamente.

b) dar una derivación de tipo para la siguente expresión: Match $< \mathsf { X } , \mathsf { y } > \sim \mathsf { p }$ then <y, $\mathsf { X } \mathrm { > }$ else p

c) Extender el conjunto de valores y dar las nuevas reglas de semántica.

d) reducir la siguiente expresión:

Match < $x , y > \sim < 1 , 2 >$ then <y, $\mathsf { X } \mathsf { \Sigma } >$ else ${ < } 0 , 0 >$

# Ejercicio 3

Dos listas l1 y l2 son componibles si tienen un elemento en común que los permite "concatenar" Por ejemplo [1,2,3] es componible con [3,4,5] y la concatenación de esas dos listas es [1,2,3,4,5].   
Se extiende de manera obvia a n listas, [l1,...,ln]: Por ejemplo [1,2] [2,3] [3,4] [4,5] son componibles y resulta en la lista [1,2,3,4,5]   
Un rompecabezas es una lista de listas tal que son componibles para algún orden: Ej la solución [1,2,3,4,5] tiene como rompecabezas la lista [[2,3,4],[1,2],[4,5]] (en este caso es la única solución)   
Implementar el predicado generarRompecabezas( $( + 5 ,$ -R) que dado una lista solución S, instancia en R todos los rompecabezas que tienen a S como solución.

# Ejercicio 4

Se extiende deducción natural con las siguientes reglas:

Γ ⊢ α Γ, τ ⊢ ⊥ _ϴi Γ ⊢ α ϴ τ

Γ ⊢ α ϴ τ Γ,α ⊢ τ _ϴe Γ ⊢ ρ

Demostrar que:

a) $\lnot ( { \ l } { \ l } { \mathsf { a } } = \ l { \mathsf { s } } { \mathrm { ~ } } { \mathrm { ~ } } { \mathrm { ~ } } { \mathrm { ~ } } { \ l } )  { \ l } { \ l } { \mathsf { a } } \ominus { \mathrm { ~ } } { \mathrm { ~ } }$ b) ¬(α ϴ τ) ⊢ α => τ