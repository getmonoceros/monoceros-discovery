# Template: the agent guide

Markdown files in the repository, not Confluence pages. `CLAUDE.md` for Claude
Code, `AGENTS.md` for opencode, same content. Remove the `{...}` hints.

The **public** file goes to the project root and is committed. The **private**
one goes to `.claude/CLAUDE.md` (or `.opencode/AGENTS.md`), is added to
`.gitignore`, and only exists in the two constellations that need it.

## Output language

Write it in the **user's language**, like the discovery pages - except the
entity names, attribute names and enum values, which keep the naming language
the domain model settled on, and the technical markers (paths, commands, tool
names, `docs/adr/`, `monoceros-ctl`), which stay verbatim.

---

## The public file

```markdown
# {Product}

{Two sentences from the brief: what this is and for whom.}

## Stack

- {language, from the technical brief}
- {service} - {what it holds}
- Brought by the app itself, not by the workbench: {frameworks and libraries}

## Conventions

{Verbatim from the technical brief's cross-cutting conventions, one line each.}

- **{Authentication}**: {…}
- **{Validation}**: {…}
- **{Error shape}**: {…}
- **{Identifiers}**: {…}
- **{Migrations}**: {…}

## Domain vocabulary

{The entity names from the domain model, one line each. Names in the naming
language the model settled on; the sentence in the output language.}

- `{Entity}` - {one line}
- `{Entity}` - {one line}

## Decisions

Under `docs/adr/`, numbered. A decision recorded there is settled: build on it,
and if it has to be overturned, say so and name the ADR by number.

## Running the work

- Servers are declared in `.monoceros/launch.json` and driven with
  `monoceros-ctl start|stop|logs`. Never a bare shell start, never `pkill`.
- An acceptance command has to be able to fail: {the shape this project uses}.

## Development flow

{The twelve steps, or the user's version of them.}

## Out of scope

{The brief's exclusions, one line each. What is deliberately postponed says so
and names what keeps it open.}
```

## The private file

Only in the two constellations with internal discovery or an internal tracker.
Nothing in here is referenced from any committed file.

```markdown
# {Product}: internal references

Machine-local, gitignored. Nothing that is committed points at anything in
here.

## Discovery

- Brief: {URL}
- Journeys: {URL of the collection page}
- Domain model: {URL}
- Technical brief: {URL}
- Design brief: {URL}

## Tracker

- {Jira project key}, board {name}
- {The statuses in the order the flow uses them}

## Access

{How the container reaches these: the tool and the variables it needs, never
the values.}
```

Rules:

- **The split is decided by one rule**: what describes the code is public, what
  names the instance, the customer or an internal artifact is not.
- **No public file points at a private one.** Not the README, not the docs, not
  a code comment, not a commit message. The public file may say that internal
  coordinates exist; it does not say where.
- **Credentials never appear in either file**, not even in the private one. It
  names the variable, never the value.
- **Every line traces to an artifact.** A convention that is in neither the
  technical brief nor the dialog does not go in, however sensible it looks.
- **Short.** This file is read before every task in the repository.
