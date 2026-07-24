# Monoceros Discovery

Structured product discovery, from a raw idea to work your team can act on. A
guided dialog turns an idea into a brief, personas and journeys, a design brief,
a technical frame, and a cut backlog - written into the tools your team already
uses, not into local markdown that goes stale.

It is a companion to [Monoceros Workbench](https://getmonoceros.build): the
`tech-frame` step hands you a ready `monoceros init` command, so discovery flows
straight into an isolated, reproducible dev container.

This repository is a **plugin marketplace**. One plugin per backend - you install
the one for the tools you use.

## Plugins

| Plugin | Backend | Status |
| --- | --- | --- |
| `discovery-atlassian` | Confluence + Jira | active |
| `discovery-notion` | Notion | planned |

### discovery-atlassian

Five skills, run in sequence or on their own:

1. **discovery-brief** - idea to a one-page brief (Confluence)
2. **discovery-personas-journeys** - personas and customer journeys (Confluence)
3. **discovery-design** - a design brief: north star, principles, key screens (Confluence)
4. **discovery-tech-frame** - technology decisions plus a ready `monoceros init` definition
5. **planning-epics-stories** - a cut backlog (Jira issues)

Each writes to the shared tools; if no Atlassian connection is present, it falls
back to local files.

## Prerequisites

- **An Atlassian connector** (Confluence + Jira), authenticated with write access -
  this is where the discovery artifacts and backlog land. You bring this (it needs
  your own instance and auth).

The **Monoceros docs connector** (`mcp.getmonoceros.build`) is **bundled** with the
plugin and configured automatically on install - `discovery-tech-frame` uses it for
the live component catalog. It needs no auth, and if you already have that connector
yours is used (matched by URL); no duplicate.

## Install

Add this marketplace, then install the plugin for your backend. On claude.ai and
Claude Desktop, add it under Customize; in Claude Code, via the plugin marketplace.
(Exact commands per surface: see the Monoceros docs.)

## Status

Pre-release. The skills carry no sample-specific content, and `discovery-tech-frame`
queries the Monoceros connector for the live catalog (no baked component list).
Before publish: validate the marketplace manifests against the CLI, decide the
license, and confirm the distribution setup.
