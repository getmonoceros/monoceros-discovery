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
| Enumerable segments (audiences, personas) | full width, h3 + paragraph, **numbered circles, teal** |
| Numbered / sequential points (assumptions, steps) | full width, h3 + paragraph, **numbered squares, teal** |
| Negative enumeration, numbered | same shape, **red** instead of teal |
| Topic / capability list (core capabilities, principles) | **2 columns**, h3 with a **fitting topic emoji** |
| Exclusions (scope-out) | 2 columns, red **status chip** ("out") |
| Positive signals (success) | 2 columns, green **status chip** ("Signal") |
| Plain prose (narrated journey) | no marker |

## Rules

- **Panels sparingly** - only the emotionally/action-charged sections (pitch,
  problem, handoff). Not every section a panel.
- **2 columns uniformly `data-breakout-width="760"`**; odd count → last column
  empty (`<p></p>`).
- **Topic emojis app-fitting** (not fixed). The numbered circles and squares are
  ordering markers: **circles** for enumerable segments, **squares** for
  sequential ones, so the two kinds stay apart at a glance.
- **Teal is the default colour.** A numbered enumeration that is negative takes
  **red** instead, in the same shape. A section that already carries a red status
  chip (scope-out, pain points) keeps the chip and takes no number - one marker
  per section, never two.
- The numbered markers come from **Atlassian's own emoji set**: 0 to 20, circle
  and square, ten colours. There is no Unicode character behind them, so write
  them as an emoji node with **all three attributes**:

      <span data-type="emoji" data-shortname=":1_one_circle_teal:" data-emoji-id="atlassian-1_one_circle_teal" data-emoji-text=":1_one_circle_teal:">:1_one_circle_teal:</span>

  **`data-emoji-id` is mandatory.** Verified on a live page: with all three
  attributes the marker renders as the coloured circle; with `data-shortname`
  alone, and with a bare `:shortcode:` in the text, Confluence renders the
  shortcode as literal text.

  The name is `<digit>_<number word>_<circle|square>_<colour>`, and the id is
  that name prefixed with `atlassian-`. So `:1_one_circle_teal:`,
  `:2_two_circle_teal:`, `:3_three_square_red:`. Colours: blue, gray, green,
  lime, magenta, orange, purple, red, teal, yellow. The full set:
  `curl -s https://api.atlassian.com/emoji/atlassian`.
- **Never as an anchor prefix.** A heading that is a deep-link target takes a
  topic emoji or none. These markers have no character, so there is nothing for
  the anchor scheme to encode.
- **In the Markdown fallback** (no Confluence) they do not exist: write a plain
  digit there.
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

## Diagrams (PlantUML)

A diagram is the **overview for the human**, never the carrier of the content.
The tables stay authoritative: the planning skill reads them, and they survive
the Markdown fallback. Nobody should have to reconstruct a model from a picture.

Diagrams need the **PlantUML Diagrams & Charts for Confluence** app. It may not
be installed, and then the macro renders as nothing. So always write the text
sketch and the tables first, and add the diagram on top. If the diagram is
missing, the page still stands.

### Writing the macro

Verified: the minimal parameter set is enough. No `cloudId`, no
`embeddedMacroContext`, no `localId`, no page reference - so a diagram can be
written onto a page that does not exist yet.

```html
<div data-type="extension" data-extension-key="4f4a33ef-c50d-44b6-9340-f5cdd566bdd3/f305fd82-ebe5-458b-b477-5e378c610cf3/static/plantuml-fullpage-editor" data-extension-type="com.atlassian.ecosystem" data-layout="default" data-parameters='{"layout":"extension","guestParams":{"code":"@startuml\n…\n@enduml","diagramName":"{caption}","type":"plantuml"},"forgeEnvironment":"PRODUCTION","extensionId":"ari:cloud:ecosystem::extension/4f4a33ef-c50d-44b6-9340-f5cdd566bdd3/f305fd82-ebe5-458b-b477-5e378c610cf3/static/plantuml-fullpage-editor"}'>PlantUML Diagrams &amp; Charts for Confluence</div>
```

The diagram source is plain text in `guestParams.code`, line breaks as `\n`.
`diagramName` renders as the caption above the diagram. Everything else is a
fixed string.

### The preamble every diagram gets

The app renders the canvas in the reader's colour mode, and PlantUML cannot
override it: `skinparam backgroundColor` is ignored. So the diagram paints its
own surface - everything goes inside a white `package`, which makes the picture
identical in light and dark mode.

```
@startuml
skinparam shadowing false
skinparam linetype ortho
skinparam packageStyle rectangle
skinparam packageBackgroundColor #FFFFFF
skinparam packageBorderColor #FFFFFF
skinparam packageFontColor #FFFFFF
skinparam classBackgroundColor #FFFFFF
skinparam classBorderColor #44546F
skinparam classFontColor #172B4D
skinparam ArrowColor #44546F
hide members
hide circle
package Modell #FFFFFF {
  class "   Handout   " as Handout
  class "   Address   " as Address
  Handout -- Address
}
@enduml
```

### Keep text out of the picture

Confluence draws the SVG with **its own** font, whatever the diagram asks for.
PlantUML sizes each box with the font it measured with, so every string is drawn
wider than the box that was computed for it. Names longer than roughly ten
characters run out of their box, and labels on the lines collide with the lines.
Setting `FontName` does not help - it is overridden. This was worked through in
nine variants; what survives is: **put no text into the diagram that the tables
already carry.**

- **No attributes in the class boxes.** They are in the attribute tables.
- **No relationship labels and no multiplicities** on the lines. They are in the
  relationship table.
- **Pad every class name with three spaces on each side**, via
  `class "   Name   " as Name`. That is what buys back the width the metric
  mismatch eats. The `as Name` keeps the references readable.
- **`linetype ortho` for right-angled lines.** Verified with eleven entities and
  an inheritance: every line runs on the grid, nothing crosses a box, and it
  reads far more calmly than the diagonal default. At two entities it makes no
  visible difference, so it costs nothing to set always.
- **Never `skinparam padding`.** It puts a yellow warning banner inside the
  picture. Spacing only through a `<style>` block, and it barely helps anyway.
- **The package name carries no quotes.** `package "." #FFFFFF` flips PlantUML
  into a component diagram and the render dies with a syntax error. `package
  Modell #FFFFFF` works, and the white font colour keeps the name invisible.

So the diagram answers exactly one question: **which entities exist and what is
connected to what.** Everything else is read off the tables. That is not a
compromise forced on us, it is the division of labour that keeps the picture
legible.

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
