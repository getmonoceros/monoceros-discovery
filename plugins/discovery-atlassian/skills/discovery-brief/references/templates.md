# Vorlage: Brief (HTML+)

In Confluence als **HTML+** (`contentFormat: html`). Marker je
Abschnittstyp - siehe `references/confluence-style.md`. Entferne die
Klammer-Hinweise.

Seitentitel: `{Produktname} | Brief` (Konvention: Produkt zuerst, dann
Artefakt-Typ, getrennt mit `|`. Das Artefakt-Wort ist englisch, damit die
Titel sprachneutral bleiben; der Seiteninhalt folgt der Sprache des
Nutzers.)

```html
<div data-type="panel-info"><p>{In einem Satz: für wen, was, welcher Nutzen.}</p></div>
<div data-type="bodied-extension" data-extension-key="details" data-extension-type="com.atlassian.confluence.macro.core"><table data-width="760"><tbody><tr><th><p><strong>Plattform</strong></p></th><td><p>{z.B. PWA}</p></td></tr><tr><th><p><strong>Status</strong></p></th><td><p><span data-type="status" data-color="blue">Entwurf</span></p></td></tr></tbody></table></div>
<h2>Problem / Warum</h2>
<div data-type="panel-error"><p>{Zwei bis vier Sätze Prosa: das eigentliche Problem und seine Ursache.}</p></div>
<h2>Zielgruppe</h2>
<h3>🇦 {Gruppe 1}</h3>
<p>{wer sie sind und warum sie das Problem haben}</p>
<h3>🇧 {Gruppe 2}</h3>
<p>{…}</p>
<h2>Kernfähigkeiten</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3>{Emoji} {Fähigkeit 1}</h3><p>{was, nicht wie}</p></div><div data-type="column" data-width="50"><h3>{Emoji} {Fähigkeit 2}</h3><p>{…}</p></div></section>
<h2>Nicht im Scope</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3><span data-type="status" data-color="red">raus</span> {Ausschluss 1}</h3><p>{warum bewusst draußen}</p></div><div data-type="column" data-width="50"><h3><span data-type="status" data-color="red">raus</span> {Ausschluss 2}</h3><p>{…}</p></div></section>
<h2>Woran wir Erfolg erkennen</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3><span data-type="status" data-color="green">Signal</span> {Signal 1}</h3><p>{beobachtbares Ereignis}</p></div><div data-type="column" data-width="50"><p></p></div></section>
<h2>Annahmen / Rahmen</h2>
<h3>1️⃣ {Rahmen 1}</h3>
<p>{…}</p>
<h3>2️⃣ {Rahmen 2}</h3>
<p>{…}</p>
```

Regeln:

- **Pitch** = Info-Panel, **Problem** = Error-Panel (rot). Panels nur hier
  (emotional aufgeladen), nicht überall.
- **Zielgruppe** mit Buchstaben-Emojis (🇦 🇧 …), **Annahmen** mit
  Zahlen-Emojis (1️⃣ 2️⃣ …) - je volle Breite, h3 + Absatz.
- **Kernfähigkeiten** mit Themen-Emojis (app-passend), 2-spaltig.
- **Scope** rote `raus`-Chips, **Erfolg** grüne `Signal`-Chips, 2-spaltig.
- Bei ungerader Zahl die letzte Spalte leer (`<p></p>`).
