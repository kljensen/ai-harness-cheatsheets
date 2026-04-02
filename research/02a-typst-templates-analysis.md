# Typst Cheatsheet Templates: Configuration Analysis

Analysis of page setup, typography, layout, and styling values from four Typst cheatsheet template repositories.

---

## 1. cram-snap

**Repository:** `.forge/issue-1/repos/cram-snap/`  
**Main files:** `lib.typ`, `template/main.typ`

### Page Setup
```typst
set page(
  paper: "a4",
  flipped: true,       // Landscape orientation
  margin: 1cm,
)
```

**Values:**
- Paper size: A4
- Orientation: Landscape (flipped: true)
- Margins: 1cm (uniform)

### Typography
```typst
set text(
  font: "Arial",
  size: 11pt
)
```

**Values:**
- Font family: Arial
- Font size: 11pt
- Title size: 1.6em (relative to base)
- Subtitle size: 0.9em
- Table header size: 1.2em (bold)
- Title box height: 1.8em

### Column Layout
```typst
columns(column-number)[...]
```

**Default:** `column-number: 2`  
**Approach:** Native Typst `columns()` function

### Table Configuration
```typst
set table(
  align: left + horizon,
  columns: (2fr, 3fr),
  fill: table_fill(rgb(fill-color)),
  stroke: table_stroke(rgb(stroke-color)),
)
```

**Values:**
- Column ratio: 2:3 (command : description)
- Fill pattern: Alternating rows (odd rows only)
- Stroke: Bottom border on header row only

### Colors
```typst
fill-color: "F2F2F2",    // Default light gray
stroke-color: "21222C",  // Default dark gray/black
```

**Defaults:**
- Table fill: `rgb("F2F2F2")` (light gray)
- Table stroke: `rgb("21222C")` (dark)

### Custom Functions

**`theader()` macro:**
Creates spanning header cells with `colspan: 2` by default.

**Table fill function:**
```typst
let table_fill(color) = (
  (x, y) => {
    if calc.odd(y) { rgb(color) }
    else { none }
  }
)
```

**Table stroke function:**
```typst
let table_stroke(color) = (
  (x, y) => (
    bottom: if y == 0 { color } else { 0pt },
    // left, right, top: none
  )
)
```

---

## 2. boxed-sheet (boxed-sheet-src)

**Repository:** `.forge/issue-1/repos/boxed-sheet-src/`  
**Main files:** `src/lib.typ`, `template/boxedsheet.typ`, `template/boxedsheet-scaling.typ`

### Page Setup
```typst
set page(
  paper: "a4",
  flipped: true,
  margin: (x: x-margin, y: y-margin),
  header: [...],
  header-ascent: ...
)
```

**Default values:**
- Paper: A4 landscape
- X margin: `30pt` (default), customizable down to `10pt` in examples
- Y margin: `20pt` (default), can go to `30pt`
- Header: Three-column grid (date | title | author@homepage)

**Scaling variant:** Allows custom page dimensions
```typst
page-w: 350.28pt,
page-h: 241.89pt,
```

### Typography
```typst
set text(size: font-size)
```

**Default values:**
- Font size: `5.5pt` (very compact!)
- Line skip: `5.5pt` (tight leading)
- Font family: `"Times New Roman", "SimSun"` (example uses multi-lang)
- Title delta: `1pt` default, can be `2pt` for larger titles

**Heading sizes (when `scaling-size: true`):**
```typst
heading_size = font-size + 2pt * (3 - it.depth)
inset_size = 1.0mm + 0.25mm * (3 - it.depth)
```
- Level 1: base + 4pt
- Level 2: base + 2pt
- Level 3: base + 0pt

### Column Layout
```typst
columns(num-columns, gutter: column-gutter, new-body)
```

**Default values:**
- `num-columns: 5` (very dense!)
- `column-gutter: 4pt`, can be reduced to `2pt`

### Section/Heading Styles

**Heading block:**
```typst
show heading: set text(white, size: heading_size)
show heading: set block(
  radius: 0.6mm,
  inset: inset_size,
  width: 100%,
  above: line_skip,
  below: line_skip,
  fill: color,  // Colored background
)
```

**Values:**
- Border radius: `0.6mm`
- Inset: `1.0mm` base (scales if `scaling-size: true`)
- Spacing: `line_skip` (5.5pt) above and below
- Text color: white
- Background: Rotates through color palette
- Numbering: `"1.1"` hierarchical

### Colors

**Default color palette (`default-color-box`):**
```typst
rgb(190, 149, 196),  // Purple
rgb(231, 111, 81),   // Orange/coral
rgb(102, 155, 188),  // Blue
rgb(229, 152, 155),  // Pink
rgb("6a4c93"),       // Deep purple
rgb("E0A500"),       // Gold
rgb("#934c84"),      // Mauve
rgb("#934c5a"),      // Rose
```

**Heading color logic:**
- Darker by `8% * (depth - 1)` for nested levels
- Rotates through palette: `calc.rem(index - 1, color-box.len())`

**Example customization:**
```typst
let my-colors = (
  rgb(190, 149, 196),
  rgb("#f39f71"),
  rgb(102, 155, 188),
  rgb(229, 152, 155),
  rgb("6a4c93"),
  rgb("E0A500"),
  rgb("#934c84"),
  rgb("#934c5a"),
)
```

### Custom Components

**`concept-block()`:**
```typst
#let concept-block(
  alignment: start,
  width: 100%,
  fill-color: white,
  body,
) = context {
  block(
    stroke: current-color,  // Matches heading color
    fill: fill-color,
    radius: 3pt,
    inset: 6pt,
    width: width,
  )[#align(alignment)[#body]]
}
```

**`inline()` function:**
Creates horizontal ruled dividers with centered labels:
```typst
box(grid(
  columns: (1fr, auto, 1fr),
  column-gutter: 1em,
  line(length: 100%, stroke: 1pt + current-color),
  text(fill: current-color, weight: "bold")[#title],
  line(length: 100%, stroke: 1pt + current-color),
))
```

### Header Configuration
```typst
header: [
  #grid(
    columns: (1fr, 1fr, 1fr),
    align: (left, center, right),
    gutter: 0pt,
    [#text(datetime.today().display(...), weight: "bold")],
    [#text(title, weight: "bold")],
    [#text(authors + " @ " + homepage, weight: "bold")]
  )
  #v(-3pt)
  #line(length: 100%, stroke: black)
]
```

**Values:**
- Three equal columns
- Bold text throughout
- 3pt negative spacing before divider line
- Optional `write-header-homepage` flag

---

## 3. knowledge-key

**Repository:** `.forge/issue-1/repos/knowledge-key/`  
**Main files:** `lib.typ`, `template/main.typ`, `template/utils.typ`

### Page Setup
```typst
set page(
  paper: paper-size,
  flipped: true,
  margin: ("top": 8mm, "rest": 5mm),
  header-ascent: 1.5mm,
  header: align(center, text(
    1.1em,
    weight: "bold",
    [#title / #authors / #context counter(page).display()],
  )),
)
```

**Values:**
- Paper: A4 landscape (default, customizable)
- Top margin: `8mm`
- Other margins: `5mm`
- Header ascent: `1.5mm`
- Header size: `1.1em` bold

### Typography
```typst
set text(
  size: font_size,
  font: "Libertinus Serif"
)
```

**Values:**
- Font size: `6pt`
- Font family: "Libertinus Serif"
- Line skip: `0.35em` (very tight)
- Par leading: `0.35em`
- Paragraph justify: `true`

### Column Layout
```typst
columns(4, gutter: 2mm, body)
```

**Values:**
- Columns: `4` (default)
- Gutter: `2mm`

### Section/Heading Styles
```typst
show heading: set text(white, size: font_size)
show heading: set block(
  radius: 0.65mm,
  inset: 0.65mm,
  width: 100%,
  above: line_skip,
  below: line_skip,
)
```

**Values:**
- Border radius: `0.65mm`
- Inset: `0.65mm`
- Spacing: `line_skip` (0.35em) above/below
- Text: white on colored background
- Numbering: `"1.1"`

### Colors

**Level-based color scheme:**
```typst
let level1_color = "#8c195f";  // Deep magenta
let level2_color = "#a12b66";  // Lighter magenta
let level3_color = "#b63d6d";  // Pink-magenta
let level4_color = "#cb4f74";  // Light pink
let level5_color = "#C63B65";  // Medium pink
```

**Assignment:**
```typst
show heading.where(level: 1): set block(fill: rgb(level1_color))
show heading.where(level: 2): set block(fill: rgb(level2_color))
// ... etc
```

**Pattern:** Progressive lightening from deep magenta to pink

### Other Settings
```typst
set block(spacing: line_skip)
set par(leading: line_skip, justify: true)
set terms(hanging-indent: 0mm)
show outline.entry.where(level: 1): set text(weight: "bold")
```

**Values:**
- Block spacing: `0.35em`
- Hanging indent: `0mm` (disabled for term lists)
- Outline L1 entries: bold

### Utilities (`utils.typ`)

Uses external packages:
```typst
#import "@preview/codelst:2.0.2": sourcecode
#import "@preview/tablex:0.0.9": tablex
```

Custom sourcecode frame:
```typst
sourcecode.with(frame: (code) => block(
  radius: 4pt,
  fill: luma(255),
  stroke: luma(230),
  inset: 2pt,
  text(size: 4pt, code)  // VERY small code!
))
```

---

## 4. cheatsheet_typst

**Repository:** `.forge/issue-1/repos/cheatsheet_typst/`  
**Main file:** `cheat_sheet.typ`

### Page Setup
```typst
set page(
  paper: "a4",
  flipped: flipped,  // Configurable orientation
  margin: 2em,
)
```

**Values:**
- Paper: A4
- Flipped: `false` (portrait by default, unlike others!)
- Margins: `2em` (uniform)

### Typography
```typst
set text(
  size: font-size,
  font: "Times New Roman"
)
set par(spacing: 0.8em, leading: 0.8em)
```

**Default values:**
- Font size: `7pt`
- Font family: "Times New Roman"
- Par spacing: `0.8em`
- Par leading: `0.8em`

### Column Layout
```typst
columns(col-count, body)
```

**Default:** `col-count: 3`

### Heading Styles
```typst
set heading(numbering: "1.")
show heading: it => [
  #v(-0.3em)
  #text(weight: "bold", size: font-size + 3pt)[#it.body]
  #v(-0.5em)
]
```

**Values:**
- Numbering: `"1."` (single level)
- Size: base + 3pt
- Weight: bold
- Above spacing: `-0.3em` (pulls up)
- Below spacing: `-0.5em` (tight)

### Other Element Spacing
```typst
show figure.caption: set text(size: font-size - 1pt)
show figure: block.with(spacing: 0.4em)
show table: block.with(spacing: 0.4em)
show raw: set text(font: "Menlo", size: font-size + 1pt)
```

**Values:**
- Figure caption: base - 1pt
- Figure/table block spacing: `0.4em`
- Code font: "Menlo"
- Code size: base + 1pt

### Title Section
```typst
if title != none {
  align(center)[
    #text(weight: "bold", size: 1.5em)[#title]
    #if author != none {
      linebreak()
      text(size: 0.9em, style: "italic")[By #author]
    }
  ]
  v(0.5em)
  line(length: 100%, stroke: 0.5pt)
  v(0.5em)
}
```

**Values:**
- Title size: `1.5em`
- Author size: `0.9em` italic
- Spacing after: `0.5em`
- Divider: `0.5pt` line
- Spacing after divider: `0.5em`

---

## Summary Comparison

| Template | Paper | Orient | Margins | Font | Size | Cols | Gutter |
|----------|-------|--------|---------|------|------|------|--------|
| **cram-snap** | A4 | Landscape | 1cm uniform | Arial | 11pt | 2 | default |
| **boxed-sheet** | A4 | Landscape | 30pt×20pt | Times NR | 5.5pt | 5 | 4pt |
| **knowledge-key** | A4 | Landscape | 8mm/5mm | Libertinus | 6pt | 4 | 2mm |
| **cheatsheet_typst** | A4 | Portrait/Land | 2em uniform | Times NR | 7pt | 3 | default |

### Font Size Patterns

- **Smallest:** boxed-sheet (5.5pt) — extreme density
- **Small:** knowledge-key (6pt)
- **Medium:** cheatsheet_typst (7pt)
- **Largest:** cram-snap (11pt) — most readable

### Line Spacing

- **Tightest:** knowledge-key (0.35em)
- **Tight:** boxed-sheet (5.5pt = ~1.0em at 5.5pt base)
- **Moderate:** cheatsheet_typst (0.8em)
- **Default:** cram-snap (uses Typst defaults)

### Column Density

- **Most columns:** boxed-sheet (5)
- **Medium:** knowledge-key (4)
- **Standard:** cheatsheet_typst (3)
- **Least:** cram-snap (2)

### Heading Approaches

1. **boxed-sheet:** Colored rounded-rect blocks, white text, 8-color rotation
2. **knowledge-key:** Colored rounded-rect blocks, white text, 5-level gradient
3. **cheatsheet_typst:** Bold text, negative vertical spacing, simple
4. **cram-snap:** N/A (table-based, not heading-based)

### Color Philosophies

- **boxed-sheet:** Vibrant 8-color palette, rotates cyclically
- **knowledge-key:** Monochromatic magenta gradient (deep → light)
- **cheatsheet_typst:** No colors (black/white only)
- **cram-snap:** User-specified table colors (light fills, dark strokes)

### Unique Features

- **cram-snap:** Table-centric design, custom `theader()` macro
- **boxed-sheet:** `concept-block()` and `inline()` helpers, state-based color cycling
- **knowledge-key:** Minimal margins (5mm), serif font, tight leading
- **cheatsheet_typst:** Portrait option, simplified structure, negative spacing compression

---

## Common Patterns

### Landscape Preference
3 of 4 templates default to landscape (`flipped: true`). Only cheatsheet_typst offers portrait as default with configurable orientation.

### Tight Spacing Philosophy
All templates emphasize density:
- Small fonts (5.5pt–11pt)
- Tight line spacing (0.35em–0.8em)
- Narrow gutters (2mm–4pt)
- Minimal margins (5mm–2em)

### Columnar Layout
All use Typst's native `columns()` function. Range: 2–5 columns.

### Colored Section Headers
2 of 4 (boxed-sheet, knowledge-key) use colored background blocks for headings with white text. Both use rounded corners and tight insets.

### Minimal Vertical Waste
Multiple strategies:
- Negative spacing (cheatsheet_typst)
- Tight `above`/`below` values (boxed-sheet, knowledge-key)
- Reduced block spacing

### Typography Choices
- **Serif:** Times New Roman (boxed-sheet, cheatsheet_typst), Libertinus Serif (knowledge-key)
- **Sans-serif:** Arial (cram-snap)
- Trend toward serif fonts for body text (75%)

---

## Code Snippet Reference

### Setting Up Multi-Column Layout
```typst
// Approach used by all templates
columns(num-columns, gutter: gutter-size)[
  #body
]

// Examples:
columns(2)[...]              // cram-snap
columns(5, gutter: 4pt)[...]  // boxed-sheet
columns(4, gutter: 2mm)[...]  // knowledge-key
columns(3)[...]              // cheatsheet_typst
```

### Colored Heading Blocks (boxed-sheet style)
```typst
show heading: set text(white, size: heading_size)
show heading: set block(
  radius: 0.6mm,
  inset: 1.0mm,
  width: 100%,
  above: 5.5pt,
  below: 5.5pt,
  fill: color,
)
```

### State-Based Color Rotation (boxed-sheet)
```typst
#let color-box-state = state("color-box", default-color-box)

show heading: it => context {
  let index = counter(heading).at(it.location()).first()
  let color-box = color-box-state.at(it.location())
  let hue = color-box.at(calc.rem(index - 1, color-box.len()))
  let color = hue.darken(8% * (it.depth - 1))
  // ... use color
}
```

### Alternating Table Fills (cram-snap)
```typst
let table_fill(color) = (
  (x, y) => {
    if calc.odd(y) { rgb(color) }
    else { none }
  }
)

set table(fill: table_fill(rgb("F2F2F2")))
```

### Tight Vertical Spacing (cheatsheet_typst)
```typst
show heading: it => [
  #v(-0.3em)
  #text(weight: "bold", size: font-size + 3pt)[#it.body]
  #v(-0.5em)
]
```

### Multi-Level Heading Colors (knowledge-key)
```typst
show heading.where(level: 1): set block(fill: rgb("#8c195f"))
show heading.where(level: 2): set block(fill: rgb("#a12b66"))
show heading.where(level: 3): set block(fill: rgb("#b63d6d"))
// ...
```

---

## Observations for New Template Design

### Extreme Density (boxed-sheet approach)
- 5.5pt font + 5 columns + 4pt gutter = maximum information density
- Requires careful readability testing
- Best for reference sheets that will be searched, not read linearly

### Balanced Readability (knowledge-key approach)
- 6pt font + 4 columns + serif font = dense but readable
- Good middle ground for technical content
- Magenta gradient aids visual navigation

### Moderate Density (cheatsheet_typst approach)
- 7pt font + 3 columns = more breathing room
- Portrait option unique among these templates
- Simpler structure easier to customize

### Table-Based Design (cram-snap approach)
- 11pt font + 2 columns + tables = most readable
- Better for command/description pairs
- Less suitable for prose or complex layouts

### Recommended Starting Points

**Maximum density (2-page reference):**
```typst
font-size: 5.5pt
line-skip: 5.5pt
columns: 5
gutter: 2pt
margin: (x: 10pt, y: 20pt)
```

**Balanced (1-2 page study guide):**
```typst
font-size: 6pt
line-skip: 0.35em
columns: 4
gutter: 2mm
margin: (top: 8mm, rest: 5mm)
```

**Readable (learning material):**
```typst
font-size: 7pt
par-spacing: 0.8em
columns: 3
margin: 2em
```

**Command reference (cram-snap style):**
```typst
font-size: 11pt
columns: 2
table-based layout
margin: 1cm
```

---

**Analysis completed:** 2026-04-02  
**Source repositories:** `.forge/issue-1/repos/`  
**Templates analyzed:** cram-snap, boxed-sheet-src, knowledge-key, cheatsheet_typst
