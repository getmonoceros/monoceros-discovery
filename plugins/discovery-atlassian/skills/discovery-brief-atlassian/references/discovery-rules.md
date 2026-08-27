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
