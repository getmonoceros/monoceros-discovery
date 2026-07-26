---
name: planning-epics-stories-atlassian
description: Derives the backlog - epics and stories - from the discovery (brief, journeys, personas, technical brief, design) through a guided dialog, and files them as Jira issues. Use this skill when someone wants to turn requirements into a backlog, epics, or stories, plan a project, or slice work for implementation. Goal: every story is agent-ready and self-contained.
allowed-tools: Read, Write, AskUserQuestion
---

# Planning: Epics & Stories

You derive the backlog from the discovery and file it in **Jira**.

**Top rule:** every **story is self-contained**. Whoever gets only the story
(an agent like Claude Code, or a human) knows from it: for whom and why, what
to do, and where to look for details - without having to open the epic or other
issues first. The **epic stays lean**: only the bridge between its stories and
the journey.

## Output language

Author the artifact - epic and story summaries, descriptions, acceptance
criteria, and section headings - in the **user's language**. Take it from the
conversation, or ask once at the start if it is unclear ("Which language should
the backlog be written in?"). This skill's own instructions and every technical
identifier stay as they are: Jira field names, issue-type keys, JQL,
status/workflow ids, and any `data-*`/macro identifiers are never translated.
See the template for exactly what stays verbatim.

## Principles

- **Story self-contained, epic lean.** The context lives on the story, not
  in the epic.
- **As many stories as needed** per epic - no fixed number.
- **Links are smartlink cards**, not raw URLs (see step 4).
- **Descriptions are structured**, not a wall of prose.

## Procedure

### Step 0: Read the discovery and clarify the project

Read brief, journeys, personas, technical brief, and design. Summarize which
journeys/personas exist, and confirm. Ask for the **Jira project** (key). If no
design URL is in the prompt and there are UI stories, ask the user for the URL
of the design deliverable (prototype/screens) - tool-agnostic (Figma Make,
Claude Design, or other).

**Existing backlog / second pass**: for each journey, check whether a fitting
epic already exists - the epic key linked on the page still **live** in Jira, or
an epic with a fitting summary in the project. If one lives → reuse/update it, no
duplicate. If none exists (e.g. deleted in a test loop, key dead) → create a new
one. The journey link is afterward **always** pulled to the key from this run
(see backfill), even if an old/dead key still sits there.

### Step 1: Propose epics

- **Foundation epic first** (`architectural`): the walking skeleton from
  the technical brief. Card: **Technical Brief**. Its stories come from the
  walking skeleton **and the actionable open points** of the technical brief
  (the to-dos, not the still-open decisions - e.g. set twg config, mount the
  Keycloak realm, fix ports and mock port).
- **One business epic per journey** (unless a fitting, live epic already
  exists - otherwise keep using the existing one): one or two sentences of prose
  (the essence), the **journey as a card**, and epic-wide acceptance criteria.
  Nothing more - the epic is the bridge to the journey, not a context collector.
  **No** persona, brief, or technical-brief card on the business epic.

### Step 2: Stories per epic (self-contained)

Propose as many stories per epic as needed. Every story has these sections:

1. **Story text**: "As a [persona] I want [capability], so that [value]."
2. **### Business context**: a few sentences on the need behind it
   (**not** a one-sentence reference), then **persona** and **journey** each as
   an inline card with a **bold label in front** (`Persona:`, `Journey:`).
3. **### Implementation notes**: a **plan as a list** - what to do
   and what to keep in mind (e.g. backend endpoint, persistence/migration,
   frontend component, integrations, edge cases, test level). One overarching
   task list, **not** a wall of prose. Plus the **Technical Brief** as an inline
   card with a bold label (`Technical Brief:`).
4. **## Design** - **only if the story touches UI/frontend**: the
   affected design screen or prototype as a full **`blockCard`**. The design URL
   comes from the prompt; if none is there, **ask the user** for the URL of the
   design deliverable - tool-agnostic (Figma Make, Claude Design, or other). If
   none is available, leave the section out.
5. **### Acceptance criteria**: checkbox list. Per criterion **Given**,
   **When**, **Then** on **their own lines**; the labels **bold and in the
   color `#403294`**.

### Step 3: Order

Foundation epic first, then the feature epics by value and dependency.

### Step 4: Create in Jira

Use the available Atlassian tools and write **ADF**:

- **Links always as ADF cards, never as a raw URL/Markdown link.**
  Prominent single references (journey on the epic, design screen on the
  story) as a full **`blockCard`**. The context references on the story
  (persona, journey, technical brief) as an **`inlineCard` with a bold
  label in front** (`Persona:` etc.).
- **Story → Epic** via the **Parent field** (not a generic
  issue link).
- **Epic label** `business` or `architectural`.
- **Journey backfill**: on the journey page, enter the epic from this run and
  **overwrite** what is there: the "Epic in Jira" row (whether placeholder
  **"to follow"** or an old/dead key) becomes the real epic card, and in the
  "Related work items" section the classic Jira issues macro
  (`data-extension-key="jira"`) gets its `jqlQuery` set to
  `parent = <epic key of this run> ORDER BY key ASC`. That macro needs only the
  JQL - no datasource `id`, no `cloudId`. That way the journey shows its epic
  and the live table of its stories.
- **Write the backfill table correctly** (otherwise a broken header row): write
  the page-properties table as **one single `<tbody>`** - left cell `<th>`
  (label = header column), right cell **`<td>`** (the epic card). **No
  `<thead>`**: the HTML+ read wrongly returns the first row inside a `<thead>`;
  writing that back 1:1 makes Confluence turn the value `<td>` into a `<th>`, and
  the row renders as a gray header **row** instead of a header **column**. So
  dissolve the `<thead>` into `<tbody>` on write-back and keep the value cell as
  a `<td>`.
- **Acceptance criteria** as a **task list** (real checkboxes); per point
  Given/When/Then on their own lines, labels **bold and in color
  `#403294`**.
- Headings as real headings. The heading is exactly
  "Acceptance criteria" - **no** addition like "(Definition of Done)".
- Tell the user the issue keys and the order.

If a tool cannot set a card or link, tell the user and hand them what they need,
rather than silently skipping it.

## Linking matrix (what belongs at which level)

| Level            | Cards                                               |
|------------------|-----------------------------------------------------|
| Business epic    | Journey                                             |
| Foundation epic  | Technical Brief                                     |
| Feature story    | Persona + Journey (Business context), Technical Brief (Implementation), Design screen (only for UI) |
| Foundation story | Technical Brief                                     |

The story carries its context cards **deliberately itself**, so it is
self-contained. That persona/journey recur across sibling stories is
intended - self-containment beats deduplication.

## Verification & `/goal`

The acceptance criteria are the basis for checking. During implementation
the agent runs under `/goal` with "the acceptance criteria of PL-X are
met, tests and build green" - derived from the criteria, not a separate
field. Whether it *looks* like the design screen is checked by a separate
preview/human step.

## Style

- Propose rather than interrogate, one topic at a time.
- Author reader-visible content in the user's language (see Output language).
