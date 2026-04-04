# Spike: Pastel Theme Palette Options for Cheatsheets

Date: 2026-04-04

## Goal
Collect **pastel-oriented** color systems from credible online sources and turn them into practical theme candidates for our Typst cheatsheet template.

---

## Sources researched (online)

1. **Catppuccin palette JSON** (official)
   - https://github.com/catppuccin/palette
   - https://raw.githubusercontent.com/catppuccin/palette/main/palette.json
2. **ColorBrewer qualitative palettes**
   - https://colorbrewer2.org/
   - https://github.com/axismaps/colorbrewer
   - https://raw.githubusercontent.com/axismaps/colorbrewer/master/export/colorbrewer.json
3. **Open Color**
   - https://yeun.github.io/open-color/
   - https://github.com/yeun/open-color
   - https://raw.githubusercontent.com/yeun/open-color/master/open-color.json
4. **Nord palette**
   - https://www.nordtheme.com/
   - https://github.com/nordtheme/nord
   - https://raw.githubusercontent.com/nordtheme/nord/develop/src/nord.css
5. **Radix Colors**
   - https://www.radix-ui.com/colors
   - https://www.npmjs.com/package/@radix-ui/colors
   - Example token files: https://unpkg.com/@radix-ui/colors@3.0.0/mint.css

---

## Important finding: pastel header text color

Pastel fills generally **do not support white text** well. For our card headers, use:
- `header-text: #1F2937` (dark ink) for pastel themes
- white text only for darker/saturated accents

Quick contrast checks (min across accent sets):
- Pastel1/2/Open Sorbet vs `#1F2937`: excellent (>= ~8:1)
- Nord/Radix mixed sets: acceptable but a few colors dip; safer to keep header text dark unless we darken accents

---

## Candidate pastel theme sets

Each set includes neutrals + 12 accents to map directly to current `colors` keys:
`blue, indigo, violet, purple, pink, rose, orange, amber, emerald, teal, cyan, slate`

### Theme A — ColorBrewer Pastel 1 (soft paper)
Source: ColorBrewer `Pastel1` (9-class), with light additions from `Pastel2`

- `paper`: `#fcfcf7`
- `ink`: `#1f2937`
- `muted`: `#5f6b7a`
- accents:
  - blue `#b3cde3`
  - indigo `#cbd5e8`
  - violet `#decbe4`
  - purple `#f4cae4`
  - pink `#fddaec`
  - rose `#fbb4ae`
  - orange `#fed9a6`
  - amber `#fff2ae`
  - emerald `#ccebc5`
  - teal `#b3e2cd`
  - cyan `#b3cde3`
  - slate `#e5d8bd`

### Theme B — ColorBrewer Pastel 2 (airy + modern)
Source: ColorBrewer `Pastel2` (8-class)

- `paper`: `#fbfcfa`
- `ink`: `#1f2937`
- `muted`: `#5f6b7a`
- accents:
  - blue `#cbd5e8`
  - indigo `#cccccc`
  - violet `#f4cae4`
  - purple `#cbd5e8`
  - pink `#f4cae4`
  - rose `#fdcdac`
  - orange `#fdcdac`
  - amber `#fff2ae`
  - emerald `#e6f5c9`
  - teal `#b3e2cd`
  - cyan `#b3e2cd`
  - slate `#f1e2cc`

### Theme C — ColorBrewer Set3 Pastel Blend (more distinct sections)
Source: ColorBrewer `Set3` (12-class)

- `paper`: `#fcfcfc`
- `ink`: `#1f2937`
- `muted`: `#586174`
- accents:
  - blue `#80b1d3`
  - indigo `#bebada`
  - violet `#bc80bd`
  - purple `#fccde5`
  - pink `#fccde5`
  - rose `#fb8072`
  - orange `#fdb462`
  - amber `#ffed6f`
  - emerald `#b3de69`
  - teal `#8dd3c7`
  - cyan `#8dd3c7`
  - slate `#d9d9d9`

### Theme D — Open Color Sorbet (clean pastel, very printable)
Source: Open Color (mostly shade 2–3)

- `paper`: `#f8f9fa`
- `ink`: `#212529`
- `muted`: `#495057`
- accents:
  - blue `#a5d8ff`
  - indigo `#d0bfff`
  - violet `#e5dbff`
  - purple `#eebefa`
  - pink `#ffc9c9`
  - rose `#ffa8a8`
  - orange `#ffd8a8`
  - amber `#ffec99`
  - emerald `#b2f2bb`
  - teal `#96f2d7`
  - cyan `#99e9f2`
  - slate `#dee2e6`

### Theme E — Open Color Mist (extra light, low visual noise)
Source: Open Color (shade 1–2)

- `paper`: `#ffffff`
- `ink`: `#212529`
- `muted`: `#495057`
- accents:
  - blue `#d0ebff`
  - indigo `#e5dbff`
  - violet `#f3f0ff`
  - purple `#f3d9fa`
  - pink `#ffe3e3`
  - rose `#fff5f5`
  - orange `#ffe8cc`
  - amber `#fff3bf`
  - emerald `#d3f9d8`
  - teal `#c3fae8`
  - cyan `#c5f6fa`
  - slate `#e9ecef`

### Theme F — Catppuccin Latte Soft (brand-friendly pastel)
Source: Catppuccin Latte + lighter surfaces

- `paper`: `#eff1f5`
- `ink`: `#4c4f69`
- `muted`: `#5c5f77`
- accents:
  - blue `#7287fd`
  - indigo `#1e66f5`
  - violet `#8839ef`
  - purple `#ea76cb`
  - pink `#dd7878`
  - rose `#dc8a78`
  - orange `#fe640b`
  - amber `#df8e1d`
  - emerald `#40a02b`
  - teal `#179299`
  - cyan `#04a5e5`
  - slate `#9ca0b0`

### Theme G — Nord Light Pastel (muted arctic)
Source: Nord official 16 colors

- `paper`: `#eceff4`
- `ink`: `#2e3440`
- `muted`: `#4c566a`
- accents:
  - blue `#81a1c1`
  - indigo `#5e81ac`
  - violet `#b48ead`
  - purple `#b48ead`
  - pink `#bf616a`
  - rose `#d08770`
  - orange `#d08770`
  - amber `#ebcb8b`
  - emerald `#a3be8c`
  - teal `#8fbcbb`
  - cyan `#88c0d0`
  - slate `#d8dee9`

### Theme H — Radix Gentle (UI-system pastel)
Source: Radix light scales (mostly `-3` and `-9`)

- `paper`: `#fcfcfd` (slate-1)
- `ink`: `#1c2024` (slate-12)
- `muted`: `#60646c` (slate-11)
- accents:
  - blue `#8da4ef` (indigo-8)
  - indigo `#6e56cf` (violet-9)
  - violet `#9b9ef0` (iris-8)
  - purple `#cf91d8` (plum-8)
  - pink `#dd93c2` (pink-8)
  - rose `#e592a3` (ruby-8)
  - orange `#ec9455` (orange-8)
  - amber `#ffc53d` (amber-9)
  - emerald `#65ba74` (grass-8)
  - teal `#56ba9f` (jade-8)
  - cyan `#60b3d7` (sky-8)
  - slate `#b9bbc6` (slate-8)

### Theme I — Radix Mist (very pastel, low saturation)
Source: Radix light `-3` steps

- `paper`: `#fcfcfd`
- `ink`: `#1c2024`
- `muted`: `#60646c`
- accents:
  - blue `#edf2fe`
  - indigo `#f4f0fe`
  - violet `#f0f1fe`
  - purple `#fbebfb`
  - pink `#fee9f5`
  - rose `#feeaed`
  - orange `#ffefd6`
  - amber `#fff7c2`
  - emerald `#e9f6e9`
  - teal `#e6f7ed`
  - cyan `#e1f6fd`
  - slate `#f0f0f3`

### Theme J — Hybrid “Pastel Productive” (balanced distinctness)
Source mix: Open Color + Radix + ColorBrewer

- `paper`: `#f8f9fa`
- `ink`: `#212529`
- `muted`: `#495057`
- accents:
  - blue `#a5d8ff`
  - indigo `#aa99ec`
  - violet `#d0bfff`
  - purple `#cf91d8`
  - pink `#f4cae4`
  - rose `#ffa8a8`
  - orange `#fdb462`
  - amber `#ffec99`
  - emerald `#b2f2bb`
  - teal `#96f2d7`
  - cyan `#99e9f2`
  - slate `#dee2e6`

---

## Recommendation shortlist (start here)

If the current look is “too primary”, best first 3 to trial:

1. **Theme D — Open Color Sorbet** (cleanest pastel baseline)
2. **Theme H — Radix Gentle** (pastel but still distinct between sections)
3. **Theme A — ColorBrewer Pastel 1** (classic reference-sheet pastel)

---

## Implementation note for refactor

When we refactor, we should separate tokens into:

- `theme.ui` (paper, ink, muted, code/keycap surfaces)
- `theme.accent` (12 named section accents)
- `theme.tint` (derived or explicit card backgrounds)
- `theme.headerText` (`dark` for pastel themes)

Then expose:

```typst
#show: cheatsheet.with(theme: themes.open-sorbet)
```

and keep old API compatibility by mapping `accent/colors/tints` to `theme` internally.
