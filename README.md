# PLP — Paradigmas de Lenguajes de Programación

Repositorio de estudio para PLP (UBA - FCEn/FIUBA).

## Estructura

```
plp/
├── conocimiento/          Base de conocimiento (PDFs convertidos a Markdown)
│   ├── README.md          Índice general con links a todo
│   ├── teoricas/          Clases teóricas
│   ├── practicas/         Material de práctica
│   ├── guias/             Guías de ejercicios
│   ├── examenes/          Parciales y finales
│   ├── lecturas/          Papers y lecturas recomendadas
│   ├── util/              Machetes y resúmenes
│   ├── resoluciones/      Resoluciones propias
│   └── design-patterns/   Dive Into Design Patterns
│
├── final/                 Material original (PDFs, código, notas)
├── finales/               Resoluciones de finales (escritas a mano)
├── calculo_lambda/        Apuntes de cálculo lambda
├── prolog/                Material y ejercicios de Prolog
├── tp/                    Trabajo práctico
├── tp-prolog/             TP de Prolog
├── facu/                  Entregas
│
├── scripts/               Herramientas de conversión
│   ├── convert_pdfs.py    Conversión batch de todos los PDFs
│   ├── organizar_output.py  Organiza markdowns en conocimiento/
│   └── agregar_pdf.sh     Helper para agregar un PDF nuevo
│
├── GUIA_CONVERSION.md     Guía de conversión PDF → Markdown
└── README.md              Este archivo
```

## Base de Conocimiento

La base de conocimiento en [`conocimiento/`](conocimiento/) contiene todo el material convertido de PDF a Markdown usando [MinerU](https://github.com/opendatalab/MinerU), con fórmulas LaTeX, código y tablas preservados.

Ver el [índice completo](conocimiento/README.md).

## Temas cubiertos

- **Programación Funcional** — Haskell, esquemas de recursión, tipos algebraicos
- **Cálculo Lambda** — Lambda puro, reducción, tipado simple
- **Inferencia de Tipos** — Algoritmo W, unificación, MGU
- **Sistemas Deductivos** — Deducción natural, lógica proposicional, LPO
- **Resolución** — Resolución proposicional, resolución en LPO
- **Programación Lógica** — Prolog, resolución SLD, reversibilidad
- **Programación OO** — Smalltalk, method lookup

## Agregar material nuevo

```bash
./scripts/agregar_pdf.sh <archivo.pdf> <destino-en-conocimiento/>
```

Ver [GUIA_CONVERSION.md](GUIA_CONVERSION.md) para más detalles.
