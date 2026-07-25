# Templates: Personas & Journeys

Both as HTML+ (`contentFormat: html`) with macros/layout. Remove the
`{...}` hints in the final version.

## Output language - what to translate and what not

Render **all reader-visible text in the output language** (the user's
language): section headings (`<h2>`/`<h3>` text), table row labels,
status-chip labels, link text, and prose. The English strings below are
the **reference meaning**, not literal output.

**Never translate** (leave verbatim): every `data-*` attribute,
`data-extension-key` and extension type, macro parameter names (the
excerpt name `summary`), `data-color` values, JQL, `cloudId` and
datasource ids, the page-title artifact word (`Journey`), and the
artifact-type names (Persona, Journey, Brief, Epic) wherever they appear as
a heading or reference label. Emojis are structural markers - keep them.

---

## Container pages: `Personas` and `Journeys` (HTML+, `contentFormat: html`)

Two grouping pages **under the brief**, one per collection, that replace
folders. Each = a short intro paragraph (in the output language) + a divider +
the child-pages macro that auto-lists the pages filed beneath it. Titles stay
the English artifact words (`Personas`, `Journeys`). Reuse an existing one
instead of creating a duplicate.

Intro reference text (render in the **output language**):

- **Personas**: {Personas are fictional but realistic descriptions of a product's typical users. They capture goals, needs, behaviors, and problems, and help teams in discovery structure assumptions, prioritize problem spaces, and decide from the user's perspective rather than purely the company's.}
- **Journeys**: {User journeys describe the steps users take to reach a goal with a product or service. They surface the touchpoints, expectations, questions, and hurdles along the way, and help teams understand user needs, spot weak points, and derive targeted improvements for a coherent experience.}

```html
<p>{intro paragraph, in the output language - Personas resp. Journeys reference above}</p>
<hr>
<div data-type="extension" data-extension-key="children" data-extension-type="com.atlassian.confluence.macro.core" data-layout="default" data-parameters="{&quot;macroParams&quot;:{&quot;depth&quot;:{&quot;value&quot;:&quot;1&quot;},&quot;allChildren&quot;:{&quot;value&quot;:&quot;true&quot;},&quot;style&quot;:{&quot;value&quot;:&quot;h3&quot;},&quot;sortAndReverse&quot;:{&quot;value&quot;:&quot;&quot;},&quot;excerptType&quot;:{&quot;value&quot;:&quot;simple&quot;},&quot;first&quot;:{&quot;value&quot;:&quot;0&quot;}},&quot;macroMetadata&quot;:{&quot;macroId&quot;:{&quot;value&quot;:&quot;ac68f07125ac3693340608fd9e3ebb29c3a52778adc8f999125e3b3f8d42ebc8&quot;},&quot;schemaVersion&quot;:{&quot;value&quot;:&quot;2&quot;},&quot;title&quot;:&quot;Untergeordnete Seiten&quot;}}"></div>
```

- The child-pages macro **auto-lists** the persona/journey pages filed beneath the container - never hand-list them.
- Keep the `<div data-*>` and the whole `data-parameters` string **verbatim** (technical macro config, incl. `title: "Untergeordnete Seiten"`). Only the intro `<p>` is written in the output language.

---

## Persona page (HTML+, `contentFormat: html`)

Page title: `{Name}, {age} - {short characterization}`

```html
<div data-type="bodied-extension" data-extension-key="excerpt" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"name":{"value":"summary"}}}'><p>{Short prose: context, situation, why the problem hits exactly them.}</p></div>
<div data-type="bodied-extension" data-extension-key="details" data-extension-type="com.atlassian.confluence.macro.core"><table data-width="760"><tbody><tr><th><p><strong>{Involved in these journey(s)}</strong></p></th><td><p><a href="{journey-url}" data-card-appearance="inline">{journey-url}</a></p></td></tr><tr><th><p><strong>Product brief</strong></p></th><td><p><a href="{brief-url}" data-card-appearance="inline">{brief-url}</a></p></td></tr></tbody></table></div>
<h2>{Expectations}</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3>{Emoji} {Expectation 1 - title}</h3><p>{one or two sentences}</p></div><div data-type="column" data-width="50"><h3>{Emoji} {Expectation 2 - title}</h3><p>{…}</p></div></section>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3>{Emoji} {Expectation 3 - title}</h3><p>{…}</p></div><div data-type="column" data-width="50"><h3>{Emoji} {Expectation 4 - title}</h3><p>{…}</p></div></section>
```

- The excerpt is **plain text, named `summary`** (no panel - it is
  transcluded by the journey; a panel would travel with it).
- Choose the **emoji** per expectation to fit the app's topic, not fixed.
- The h3 per expectation creates an **anchor** for deep links from
  journeys.
- On an odd count leave the last column empty (`<p></p>`).

---

## Journey page (HTML+, `contentFormat: html`)

Page title: `Journey {n}: {concise title}`

```html
<div data-type="bodied-extension" data-extension-key="excerpt" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"name":{"value":"summary"}}}'><p>{Short summary of the journey, one sentence.}</p></div>
<div data-type="bodied-extension" data-extension-key="details" data-extension-type="com.atlassian.confluence.macro.core"><table data-width="760"><tbody><tr><th><p><strong>Epic in Jira</strong></p></th><td><p>{to follow}</p></td></tr><tr><th><p><strong>{Addressed core capabilities}</strong></p></th><td><ul><li><p>{Capability A}</p></li><li><p>{Capability B}</p></li></ul></td></tr></tbody></table></div>
<h2>Persona(s)</h2>
<div data-type="extension" data-extension-key="excerpt-include" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"":{"value":"{persona page title}"}}}'></div>
<h2>{Trigger}</h2>
<p>{the concrete moment that starts the journey}</p>
<h2>Journey</h2>
<p>{Narrated story in the present tense: how the persona solves their problem step by step.}</p>
<h2>{Pain points today}</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3><span data-type="status" data-color="red">{Problem}</span> {title}</h3><p>{reasoning}</p></div><div data-type="column" data-width="50"><h3><span data-type="status" data-color="red">{Problem}</span> {title}</h3><p>{…}</p></div></section>
<h2>{What the app changes}</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3><span data-type="status" data-color="green">{Solution}</span> {title}</h3><p>{…}</p></div><div data-type="column" data-width="50"><h3><span data-type="status" data-color="green">{Solution}</span> {title}</h3><p>{…}</p></div></section>
<h2>{Related work items}</h2>
<div data-type="block-card" data-url="{JQL URL with parent = EPIC-KEY}" data-datasource='{"id":"{datasource-id}","parameters":{"cloudId":"{cloudId}","jql":"parent = EPIC-KEY ORDER BY Rank"},"views":[{"type":"table","properties":{"columns":[{"key":"issuetype"},{"key":"key"},{"key":"summary"},{"key":"assignee"},{"key":"status"}]}}]}'><a href="{JQL URL with parent = EPIC-KEY}">{Related work items}</a></div>
```

- Excerpt = plain text, named `summary` (no panel).
- **Pain points** each h3 with a red `{Problem}` chip, **what the app
  changes** each h3 with a green `{Solution}` chip.
- Until backfill: "Epic in Jira" = **`{to follow}`**, datasource JQL =
  **`parent = EPIC-KEY`** (empty, no error). Planning sets both to the
  real epic.
- The datasource needs **`id`** (Jira datasource provider) **and**
  `cloudId` - without the `id` it renders just an "N issues" tile instead
  of the table. Easiest is to copy the complete datasource JSON from an
  existing Jira issues card.
