# Confluence style: a marker per section type

Shared rules for how the discovery artifacts (brief, persona, journey, design
brief) render in Confluence. Goal: **each section type gets its own marker** so
sections read distinctly - instead of monotone identical blocks. All in HTML+
(`contentFormat: html`).

Reader-visible labels below (e.g. the status-chip words) are shown in English as
reference; render them in the **output language**. Technical values
(`data-*`, `data-color`, macro/excerpt names) are never translated.

## Marker per section type

| Section type | Marker |
|---|---|
| Pitch / core statement | **info panel** (`panel-info`) |
| Problem / pain | **error panel** (`panel-error`, red) |
| Handoff / deliverable | **success panel** (`panel-success`, green) |
| Enumerable segments (audiences, personas) | full width, h3 + paragraph, **letter emojis** 🇦 🇧 🇨 |
| Numbered / sequential points (assumptions, steps) | full width, h3 + paragraph, **number emojis** 1️⃣ 2️⃣ 3️⃣ |
| Topic / capability list (core capabilities, principles) | **2 columns**, h3 with a **fitting topic emoji** |
| Exclusions (scope-out) | 2 columns, red **status chip** ("out") |
| Positive signals (success) | 2 columns, green **status chip** ("Signal") |
| Plain prose (narrated journey) | no marker |

## Rules

- **Panels sparingly** - only the emotionally/action-charged sections (pitch,
  problem, handoff). Not every section a panel.
- **2 columns uniformly `data-breakout-width="760"`**; odd count → last column
  empty (`<p></p>`).
- **Topic emojis app-fitting** (not fixed). Letter and number emojis are ordering
  markers for enumerable resp. numbered lists, and they run in sequence: 🇦 🇧 🇨,
  1️⃣ 2️⃣ 3️⃣.
- **Letter emojis are the regional indicators** (`:regional_indicator_a:` …
  `:regional_indicator_z:`), complete from A to Z. Write them as the character
  (🇦), one per heading. They only pair into a flag when two sit directly
  side by side in the same text, which never happens here.
- **Never an excerpt inside a panel** - the excerpt is transcluded, the panel
  would travel with it. Pitch-as-panel only on pages that are **not** transcluded
  (the brief). Persona/journey/design: core statement as a **named excerpt, plain text**.
- **Page-properties table** (header infobox / links): key-value, left column `<th>`.
- **No `<thead>`** in a page-properties table - both cells of a row in `<tbody>`,
  the left one a `<th>` (row header). A `<thead>` makes the first row render as a
  gray header row spanning both columns instead of a header column. A read can
  hand the first row back to you inside a `<thead>`; dissolve it on write-back.
- **When patching stored HTML, allow for attributes.** Saved headings and cells
  carry `data-local-id`, so a pattern like `<h2>Text</h2>` never matches - it has
  to be `<h2[^>]*>Text</h2>`. The same goes for `<td>`, `<p>` and `<li>`.
- **Read a page body into a file, not into the terminal.** From roughly 10 KB the
  output gets truncated, and a truncated body silently loses the part you were
  about to patch.
- **An update needs the page's current version.** Fetch it immediately before
  writing; a stale version is rejected.

## Deep links to a heading

A heading's jump mark cannot be read through any interface: the stored HTML
carries only `data-local-id` (ADF node ids), an outline listing gives headings
without anchors, and the available read formats are html, markdown and adf. The
anchor comes into being when the page is rendered. So build it from the heading
text, by rule:

1. Take the heading text exactly as it stands on the page, emoji and punctuation
   included.
2. Replace every space with a hyphen.
3. Percent-encode everything except ASCII letters, digits and the hyphen, byte by
   byte as UTF-8.

No page title, no prefix, and **do not lowercase it**. Nearly every other anchor
scheme (GitHub, MkDocs, Docusaurus) lowercases; this one does not, and a
lowercased anchor does not jump.

```
url = <page-url>#<anchor>
```

Verified against a real brief, one example per difficulty - plain ASCII, umlaut,
emoji with variant selector:

```
📤 Fertige Artefakte annehmen
  → %F0%9F%93%A4-Fertige-Artefakte-annehmen

🔒 Zugriff an der Adresse schützen
  → %F0%9F%94%92-Zugriff-an-der-Adresse-sch%C3%BCtzen

⌨️ Auf zwei Wegen veröffentlichen
  → %E2%8C%A8%EF%B8%8F-Auf-zwei-Wegen-ver%C3%B6ffentlichen
```

German umlauts, so the one error-prone step needs no arithmetic: ä `%C3%A4`,
ö `%C3%B6`, ü `%C3%BC`, ß `%C3%9F`, Ä `%C3%84`, Ö `%C3%96`, Ü `%C3%9C`.

An emoji's variant selector (U+FE0F) **stays in** and becomes `%EF%B8%8F` - the
third example above is in live use. Not verified by click: whether Confluence
normalizes it identically while rendering. If an anchor does not jump, hover the
heading in the UI, click the link symbol, copy the address, and follow the scheme
from it.

Because the anchor is derived from the text, **renaming a heading breaks every
deep link to it**. Headings that are link targets (a brief's core capabilities, a
persona's expectations) get renamed only deliberately, and the links that point
at them get corrected in the same pass.
