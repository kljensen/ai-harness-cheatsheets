// Title card typography variants — one page with all options
#import "../lib/cheatsheet.typ": *

#let theme-name = sys.inputs.at("theme", default: "paper_garden")
#let selected-theme = theme-from-name(theme-name)

#set page(width: 200mm, height: 280mm, margin: 8mm)

#let card-w = 55mm  // roughly column 4 width

#let variant(label, body) = context {
  let th = theme-state.at(here())
  block(width: 100%, inset: 4mm, stroke: 0.3pt + luma(200), radius: 3pt)[
    #text(size: 8pt, fill: luma(120), weight: "bold")[#label]
    #v(2mm)
    #block(width: card-w, body)
  ]
}

// Init theme
#show: doc => {
  theme-state.update(selected-theme)
  doc
}

#text(size: 14pt, weight: "bold")[Title Card Typography Variants]
#v(4mm)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 4mm,
  row-gutter: 4mm,

  // A: Bebas Neue Bold + Light
  variant("A: Bebas Neue Bold + Light", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Bebas Neue", size: 22pt, weight: "bold", fill: th.ui.text-primary)[CLAUDE CODE]
          #linebreak()
          #text(font: "Bebas Neue", size: 22pt, weight: "regular", fill: th.ui.text-muted)[CHEAT SHEET]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),

  // B: Avenir Next Heavy + Regular
  variant("B: Avenir Next Heavy + Regular", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Avenir Next", size: 16pt, weight: 900, fill: th.ui.text-primary)[Claude Code]
          #linebreak()
          #text(font: "Avenir Next", size: 16pt, weight: "regular", fill: th.ui.text-muted)[Cheat Sheet]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),

  // C: Futura Bold + Medium
  variant("C: Futura Bold + Medium", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Futura", size: 16pt, weight: "bold", fill: th.ui.text-primary)[Claude Code]
          #linebreak()
          #text(font: "Futura", size: 16pt, weight: "medium", fill: th.ui.text-muted)[Cheat Sheet]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),

  // D: Bebas Neue big + small italic subtitle
  variant("D: Bebas Neue + italic subtitle", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Bebas Neue", size: 24pt, weight: "bold", fill: th.ui.text-primary)[CLAUDE CODE]
          #linebreak()
          #text(font: "Arial", size: 9pt, style: "italic", fill: th.ui.text-muted)[Cheat Sheet]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),

  // E: Size hierarchy — big bold + small tracked
  variant("E: Arial big/small + tracking", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(size: 18pt, weight: "bold", fill: th.ui.text-primary)[Claude Code]
          #linebreak()
          #text(size: 9pt, weight: "regular", tracking: 1.5pt, fill: th.ui.text-muted)[cheat sheet]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),

  // F: Gill Sans bold + light
  variant("F: Gill Sans Bold + Light", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Gill Sans", size: 17pt, weight: "bold", fill: th.ui.text-primary)[Claude Code]
          #linebreak()
          #text(font: "Gill Sans", size: 17pt, weight: "light", fill: th.ui.text-muted)[Cheat Sheet]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),

  // G: Bebas Neue stacked tight
  variant("G: Bebas Neue tight stack", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #set par(leading: 0.3em)
          #text(font: "Bebas Neue", size: 26pt, weight: "bold", fill: th.ui.text-primary)[CLAUDE\ CODE]
          #v(1mm)
          #text(font: "Bebas Neue", size: 13pt, weight: "regular", tracking: 2pt, fill: th.ui.text-muted)[CHEAT SHEET]
        ],
        image("../assets/clawd-mini.svg", width: 18mm),
      )
    ]
  }),

  // H: Futura Medium caps + tracked subtitle
  variant("H: Futura caps + tracked", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Futura", size: 20pt, weight: "bold", fill: th.ui.text-primary)[CLAUDE CODE]
          #linebreak()
          #text(font: "Futura", size: 10pt, weight: "medium", tracking: 2pt, fill: th.ui.text-muted)[CHEAT SHEET]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),

  // I: Helvetica Neue — clean Swiss
  variant("I: Helvetica Neue Bold + Thin", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Helvetica Neue", size: 17pt, weight: "bold", fill: th.ui.text-primary)[Claude Code]
          #linebreak()
          #text(font: "Helvetica Neue", size: 17pt, weight: 100, fill: th.ui.text-muted)[Cheat Sheet]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),
)

#pagebreak()
#text(size: 14pt, weight: "bold")[Anthropic Sans Variants (Claude's official font)]
#v(4mm)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 4mm,
  row-gutter: 4mm,

  // J: Anthropic Sans — bold + light
  variant("J: Anthropic Sans 800 + 300", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Anthropic Sans Web Text", size: 17pt, weight: 800, fill: th.ui.text-primary)[Claude Code]
          #linebreak()
          #text(font: "Anthropic Sans Web Text", size: 17pt, weight: 300, fill: th.ui.text-muted)[Cheat Sheet]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),

  // K: Anthropic Sans — big bold + small tracked
  variant("K: Anthropic Sans big + tracked", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Anthropic Sans Web Text", size: 20pt, weight: 800, fill: th.ui.text-primary)[Claude Code]
          #linebreak()
          #text(font: "Anthropic Sans Web Text", size: 9pt, weight: 400, tracking: 1.5pt, fill: th.ui.text-muted)[cheat sheet]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),

  // L: Anthropic Sans — all caps
  variant("L: Anthropic Sans caps + light caps", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Anthropic Sans Web Text", size: 18pt, weight: 800, fill: th.ui.text-primary)[CLAUDE CODE]
          #linebreak()
          #text(font: "Anthropic Sans Web Text", size: 18pt, weight: 300, fill: th.ui.text-muted)[CHEAT SHEET]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),

  // M: Anthropic Sans — stacked tight
  variant("M: Anthropic Sans tight stack", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #set par(leading: 0.2em)
          #text(font: "Anthropic Sans Web Text", size: 22pt, weight: 800, fill: th.ui.text-primary)[Claude\ Code]
          #v(0.5mm)
          #text(font: "Anthropic Sans Web Text", size: 10pt, weight: 400, tracking: 1pt, fill: th.ui.text-muted)[Cheat Sheet]
        ],
        image("../assets/clawd-mini.svg", width: 18mm),
      )
    ]
  }),

  // N: Anthropic Sans — mixed case, orange accent
  variant("N: Anthropic Sans + orange accent", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Anthropic Sans Web Text", size: 17pt, weight: 800, fill: rgb("#E07A3A"))[Claude]
          #text(font: "Anthropic Sans Web Text", size: 17pt, weight: 800, fill: th.ui.text-primary)[ Code]
          #linebreak()
          #text(font: "Anthropic Sans Web Text", size: 17pt, weight: 300, fill: th.ui.text-muted)[Cheat Sheet]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),

  // O: Anthropic Sans — 600 weight, elegant
  variant("O: Anthropic Sans 600 + 300", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Anthropic Sans Web Text", size: 17pt, weight: 600, fill: th.ui.text-primary)[Claude Code]
          #linebreak()
          #text(font: "Anthropic Sans Web Text", size: 17pt, weight: 300, fill: th.ui.text-muted)[Cheat Sheet]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),

  // P: Anthropic Serif big + Sans light
  variant("P: Serif bold + Sans light", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Anthropic Serif Web Text", size: 20pt, weight: 800, fill: th.ui.text-primary)[Claude Code]
          #linebreak()
          #text(font: "Anthropic Sans Web Text", size: 16pt, weight: 300, fill: th.ui.text-muted)[Cheat Sheet]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),

  // Q: Serif big + Sans light, more size contrast
  variant("Q: Serif 800 big + Sans 300 small", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Anthropic Serif Web Text", size: 22pt, weight: 800, fill: th.ui.text-primary)[Claude Code]
          #linebreak()
          #text(font: "Anthropic Sans Web Text", size: 10pt, weight: 300, tracking: 1pt, fill: th.ui.text-muted)[Cheat Sheet]
        ],
        image("../assets/clawd-mini.svg", width: 18mm),
      )
    ]
  }),

  // R: Serif semibold + Sans light, balanced
  variant("R: Serif 600 + Sans 300", context {
    let th = theme-state.at(here())
    block(width: 100%, radius: card-radius, inset: (x: 2.5mm, y: 2mm))[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1.5mm,
        align: (left + horizon, right + horizon),
        [
          #text(font: "Anthropic Serif Web Text", size: 18pt, weight: 600, fill: th.ui.text-primary)[Claude Code]
          #linebreak()
          #text(font: "Anthropic Sans Web Text", size: 14pt, weight: 300, fill: th.ui.text-muted)[Cheat Sheet]
        ],
        image("../assets/clawd-mini.svg", width: 16mm),
      )
    ]
  }),
)
