#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

OUT_DIR="claude-code/variants"
mkdir -p "$OUT_DIR"

THEMES=(
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
)

echo "Rendering ${#THEMES[@]} theme variants to $OUT_DIR"
for theme in "${THEMES[@]}"; do
  out="$OUT_DIR/cheatsheet-${theme}.pdf"
  echo " - $theme -> $out"
  typst compile --root . --input theme="$theme" claude-code/cheatsheet.typ "$out"
done

echo "Done."
