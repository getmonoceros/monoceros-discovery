---
name: discovery-design-atlassian
description: Derives the design brief for a product from the brief, personas, and journeys through a guided dialog - north star, brand personality, design principles, visual direction, key screens, interaction, and accessibility - and files it as a Confluence page under the brief. Use this skill when someone wants to work out the design direction, the design briefing, or the basis for a design system and a prototype. The design brief is the input for the subsequent generation of the design system and hi-fi prototype.
allowed-tools: Read, Write, AskUserQuestion
---

# Design Brief

You derive the **design direction** of a product from the brief, personas,
and journeys - as a design brief that then serves Claude Design (or Figma
Make) as the basis for generating a design system and a hi-fi prototype.

**Two ground rules:**

- You **add** the design layer, you do **not duplicate** the product brief
  (problem and audience live there).
- You describe the **direction**, not the finished tokens. Colors, font
  sizes, spacing emerge only during generation. The design system is an
  **output** of the generation, not an input - so don't write a system
  here, write what it should be built from.

## Output language

Author the design brief - prose, headings, and labels - in the **user's
language**. Take it from the conversation, or ask once at the start if it
is unclear ("Which language should the design brief be written in?"). This
skill's own instructions and the template's technical markers stay as they
are; only reader-visible text is written in the user's language. See the
template for exactly what never gets translated.

## Principles

- **Keep it lean**, propose rather than interrogate, one topic at a time.
- **Described list items, not a keyword dump** - each point a half-sentence
  with the *why*.
- **Key screens fall out of the journeys** - one screen per important journey.
- **Feeling before values** - visual direction as a mood, not a color code.

## Procedure

### Step 0: Read the source documents

Read the brief, personas, and journeys (from Confluence, files, or pasted
in), and if present also the technical brief (it provides platform
constraints such as PWA / mobile-first). Summarize the intended feeling and
the key journeys and confirm with the user.

**Existing design brief**: if one already exists, ask whether to update it
or create a new one.

### Step 1: Work section by section

Make a concrete proposal per section and let the user correct it.

1. **Design goal (north star)** - one sentence: which feeling/outcome the
   design must achieve.
2. **Brand personality & tone** - how the app feels and sounds.
3. **Design principles** - three to five, derived directly from the persona
   needs.
4. **Visual direction** - palette, imagery, typography, form as a mood (no
   final tokens).
5. **Key screens** - from the journeys, each with its task.
6. **Interaction & platform** - from the technical brief (PWA, mobile-first,
   offline, one-tap actions).
7. **Accessibility** - contrast, touch targets, not by color alone.
8. **Brand & assets** - existing brand/assets or greenfield.

For real choices, use **AskUserQuestion**.

### Step 2: Confirm and check coverage

Check: does every important journey have a key screen? Summarize the design
brief and get confirmation.

## Finish: create the document

1. Read the template from `references/templates.md`.
2. Fill it. The last section **"What the generation should deliver"** records:
   design system as **tokens + components** and a **hi-fi prototype** of the
   key screens, **as code** (not Figma-only), so the Monoceros workbench can
   process it directly.
3. Create the document as an **HTML+ page** (`contentFormat: html`) **under
   the brief** (ask for the brief page as parent) or as a Markdown fallback.
   Format see below.
4. **Produce the finished generation prompt.** Read
   `references/generation-prompt.md`, replace `{{PRODUCTNAME}}` with the
   product name and `{{DESIGN_BRIEF}}` with the **full content** of the
   design brief **as readable text** (not the Confluence HTML+ markup -
   Claude Design reads prose, not macros). Output the result as **one code
   block** so the user can copy it with a single click.
5. Explain in one sentence: the design brief lives in Confluence; the user
   pastes this prompt into Claude Design (or Figma Make) to generate the
   design system and hi-fi prototype from it - the system *emerges* there,
   it is not an input.

### Format (HTML+) - rhythm, not a grid

Shared style rule: `references/confluence-style.md`. The design brief has a
fixed section skeleton, but **no uniform layout** - if every section looked
the same (2 columns everywhere, emoji everywhere), the page would become
unreadable. So: **each section gets a different treatment, never the same
one twice in direct succession**, the treatment fitting the content. The
approved layout (details + HTML patterns in `references/templates.md`):

- **Design goal (north star)** → **named excerpt `Summary`**, plain text,
  **no panel** (can be transcluded).
- **Brand personality & tone** → full width, `<h3>` + `<p>`, a **mood emoji**
  per trait.
- **Design principles** → 2 columns (760), each `<h3>` with a **topic emoji**.
- **Visual direction** → full width; the **palette with color chips** as a
  mini preview (chip colors roughly matching the palette), an italic
  disclaimer at the end ("direction, not final tokens").
- **Key screens** → full width, `<h3>` + `<p>`, **numbered** (1️⃣ 2️⃣ 3️⃣ …).
- **Interaction & platform** → 2 columns (760), each `<h3>` with a **topic emoji**.
- **Accessibility** → full width, a blue **`Required` chip** before the title
  per requirement.
- **Brand & assets** → 2 columns (760), plain (no emoji).
- **What the generation should deliver** → **success panel**
  (`<div data-type="panel-success">`), `<strong>`-led paragraphs - the
  handoff into the build.
- Emojis app-fitting (not fixed). 2 columns uniformly `760`; on an odd count
  leave the last column empty.

## Style

- Propose rather than interrogate, one "why" sentence per decision.
