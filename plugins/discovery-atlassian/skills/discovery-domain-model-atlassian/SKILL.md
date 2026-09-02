---
name: discovery-domain-model-atlassian
description: Derives the business domain model for a product from the brief and the journeys through a guided dialog - entities, relationships, attributes, states, enumerations - and files it as a Confluence page under the brief. Use this skill when someone wants to work out the data model, the entities, the domain objects, the attributes, the relationships between them, or the states an object can be in. The domain model is the reference every story is built against, and it feeds the storage decision in the technical brief.
---

# Domain Model

You work out **what the product's world is made of**: the entities, how they
relate, what they carry, and which states they can be in. The source is the
brief and the journeys - the nouns the personas actually handle.

The model is a **reference, not a build order**. It exists so the schema pieces
that grow story by story fit together. Planning still builds a schema only where
a function needs one; there is no schema story and no up-front database. If you
find yourself designing tables, you have left this skill's job.

It is also the **business** model, not a database schema: business-readable
names, no technical abbreviations, no foreign keys, no index decisions.

## Where this sits

Journeys → **domain model** → technical brief. The model comes out of the
journeys, and the storage decision in the technical brief follows from the
model, not the other way round. So it is worked out **before** the technical
brief.

The **design brief** sits beside it, not after it: it is derived from the same
journeys and independent of this model, so either can be worked first. If it is
still missing when you finish, say so - a product with a user interface needs
it, and planning will ask for its prototype.

## Before you write anything

Read `references/discovery-rules.md`. Four of its rules decide whether the
output is usable:

- **Invent nothing.** No entity, attribute, state or enumeration value that is
  not backed by the dialog, the brief, or a journey. When in doubt, ask; do not
  plausibly fill the gap. An invented attribute reaches every story that touches
  the entity.
- **Read the human's comments first** when the page already exists. Their
  comments are the work order, not your impression of the page.
- **Sections the human wrote are the calibration** for form, and they are not
  touched unasked.
- **The title prefix follows the tree.** Read it off the pages already under
  the brief: do they carry `<Product> | `, then so does this page. Only ask if
  nothing is there yet.

## Output language, and the names as a separate question

Author the page - prose, headings, section labels, table column labels - in the
**user's language**. Take it from the conversation, or ask once at the start if
it is unclear. This skill's own instructions and the template's technical markers
stay as they are.

**The names are a different decision, and they default to English.** Entity
names, attribute names, enumeration names, enumeration values and state values
are **English unless the user asks otherwise**. The build reads them from here
and writes code, and code is written in English in almost every project. A model
with German names produces either German identifiers or a translation each
developer and each agent invents again, differently.

Ask once, with AskUserQuestion, when you start naming things (step 1): "The
entity and attribute names: English, so the build can take them over
unchanged - or in your language?" If the user wants their own language, take it,
and say in one sentence what it costs: the implementation translates the names,
and it will do so inconsistently.

Where an English name is not self-evident to a reader of the prose, the entity's
sentence names the business term. `Access` is fine as a name as long as the
sentence says it is an Aufruf of a Handout.

## Principles

- **Business, not technical.** Entities and attributes are named so a domain
  expert recognizes them. No `usr_tbl`, no `fk_`, no surrogate-key debates.
- **Propose, don't interrogate.** Present candidates from the journeys; the user
  corrects.
- **Sketch before detail.** A text sketch of entities and their obvious
  relationships comes first, before any attribute is discussed. It surfaces a
  misunderstanding while it is still cheap.
- **Iteration is normal.** If an attribute turns out to be an entity, go back
  and add it. Revisions are a sign the analysis is working, not a mistake.
- **The tables are authoritative, the diagram is the overview.** Planning reads
  the tables, and they survive the Markdown fallback. The diagram answers one
  question only: which entities exist and what is connected to what.

## Procedure

### Step 0: Read the sources

Read the brief and **all** journeys (from Confluence, files, or pasted in). The
journeys are the richer source: they say what the persona actually handles.

Give one integrated summary, not three separate reports: what the product is,
which entity candidates you see from the nouns, which relationships are already
derivable, and what is still unclear. Then ask: "Have I got the context right?
Anything missing?"

**Existing domain model**: if one exists, ask whether to update it or start
fresh, and read its comments first.

### Step 1: Entities

Settle the **naming language** first (see above): English by default, one
question, then it holds for every name on the page.

Present the candidates from the noun analysis. Then settle, together:

- **Entity or attribute?** Rule of thumb: are there several instances of it that
  are told apart and referred to on their own? Then it is an entity. A colour, a
  title, a timestamp is an attribute.
- Is an important entity missing that no journey names yet?
- Are two names the same thing (synonyms)?

Confirm the list, then **immediately show a rough sketch in the chat** -
entities and the obvious relationships only, no attributes, as plain sentences:

```
Ein Handout ist unter genau einer Adresse erreichbar.
Eine Adresse gehört zu höchstens einem Handout.
Ein Handout hat beliebig viele Aufrufe.
```

Sentences, not `Handout --1-- Adresse`: with that notation nobody can tell which
side the `1` belongs to, and it takes two lines to say one thing.

### Step 2: Relationships

Propose the relationships from the sketch and the journeys. Do **not** walk
every possible pair; beyond five entities that is exhausting and rarely needed.

Per relationship: the two entities, a name (a verb or a role), the
multiplicities for both directions, and the type. One relationship stays **one**
entry, not one per direction. Then clarify only what is genuinely open:

- "Can a **B** exist without an **A**?" separates a loose relationship from a
  part-of one.
- "Is one of these a special case of another?" gives you an inheritance.

### Step 3: Attributes

Per entity: what has to be stored about it, and what makes one instance
identifiable. Per attribute a **name**, a **type**, and whether it is
**mandatory**.

Ask about **enumerations** explicitly: are there fields with a fixed set of
values? A status field almost always is, and it feeds step 4.

**An enumeration and an inheritance must not express the same distinction.** If
`ArtifactType` carries the values ZIP, HTML, PDF and the model also has
`ZipArtifact`, `HtmlArtifact` and `PdfArtifact`, one of the two is redundant and
the page contradicts itself. What decides it: **do the forms behave
differently** - own attributes, own rules, own states? Then they are subclasses
and the enumeration goes. Do they only need to be named and told apart? Then it
is an enumeration and the subclasses go. Put the question to the user; do not
settle it silently.

Offer the usual bookkeeping attributes rather than assuming them: a technical
identifier, created-at, changed-at. Offer, do not invent - if the user does not
want them, they are not in the model.

**Every attribute carries a note**, no blanks and no exceptions. It says what
the name and the type do not: where the value comes from, who sets it, where it
surfaces, what happens when it is missing. Not a restatement of the name - "the
time of creation" for `createdAt` is filler.

**If you cannot write that clause, the attribute is not settled yet.** With
`createdAt` it is usually open whether it means the upload or the publication
moment, and who sets it. Ask, rather than leaving the cell empty.

### Step 4: States

For every entity that carries a status: the allowed **values** and the allowed
**transitions**. Per transition, what triggers it, what has to hold for it to be
allowed, and who may do it.

This is where journeys and stories silently drift apart, so it is worth the
minutes. A journey that publishes something and a journey that deletes it are
two transitions on the same entity, and if the values do not line up, the
stories contradict each other.

Entities without a status get no state section. Do not invent a lifecycle to
fill the template.

### Step 5: Consolidate, then feed back

Present the whole model as text: entities with attributes, relationships with
multiplicities, states. Ask what is missing, what is redundant, and whether it
matches the business reality.

Then the mandatory step back: **what did this change about the brief or the
journeys?** Working out a model regularly exposes a core capability that is
missing, a journey that skips a step, or two capabilities that are the same
thing. Collect those, work them into the upstream artifact in one pass, and only
then let the technical brief and planning build on it. A finding carried forward
silently becomes a defect in every artifact after it.

Get final confirmation.

## Finish: create the page

Shared style rule: `references/confluence-style.md` - a marker per section type,
the diagram recipe, and the anchor scheme for deep links.

1. Read the template from `references/templates.md`.
2. Create the page as **HTML+** (`contentFormat: html`), titled
   `{prefix}Domain Model`, as a **child of the brief** - a sibling of the
   technical brief and the design brief, not nested under either.
3. If no Confluence is available, write it as a Markdown file and name the path.

### Format (HTML+)

- **What the domain is about** → **named excerpt `summary`** (plain text, no
  panel), one or two sentences. No meta intro ("This document describes …").
- **Page-properties macro** (`details`): row "Product brief" → the brief as an
  inline card, row "Journeys" → the **Journeys collection page** as one card (not
  each journey separately, that turns into a stack), row "Technical brief" → the
  technical brief, which reads this model.
- **The model** → its own `<h2>` right after the page properties, carrying the
  diagram as a PlantUML macro (recipe in `confluence-style.md`). The picture comes
  **before** the detail: it is the overview, and a reader wants it first. It
  carries entities, lines and **cardinalities** - but no attributes and no
  relationship verbs, since longer text in the picture breaks out of its box or
  collides with a line.
- **Entities** → one `<h3>` per entity with a fitting topic emoji, a sentence of
  prose, and **its attribute table directly underneath**. One place per entity,
  not names here and attributes there.
- **Relationships** → a **table**, **one row per relationship**, three columns:
  the two entities as `A ↔︎ B` in one cell, the cardinality written exactly as
  the diagram writes it, and a sentence carrying the verb and both directions in
  words. **The number beside a name says how many of that entity belong to one of
  the other** - the UML convention, and the opposite of what a reader guesses, so
  check it against the sentence before you write it down. The
  sentence is not optional: it is what a reader who does not read UML takes away.
  An inheritance carries `Inheritance` instead of a cardinality.
- **States** → one `<h3>` per entity that has a status, with a transition table.
- **Enumerations** → one table.
- **Open points** → 2 columns with yellow `open` status chips. Domain questions
  only; a technology question belongs in the technical brief.

## Style

- Propose, don't interrogate; one topic at a time.
- Sketch early, in text.
- Explain a modelling term when the user hesitates, using an example from their
  own product rather than a webshop.
- Allow iteration: going back to step 1 is normal.
- Several small models beat one unreadable one. Beyond roughly a dozen entities,
  propose splitting by subject area.
