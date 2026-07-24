# Templates: Epic & Story (for Jira)

In Jira as **ADF**. Rules:

- **References as ADF cards**, never as a raw URL/Markdown link.
  Prominent single references (journey on the epic, design screen on the
  story) as a full **`blockCard`**. Context references on the story
  (persona, journey, technical brief) as an **`inlineCard` with a bold
  label in front** (`Persona:`, `Journey:`, `Technical Brief:`).
- **Acceptance criteria as a checkbox list**; Given/When/Then each on
  its own line, labels **bold and in color `#403294`**.
- Descriptions structured, not a wall of prose.

Goal: the story is self-contained. Remove the `{...}` hints in the final
version.

## Output language - what to translate and what not

Render **all reader-visible text in the output language** (the user's language):
issue summaries, description prose, section headings, and list items. The
English strings below are the **reference meaning**, not literal output.

**Never translate** (leave verbatim): Jira field names (Summary, Parent, Label),
issue-type keys, JQL, status/workflow ids, the label values `business` /
`architectural`, ADF node types (`blockCard`, `inlineCard`), the color
`#403294`, any `data-*`/macro identifiers, the BDD keywords Given/When/Then, and
the artifact-type names (Persona, Journey, Technical Brief, Epic, Story).

---

## Epic (Business) - lean, bridge to the journey

- **Summary**: {short, crisp title}
- **Label**: `business`

{One or two sentences of prose: the essence of the epic.}

{Journey as blockCard}

### {Acceptance criteria}

- [ ] {epic-wide criterion}
- [ ] {…}

---

## Epic (Architectural)

- **Summary**: {Walking skeleton …}
- **Label**: `architectural`

{One or two sentences of prose.}

{Technical Brief as blockCard}

### {Acceptance criteria}

- [ ] {…}

---

## Story - self-contained

As a {persona} I want {capability}, so that {value}.

### {Business context}

A few sentences on the need behind it - enough that the business sense is
clear (not a one-sentence reference).

**Persona:** {persona as inline card}

**Journey:** {journey as inline card}

### {Implementation notes}

Plan as a list - what to do and what to keep in mind:

- {Backend: endpoint, persistence/migration}
- {Frontend: component(s)}
- {Integrations: auth, storage, external services}
- {Edge cases}
- {Test level}

**Technical Brief:** {as inline card}

## {Design}

{Only if the story touches UI/frontend: the design screen or prototype
as a full `blockCard` (URL from the prompt or asked from the user,
tool-agnostic). Otherwise leave this section out.}

### {Acceptance criteria}

Given/When/Then bold and in color `#403294`, each on its own line:

- [ ] **Given** {initial situation}
  **When** {action}
  **Then** {expected, verifiable result}
- [ ] **Given** {…}
  **When** {…}
  **Then** {…}
