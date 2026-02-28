#!/usr/bin/env python3
"""
Organiza los markdowns generados por MinerU en la estructura conocimiento/.

Este script se corre DESPUÉS de convert_pdfs.py. Lee los .md de output_mineru/
y los copia a la carpeta correspondiente en conocimiento/.

Uso:
  python scripts/organizar_output.py              # Organiza todos
  python scripts/organizar_output.py --dry-run     # Solo muestra qué haría
"""

import argparse
import re
import shutil
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
OUTPUT_BASE = PROJECT_ROOT / "output_mineru"
CONOCIMIENTO = PROJECT_ROOT / "conocimiento"

# ─── Mapeo de rutas origen → destino ─────────────────────────────────────────
#
# Cada regla es (patrón_en_ruta_origen, destino_en_conocimiento)
# Se evalúan en orden; la primera que matchea gana.

RULES = [
    # Teóricas (cubawiki)
    ("cubawiki/teoricas/", "teoricas/"),

    # Prácticas (cubawiki)
    ("cubawiki/practicas/", "practicas/"),

    # Guías (cubawiki)
    ("cubawiki/guias/", "guias/"),

    # Parciales (cubawiki)
    ("cubawiki/parciales/primeros/", "examenes/parciales/primeros/"),
    ("cubawiki/parciales/segundos/", "examenes/parciales/segundos/"),

    # Finales (cubawiki)
    ("cubawiki/finales/", "examenes/finales/"),

    # Parciales (final/parciales/)
    ("final/parciales/", "examenes/parciales/primeros/"),

    # Guías (final/guias/)
    ("final/guias/", "guias/"),

    # Prácticas (final/practicas/)
    ("final/practicas/", "practicas/"),

    # TPs
    ("final/tps/", "practicas/"),

    # Util
    ("final/util/interpretes/", "util/"),
    ("final/util/apuntes-viejos/", "util/"),
    ("final/util/", "util/"),

    # Lecturas
    ("final/lecturas/recomendadas/", "lecturas/recomendadas/"),
    ("final/lecturas/turno-manana/", "lecturas/turno-manana/"),
    ("final/lecturas/turno-noche/", "lecturas/turno-noche/"),

    # Finales (root)
    ("finales/", "examenes/finales/"),

    # Cálculo lambda
    ("calculo_lambda/", "practicas/"),

    # Prolog material
    ("prolog/clase/material/", "practicas/"),

    # Design patterns
    ("design-patterns/", "design-patterns/"),
]


def normalizar_nombre(nombre):
    """Normaliza un nombre de archivo para la base de conocimiento."""
    # Quitar extensión
    stem = Path(nombre).stem
    # Minúsculas
    stem = stem.lower()
    # Reemplazar espacios y caracteres especiales
    stem = re.sub(r'[^a-z0-9áéíóúñü_-]', '-', stem)
    # Colapsar guiones múltiples
    stem = re.sub(r'-+', '-', stem)
    # Quitar guiones al inicio/final
    stem = stem.strip('-')
    return f"{stem}.md"


def encontrar_destino(md_path):
    """Determina el destino en conocimiento/ según la ruta del .md."""
    rel = str(md_path.relative_to(OUTPUT_BASE))

    for patron, destino in RULES:
        if patron in rel:
            nombre = normalizar_nombre(md_path.name)
            return CONOCIMIENTO / destino / nombre

    # Fallback: poner en la raíz de conocimiento
    nombre = normalizar_nombre(md_path.name)
    return CONOCIMIENTO / nombre


def main():
    parser = argparse.ArgumentParser(description="Organiza markdowns en conocimiento/")
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    if not OUTPUT_BASE.exists():
        print(f"ERROR: No existe {OUTPUT_BASE}")
        print("Corré primero: python scripts/convert_pdfs.py")
        return

    # Encontrar todos los .md generados
    mds = list(OUTPUT_BASE.rglob("*.md"))
    print(f"Markdowns encontrados en output: {len(mds)}")

    movidos = 0
    for md in sorted(mds):
        destino = encontrar_destino(md)

        if args.dry_run:
            print(f"  {md.relative_to(OUTPUT_BASE)}")
            print(f"    → {destino.relative_to(PROJECT_ROOT)}")
        else:
            destino.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(md, destino)
            print(f"  ✓ {destino.relative_to(CONOCIMIENTO)}")
            movidos += 1

    if args.dry_run:
        print(f"\n(dry-run) Se moverían {len(mds)} archivos")
    else:
        print(f"\nOrganizados: {movidos} archivos en conocimiento/")


if __name__ == "__main__":
    main()
