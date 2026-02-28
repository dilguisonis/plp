# Resumenes de Lecturas

## Lecturas Recomendadas (Bibliografia Oficial)

### 01 -- Bird: Programacion Funcional con Listas
**Clase:** 01-02 | **Tema:** Programacion Funcional
Capitulo 4 de "Thinking Functionally with Haskell" de Richard Bird. Cubre la estructura fundamental de listas en Haskell: notacion de listas, el operador cons (:), pattern matching, y operaciones basicas (map, filter, zip, concat). Introduce funciones de orden superior sobre listas, comprension de listas y operaciones como take, drop, y splitAt. Conceptos clave: tipos polimorficos, listas como tipo inductivo, funciones de orden superior, y el papel central de las listas en programacion funcional.

### 02 -- Hutton: Folds
**Clase:** 02-03 | **Tema:** Esquemas de Recursion
Tutorial de Graham Hutton (University of Nottingham) sobre la universalidad y expresividad del operador fold. Presenta fold como un esquema estandar de recursion sobre listas que encapsula un patron simple de recursion. Desarrolla la propiedad universal de fold como principio de prueba (evitando induccion) y como principio de definicion (transformando funciones recursivas en definiciones con fold). Demuestra que fold tiene mayor poder expresivo de lo esperado cuando se combina con tuplas y funciones como valores de primera clase.

### 03 -- Bird: Razonamiento Ecuacional
**Clase:** 03 | **Tema:** Razonamiento Ecuacional e Induccion Estructural
Capitulo 6 de Bird, dedicado a pruebas formales en programacion funcional. Introduce induccion sobre numeros naturales e induccion sobre listas como herramientas para demostrar propiedades de programas. Cubre la asociatividad de (++), propiedades de reverse, y el uso de lemas auxiliares. Presenta funciones de orden superior (map, filter, foldr) como mecanismo para generalizar pruebas y evitar repeticion. Conceptos clave: caso base, paso inductivo, principio de reemplazo, extensionalidad funcional.

### 04 -- Sorensen: Deduccion Natural
**Clase:** 04 | **Tema:** Sistemas Deductivos y Logica Proposicional
Capitulo 2 de Sorensen & Urzyczyn sobre logica intuicionista. Comienza con la interpretacion BHK (Brouwer-Heyting-Kolmogorov) donde las pruebas son construcciones explicitas. Define el sistema de deduccion natural NJ con reglas de introduccion y eliminacion para cada conectivo (conjuncion, disyuncion, implicacion, absurdo). Distingue logica clasica de intuicionista: se pierde el tercio excluido (p v -p) y la doble negacion. Conceptos clave: juicios, derivaciones como arboles, ex falso, fragmento implicacional, tautologias no constructivas.

### 05 -- Pierce: Lambda Calculo
**Clase:** 05-06 | **Tema:** Calculo Lambda
Capitulo 5 de "Types and Programming Languages" de Benjamin Pierce. Define el calculo lambda no tipado: sintaxis (variables, abstraccion, aplicacion), variables libres y ligadas, beta-reduccion y estrategias de evaluacion (full beta, normal order, call-by-name, call-by-value). Muestra como codificar booleanos de Church, numerales de Church, pares, y el combinador de punto fijo (Y). Conceptos clave: redex, forma normal, currying, alpha-equivalencia, semantica operacional, Church-Turing.

### 07 -- Pierce: Inferencia de Tipos
**Clase:** 07 | **Tema:** Inferencia de Tipos y Unificacion
Capitulo 22 de Pierce sobre reconstruccion de tipos. Presenta el algoritmo capaz de calcular el tipo principal de un termino sin anotaciones explicitas (base de ML y Haskell). Define sustituciones de tipo, tipado basado en restricciones (constraint-based typing), y conecta con unificacion. Desarrolla la relacion entre la vista declarativa y algoritmica del tipado. Conceptos clave: variables de tipo, instancias, tipo principal (most general), unificador mas general (mgu), let-polimorfismo.

### 08 -- Baader: Unificacion
**Clase:** 07 | **Tema:** Unificacion
Texto de Baader & Snyder sobre la teoria de unificacion. Define el problema de unificacion sintatica: dadas dos expresiones con variables, encontrar una sustitucion que las haga identicas. Presenta el algoritmo clasico con las reglas Delete, Decompose, Orient y Eliminate. Demuestra terminacion mediante una medida lexicografica (n1, n2, n3), correccion y completitud. Extiende a matching (una direccion) y analiza la complejidad exponencial del tamano del unificador. Conceptos clave: mgu, occurs check, forma resuelta, sustitucion idempotente.

### 09 -- van Dalen: Logica de Primer Orden
**Clase:** 08-09 | **Tema:** Logica de Primer Orden
Capitulo 3 de "Logic and Structure" de Dirk van Dalen. Introduce cuantificadores (forall, exists), estructuras (universo, relaciones, funciones, constantes), tipos de similaridad, y el lenguaje formal de primer orden. Define terminos y formulas por induccion, variables libres y ligadas, sustitucion, y semantica (interpretacion en estructuras). Cubre satisfaccion, validez, y el principio de induccion sobre TERM y FORM. Conceptos clave: formula cerrada (sentencia), modelo, consecuencia logica, equivalencia de formulas.

### 10 -- Robinson: Resolucion
**Clase:** 09-10 | **Tema:** Resolucion Logica
Articulo clasico de J.A. Robinson (1965) que introduce el principio de resolucion. Define la sintaxis clausal: literales, clausulas, clausula vacia, universo de Herbrand, saturacion y modelos. Presenta la resolucion ground, el Teorema de Herbrand, y la generalizacion a resolucion de primer orden con unificacion. Demuestra completitud del sistema (la clausula vacia se deriva sii el conjunto es insatisfactible). Conceptos clave: refutacion, resolvente, semiconmutatividad de resolucion con saturacion, principios de busqueda.

### 11 -- Nilsson: Resolucion SLD y Prolog
**Clase:** 10-11 | **Tema:** Programacion Logica y Prolog
Capitulo 2 de Nilsson & Maluszynski sobre programas logicos definidos. Introduce clausulas definidas (un solo literal positivo), programas definidos, y goals. Desarrolla la resolucion SLD como restriccion eficiente de la resolucion general a clausulas de Horn. Explica la semantica declarativa y operacional de Prolog: hechos, reglas, consultas, backtracking. Conceptos clave: clausula de Horn, cabeza/cuerpo, modelo minimo de Herbrand, arbol SLD, unificacion como mecanismo de computo.

### 12 -- Goldberg: Programacion Orientada a Objetos
**Clase:** 11-12 | **Tema:** POO
Capitulos introductorios de "Smalltalk-80: The Language and its Implementation" de Adele Goldberg & David Robson. Presenta los conceptos fundacionales de POO: objetos, mensajes, clases, instancias, metodos, variables de instancia. Explica el principio de encapsulamiento (memoria privada accesible solo via mensajes), la interfaz publica, y metodos primitivos. Usa FinancialHistory como ejemplo de aplicacion. Conceptos clave: todo es un objeto, polimorfismo por mensajes, modularidad, clases del sistema (aritmetica, estructuras de datos, control).

### Huth & Ryan: Logic in Computer Science (Capitulo 1)
**Clase:** 04 | **Tema:** Logica Proposicional y Deduccion Natural
Capitulo 1 de Huth & Ryan (2004). Introduce logica proposicional desde la perspectiva de ciencias de la computacion: sentencias declarativas, conectivos logicos (negacion, conjuncion, disyuncion, implicacion), tablas de verdad. Desarrolla deduccion natural con reglas de introduccion y eliminacion para cada conectivo. Presenta secuentes, validez de argumentos, y la construccion de pruebas formales. Conceptos clave: tautologia, equivalencia logica, forma normal, soundness, completitud proposicional.

### Sorensen & Urzyczyn: Capitulos 1 y 3
**Clase:** 05-06 | **Tema:** Calculo Lambda (no tipado y tipado)
Capitulos 1 y 3 de "Lectures on the Curry-Howard Isomorphism" (2006). El capitulo 1 cubre calculo lambda no tipado: pre-terminos, variables libres/ligadas, alfa-equivalencia, sustitucion, beta-reduccion, confluencia (Church-Rosser). El capitulo 3 (implicito en la referencia) desarrolla la correspondencia de Curry-Howard: formulas como tipos, demostraciones como programas, modus ponens como aplicacion. Conceptos clave: combinadores (I, K, S), formas normales, reduccion, isomorfismo de Curry-Howard.


## Lecturas Turno Manana (Handouts/Slides)

### clase01 -- Preliminares
**Clase:** 00 | **Tema:** Introduccion a la materia
Slides de presentacion de la materia PLP (turno manana, UBA, 2C2025). Incluye informacion administrativa: docentes (prof. Christian Cossio-Mercado), horarios (martes y viernes 9-14h), modalidad de evaluacion (2 parciales, 2 TPs grupales), y fechas de examenes. Introduce brevemente los temas de la materia: tipos basicos, secuencias, tipos inductivos, tipos abstractos, enumeraciones combinatorias.

### clase01 -- Programacion Funcional
**Clase:** 01 | **Tema:** Fundamentos de Programacion Funcional
Handout sobre fundamentos de programacion funcional. Define que es la PF: funciones sin efectos secundarios, datos inmutables, funciones como valores de primera clase. Cubre expresiones (constructores, variables, aplicacion), pattern matching, tipos basicos (Bool, Int, Char), listas, y el sistema de tipos de Haskell. Introduce notacion lambda, currificacion, y funciones de orden superior (map, filter).

### clase03 -- Razonamiento Ecuacional
**Clase:** 03 | **Tema:** Razonamiento Ecuacional e Induccion Estructural
Handout sobre razonamiento ecuacional e induccion estructural. Motiva la verificacion formal de programas funcionales (ej: quickSort = insertionSort). Presenta el principio de reemplazo, induccion sobre naturales y sobre listas, extensionalidad funcional, e isomorfismos de tipos. Hipotesis de trabajo: datos finitos (inductivos), funciones totales, independencia del orden de ecuaciones. Incluye casos de estudio con demostraciones formales.

### clase03 -- Recursion y Tipos Inductivos
**Clase:** 02 | **Tema:** Esquemas de Recursion
Slides sobre esquemas de recursion y tipos de datos inductivos. Repasa map y filter, introduce funciones anonimas (notacion lambda), funciones de orden superior, curry/uncurry. Presenta tipos de datos algebraicos definidos por el usuario y esquemas de recursion sobre otras estructuras (arboles). Conceptos clave: foldr, foldl, tipos algebraicos, pattern matching sobre tipos inductivos.

### clase04 -- Sistemas Deductivos
**Clase:** 04 | **Tema:** Sistemas Deductivos y Deduccion Natural
Handout sobre sistemas deductivos y deduccion natural para logica proposicional. Define juicios, axiomas, reglas de inferencia (lectura top-down y bottom-up). Desarrolla el sistema de deduccion natural con reglas de introduccion/eliminacion para conjuncion, disyuncion, implicacion, negacion y absurdo. Incluye semantica bivaluada (tablas de verdad) y la relacion entre derivabilidad y validez.

### clase05 -- Calculo Lambda
**Clase:** 05 | **Tema:** Calculo Lambda Tipado
Handout sobre el calculo lambda con booleanos (lambda^b). Define sintaxis de tipos (bool, tau -> sigma), sintaxis de terminos (variable, abstraccion, aplicacion, true, false, if-then-else), y reglas de tipado. Desarrolla la semantica operacional (valores, reglas de reduccion, beta-reduccion). Extiende a lambda^bn con numeros naturales (zero, succ, pred, isZero). Conceptos clave: juicio de tipado, contexto, forma normal, determinismo, progreso, preservacion de tipo.

### inferencia-handout
**Clase:** 07 | **Tema:** Unificacion e Inferencia de Tipos
Handout sobre unificacion e inferencia de tipos. Plantea el problema: dado un termino sin anotaciones, determinar si es tipable y hallar su tipo. Introduce incognitas en tipos, ecuaciones entre tipos, y el algoritmo de unificacion (con reglas Delete, Decompose, Orient, Eliminate, Swap, Occurs-check). Presenta el algoritmo W de inferencia de tipos y demuestra su correccion. Conceptos clave: termino tipable, sustitucion, mgu, occurs check, tipo principal.

### 08 -- Logica de Primer Orden
**Clase:** 08-09 | **Tema:** Logica de Primer Orden
Handout sobre logica de primer orden. Motiva la extension de logica proposicional con terminos y cuantificadores para razonar sobre elementos. Cubre sintaxis (terminos, formulas atomicas, cuantificadores), deduccion natural para LPO (reglas para forall e exists), semantica (estructuras, interpretaciones), y unificacion de terminos. Conecta con programacion logica: los programas son formulas y el sistema busca satisfacerlas.

### sld_prolog_handout
**Clase:** 10-11 | **Tema:** Resolucion SLD y Prolog
Handout sobre resolucion SLD y Prolog. Parte de la resolucion general (costosa, exponencial) y la restringe a clausulas de Horn para mayor eficiencia. Define resolucion SLD: seleccion de un literal del goal, busqueda de clausula unificable, resolvente. Presenta la semantica operacional de Prolog: busqueda depth-first, backtracking, orden de clausulas. Cubre aspectos extra-logicos: cut (!), negacion por falla, predicados aritmeticos.

### plp11 -- POO
**Clase:** 11-12 | **Tema:** Programacion Orientada a Objetos
Handout sobre POO en Smalltalk. Contextualiza la POO como paradigma distinto a los basados en logica (funcional/logico). Presenta historia (Simula, Smalltalk, Self), conceptos fundamentales: objetos, mensajes, metodos, colaboradores internos/externos, clases, instancias, herencia. Introduce Smalltalk con su sintaxis de mensajes (unarios, binarios, keyword), bloques, y control de flujo por mensajes. Conceptos clave: encapsulamiento, polimorfismo, dispatch dinamico.


## Lecturas Turno Noche (Handouts/Slides)

### plp_00 -- Preliminares
**Clase:** 00 | **Tema:** Introduccion a la materia
Slides de presentacion de PLP (turno noche, UBA, 2C2025). Docentes: prof. Pablo Barenbaum, JTPs Daniela Marottoli y Gabriela Steren. Horarios: martes y viernes 17-22h. Informacion administrativa: modalidad de evaluacion, TPs, fechas. Introduce la estructura de la materia con los mismos temas que el turno manana.

### plp01 -- Programacion Funcional
**Clase:** 01 | **Tema:** Fundamentos de Programacion Funcional
Handout identico al del turno manana sobre fundamentos de PF. Define PF, expresiones, pattern matching, tipos basicos, listas, sistema de tipos de Haskell. Introduce funciones como datos, notacion lambda, y funciones de orden superior. Conceptos clave: inmutabilidad, transparencia referencial, polimorfismo parametrico, currificacion.

### plp_02 -- Esquemas de Recursion
**Clase:** 02 | **Tema:** Esquemas de Recursion y Tipos Inductivos
Handout identico al del turno manana. Cubre map, filter, funciones anonimas, curry/uncurry, tipos algebraicos, y esquemas de recursion (foldr sobre listas y sobre otras estructuras como arboles). Conceptos clave: orden superior, tipos de datos algebraicos, recursion primitiva, fold como patron universal.

### plp03 -- Razonamiento Ecuacional
**Clase:** 03 | **Tema:** Razonamiento Ecuacional e Induccion Estructural
Handout identico al del turno manana. Motivacion para verificacion formal, principio de reemplazo, induccion sobre naturales y listas, extensionalidad, isomorfismos de tipos. Incluye casos de estudio y demostraciones formales de propiedades de programas funcionales.

### plp_04 -- Sistemas Deductivos
**Clase:** 04 | **Tema:** Sistemas Deductivos y Deduccion Natural
Handout identico al del turno manana sobre sistemas deductivos y deduccion natural para logica proposicional. Define juicios, axiomas, reglas de inferencia, y desarrolla el sistema NJ con reglas para todos los conectivos. Incluye semantica bivaluada.

### plp_05 -- Calculo Lambda
**Clase:** 05 | **Tema:** Calculo Lambda Tipado
Handout identico al del turno manana sobre calculo lambda^b y lambda^bn. Sintaxis de tipos y terminos, reglas de tipado, semantica operacional, beta-reduccion. Extension con naturales. Conceptos clave: tipado, contexto, forma normal, progreso, preservacion.

### main -- Correspondencia de Curry-Howard
**Clase:** 06 | **Tema:** Curry-Howard y Puntos Fijos
Handout sobre la correspondencia de Curry-Howard y operador de punto fijo. Muestra la analogia entre reglas de tipado del calculo lambda y reglas de deduccion natural: aplicacion = modus ponens, abstraccion = introduccion de implicacion. Formulas como tipos, demostraciones como terminos, habitabilidad de tipos. Introduce recursion via operador de punto fijo (Y combinator). Conceptos clave: isomorfismo proposiciones-tipos, programas como pruebas.

### plp07 -- Unificacion e Inferencia de Tipos
**Clase:** 07 | **Tema:** Unificacion e Inferencia de Tipos
Handout identico al del turno manana. Problema de inferencia de tipos, tipos parcialmente conocidos, algoritmo de unificacion, algoritmo W, correccion. Conceptos clave: termino tipable, sustitucion, mgu, occurs check, tipo principal.

### plp09 -- Logica de Primer Orden
**Clase:** 08-09 | **Tema:** Logica de Primer Orden
Handout identico al del turno manana. Extiende logica proposicional con terminos, predicados y cuantificadores. Cubre sintaxis, deduccion natural para LPO, semantica, y unificacion de terminos. Conecta con fundamentos de programacion logica.

### plp10 -- Resolucion Logica
**Clase:** 09-10 | **Tema:** Resolucion Logica
Handout sobre resolucion logica con introduccion a Prolog. Presenta ejemplos en Prolog (genealogia griega), terminos de primer orden, hechos y reglas. Desarrolla resolucion para logica proposicional (forma clausal, resolventes) y para logica de primer orden (Skolemizacion, unificacion). Conceptos clave: forma clausal, forma normal conjuntiva, clausula vacia como contradiccion, refutacion.

### sld_prolog_handout
**Clase:** 10-11 | **Tema:** Resolucion SLD y Prolog
Handout identico al del turno manana. Resolucion SLD como restriccion eficiente a clausulas de Horn. Semantica operacional de Prolog: DFS, backtracking, cut, negacion por falla. Aspectos extra-logicos del lenguaje.

### poo_handout -- POO
**Clase:** 11-12 | **Tema:** Programacion Orientada a Objetos
Handout sobre POO (marcado como TM pero compartido con turno noche). Historia, conceptos fundamentales (objetos, mensajes, clases, herencia), introduccion a Smalltalk. Mismos contenidos que plp11 del turno manana: encapsulamiento, polimorfismo, dispatch dinamico, sintaxis de Smalltalk.

### interpretes -- Interpretacion
**Clase:** 12 | **Tema:** Interpretes de Lenguajes
Handout sobre interpretacion de lenguajes de programacion. Define que es un interprete (programa que ejecuta programas), distingue lenguaje de implementacion y lenguaje objeto. Cubre interpretes basicos, extension con caracteristicas imperativas (asignacion, estado, secuenciacion) y caracteristicas funcionales (funciones como valores, closures, alcance lexico vs dinamico). Conceptos clave: AST, evaluacion, entorno, ambiente, semantica denotacional vs operacional.
