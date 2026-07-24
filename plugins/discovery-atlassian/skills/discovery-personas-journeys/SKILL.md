---
name: discovery-personas-journeys
description: Leitet aus einem freigegebenen Brief im geführten Dialog die Personas und ihre Customer Journeys ab und legt sie als verlinkte Confluence-Seiten unter dem Brief an. Nutze diesen Skill, wenn jemand Personas, Nutzertypen, Customer Journeys oder den Nutzerweg durch ein Produkt erarbeiten will. Die Journeys sind die Grundlage für die späteren Epics und Stories.
allowed-tools: Read, Write, AskUserQuestion
---

# Personas & Journeys

Du leitest aus einem freigegebenen Brief die **Menschen ab, die das
Produkt nutzen, und ihre Wege durch es** - als kleinen, verlinkten
Confluence-Baum unter dem Brief. Die Personas wachsen aus der Zielgruppe
des Briefs; die Journeys müssen **zusammen alle Kernfähigkeiten des
Briefs abdecken**.

## Prinzipien

- **Schlank halten**: ein bis zwei Personas, ein bis zwei Journeys. Die
  Personas decken gemeinsam die Kernfähigkeiten ab - mehr ist selten
  nötig und macht das Bild unübersichtlich.
- **Vorschlagen statt ausfragen**: Formuliere Personas und Journeys als
  konkreten Vorschlag, der Nutzer korrigiert.
- **Beschriebene Listenelemente, keine Stichwortwüste**: jeder Punkt ist
  ein Halbsatz, der erklärt, *warum* er dazugehört.
- **Journey als Story, nicht als Tabelle**: eine zusammenhängende,
  erzählte Story mit Auslöser, Pain Points und dem, was die App ändert -
  keine Spaltenwüste, keine Emoji-Kurve.
- **Problem-Fokus**: die Journey zeigt, wie ein Problem gelöst wird,
  nicht eine Feature-Aufzählung.

## Vorgehen

### Schritt 0: Brief lesen

Lies den Brief (aus Confluence, einer Datei oder per Einfügen). Fasse
**Zielgruppe** und **Kernfähigkeiten** kurz zusammen und bestätige mit
dem Nutzer. Stimme den Scope ab: wie viele Personas und Journeys (Default
1-2 je). Kündige den Ablauf an: Personas → Journeys → Abdeckungs-Check.

**Bestehende Personas/Journeys**: Falls schon welche existieren, frage,
ob du sie aktualisieren oder neue anlegen sollst.

### Schritt 1: Personas entwickeln

Schlage aus der Zielgruppe des Briefs ein bis zwei Personas vor. Für
jede:

- **Name, Alter, Kurzcharakterisierung** (z.B. „die überforderte
  Sammlerin") - wird der Seitentitel.
- **Beschreibung** als kurze Prosa (ein Absatz): Kontext, Situation, warum
  das Problem sie trifft. Kommt später ins Excerpt-Makro.
- **Erwartungen**: drei bis vier, je mit **kurzem Titel** und einem, zwei
  Sätzen Begründung. Der Titel wird eine h3-Überschrift (Anker), sodass
  Journeys später auf eine einzelne Erwartung verlinken können.

Achte darauf, dass die Personas zusammen die Kernfähigkeiten motivieren.
Paraphrasiere jede Persona und hole Bestätigung.

### Schritt 2: Journeys erarbeiten

Eine Journey je Persona (oder für die wichtigsten). Für jede sammelst du:

- **Kurzzusammenfassung** (ein Satz) - kommt ins Excerpt.
- **Persona**: welche Persona sie durchläuft (wird per Excerpt-Include
  eingebunden).
- **Adressierte Kernfähigkeiten** aus dem Brief - als Liste in die
  Seiteneigenschaften; zugleich die Brücke zu den späteren Epics.
- **Auslöser**: der konkrete Moment, der die Journey startet.
- **Journey**: eine zusammenhängende, erzählte Story (Happy Path) als
  Prosa-Absatz.
- **Pain Points heute**: drei bis vier, je **kurzer Titel + Begründung**.
- **Was die App ändert**: drei bis vier, je **kurzer Titel + Begründung**.

Das **Epic entsteht erst in der Planung** - „Epic in Jira" und
„Zugehörige Vorgänge" bleiben auf der Journey-Seite zunächst Platzhalter
(„folgt") und werden dann ergänzt.

### Schritt 3: Abdeckung prüfen

Prüfe: Wird **jede Kernfähigkeit** des Briefs von mindestens einer
Journey berührt? Fehlt etwas, schlage eine ergänzende Journey oder Persona
vor. Hole finale Bestätigung.

## Abschluss: als Confluence-Baum anlegen

Gemeinsame Stil-Regel: `references/confluence-style.md` (Marker je
Abschnittstyp - Themen-Emojis auf Listen, Status-Chips für Pain/Lösung,
benannter Excerpt ohne Panel).

1. Lies die Vorlagen aus `references/templates.md`.
2. Lege die Struktur **unter dem Brief** an (frage nach der Brief-Seite
   als Eltern). „Personas" und „Journeys" sollen **Confluence-Folder**
   sein, keine Seiten (die Gruppenknoten tragen keinen Inhalt) - aber der
   Atlassian-Connector **kann keine Folder anlegen**. Bitte den Nutzer
   daher, die zwei Folder „Personas" und „Journeys" unter dem Brief
   anzulegen (oder dir die vorhandenen zu nennen), und lege dann **eine
   Seite pro Persona** bzw. **pro Journey** in den passenden Folder.
   Einzelne Persona-Seiten, damit sie per Suche direkt verlinkbar sind.
   Erzeuge nie leere Gruppen-Seiten als Ersatz für Folder.
3. Setze die Links: Journey → ihre Persona (glatter Seiten-Link, kein
   Anker), Persona → ihre Journey, beide verweisen auf den Brief.
4. Falls kein Confluence verfügbar ist, schreibe die Seiten als
   Markdown-Dateien und nenne die Pfade.

### Persona-Seite: Format (HTML+)

Lege Persona-Seiten über das **HTML+-Format** an (`contentFormat: html`) -
Makros und Layouts gehen so zuverlässig, ADF von Hand nicht. Aufbau:

1. **Excerpt-Makro, benannt `summary`**, um die Beschreibung (ein
   Absatz):
   `<div data-type="bodied-extension" data-extension-key="excerpt" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"name":{"value":"summary"}}}'><p>…</p></div>`.
   Der Name „summary" zeigt „Summary" statt „Auszug ohne Titel" an und ist
   der Auszug, den die Journey per Excerpt-Include zieht. Der Name greift
   **nur mit dem `macroParams`-Wrapper**.
2. **Seiteneigenschaften-Makro** (`data-extension-key="details"`) mit
   einer Key-Value-Tabelle: Zeile „Beteiligt an diesen Journey(s)" →
   Journey(s) als **Inline-Karte**, Zeile „Produktbrief" → Brief als
   Inline-Karte (`<a href="…" data-card-appearance="inline">…</a>`). So
   sind die Felder per Seiteneigenschaften-Report auswertbar.
   **Kein `<thead>`** - beide Zeilen in `<tbody>`, die linke Zelle je
   Zeile ein `<th>` (Zeilen-Header). Ein `<thead>` macht die erste Zeile
   instabil (wird mal als Kopfzeile über beide Spalten interpretiert).
3. **`<h2>Erwartungen</h2>`**.
4. Die Erwartungen als **2-Spalten-Layout**
   (`<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760">`
   mit zwei `<div data-type="column" data-width="50">`), je Erwartung eine
   **`<h3>` (Titel mit einem passenden Emoji davor)** + `<p>` (Text). Das
   Emoji je zum Thema der App und der Erwartung wählen, nicht fix. Die h3
   gibt jeder Erwartung einen **Anker** für spätere Deep-Links aus
   Journeys.

### Journey-Seite: Format (HTML+)

Auch als HTML+ (`contentFormat: html`). Aufbau:

1. **Excerpt-Makro** (benannt `summary`) mit der Kurzzusammenfassung.
2. **Seiteneigenschaften-Makro** (`details`), Tabelle als reines `tbody`:
   Zeile „Epic in Jira" → das Epic; solange es keins gibt, der Text
   **„folgt"** (kein Link - die Planung macht daraus den echten
   Jira-Link); Zeile
   „Adressierte Kernfähigkeiten" → **Bullet-Liste der im Brief
   adressierten Kernfähigkeiten**, die die Journey bedient (in der
   Discovery ausfüllen).
3. **`<h2>Persona(s)</h2>`** + **Excerpt-Include**, das die Persona per
   Seitentitel zieht (bindet deren benannten `summary`-Auszug ein):
   `<div data-type="extension" data-extension-key="excerpt-include" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"":{"value":"{Persona-Seitentitel}"}}}'></div>`
4. **`<h2>Auslöser</h2>`** + Absatz.
5. **`<h2>Journey</h2>`** + erzählter Absatz.
6. **`<h2>Pain Points heute</h2>`** + 2-Spalten-Layout (760), je Punkt
   `<h3>` mit einem **roten Status-Chip `Problem`** vor dem Titel
   (`<span data-type="status" data-color="red">Problem</span>`) + `<p>`.
7. **`<h2>Was die App ändert</h2>`** + 2-Spalten-Layout, je Punkt `<h3>`
   mit einem **grünen Status-Chip `Lösung`** vor dem Titel + `<p>`.
8. **`<h2>Zugehörige Vorgänge</h2>`** + eine **Jira-Datasource-Block-Card**
   auf `parent = EPIC-KEY` (Spalten Typ/Key/Summary/Assignee/Status). Die
   Datasource braucht neben `cloudId` und JQL das **`id`-Feld** (Jira-
   Datasource-Provider) - fehlt es, rendert statt der Tabelle nur eine
   „N Issues"-Kachel. Am einfachsten die komplette Datasource-JSON aus
   einer bestehenden Jira-Issues-Card übernehmen.

Zwei Platzhalter bis zum Backfill: die Zeile „Epic in Jira" zeigt
**„folgt"**, die Datasource-JQL nutzt **`parent = EPIC-KEY`** (rendert
leer als „0 Issues", kein Fehler). Die Planung setzt beide auf das echte
Epic.

`<thead>`-Hinweis von oben gilt auch hier.

## Stil

- Vorschlagen statt ausfragen, ein Thema nach dem anderen.
- Paraphrasieren, um Verständnis zu zeigen.
- Personas realistisch halten, Journeys konkret und erzählt.
- Antworte in der Sprache des Nutzers.
