# Prolog - Clase PLP

Este repositorio contiene ejercicios, apuntes y material de estudio sobre Prolog y resolución SLD.

## Estructura del Proyecto

### 📝 apuntes-claude/
Análisis detallados de resolución SLD generados con Claude Code.

#### resolucion-sld/
- `arbol_mayorA2.md` - Análisis de mayorA2(X): generación infinita de naturales >= 3
- `arbol_long.md` - Análisis de long([1,2,3], X): cálculo de longitud de listas
- `arbol_menorOIgual.md` - Análisis de menorOIgual(0, X): predicado reversible
- `arbol_garfield.md` - Análisis de backtracking con mascotas y gatos

#### conceptos/
- `explicacion_unificacion.md` - Por qué X := I en la unificación
- `importancia_natural.md` - Predicados generadores vs verificadores

#### analisis-errores/
- `analisis_sinConsecRep.md` - Análisis de errores y soluciones para sinConsecRep/2

### 💻 ejercicios/
Código Prolog con ejercicios de la materia.

- `program.pl` - Ejercicios generales (naturales, listas, árboles)
- `guia.pl` - Ejercicios de guía (menorOIgual, vecino)
- `prolog-parte2.pl` - Ejercicios avanzados (primos, triángulos, coprimos)

### 📚 material/
PDFs de clases y material teórico.

- `PLP07.pdf`, `PLP10.pdf` - Teóricas
- `clase_inferencia.pdf` - Inferencia en lógica de primer orden
- `clase_resolucion.pdf` - Resolución SLD

## Temas Cubiertos

### Fundamentos
- Números naturales en notación de Peano
- Unificación y MGU (Most General Unifier)
- Resolución SLD y backtracking

### Predicados sobre Naturales
- `natural/1` - Generador de naturales
- `mayorA2/1` - Naturales mayores a 2
- `menor/2` - Relación de orden
- `menorOIgual/2` - Relación de orden reversible

### Predicados sobre Listas
- `long/2` - Longitud de listas
- `sacar/3` - Eliminar elementos
- `sinConsecRep/2` - Eliminar repeticiones consecutivas
- `append/3`, `prefijo/2`, `sufijo/2`, `sublista/2`
- `iesimo/3`, `iesimoRev/3` - Acceso por índice

### Predicados Generadores
- `desde/2` - Generador de números desde X
- `desdeRev/2` - Versión reversible
- `coprimos/2` - Generador de pares coprimos
- `triangulos/1` - Generador de triángulos válidos

### Conceptos Avanzados
- Reversibilidad de predicados
- Predicados generadores vs verificadores
- Recursión de cola vs tradicional
- Control de terminación
- Optimización con cortes

## Uso con Claude Code

Este proyecto está configurado con contexto especializado en `.claude/.claude.md` para análisis detallados de resolución SLD.

## Recursos

- [SWI-Prolog Documentation](https://www.swi-prolog.org/pldoc/doc_for?object=manual)
- Material de clase en `material/`
