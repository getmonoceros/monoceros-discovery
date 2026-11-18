# Monoceros Discovery

Structured product discovery, from a raw idea to work your team can act on. A
guided dialog turns an idea into a brief, personas and journeys, a domain model,
a design brief, a technical frame, and a cut backlog, written into Confluence and
Jira instead of into local markdown that goes stale.

It is a companion to [Monoceros Workbench](https://getmonoceros.build): the
`discovery-tech-frame` step hands you a ready `monoceros init` command, so
discovery flows straight into an isolated, reproducible dev container. The story
of the whole chain, discovery through the three build roles, is on
[getmonoceros.build/from-idea-to-code](https://getmonoceros.build/from-idea-to-code/).

> **`discovery-atlassian` is deprecated and leaves this marketplace on
> 2026-12-16.** The discovery now ships with Monoceros Workbench as the
> `discovery-atlassian` feature and runs in Claude Code, OpenCode and Copilot
> (CLI 1.78.0 or newer). Set it up as described in
> [Discovery](https://getmonoceros.build/docs/discovery/overview/). The
> `quickstart` plugin stays here.

This repository is a **plugin marketplace**. One plugin per backend, and you
install the one for the tools you use.

## Plugins

| Plugin | What it does | Backend | Status |
| --- | --- | --- | --- |
| `discovery-atlassian` | The full discovery chain | Confluence + Jira | deprecated, removed on 2026-12-16 |
| `quickstart` | Idea to a running workbench, in one dialog | none | active |
| `discovery-notion` | The discovery chain | Notion | planned |

### discovery-atlassian

Seven skills, run in sequence or on their own:

1. **discovery-brief** - idea to a one-page brief (Confluence)
2. **discovery-personas-journeys** - personas and customer journeys (Confluence)
3. **discovery-domain-model** - entities, relationships, attributes and states (Confluence)
4. **discovery-design** - a design brief: north star, principles, key screens (Confluence)
5. **discovery-tech-frame** - technology decisions plus a ready `monoceros init` definition
6. **planning-epics-stories** - a cut backlog (Jira issues)
7. **handoff-project-files** - the new project's README and agent instructions (`CLAUDE.md` / `AGENTS.md`), written into the project directory and derived from all of it

Each writes to the shared tools; if no Atlassian connection is present, it falls
back to local files.

### quickstart

One skill for the short way in: describe what you want to build and it maps the
idea onto the live Monoceros catalog, then hands you the exact `init`, `apply`
and `run` commands plus a build prompt for the agent. No connector needed.

## Prerequisites

- For `discovery-atlassian`: **an Atlassian connector** (Confluence + Jira),
  authenticated with write access. This is where the discovery artifacts and the
  backlog land, and you bring it, since it needs your own instance and auth.
- For `quickstart`: nothing.

The **Monoceros docs connector** (`mcp.getmonoceros.build`) is **bundled** with
the plugins and configured automatically on install. `discovery-tech-frame` and
`quickstart` use it for the live component catalog. It needs no auth, and if you
already have that connector yours is used (matched by URL), so you get no
duplicate.

## Install

Add this marketplace, then install the plugin you want.

On claude.ai and in the Claude desktop app, add it under **Customize**. In Claude
Code, use the `/plugin` commands:

```
/plugin marketplace add https://github.com/getmonoceros/monoceros-discovery.git
```

```
/plugin install discovery-atlassian
```

### In a Monoceros workbench

Use the `discovery-atlassian` feature of the workbench instead of this plugin.
A `plugins:` entry for it on the `claude` feature stops working once the plugin
leaves the marketplace. [Discovery](https://getmonoceros.build/docs/discovery/overview/)
shows the setup.

## Development

Some files are needed by several skills: `discovery-rules.md`,
`confluence-style.md` and the diagram script. A skill has to be self-contained,
so each one carries its own copy. The source lives once under `shared/`, and
`shared/targets.txt` says which skills get which file. **Edit the file under
`shared/`, never a copy.**

Activate the hook once per clone; it copies a staged change into the skills and
stages the copies with it:

```
git config core.hooksPath .githooks
```

Without the hook, copy by hand with `scripts/sync-shared.sh`, and check with
`scripts/sync-shared.sh --check`. A copy edited directly is never overwritten:
the script stops and names it.

## License

Apache-2.0. See [LICENSE](LICENSE).
