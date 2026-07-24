---
name: discovery-design
description: Leitet aus Brief, Personas und Journeys im geführten Dialog den Design Brief für ein Produkt ab - Nordstern, Markenpersönlichkeit, Gestaltungsprinzipien, visuelle Richtung, Schlüssel-Screens, Interaktion und Barrierefreiheit - und legt ihn als Confluence-Seite unter dem Brief an. Nutze diesen Skill, wenn jemand die Gestaltungsrichtung, das Design-Briefing oder die Grundlage für ein Design-System und einen Prototyp erarbeiten will. Der Design Brief ist der Input für die anschließende Generierung von Design-System und Hifi-Prototyp.
allowed-tools: Read, Write, AskUserQuestion
---

# Design Brief

Du leitest aus Brief, Personas und Journeys die **Gestaltungsrichtung**
eines Produkts ab - als Design Brief, der anschließend Claude Design
(oder Figma Make) als Grundlage dient, um ein Design-System und einen
Hifi-Prototyp zu erzeugen.

**Zwei Grundregeln:**

- Du **ergänzt** die gestalterische Ebene, du **duplizierst nicht** den
  Produkt-Brief (Problem, Zielgruppe stehen dort).
- Du beschreibst die **Richtung**, nicht die fertigen Tokens. Farben,
  Schriftgrößen, Abstände entstehen erst in der Generierung. Das
  Design-System ist ein **Output** der Generierung, kein Input - schreib
  hier also kein System, sondern das, woraus es entstehen soll.

## Prinzipien

- **Schlank halten**, vorschlagen statt ausfragen, ein Thema nach dem
  anderen.
- **Beschriebene Listenelemente, keine Stichwortwüste** - jeder Punkt
  ein Halbsatz mit dem *Warum*.
- **Schlüssel-Screens fallen aus den Journeys** - für jede wichtige
  Journey ein Screen.
- **Gefühl vor Werten** - visuelle Richtung als Stimmung, nicht als
  Farbcode.

## Vorgehen

### Schritt 0: Vorlagen-Dokumente lesen

Lies Brief, Personas und Journeys (aus Confluence, Dateien oder per
Einfügen), wenn vorhanden auch den Technical Brief (er liefert
Plattform-Constraints wie PWA/mobile-first). Fasse das angestrebte Gefühl
und die Schlüssel-Journeys zusammen und bestätige mit dem Nutzer.

**Bestehender Design Brief**: Falls schon einer existiert, frage, ob du
ihn aktualisieren oder einen neuen anlegen sollst.

### Schritt 1: Abschnitt für Abschnitt erarbeiten

Mach je Abschnitt einen konkreten Vorschlag, der Nutzer korrigiert.

1. **Design-Ziel (Nordstern)** - ein Satz: welches Gefühl/Ergebnis das
   Design erreichen muss.
2. **Markenpersönlichkeit & Tonalität** - wie sich die App anfühlt und
   klingt.
3. **Gestaltungsprinzipien** - drei bis fünf, direkt aus den
   Persona-Bedürfnissen abgeleitet.
4. **Visuelle Richtung** - Palette, Bildsprache, Typo, Form als Stimmung
   (keine finalen Tokens).
5. **Schlüssel-Screens** - aus den Journeys, je mit ihrer Aufgabe.
6. **Interaktion & Plattform** - aus dem Technical Brief (PWA,
   mobile-first, offline, Ein-Tipp-Aktionen).
7. **Barrierefreiheit** - Kontrast, Touch-Ziele, nicht nur über Farbe.
8. **Marke & Assets** - bestehende Marke/Assets oder Greenfield.

Für echte Auswahlentscheidungen nutze **AskUserQuestion**.

### Schritt 2: Bestätigen und Abdeckung prüfen

Prüfe: Hat jede wichtige Journey einen Schlüssel-Screen? Fasse
den Design Brief zusammen und hole Bestätigung.

## Abschluss: Dokument erstellen

1. Lies die Vorlage aus `references/templates.md`.
2. Fülle sie. Der letzte Abschnitt **„Was die Generierung liefern soll"**
   hält fest: Design-System als **Tokens + Komponenten** und ein
   **Hifi-Prototyp** der Schlüssel-Screens, **als Code** (nicht Figma-
   only), damit die Monoceros-Workbench es direkt weiterverarbeitet.
3. Lege das Dokument als **HTML+-Seite** (`contentFormat: html`) **unter
   dem Brief** an (frage nach der Brief-Seite als Eltern) oder als
   Markdown-Fallback. Format siehe unten.
4. **Erzeuge das fertige Generierungs-Prompt.** Lies
   `references/generation-prompt.md`, ersetze `{{PRODUKTNAME}}` durch den
   Produktnamen und `{{DESIGN_BRIEF}}` durch den **vollständigen
   Inhalt** des Design Brief **als lesbaren Text** (nicht die
   Confluence-HTML+-Auszeichnung - Claude Design liest Fließtext, keine
   Makros). Gib das Ergebnis als **einen Codeblock** aus, damit der Nutzer
   es mit einem Klick kopieren kann.
5. Erkläre in einem Satz: Der Design Brief liegt in Confluence; dieses
   Prompt fügt der Nutzer in Claude Design (oder Figma Make) ein, um
   daraus Design-System und Hifi-Prototyp zu erzeugen - das System
   *entsteht* dort, es ist kein Input.

### Format (HTML+) - Rhythmus statt Raster

Gemeinsame Stil-Regel: `references/confluence-style.md`. Der Design Brief
hat ein festes Abschnitts-Skelett, aber **kein einheitliches Layout** -
würde jeder Abschnitt gleich aussehen (überall 2-Spalten, überall Emoji),
wird die Seite unlesbar. Deshalb: **jeder Abschnitt eine andere Behandlung,
kein zweimal dasselbe direkt hintereinander**, Behandlung passend zum
Inhalt. Die freigegebene Aufteilung (Details + HTML-Muster in
`references/templates.md`):

- **Design-Ziel (Nordstern)** → **benannter Excerpt `Summary`**, reiner
  Text, **kein Panel** (kann transkludiert werden).
- **Markenpersönlichkeit & Tonalität** → volle Breite, `<h3>` + `<p>`, je
  Zug ein **Stimmungs-Emoji**.
- **Gestaltungsprinzipien** → 2-Spalten (760), je `<h3>` mit **Themen-Emoji**.
- **Visuelle Richtung** → volle Breite; die **Palette mit Farb-Chips** als
  Mini-Vorschau (Chip-Farben grob zur Palette), am Ende ein
  Kursiv-Disclaimer („Richtung, keine finalen Tokens").
- **Schlüssel-Screens** → volle Breite, `<h3>` + `<p>`, **durchnummeriert**
  (1️⃣ 2️⃣ 3️⃣ …).
- **Interaktion & Plattform** → 2-Spalten (760), je `<h3>` mit **Themen-Emoji**.
- **Barrierefreiheit** → volle Breite, je Anforderung ein blauer
  **`Pflicht`-Chip** vor dem Titel.
- **Marke & Assets** → 2-Spalten (760), schlicht (kein Emoji).
- **Was die Generierung liefern soll** → **Success-Panel**
  (`<div data-type="panel-success">`), `<strong>`-geführte Absätze - der
  Handoff in den Bau.
- Emojis app-passend (nicht fix). 2-Spalten einheitlich `760`; bei
  ungerader Zahl letzte Spalte leer.

## Stil

- Vorschlagen statt ausfragen, ein Satz „warum" je Entscheidung.
- Antworte in der Sprache des Nutzers.
