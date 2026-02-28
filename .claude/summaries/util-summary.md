# Resumenes de Material Util (Machetes y Apuntes)

### machete-lambda.md
**Tema:** Calculo Lambda | **Clase:** 07-08
Machete compacto con la gramatica de tipos y terminos del calculo lambda tipado, todas las reglas de tipado (T-Var, T-Abs, T-App, T-If, T-True, T-False, T-Zero, T-Succ, T-Pred, T-IsZero), los valores, y las reglas de semantica operacional (E-App1, E-App2, E-AppAbs, congruencias para if/succ/pred/isZero).
Usar como referencia rapida durante ejercicios de tipado y reduccion de P4.

### d_natural.md
**Tema:** Deduccion Natural (Logica Proposicional) | **Clase:** 05-06
Machete con todas las reglas de deduccion natural para logica proposicional: introduccion y eliminacion de conjuncion, disyuncion, implicacion, negacion y absurdo. Incluye reglas derivadas (doble negacion, modus tollens) y la regla clasica de eliminacion de doble negacion.
Usar como referencia rapida para resolver los secuentes de P3.

### d_natural_lpo.md
**Tema:** Deduccion Natural (Logica de Primer Orden) | **Clase:** 11-12
Extension del machete de deduccion natural con las reglas para cuantificacion universal (introduccion y eliminacion de para-todo) y existencial (introduccion y eliminacion de existe). Incluye las mismas reglas proposicionales que d_natural.md.
Usar como referencia rapida para resolver los secuentes de P6.

### inferencia.md
**Tema:** Inferencia de Tipos | **Clase:** 09-10
Machete detallado del algoritmo de inferencia: rectificacion, anotacion con variables frescas, generacion de restricciones (reglas para True, False, variables, if-then-else, abstraccion, aplicacion, zero, succ, pred, isZero) y unificacion. Formato listo para consultar paso a paso.
Usar como guia mecanica para resolver ejercicios de inferencia de P5.

### gen-inf.md
**Tema:** Generacion Infinita (Haskell) | **Clase:** 02
Apunte "Las tres leyes de la generacion infinita": (1) nunca usar mas de un generador infinito, (2) el generador infinito va a la izquierda, (3) los generadores infinitos solo generan infinitas soluciones. Explica como particionar el espacio de busqueda en partes finitas y disjuntas (ejemplo: listas por suma, arboles por estructura).
Usar para resolver ejercicios 18-22 de P1 (paresDeNat, listasQueSuman, etc.).

### mgu.md
**Tema:** Unificacion (MGU) | **Clase:** 09-10, 11-12
Ejemplo completo paso a paso del algoritmo de unificacion (MGU) aplicado a tipos con flechas y listas. Muestra descomposicion, eliminacion de variable y composicion de sustituciones en detalle.
Usar como modelo de resolucion para ejercicios de unificacion de P5 y P6.

### weakening.md
**Tema:** Demostracion de Propiedades Meta-teoricas | **Clase:** 05-06, 07-08
Demostracion parcial de la propiedad de Weakening para Deduccion Natural, usando induccion estructural en la derivacion. Cubre el caso base (axioma) y el caso inductivo para la regla de implicacion. Los demas casos quedan como ejercicio.
Usar como modelo para resolver ejercicios 7 y 11 de P3 y P4 (debilitamiento, fortalecimiento).

### smalltalkcheatsheet.md
**Tema:** Smalltalk (Cheatsheet de Colecciones) | **Clase:** 17-18
Referencia rapida de operaciones sobre colecciones de Smalltalk: collect:, inject:into:, anySatisfy:, allSatisfy:, detect:ifNone:, Strings, OrderedCollection, Set, Bag, Dictionary, Streams (ReadStream, WriteStream). Con ejemplos de codigo y resultados.
Usar como referencia durante la resolucion de P9 y el TP de Smalltalk.

### ia.md
**Tema:** Etica academica / Inteligencia Artificial | **Clase:** Todas
Texto de la catedra explicando por que no se debe usar IA para resolver los TPs. Argumenta desde la etica (plagio), la formacion profesional (entrevistas tecnicas) y el pensamiento critico. No contiene material tecnico.
Leer como contexto de la materia; no es material de estudio tecnico.

### pf-paradigmas-fidel.md
**Tema:** Introduccion a Programacion Funcional | **Clase:** 01
Slides de Fidel Martinez Lopez sobre programacion funcional: transformacion de informacion vs. interaccion, transparencia referencial, equivalencia de programas. Material introductorio y conceptual.
Usar como lectura complementaria para la primera clase.

### ejercicios-resueltos-de-haskell.md
**Tema:** Haskell (Ejercicios Resueltos) | **Clase:** 01-02
Ejercicios resueltos de Haskell: generacion infinita de puntos del plano (usando diagonales x+y=k), foldAB para arboles binarios (tipo y uso). Incluye multiples soluciones por ejercicio.
Usar como referencia de resolucion para ejercicios de generacion infinita y esquemas de recursion de P1.

### introduccion-a-la-programacion-funcional.md
**Tema:** Programacion Funcional (Apunte Teorico) | **Clase:** 01-02
Apunte completo de introduccion al paradigma funcional: tipos de datos (basicos, algebraicos, sinonimos, recursivos), listas, arboles, expresiones aritmeticas, tipos abstractos, computacion (reduccion, bottom), aplicacion de funciones, orden de evaluacion, evaluacion lazy.
Usar como apunte teorico de base para toda la seccion de programacion funcional.

### recursion-estructural-primitiva-y-global.md
**Tema:** Tipos de Recursion | **Clase:** 01-02
Resumen conciso de los tres tipos de recursion: estructural (accede solo a argumentos no recursivos y resultados de recursion), primitiva (ademas accede a las subestructuras), global (ademas accede a resultados de recursiones anteriores). Ejemplos con longitud, insertarOrdenado y elementosEnPosicionesPares.
Usar como referencia rapida para clasificar la recursion en ejercicios de P1 y P2.

### demostracion-de-una-implicacion-mediante-induccion-estructural.md
**Tema:** Induccion Estructural (Ejemplo Completo) | **Clase:** 03-04
Ejemplo detallado de demostracion por induccion estructural sobre arboles (AEB): definiciones de altura, esPreRama, y demostracion de que esPreRama t xs implica length xs <= altura t. Muestra como manejar implicaciones dentro de la induccion.
Usar como modelo para resolver ejercicios de P2 que involucren implicaciones.

### repaso-funciones-totales-maybe.md
**Tema:** Funciones Totales y Maybe | **Clase:** 01
Apunte sobre funciones totales vs. parciales en Haskell: dominio, precondiciones, comportamiento de head y div. Explica el uso de Maybe como mecanismo para convertir funciones parciales en totales.
Usar como referencia para entender el manejo seguro de errores en Haskell (P0 y P1).

### apunte-de-prolog.md
**Tema:** Programacion Logica (Prolog) | **Clase:** 13-16
Apunte teorico de Prolog: sintaxis (terminos, constantes, variables, estructuras, formulas atomicas, clausulas de programa y objetivo), sustitucion y unificacion, algoritmo de resolucion SLD, semantica declarativa vs. operacional.
Usar como referencia teorica para resolver P7 y P8.

### apunte-de-smalltalk.md
**Tema:** Paradigma de Objetos (Smalltalk) | **Clase:** 17-18
Apunte teorico de Smalltalk: objetos y mensajes, protocolo, ocultamiento de datos, objetos elementales (numeros, strings, booleanos, arrays, simbolos), variables y asignacion, tipos de mensajes (unarios, binarios, keyword), clases, herencia, method dispatch.
Usar como referencia teorica para resolver P9 y el TP de Smalltalk.

### interprete-de-sfl.md
**Tema:** Interprete de SFL (Lenguaje Funcional Puro) | **Clase:** 07-08
Slides sobre el interprete de SFL (Simple Functional Language): sintaxis concreta y abstracta, componentes del interprete, extensiones (let, proc, letrec para recursion). Muestra como se implementa un lenguaje funcional puro desde cero.
Usar como material complementario para entender la semantica operacional del calculo lambda.

### interprete-de-sfla.md
**Tema:** Interprete de SFLA (SFL con Asignacion) | **Clase:** 07-08
Slides sobre SFLA: extension de SFL con asignacion, side-effects, diferencia entre valores denotados y expresados, store (memoria). Muestra como pasar de un lenguaje funcional puro a uno imperativo.
Usar como material complementario para entender side-effects y la diferencia con programacion funcional pura.

### interprete-de-sool.md
**Tema:** Interprete de SOOL (Lenguaje OO) | **Clase:** 17-18
Slides sobre SOOL: extension de SFLA con orientacion a objetos (clases, herencia, method dispatch dinamico, self/super, polimorfismo de subclase). Presenta problemas de sistemas de tipos para OO (covarianza, contravarianza, Binary Method Problem).
Usar como material complementario para entender los fundamentos teoricos del paradigma de objetos.
