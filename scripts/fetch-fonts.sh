#!/usr/bin/env bash
set -euo pipefail

# Fetch Anthropic web fonts from their public CDN, convert woff2 → ttf,
# then extract static instances at specific weights for Typst compatibility.
# Requires: curl, woff2_decompress (brew install woff2), uvx + fonttools

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

# Download and decompress woff2 → variable ttf
for url in $FONT_URLS; do
  filename=$(basename "$url")
  stem="${filename%.woff2}"
  woff2_path="$FONT_DIR/$filename"
  ttf_path="$FONT_DIR/$stem.ttf"

  if [ -f "$ttf_path" ]; then
    echo "  ✓ $stem.ttf (cached)"
    continue
  fi

  echo "  ⬇ $filename"
  curl -sL "$url" -o "$woff2_path"
  woff2_decompress "$woff2_path" >/dev/null 2>&1
  rm -f "$woff2_path"
done

# Extract static instances from variable fonts (Typst doesn't support variable fonts)
SERIF_VAR=$(ls "$FONT_DIR"/*AnthropicSerif-Roman-Web.ttf 2>/dev/null | head -1)
SANS_VAR=$(ls "$FONT_DIR"/*AnthropicSans-Roman-Web.ttf 2>/dev/null | head -1)

if [ -z "$SERIF_VAR" ] || [ -z "$SANS_VAR" ]; then
  echo "Error: variable font files not found after download."
  exit 1
fi

echo ""
echo "Extracting static font instances..."

INSTANCES=(
  "$SERIF_VAR wght=800 AnthropicSerif-ExtraBold"
  "$SERIF_VAR wght=600 AnthropicSerif-SemiBold"
  "$SERIF_VAR wght=400 AnthropicSerif-Regular"
  "$SANS_VAR wght=800 AnthropicSans-ExtraBold"
  "$SANS_VAR wght=600 AnthropicSans-SemiBold"
  "$SANS_VAR wght=400 AnthropicSans-Regular"
  "$SANS_VAR wght=300 AnthropicSans-Light"
)

UV_FLAGS=""
if [ -n "${UV_CONFIG_FILE:-}" ]; then
  UV_FLAGS="--config-file $UV_CONFIG_FILE"
fi

for entry in "${INSTANCES[@]}"; do
  set -- $entry
  var_font="$1" axis="$2" name="$3"
  out="$FONT_DIR/$name.ttf"

  if [ -f "$out" ]; then
    echo "  ✓ $name.ttf (cached)"
    continue
  fi

  echo "  → $name.ttf"
  UV_CONFIG_FILE=/dev/null uvx fonttools varLib.instancer "$var_font" "$axis" --static --output "$out" >/dev/null 2>&1
done

# Remove variable fonts (Typst picks them up and warns)
rm -f "$FONT_DIR"/*-Roman-Web.ttf "$FONT_DIR"/*-Italic-Web.ttf

echo ""
echo "Fonts ready in $FONT_DIR:"
ls "$FONT_DIR"/*.ttf 2>/dev/null | while read f; do echo "  $(basename "$f")"; done
