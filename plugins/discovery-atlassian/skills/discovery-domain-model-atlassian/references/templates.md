# Template: Domain Model (HTML+)

In Confluence as **HTML+** (`contentFormat: html`). A marker per section type -
see `references/confluence-style.md`. Remove the `{...}` hints.

Page title: `{prefix}Domain Model`, where `{prefix}` is `{Product name} | ` or
nothing - the per-tree decision in `references/discovery-rules.md`. The artifact
words `Domain Model` stay **English** so titles are language-neutral; the content
follows the output language.

No meta preamble ("This document describes …"). The page opens with what the
domain is about; the functional context sits in the page tree.

## Output language - what to translate and what not

Render **prose and labels in the output language**: section headings, table
column labels, status-chip labels, and the descriptive sentences. The English
strings below are the **reference meaning**, not literal output.

**The names are the exception and default to English**: entity names, attribute
names, enumeration names, enumeration values and state values. The build reads
them from here and writes code. Only where the user explicitly asked for their own
language do the names follow it. Where an English name is not self-evident, the
entity's sentence names the business term.

**Never translate** (leave verbatim): every `data-*` attribute,
`data-extension-key` and extension type, macro parameter names (the excerpt name
`summary`, the `details` macro), `data-color` values, the PlantUML keywords and
`skinparam` lines, and the page-title artifact words (`Domain Model`). Data type
names (`String`, `Long`, `DateTime`, `Boolean`, `Decimal`, `Enum`) stay verbatim
too - they are read by the build, like the entity and attribute names above. Emojis are structural markers - keep them.

---

```html
<h2>{What the domain is about}</h2>
<div data-type="bodied-extension" data-extension-key="excerpt" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"name":{"value":"summary"}}}'><p>{One or two sentences: which things the product deals with and what holds them together.}</p></div>
<div data-type="bodied-extension" data-extension-key="details" data-extension-type="com.atlassian.confluence.macro.core"><table data-width="760"><tbody><tr><th><p><strong>{Product brief}</strong></p></th><td><p><a href="{brief-url}" data-card-appearance="inline">{brief-url}</a></p></td></tr><tr><th><p><strong>{Journeys}</strong></p></th><td><p><a href="{journeys-collection-page-url}" data-card-appearance="inline">{journeys-collection-page-url}</a></p></td></tr><tr><th><p><strong>{Technical brief}</strong></p></th><td><p><a href="{technical-brief-url}" data-card-appearance="inline">{technical-brief-url}</a></p></td></tr></tbody></table></div>
<h2>{The model}</h2>
<div data-type="extension" data-extension-key="{plantuml extension key, see confluence-style.md}" data-extension-type="com.atlassian.ecosystem" data-layout="default" data-parameters='{"layout":"extension","guestParams":{"code":"{@startuml … @enduml, preamble from confluence-style.md, entities and lines only}","diagramName":"{The model of <product>}","type":"plantuml"},"forgeEnvironment":"PRODUCTION","extensionId":"{extension id, see confluence-style.md}"}'>PlantUML Diagrams &amp; Charts for Confluence</div>
<h2>{Entities}</h2>
<h3>{Emoji} {Entity 1}</h3>
<p>{one sentence: what it is, in business terms}</p>
<table data-width="760"><thead><tr><th><p><strong>{Attribute}</strong></p></th><th><p><strong>{Type}</strong></p></th><th><p><strong>{Mandatory}</strong></p></th><th><p><strong>{Note}</strong></p></th></tr></thead><tbody><tr><td><p>{name}</p></td><td><p>{String}</p></td><td><p>{yes}</p></td><td><p>{only where it is not obvious}</p></td></tr></tbody></table>
<h3>{Emoji} {Entity 2}</h3>
<p>{…}</p>
<table data-width="760">{…}</table>
<h2>{Relationships}</h2>
<table data-width="760"><thead><tr><th><p><strong>{Relationship}</strong></p></th><th><p><strong>{Cardinality}</strong></p></th><th><p><strong>{What it means}</strong></p></th></tr></thead><tbody><tr><td><p>{Handout} ↔︎ {Address}</p></td><td><p>{1 : 0..1}</p></td><td><p>{one sentence covering both directions, with the verb: a handout is reachable at exactly one address, and an address belongs to at most one handout}</p></td></tr><tr><td><p>{Artifact} ↔︎ {ZipArtifact, HtmlArtifact, PdfArtifact}</p></td><td><p>{Inheritance}</p></td><td><p>{…}</p></td></tr></tbody></table>
<h2>{States}</h2>
<h3>{Emoji} {Entity with a status}</h3>
<table data-width="760"><thead><tr><th><p><strong>{From}</strong></p></th><th><p><strong>{To}</strong></p></th><th><p><strong>{Trigger}</strong></p></th><th><p><strong>{Condition}</strong></p></th><th><p><strong>{Who}</strong></p></th></tr></thead><tbody><tr><td><p>{value}</p></td><td><p>{value}</p></td><td><p>{what the persona does}</p></td><td><p>{what has to hold}</p></td><td><p>{which persona or role}</p></td></tr></tbody></table>
<h2>{Enumerations}</h2>
<table data-width="760"><thead><tr><th><p><strong>{Enumeration}</strong></p></th><th><p><strong>{Values}</strong></p></th><th><p><strong>{Used by}</strong></p></th></tr></thead><tbody><tr><td><p>{name}</p></td><td><p>{value, value, value}</p></td><td><p>{entity.attribute}</p></td></tr></tbody></table>
<h2>{Open points}</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3><span data-type="status" data-color="yellow">{open}</span> {Point 1}</h3><p>{which domain question is unresolved}</p></div><div data-type="column" data-width="50"><h3><span data-type="status" data-color="yellow">{open}</span> {Point 2}</h3><p>{…}</p></div></section>
```

Rules:

- **What the domain is about** = the **named excerpt `summary`**, plain text, no
  panel. It is transcluded, and a panel would travel with it.
- **One place per entity.** The `<h3>`, the sentence, and the attribute table sit
  together. Never a name list in one section and the attributes in another.
- **Attribute, state and enumeration tables keep a real `<thead>`.** These are
  data tables and want a header row. The no-`<thead>` rule applies only to the
  **page-properties** table at the top, which is key-value and needs a header
  **column** (`<th>` left, `<td>` right, everything in `<tbody>`).
- **The relationship table is the authoritative form**, and it is a table on
  purpose: an ASCII sketch like `Handout --1-- Address` leaves open which side the
  `1` belongs to. Here the two entities sit in **one** `Relationship` cell as
  `A ↔︎ B`, so the cardinality below reads onto them in the same order:
  `Handout ↔︎ Address` over `0..1 : 1`. The double-headed arrow also says
  that the row covers **both** directions, which is why one relationship is one
  row.
- **The `Cardinality` column is written exactly as the diagram writes it**, so the
  two cannot drift: `A "1" -- "0..1" B` becomes `1 : 0..1`. An inheritance has no
  multiplicity and carries the word `Inheritance` instead, with the subclasses
  listed on the right of the arrow.
- Anyone who reads UML gets the precision from the cardinality; everyone else
  reads the sentence, which says the same thing in words. That is why the sentence
  is not optional.
- **One row per relationship, not per direction.** Both directions are one fact
  and belong in one row; two rows say the same thing twice and double the table
  (eleven relationships became twenty-two rows in the first draft).
- **The `What it means` sentence carries the verb and both directions.** "A
  handout is reachable at exactly one address, and an address belongs to at most
  one handout" is what a reader takes away; `1 : 0..1` alone is not.
- **The model section comes before the detail.** The diagram sits in its own
  `<h2>` directly after the page properties, because it is the overview and a
  reader wants it first. It carries **entities and lines only** - no attributes,
  **with** cardinalities, but no relationship verbs. It answers which entities
  exist, what is connected to what, and how many of each; everything else is read
  off the tables. The reason for the limit is in `confluence-style.md`: Confluence
  draws the SVG with its own font, so longer text in the picture breaks out of its
  box or collides with a line.
- **An enumeration and an inheritance must not express the same distinction.**
  `ArtifactType` with the values ZIP, HTML, PDF **and** the entities
  `ZipArtifact`, `HtmlArtifact`, `PdfArtifact` is a contradiction: one of the two
  is redundant. Subclasses when the forms behave differently, an enumeration when
  they only need to be named.
- **The page properties link three ways**: the brief above, the **Journeys
  collection page** as the source (one card, not one per journey), and the
  technical brief, which reads this model.
- The page has to stand **without** the diagram - the PlantUML app may not be
  installed.
- **The entity `<h3>` is a link target.** Journeys and stories deep-link to a
  single entity, so the anchor scheme in `confluence-style.md` applies, and
  renaming an entity means correcting the links that point at it.
- **No state section for an entity without a status**, and no invented lifecycle
  to fill the template. Same for enumerations: no table if there are none.
- **Open points are domain questions only.** A technology question belongs in
  the technical brief - a section is the one place for its topic.
- 2 columns uniformly `760`; on an odd count leave the last column empty
  (`<p></p>`).
