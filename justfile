set shell := ["bash", "-cu"]

default:
  just claude

fetch-fonts:
  ./scripts/fetch-fonts.sh

claude:
  typst compile --root . --font-path assets/fonts/ claude-code/cheatsheet.typ claude-code/cheatsheet.pdf

preview ppi="160":
  typst compile --root . --font-path assets/fonts/ claude-code/cheatsheet.typ "claude-code/preview-{p}.png" --format png --ppi {{ppi}}

variants:
  ./scripts/render-theme-variants.sh

clean:
  rm -f claude-code/cheatsheet.pdf claude-code/preview-*.png claude-code/variants/*.pdf
