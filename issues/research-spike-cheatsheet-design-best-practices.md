# Research spike: cheatsheet design best practices (general)

## Context
Create a broad set of design principles for dense reference/cheatsheet documents we can apply to CLI cheat sheets for Claude, Codex, and pi.

## Objective
Identify practical, reusable patterns for high-signal reference docs that are:
- fast to scan under stress
- dense but readable
- color useful but not noisy
- print-ready on US Letter

## Research questions
1. What information architecture works best for command/shortcut references?
2. What section-level hierarchy and visual grouping patterns increase task success?
3. What are recommended density limits (font, line height, cell density) before readability drops?
4. What are practical color/contrast patterns for “highlight what matters” without hurting scanability?
5. What are common formatting tricks for keyboard shortcuts and code-like tokens?
6. How to avoid the most common usability pain points in one-page cheat sheets?
7. What should be in a printable variant vs a screen variant?

## Candidate source list
### General layout/UX references
- https://thefoxclick.com/ultimate-system-design-cheat-sheet-concepts-patterns-and-best-practices/
- https://duitdesign.com/how-to-create-good-cheat-sheets-layout-design.html
- https://zerotomastery.io/cheatsheets/ui-ux-design-cheat-sheet/
- https://www.sitepoint.com/css-printer-friendly-pages/
- https://www.geeksforgeeks.org/css/how-to-create-printer-friendly-pages-with-css/

### Existing cheat-sheet-oriented templates in the wild
- https://typst.app/universe/package/cram-snap/
- https://typst.app/universe/package/boxed-sheet/
- https://typst.app/universe/package/knowledge-key/
- https://github.com/MengYueqi/cheatsheet_typst
- https://github.com/ngoetti/knowledge-key
- https://github.com/sachaheizmann/typst-cheatsheet-template
- https://github.com/LZHMS/boxed-sheet

## Deliverables
- A short design rubric with 5–8 principles (e.g., section taxonomy, row model, spacing, type scale, color accents, white space).
- A “density envelope” proposal (min acceptable font size, line-height, and row spacing ranges for print).
- A reusable section naming/categorization scheme for CLI references.
- A “do / don’t” checklist for quick implementation.

## Exit criteria (DoD)
- Documented principles approved by us.
- Concrete recommendations for how they map to: headings, rows, separators, shortcut formatting, and color usage.
- 1-2 concrete examples from reference sources that justify each recommendation.

---

## Notes during review
- Prefer sources that give repeatable templates over opinion-only posts.
- Track where each principle came from, so the sheet implementation has traceability.
