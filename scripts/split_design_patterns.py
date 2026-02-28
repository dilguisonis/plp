#!/usr/bin/env python3
"""
Divide el markdown de "Dive Into Design Patterns" en archivos individuales
por capítulo y patrón de diseño.

Uso:
  python scripts/split_design_patterns.py              # Ejecuta el split
  python scripts/split_design_patterns.py --dry-run    # Solo muestra qué haría
"""

import argparse
import re
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
CONOCIMIENTO = PROJECT_ROOT / "conocimiento" / "design-patterns"

# El markdown completo generado por MinerU
SOURCE_MD = (
    CONOCIMIENTO
    / "dive-into-design-patterns-alexander-shvets-2021-alexander-shvets-"
      "3db872cc06b0d94fe6fee619d749baf8-anna-s-archive.md"
)

# ─── Pattern detection ────────────────────────────────────────────────────────
# The book structure is:
#   1. TOC (page numbers in headers, skip these)
#   2. How to Read This Book
#   3. INTRODUCTION TO OOP  (content section)
#   4. INTRODUCTION TO PATTERNS
#   5. SOFTWARE DESIGN PRINCIPLES
#   6. SOLID Principles
#   7. Creational Design Patterns (overview with Title Case sub-headers)
#      - # FACTORY METHOD  (actual pattern, ALL CAPS)
#      - # ABSTRACT FACTORY
#      - etc.
#   8. Structural Design Patterns (overview)
#      - # ADAPTER, # BRIDGE, etc.
#   9. Behavioral Design Patterns (overview)
#      - # CHAIN OF RESPONSIBILITY, etc.
#  10. Conclusion
#
# Key insight: individual pattern sections use ALL CAPS headers,
# while overview/TOC entries use Title Case.
# We want the ALL CAPS ones for content.

# Patterns mapped to their directory and filename
PATTERN_NAMES = {
    "FACTORY METHOD": ("03-creational", "factory-method.md"),
    "ABSTRACT FACTORY": ("03-creational", "abstract-factory.md"),
    "BUILDER": ("03-creational", "builder.md"),
    "PROTOTYPE": ("03-creational", "prototype.md"),
    "SINGLETON": ("03-creational", "singleton.md"),
    "ADAPTER": ("04-structural", "adapter.md"),
    "BRIDGE": ("04-structural", "bridge.md"),
    "COMPOSITE": ("04-structural", "composite.md"),
    "DECORATOR": ("04-structural", "decorator.md"),
    "FACADE": ("04-structural", "facade.md"),
    "FLYWEIGHT": ("04-structural", "flyweight.md"),
    "PROXY": ("04-structural", "proxy.md"),
    "CHAIN OF RESPONSIBILITY": ("05-behavioral", "chain-of-responsibility.md"),
    "COMMAND": ("05-behavioral", "command.md"),
    "ITERATOR": ("05-behavioral", "iterator.md"),
    "MEDIATOR": ("05-behavioral", "mediator.md"),
    "MEMENTO": ("05-behavioral", "memento.md"),
    "OBSERVER": ("05-behavioral", "observer.md"),
    "STATE": ("05-behavioral", "state.md"),
    "STRATEGY": ("05-behavioral", "strategy.md"),
    "TEMPLATEMETHOD": ("05-behavioral", "template-method.md"),
    "TEMPLATE METHOD": ("05-behavioral", "template-method.md"),
    "VISITOR": ("05-behavioral", "visitor.md"),
}

# Major section headers (not individual patterns)
SECTION_HEADERS = {
    "INTRODUCTION TO OOP": ("01-intro", "oop-basics.md"),
    "INTRODUCTION TO PATTERNS": ("01-intro", "design-patterns-intro.md"),
    "SOFTWARE DESIGN PRINCIPLES": ("02-principles", "design-principles.md"),
    "SOLID Principles": ("02-solid", "solid-principles.md"),
    "Creational Design Patterns": ("03-creational", "_overview.md"),
    "Structural Design Patterns": ("04-structural", "_overview.md"),
    "Behavioral Design Patterns": ("05-behavioral", "_overview.md"),
    "Conclusion": ("", "conclusion.md"),
}

# Minimum lines for a section to be considered "real content"
# (vs a TOC/overview reference)
MIN_CONTENT_LINES = 20


def find_sections(lines):
    """
    Finds all major sections in the markdown.
    Returns list of (line_number, name, directory, filename).

    Strategy: for patterns (ALL CAPS), keep the LAST occurrence
    since the first is usually a brief reference in an overview section,
    while the last is the actual detailed section.
    For section headers, keep the occurrence that's followed by substantial content.
    """
    # First pass: collect all candidate sections
    candidates = []

    for i, line in enumerate(lines):
        stripped = line.strip()

        # Check for plain ALL CAPS pattern names (no "# " prefix)
        # These appear as standalone lines like "PROTOTYPE", "ADAPTER", etc.
        if stripped in PATTERN_NAMES and stripped == stripped.upper() and not line.startswith("#"):
            d, f = PATTERN_NAMES[stripped]
            candidates.append((i, stripped, d, f, "pattern"))
            continue

        if not line.startswith("# "):
            continue
        header = line[2:].strip()

        # Skip TOC entries with page numbers
        if re.search(r'\.+\s*\d+\s*$', header):
            continue
        # Skip sub-pattern headers (Problem, Solution, Structure, etc.)
        if header in ("Problem", "Solution", "Structure", "Applicability",
                       "How to Implement", "Pros and Cons", "Real-World Analogy"):
            continue

        # Clean the header for matching
        header_clean = re.sub(r'[^A-Za-z\s]', '', header).strip()
        header_upper = header_clean.upper()

        # Check for pattern names (these should be ALL CAPS in the source)
        matched = False
        for pattern_name, (d, f) in PATTERN_NAMES.items():
            if header_upper == pattern_name or header_clean == pattern_name:
                # Verify it's actually ALL CAPS in the source (not Title Case)
                original_words = re.sub(r'[^A-Za-z\s]', '', header).strip()
                if original_words == original_words.upper() or len(original_words) <= 5:
                    candidates.append((i, pattern_name, d, f, "pattern"))
                    matched = True
                break

        if matched:
            continue

        # Check section headers
        for section_name, (d, f) in SECTION_HEADERS.items():
            if header == section_name or header.startswith(section_name):
                candidates.append((i, section_name, d, f, "section"))
                break

    # Second pass: deduplicate
    # For patterns: keep the LAST occurrence (actual content section)
    # For sections: keep the one that's NOT in the TOC area (first 100 lines)
    result = {}
    for line_num, name, d, f, kind in candidates:
        key = (d, f)
        if kind == "pattern":
            # Always replace with later occurrence
            result[key] = (line_num, name, d, f)
        else:
            # For sections, keep the one outside the TOC (line > 88 approx)
            if key not in result or line_num > 88:
                result[key] = (line_num, name, d, f)

    return sorted(result.values(), key=lambda x: x[0])


def split_markdown(source_path, output_base, dry_run=False):
    """Splits the Design Patterns markdown into individual files."""
    text = source_path.read_text(encoding="utf-8")
    lines = text.split("\n")

    print(f"Total lines: {len(lines)}")

    sections = find_sections(lines)
    print(f"Sections found: {len(sections)}")
    print()

    results = []

    for idx, (line_num, name, directory, filename) in enumerate(sections):
        # End is the start of the next section, or end of file
        if idx + 1 < len(sections):
            end_line = sections[idx + 1][0]
        else:
            end_line = len(lines)

        content = "\n".join(lines[line_num:end_line]).strip()
        if not content:
            continue

        num_lines = end_line - line_num
        dest_dir = output_base / directory if directory else output_base
        dest_file = dest_dir / filename

        results.append((name, dest_file, len(content), num_lines))

        if dry_run:
            print(f"  {name}")
            print(f"    → {dest_file.relative_to(output_base)} ({num_lines} lines)")
        else:
            dest_dir.mkdir(parents=True, exist_ok=True)
            dest_file.write_text(content + "\n", encoding="utf-8")
            print(f"  ✓ {dest_file.relative_to(output_base)} ({num_lines} lines)")

    return results


def create_index(output_base):
    """Creates a README.md index for the design patterns."""
    readme = output_base / "README.md"

    content = """# Dive Into Design Patterns

Base de conocimiento del libro "Dive Into Design Patterns" de Alexander Shvets (2021).
Convertido de PDF a Markdown con MinerU.

## Contenido

### Introducción
- [Conceptos básicos de OOP](01-intro/oop-basics.md)
- [Introducción a Design Patterns](01-intro/design-patterns-intro.md)

### Principios de Diseño
- [Principios de diseño de software](02-principles/design-principles.md)
- [Principios SOLID](02-solid/solid-principles.md)

### Patrones Creacionales
- [Overview](03-creational/_overview.md)
- [Factory Method](03-creational/factory-method.md)
- [Abstract Factory](03-creational/abstract-factory.md)
- [Builder](03-creational/builder.md)
- [Prototype](03-creational/prototype.md)
- [Singleton](03-creational/singleton.md)

### Patrones Estructurales
- [Overview](04-structural/_overview.md)
- [Adapter](04-structural/adapter.md)
- [Bridge](04-structural/bridge.md)
- [Composite](04-structural/composite.md)
- [Decorator](04-structural/decorator.md)
- [Facade](04-structural/facade.md)
- [Flyweight](04-structural/flyweight.md)
- [Proxy](04-structural/proxy.md)

### Patrones de Comportamiento
- [Overview](05-behavioral/_overview.md)
- [Chain of Responsibility](05-behavioral/chain-of-responsibility.md)
- [Command](05-behavioral/command.md)
- [Iterator](05-behavioral/iterator.md)
- [Mediator](05-behavioral/mediator.md)
- [Memento](05-behavioral/memento.md)
- [Observer](05-behavioral/observer.md)
- [State](05-behavioral/state.md)
- [Strategy](05-behavioral/strategy.md)
- [Template Method](05-behavioral/template-method.md)
- [Visitor](05-behavioral/visitor.md)

### Cierre
- [Conclusión](conclusion.md)
"""
    readme.write_text(content, encoding="utf-8")
    print(f"\n  ✓ Índice: {readme.relative_to(output_base.parent)}")


def main():
    parser = argparse.ArgumentParser(description="Split Design Patterns markdown")
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    if not SOURCE_MD.exists():
        print(f"ERROR: No se encontró {SOURCE_MD}")
        print("Corré primero la conversión y organización.")
        return

    print(f"Fuente: {SOURCE_MD.name}")
    print(f"Destino: {CONOCIMIENTO}\n")

    results = split_markdown(SOURCE_MD, CONOCIMIENTO, dry_run=args.dry_run)

    if not args.dry_run:
        create_index(CONOCIMIENTO)
        # Remove the monolithic file after splitting
        SOURCE_MD.unlink()
        print(f"  ✓ Eliminado archivo monolítico")

    print(f"\nTotal: {len(results)} secciones")


if __name__ == "__main__":
    main()
