#!/bin/bash
#
# agregar_pdf.sh — Convierte un PDF nuevo con MinerU y lo ubica en conocimiento/
#
# Uso:
#   ./scripts/agregar_pdf.sh <archivo.pdf> <destino>
#
# Ejemplos:
#   ./scripts/agregar_pdf.sh parcial-nuevo.pdf examenes/parciales/primeros/
#   ./scripts/agregar_pdf.sh lectura.pdf lecturas/recomendadas/
#   ./scripts/agregar_pdf.sh apunte.pdf util/
#
# El script:
#   1. Convierte el PDF a Markdown con MinerU (backend pipeline)
#   2. Copia el .md al destino dentro de conocimiento/
#   3. Muestra recordatorio de actualizar el índice
#

set -euo pipefail

# ─── Configuración ───────────────────────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
MINERU_BIN="$HOME/.venvs/mineru/bin/mineru"
CONOCIMIENTO_DIR="$PROJECT_ROOT/conocimiento"
TEMP_OUTPUT="$PROJECT_ROOT/output_mineru/_temp"
BACKEND="pipeline"

# ─── Validaciones ────────────────────────────────────────────────────────────

if [ $# -lt 2 ]; then
    echo "Uso: $0 <archivo.pdf> <destino-en-conocimiento/>"
    echo ""
    echo "Destinos válidos:"
    echo "  teoricas/                       Clases teóricas"
    echo "  practicas/                      Material de práctica"
    echo "  guias/                          Guías de ejercicios"
    echo "  examenes/parciales/primeros/    Primeros parciales"
    echo "  examenes/parciales/segundos/    Segundos parciales"
    echo "  examenes/finales/               Finales"
    echo "  lecturas/recomendadas/          Lecturas recomendadas"
    echo "  lecturas/turno-manana/          Lecturas turno mañana"
    echo "  lecturas/turno-noche/           Lecturas turno noche"
    echo "  util/                           Machetes y resúmenes"
    echo ""
    echo "Ejemplo:"
    echo "  $0 nuevo-parcial.pdf examenes/parciales/primeros/"
    exit 1
fi

PDF_PATH="$1"
DESTINO="$2"

if [ ! -f "$PDF_PATH" ]; then
    echo "ERROR: No se encontró el archivo: $PDF_PATH"
    exit 1
fi

if [ ! -x "$MINERU_BIN" ]; then
    echo "ERROR: MinerU no está instalado en $MINERU_BIN"
    echo ""
    echo "Instalalo con:"
    echo "  python3 -m venv ~/.venvs/mineru"
    echo "  source ~/.venvs/mineru/bin/activate"
    echo "  pip install uv && uv pip install -U 'mineru[all]'"
    echo "  mineru-models-download"
    exit 1
fi

# Crear directorio destino si no existe
DEST_FULL="$CONOCIMIENTO_DIR/$DESTINO"
mkdir -p "$DEST_FULL"

# ─── Conversión ──────────────────────────────────────────────────────────────

PDF_NAME="$(basename "$PDF_PATH" .pdf)"
echo "=== Convirtiendo: $PDF_PATH ==="
echo "    Backend: $BACKEND"
echo "    Destino: $DEST_FULL"

mkdir -p "$TEMP_OUTPUT"

"$MINERU_BIN" -p "$PDF_PATH" -o "$TEMP_OUTPUT" -b "$BACKEND"

# Buscar el .md generado
MD_FILE=$(find "$TEMP_OUTPUT" -name "${PDF_NAME}.md" -type f 2>/dev/null | head -1)

if [ -z "$MD_FILE" ]; then
    # Buscar cualquier .md generado
    MD_FILE=$(find "$TEMP_OUTPUT" -name "*.md" -type f 2>/dev/null | head -1)
fi

if [ -z "$MD_FILE" ]; then
    echo "ERROR: No se encontró el markdown generado."
    echo "Revisá la salida de MinerU en: $TEMP_OUTPUT"
    exit 1
fi

# ─── Copiar al destino ───────────────────────────────────────────────────────

# Normalizar nombre del archivo
DEST_NAME=$(echo "$PDF_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
DEST_FILE="$DEST_FULL/${DEST_NAME}.md"

cp "$MD_FILE" "$DEST_FILE"
echo ""
echo "=== Listo ==="
echo "Markdown generado: $DEST_FILE"
echo ""

# Limpiar temp
rm -rf "$TEMP_OUTPUT"

# ─── Recordatorio ────────────────────────────────────────────────────────────

echo "RECORDATORIO: Actualizá el índice en conocimiento/README.md"
echo "Agregá una entrada en la sección correspondiente:"
echo "  - [$PDF_NAME]($DESTINO${DEST_NAME}.md)"
