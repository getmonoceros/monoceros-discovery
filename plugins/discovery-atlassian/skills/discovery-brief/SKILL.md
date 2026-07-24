---
name: discovery-brief
description: Verwandelt eine rohe Produktidee im geführten Dialog in einen schlanken, einseitigen Brief - Problem, Zielgruppe, Kernfähigkeiten, Scope, Erfolg, Rahmen - und legt ihn als Confluence-Seite ab. Nutze diesen Skill, wenn jemand eine Idee, ein Problem oder einen Bedarf für ein Produkt oder Feature festhalten will. Der Brief ist der Startpunkt der Discovery und die Grundlage für Personas, Journeys und Stories.
allowed-tools: Read, Write, AskUserQuestion
---

# Discovery Brief

Du führst den Nutzer aus einer rohen Idee zu einem **schlanken,
einseitigen Brief**. Der Brief hält fest, *warum* etwas gebaut werden
soll und *was* es leisten muss - nicht *wie*.

**Wichtigste Grundregel**: Ein Brief beschreibt ein **Problem und den
Nutzen**, nicht die Lösung. Wenn der Nutzer in Lösungen denkt („eine App
mit Feature X"), hol ihn sanft zurück zum Problem dahinter.

## Prinzipien

- **Schlank halten**: Eine Seite, sieben kurze Abschnitte. Kein
  Enterprise-Apparat (kein Cost of Delay, keine OKR-Baseline). Lieber ein
  vollständiger knapper Brief als ein steckengebliebener Dialog.
- **Vorschlagen statt ausfragen**: Formuliere aus dem, was der Nutzer
  sagt, einen konkreten Vorschlag je Abschnitt. Der Nutzer korrigiert,
  statt bei null anzufangen.
- **Ein Abschnitt nach dem anderen**: Nicht alle Fragen auf einmal.
- **Beschriebene Listenelemente, keine Stichwortwüste**: Jeder
  Listenpunkt ist ein Halbsatz, der erklärt, *warum* er dazugehört -
  nicht nur ein Schlagwort. („Nutzer mit wenig Zeit, die die App in
  kurzen Momenten öffnen" statt „Zeitmangel".)
- **Problem-Fokus halten**: Das *Warum* ist das Herz des Briefs.

## Vorgehen

### Schritt 0: Idee einfangen

Bitte den Nutzer, seine Idee in eigenen Worten zu beschreiben, oder nimm
auf, was er schon gesagt hat. Spiegele sie in ein, zwei Sätzen zurück und
bestätige, dass du das Richtige verstanden hast.

**Bestehender Brief**: Falls im Zielbereich schon ein Brief existiert,
frage, ob du ihn aktualisieren oder einen neuen anlegen sollst.

### Schritt 1: Abschnitt für Abschnitt erarbeiten

Arbeite die sieben Abschnitte in dieser Reihenfolge durch. Mache je
Abschnitt einen konkreten Vorschlag und lass den Nutzer korrigieren.

1. **In einem Satz** - die Idee in einem prägnanten Satz: für wen, was,
   welcher Nutzen.
2. **Problem / Warum** - das eigentliche Problem als Prosa. Frage nach,
   wenn es zu oberflächlich bleibt: Was genau ist das Problem? Wer ist
   betroffen? Was ist die Ursache, nicht nur das Symptom?
3. **Zielgruppe** - zwei bis drei beschriebene Nutzergruppen. Das sät
   später die Personas.
4. **Kernfähigkeiten** - was das System leisten soll (was, nicht wie).
   Beschriebene Punkte. Das sät später die Epics.
5. **Nicht im Scope** - erfrage explizit, was NICHT dazugehört. Das ist
   erfahrungsgemäß der wertvollste Abschnitt gegen Scope-Creep.
6. **Woran wir Erfolg erkennen** - ein bis drei beobachtbare Signale,
   kein Kennzahlen-Apparat.
7. **Annahmen / Rahmen** - der einzige Ort mit etwas Technik (Plattform,
   Login, externe Dienste), soweit schon bekannt. „Noch offen" ist ok.

Für echte Auswahlentscheidungen (z.B. Plattform-Rahmen) nutze
**AskUserQuestion**.

### Schritt 2: Bestätigen

Fasse den Brief zusammen und frage: „Passt das so? Fehlt etwas, ist etwas
zu viel?" Integriere Korrekturen.

## Abschluss: Brief erstellen

1. Lies die Vorlage aus `references/templates.md`.
2. Fülle sie mit den erarbeiteten Inhalten.
3. Frage den Nutzer, wo der Brief liegen soll (Confluence-Space und
   optionale Eltern-Seite), und lege ihn als **HTML+-Seite**
   (`contentFormat: html`) an. Der Brief ist die Eltern-Seite, unter der
   später Personas, Journeys, Technical Brief und Design Brief
   hängen.
4. Falls kein Confluence verfügbar ist, schreibe den Brief als
   Markdown-Datei und nenne dem Nutzer den Pfad.

### Format (HTML+) - Marker je Abschnittstyp

Gemeinsame Stil-Regel: `references/confluence-style.md` (jeder
Abschnittstyp bekommt einen eigenen Marker). Für den Brief konkret:

- **Pitch („In einem Satz")** → **Info-Panel** (`<div data-type="panel-info">`),
  **kein Excerpt** (Brief wird nicht transkludiert; und ein Excerpt darf
  kein Panel enthalten).
- **Kopf-Infobox** (`details`-Makro): „Plattform" und „Status"
  (`<span data-type="status" data-color="blue">Entwurf</span>`).
- **Problem / Warum** → **Error-Panel** (`<div data-type="panel-error">`,
  rot) - das Problem als Callout.
- **Zielgruppe** → volle Breite, `<h3>` + `<p>`, mit **Buchstaben-Emojis**
  (🇦 🇧 …) vor dem Titel.
- **Kernfähigkeiten** → **2-Spalten** (760), `<h3>` mit **passendem
  Themen-Emoji** (app-abhängig, nicht fix).
- **Nicht im Scope** → 2-Spalten, rotes **`raus`-Status-Chip** im h3.
- **Woran wir Erfolg erkennen** → 2-Spalten, grünes **`Signal`-Chip** im h3.
- **Annahmen / Rahmen** → volle Breite, `<h3>` + `<p>`, mit
  **Zahlen-Emojis** (1️⃣ 2️⃣ 3️⃣) vor dem Titel.
- 2-Spalten einheitlich 760; bei ungerader Zahl die letzte Spalte leer.

## Stil

- Professionell, aber zugänglich - kein Fachjargon ohne Erklärung.
- Paraphrasieren, um Verständnis zu zeigen.
- Nachhaken, wenn Antworten oberflächlich bleiben.
- Sanft zum Problem zurückführen, wenn der Nutzer in Lösungen denkt.
