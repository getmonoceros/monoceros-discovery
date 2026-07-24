# Vorlage: Design Brief (HTML+)

In Confluence als **HTML+** (`contentFormat: html`). Marker je
Abschnittstyp - siehe `references/confluence-style.md`. Beschreibe die
**Richtung**, nicht fertige Tokens. Entferne die Klammer-Hinweise.

Seitentitel: `{Produktname} | Design Brief` (Konvention: Produkt zuerst,
dann Artefakt-Typ, getrennt mit `|`. Das Artefakt-Wort ist englisch, damit
die Titel sprachneutral bleiben; der Seiteninhalt folgt der Sprache des
Nutzers.)

## Leitidee: Rhythmus statt Raster

Der Design Brief hat ein **festes Abschnitts-Skelett**, aber **kein
einheitliches Layout**. Genau das ist der Punkt: würde jeder Abschnitt
gleich aussehen (überall 2-Spalten, überall Emoji), wird die Seite
unlesbar. Deshalb bekommt **jeder Abschnitt eine andere Behandlung, und
kein zweimal dasselbe direkt hintereinander**. Die Behandlung passt zum
Inhalt. Konkret die freigegebene Aufteilung:

| Abschnitt | Behandlung |
|---|---|
| Design-Ziel (Nordstern) | benannter Auszug `Summary`, reiner Text |
| Markenpersönlichkeit & Tonalität | volle Breite, h3 + p, **Stimmungs-Emoji** je Zug |
| Gestaltungsprinzipien | 2-Spalten (760), **Themen-Emoji** je Prinzip |
| Visuelle Richtung | volle Breite, h3 + p; **Palette mit Farb-Chips** als Mini-Vorschau; Kursiv-Disclaimer am Ende |
| Schlüssel-Screens | volle Breite, h3 + p, **durchnummeriert** 1️⃣ 2️⃣ 3️⃣ … |
| Interaktion & Plattform | 2-Spalten (760), **Themen-Emoji** je Punkt |
| Barrierefreiheit | volle Breite, h3 + p, **blauer `Pflicht`-Chip** je Anforderung |
| Marke & Assets | 2-Spalten (760), schlicht (kein Emoji) |
| Was die Generierung liefern soll | **Success-Panel** |

Emojis app-passend wählen (nicht fix). 2-Spalten einheitlich `760`; bei
ungerader Zahl letzte Spalte leer (`<p></p>`).

## HTML-Muster je Typ

**Auszug (Nordstern):**

```html
<h2>Design-Ziel (Nordstern)</h2>
<div data-type="bodied-extension" data-extension-key="excerpt" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"name":{"value":"Summary"}}}'><p>{Ein Satz: welches Gefühl oder Ergebnis das Design erreichen muss.}</p></div>
```

**Volle Breite mit Emoji** (Markenpersönlichkeit, Schlüssel-Screens
durchnummeriert):

```html
<h2>Markenpersönlichkeit und Tonalität</h2>
<h3>{Emoji} {Eigenschaft 1}</h3>
<p>{wie sich die App anfühlt/klingt und warum}</p>
<h3>{Emoji} {Eigenschaft 2}</h3>
<p>{…}</p>
```

**2-Spalten mit Emoji** (Gestaltungsprinzipien, Interaktion) - je Paar ein
`<section>`:

```html
<h2>Gestaltungsprinzipien</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3>{Emoji} {Prinzip 1}</h3><p>{aus welchem Persona-Bedürfnis}</p></div><div data-type="column" data-width="50"><h3>{Emoji} {Prinzip 2}</h3><p>{…}</p></div></section>
```

**Visuelle Richtung** - volle Breite; die Palette bekommt eine
Farb-Chip-Zeile als Mini-Vorschau (Chip-Farben grob zur beschriebenen
Palette), am Ende der Kursiv-Disclaimer:

```html
<h2>Visuelle Richtung</h2>
<h3>Palette</h3>
<p><span data-type="status" data-color="green">{Farbwort 1}</span> <span data-type="status" data-color="yellow">{Farbwort 2}</span> <span data-type="status" data-color="grey">{Farbwort 3}</span></p>
<p>{Palette als Stimmung beschrieben}</p>
<h3>Bildsprache</h3><p>{…}</p>
<h3>Typografie</h3><p>{…}</p>
<h3>Form</h3><p>{…}</p>
<p><em>Richtung, keine finalen Tokens. Die entstehen in der Generierung.</em></p>
```

**Barrierefreiheit** - volle Breite, je Anforderung ein blauer
`Pflicht`-Chip vor dem Titel:

```html
<h2>Barrierefreiheit</h2>
<h3><span data-type="status" data-color="blue">Pflicht</span> {Anforderung 1}</h3><p>{…}</p>
<h3><span data-type="status" data-color="blue">Pflicht</span> {Anforderung 2}</h3><p>{…}</p>
```

**Success-Panel (Was die Generierung liefern soll)** - der Handoff in den
Bau, `<strong>`-geführte Absätze:

```html
<h2>Was die Generierung liefern soll</h2>
<div data-type="panel-success"><p><strong>Design-System als Tokens</strong>: {Farbe, Typografie, Abstände, Radien, Zustände, plus Komponenten-Set}.</p><p><strong>Hifi-Prototyp der Schlüssel-Screens</strong>: {die Screens aus dem Abschnitt oben}.</p><p><strong>Als Code</strong>: {Tokens plus HTML- oder React-Prototyp, damit die Werkbank direkt weiterarbeitet, nicht Figma-only}.</p></div>
```

Regeln:

- **Nordstern** = benannter Auszug `Summary`, reiner Text, **kein Panel**
  (kann transkludiert werden).
- **Rhythmus wahren**: kein Abschnitt sieht aus wie sein direkter Nachbar.
  Wenn Inhalt und Menge es nahelegen, darf ein Abschnitt auch anders
  behandelt werden als in der Tabelle - solange die Seite abwechslungsreich
  und lesbar bleibt.
- **Handoff** = **Success-Panel**.
- 2-Spalten einheitlich `760`; bei ungerader Zahl letzte Spalte leer.
