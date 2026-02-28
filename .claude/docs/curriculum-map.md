# Mapa Curricular — PLP

Mapa clase por clase con cross-references a todos los materiales disponibles.
Todos los paths son relativos a `conocimiento/`.

---

## Clase 00 — Introducción a Paradigmas

- **Teórica:** `teoricas/plp_apunte_2025_clase00.md`
- **Guía:** `guias/p0_pre_funcional.md`, `guias/plp_apunte_2025_guiaejercicios01.md`
- **Lecturas TM:** `lecturas/turno-manana/clase01-teórica-preliminares.md`
- **Lecturas TN:** `lecturas/turno-noche/plp_00.md`
- **Temas:** Qué es un paradigma, historia de lenguajes de programación, repaso de conceptos matemáticos (conjuntos, relaciones, funciones, inducción). Motivación del curso.

---

## Clase 01 — Programación Funcional

- **Teórica:** `teoricas/plp_apunte_2025_clase01.md`
- **Práctica:** `practicas/haskell-1.md`, `practicas/plp_apunte_2025_practicaprogramacionfuncionalenhaskell.md`
- **Guía:** `guias/p1_funcional.md`, `guias/plp_apunte_2025_guiaejercicios01.md`, `guias/plp_apunte_2025_guiaejercicios02.md`
- **Lecturas:** `lecturas/recomendadas/01-bird-pf_con_listas.md`
- **Lecturas TM:** `lecturas/turno-manana/clase01_programaciónfuncional.md`
- **Lecturas TN:** `lecturas/turno-noche/plp01.md`
- **Util:** `util/introducción-a-la-programación-funcional.md`, `util/pf-paradigmas-fidel.md`, `util/ejercicios-resueltos-de-haskell.md`, `util/repaso-funciones-totales-maybe.md`, `util/intérprete-de-sfl.md`
- **Temas:** Paradigma funcional, Haskell, tipos básicos, pattern matching, funciones de orden superior, currificación, composición, listas, tuplas, guardas. Transparencia referencial, evaluación lazy.

---

## Clase 02 — Recursión y Esquemas de Recursión

- **Teórica:** `teoricas/plp_apunte_2025_clase02.md`
- **Práctica:** `practicas/haskell-2.md`, `practicas/haskell-3.md`, `practicas/20250902_haskell_2_pizarro-n.md`, `practicas/plp_apunte_2025_practicaprogramacionfuncional2.md`, `practicas/plp_apunte_2025_practicaprogramacionfuncional3.md`
- **Guía:** `guias/p1_funcional.md`, `guias/plp_apunte_2025_guiaejercicios02.md`, `guias/plp_apunte_2025_guiaejercicios03.md`
- **Lecturas:** `lecturas/recomendadas/02-hutton-folds.md`
- **Lecturas TM:** `lecturas/turno-manana/clase03-teórica-recursion_diapos.md`
- **Lecturas TN:** `lecturas/turno-noche/plp_02.md`
- **Util:** `util/recursión-estructural-primitiva-y-global.md`
- **Temas:** Recursión estructural, recursión primitiva, recursión global. Esquemas: foldr, foldl, recr. Universalidad de fold, fusión. Definición de tipos algebraicos, data.

---

## Clase 03 — Razonamiento Ecuacional e Inducción

- **Teórica:** `teoricas/plp_apunte_2025_clase03.md`
- **Práctica:** `practicas/plp_apunte_2025_practicarepasoparaelprimerparcial.md`
- **Guía:** `guias/p2_demostracion.md`, `guias/plp_apunte_2025_guiaejercicios03.md`
- **Lecturas:** `lecturas/recomendadas/03-bird-razonamiento_ecuacional.md`
- **Lecturas TM:** `lecturas/turno-manana/clase03-razonamientoecuacional_handout.md`
- **Lecturas TN:** `lecturas/turno-noche/plp03.md`
- **Util:** `util/demostración-de-una-implicación-mediante-inducción-estructural.md`
- **Temas:** Demostración ecuacional, inducción estructural sobre listas y naturales. Extensionalidad. Principio de inducción. Demostración de propiedades de funciones (map, foldr, ++, etc).

---

## Clase 04 — Sistemas Deductivos / Deducción Natural

- **Teórica:** `teoricas/plp_apunte_2025_clase04.md`
- **Práctica:** `practicas/sistemas_deductivos.md`, `practicas/plp_apunte_2025_practicasistemasdeductivos.md`
- **Guía:** `guias/p3_proposicional.md`, `guias/plp_apunte_2025_guiaejercicios04.md`
- **Lecturas:** `lecturas/recomendadas/04-sorensen-deduccion_natural.md`, `lecturas/recomendadas/huth-and-ryan-2004-logic-in-computer-science-capítulo-1.md`, `lecturas/recomendadas/s-rensen-and-urzyczyn-2006-cap-1-y-3.md`
- **Lecturas TM:** `lecturas/turno-manana/clase04_sistemasdeductivos_handout.md`
- **Lecturas TN:** `lecturas/turno-noche/plp_04.md`
- **Util:** `util/d_natural.md`, `util/weakening.md`
- **Temas:** Lógica proposicional, conectivos, tablas de verdad. Deducción natural: reglas de introducción y eliminación (∧I, ∧E, →I, →E, ∨I, ∨E, ¬I, ¬E, ⊥E, RAA). Derivaciones. Soundness y completitud.

---

## Clase 05 — Cálculo Lambda (sin tipos)

- **Teórica:** `teoricas/plp_apunte_2025_clase05.md`
- **Práctica:** `practicas/plp_05.md`, `practicas/plp_apunte_2025_practicacalculolambda.md`, `practicas/plp_apunte_2025_practicacalculolambda2.md`
- **Guía:** `guias/p4_lambda.md`, `guias/plp_apunte_2025_guiaejercicios05.md`
- **Lecturas:** `lecturas/recomendadas/05-pierce-lambda.md`
- **Lecturas TM:** `lecturas/turno-manana/clase05_clambda1_handout.md`
- **Lecturas TN:** `lecturas/turno-noche/plp_05.md`
- **Util:** `util/machete-lambda.md`, `util/intérprete-de-sfla.md`
- **Temas:** Sintaxis del λ-cálculo (variables, abstracción, aplicación). Variables libres y ligadas (FV). α-equivalencia, β-reducción, η-reducción. Formas normales. Estrategias: call-by-name, call-by-value, normal order. Teorema de Church-Rosser. Codificación de Church (booleanos, naturales, pares).

---

## Clase 06 — Cálculo Lambda Tipado

- **Teórica:** `teoricas/plp_apunte_2025_clase06.md`
- **Práctica:** (continúa de clase 05)
- **Guía:** `guias/p4_lambda.md`, `guias/plp_apunte_2025_guiaejercicios05.md`
- **Lecturas:** `lecturas/recomendadas/05-pierce-lambda.md`, `lecturas/recomendadas/s-rensen-and-urzyczyn-2006-cap-1-y-3.md`
- **Util:** `util/machete-lambda.md`, `util/weakening.md`
- **Temas:** Sistema de tipos simple (λ→). Juicios de tipado (Γ ⊢ M : σ). Reglas de tipado (T-Var, T-Abs, T-App). Subject reduction, progress. Currificación a nivel de tipos. Isomorfismo de Curry-Howard. Normalización fuerte.

---

## Clase 07 — Inferencia de Tipos

- **Teórica:** `teoricas/plp_apunte_2025_clase07.md`
- **Práctica:** `practicas/clase_inferencia.md`, `practicas/plp_apunte_2025_practicainferenciadetipos.md`, `practicas/plp07.md`
- **Guía:** `guias/p5_inferencia.md`, `guias/plp_apunte_2025_guiaejercicios06.md`
- **Lecturas:** `lecturas/recomendadas/07-pierce-inferencia.md`, `lecturas/recomendadas/08-baader-unificacion.md`
- **Lecturas TM:** `lecturas/turno-manana/inferencia-handout.md`
- **Lecturas TN:** `lecturas/turno-noche/plp07.md`
- **Util:** `util/inferencia.md`, `util/gen-inf.md`, `util/mgu.md`
- **Temas:** Problema de inferencia de tipos. Algoritmo W de Hindley-Milner. Generación de restricciones (ecuaciones de tipo). Unificación: algoritmo de Martelli-Montanari, MGU (unificador más general). Sustituciones, composición. Polimorfismo paramétrico (esquemas de tipo). Generalización (Gen) e instanciación.

---

## Clase 08 — Lógica de Primer Orden (LPO)

- **Teórica:** `teoricas/plp_apunte_2025_clase08.md`
- **Práctica:** `practicas/logica_1ra.md`, `practicas/principio-del-bebedor.md`
- **Guía:** `guias/p6_lpo.md`, `guias/plp_apunte_2025_guiaejercicios07.md`
- **Lecturas:** `lecturas/recomendadas/09-vandalen-logica_de_primer_orden.md`
- **Lecturas TM:** `lecturas/turno-manana/08-lpo-handout.md`
- **Util:** `util/d_natural_lpo.md`
- **Temas:** Sintaxis de LPO: términos, fórmulas, cuantificadores (∀, ∃). Variables libres/ligadas, sustitución. Semántica: estructuras, interpretaciones, valuaciones. Satisfacibilidad, validez, consecuencia lógica. Deducción natural en LPO: reglas ∀I, ∀E, ∃I, ∃E (con restricciones de eigenvariable).

---

## Clase 09 — Resolución

- **Teórica:** `teoricas/plp_apunte_2025_clase09.md`
- **Práctica:** `practicas/clase_resolucion.md`, `practicas/plp_apunte_2025_practicaresolucionlogicaprimerorden.md`
- **Guía:** `guias/p7_resolucion.md`, `guias/plp_apunte_2025_guiaejercicios08.md`
- **Lecturas:** `lecturas/recomendadas/10-robinson-resolucion.md`
- **Lecturas TN:** `lecturas/turno-noche/plp09.md`
- **Util:** `util/mgu.md`
- **Temas:** Forma clausal. Forma normal conjuntiva (FNC). Skolemización. Resolución proposicional: resolventes, refutación. Resolución en LPO: unificación, factor, resolvente binario. Soundness y completitud de resolución. Estrategias de resolución.

---

## Clase 10 — Programación Lógica (Prolog)

- **Teórica:** `teoricas/plp_apunte_2025_clase10.md`
- **Práctica:** `practicas/plp10.md`, `practicas/tp-prolog.md`, `practicas/plp_apunte_2025_practicaprogramacionlogica.md`, `practicas/plp_apunte_2025_practicaprogramacionlogica2.md`
- **Guía:** `guias/p8_prog_logica.md`, `guias/plp_apunte_2025_guiaejercicios08.md`, `guias/plp_apunte_2025_guiaejercicios09.md`
- **Lecturas:** `lecturas/recomendadas/11-nilsson-resolucion_sld_y_prolog.md`
- **Lecturas TN:** `lecturas/turno-noche/plp10.md`
- **Util:** `util/apunte-de-prolog.md`
- **Temas:** Programación lógica como paradigma. Prolog: hechos, reglas, consultas. Unificación en Prolog. Aritmética (is, =:=). Listas en Prolog (append, member, etc). Reversibilidad. Cut (!). Negación por falla (not, \+). Generate & test.

---

## Clase 11 — Programación Orientada a Objetos (Smalltalk)

- **Teórica:** `teoricas/plp_apunte_2025_clase11.md`
- **Práctica:** `practicas/extensiones-handout.md`
- **Guía:** `guias/p9_objetos.md`, `guias/plp_apunte_2025_guiaejercicios09.md`
- **Lecturas:** `lecturas/recomendadas/12-goldberg-poo.md`
- **Lecturas TM:** `lecturas/turno-manana/plp11.md`
- **Lecturas TN:** `lecturas/turno-noche/poo_handout.md`
- **Util:** `util/smalltalkcheatsheet.md`, `util/apunte-de-smalltalk.md`, `util/intérprete-de-sool.md`
- **Temas:** Paradigma OO. Smalltalk: objetos, mensajes, clases, metaclases. Method lookup. Herencia simple. Polimorfismo, encapsulamiento. Bloques (closures). Colecciones. Self y super. Dispatch dinámico.

---

## Clase 12 — Resolución SLD

- **Teórica:** `teoricas/plp_apunte_2025_clase12.md`
- **Práctica:** (comparte con clase 10)
- **Guía:** `guias/p8_prog_logica.md`
- **Lecturas:** `lecturas/recomendadas/11-nilsson-resolucion_sld_y_prolog.md`
- **Lecturas TM:** `lecturas/turno-manana/sld_prolog_handout.md`
- **Lecturas TN:** `lecturas/turno-noche/sld_prolog_handout.md`
- **Temas:** Resolución SLD (Selective Linear Definite). Cláusulas de Horn. Árboles SLD. Derivación SLD. Respuesta computada. Soundness y completitud de SLD. Relación con Prolog: estrategia de búsqueda depth-first, regla de selección. Occur check.

---

## Materiales Transversales

### Prácticas de repaso
- `practicas/preparcial1-20252c.md` — Repaso pre-parcial 1 (2025 2C)
- `practicas/plp_apunte_2025_practicarepasoparaelprimerparcial.md` — Repaso primer parcial
- `practicas/20251003_clase-repaso.md` — Clase de repaso general
- `practicas/2025_1c_2r.md` — Repaso 2025 1C

### Trabajos Prácticos
- `practicas/tp1.md` — TP 1 (Haskell)
- `practicas/tp-prolog.md` — TP Prolog

### Intérpretes (semántica operacional)
- `util/intérprete-de-sfl.md` — Intérprete de SFL (lenguaje funcional simple)
- `util/intérprete-de-sfla.md` — Intérprete de SFLA (SFL + λ-cálculo)
- `util/intérprete-de-sool.md` — Intérprete de SOOL (lenguaje OO simple)
- `lecturas/turno-noche/intérpretes.md` — Material sobre intérpretes

### Design Patterns (material complementario)
- `design-patterns/` — 31 archivos sobre patrones de diseño (GoF)
- Ver `design-patterns/README.md` para índice completo
