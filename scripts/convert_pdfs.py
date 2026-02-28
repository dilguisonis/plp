#!/usr/bin/env python3
"""
Convierte todos los PDFs de PLP a Markdown usando MinerU (magic-pdf).

Estrategia anti-OOM:
  - Procesa de a UN PDF a la vez (no batch)
  - Backend pipeline (6GB VRAM, ~8-10GB RAM)
  - Monitoreo de RAM antes de cada archivo
  - Ordena PDFs por tamaño (chicos primero)
  - Libera memoria entre archivos (gc + CUDA cache)
  - Design Patterns se procesa último y solo

Uso:
  python scripts/convert_pdfs.py                    # Convierte todos los PDFs
  python scripts/convert_pdfs.py --dry-run          # Solo lista los PDFs sin convertir
  python scripts/convert_pdfs.py --only-missing     # Solo convierte PDFs sin .md existente
  python scripts/convert_pdfs.py --design-patterns  # Solo convierte Design Patterns
"""

import argparse
import gc
import glob
import json
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path

# ─── Configuración ───────────────────────────────────────────────────────────

PROJECT_ROOT = Path(__file__).resolve().parent.parent
MINERU_BIN = Path.home() / ".venvs" / "mineru" / "bin" / "mineru"
OUTPUT_BASE = PROJECT_ROOT / "output_mineru"
LOG_FILE = PROJECT_ROOT / "scripts" / "conversion_log.txt"

BACKEND = "pipeline"  # pipeline (6GB VRAM) vs hybrid (10GB VRAM)
MIN_RAM_GB = 6        # mínimo de RAM libre para procesar
WAIT_SECONDS = 15     # segundos entre checks de RAM


def _set_backend(b):
    global BACKEND
    BACKEND = b

DESIGN_PATTERNS_PDF = (
    Path.home() / "Downloads"
    / "Dive Into Design Patterns -- Alexander Shvets -- 2021 "
      "-- Alexander Shvets -- 3db872cc06b0d94fe6fee619d749baf8 "
      "-- Anna's Archive.pdf"
)

# Directorios de PDFs a escanear (dentro del proyecto)
PDF_SEARCH_DIRS = [
    PROJECT_ROOT / "final",
    PROJECT_ROOT / "calculo_lambda",
    PROJECT_ROOT / "prolog",
    PROJECT_ROOT / "finales",
]


# ─── Utilidades ──────────────────────────────────────────────────────────────

def ram_disponible_gb():
    """Retorna GB de RAM disponible."""
    try:
        import psutil
        return psutil.virtual_memory().available / (1024 ** 3)
    except ImportError:
        # Fallback: leer /proc/meminfo
        with open("/proc/meminfo") as f:
            for line in f:
                if line.startswith("MemAvailable:"):
                    kb = int(line.split()[1])
                    return kb / (1024 ** 2)
    return 99  # si no se puede determinar, asumir que hay suficiente


def esperar_ram(min_gb):
    """Espera hasta que haya suficiente RAM disponible."""
    while ram_disponible_gb() < min_gb:
        disp = ram_disponible_gb()
        log(f"  PAUSA: Solo {disp:.1f}GB RAM libre (mínimo: {min_gb}GB). Esperando {WAIT_SECONDS}s...")
        time.sleep(WAIT_SECONDS)


def liberar_memoria():
    """Fuerza garbage collection y limpia CUDA cache."""
    gc.collect()
    try:
        import torch
        if torch.cuda.is_available():
            torch.cuda.empty_cache()
    except ImportError:
        pass


def log(msg):
    """Loguea a stdout y al archivo de log."""
    print(msg)
    with open(LOG_FILE, "a") as f:
        timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
        f.write(f"[{timestamp}] {msg}\n")


def encontrar_pdfs():
    """Encuentra todos los PDFs del proyecto, excluyendo .git y output_mineru."""
    pdfs = []
    for search_dir in PDF_SEARCH_DIRS:
        if not search_dir.exists():
            continue
        for pdf in search_dir.rglob("*.pdf"):
            # Excluir directorios de salida y .git
            parts = pdf.parts
            if ".git" in parts or "output_mineru" in parts:
                continue
            pdfs.append(pdf)
    return pdfs


def ya_convertido(pdf_path, output_base):
    """Verifica si un PDF ya fue convertido (existe su .md en output)."""
    rel = pdf_path.relative_to(PROJECT_ROOT)
    output_dir = output_base / rel.parent / rel.stem / "auto"
    md_file = output_dir / f"{rel.stem}.md"
    return md_file.exists()


# ─── Conversión ──────────────────────────────────────────────────────────────

def convertir_pdf(pdf_path, output_dir, use_cpu=False):
    """
    Convierte un PDF a Markdown usando MinerU.

    Retorna (True, md_path) si tuvo éxito, (False, error_msg) si falló.
    """
    esperar_ram(MIN_RAM_GB)

    cmd = [
        str(MINERU_BIN),
        "-p", str(pdf_path),
        "-o", str(output_dir),
        "-b", BACKEND,
    ]

    if use_cpu:
        cmd.extend(["--device", "cpu"])

    log(f"  CMD: {' '.join(cmd)}")

    try:
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=600,  # 10 minutos máximo por PDF
        )

        if result.returncode != 0:
            error = result.stderr.strip() or result.stdout.strip()
            return False, f"Exit code {result.returncode}: {error[:500]}"

        # Buscar el .md generado
        stem = pdf_path.stem
        # MinerU genera en: output_dir/stem/auto/stem.md
        md_path = output_dir / stem / "auto" / f"{stem}.md"
        if not md_path.exists():
            # Buscar en cualquier subdirectorio
            md_candidates = list(Path(output_dir).rglob(f"{stem}.md"))
            if md_candidates:
                md_path = md_candidates[0]
            else:
                return False, "No se encontró el .md generado"

        return True, str(md_path)

    except subprocess.TimeoutExpired:
        return False, "Timeout (>10 min)"
    except Exception as e:
        return False, str(e)
    finally:
        liberar_memoria()


def convertir_con_fallback(pdf_path, output_dir):
    """Intenta convertir con GPU, si falla con OOM reintenta con CPU."""
    log(f"\n{'='*60}")
    log(f"Procesando: {pdf_path.name} ({pdf_path.stat().st_size / 1024:.0f} KB)")
    log(f"  Ruta: {pdf_path}")

    # Intento 1: con GPU
    ok, result = convertir_pdf(pdf_path, output_dir)
    if ok:
        log(f"  OK: {result}")
        return True, result

    # Si falló por OOM, reintentar con CPU
    if "OOM" in result or "out of memory" in result.lower() or "CUDA" in result:
        log(f"  WARN: OOM en GPU, reintentando con CPU...")
        ok, result = convertir_pdf(pdf_path, output_dir, use_cpu=True)
        if ok:
            log(f"  OK (CPU): {result}")
            return True, result

    log(f"  ERROR: {result}")
    return False, result


# ─── Main ────────────────────────────────────────────────────────────────────

def main():
    parser = argparse.ArgumentParser(description="Convierte PDFs a Markdown con MinerU")
    parser.add_argument("--dry-run", action="store_true", help="Solo lista PDFs sin convertir")
    parser.add_argument("--only-missing", action="store_true", help="Solo convierte PDFs sin .md")
    parser.add_argument("--design-patterns", action="store_true", help="Solo convierte Design Patterns")
    parser.add_argument("--backend", default=BACKEND, choices=["pipeline", "hybrid"],
                        help="Backend de MinerU (default: pipeline)")
    parser.add_argument("--cpu", action="store_true", help="Forzar uso de CPU")
    args = parser.parse_args()

    _set_backend(args.backend)

    # Verificar que MinerU está instalado
    if not MINERU_BIN.exists():
        print(f"ERROR: MinerU no encontrado en {MINERU_BIN}")
        print("Instalá MinerU primero:")
        print("  python3 -m venv ~/.venvs/mineru")
        print("  source ~/.venvs/mineru/bin/activate")
        print("  pip install uv && uv pip install -U 'mineru[all]'")
        print("  mineru-models-download")
        sys.exit(1)

    # Inicializar log
    LOG_FILE.parent.mkdir(parents=True, exist_ok=True)
    log(f"\n{'#'*60}")
    log(f"INICIO DE CONVERSIÓN - {time.strftime('%Y-%m-%d %H:%M:%S')}")
    log(f"Backend: {BACKEND}")
    log(f"RAM disponible: {ram_disponible_gb():.1f} GB")

    if args.design_patterns:
        # Solo Design Patterns
        if not DESIGN_PATTERNS_PDF.exists():
            log(f"ERROR: No se encontró {DESIGN_PATTERNS_PDF}")
            sys.exit(1)
        output = OUTPUT_BASE / "design-patterns"
        output.mkdir(parents=True, exist_ok=True)
        ok, result = convertir_con_fallback(DESIGN_PATTERNS_PDF, output)
        if ok:
            log(f"\nDesign Patterns convertido: {result}")
        else:
            log(f"\nDesign Patterns FALLÓ: {result}")
        return

    # Encontrar y ordenar PDFs por tamaño (chicos primero)
    pdfs = encontrar_pdfs()
    pdfs.sort(key=lambda p: p.stat().st_size)

    log(f"PDFs encontrados: {len(pdfs)}")

    if args.only_missing:
        pdfs = [p for p in pdfs if not ya_convertido(p, OUTPUT_BASE)]
        log(f"PDFs sin convertir: {len(pdfs)}")

    if args.dry_run:
        log("\n--- DRY RUN: PDFs a procesar ---")
        for i, pdf in enumerate(pdfs, 1):
            size_kb = pdf.stat().st_size / 1024
            converted = "✓" if ya_convertido(pdf, OUTPUT_BASE) else "✗"
            log(f"  {i:3d}. [{converted}] {pdf.name} ({size_kb:.0f} KB)")
        log(f"\nTotal: {len(pdfs)} PDFs")
        return

    # Procesar PDFs
    ok_count = 0
    fail_count = 0
    failures = []

    for i, pdf in enumerate(pdfs, 1):
        log(f"\n[{i}/{len(pdfs)}] ({ok_count} OK, {fail_count} FAIL)")
        rel = pdf.relative_to(PROJECT_ROOT)
        output_dir = OUTPUT_BASE / rel.parent
        output_dir.mkdir(parents=True, exist_ok=True)

        ok, result = convertir_con_fallback(pdf, output_dir)
        if ok:
            ok_count += 1
        else:
            fail_count += 1
            failures.append((pdf, result))

    # Design Patterns al final
    if DESIGN_PATTERNS_PDF.exists():
        log(f"\n{'='*60}")
        log("PROCESANDO DESIGN PATTERNS (libro completo, 29MB)")
        liberar_memoria()
        time.sleep(5)  # dar tiempo al sistema
        output = OUTPUT_BASE / "design-patterns"
        output.mkdir(parents=True, exist_ok=True)
        ok, result = convertir_con_fallback(DESIGN_PATTERNS_PDF, output)
        if ok:
            ok_count += 1
            log(f"Design Patterns OK: {result}")
        else:
            fail_count += 1
            failures.append((DESIGN_PATTERNS_PDF, result))
    else:
        log(f"\nWARN: Design Patterns PDF no encontrado en {DESIGN_PATTERNS_PDF}")

    # Resumen
    log(f"\n{'#'*60}")
    log(f"CONVERSIÓN FINALIZADA")
    log(f"  Exitosos: {ok_count}")
    log(f"  Fallidos: {fail_count}")

    if failures:
        log(f"\nPDFs que fallaron:")
        for pdf, err in failures:
            log(f"  - {pdf.name}: {err[:200]}")

    log(f"\nLog completo en: {LOG_FILE}")


if __name__ == "__main__":
    main()
