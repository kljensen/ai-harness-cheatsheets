# LaTeX + HTML/CSS print pattern analysis for dense CLI cheatsheets

Date: 2026-04-02  
Workspace: `/Users/klj39/src/github.com/kljensen/ai-harness-cheatsheets/.forge/issue-2`

## Goal

Research layout patterns from:

1. popular LaTeX cheat sheet/reference card sources
2. a production HTML/CSS printable cheatsheet (`https://cc.storyfox.cz/`)
3. compare those approaches against Typst for **dense printable US Letter CLI reference sheets**

This report is optimized for informing a **Typst-based cheatsheet system**.

---

## Sources examined

### GitHub repos searched

Command used:

```bash
gh search repos 'latex cheat sheet' --sort stars --limit 10
```

Top repo results included:

- `wch/latexsheet` — 172★ — classic LaTeX cheat sheet template
- `Purestone/Chitshit` — 24★ — modern exam cheatsheet template
- `ric-sar/latex_cheat_sheet`
- `Denwid/pcml-cheatsheet`

### Repos/files inspected directly

Cloned locally:

- `.forge/issue-2/latexsheet/latexsheet.tex`
- `.forge/issue-2/Chitshit/INFO6007_cheatsheet.tex`
- `.forge/issue-2/Chitshit/COMP5310_cheatsheet.tex`

Additional representative `.tex` references fetched from GitHub raw URLs:

- `.forge/issue-2/ros.tex` (`ros/cheatsheet`)
- `.forge/issue-2/yt.tex` (`yt-project/yt`)
- `.forge/issue-2/acmfi.tex` (`acmfi/cheatsheets`)

### HTML/CSS printable reference inspected

Fetched with browser-like TLS fingerprint:

- `.forge/issue-2/storyfox.html` from `https://cc.storyfox.cz/`

---

## Part 1 — LaTeX cheat sheet patterns

## A. Classic "reference card" pattern

Strong examples:

- `wch/latexsheet`
- `ros/cheatsheet`
- `yt-project/yt`

These three are clearly from the same lineage: landscape article, `geometry`, `multicol`, compressed heading spacing, empty page style, extremely small spacing between columns and sections.

### Common recipe

```tex
\documentclass[10pt,landscape]{article}
\usepackage{multicol}
\usepackage{calc}
\usepackage{ifthen}
\usepackage[landscape]{geometry}
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt plus 0.5ex}
\footnotesize
\begin{multicols}{3}
\setlength{\premulticols}{1pt}
\setlength{\postmulticols}{1pt}
\setlength{\multicolsep}{1pt}
\setlength{\columnsep}{2pt}
```

### What this pattern is doing

- **Landscape article** gives the widest printable surface with minimal document complexity.
- **`geometry`** is used for aggressive margins.
- **`multicol`** provides automatic newspaper-style content flow.
- **tiny vertical spacing** (`premulticols`, `postmulticols`, `multicolsep`) maximizes usable area.
- **very narrow `columnsep`** (`2pt`) is a major density lever.
- **`\@startsection` overrides** shrink heading whitespace.
- **`\pagestyle{empty}`** removes all non-content chrome.

### Geometry settings found

#### `wch/latexsheet`

- `\documentclass[10pt,landscape]{article}`
- conditional geometry:
  - Letter: `top=.5in,left=.5in,right=.5in,bottom=.5in`
  - A4: `top=1cm,left=1cm,right=1cm,bottom=1cm`
- 3 columns
- body font: `\footnotesize`
- column gap: `2pt`

Source lines:

- `.forge/issue-2/latexsheet/latexsheet.tex:1`
- `.forge/issue-2/latexsheet/latexsheet.tex:41-44`
- `.forge/issue-2/latexsheet/latexsheet.tex:84-94`

#### `ros/cheatsheet`

- `\documentclass[10pt,landscape]{article}`
- conditional geometry:
  - Letter: `top=.40in,left=.5in,right=.5in,bottom=.40in`
  - A4: `1cm` on all sides
- 3 columns
- body font: `\footnotesize`
- column gap: `2pt`
- even more aggressively tightened heading spacing than the original template

Source lines:

- `.forge/issue-2/ros.tex:1`
- `.forge/issue-2/ros.tex:46-49`
- `.forge/issue-2/ros.tex:58-66`
- `.forge/issue-2/ros.tex:98-104`

#### `yt-project/yt`

- `\documentclass[10pt,landscape]{article}`
- conditional geometry:
  - Letter: `top=.5in,left=.5in,right=.5in,bottom=0.85in`
  - A4: `1cm` on all sides
- 3 columns
- font set explicitly to `\fontsize{3mm}{3mm}\selectfont`
- column gap: `2pt`

Interesting note: `3mm` type is extremely dense and less semantically clear than named sizes like `\footnotesize`, but it gives exact control.

Source lines:

- `.forge/issue-2/yt.tex:1`
- `.forge/issue-2/yt.tex:40-43`
- `.forge/issue-2/yt.tex:83-93`

### Heading compression pattern

The classic lineage aggressively rewrites heading commands:

```tex
\renewcommand{\section}{\@startsection{section}{1}{0mm}%
  {-1ex plus -.5ex minus -.2ex}%
  {0.5ex plus .2ex}%
  {\normalfont\large\bfseries}}
```

Interpretation:

- negative/near-zero pre-spacing
- tiny post-spacing
- bold headings, but not oversized decorative blocks
- this is a **density-first** approach, not a card/chip design approach

This is a useful lesson for Typst: the biggest density gains come from **spacing control**, not just from reducing type size.

---

## B. Modern exam-cheatsheet pattern

Strong example:

- `Purestone/Chitshit`

This repo shows a more modern, highly compressed style than the classic reference-card template.

### `INFO6007_cheatsheet.tex`

Key settings:

- document: `\documentclass[a4paper,landscape]{article}`
- geometry: `top=.6mm,bottom=3.4mm,left=4.8mm,right=4mm`
- `\fontsize{5pt}{5pt}\selectfont`
- `\begin{multicols}{7}`
- `\setlength{\columnsep}{7pt}`
- sans default: `\renewcommand{\familydefault}{\sfdefault}`
- `\setsansfont{Verdana}`
- lists fully compacted with `enumitem`:

```tex
\setlist[itemize]{leftmargin=0pt,topsep=0pt,itemsep=0pt,parsep=0pt,label=\textbullet}
```

Source lines:

- `.forge/issue-2/Chitshit/INFO6007_cheatsheet.tex:2-19`

### What matters here

This style is optimized for **maximum information density**, not ease of authoring.

Patterns:

- **7 columns** on A4 landscape is extreme density.
- **5pt text with 5pt leading** means almost no vertical breathing room.
- **near-zero margins** push right to printer tolerance boundaries.
- **sans-serif** improves legibility at tiny sizes.
- **fully collapsed bullets/lists** are crucial in note-heavy sheets.
- **semantic helper macros** (`\sectitle`, `\concept`, `\category`) allow consistent visual encoding without repeating style markup everywhere.

This is very relevant to a Typst system: semantic macros/tokens are likely more important than raw engine choice.

### `COMP5310_cheatsheet.tex`

Key settings:

- geometry: `top=1cm,bottom=1cm,left=0.75cm,right=0.75cm`
- `\fontsize{5}{6}\selectfont`
- `\begin{multicols}{5}`
- `\setlength{\parskip}{1pt}`
- `\setlength{\parindent}{0pt}`
- sans default with font fallback logic
- topic/subtopic helper commands
- colorbox-based headers for section bands

Source lines:

- `.forge/issue-2/Chitshit/COMP5310_cheatsheet.tex:1-67`

### What this variant shows

Compared with the classic template, this one shifts toward:

- stronger visual grouping
- semantic macros for repeated patterns
- better font handling
- still very dense, but slightly more maintainable

---

## C. Common LaTeX cheatsheet/reference-card patterns across sources

From the cloned repos and code search results, the common LaTeX patterns are:

### 1. Landscape single-page article

Nearly universal.

Why it persists:

- minimal boilerplate
- broad engine compatibility
- no page furniture to fight
- easy to print

### 2. `geometry` is the main page-control primitive

Typical cheatsheet margins found:

- conservative: `0.5in` / `1cm`
- aggressive: `0.75cm`
- extreme: sub-5mm, even sub-1mm top margin in exam sheets

Practical takeaway:

- for a productized system, use a **safe default** around `0.30in–0.40in` on US Letter, not the most aggressive examples.
- printer hardware tolerances matter more than theoretical layout density.

### 3. `multicol` remains the default flow model

Observed ranges:

- classic reference cards: **3 columns**
- denser modern study sheets: **5 columns**
- extreme cram sheets: **7 columns**

Tradeoff:

- more columns increase scan speed for lookup-heavy sheets
- too many columns destroy readability and make code/commands wrap badly

For CLI references, **3–4 columns on US Letter landscape** is probably the sweet spot.

### 4. Spacing compression beats ornamental design

Common density tactics:

- remove header/footer
- zero indent
- nearly zero paragraph spacing
- rewrite section spacing
- tiny column gaps
- zero list spacing

This matters because many cheatsheet systems overfocus on typography or color; the real wins come from micro-spacing.

### 5. Monospace is usually used surgically, not globally

Observed pattern:

- body is serif or sans
- commands/flags/options are monospace
- tiny text sizes make full monospace harder to read in long prose blocks

This supports a Typst design where:

- descriptions use a compact sans/serif body
- command names and keycaps use mono
- code-only regions can switch to mono blocks

### 6. Semantic macros are the maintainability escape hatch

The better modern sheets define macros like:

- `\topic{}`
- `\subtopic{}`
- `\code{}`
- `\concept{}`
- `\sectitle{}`

This is the clearest transferable idea for Typst: create a **small semantic DSL** rather than making authors hand-style every entry.

### 7. Manual tuning is common

Classic LaTeX sheets often require:

- iterative adjustment of font size
- section spacing edits
- margin tweaks
- content reshuffling to fit exactly on one page

This is a major maintenance tax.

---

## D. LaTeX-specific lessons relevant to Typst

### Best ideas to copy

- aggressive spacing tokens
- semantic macros for headings, labels, concepts, commands
- narrow but explicit column gaps
- separate body font from command font
- hidden page chrome
- color used only for grouping, not decoration overload

### Pain points to avoid

- fragile `\@startsection` overrides
- hand-tuned negative spacing everywhere
- engine/font portability issues (`fontspec`, XeLaTeX/LuaLaTeX differences)
- one-off hacks to fit last 5% of content

---

## Part 2 — HTML/CSS print techniques from `cc.storyfox.cz`

The Storyfox cheatsheet is not using newspaper columns. It uses a **screen-first grid that also prints well**.

## A. Page setup

Relevant CSS:

- `.forge/issue-2/storyfox.html:78-81`

```css
@page {
  size: A4 landscape;
  margin: 8mm;
}
```

### Takeaway

- explicit print page size is declared
- margin is moderate, not extreme
- this is a safer browser-print strategy than ultra-tight margins

For US Letter, the analogue would be:

```css
@page { size: Letter landscape; margin: 0.3in; }
```

---

## B. Dense overall layout strategy

Relevant CSS:

- `.forge/issue-2/storyfox.html:178-183`
- `.forge/issue-2/storyfox.html:315-340`

```css
.main-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-template-rows: 1fr;
  gap: 2mm;
}
```

Then each column is actually a wrapper stack, e.g.:

```css
.section-keyboard-mcp {
  grid-column: 1;
  grid-row: 1;
  display: flex;
  flex-direction: column;
  gap: 2mm;
}
```

### Structural insight

This is effectively a **4-column dashboard layout**, but with better section control than pure CSS columns.

Why it matters:

- each vertical band can group related cards
- cards can stretch/fill available height
- content does not rebalance unpredictably like CSS multi-column content sometimes does
- author decides major spatial grouping explicitly

This is highly relevant for Typst: it suggests a **column wrapper / stacked-card model** rather than fully automatic column flow.

---

## C. Section cards

Relevant CSS:

- `.forge/issue-2/storyfox.html:187-214`
- `.forge/issue-2/storyfox.html:290-312`

Core pattern:

```css
.section {
  border-radius: 3px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
}

.section-header {
  padding: 1.2mm 2mm;
  color: white;
  font-weight: 700;
  font-size: 0.82rem;
  text-transform: uppercase;
  letter-spacing: 0.03em;
}
```

Section-specific colors are tokenized via CSS variables:

- `--keyboard-bg`
- `--keyboard-header`
- `--slash-bg`
- etc.

### Takeaway

This is a clear **card + header-band** pattern:

- body and header colors paired per topic
- small rounded corners
- tiny but consistent internal padding
- uppercase compact headers for scanability

This translates well to Typst using:

- semantic section kinds
- palette tokens
- compact header band component

---

## D. Keycap badges

Relevant CSS:

- `.forge/issue-2/storyfox.html:259-270`
- `.forge/issue-2/storyfox.html:474-477`
- `.forge/issue-2/storyfox.html:1116-1124`

```css
.keycap {
  display: inline-block;
  background: linear-gradient(180deg, #FAFAFA 0%, #E5E7EB 100%);
  border: 1px solid #D1D5DB;
  border-radius: 2px;
  padding: 0.2mm 1.2mm;
  font-family: var(--font-mono);
  font-size: 0.75rem;
  font-weight: 600;
  box-shadow: 0 1px 1px rgba(0,0,0,0.1), inset 0 -1px 0 rgba(0,0,0,0.05);
}
```

Print simplification:

```css
.keycap {
  background: #F3F4F6 !important;
  box-shadow: none;
  border: 1px solid #9CA3AF;
}
```

There is also JS-driven OS adaptation of keycap text (`Alt` ↔ `⌥`).

### Takeaway

Good keycap design pattern:

- tiny rounded inline-blocks
- mono font
- slightly embossed look on screen
- flattened simpler style in print
- support token substitution for platform variants

For Typst, keycaps should probably be drawn as tiny rounded boxes with:

- mono font
- minimum horizontal padding
- optional print-safe mode without heavy fill/shadow

---

## E. NEW/updated badges

Relevant CSS + JS:

- `.forge/issue-2/storyfox.html:275-283`
- `.forge/issue-2/storyfox.html:1145-1147`
- `.forge/issue-2/storyfox.html:535`

```css
.badge-new {
  display: inline-block;
  background: #EF4444;
  color: white;
  font-size: 0.55rem;
  font-weight: 700;
  padding: 0.2mm 1mm;
  border-radius: 2px;
  margin-left: 1mm;
}
```

And auto-hidden after 8 days via JS; also hidden in light-print mode.

### Takeaway

Operationally useful idea:

- ephemeral freshness badges are useful on web versions
- these should probably be **suppressed in print/export** because they add clutter and age badly

---

## F. Compact row layout

The content rows use a simple label/description split. The dense look comes from:

- small base font (`html { font-size: 12px; }`, `body { font-size: 0.9rem; line-height: 1.15; }`)
- tight row padding
- tiny inter-card gaps
- strong label monospace styling
- reduced print font sizing (`html { font-size: 8.5px !important; }` in print)

### Takeaway

The browser version achieves density through **consistent small scale**, not by collapsing everything into one giant table.

---

## G. Print-specific CSS techniques

Relevant print block:

- `.forge/issue-2/storyfox.html:388-504`

Key techniques extracted:

### 1. Reduce print font scale

```css
@media print {
  html { font-size: 8.5px !important; }
}
```

### 2. Preserve colors when printing

```css
-webkit-print-color-adjust: exact !important;
print-color-adjust: exact !important;
```

Used on body, key elements, and section headers.

### 3. Reduce spacing for print

- grid gap from `2mm` to `1.5mm`
- section stack gaps from `2mm` to `1.5mm`
- section header padding reduced
- section content padding reduced
- footer margin/padding reduced

### 4. Prevent page breaks inside cards/rows

```css
.section,
.section-content,
.row {
  break-inside: avoid;
  page-break-inside: avoid;
}
```

And:

```css
.sub-header + .row,
.sub-header + .two-col,
.sub-header + .three-col {
  break-before: avoid;
  page-break-before: avoid;
}
```

### 5. Force print-safe mono for commands

```css
.key,
.keycap,
code,
.footer-item code {
  font-family: 'Courier New', 'Courier', monospace !important;
}
```

### 6. Remove UI-only controls in print

- print toggle hidden
- changelog hidden
- footer form hidden
- OS toggle hidden

### 7. Flatten visual effects in print

- keycap shadow removed
- lighter backgrounds used
- optional `light-print` theme swaps to borders + grayscale fills

### Overall print lesson

The Storyfox sheet treats print as a **separate density mode**, not merely the screen stylesheet sent to paper. That is the right mental model.

---

## H. Dense subgrid layout inside cards

Relevant CSS:

- `.forge/issue-2/storyfox.html:653-668`

```css
.two-col {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 0 4mm;
}

.three-col {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 0 3mm;
}
```

### Takeaway

Inside a major 4-column page grid, they still use smaller 2-col and 3-col micro-grids for compact subsections. This is a valuable pattern:

- **macro layout** = stable outer columns/cards
- **micro layout** = small local grids inside cards

That is a strong design direction for Typst too.

---

## Part 3 — Comparison matrix: Typst vs LaTeX vs HTML/CSS

Use case: **dense printable US Letter CLI reference sheets**

| Dimension | Typst | LaTeX | HTML/CSS print |
|---|---|---|---|
| Compile speed | Usually fast in practice; generally much faster feedback than traditional TeX workflows | Often slowest and most iteration-heavy, especially with font/package complexity | Screen iteration is immediate; PDF generation step is fast, but browser print/PDF pipelines add variability |
| Print fidelity | High and deterministic once layout is encoded; good PDF-native output | Excellent, battle-tested PDF output; strongest legacy print pedigree | Good to very good, but depends on browser/engine quirks and print settings |
| Maintenance burden | Lower than LaTeX if you build a clean component DSL; syntax is modern and readable | Highest; spacing hacks, package interactions, font engine differences, and one-off layout fixes accumulate quickly | Moderate; familiar tooling, but print CSS and browser differences require ongoing testing |
| Visual control | Strong for page-native layout, spacing, reusable components, and parameterized styles | Very strong but often cumbersome; almost anything is possible with enough TeX knowledge | Extremely strong for screen-first layouts, grids, badges, responsive behavior, and interactive toggles |
| Column balancing | Better than HTML grid for pure flowing text if you design around Typst's layout primitives, but still less battle-hardened than LaTeX `multicol` traditions | Strong for classic newspaper/reference-card flow via `multicol`; proven for dense reference cards | Weak if using CSS grid for balancing; okay if manually grouped; CSS multi-column exists but can be unpredictable for structured cards |
| Best layout model for this use case | Semantic cards/rows + explicit columns or controlled flow | Auto-flow multi-column reference card | Explicit grid/cards with print overrides |
| Best authoring model | Build a Typst DSL with semantic blocks (`section`, `command`, `keycap`, `note`) | Template + macros, but author ergonomics degrade as complexity grows | Structured HTML templates/components + CSS tokens |
| Typography at tiny sizes | Good if you choose fonts carefully and keep styles simple | Excellent raw control, but setup complexity is higher | Good, though browser text metrics and print scaling need verification |
| Reusable theming | Strong with variables/functions/modules | Possible, but more ceremony and macro complexity | Excellent with CSS custom properties |
| Interactive/web extras | Weak compared with HTML | Weak | Strongest by far |
| Single-source printable product fit | Very good | Good but expensive to maintain | Good if web is primary and print is secondary |

---

## Interpretation of the matrix

## If the goal is the **best classic print-first reference card engine**

LaTeX still has the strongest historical pattern library for:

- aggressive multi-column packing
- predictable print layout
- dense academic-style reference cards

But the maintenance burden is the worst.

## If the goal is **web + print + interactivity**

HTML/CSS is best for:

- responsive layouts
- badges/toggles/OS-specific text swapping
- screen-first discoverability
- easy styling iteration

But browser print introduces enough variability that it is not the cleanest single source of truth for a printable reference-sheet product.

## If the goal is **maintainable print-native cheatsheets with modern ergonomics**

Typst looks like the best fit.

Why:

- closer to page-native publishing than HTML
- more maintainable than LaTeX
- easier to build semantic reusable components
- can borrow density ideas from LaTeX and card/grid ideas from HTML/CSS

So the strongest conclusion is not "copy LaTeX" or "copy HTML". It is:

> Use Typst as the engine, but steal **spacing discipline from LaTeX** and **component patterns from HTML/CSS**.

---

## Recommended Typst design pattern for our cheatsheet system

## 1. Prefer a hybrid layout model

Not pure auto-flow, not pure dashboard.

Recommended:

- **outer layout:** 3 or 4 explicit columns on US Letter landscape
- **inside each column:** stacked semantic cards/sections
- **inside each card:** optional micro-grids (2-col/3-col) for especially dense subsections

Why:

- easier to preserve topic grouping than full auto-flow
- more predictable than browser CSS columns
- closer to Storyfox's strong scanability
- still dense enough for CLI reference content

## 2. Make spacing tokens first-class

Suggested Typst tokens:

- `page-margin-x`
- `page-margin-y`
- `column-gap`
- `card-gap`
- `card-padding`
- `header-padding`
- `row-gap`
- `subheader-gap-before`
- `subheader-gap-after`

Density modes:

- `comfortable`
- `dense`
- `max-dense`

The LaTeX sources show that spacing controls are the real fit lever.

## 3. Use semantic components, not raw styling everywhere

Suggested primitives:

- `sheet(...)`
- `column(...)`
- `section(kind: ..., title: ...)[...]`
- `subsection(title: ...)[...]`
- `entry(term, desc)`
- `command(cmd, desc)`
- `flag(name, desc)`
- `keycap("Ctrl")`
- `badge("NEW")`
- `kv-grid(columns: 2|3)[...]`

This is the biggest lesson from both Chitshit and Storyfox.

## 4. Separate screen style from print style if a web preview exists

If the Typst system also gets an HTML preview or generated website:

- keep interactive badges/toggles only on web
- print should flatten decorations
- badges should usually be hidden or muted in print
- avoid shadows in print
- preserve only the color cues that materially improve scanning

## 5. Default typography recommendation for CLI cheatsheets

Based on the observed sources:

- body: compact sans at small size
- command labels / flags / env vars / key names: mono
- section headers: bold sans uppercase/small-caps style
- line-height: tight but not collapsed

Suggested starting point for US Letter landscape Typst:

- body text around `7.5pt–8.5pt`
- mono labels around `7pt–8pt`
- section headers around `8.5pt–9.5pt`
- 3 or 4 columns depending on command length

Notably, the most aggressive LaTeX examples go down to `5pt`, but that should be treated as an extreme cram-sheet mode, not the default.

## 6. Default paper strategy

For our use case, I would not directly copy the extreme LaTeX margins.

Recommended safe starting defaults for **US Letter landscape**:

- page margins: `0.30in–0.35in`
- 3 columns for longer command descriptions
- 4 columns for short lookup-oriented content
- local 2-col microgrids inside sections when needed

## 7. Column balancing strategy

Recommended preference order:

1. **manual semantic grouping into explicit columns** for primary sections
2. optional per-column local flow for dense subsections
3. avoid relying entirely on global automatic balancing for mixed cards, badges, and nested grids

Reason:

- LaTeX `multicol` is strong when content is mostly continuous flow
- our cheatsheets are likely more card/row structured
- Storyfox shows structured grouping can scan better than purely balanced flow

---

## Concrete patterns to port into Typst

## From LaTeX

- landscape one-page defaults
- aggressive but tokenized spacing compression
- `multicol`-style density targets
- no page furniture
- semantic macros for concepts and labels
- compact list/item handling
- separate body vs mono fonts

## From HTML/CSS

- card sections with colored header bands
- keycap component
- nested micro-grids (`two-col`, `three-col`)
- print-only spacing reduction
- optional ink-friendly print mode
- screen-only freshness badges / toggles
- explicit topic grouping by vertical column stacks

---

## Recommended decision

For a maintainable cheatsheet system targeting **dense printable CLI reference sheets**, the best path is:

### Choose Typst as the canonical rendering engine

Then implement these borrowed ideas:

- **from LaTeX:** spacing discipline, high-density defaults, print-first thinking
- **from Storyfox HTML/CSS:** card structure, palette tokens, keycaps, nested subgrids, print simplification

### Recommended initial Typst product shape

- paper: `us-letter`, landscape
- outer layout: **4 explicit columns** by default
- fallback preset: **3 columns** for verbose sheets
- section style: compact color-banded cards
- entries: monospace term + prose description row
- optional local `2-col` and `3-col` subgrids
- density presets: `normal`, `dense`, `exam`
- print-safe mode: reduced fills, no shadows, optional grayscale palette

---

## Bottom line

### Most important LaTeX lesson

**Density comes from spacing control more than from tiny fonts.**

### Most important HTML/CSS lesson

**Structured cards and nested grids improve scanability more than pure text flow does.**

### Best direction for us

**Typst should combine LaTeX's density discipline with HTML/CSS's component model.**

That combination is the best fit for a maintainable, high-density CLI cheatsheet generator.
