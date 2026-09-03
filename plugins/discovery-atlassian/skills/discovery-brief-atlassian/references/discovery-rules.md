# Discovery rules: what holds for every artifact

These rules hold for every discovery artifact - brief, persona, journey,
design brief, epic, story - and for every revision of one. Each was paid for
by a defect in a real run.

## Invent nothing

Never write a requirement, a property, or a condition of use into an artifact
that is not backed by the dialog or by an upstream artifact. When in doubt,
ask. Do not plausibly fill the gap.

This is the most expensive failure mode, because an invention in the brief
reaches every artifact built on it. Inventions observed in a single run: an
address that could be read aloud over the phone, handing the password over by
phone, an expiry date, a proof of origin on the password screen, quotation
marks around expectation titles, and an entire command-line application.

Plausible is not the test. Backed is.

## Page titles: the product prefix is a decision, asked once

The **brief always carries the product**: `<Product> | Brief`. It is the root of
the tree and the page everything else links to, so it has to be identifiable on
its own.

For every page **below** the brief - the collection pages, each persona, each
journey, the domain model, the technical brief, the design brief - the prefix is
a decision per tree:

- **A space of its own for this product** → **no prefix**. The space already says
  which product it is, and `Handout | Journeys` inside a Handout space repeats
  itself.
- **A space shared with other discovery trees** → **prefix**
  (`<Product> | <Page title>`). Without it a title like `Journeys`, or
  `J-003: Ein Handout löschen`, cannot be placed in a search across spaces.

**Ask once, with AskUserQuestion**, in the first skill that creates a page below
the brief: "Should the pages carry the product name in their title? In a space
of its own it is redundant; in a shared space it is what makes them findable."

**Do not ask again in later skills.** Derive the answer from what is already
there: look at the titles of the pages that already hang under the brief. Do they
carry the prefix, then follow suit. Only when nothing exists below the brief yet
do you ask.

Whatever is chosen holds for the **whole** tree - a mixture is worse than either
option. And where one page references another **by title**, the reference carries
the title exactly as it is: the excerpt-include macro pulls a persona by its page
title, and a reference in the wrong form finds nothing.

The artifact words stay **English** (`Brief`, `Personas`, `Journeys`,
`Domain Model`, `Technical Brief`, `Design Brief`) so titles are
language-neutral. Everything that comes from the product itself - a persona's
name, a journey's action - follows the output language.

## Read the human's comments before you revise

If the artifact already exists and a person has reviewed it, **their comments
are the work order** - not your own impression of the page. Read them first,
then work.

Read all of them:

- **Inline and footer comments are separate.** A page with no footer comments
  can still be full of inline ones.
- **Open and resolved.** A resolved thread often carries the decision.
- **With replies.** Many interfaces leave replies out unless asked for them.

Take the full comment text, not a truncated table cell, and take the marked
selection with it. That selection can be a fragment from the middle of a word,
so use the page body as well to find the passage it belongs to.

## Sections the human wrote are the calibration

Where a person has written a section themselves, that section defines the
form: sentence length, level of detail, tone, how much gets spelled out.
Derive the form from it and carry it to the remaining pages of the same type,
instead of producing further variants of your own.

Do not touch their sections unasked. Propose a change and wait.

## The page structure is closed

The sections of a template are complete. No extra sections, lists, panels or
tables, however useful they look while writing.

What turns up while writing - a missing requirement, an open decision, a
contradiction - goes into the dialog with the human, not onto the page. The
next rule gives it a destination.

## Feed findings back upstream

Writing an artifact regularly exposes that an upstream one is wrong: the brief
is missing a core capability, or has one that is wrong, or has two that are
the same thing. In one run this happened four times.

So after the coverage check, ask explicitly: **what did this change about the
brief?** Collect the changes, work them into the upstream artifact in one
pass, and only then build the downstream artifacts on it. A finding you carry
forward silently becomes a defect in every page after it.

## Derived sections go stale

Sections derived from a narrative - pain points today, what the app changes -
are written once and stop being true the moment the narrative changes.
Observed: after one flow moved into a journey of its own, the same two points
stood on two pages, one of them with no connection to its own story.

After every change to a narrative, check its derived sections against it: does
each point still describe something that happens in **this** story, and does
it not already stand on another page?

## Where each artifact sits

The whole chain, so any skill can say what comes next instead of leaving the
user to guess:

```
brief
  → personas & journeys
      ├─ domain model → technical brief
      └─ design brief
  → planning (epics & stories), once both branches are done
      → agent guide (CLAUDE.md / AGENTS.md), the handoff into the build
```

The indentation carries the point: the technical brief hangs off the **domain
model only**. The journeys fork into two branches that never meet, neither waits
for the other, and planning is the only thing that needs both.

- The **domain model** feeds the storage decision in the technical brief: what
  has to be stored decides which storage, not the other way round.
- The **design brief** feeds the generation of the design system and the hi-fi
  prototype. The technical brief does **not** need it. Planning does: every story
  that touches a screen references its deliverable.

**Name the next step when you finish.** A skill that ends without saying what
follows leaves the user to reconstruct the order from six descriptions. Where two
artifacts are open, name both and let the user pick. The design brief is the one
that gets forgotten, because nothing depends on it until planning asks for the
prototype: a product with a user interface needs it, and if the technical brief
carries an open point about the shape of that interface, it needs it now.

## Two surfaces, and what each of them can write

These skills run in two places, and they can write different things:

- **In a workbench** (Claude Code in the container): Confluence and Jira through
  whatever is configured, **and the filesystem**. Everything is possible.
- **In the chat** (claude.ai or the desktop app): Confluence and Jira through the
  connector, but **no filesystem**. A file cannot be written, and a "write it as
  a Markdown file instead" fallback has nowhere to go.

So before you fall back, check which surface you are on rather than assuming:

- **Target reachable** - write it there, as the skill says.
- **Confluence missing but a filesystem present** - Markdown files, and name the
  paths.
- **Neither** - the chat is the only place left. Put the content in the message
  as a fenced block the user can copy, and say plainly that nothing was filed and
  where it belongs. That is acceptable for one page; for a whole tree it is not,
  and then the honest answer is that the artifact needs a target and the run
  stops until there is one.

**An artifact whose natural target is the repository belongs in the workbench.**
Say so instead of producing something the user cannot place: the chat fallback
exists for the case where they have already opened an editor, not as an equal
path.

## Never the em dash

Do not use the em dash character (U+2014) anywhere in what you write. Use a
normal hyphen with a space on each side, a colon, or a restructured sentence.
The same goes for the en dash (U+2013) used as punctuation: it is the same
character reached by a different route.

This holds for **everything the skills produce**: page prose, headings, table
cells, status-chip labels, diagram labels, Jira summaries and descriptions, and
the Markdown fallback. It is a house rule, not a matter of taste, and it is the
kind of thing nobody notices until it is on fifty pages.

Pages a person wrote themselves are not touched for this - see the calibration
rule above. The rule applies to what you write from now on.

## Degree, not absoluteness

Absolute promises do not survive the first review, and they damage the
credibility of the whole artifact. "Maintenance-free", "no configuration",
"no effort", "any format" all break on contact.

- Where a capability can be enumerated, **enumerate it**. "Three forms: zip,
  HTML, PDF" is testable and documentable; "any artifact" is not.
- Where it cannot, write the **degree** instead of the absolute: "little
  maintenance and an update you need not fear", not "maintenance-free".
