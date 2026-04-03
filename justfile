set shell := ["bash", "-cu"]

default:
  just claude

claude:
  typst compile --root . claude-code/cheatsheet.typ claude-code/cheatsheet.pdf

preview ppi="160":
  typst compile --root . claude-code/cheatsheet.typ "claude-code/preview-{p}.png" --format png --ppi {{ppi}}

clean:
  rm -f claude-code/cheatsheet.pdf claude-code/preview-*.png
