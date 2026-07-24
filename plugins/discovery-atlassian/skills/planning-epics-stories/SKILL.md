---
name: planning-epics-stories
description: Leitet aus der Discovery (Brief, Journeys, Personas, Technical Brief, Design) im geführten Dialog den Backlog ab - Epics und Stories - und legt sie als Jira-Issues an. Nutze diesen Skill, wenn jemand aus Anforderungen einen Backlog, Epics oder Stories erstellen, ein Projekt planen oder Arbeit für die Umsetzung schneiden will. Ziel: jede Story ist agent-tauglich und autark.
allowed-tools: Read, Write, AskUserQuestion
---

# Planning: Epics & Stories

Du leitest aus der Discovery den Backlog ab und legst ihn in **Jira** an.

**Leitziel:** Jede **Story ist autark**. Wer nur die Story bekommt (ein
Agent wie Claude Code oder ein Mensch), weiß daraus: für wen und warum,
was zu tun ist, und wo er für Details nachschaut - ohne erst das Epic oder
andere Vorgänge öffnen zu müssen. Das **Epic ist schlank**: nur der
Vermittler zwischen seinen Stories und der Journey.

## Prinzipien

- **Story autark, Epic schlank.** Der Kontext lebt auf der Story, nicht
  im Epic.
- **So viele Stories wie nötig** je Epic - keine feste Zahl.
- **Links sind Smartlink-Karten**, keine rohen URLs (siehe Schritt 4).
- **Beschreibungen strukturiert**, nicht als Prosa-Wust.

## Vorgehen

### Schritt 0: Discovery lesen und Projekt klären

Lies Brief, Journeys, Personas, Technical Brief und Design. Fasse
zusammen, welche Journeys/Personas es gibt, und bestätige. Frage nach dem
**Jira-Projekt** (Key). Steht keine Design-URL im Prompt und gibt es
UI-Stories, frag den Nutzer nach der URL des Design-Deliverables
(Prototyp/Screens) - werkzeugunabhängig (Figma Make, Claude Design o.a.).

**Bestehender Backlog / zweiter Durchlauf**: Prüfe je Journey, ob es schon
ein passendes Epic gibt - der auf der Seite verlinkte Epic-Key noch **live**
in Jira, oder ein Epic mit passender Summary im Projekt. Lebt eins →
wiederverwenden/aktualisieren, kein Duplikat. Existiert keins (z.B. im
Testloop gelöscht, Key tot) → neu anlegen. Der Journey-Link wird danach
**immer** auf den Key aus diesem Lauf gezogen (siehe Backfill), auch wenn
dort noch ein alter/toter Key steht.

### Schritt 1: Epics vorschlagen

- **Foundation-Epic zuerst** (`architectural`): das Walking Skeleton aus
  dem Technical Brief. Karte: **Technical Brief**. Seine Stories speisen
  sich aus dem Walking Skeleton **und den umsetzbaren Offenen Punkten** des
  Technical Brief (die To-dos, nicht die noch offenen Entscheidungen -
  z.B. twg-Config setzen, Keycloak-Realm mounten, Ports und Mock-Port
  festlegen).
- **Ein Business-Epic je Journey** (sofern kein passendes, lebendes Epic
  existiert - sonst das bestehende weiterverwenden): ein bis zwei Sätze Prosa (die Essenz),
  die **Journey als Karte**, und epic-weite Akzeptanzkriterien. Mehr
  nicht - das Epic ist der Vermittler zur Journey, kein Kontext-Sammler.
  **Keine** Persona-, Brief- oder Technical-Brief-Karte am
  Business-Epic.

### Schritt 2: Stories je Epic (autark)

Schlage je Epic so viele Stories vor, wie nötig. Jede Story hat diese
Abschnitte:

1. **Story-Text**: „Als [Persona] möchte ich [Funktion], um [Nutzen]."
2. **### Fachlicher Kontext**: ein paar Sätze zum Bedürfnis dahinter
   (**kein** Ein-Satz-Verweis), dann **Persona** und **Journey** je als
   Inline-Karte mit **fettem Label davor** (`Persona:`, `Journey:`).
3. **### Umsetzungsinformationen**: ein **Plan als Liste** - was zu tun
   ist und woran zu denken (z.B. Backend-Endpoint, Persistenz/Migration,
   Frontend-Komponente, Integrationen, Randfälle, Testebene). Eine
   übergeordnete Abarbeitungs-Liste, **kein** Prosa-Wust. Dazu der
   **Technical Brief** als Inline-Karte mit fettem Label
   (`Technical Brief:`).
4. **## Design** - **nur wenn die Story UI/Frontend berührt**: der
   betroffene Design-Screen bzw. Prototyp als volle **`blockCard`**. Die
   Design-URL kommt aus dem Prompt; steht keine da, **frag den Nutzer**
   nach der URL des Design-Deliverables - werkzeugunabhängig (Figma Make,
   Claude Design o.a.). Ist keine verfügbar, lass den Abschnitt weg.
5. **### Akzeptanzkriterien**: Checkbox-Liste. Je Kriterium **Given**,
   **When**, **Then** auf **eigenen Zeilen**; die Labels **fett und in der
   Farbe `#403294`**.

### Schritt 3: Reihenfolge

Foundation-Epic zuerst, dann die Feature-Epics nach Wert und Abhängigkeit.

### Schritt 4: In Jira anlegen

Nutze die verfügbaren Atlassian-Tools und schreibe **ADF**:

- **Links immer als ADF-Karten, nie als rohe URL/Markdown-Link.**
  Prominente Einzel-Referenzen (Journey am Epic, Design-Screen an der
  Story) als volle **`blockCard`**. Die Kontext-Referenzen an der Story
  (Persona, Journey, Technical Brief) als **`inlineCard` mit fettem
  Label davor** (`Persona:` usw.).
- **Story → Epic** über das **Parent-Feld** (kein generischer
  Issue-Link).
- **Epic-Label** `business` bzw. `architectural`.
- **Journey-Backfill**: Trage auf der Journey-Seite das Epic aus diesem Lauf
  ein und **überschreibe**, was dort steht: die Zeile „Epic in Jira" (egal ob
  Platzhalter **„folgt"** oder ein alter/toter Key) wird die echte
  Epic-Karte, und die „Zugehörige Vorgänge"-Datasource wird auf
  `parent = <Epic-Key dieses Laufs>` gesetzt. So zeigt die Journey ihr Epic
  und die Live-Tabelle ihrer Stories.
- **Backfill-Tabelle richtig schreiben** (sonst kaputte Kopfzeile): Schreib
  die Seiteneigenschaften-Tabelle als **ein einziges `<tbody>`** - linke
  Zelle `<th>` (Label = Header-Spalte), rechte Zelle **`<td>`** (die
  Epic-Karte). **Kein `<thead>`**: der HTML+-Read liefert die erste Zeile
  fälschlich in einem `<thead>`; schreibt man das 1:1 zurück, macht
  Confluence aus der Wert-`<td>` eine `<th>`, und die Zeile rendert als graue
  Kopf**zeile** statt als Header-**Spalte**. Also das `<thead>` beim
  Zurückschreiben in `<tbody>` auflösen und die Wert-Zelle als `<td>` halten.
- **Akzeptanzkriterien** als **Task-Liste** (echte Checkboxen); je Punkt
  Given/When/Then auf eigenen Zeilen, Labels **fett und in Farbe
  `#403294`**.
- Überschriften als echte Headings. Die Überschrift heißt genau
  „Akzeptanzkriterien" - **kein** Zusatz wie „(Definition of Done)".
- Nenne dem Nutzer die Issue-Keys und die Reihenfolge.

Kann ein Tool eine Karte oder Verknüpfung nicht setzen, sag es dem Nutzer
und gib ihm das Nötige an die Hand, statt es still zu überspringen.

## Verlinkungs-Matrix (was gehört an welche Ebene)

| Ebene            | Karten                                              |
|------------------|-----------------------------------------------------|
| Business-Epic    | Journey                                             |
| Foundation-Epic  | Technical Brief                                     |
| Feature-Story    | Persona + Journey (Fachlicher Kontext), Technical Brief (Umsetzung), Design-Screen (nur bei UI) |
| Foundation-Story | Technical Brief                                     |

Die Story trägt ihre Kontext-Karten **bewusst selbst**, damit sie autark
ist. Dass Persona/Journey über Geschwister-Stories wiederkehren, ist
gewollt - Autarkie geht vor Dopplungs-Vermeidung.

## Verifikation & `/goal`

Die Akzeptanzkriterien sind die Prüf-Grundlage. Bei der Umsetzung läuft
der Agent unter `/goal` mit „die Akzeptanzkriterien von PL-X sind
erfüllt, Tests und Build grün" - aus den AK abgeleitet, kein eigenes
Feld. Ob es *aussieht* wie der Design-Screen, prüft ein separater
Preview-/Mensch-Schritt.

## Stil

- Vorschlagen statt ausfragen, ein Thema nach dem anderen.
- Antworte in der Sprache des Nutzers.
