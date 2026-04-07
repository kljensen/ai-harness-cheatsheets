#!/usr/bin/env bash
set -euo pipefail

# Fetch Anthropic web fonts from their public CDN and convert woff2 → ttf.
# Requires: curl, woff2_decompress (brew install woff2)

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FONT_DIR="$ROOT_DIR/assets/fonts"
mkdir -p "$FONT_DIR"

CSS_URL="https://cdn.prod.website-files.com/67ce28cfec624e2b733f8a52/css/ant-brand.shared.e243ae639.min.css"

echo "Fetching font URLs from Anthropic CSS..."
FONT_URLS=$(curl -s "$CSS_URL" | grep -o 'https://[^)]*Anthropic[^)]*\.woff2')

if [ -z "$FONT_URLS" ]; then
  echo "Error: no Anthropic font URLs found in CSS. The CDN URL may have changed."
  exit 1
fi

for url in $FONT_URLS; do
  filename=$(basename "$url")
  stem="${filename%.woff2}"
  woff2_path="$FONT_DIR/$filename"
  ttf_path="$FONT_DIR/$stem.ttf"

  if [ -f "$ttf_path" ]; then
    echo "  ✓ $stem.ttf (already exists)"
    continue
  fi

  echo "  ⬇ $filename"
  curl -sL "$url" -o "$woff2_path"

  echo "    → converting to ttf"
  woff2_decompress "$woff2_path" >/dev/null 2>&1
  rm -f "$woff2_path"
  echo "  ✓ $stem.ttf"
done

echo ""
echo "Fonts ready in $FONT_DIR:"
ls "$FONT_DIR"/*.ttf 2>/dev/null || echo "  (none found)"
