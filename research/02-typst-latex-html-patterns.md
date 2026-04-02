# Spike Summary: Typst + LaTeX + HTML Cheatsheet Patterns for Printable References

## Decision: Use Typst as the canonical engine

Typst wins for maintainable print-native cheatsheets. Borrow **spacing discipline from LaTeX** and **card/grid patterns from HTML/CSS**.

---

## Comparison Matrix

| Criterion | Typst | LaTeX | HTML/CSS |
|---|---|---|---|
| **Compile speed** | ★★★ Fast | ★☆☆ Slow | ★★☆ Instant screen, variable print |
| **Print fidelity** | ★★★ Deterministic PDF | ★★★ Battle-tested | ★★☆ Browser-dependent |
| **Maintenance** | ★★★ Modern syntax, clean DSL | ★☆☆ Macro spaghetti | ★★☆ Familiar but print CSS fragile |
| **Visual control** | ★★☆ Good, improving | ★★★ Anything possible | ★★★ Best for screen |
| **Column balancing** | ★★☆ Native columns | ★★★ multicol proven | ★☆☆ CSS columns unreliable |
| **Reusable theming** | ★★★ Functions/modules | ★★☆ Macros, ceremony | ★★★ CSS custom properties |
| **Best fit for us** | ✅ Primary engine | Borrow ideas | Borrow ideas |

---

## Evidence-Backed Defaults for US Letter

### Page Setup
```typst
#set page(
  paper: "us-letter",
  flipped: true,          // landscape
  margin: (x: 0.35in, y: 0.30in),
)
```
*Source: LaTeX classic sheets use 0.5in on Letter; Storyfox uses 8mm on A4. 0.30–0.35in is safe for US laser printers while maximizing density.*

### Typography
```typst
#set text(
  font: ("Inter", "Helvetica Neue", "Arial"),  // sans for body
  size: 8pt,
  weight: "regular",
)
#set par(leading: 0.4em, spacing: 0.4em, justify: false)
```
*Source: Storyfox uses 8.5px print; LaTeX sheets use \footnotesize (~8pt); boxed-sheet goes to 5.5pt (too extreme). 8pt is the sweet spot for CLI refs.*

Mono for commands:
```typst
#let cmd-font = ("JetBrains Mono", "Menlo", "Courier New")
#let cmd-size = 7.5pt
```

### Columns
```typst
// Default: 3 columns for verbose CLI descriptions
columns(3, gutter: 3mm)

// Dense mode: 4 columns for short lookup content
columns(4, gutter: 2mm)
```
*Source: cram-snap uses 2; knowledge-key uses 4; cheatsheet_typst uses 3. LaTeX classic uses 3. For CLI refs with command+description, 3 is the sweet spot.*

### Section/Card Spacing
| Token | Value | Source |
|---|---|---|
| `card-gap` | 2mm | Storyfox grid gap |
| `card-padding` | 1.5mm | Storyfox section-content padding |
| `header-padding` | 1mm 2mm | Storyfox section-header padding |
| `row-gap` | 0.3mm | Storyfox row padding |
| `subheader-gap` | 0.8mm | Between subsection header and content |

### Page Break Strategy
- Use `break-inside: avoid` equivalent on all section cards
- Manual column assignment (not auto-flow) for primary sections
- Optional auto-flow within a column for dense subsections

*Source: Storyfox uses break-inside:avoid on .section/.row; LaTeX multicol flows automatically but our content is card-structured.*

---

## Borrowed Ideas Shortlist

### From LaTeX
1. **Spacing compression > font shrinking** — density comes from micro-spacing, not tiny type
2. **No page furniture** — no headers/footers/page numbers on single-page refs
3. **Semantic macros** — `\topic{}`, `\code{}`, `\concept{}` pattern → Typst functions
4. **Compact list handling** — zero indent, zero item-sep for bullet lists
5. **Separate body vs mono fonts** — body in sans, commands in mono

### From HTML/CSS (Storyfox)
1. **Card sections with colored header bands** — rounded rect, white text, per-section accent
2. **Keycap badge component** — mono, rounded, light fill, subtle border
3. **Nested micro-grids** — 2-col and 3-col inside main columns for dense subsections
4. **Print density mode** — separate spacing tokens for print vs screen
5. **Palette tokens** — CSS variable-like color tokens per section kind
6. **Explicit column grouping** — author assigns sections to columns, not auto-reflow

### From Typst Templates
1. **Color rotation** (boxed-sheet) — state-based palette cycling for section headers
2. **Alternating row fills** (cram-snap) — odd/even row striping in tables
3. **Tight heading blocks** (knowledge-key) — rounded rect, 0.65mm inset, white text
4. **Negative spacing** (cheatsheet_typst) — pull headings tight with negative v-space

---

## Proposed Typst Component DSL

```typst
// Page-level
#cheatsheet(
  title: "Claude Code",
  columns: 3,
  density: "normal",  // or "dense", "max"
)

// Sections
#section(kind: "shortcuts", title: "Keyboard Shortcuts")[
  #entry("Esc", "Exit current mode")
  #entry("Ctrl+C", "Cancel running command")
]

// Subsections
#subsection("Navigation")[
  #entry("↑/↓", "Scroll through history")
]

// Commands
#command("claude chat", "Start interactive session")
#flag("--model", "Select model to use")

// Inline formatting
#keycap("Ctrl") + #keycap("L")  // Keycap badges
#code("claude --help")           // Inline code
```

---

## Recommended Starting Typst Presets

### Normal (3-col, readable)
| Setting | Value |
|---|---|
| Paper | US Letter landscape |
| Margins | 0.35in × 0.30in |
| Columns | 3 |
| Gutter | 3mm |
| Body font | 8pt sans |
| Mono font | 7.5pt |
| Line height | 1.2 |

### Dense (4-col, compact)
| Setting | Value |
|---|---|
| Paper | US Letter landscape |
| Margins | 0.25in × 0.25in |
| Columns | 4 |
| Gutter | 2mm |
| Body font | 7pt sans |
| Mono font | 6.5pt |
| Line height | 1.15 |

### Max Dense (exam-mode, 5-col)
| Setting | Value |
|---|---|
| Paper | US Letter landscape |
| Margins | 5mm |
| Columns | 5 |
| Gutter | 2pt |
| Body font | 5.5pt sans |
| Mono font | 5pt |
| Line height | 1.1 |

---

## Unresolved Questions

1. **Font family at 8pt**: Inter vs Source Sans vs system sans — needs print test
2. **Single page vs 2-page**: for tools with 80+ commands, is cramming worse than a clean 2-pager?
3. **Auto-flow vs manual columns**: should sections auto-fill or be manually assigned to columns?
4. **Color palette**: monochromatic gradient (knowledge-key) vs multi-hue (boxed-sheet) vs tool-branded?

---

## Sources

### Typst templates analyzed (code inspected)
- cram-snap: 2-col, 11pt, table-based
- boxed-sheet: 5-col, 5.5pt, 8-color rotation
- knowledge-key: 4-col, 6pt, magenta gradient
- cheatsheet_typst: 3-col, 7pt, minimal

### LaTeX repos analyzed (code inspected)
- wch/latexsheet: classic 3-col reference card (172★)
- ros/cheatsheet: ROS reference card variant
- yt-project/yt: yt reference card variant
- Purestone/Chitshit: extreme 5pt/7-col exam sheets

### HTML/CSS analyzed
- cc.storyfox.cz: full CSS extraction (print + screen)
- MDN @media print docs
- SitePoint print CSS guide
