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

## Degree, not absoluteness

Absolute promises do not survive the first review, and they damage the
credibility of the whole artifact. "Maintenance-free", "no configuration",
"no effort", "any format" all break on contact.

- Where a capability can be enumerated, **enumerate it**. "Three forms: zip,
  HTML, PDF" is testable and documentable; "any artifact" is not.
- Where it cannot, write the **degree** instead of the absolute: "little
  maintenance and an update you need not fear", not "maintenance-free".
