# Las tres leyes de la generaci´on infinita

Para resolver un problema de generaci´on infinita, es importante recordar estas tres leyes:

1. Nunca debe usarse m´as de un generador infinito.   
2. El generador infinito siempre va a la izquierda de cualquier otro generador.   
3. Los generadores infinitos deben usarse ´unicamente para generar infinitas soluciones1.

Otra cosa a tener en cuenta: es importante es que las soluciones generadas en cada paso sean finitas, y que entre todas cubran todo el espacio de soluciones que se busca generar. Por ejemplo, si queremos generar todas las listas finitas de enteros positivos, no nos sirve que el generador infinito nos vaya dando la longitud de la lista, porque para cada longitud hay infinitas listas posibles. Tampoco nos sirve que vaya generando el primer elemento de la lista y que los dem´as est´en acotados por el primero, porque entonces nunca generar´ıamos las listas cuyo primer elemento no es el m´aximo. En cambio la suma de los elementos de la lista s´ı es un buen valor para ir generando en cada paso, ya que hay una cantidad finita de listas para cada suma posible, y entre todas las sumas obtenemos todas las listas (adem´as las soluciones en cada paso son disjuntas, lo cual siempre es ´util, ya que no tenemos que ocuparnos de eliminar soluciones repetidas).

En caso de que haya m´as de una forma posible de ir recorriendo el espacio de b´usqueda generando finitas soluciones en cada paso, conviene pensar cu´al es la forma m´as sencilla. Por ejemplo, para generar ´arboles binarios, no es muy ´util que el generator infinito genere la altura, ya que la altura de un sub´arbol no determina la del otro. No hay una receta para resolver todos los problemas posibles, pero si ven que el problema de c´omo generar las soluciones en cada paso es muy complejo, probablemente haya otra forma de usar el generador infinito que divida el espacio en particiones m´as sencillas de generar.