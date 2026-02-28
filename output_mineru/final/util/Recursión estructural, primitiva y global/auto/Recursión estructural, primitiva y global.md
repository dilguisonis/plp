# Resumen de los principales tipos de recursión

Estructural: permite acceder a los argumentos no recursivos de los constructores, y a los resultados de la recursión para las subestructuras.

Primitiva: como la estructural, pero además permite acceder a las subestructuras.

Global: como la primitiva, pero además permite acceder a los resultados de las recursiones anteriores.

Por ejemplo:

longitud $[ \mathbf { \epsilon } ] ~ = ~ \mathbf { \epsilon } \otimes$ longitud ${ \bigl ( } \ldots \sp { \prime } \times \mathsf { s } { \bigr ) } = 1 +$ longitud xs

insertarOrdenado e $[ \mathbf { \nabla } ] ~ = ~ [ \mathbf { e } ]$   
insertarOrdenado e $( \mathsf { x } \colon \mathsf { x } \mathsf { s } ) \ = \ \mathsf { i } \mathsf { f } \ \textsf { e } \ < \ \mathsf { x }$ then e:x:xs else x:(insertarOrdenado e xs)   
elementosEnPosicionesPares $[ \mathbf { \nabla } ] ~ = ~ [ \mathbf { \nabla } ]$   
elementosEnPosicionesPares $( { \bf x } \colon { \bf x } { \mathsf s } ) ~ = ~ { \bf i } { \mathsf f }$ null xs then [x] else x:elementosEnPosicionesPares (tail xs)

1. La recursión de longitud es estructural, porque hace recursión sobre la cola de la lista (xs) pero no accede a la cola en sí, ni a resultados de recursiones anteriores.

2. La recursión de insertarOrdenado es primitiva porque accede directamente a xs (además de hacer recursión), pero no accede a los resultados anteriores.

3. La recursión de elementosEnPosicionesPares es global, ya que accede a un resultado anterior: el de la recursión sobre la cola de la cola de la lista (es decir tail xs).