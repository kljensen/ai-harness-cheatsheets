// Shared cheatsheet template library
// Dense, colorful, printable US Letter landscape

// ─── Color Palette ───────────────────────────────────────────────
#let colors = (
  blue:     rgb("#2563EB"),
  indigo:   rgb("#4F46E5"),
  violet:   rgb("#7C3AED"),
  purple:   rgb("#9333EA"),
  pink:     rgb("#DB2777"),
  rose:     rgb("#E11D48"),
  orange:   rgb("#EA580C"),
  amber:    rgb("#D97706"),
  emerald:  rgb("#059669"),
  teal:     rgb("#0D9488"),
  cyan:     rgb("#0891B2"),
  slate:    rgb("#475569"),
)

// Lighter tints for card backgrounds
#let tints = (
  blue:     rgb("#EFF6FF"),
  indigo:   rgb("#EEF2FF"),
  violet:   rgb("#F5F3FF"),
  purple:   rgb("#FAF5FF"),
  pink:     rgb("#FDF2F8"),
  rose:     rgb("#FFF1F2"),
  orange:   rgb("#FFF7ED"),
  amber:    rgb("#FFFBEB"),
  emerald:  rgb("#ECFDF5"),
  teal:     rgb("#F0FDFA"),
  cyan:     rgb("#ECFEFF"),
  slate:    rgb("#F8FAFC"),
)

// ─── Fonts ───────────────────────────────────────────────────────
#let body-font = ("Helvetica Neue", "Helvetica", "Arial")
#let mono-font = ("Menlo", "Courier New")

// ─── Sizing ──────────────────────────────────────────────────────
#let body-size = 8pt
#let mono-size = 7.5pt
#let header-size = 8.5pt
#let title-size = 16pt
#let subtitle-size = 9pt
#let section-title-size = 9pt
#let subsection-title-size = 7pt

// ─── Spacing ─────────────────────────────────────────────────────
#let card-gap = 3mm
#let card-radius = 3pt
#let card-inset = 2.5mm
#let header-inset = (x: 3mm, y: 1.5mm)
#let row-gap = 1.2mm

// ─── Keycap Component ────────────────────────────────────────────
#let keycap(key) = {
  box(
    fill: rgb("#F3F4F6"),
    stroke: 0.4pt + rgb("#D1D5DB"),
    radius: 1.5pt,
    inset: (x: 1.8pt, y: 0.8pt),
    baseline: 0.8pt,
    text(font: mono-font, size: mono-size, weight: "semibold", key)
  )
}

// ─── Code Component ──────────────────────────────────────────────
#let code(content) = {
  box(
    fill: rgb("#F8FAFC"),
    radius: 1pt,
    inset: (x: 1.5pt, y: 0.5pt),
    baseline: 0.5pt,
    text(font: mono-font, size: mono-size, content)
  )
}

// ─── Entry Row (key + description) ──────────────────────────────
#let entry(key, desc) = {
  block(spacing: row-gap,
    grid(
      columns: (auto, 1fr),
      column-gutter: 2mm,
      align: (left, left),
      text(font: mono-font, size: mono-size, weight: "medium", key),
      text(size: body-size, fill: rgb("#374151"), desc),
    )
  )
}

// ─── Subsection Header ──────────────────────────────────────────
#let subsection(title, accent: rgb("#6B7280"), body) = {
  block(spacing: 1.2mm,
    block(
      spacing: 0.5mm,
      text(
        size: subsection-title-size,
        weight: "bold",
        fill: accent,
        upper(title)
      )
    )
  )
  body
}

// ─── Section Card ────────────────────────────────────────────────
#let section(
  title: "",
  icon: "",
  accent: colors.blue,
  tint: tints.blue,
  body
) = {
  block(
    width: 100%,
    radius: card-radius,
    clip: true,
    stroke: 0.3pt + accent.lighten(60%),
    {
      // Header band
      block(
        width: 100%,
        fill: accent,
        inset: header-inset,
        text(
          size: section-title-size,
          weight: "bold",
          fill: white,
          tracking: 0.3pt,
          {
            if icon != "" { icon + " " }
            upper(title)
          }
        )
      )
      // Body
      block(
        width: 100%,
        fill: tint,
        inset: card-inset,
        body
      )
    }
  )
}

// ─── Page Title Bar ─────────────────────────────────────────────
#let page-title(title, subtitle: none, accent: colors.blue) = {
  block(
    width: 100%,
    inset: (x: 3mm, y: 2mm),
    fill: accent,
    radius: 2pt,
    {
      text(size: title-size, weight: "bold", fill: white, tracking: 0.5pt, title)
      if subtitle != none {
        h(3mm)
        text(size: subtitle-size, fill: white.darken(15%), subtitle)
      }
    }
  )
}

// ─── Footer ─────────────────────────────────────────────────────
#let page-footer(left-text, right-text) = {
  block(
    width: 100%,
    inset: (x: 1mm, y: 0mm),
    grid(
      columns: (1fr, 1fr),
      text(size: 5pt, fill: rgb("#9CA3AF"), left-text),
      align(right, text(size: 5pt, fill: rgb("#9CA3AF"), right-text)),
    )
  )
}

// ─── Main Cheatsheet Setup ──────────────────────────────────────
#let cheatsheet(
  title: "Cheat Sheet",
  subtitle: none,
  accent: colors.blue,
  col-count: 4,
  col-gutter: card-gap,
  body
) = {
  set page(
    paper: "us-letter",
    flipped: true,
    margin: (x: 6mm, y: 5mm),
  )
  set text(
    font: body-font,
    size: body-size,
    weight: "regular",
    fill: rgb("#1F2937"),
  )
  set par(leading: 0.35em, spacing: 0.4em, justify: false)

  body
}
