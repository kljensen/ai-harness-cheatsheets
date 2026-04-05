#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

OUT_DIR="claude-code/variants"
mkdir -p "$OUT_DIR"

THEMES=(
  # Original themes
  classic
  open_sorbet
  radix_gentle
  pastel_blossom
  mint_latte
  nord_soft
  catppuccin_latte_soft
  lavender_mist
  paper_garden
  sunrise_chalk
  dusty_ocean
  # New anti-Easter themes
  tailwind_pro
  slate_wash
  ink_wash
  blueprint
  anthropic
  nord_functional
  warm_terra
  ocean_deep
  mono_slate
  colorbrewer_set3
  github_primer
  dracula_light
)

echo "Rendering ${#THEMES[@]} theme variants to $OUT_DIR"
PDFS=()
for theme in "${THEMES[@]}"; do
  out="$OUT_DIR/cheatsheet-${theme}.pdf"
  echo " - $theme -> $out"
  typst compile --root . --font-path assets/fonts/ --input theme="$theme" claude-code/cheatsheet.typ "$out"
  PDFS+=("$out")
done

# Combine into a single PDF for easy comparison
COMBINED="$OUT_DIR/ALL-THEMES.pdf"
echo ""
echo "Combining into $COMBINED ..."

if command -v /opt/homebrew/bin/gs &>/dev/null; then
  GS=/opt/homebrew/bin/gs
elif command -v gs &>/dev/null; then
  GS=gs
else
  echo "  ghostscript (gs) not found — skipping PDF merge."
  echo "  Install with: brew install ghostscript"
  echo "Done. Individual PDFs in $OUT_DIR/"
  exit 0
fi

"$GS" -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="$COMBINED" "${PDFS[@]}"
echo "Done. Combined PDF: $COMBINED (${#THEMES[@]} pages)"
