# Spike Summary: Cheatsheet Design Best Practices (General)

## TL;DR

Dense printable CLI cheat sheets work best with **intent-based section grouping**, **3-column layouts** (4 as dense option), a **strict formatting grammar** (keycap badges / inline code / muted prose), and restrained accent color. Optimal print density: **8pt base font, 1.2 line-height, 5mm margins** on US Letter.

---

## Design Rubric (8 Principles)

### 1. Intent-based section taxonomy
Group by **what the user wants to do**, not by CLI internals. Sections like "Getting Started", "Core Commands", "Common Workflows" beat alphabetical command listings.

*Source: Devhints Claude Code sheet groups by intent (Getting started → Core Commands → Advanced); Claude Code print sheet (cc.storyfox.cz) uses task-oriented headers.*

### 2. Two-level shallow hierarchy
3–6 top-level sections, each with 2–4 subsections. Most content directly visible without nesting. Keep the tree shallow.

*Source: Both cc.storyfox.cz (8 top sections) and Devhints (10 top sections with 2–3 subsections each) use this pattern.*

### 3. Two-column command/description rows
Each entry: command/shortcut on left, one-sentence description on right. Cap at one action + one sentence per row.

*Source: Universal pattern across Devhints, cc.storyfox.cz, and GitHub CLI cheat sheets.*

### 4. Strict formatting grammar
| Content type | Format |
|---|---|
| Keyboard shortcuts | Keycap badge: mono, rounded rect, light fill, subtle border |
| Commands/flags | Inline code: mono, pale background |
| Multi-line examples | Code block, distinct from inline |
| Explanatory notes | Muted gray, optionally italic |

*Source: cc.storyfox.cz `.keycap` class; Devhints `<code>` in table cells.*

### 5. Bounded card/table units
Wrap each subsection in a visual card or table. Use `break-inside: avoid` so cards don't split across columns or pages.

*Source: Devhints uses `break-inside: avoid` on section cards; cc.storyfox.cz uses bounded column sections.*

### 6. Restrained accent color
One accent color per major section (via filled header bar or thin colored stripe). Body text stays near-black. All accents must survive grayscale conversion. Provide a light-print fallback.

*Source: cc.storyfox.cz uses colored section headers + white text, muted gray body; Devhints uses purple headings + gray body.*

### 7. Print-first density defaults
| Parameter | Value |
|---|---|
| Base font | 8pt (7.5–10pt range) |
| Line height | 1.2 (1.15–1.25 range) |
| Margins | 5mm (3–6mm range) |
| Row padding | 0.2mm |
| Section gap | 1.5mm |
| Columns | 3 (default), 4 (dense mode) |

*Source: cc.storyfox.cz print CSS uses 8.5px/1.15; Devhints uses 2–3 columns with break-inside.*

### 8. Consistent key glyph conventions
Use `Ctrl`, `Alt`, `Shift`, `Esc`, `⌘`, `⌥` consistently. Keep `white-space: nowrap` on shortcut strings. Preserve exact punctuation, quotes, hyphens, and flags.

*Source: cc.storyfox.cz keycap rendering.*

---

## Density Envelope

| Metric | Minimum | Recommended | Maximum |
|---|---|---|---|
| Font size (print) | 7.5pt | 8pt | 10pt |
| Line height | 1.1 | 1.2 | 1.3 |
| Margins (US Letter) | 3mm | 5mm | 8mm |
| Columns | 2 | 3 | 4 |
| Entries per section | 3 | 5–8 | 12 |
| Sections per page | 4 | 6–8 | 10 |

---

## Recommended Section Taxonomy for CLI Tools

Standard structure (mirrors user journey):

1. **Getting Started** — install, auth, first run
2. **Core Commands** — primary verbs / actions
3. **Keyboard Shortcuts** — interactive mode controls
4. **Common Workflows** — multi-step recipes
5. **Configuration** — env vars, config files, settings
6. **Advanced / Power** — less common but high-value
7. **Troubleshooting** — escape hatches, debugging
8. **Reference** — flag tables, aliases, appendix

For tools with interactive + non-interactive modes, adapt to:
- UI Controls → Command Syntax → Common Tasks → State/Config → Automation → Troubleshooting

---

## Do / Don't Checklist

### ✅ Do
- [ ] Group sections by user intent, not CLI structure
- [ ] Use two-column command/description layout
- [ ] Apply keycap badges for shortcuts, inline code for commands
- [ ] Keep each row to one action + one sentence
- [ ] Use bounded cards with break-inside: avoid
- [ ] Test print output at actual US Letter scale
- [ ] Ensure all color accents work in grayscale
- [ ] Provide light-print fallback mode

### ❌ Don't
- [ ] Don't use alphabetical command dumps
- [ ] Don't use more than 3–4 accent colors
- [ ] Don't let code blocks span full page width
- [ ] Don't put multi-line examples in every row
- [ ] Don't rely on color alone for meaning
- [ ] Don't use line-height > 1.3 for dense sheets
- [ ] Don't use margins > 8mm on dense US Letter

---

## Unresolved Questions (for future work)

1. **Single page vs two-page spread**: when a CLI has 80+ commands, is a cramped single page better than a well-organized two-pager?
2. **Font family for tiny print**: humanist sans vs high-x-height mono vs hybrid — needs real printer testing.
3. **OS-specific shortcuts**: show platform variants in same row (compact but noisy) or split by platform (cleaner but duplicative)?
4. **Commands vs prompts**: for AI tools with both CLI commands and NL prompts, combine by workflow or separate by type?

---

## Sources

- cc.storyfox.cz — Claude Code print cheat sheet (CSS inspected)
- devhints.io/claude-code — Devhints Claude Code reference
- cheat.sh/git — cheat.sh Git reference (negative exemplar for structure)
- Typst template repos: cram-snap, boxed-sheet, knowledge-key, cheatsheet_typst (page setup values extracted)
- Web search: cheat sheet design best practices, print CSS patterns
