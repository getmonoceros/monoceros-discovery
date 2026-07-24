# Vorlagen: Personas & Journeys

Beide als HTML+ (`contentFormat: html`) mit Makros/Layout. Entferne die
Klammer-Hinweise in der finalen Fassung.

---

## Persona-Seite (HTML+, `contentFormat: html`)

Seitentitel: `{Name}, {Alter} - {Kurzcharakterisierung}`

```html
<div data-type="bodied-extension" data-extension-key="excerpt" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"name":{"value":"summary"}}}'><p>{Kurze Prosa: Kontext, Situation, warum das Problem genau sie trifft.}</p></div>
<div data-type="bodied-extension" data-extension-key="details" data-extension-type="com.atlassian.confluence.macro.core"><table data-width="760"><tbody><tr><th><p><strong>Beteiligt an diesen Journey(s)</strong></p></th><td><p><a href="{journey-url}" data-card-appearance="inline">{journey-url}</a></p></td></tr><tr><th><p><strong>Produktbrief</strong></p></th><td><p><a href="{brief-url}" data-card-appearance="inline">{brief-url}</a></p></td></tr></tbody></table></div>
<h2>Erwartungen</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3>{Emoji} {Erwartung 1 - Titel}</h3><p>{ein, zwei Sätze}</p></div><div data-type="column" data-width="50"><h3>{Emoji} {Erwartung 2 - Titel}</h3><p>{…}</p></div></section>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3>{Emoji} {Erwartung 3 - Titel}</h3><p>{…}</p></div><div data-type="column" data-width="50"><h3>{Emoji} {Erwartung 4 - Titel}</h3><p>{…}</p></div></section>
```

- Der Excerpt ist **reiner Text, benannt `summary`** (kein Panel - er wird
  von der Journey transkludiert; ein Panel würde mitreisen).
- **Emoji** je Erwartung zum Thema der App wählen, nicht fix.
- Die h3 je Erwartung erzeugt einen **Anker** für Deep-Links aus Journeys.
- Bei ungerader Zahl die letzte Spalte leer lassen (`<p></p>`).

---

## Journey-Seite (HTML+, `contentFormat: html`)

Seitentitel: `Journey {n}: {prägnanter Titel}`

```html
<div data-type="bodied-extension" data-extension-key="excerpt" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"name":{"value":"summary"}}}'><p>{Kurzzusammenfassung der Journey, ein Satz.}</p></div>
<div data-type="bodied-extension" data-extension-key="details" data-extension-type="com.atlassian.confluence.macro.core"><table data-width="760"><tbody><tr><th><p><strong>Epic in Jira</strong></p></th><td><p>folgt</p></td></tr><tr><th><p><strong>Adressierte Kernfähigkeiten</strong></p></th><td><ul><li><p>{Fähigkeit A}</p></li><li><p>{Fähigkeit B}</p></li></ul></td></tr></tbody></table></div>
<h2>Persona(s)</h2>
<div data-type="extension" data-extension-key="excerpt-include" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"":{"value":"{Persona-Seitentitel}"}}}'></div>
<h2>Auslöser</h2>
<p>{der konkrete Moment, der die Journey startet}</p>
<h2>Journey</h2>
<p>{Erzählte Story im Präsens: wie die Persona Schritt für Schritt ihr Problem löst.}</p>
<h2>Pain Points heute</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3><span data-type="status" data-color="red">Problem</span> {Titel}</h3><p>{Begründung}</p></div><div data-type="column" data-width="50"><h3><span data-type="status" data-color="red">Problem</span> {Titel}</h3><p>{…}</p></div></section>
<h2>Was die App ändert</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3><span data-type="status" data-color="green">Lösung</span> {Titel}</h3><p>{…}</p></div><div data-type="column" data-width="50"><h3><span data-type="status" data-color="green">Lösung</span> {Titel}</h3><p>{…}</p></div></section>
<h2>Zugehörige Vorgänge</h2>
<div data-type="block-card" data-url="{JQL-URL mit parent = EPIC-KEY}" data-datasource='{"id":"{datasource-id}","parameters":{"cloudId":"{cloudId}","jql":"parent = EPIC-KEY ORDER BY Rank"},"views":[{"type":"table","properties":{"columns":[{"key":"issuetype"},{"key":"key"},{"key":"summary"},{"key":"assignee"},{"key":"status"}]}}]}'><a href="{JQL-URL mit parent = EPIC-KEY}">Zugehörige Vorgänge</a></div>
```

- Excerpt = reiner Text, benannt `summary` (kein Panel).
- **Pain Points** je h3 mit rotem `Problem`-Chip, **Was die App ändert** je
  h3 mit grünem `Lösung`-Chip.
- Bis zum Backfill: „Epic in Jira" = **„folgt"**, Datasource-JQL =
  **`parent = EPIC-KEY`** (leer, kein Fehler). Die Planung setzt beide auf
  das echte Epic.
- Die Datasource braucht **`id`** (Jira-Datasource-Provider) **und**
  `cloudId` - fehlt die `id`, rendert nur eine „N Issues"-Kachel statt der
  Tabelle. Am einfachsten die komplette Datasource-JSON aus einer
  bestehenden Jira-Issues-Card übernehmen.
