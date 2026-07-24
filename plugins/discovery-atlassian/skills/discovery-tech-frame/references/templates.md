# Template: Technical Brief (HTML+)

In Confluence as **HTML+** (`contentFormat: html`). A marker per section type -
see `references/confluence-style.md`. List items are described half-sentences
with the *why*, not keywords. Catalog ids come from the live source. Remove the
`{...}` hints.

Page title: `{Product name} | Technical Brief` (convention: product first, then
artifact type, separated by `|`. The artifact word stays **English** so titles
are language-neutral; the page content follows the output language.)

No meta preamble ("This document captures …"). The page opens with the
architecture; the functional context (the brief) sits in the page tree, a link
to it is superfluous.

## Output language - what to translate and what not

Render **all reader-visible text in the output language** (the user's
language): section headings (`<h2>`/`<h3>` text), status-chip labels, and prose.
The English strings below are the **reference meaning**, not literal output.

**Never translate** (leave verbatim): every `data-*` attribute,
`data-extension-key` and extension type, macro parameter names (`summary`, the
`details` and `excerpt` macros), `data-color` values, JQL/ids, the monoceros
CLI flags (`--with-languages`, `--with-services`, `--with-features`,
`--with-ports`, `--with-repos`, `--provider`) and command names
(`monoceros init`, `monoceros add-repo`, `monoceros list-components`), the
`language-shell` class, URLs, and the page-title artifact word
(`Technical Brief`). Emojis are structural markers - keep them.

```html
<h2>{Architecture at a glance}</h2>
<div data-type="bodied-extension" data-extension-key="excerpt" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"name":{"value":"summary"}}}'><p>{Two to four sentences of prose: how the parts play together - frontend, backend, which data goes where, which services are involved.}</p></div>
<h2>{Technology decisions}</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3>{Emoji} {Area, e.g. Backend}: {Decision}</h3><p>{one sentence of rationale}</p><h3>{Emoji} {Frontend}: {Decision}</h3><p>{…}</p></div><div data-type="column" data-width="50"><h3>{Emoji} {Data storage}: {Decision}</h3><p>{…}</p><h3>{Emoji} {Auth}: {Decision}</h3><p>{…}</p></div></section>
<h2>{Mapping onto the Monoceros container definition}</h2>
<p><em>{Catalog ids from the live source (CLI {version}). Confirm the exact ids and versions at build time against }</em><code>monoceros list-components</code><em>{.}</em></p>
<div data-type="bodied-extension" data-extension-key="details" data-extension-type="com.atlassian.confluence.macro.core"><table data-width="760"><tbody><tr><th><p><code>--with-languages</code></p></th><td><p>{id, id, … - each briefly for what}</p></td></tr><tr><th><p><code>--with-services</code></p></th><td><p>{id, id, … - each briefly for what}</p></td></tr><tr><th><p><code>--with-features</code></p></th><td><p>{id, id, … - each briefly for what}</p></td></tr><tr><th><p><code>--with-ports</code></p></th><td><p>{which services browser-reachable}</p></td></tr><tr><th><p><code>--with-repos</code></p></th><td><p>{full HTTPS URL, only for github.com/gitlab.com/bitbucket.org; no repo or another host: omit the line}</p></td></tr></tbody></table></div>
<p>{Not in the yml (app-owned dependencies): {frameworks/libraries the app brings itself}. Tests: {test stacks per component}.}</p>
<p>{As a sketch (the }<code>--with-repos</code>{ line only when a repo exists on github.com/gitlab.com/bitbucket.org; otherwise omit):}</p>
<pre data-breakout="wide" data-breakout-width="760"><code class="language-shell">monoceros init {name} \
  --with-languages={…} \
  --with-services={…} \
  --with-features={…} \
  --with-ports={…} \
  --with-repos={full HTTPS URL of the repo, asked from the user - no placeholder}</code></pre>
<p>{Repo on another host (self-hosted GitLab, GitHub Enterprise …) not in }<code>--with-repos</code>{, but after the init:}</p>
<pre data-breakout="wide" data-breakout-width="760"><code class="language-shell">monoceros add-repo {name} {https-url} --provider=github|gitlab|bitbucket</code></pre>
<p>{Token/PAT setup for cloning and pushing (private repo): }<a href="https://getmonoceros.build/docs/concepts/git-and-repos/">getmonoceros.build/docs/concepts/git-and-repos</a>.</p>
<h2>{Deployment}</h2>
<div data-type="panel-note"><p>{Target and mechanics, as far as known. As long as open: "Target still to be decided" - then NOT additionally in Open points.}</p></div>
<h2>{Open points}</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3><span data-type="status" data-color="yellow">{open}</span> {Point 1}</h3><p>{what needs clarifying/doing}</p></div><div data-type="column" data-width="50"><h3><span data-type="status" data-color="yellow">{open}</span> {Point 2}</h3><p>{…}</p></div></section>
```

Rules:

- **Architecture at a glance** = the **named excerpt `summary`** (plain text, no
  panel). The architecture is the substance of the page and the transcludable
  summary at once - not a duplicate. **No meta intro** as an excerpt.
- **Technology decisions** = 2 columns (760), each `<h3>` with a **fitting topic
  emoji** (app-dependent, not fixed: e.g. ☕ Backend, ⚛️ Frontend, 🐍 mock
  service, 🔐 Auth, 🧬 vector DB, 🗄️ object storage, 🔗 integration) + `<p>`
  rationale. On an odd count leave the last column empty.
- **Mapping onto the container definition** = flag→assignment in the
  **page-properties macro** (`details`), followed by the "Not in the yml" prose
  and the `monoceros init` sketch as a code block. The table must sit inside the
  `details` macro: a bare table otherwise gets lifted unstably into a `<thead>`
  by the editor. (Even inside the macro the first row lands in `<thead>` -
  harmless on a one-time create, because in ADF it stays a header column
  `th`+`td`.)
- **Repos** = the skill asks whether a repo already exists. No repo → omit
  `--with-repos`, carry the repo as an open point. github/gitlab/bitbucket →
  full HTTPS URL in `--with-repos`. Another host → not in `--with-repos`, but
  `monoceros add-repo <name> <url> --provider=…` below it (ask for the
  provider). Under the code block, the docs link to the token setup.
- **Deployment** = **note panel** (`panel-note`). As long as undecided: a short
  "open" text - and the point then does **not** additionally appear in the open
  points (a section is the one place for its topic).
- **Open points** = 2 columns, each `<h3>` with a yellow `open` status chip +
  `<p>`. (HTML+ has no task lists - the chips are the substitute.) On an odd
  count leave the last column empty.
