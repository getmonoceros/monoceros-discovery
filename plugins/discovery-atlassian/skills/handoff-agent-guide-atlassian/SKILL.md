---
name: handoff-agent-guide-atlassian
description: Writes the agent instructions for a new project from the finished discovery - CLAUDE.md for Claude Code, AGENTS.md for opencode - with the stack, the conventions, the domain vocabulary and the development flow around the tracker. Splits public from internal content along the project's constellation. Use this skill when someone starts building a project whose discovery is done and the repository has no agent instructions yet, or when the technical brief changed and the instructions have to follow.
---

# Agent guide for the project

You write the file an agent reads before every task in this repository:
`CLAUDE.md` for Claude Code, `AGENTS.md` for opencode. Everything in it is
**derived** from the discovery, never invented - and everything that would
otherwise have to be repeated in every single story belongs in it.

## Where this sits

Planning is the last discovery step; this is the handoff into the build. It needs
all of it: the brief, the journeys, the domain model, the technical brief, the
design brief, and the backlog. Run it again whenever the technical brief or the
domain model changes, because a stale guide is worse than none: an agent trusts
it.

## Before you write anything

Read `references/discovery-rules.md`. Two of its rules decide the outcome here:

- **Invent nothing.** Every line traces back to an artifact or to the dialog. A
  convention you made up becomes a convention the whole project follows, and
  nobody will remember it was never agreed.
- **Read the human's comments first** when the file already exists, and leave
  what they wrote themselves alone.

## Step 0: Which agent, and what is already there

Take the agent from the technical brief's features: `claude` means `CLAUDE.md`,
`opencode` means `AGENTS.md`. Both features means both files, with the same
content.

If the file already exists, read it and say what you intend to change. Never
overwrite a section a person wrote.

## Step 1: The constellation, asked once

Two questions decide what goes where. Ask them with **AskUserQuestion**, in one
go, and never assume the answer:

**Is the code public?** and **is the discovery public? is the tracker public?**

That yields four cases, and only the split differs:

| Code | Discovery | Tracker | Where things go |
|---|---|---|---|
| public | public | public | one committed file, everything in it |
| public | internal | public | two files, see below |
| public | internal | internal | two files, see below |
| private | internal | internal | one committed file, everything in it |

The first and the last case are the simple ones: there is nothing to hide from
anyone who can read the repository, so one `CLAUDE.md` in the project root
carries the lot and is committed.

The middle two need the split, and the rule that decides every line is:

**What describes the code is public. What names your instance, your customer or
an internal artifact is not.** Space keys, page URLs, the Jira project key, the
board, the customer's name: those go into `.claude/CLAUDE.md`
(`.opencode/AGENTS.md` for opencode), which is gitignored and machine-local.

And the harder half of the same rule: **no public artifact may point at an
internal one.** Not the README, not the docs, not a comment in the code, not a
commit message. A link into a customer's Confluence space in a public repository
leaks the relationship even when the space itself stays closed. Add the private
file to `.gitignore` in the same step, and say in the public file that internal
coordinates exist without naming them.

## Step 2: The public file

Only what holds for **every** task, and only what is in the artifacts:

- **What the product is**, two sentences from the brief. An agent that knows the
  purpose makes better small decisions.
- **The stack**, from the technical brief: languages, services, what the app
  brings itself as a dependency.
- **The cross-cutting conventions**, verbatim from the technical brief:
  authentication, validation, the error shape, how identifiers are formed,
  migrations instead of an init script.
- **The domain vocabulary**: the entity names with one line each, and the naming
  language the domain model settled on. This is what stops every story from
  inventing its own words.
- **Where decisions go**: `docs/adr/`, numbered, and the rule that a recorded
  decision is not reopened.
- **How the work is run**: servers through `monoceros-ctl` and
  `.monoceros/launch.json`, never a bare shell start; the shape of an acceptance
  command.
- **The development flow** around the tracker (step 3).
- **Out of scope**, from the brief's exclusions. The fence saves more time than
  any instruction.

Keep it short. Every line an agent has to read before every task costs on every
task, so a sentence that only sometimes applies belongs in the story, not here.

## Step 3: The development flow

Propose this as the default and let the user change it. It is written for a Jira
tracker; where the tracker is GitHub, the same steps hold with issue state and a
project column instead of a board status.

1. Create a branch from the issue: the issue key plus a slug from its title.
2. Open a draft pull request, where the code host supports one.
3. Assign the issue to the current user.
4. Move it to **In Progress**.
5. Implement.
6. When the implementation stands, tell the user what to test and check.
7. Once they confirm, commit.
8. Comment on the issue with what changed, including the commit id.
9. Push, which updates the pull request.
10. Move the issue to **In Review**.
11. The user says whether it is good. Then merge, delete the pull request branch,
    switch to main locally and merge there.
12. Move the issue to **Done** and unassign it.

Two properties are worth naming in the file rather than leaving implicit,
because they are what makes the flow safe: the agent never merges and never
closes without the user's word (steps 6 and 11), and every state change on the
board is paired with something that actually happened in the repository. A board
whose states move on their own is a board nobody trusts.

Where the user wants it different, take their version. This is a proposal, not a
policy.

## Step 4: Write the files, and report

Write the public file to the project root, the private one to `.claude/` or
`.opencode/`, and add the private path to `.gitignore`. Then report in the
user's language: which files, which constellation, and one line per section on
where its content came from - so a wrong line can be traced back to the artifact
that produced it rather than argued about.

## Style

- Derived, never invented. When something is missing, name the gap instead of
  filling it.
- Short. This file is read before every task.
- No em dash (`references/discovery-rules.md`).
