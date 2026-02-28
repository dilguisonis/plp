# Guía de Conversión PDF → Markdown con MinerU

## Requisitos

- Python 3.10+
- GPU NVIDIA con ≥6GB VRAM (o CPU como fallback)
- CUDA instalado
- ~6GB de espacio para modelos de MinerU

## 1. Instalar MinerU (primera vez)

```bash
# Crear virtualenv dedicado
python3 -m venv ~/.venvs/mineru
source ~/.venvs/mineru/bin/activate

# Instalar
pip install --upgrade pip
pip install uv
uv pip install -U "mineru[all]"

# Descargar modelos (~varios GB)
mineru-models-download

# Verificar
mineru --version
```

Los modelos se guardan en `~/.mineru/models/` y la config en `~/.mineru.json`.

## 2. Convertir un PDF nuevo

### Opción A: Script helper (recomendado)

```bash
./scripts/agregar_pdf.sh <archivo.pdf> <destino-en-conocimiento/>
```

Destinos válidos:

| Destino | Contenido |
|---|---|
| `teoricas/` | Clases teóricas |
| `practicas/` | Material de práctica |
| `guias/` | Guías de ejercicios |
| `examenes/parciales/primeros/` | Primeros parciales |
| `examenes/parciales/segundos/` | Segundos parciales |
| `examenes/finales/` | Finales |
| `lecturas/recomendadas/` | Lecturas recomendadas |
| `lecturas/turno-manana/` | Lecturas turno mañana |
| `lecturas/turno-noche/` | Lecturas turno noche |
| `util/` | Machetes, cheat sheets, resúmenes |

Ejemplo:

```bash
./scripts/agregar_pdf.sh nuevo-final.pdf examenes/finales/
```

### Opción B: MinerU directo

```bash
# Activar el venv
source ~/.venvs/mineru/bin/activate

# Convertir
mineru -p archivo.pdf -o output/ -b pipeline

# El .md queda en output/archivo/auto/archivo.md
```

### Opción C: Conversión batch (todos los PDFs)

```bash
source ~/.venvs/mineru/bin/activate
python scripts/convert_pdfs.py              # Todos
python scripts/convert_pdfs.py --only-missing  # Solo los que faltan
python scripts/convert_pdfs.py --dry-run       # Ver qué haría

# Después organizar en conocimiento/
python scripts/organizar_output.py
```

## 3. Dónde poner el resultado

Mover el `.md` generado a la carpeta correspondiente en `conocimiento/`:

```
conocimiento/
├── teoricas/          ← Clases teóricas (Clase00..Clase12)
├── practicas/         ← Prácticas y material de clase
├── guias/             ← Guías de ejercicios (p0..p9)
├── examenes/
│   ├── parciales/
│   │   ├── primeros/
│   │   └── segundos/
│   └── finales/
├── lecturas/
│   ├── recomendadas/
│   ├── turno-manana/
│   └── turno-noche/
├── util/              ← Machetes, cheat sheets
├── resoluciones/      ← Resoluciones propias
└── design-patterns/   ← Dive Into Design Patterns
```

## 4. Actualizar el índice

Después de agregar un archivo, editar `conocimiento/README.md` y agregar un link en la sección correspondiente.

## 5. Convenciones de nombres

- Minúsculas, separado por guiones: `inferencia-de-tipos.md`
- Teóricas: `clase-00-intro.md`, `clase-01-funcional.md`, etc.
- Guías: `guia-01.md`, `guia-02.md`, etc.
- Parciales: `2024-1c-1p.md` (año-cuatri-parcial)
- Finales: `2024-12-16.md` (fecha YYYY-MM-DD)
- Lecturas: nombre descriptivo del tema

## 6. Backends de MinerU

| Backend | VRAM | RAM | Precisión | Cuándo usar |
|---|---|---|---|---|
| `pipeline` | ~6GB | ~8-10GB | Alta | Default, más seguro |
| `hybrid` | ~10GB | ~12-15GB | Más alta | Si tenés VRAM de sobra |

Si un PDF falla con GPU, el script reintenta con CPU automáticamente.

## 7. Troubleshooting

**"mineru: command not found"** → Activar el venv: `source ~/.venvs/mineru/bin/activate`

**OOM en GPU** → Usar backend pipeline o `--device cpu`

**Fórmulas mal convertidas** → MinerU usa UniMERNet para fórmulas. Si una fórmula sale mal, se puede editar el .md manualmente.

**Tabla desarmada** → A veces MinerU no detecta bien las tablas. Editar manualmente.

**PDF escaneado (imagen)** → MinerU usa OCR automático, pero la calidad depende del escaneo original.
