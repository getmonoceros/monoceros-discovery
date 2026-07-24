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
| Enumerable segments (audiences, personas) | full width, h3 + paragraph, **circle emojis** 🔵 🟢 🟡 |
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
- **Topic emojis app-fitting** (not fixed). Letter/number emojis are ordering
  markers for enumerable resp. numbered lists.
- **Never an excerpt inside a panel** - the excerpt is transcluded, the panel
  would travel with it. Pitch-as-panel only on pages that are **not** transcluded
  (the brief). Persona/journey/design: core statement as a **named excerpt, plain text**.
- **Page-properties table** (header infobox / links): key-value, left column `<th>`.
