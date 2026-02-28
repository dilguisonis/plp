# PLP — Paradigmas de Lenguajes de Programación

Materia de la carrera de Ciencias de la Computación, UBA. 185 archivos markdown en `conocimiento/` convertidos de PDF con MinerU.

## Quick-Nav por Tema

| # | Tema | Teórica | Guía | Lecturas clave | Machete/Util |
|---|------|---------|------|----------------|--------------|
| 00 | Intro a Paradigmas | clase00 | p0 | — | — |
| 01 | Prog. Funcional | clase01 | p0, p1 | Bird (01) | intro-pf, pf-fidel, ejercicios-haskell |
| 02 | Recursión / Esquemas | clase02 | p1 | Hutton (02) | recursión-estructural |
| 03 | Razonamiento Ecuacional | clase03 | p2 | Bird (03) | inducción-estructural |
| 04 | Sistemas Deductivos | clase04 | p3 | Sørensen (04), Huth&Ryan | d_natural, weakening |
| 05 | Cálculo Lambda | clase05 | p4 | Pierce (05) | machete-lambda |
| 06 | Lambda Tipado | clase06 | p4 | Pierce (05), Sørensen&Urzyczyn | machete-lambda, weakening |
| 07 | Inferencia de Tipos | clase07 | p5 | Pierce (07), Baader (08) | inferencia, gen-inf, mgu |
| 08 | Lógica Primer Orden | clase08 | p6 | van Dalen (09) | d_natural_lpo |
| 09 | Resolución | clase09 | p7 | Robinson (10) | mgu |
| 10 | Prog. Lógica (Prolog) | clase10 | p8 | Nilsson (11) | apunte-prolog |
| 11 | POO (Smalltalk) | clase11 | p9 | Goldberg (12) | smalltalk-cheatsheet, apunte-smalltalk |
| 12 | Resolución SLD | clase12 | p8 | Nilsson (11) | apunte-prolog |

## Estructura del repositorio

```
conocimiento/
├── teoricas/          13 apuntes oficiales 2025 (clase00-12)
├── practicas/         30 archivos de clases prácticas
├── guias/             19 guías de ejercicios (p0-p9 + cubawiki)
├── lecturas/
│   ├── recomendadas/  13 lecturas de bibliografía oficial
│   ├── turno-manana/  10 handouts turno mañana
│   └── turno-noche/   13 handouts turno noche
├── examenes/
│   ├── parciales/
│   │   ├── primeros/  14 primeros parciales
│   │   └── segundos/  8 segundos parciales
│   └── finales/       1 enunciado de final
├── resoluciones/      8 resoluciones propias de finales
├── util/              20 machetes, apuntes y cheatsheets
└── design-patterns/   31 archivos (Dive Into Design Patterns)
```

## Cómo navegar

- **Buscar por tema/clase** → Leer `.claude/docs/curriculum-map.md` (mapa clase↔materiales con todos los cross-refs)
- **Buscar lectura específica** → Leer `.claude/docs/bibliography-map.md` (tabla lectura↔clase↔tema)
- **Preparar un examen** → Leer `.claude/docs/exam-topic-index.md` (frecuencia de temas, análisis por tipo de examen)
- **Buscar un archivo** → Leer `.claude/docs/file-map.md` (inventario completo de 185 archivos)
- **Resumen rápido de una clase** → Leer `.claude/summaries/teoricas-summary.md`
- **Resumen de una lectura** → Leer `.claude/summaries/lecturas-summary.md`
- **Qué tiene una guía** → Leer `.claude/summaries/guias-summary.md`
- **Qué machete usar** → Leer `.claude/summaries/util-summary.md`

## Reference Docs

| Documento | Descripción | Ubicación |
|-----------|-------------|-----------|
| Curriculum Map | Mapa clase↔materiales completo | `.claude/docs/curriculum-map.md` |
| Bibliography Map | Lecturas mapeadas a clases | `.claude/docs/bibliography-map.md` |
| Exam Topic Index | Análisis de temas por examen | `.claude/docs/exam-topic-index.md` |
| File Map | Inventario de 185 archivos | `.claude/docs/file-map.md` |
| Teóricas Summary | Resumen por clase (5-10 líneas) | `.claude/summaries/teoricas-summary.md` |
| Lecturas Summary | Resumen por lectura (3-5 líneas) | `.claude/summaries/lecturas-summary.md` |
| Guías Summary | Descripción por guía | `.claude/summaries/guias-summary.md` |
| Util Summary | Descripción por machete | `.claude/summaries/util-summary.md` |

## Convenciones

- Los archivos en `conocimiento/` fueron convertidos de PDF a markdown con MinerU — pueden tener artefactos de conversión
- Las teóricas siguen la numeración `clase00` a `clase12`
- Las guías principales son `p0` a `p9`; las cubawiki son `guiaejercicios01` a `guiaejercicios09`
- Las lecturas recomendadas están numeradas según la clase (`01-bird`, `05-pierce`, etc.)
- Las resoluciones en `resoluciones/finales/` son resoluciones propias del usuario
- Para agregar nuevo material: `./scripts/agregar_pdf.sh <pdf> <destino/>`
