# Indice de Temas por Examen

## Temas mas frecuentes (general)

Analisis sobre **30 examenes** en total: 14 primeros parciales, 8 segundos parciales y 8 finales (1 enunciado + 7 resoluciones, mas 1 resolucion adicional del 12-12-25).

| Tema | Frecuencia | Aparece en |
|------|-----------|------------|
| Programacion Funcional / Haskell (fold, rec, tipos de datos) | 28/30 examenes | Todos los 1P, todos los finales, algunos 2P |
| Deduccion Natural | 25/30 examenes | Todos los 1P, la mayoria de 2P, la mayoria de finales |
| Calculo Lambda Tipado (reglas de tipado, semantica, reduccion) | 22/30 examenes | Todos los 1P, algunos 2P (inferencia), la mayoria de finales |
| Programacion Logica / Prolog | 22/30 examenes | Todos los 2P, la mayoria de finales |
| Inferencia de Tipos (algoritmo W/T) | 14/30 examenes | Varios 1P (parte 2), todos los 2P, algunos finales |
| Resolucion / Forma Clausal | 12/30 examenes | Todos los 2P, algunos finales |
| Induccion / Razonamiento Ecuacional | 14/30 examenes | Todos los 1P, algunos finales |
| Smalltalk / Objetos (OO, calculo sigma) | 10/30 examenes | La mayoria de 2P, algunos finales |
| Unificacion / MGU | 5/30 examenes | Algunos 2P, algunos finales |
| LPO (Logica de Primer Orden) | 6/30 examenes | Algunos 2P (en resolucion), algunos finales |
| Arboles SLD / Busqueda Prolog | 8/30 examenes | Varios 2P (analisis SLD en resolucion), algunos finales |
| Isomorfismo de Tipos | 2/30 examenes | Final 08-08-25 |

---

## Primeros Parciales

### Temas frecuentes en 1er parcial

| Tema | Frecuencia (sobre 14 examenes) |
|------|-------------------------------|
| Programacion Funcional (fold, rec, tipos de datos, funciones sin recursion explicita) | 14/14 (100%) |
| Induccion Estructural / Razonamiento Ecuacional | 14/14 (100%) |
| Deduccion Natural (sin principios clasicos) | 14/14 (100%) |
| Calculo Lambda Tipado (extensiones, reglas de tipado, semantica, reduccion) | 14/14 (100%) |
| Inferencia de Tipos (algoritmo W) | 4/14 (en los "2do parcial del 1er cuatrimestre" que son parciales de temas del 1P) |

### Detalle por examen

| Examen | Archivo | Temas |
|--------|---------|-------|
| 2024 1C 1P | `2024_1c_1p.md` | PF (arboles ternarios, foldAT, preorder, mapAT, nivel), Induccion (esPreRama/altura en AEB), Deduccion Natural ((P=>Q)^(Q=>R)=>~R=>~P), Lambda Tipado (extension con Diccionarios) |
| 2024 1C 2P | `2024_1c_2p.md` | **NOTA: Es un 2do parcial (temas de 2P)**: Resolucion (radios ruidosas, forma clausal, SLD), Prolog (notas estudiantes, eliminarAplazos, promedio, mejorEstudiante), Smalltalk (jerarquia A/B/C, metodo divisores), Deduccion Natural (cuantificadores, LPO) |
| 2024 2C 1P | `2024_2c_1p.md` | PF (Buffer, foldBuffer, recBuffer, contenido, puedeCompletarLecturas), Induccion (zipAB/altura en AB), Deduccion Natural ((p^o)v(p^t)=>(o^p)vt), Lambda Tipado (extension con arboles ternarios AT, foldAT) |
| 2024 2C 2P | `2024_2c_2p.md` | **NOTA: Es un 2do parcial**: Prolog (subsecuenciaCreciente, fibonacci), Resolucion (tipos lambda, forma clausal, SLD), Inferencia de Tipos (arboles ternarios, algoritmo W), Deduccion Natural (existencial/universal LPO) |
| 2025 1C 1P | `2025_1c_1p.md` | PF (ABNV, foldABNV, recABNV, elemABNV, reemplazarUno, nivel), Induccion (elemAB/mapAB con CONGRUENCIA), Deduccion Natural (p=>(ovl(p=>t))=>(ovt)), Lambda Tipado (listas ordenadas con head</tail<) |
| 2025 1C 2P | `2025_1c_2p.md` | **NOTA: Es un 2do parcial**: Prolog (esRotacion, collatz, collatzMayor), Resolucion (esSublista/member, forma clausal, SLD), Inferencia (AIH, algoritmo T), Deduccion Natural ((ExistsX ~P(X))^(ForallX ~R(X))=>ExistsX ~(P(X)^Q(X))), Smalltalk (twice en bloques) |
| 2025 1C 1R (Recu) | `plp-1c-2025-1r.md` | PF (LineaProd, foldLineaProd, recLineaProd, materialesUsados, sublineasDisjuntas, mismaEstructura), Induccion (hojas/espejo/reverse en AIH), Deduccion Natural ((p=>t)^(o=>t)=>(ovp)=>t), Lambda Tipado (extension con Regiones, foldRG, Rectangulo, Union) |
| 2024 2C Primer Parcial | `plp-2024-2c-primer_parcial.md` | PF (Buffer, fold/rec, posicionesOcupadas, contenido), Induccion (zipAB/altura), Deduccion Natural ((p^o)v(p^t)=>(o^p)vt), Lambda Tipado (arboles ternarios) |
| 2025 1C 1P Teorico (gdrive) | `plp-1c2025-1p-teorico-gdrive.md` | Preguntas teoricas: recursion explicita, tipo de foldABNV, tipo de recursion (global), lema de generacion, predicado unario para induccion, deduccion natural (error en paso), reduccion lambda, error en foldr |
| 2025 2C 1P | `plp_1parcial_2c25.md` | PF (FS filesystem, foldFS, recFS, rutas, valido, rutasPosibles), Induccion (tamano/truncar en Arbol23), Deduccion Natural ((p=>r)v(o=>t)=>(o^p)=>(rvt)), Lambda Tipado (Anillos, actual, avanzar) |
| 2025 1C 1P (EI) | `plp-1c-2025-1p-ei.md` | PF (ABNV, foldABNV, recABNV, elemABNV, reemplazarUno, nivel), Induccion (elemAB/mapAB), Deduccion Natural (p=>(ov(p=>t))=>(ovt)), Lambda Tipado (listas ordenadas) |
| 2024 1C 2do Parcial (BAC/MOA) | `plp-2024-1-c2-bac-primer_parcial-moa.md` | PF (arboles ternarios, foldAT), Induccion (esPreRama/altura en AEB), Deduccion Natural ((P=>Q)^(Q=>R)=>~R=>~P), Lambda Tipado (Diccionarios) |
| 2024 1C 1Recu | `plp_1recu_16_07_24_vf.md` | PF (Prop, foldProp, recProp, variables, evaluar, esEnFNN), Induccion (mismaEstructura en AIH), Inferencia de Tipos (algoritmo W con aplicaciones), Lambda Tipado (AIH, case, Hoja, Bin) |
| 2025 1C 1P Practico (gdrive) | `plp-1c2025-1p-practico-gdrive.md` | PF (ABNV, foldABNV, recABNV, elemABNV, reemplazarUno, nivel), Induccion (elemAB/mapAB), Deduccion Natural (p=>(ov(p=>t))=>(ovt)), Lambda Tipado (listas ordenadas) |

### Subtemas mas frecuentes en 1er parcial

| Subtema | Frecuencia |
|---------|-----------|
| Definir fold y/o rec para un tipo de dato custom | 14/14 |
| Definir funciones usando fold/rec (sin recursion explicita) | 14/14 |
| Induccion estructural sobre arboles o listas | 14/14 |
| Deduccion natural intuicionista (sin clasicos) | 14/14 |
| Extender calculo lambda tipado (nuevos tipos, reglas tipado, semantica, reduccion) | 14/14 |
| Reducir expresion paso a paso en lambda tipado | 10/14 |
| Definir macros en lambda tipado (mapAT, etc.) | 6/14 |

---

## Segundos Parciales

### Temas frecuentes en 2do parcial

| Tema | Frecuencia (sobre 8 examenes) |
|------|-------------------------------|
| Programacion Logica / Prolog | 8/8 (100%) |
| Resolucion / Forma Clausal / SLD | 8/8 (100%) |
| Deduccion Natural | 7/8 (88%) |
| Inferencia de Tipos | 7/8 (88%) |
| Smalltalk / Objetos | 6/8 (75%) |
| Unificacion / MGU (en preguntas teoricas o inferencia) | 4/8 (50%) |
| LPO (Logica de Primer Orden, dentro de resolucion) | 8/8 (100%) |

### Detalle por examen

| Examen | Archivo | Temas |
|--------|---------|-------|
| 2024 1C 2P | `plp-1c2024-2p.md` | Resolucion (radios/ruidosas, forma clausal, SLD), Prolog (notas estudiantes, eliminarAplazos, promedio, mejorEstudiante), Smalltalk (jerarquia A/B/C, divisores), Deduccion Natural (LPO, cuantificadores) |
| 2024 1C 2R | `plp-1c2024-2r.md` | Resolucion (cota superior, forma clausal, SLD), Prolog (generarCapicuas, tokenizar, mayorCantPalabras), Smalltalk (clases A/B, m1/m2/m3, eval/value, closure con respondsTo), Deduccion Natural (ExistsX P(X) v ForallY Q(Y) => ExistsX (Q(X)vP(X))) |
| 2024 2C 2P | `2024_2c_2p.md` | Prolog (subsecuenciaCreciente, subsecuenciaCrecienteMasLarga, fibonacci, reversibilidad), Resolucion (tipos lambda, forma clausal, SLD), Inferencia (arboles ternarios, algoritmo W), Deduccion Natural ((ExistsX P(X))=>(ForallY (P(Y)=>Q(Y)))=>ExistsZ Q(Z)) |
| 2024 2C 2R | `plp-2c2024-2r.md` | Prolog (caminoDesde en tablero, mochila/knapsack, reversibilidad, mejorMochila), Resolucion (seFormaCon/member, forma clausal, SLD), Inferencia (RoseTrees, algoritmo W, Map), Smalltalk (clases X/Y, action1/action2, baseValue/compute) |
| 2025 1C 2P | `plp-1c2025-2p.md` | Prolog (esRotacion, collatz, collatzMayor, reversibilidad), Resolucion (esSublista/member, forma clausal, SLD), Inferencia (AIH, algoritmo T/Z), Deduccion Natural ((ExistsX ~P(X))^(ForallX ~R(X))=>ExistsX ~(P(X)^Q(X))), Smalltalk (twice en bloques) |
| 2025 1C 2P Teorico (gdrive) | `plp-1c2025-2p-teorico-gdrive.md` | Preguntas teoricas: foldr (rectificar termino), MGU (paso valido, sustitucion), Deduccion Natural (existencial), Prolog (not/p(X), arboles nil/bin), length en Prolog, resolventes |
| 2025 1C 2R | `plp-1c2025-2r.md` | Prolog (unico, sinRepetidos, formula/logica proposicional, reversibilidad), Resolucion (funciones numericas, cota/supremo, forma clausal, SLD), Inferencia (Intervalos, algoritmo T), Deduccion Natural ((ForallX ExistsY (P(X,Y)^Q(Y,X)))=>ExistsX ExistsY Q(Y,X)), Smalltalk (runBatch en Object) |
| 2025 2C 2P | `plp_2parcial_2c25.md` | Prolog (listaAMelodia, submelodia, sinSubmelodiasEnComun, melodia), Resolucion (conjuntos vacios/union, forma clausal, SLD), Inferencia (Colas/queues, algoritmo T, map), Deduccion Natural ((~ForallY P(Y))=>ExistsX (P(X)=>Q(X))) |
| 2025 2C 2R | `plp_2recu_09-12-25.md` | Prolog (secuenciaRepetida en matrices, secuenciaMaxima, todasLasMatrices, reversibilidad), Resolucion (submelodia/melodia, forma clausal, SLD), Inferencia (Regiones, foldRG, algoritmo T, rectificar termino), Deduccion Natural (ExistsX P(X,X)=>ExistsY ForallZ ~P(Y,Z)) |

### Subtemas mas frecuentes en 2do parcial

| Subtema | Frecuencia |
|---------|-----------|
| Implementar predicados Prolog con instanciacion especifica | 8/8 |
| Analisis de reversibilidad | 6/8 |
| Pasar formulas a forma clausal | 8/8 |
| Usar resolucion para demostrar consecuencia logica | 8/8 |
| Determinar si la resolucion fue SLD | 8/8 |
| Inferir tipo con algoritmo W/T/Z | 7/8 |
| Deduccion Natural con cuantificadores (LPO) | 7/8 |
| Smalltalk: trazar ejecucion de mensajes | 5/8 |
| Smalltalk: implementar metodo | 5/8 |

---

## Finales

### Temas frecuentes en finales

| Tema | Frecuencia (sobre 8 finales) |
|------|------------------------------|
| Programacion Funcional / Haskell | 8/8 (100%) |
| Programacion Logica / Prolog | 8/8 (100%) |
| Deduccion Natural | 7/8 (88%) |
| Calculo Lambda Tipado | 5/8 (63%) |
| Razonamiento Ecuacional / Induccion | 4/8 (50%) |
| Resolucion | 2/8 (25%) |
| Smalltalk / Calculo Sigma | 2/8 (25%) |
| Unificacion / MGU | 2/8 (25%) |
| LPO (Logica de Primer Orden) | 2/8 (25%) |
| Isomorfismo de Tipos | 1/8 (13%) |
| Inferencia de Tipos | 1/8 (13%) |

### Detalle por examen

| Examen | Archivo | Temas |
|--------|---------|-------|
| Final 22-12-23 | `PLP_final_22-12-23.md` | LPO (formulas validas), Prolog (descomposicion de listas en N pasos), PF/Haskell (Nat, inversa de funcion biyectiva), Calculo Sigma/Smalltalk (memoizar), Lambda Tipado (Rec sobre listas) |
| Final 16-12-24 | `PLP_final_16-12-24.md` | PF (Dato a b, recursion primitiva, split con fold), Lambda Tipado (progreso/preservacion, V/F), Inferencia de Tipos (variantes regla aplicacion), Prolog (arbol busqueda, unificacion de clausulas, grafos/caminosSimples, reversibilidad), Deduccion Natural (ForallX(P(X)vQ(X))=>~ExistsZ(~P(Z)^~Q(Z)), Curry-Howard), Smalltalk (jerarquia A-D, method lookup) |
| Final 18-02-25 | `PLP_final_18-02-25.md` | PF/Haskell (Form, foldForm, forma normal negada), Induccion Estructural (alt g1 g2 . alt f1 f2 = alt (g1.f1) (g2.f2)), Deduccion Natural (nuevas reglas Delta, 3 demostraciones), Prolog (lambda-terminos, variablesLibres, tamano, generarLambdaTerminos) |
| Final 25-07-25 | `PLP_final_25-07-25.md` | PF (foldu, definir foldr con foldu y viceversa), Razonamiento Ecuacional (maxr/maxl/reverse, demostracion), Prolog (arbolGeneral, generar arboles), Deduccion Natural (nuevo conectivo binario circledplus, 2 demostraciones), Resolucion (infinitas clausulas con/sin refutacion) |
| Final 01-08-25 | `PLP_final_01-08-25.md` | Razonamiento Ecuacional (map f . post = rev [] . mapA f, sobre AB), PF + Resolucion (existeRefutacionSLD en Haskell, modelar resolucion SLD), Deduccion Natural (nuevo cuantificador circledot, demostrar con reglas nuevas), Prolog (esTautologia, formulas proposicionales) |
| Final 08-08-25 (enunciado) | `plp_final_08-08-25.md` | PF/Haskell (isomorfismo de tipos AX a b ~ AB (Either a (a,b))), Lambda Tipado (pattern matching, reglas tipado, semantica, reduccion), Prolog (generarRompecabezas, listas componibles), Deduccion Natural (nuevas reglas Theta, 2 demostraciones) |
| Final 08-08-25 (resolucion) | `PLP_final_08-08-25.md` | Mismo que enunciado con resoluciones detalladas |
| Final 12-12-25 | `PLP_final_12-12-25.md` | PF (Arbol Trebol AT, foldAT, altura, mapAT), Lambda Tipado (operador Delta, semantica intercalada, CBV vs CBN), Prolog (generarRompecabezas), Unificacion (relacion "mas general", V/F sobre sustituciones) |
| Final 12-12-25 (resolucion) | `final-12-12-25.md` | Mismos temas con resoluciones detalladas, tips sobre fold/tipado/unificacion |

---

## Distribucion de temas por tipo de examen

### Primer Parcial: temas garantizados
- **Programacion Funcional** (fold, rec, funciones sin recursion explicita) -- SIEMPRE
- **Induccion Estructural / Razonamiento Ecuacional** -- SIEMPRE
- **Deduccion Natural (proposicional, sin principios clasicos)** -- SIEMPRE
- **Calculo Lambda Tipado (extension con nuevos tipos)** -- SIEMPRE

### Segundo Parcial: temas garantizados
- **Programacion Logica / Prolog** -- SIEMPRE
- **Resolucion (forma clausal + aplicar resolucion + SLD)** -- SIEMPRE
- **Inferencia de Tipos** -- CASI SIEMPRE (7/8)
- **Deduccion Natural (con cuantificadores, LPO)** -- CASI SIEMPRE (7/8)
- **Smalltalk / Objetos** -- FRECUENTE (6/8)

### Final: temas mas probables
- **Programacion Funcional / Haskell** -- SIEMPRE
- **Programacion Logica / Prolog** -- SIEMPRE
- **Deduccion Natural (con reglas nuevas/custom)** -- CASI SIEMPRE (7/8)
- **Calculo Lambda Tipado** -- FRECUENTE (5/8)
- **Razonamiento Ecuacional** -- FRECUENTE (4/8)

---

## Recomendaciones de estudio

### Prioridad MAXIMA (aparecen en practicamente todos los examenes)

1. **Programacion Funcional en Haskell**: Dominar la definicion de `fold` y `rec` para cualquier tipo de dato algebraico. Practicar funciones sin recursion explicita usando fold. Tipos de datos vistos: arboles ternarios (AT), arboles binarios (AB, AEB, AIH), arboles no vacios (ABNV), buffers, listas de produccion, filesystems, arboles trebol, proposiciones logicas (Prop), regiones geometricas, anillos, listas ordenadas. Este tema aparece en el 100% de los examenes.

2. **Deduccion Natural**: Dominar las reglas de introduccion y eliminacion de todos los conectivos (^, v, =>, ~, bottom) y cuantificadores (forall, exists). Practicar demostraciones sin principios clasicos (intuicionistas). En finales, suelen agregar conectivos o cuantificadores nuevos con reglas custom. Este tema aparece en el 83% de los examenes.

3. **Calculo Lambda Tipado**: Saber extender el calculo lambda con nuevos tipos (reglas de tipado, conjunto de valores, semantica operacional a pequenos pasos, reglas de congruencia). Practicar reduccion paso a paso. Saber definir macros. Extensiones vistas: diccionarios, arboles ternarios, listas ordenadas, regiones, anillos, arboles con info en hojas, pattern matching, operador Delta. Este tema aparece en el 73% de los examenes.

4. **Programacion Logica / Prolog**: Practicar implementacion de predicados con instanciacion especifica (+/-). Dominar generadores exhaustivos sin repeticion. Saber analizar reversibilidad. Temas frecuentes: listas, arboles, grafos, secuencias numericas, optimizacion (mochila, mejor estudiante). No usar cut (!) ni setof (excepto not). Este tema aparece en el 73% de los examenes.

### Prioridad ALTA (aparecen en la mayoria de los examenes de su parcial)

5. **Induccion Estructural / Razonamiento Ecuacional**: Saber plantear la propiedad como predicado unario P(t). Dominar induccion sobre arboles y listas. Practicar lemas auxiliares y uso de extensionalidad. Aparece en todos los primeros parciales y la mitad de los finales.

6. **Resolucion / Forma Clausal**: Saber pasar formulas de LPO a forma clausal (skolemizacion). Aplicar resolucion para demostrar consecuencia logica. Saber justificar si la resolucion fue SLD o no (clausulas de Horn, linealidad). Aparece en todos los segundos parciales y algunos finales.

7. **Inferencia de Tipos**: Dominar el algoritmo W (o T/Z segun la variante). Saber inferir tipos paso a paso, incluyendo unificacion. Aparece en casi todos los segundos parciales.

### Prioridad MEDIA

8. **Smalltalk / Objetos**: Saber trazar ejecucion de mensajes (method lookup, self, super). Implementar metodos simples (divisores, twice, runBatch, closures). Aparece en 6/8 segundos parciales y 2/8 finales.

9. **Unificacion / MGU**: Conocer el algoritmo de Martelli-Montanari (delete, decompose, swap, elim, clash, occurs-check). Entender la relacion "mas general" entre sustituciones. Aparece explicitamente en algunos examenes teoricos y finales.

### Patrones especificos de finales

- Los finales suelen tener **4-5 ejercicios** que mezclan temas de ambos parciales.
- Es comun que introduzcan **reglas nuevas** de deduccion natural (conectivos custom como Theta, circledplus, Delta, o cuantificadores nuevos como circledot).
- Los ejercicios de Prolog en finales tienden a ser **generadores** (generar arboles, rompecabezas, lambda-terminos, tautologias).
- Los ejercicios de PF en finales pueden incluir **isomorfismos de tipos** o **relaciones entre distintos esquemas de recursion** (definir foldr con foldu y viceversa).
- El razonamiento ecuacional en finales es mas extenso que en parciales (involucra reverse, append, map sobre arboles).

### Consejo final

Para el final, asegurarse de dominar:
1. Programacion Funcional (fold/rec de cualquier tipo de dato)
2. Prolog (generadores, reversibilidad)
3. Deduccion Natural (incluyendo reglas custom)
4. Calculo Lambda Tipado (extension completa: tipado + valores + semantica + reduccion)
5. Al menos los basicos de razonamiento ecuacional

Estos 5 temas cubren la gran mayoria de los ejercicios de finales historicos.
