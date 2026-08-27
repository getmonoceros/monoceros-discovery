# Template: Domain Model (HTML+)

In Confluence as **HTML+** (`contentFormat: html`). A marker per section type -
see `references/confluence-style.md`. Remove the `{...}` hints.

Page title: `{Product name} | Domain Model` (product first, then the page's own
title, separated by a spaced pipe. The artifact words `Domain Model` stay
**English** so titles are language-neutral; the content follows the output
language.)

No meta preamble ("This document describes …"). The page opens with what the
domain is about; the functional context sits in the page tree.

## Output language - what to translate and what not

Render **all reader-visible text in the output language**: section headings,
table column labels, status-chip labels, prose, and **the entity and attribute
names** - they are business terms and the build reads them from here. The English
strings below are the **reference meaning**, not literal output.

**Never translate** (leave verbatim): every `data-*` attribute,
`data-extension-key` and extension type, macro parameter names (the excerpt name
`summary`, the `details` macro), `data-color` values, the PlantUML keywords and
`skinparam` lines, and the page-title artifact words (`Domain Model`). Data type
names (`String`, `Long`, `DateTime`, `Boolean`, `Decimal`, `Enum`) stay verbatim
too - they are read by the build. Emojis are structural markers - keep them.

---

```html
<h2>{What the domain is about}</h2>
<div data-type="bodied-extension" data-extension-key="excerpt" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"name":{"value":"summary"}}}'><p>{One or two sentences: which things the product deals with and what holds them together.}</p></div>
<div data-type="bodied-extension" data-extension-key="details" data-extension-type="com.atlassian.confluence.macro.core"><table data-width="760"><tbody><tr><th><p><strong>{Product brief}</strong></p></th><td><p><a href="{brief-url}" data-card-appearance="inline">{brief-url}</a></p></td></tr><tr><th><p><strong>{Covered journeys}</strong></p></th><td><p><a href="{journey-url}" data-card-appearance="inline">{journey-url}</a></p></td></tr></tbody></table></div>
<h2>{Entities}</h2>
<h3>{Emoji} {Entity 1}</h3>
<p>{one sentence: what it is, in business terms}</p>
<table data-width="760"><thead><tr><th><p><strong>{Attribute}</strong></p></th><th><p><strong>{Type}</strong></p></th><th><p><strong>{Mandatory}</strong></p></th><th><p><strong>{Note}</strong></p></th></tr></thead><tbody><tr><td><p>{name}</p></td><td><p>{String}</p></td><td><p>{yes}</p></td><td><p>{only where it is not obvious}</p></td></tr></tbody></table>
<h3>{Emoji} {Entity 2}</h3>
<p>{…}</p>
<table data-width="760">{…}</table>
<h2>{Relationships}</h2>
<pre data-breakout="wide" data-breakout-width="760"><code>{Entity A} --1..*-- {Entity B}
{Entity A} --0..1-- {Entity C}</code></pre>
<div data-type="extension" data-extension-key="{plantuml extension key, see confluence-style.md}" data-extension-type="com.atlassian.ecosystem" data-layout="default" data-parameters='{"layout":"extension","guestParams":{"code":"{@startuml … @enduml, preamble from confluence-style.md}","diagramName":"{Domain model}","type":"plantuml"},"forgeEnvironment":"PRODUCTION","extensionId":"{extension id, see confluence-style.md}"}'>PlantUML Diagrams &amp; Charts for Confluence</div>
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
- **Sketch before diagram.** The `<pre>` sketch is the authoritative form: the
  planning skill reads it and it survives the Markdown fallback. The diagram is
  the overview for the human, and the page has to stand without it - the PlantUML
  app may not be installed.
- **The entity `<h3>` is a link target.** Journeys and stories deep-link to a
  single entity, so the anchor scheme in `confluence-style.md` applies, and
  renaming an entity means correcting the links that point at it.
- **No state section for an entity without a status**, and no invented lifecycle
  to fill the template. Same for enumerations: no table if there are none.
- **Open points are domain questions only.** A technology question belongs in
  the technical brief - a section is the one place for its topic.
- 2 columns uniformly `760`; on an odd count leave the last column empty
  (`<p></p>`).
