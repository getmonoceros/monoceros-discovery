---
name: discovery-personas-journeys
description: Derives the personas and their customer journeys from an approved brief through a guided dialog and files them as linked Confluence pages under the brief. Use when someone wants to work out personas, user types, customer journeys, or the user's path through a product. The journeys are the basis for the later epics and stories.
allowed-tools: Read, Write, AskUserQuestion
---

# Personas & Journeys

You derive, from an approved brief, the **people who use the product and
their paths through it** - as a small, linked Confluence tree under the
brief. The personas grow out of the brief's audience; the journeys must
**together cover all of the brief's core capabilities**.

## Output language

Author the personas and journeys - prose, headings, and labels - in the
**user's language**. Take it from the conversation, or ask once at the
start if it is unclear ("Which language should the pages be written
in?"). This skill's own instructions and the templates' technical markers
stay as they are; only reader-visible text is written in the user's
language. See the templates for exactly what never gets translated.

## Principles

- **Keep it lean**: one to two personas, one to two journeys. The
  personas together cover the core capabilities - more is rarely needed
  and clutters the picture.
- **Propose, don't interrogate**: phrase personas and journeys as a
  concrete proposal that the user corrects.
- **Described list items, not a keyword dump**: each point is a
  half-sentence saying *why* it belongs.
- **Journey as a story, not a table**: one coherent, narrated story with
  a trigger, pain points, and what the app changes - no column jungle, no
  emoji curve.
- **Stay problem-focused**: the journey shows how a problem gets solved,
  not a feature list.

## Procedure

### Step 0: Read the brief

Read the brief (from Confluence, a file, or pasted in). Summarize the
**audience** and **core capabilities** briefly and confirm with the user.
Agree on the scope: how many personas and journeys (default 1-2 each).
Announce the flow: personas → journeys → coverage check.

**Existing personas/journeys**: if some already exist, ask whether to
update them or create new ones.

### Step 1: Develop personas

Propose one to two personas from the brief's audience. For each:

- **Name, age, short characterization** (e.g. "the overwhelmed
  collector") - becomes the page title.
- **Description** as short prose (one paragraph): context, situation, why
  the problem hits them. Goes into the excerpt macro later.
- **Expectations**: three to four, each with a **short title** and one or
  two sentences of reasoning. The title becomes an h3 heading (anchor), so
  journeys can later link to a single expectation.

Make sure the personas together motivate the core capabilities.
Paraphrase each persona and get confirmation.

### Step 2: Work out journeys

One journey per persona (or for the most important ones). For each you
collect:

- **Short summary** (one sentence) - goes into the excerpt.
- **Persona**: which persona runs through it (embedded via
  excerpt-include).
- **Addressed core capabilities** from the brief - as a list in the page
  properties; at the same time the bridge to the later epics.
- **Trigger**: the concrete moment that starts the journey.
- **Journey**: one coherent, narrated story (happy path) as a prose
  paragraph.
- **Pain points today**: three to four, each **short title + reasoning**.
- **What the app changes**: three to four, each **short title +
  reasoning**.

The **epic only comes into being during planning** - "Epic in Jira" and
"Related work items" stay placeholders ("to follow") on the journey page
at first and are filled in then.

### Step 3: Check coverage

Check: is **every core capability** of the brief touched by at least one
journey? If something is missing, propose an additional journey or
persona. Get final confirmation.

## Finish: create the Confluence tree

Shared style rule: `references/confluence-style.md` (a marker per section
type - topic emojis on lists, status chips for pain/solution, a named
excerpt without a panel).

1. Read the templates from `references/templates.md`.
2. Create the structure **under the brief** (ask for the brief page as
   parent). "Personas" and "Journeys" should be **Confluence folders**,
   not pages (the group nodes carry no content) - but the Atlassian
   connector **cannot create folders**. So ask the user to create the two
   folders "Personas" and "Journeys" under the brief (or to name the
   existing ones), and then create **one page per persona** resp. **per
   journey** in the matching folder. Individual persona pages so they are
   directly linkable by search. Never create empty group pages as a
   substitute for folders.
3. Set the links: journey → its persona (plain page link, no anchor),
   persona → its journey, both point to the brief.
4. If no Confluence is available, write the pages as Markdown files and
   name the paths.

### Persona page: format (HTML+)

Create persona pages via the **HTML+ format** (`contentFormat: html`) -
macros and layouts work reliably that way, ADF by hand does not.
Structure:

1. **Excerpt macro, named `summary`**, around the description (one
   paragraph):
   `<div data-type="bodied-extension" data-extension-key="excerpt" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"name":{"value":"summary"}}}'><p>…</p></div>`.
   The name `summary` displays "Summary" instead of "Excerpt without
   title" and is the excerpt the journey pulls via excerpt-include. The
   name only takes effect **with the `macroParams` wrapper**.
2. **Page-properties macro** (`data-extension-key="details"`) with a
   key-value table: row "Involved in these journey(s)" → journey(s) as an
   **inline card**, row "Product brief" → brief as an inline card
   (`<a href="…" data-card-appearance="inline">…</a>`). This makes the
   fields evaluable via a page-properties report. **No `<thead>`** - both
   rows in `<tbody>`, the left cell of each row a `<th>` (row header). A
   `<thead>` makes the first row unstable (sometimes interpreted as a
   header spanning both columns).
3. **`<h2>Expectations</h2>`**.
4. The expectations as a **2-column layout**
   (`<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760">`
   with two `<div data-type="column" data-width="50">`), each expectation
   an **`<h3>` (title with a fitting emoji in front)** + `<p>` (text).
   Choose the emoji per the app's topic and the expectation, not fixed.
   The h3 gives each expectation an **anchor** for later deep links from
   journeys.

### Journey page: format (HTML+)

Also as HTML+ (`contentFormat: html`). Structure:

1. **Excerpt macro** (named `summary`) with the short summary.
2. **Page-properties macro** (`details`), table as a plain `tbody`: row
   "Epic in Jira" → the epic; as long as there is none, the text **"to
   follow"** (no link - planning turns it into the real Jira link); row
   "Addressed core capabilities" → **bullet list of the brief's addressed
   core capabilities** that the journey serves (fill in during
   discovery).
3. **`<h2>Persona(s)</h2>`** + **excerpt-include** that pulls the persona
   by page title (embeds its named `summary` excerpt):
   `<div data-type="extension" data-extension-key="excerpt-include" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"":{"value":"{persona page title}"}}}'></div>`
4. **`<h2>Trigger</h2>`** + paragraph.
5. **`<h2>Journey</h2>`** + narrated paragraph.
6. **`<h2>Pain points today</h2>`** + 2-column layout (760), each point
   `<h3>` with a **red status chip `Problem`** in front of the title
   (`<span data-type="status" data-color="red">Problem</span>`) + `<p>`.
7. **`<h2>What the app changes</h2>`** + 2-column layout, each point
   `<h3>` with a **green status chip `Solution`** in front of the title +
   `<p>`.
8. **`<h2>Related work items</h2>`** + a **Jira datasource block card** on
   `parent = EPIC-KEY` (columns type/key/summary/assignee/status). Beyond
   `cloudId` and JQL, the datasource needs the **`id` field** (Jira
   datasource provider) - without it the table renders as just an
   "N issues" tile instead. Easiest is to copy the complete datasource
   JSON from an existing Jira issues card.

Two placeholders until backfill: the row "Epic in Jira" shows **"to
follow"**, the datasource JQL uses **`parent = EPIC-KEY`** (renders empty
as "0 issues", no error). Planning sets both to the real epic.

The `<thead>` note from above applies here too.

## Style

- Propose, don't interrogate; one topic at a time.
- Paraphrase to show understanding.
- Keep personas realistic, journeys concrete and narrated.
