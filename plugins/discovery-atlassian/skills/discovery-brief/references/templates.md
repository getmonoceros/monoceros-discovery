# Template: Brief (HTML+)

In Confluence as **HTML+** (`contentFormat: html`). A marker per section type -
see `references/confluence-style.md`. Remove the `{...}` hints.

Page title: `{Product name} | Brief` (convention: product first, then artifact
type, separated by `|`. The artifact word stays **English** so titles are
language-neutral; the page content follows the output language.)

## Output language - what to translate and what not

Render **all reader-visible text in the output language** (the user's language):
section headings (`<h2>`/`<h3>` text), status-chip labels, and prose. The English
strings below are the **reference meaning**, not literal output.

**Never translate** (leave verbatim): every `data-*` attribute, `data-extension-key`
and extension type, macro parameter names, `data-color` values, the page-title
artifact word (`Brief`), and any macro/excerpt name. Emojis are structural markers -
keep them.

```html
<div data-type="panel-info"><p>{In one sentence: for whom, what, which value.}</p></div>
<div data-type="bodied-extension" data-extension-key="details" data-extension-type="com.atlassian.confluence.macro.core"><table data-width="760"><tbody><tr><th><p><strong>{Platform}</strong></p></th><td><p>{e.g. PWA}</p></td></tr><tr><th><p><strong>{Status}</strong></p></th><td><p><span data-type="status" data-color="blue">{Draft}</span></p></td></tr></tbody></table></div>
<h2>{Problem / why}</h2>
<div data-type="panel-error"><p>{Two to four sentences of prose: the actual problem and its cause.}</p></div>
<h2>{Audience}</h2>
<h3>🇦 {Group 1}</h3>
<p>{who they are and why they have the problem}</p>
<h3>🇧 {Group 2}</h3>
<p>{…}</p>
<h2>{Core capabilities}</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3>{Emoji} {Capability 1}</h3><p>{what, not how}</p></div><div data-type="column" data-width="50"><h3>{Emoji} {Capability 2}</h3><p>{…}</p></div></section>
<h2>{Out of scope}</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3><span data-type="status" data-color="red">{out}</span> {Exclusion 1}</h3><p>{why deliberately left out}</p></div><div data-type="column" data-width="50"><h3><span data-type="status" data-color="red">{out}</span> {Exclusion 2}</h3><p>{…}</p></div></section>
<h2>{How we know it works}</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3><span data-type="status" data-color="green">{Signal}</span> {Signal 1}</h3><p>{observable event}</p></div><div data-type="column" data-width="50"><p></p></div></section>
<h2>{Assumptions / frame}</h2>
<h3>1️⃣ {Frame 1}</h3>
<p>{…}</p>
<h3>2️⃣ {Frame 2}</h3>
<p>{…}</p>
```

Rules:

- **Pitch** = info panel, **problem** = error panel (red). Panels only here
  (emotionally charged), not everywhere.
- **Audience** with letter emojis (🇦 🇧 …), **assumptions** with number emojis
  (1️⃣ 2️⃣ …) - each full width, h3 + paragraph.
- **Core capabilities** with topic emojis (app-fitting), 2 columns.
- **Scope** red `{out}` chips, **success** green `{Signal}` chips, 2 columns.
- On an odd count leave the last column empty (`<p></p>`).
