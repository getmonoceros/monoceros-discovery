# Confluence-Stil: Marker je Abschnittstyp

Gemeinsame Regeln, wie die Discovery-Artefakte (Brief, Persona, Journey,
Design Brief) in Confluence rendern. Ziel: **jeder Abschnittstyp bekommt
einen eigenen Marker**, damit sich Sektionen unterscheiden - statt
monoton gleicher Blöcke. Alles in HTML+ (`contentFormat: html`).

## Marker je Abschnittstyp

| Abschnittstyp | Marker |
|---|---|
| Pitch / Kernaussage | **Info-Panel** (`panel-info`) |
| Problem / Schmerz | **Error-Panel** (`panel-error`, rot) |
| Handoff / Deliverable | **Success-Panel** (`panel-success`, grün) |
| Aufzählbare Segmente (Zielgruppen, Personas) | volle Breite, h3 + Absatz, **Buchstaben-Emojis** 🇦 🇧 🇨 |
| Nummerierte / sequenzielle Punkte (Annahmen, Schritte) | volle Breite, h3 + Absatz, **Zahlen-Emojis** 1️⃣ 2️⃣ 3️⃣ |
| Themen-/Fähigkeiten-Liste (Kernfähigkeiten, Prinzipien) | **2-Spalten**, h3 mit **passendem Themen-Emoji** |
| Ausschlüsse (Scope-out) | 2-Spalten, rotes **Status-Chip** („raus") |
| Positive Signale (Erfolg) | 2-Spalten, grünes **Status-Chip** („Signal") |
| Reine Prosa (erzählte Journey) | kein Marker |

## Regeln

- **Panels sparsam** - nur die emotional/aktional aufgeladenen Sektionen
  (Pitch, Problem, Handoff). Nicht jede Sektion ein Panel.
- **2-Spalten einheitlich `data-breakout-width="760"`**; ungerade Zahl →
  letzte Spalte leer (`<p></p>`).
- **Themen-Emojis app-passend** wählen (nicht fix). Buchstaben-/Zahlen-
  Emojis sind Reihenfolge-Marker für aufzählbare bzw. nummerierte Listen.
- **Excerpt nie in einem Panel** - der Excerpt wird transkludiert, das
  Panel würde mitreisen. Pitch-als-Panel nur bei Seiten, die **nicht**
  transkludiert werden (Brief). Persona/Journey/Design: Kernaussage als
  **benannter Excerpt, reiner Text**.
- **Seiteneigenschaften-Tabelle** (Kopf-Infobox / Verknüpfungen):
  Key-Value, linke Spalte `<th>`.
