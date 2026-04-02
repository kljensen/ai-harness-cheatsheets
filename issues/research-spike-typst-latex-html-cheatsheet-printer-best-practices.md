# Research spike: typst + latex + html cheatsheet patterns for printable references

## Context
Goal: choose a stable rendering strategy for multi-tool printable cheat sheets (US Letter), with speed of iteration and deterministic output.

## Objective
Compare patterns from Typst, LaTeX, and HTML/CSS to extract the most reliable techniques for:
- compact dense layouts
- print fidelity
- section grouping and rhythm
- code/command readability
- reproducible builds

## Research questions
1. What page setup options and defaults are used for dense reference sheets?
2. Which constructs map best to command-reference rows/cols in each format?
3. What are the strongest practices for column balancing and page overflow control?
4. How to tune typography and whitespace for legibility in print?
5. What are reliable print-focused techniques (media queries, page breaks, margins, scaling) in HTML?
6. How do teams version and maintain typographic templates over time?
7. Which approach gives fastest compile/update cycle for local edits?

## Candidate source list
### Typst
- https://typst.app/docs/guides/page-setup/
- https://typst.app/docs/reference/layout/page/
- https://typst.app/docs/reference/layout/columns/
- https://typst.app/docs/guides/for-latex-users/
- https://typst.app/tutorial/making-a-template/
- https://typst.app/universe/package/cram-snap/
- https://typst.app/universe/package/boxed-sheet/
- https://typst.app/universe/package/knowledge-key/
- https://github.com/MengYueqi/cheatsheet_typst
- https://github.com/MengYueqi/cheatsheet_typst/blob/main/cheat_sheet.typ

### LaTeX (print/reference-sheet lineage)
- https://www.overleaf.com/learn/latex/Articles/A_visual_guide_to_LaTeX%27s_page_layout_parameters
- https://ctan.math.illinois.edu/macros/latex/contrib/layouts/layman.pdf
- https://www.utc.fr/~jlaforet/Suppl/latex-cheatsheet.pdf
- https://fg.informatik.uni-goettingen.de/file/latex-cheatsheet.pdf
- https://www.hackingnote.com/en/cheatsheets/latex/

### HTML/CSS for print
- https://developer.mozilla.org/en-US/docs/Web/CSS/@media#print
- https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_media_queries/Printing
- https://www.sitepoint.com/css-printer-friendly-pages/
- https://www.customjs.space/blog/print-css-cheatsheet/

## Delivery format
Create a short comparison matrix:
- **Criteria** (usability, print safety, maintenance burden, implementation speed, visual control)
- **Typst rating + notes**
- **LaTeX rating + notes**
- **HTML/CSS rating + notes**
- Recommendation: which primitives/tools to borrow from each into final system

## Exit criteria (DoD)
- Decision on a preferred stack/pattern for this repo (single source of truth in Typst + structured content).
- Evidence-backed defaults for:
  - US Letter size and margins
  - font family/size and line-height
  - section/card spacing and command row spacing
  - page-break strategy and overflow handling
- A shortlist of “borrowed ideas” from typst/latex/html templates that can be implemented next
