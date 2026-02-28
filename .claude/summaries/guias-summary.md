# Resumenes de Guias de Ejercicios

## Guias Principales

### P0 -- Pre-funcional / Preliminares
**Clase:** 00 | **Ejercicios:** ~5
Introduccion a Haskell y GHCI. Cubre funciones basicas del Prelude (null, head, tail, etc.), definicion de funciones simples (valorAbsoluto, bisiesto, factorial), uso de Maybe/Either, operaciones sobre listas (limpiar, difPromedio, todosIguales) y arboles binarios (vacioAB, negacionAB, productoAB).
Dificultad baja: ideal para familiarizarse con la sintaxis de Haskell antes de la practica 1.

### P1 -- Programacion Funcional
**Clase:** 01-02 | **Ejercicios:** ~22
Curricacion y tipos (max2, normaVectorial, flip, curry/uncurry), esquemas de recursion (foldr, recr, foldNat, foldAB, foldAIH, foldRoseTree), listas (permutaciones, partes, sublistas), estructuras de datos (arboles binarios, polinomios, RoseTree, HashSet) y generacion infinita (paresDeNat, triplas pitagoricas, listasQueSuman).
Dificultad media-alta: guia central del paradigma funcional, muy importante para el parcial.

### P2 -- Demostracion (Razonamiento ecuacional e induccion estructural)
**Clase:** 03-04 | **Ejercicios:** ~14
Extensionalidad funcional, lemas de generacion para pares/Either, induccion sobre listas (length, duplicar, ++, reverse, map, filter, elem, foldr, foldl), induccion sobre arboles binarios (altura, cantNodos, truncar, inorder, elemAB), induccion sobre polinomios (evaluar, derivado, sinConstantesNegativas) y AIH (hojas, espejo).
Dificultad alta: requiere rigor formal en cada paso de demostracion. Muy frecuente en parciales y finales.

### P3 -- Logica Proposicional (Deduccion Natural)
**Clase:** 05-06 | **Ejercicios:** ~13 (con muchos sub-items, ~50+ demostraciones)
Semantica proposicional (tablas de verdad, tautologias, contradicciones), deduccion natural intuicionista y clasica: modus ponens, reduccion al absurdo, doble negacion, contraposicion, De Morgan, conmutatividad/asociatividad, ley de Peirce, tercero excluido, analisis de casos. Incluye debilitamiento, regla de corte y ejercicios extra extensos.
Dificultad media-alta: la cantidad de secuentes a demostrar es muy grande; requiere practica sistematica con las reglas.

### P4 -- Calculo Lambda (Tipado y Semantica Operacional)
**Clase:** 07-08 | **Ejercicios:** ~27
Sintaxis de terminos y tipos, arboles sintacticos, variables libres/ligadas, derivaciones de tipado, tipos habitados (Combinador S, K, flip, composicion), sustitucion, valores y formas normales, determinismo, semantica operacional (evaluacion en un paso y muchos pasos). Extensiones: pares (productos), uniones disjuntas (co-productos), listas con foldr, map, listas por comprension, conectivos booleanos como macros, colas bidireccionales (deque).
Dificultad alta: guia extensa y teorica, pilar fundamental para el segundo parcial.

### P5 -- Inferencia de Tipos
**Clase:** 09-10 | **Ejercicios:** ~10
Gramaticas de terminos anotados vs. sin anotaciones, variables de tipo (incognitas), aplicacion de sustituciones, unificacion (MGU), algoritmo de inferencia paso a paso (rectificacion, anotacion, generacion de restricciones, unificacion). Extensiones: pares, uniones disjuntas, listas con foldr. Numerales de Church.
Dificultad alta: el algoritmo de inferencia es mecanico pero largo; muy pedido en finales.

### P6 -- Logica de Primer Orden
**Clase:** 11-12 | **Ejercicios:** ~18 (con muchos sub-items)
Sintaxis de LPO (terminos, formulas, aridad), variables libres/ligadas, sustituciones, unificacion (algoritmo de Martelli-Montanari, MGU con tipos), deduccion natural en LPO (intercambio de cuantificadores, De Morgan, principio del bebedor, universal/existencial), formas normales (negada, prenexa), semantica (interpretaciones, asignaciones, validez logica).
Dificultad alta: combina unificacion con demostraciones formales; esencial para resolucion y Prolog.

### P7 -- Resolucion
**Clase:** 13-14 | **Ejercicios:** ~26
Resolucion proposicional (FNC, forma clausal, demostracion de tautologias), resolucion en LPO (forma normal de Skolem, skolemizacion, forma clausal, resolventes con sustituciones), clausulas de Horn, resolucion SLD, aplicaciones practicas (Smullyan, robots, abuelos, progenitores, relaciones irreflexivas/simetricas/transitivas). Conexion directa con Prolog (consultas, arboles de busqueda).
Dificultad media-alta: mecanico pero con muchos pasos; distinguir resolucion general de SLD es clave para finales.

### P8 -- Programacion Logica (Prolog)
**Clase:** 15-16 | **Ejercicios:** ~23
Motor de busqueda de Prolog (arboles de busqueda, backtracking), operaciones sobre listas (append, last, reverse, prefijo, sufijo, sublista, aplanar, interseccion, permutacion, reparto), instanciacion y reversibilidad (desde, intercalar), arboles binarios (inorder, ABB, insertar), Generate & Test (coprimos, cuadrados semi-magicos/magicos, triangulos), negacion por falla y cut, ejercicios integradores (grafos: caminos, Hamilton, conexo, estrella; arboles con generacion).
Dificultad media: practica y de programacion; hay que prestar atencion a terminacion e instanciacion.

### P9 -- Objetos (Smalltalk)
**Clase:** 17-18 | **Ejercicios:** ~23
Comparacion entre paradigmas (Smalltalk vs Haskell vs Prolog), objetos y mensajes (unarios, binarios, keyword), bloques/closures (value, curry, flip, repetirVeces), colecciones (OrderedCollection, Set, Bag, Dictionary, Array), method dispatch (self, super), herencia y polimorfismo (Counter/FlexibleCounter, Figura/Cuadrado/Circulo), diagramas de secuencia, tablas de envio de mensajes, monedas con conversion.
Dificultad media: conceptualmente distinto a los demas temas; requiere entender method lookup y self/super.

---

## Guias Cubawiki

### Guia 01 -- Programacion Funcional
**Clase:** 01-02 | **Ejercicios:** ~22
Contenido identico a P1 principal. Curricacion, esquemas de recursion (foldr, recr, foldNat, foldAB, foldAIH, foldRoseTree), generacion infinita.
Dificultad media-alta.

### Guia 02 -- Razonamiento Ecuacional e Induccion Estructural
**Clase:** 03-04 | **Ejercicios:** ~14
Contenido identico a P2 principal. Extensionalidad, lemas de generacion, induccion sobre listas, arboles y polinomios.
Dificultad alta.

### Guia 03 -- Demostracion en Logica Proposicional
**Clase:** 05-06 | **Ejercicios:** ~13
Contenido identico a P3 principal. Semantica proposicional, deduccion natural intuicionista y clasica, secuentes.
Dificultad media-alta.

### Guia 04 -- Calculo Lambda: Tipado y Semantica Operacional
**Clase:** 07-08 | **Ejercicios:** ~27
Contenido identico a P4 principal. Sintaxis, tipado, semantica operacional, extensiones (pares, co-productos, listas, deque).
Dificultad alta.

### Guia 05 -- Inferencia de Tipos
**Clase:** 09-10 | **Ejercicios:** ~10
Contenido identico a P5 principal. Algoritmo de inferencia, unificacion, extensiones con pares/listas/uniones.
Dificultad alta.

### Guia 06 -- Logica de Primer Orden
**Clase:** 11-12 | **Ejercicios:** ~18
Contenido identico a P6 principal. Sintaxis LPO, unificacion, deduccion natural, semantica.
Dificultad alta.

### Guia 07 -- Resolucion en Logica
**Clase:** 13-14 | **Ejercicios:** ~26
Contenido identico a P7 principal. Resolucion proposicional y de primer orden, clausulas de Horn, SLD.
Dificultad media-alta.

### Guia 08 -- Programacion Logica (Prolog)
**Clase:** 15-16 | **Ejercicios:** ~23
Contenido identico a P8 principal. Prolog, listas, arboles, Generate & Test, negacion por falla.
Dificultad media.

### Guia 09 -- Programacion Orientada a Objetos (Smalltalk)
**Clase:** 17-18 | **Ejercicios:** ~23
Contenido identico a P9 principal. Objetos, mensajes, bloques, herencia, method dispatch, diagramas de secuencia.
Dificultad media.
