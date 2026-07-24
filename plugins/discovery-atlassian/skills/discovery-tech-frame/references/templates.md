# Vorlage: Technical Brief (HTML+)

In Confluence als **HTML+** (`contentFormat: html`). Marker je
Abschnittstyp - siehe `references/confluence-style.md`. Listenelemente
sind beschriebene Halbsätze mit dem *Warum*, keine Schlagworte. Katalog-ids
stammen aus der Live-Quelle. Entferne die Klammer-Hinweise.

Seitentitel: `{Produktname} | Technical Brief` (Konvention: Produkt zuerst,
dann Artefakt-Typ, getrennt mit `|`. Das Artefakt-Wort ist englisch, damit
die Titel sprachneutral bleiben; der Seiteninhalt folgt der Sprache des
Nutzers.)

Keine Meta-Präambel („Dieses Dokument hält fest …"). Die Seite öffnet mit
der Architektur; der fachliche Kontext (Brief) steht im Seitenbaum, ein
Link darauf ist überflüssig.

```html
<h2>Architektur im Überblick</h2>
<div data-type="bodied-extension" data-extension-key="excerpt" data-extension-type="com.atlassian.confluence.macro.core" data-parameters='{"macroParams":{"name":{"value":"summary"}}}'><p>{Zwei bis vier Sätze Prosa: wie die Teile zusammenspielen - Frontend, Backend, welche Daten wohin, welche Dienste beteiligt sind.}</p></div>
<h2>Technologie-Entscheidungen</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3>{Emoji} {Bereich, z.B. Backend}: {Entscheidung}</h3><p>{ein Satz Begründung}</p><h3>{Emoji} {Frontend}: {Entscheidung}</h3><p>{…}</p></div><div data-type="column" data-width="50"><h3>{Emoji} {Datenhaltung}: {Entscheidung}</h3><p>{…}</p><h3>{Emoji} {Auth}: {Entscheidung}</h3><p>{…}</p></div></section>
<h2>Abbildung auf die Monoceros-Container-Definition</h2>
<p><em>Katalog-ids aus der Live-Quelle (CLI {version}). Die exakten ids und Versionen zur Bauzeit gegen </em><code>monoceros list-components</code><em> bestätigen.</em></p>
<div data-type="bodied-extension" data-extension-key="details" data-extension-type="com.atlassian.confluence.macro.core"><table data-width="760"><tbody><tr><th><p><code>--with-languages</code></p></th><td><p>{id, id, … - je kurz wofür}</p></td></tr><tr><th><p><code>--with-services</code></p></th><td><p>{id, id, … - je kurz wofür}</p></td></tr><tr><th><p><code>--with-features</code></p></th><td><p>{id, id, … - je kurz wofür}</p></td></tr><tr><th><p><code>--with-ports</code></p></th><td><p>{welche Dienste browser-erreichbar}</p></td></tr><tr><th><p><code>--with-repos</code></p></th><td><p>{volle HTTPS-URL, nur bei github.com/gitlab.com/bitbucket.org; kein Repo oder anderer Host: Zeile weglassen}</p></td></tr></tbody></table></div>
<p>Nicht in der yml (app-eigene Dependencies): {Frameworks/Bibliotheken, die die App selbst mitbringt}. Tests: {Test-Stacks je Komponente}.</p>
<p>Als Skizze (die <code>--with-repos</code>-Zeile nur bei vorhandenem Repo auf github.com/gitlab.com/bitbucket.org; sonst weglassen):</p>
<pre data-breakout="wide" data-breakout-width="760"><code class="language-shell">monoceros init {name} \
  --with-languages={…} \
  --with-services={…} \
  --with-features={…} \
  --with-ports={…} \
  --with-repos={volle HTTPS-URL des Repos, beim Nutzer erfragt - kein Platzhalter}</code></pre>
<p>Repo auf einem anderen Host (self-hosted GitLab, GitHub Enterprise …) nicht in <code>--with-repos</code>, sondern nach dem init:</p>
<pre data-breakout="wide" data-breakout-width="760"><code class="language-shell">monoceros add-repo {name} {https-url} --provider=github|gitlab|bitbucket</code></pre>
<p>Token-/PAT-Einrichtung fürs Klonen und Pushen (privates Repo): <a href="https://getmonoceros.build/docs/concepts/git-and-repos/">getmonoceros.build/docs/concepts/git-and-repos</a>.</p>
<h2>Deployment</h2>
<div data-type="panel-note"><p>{Ziel und Mechanik, soweit bekannt. Solange offen: „Ziel noch zu entscheiden" - dann NICHT zusätzlich in Offene Punkte.}</p></div>
<h2>Offene Punkte</h2>
<section data-type="layout-two-equal" data-breakout="wide" data-breakout-width="760"><div data-type="column" data-width="50"><h3><span data-type="status" data-color="yellow">offen</span> {Punkt 1}</h3><p>{was zu klären/zu tun ist}</p></div><div data-type="column" data-width="50"><h3><span data-type="status" data-color="yellow">offen</span> {Punkt 2}</h3><p>{…}</p></div></section>
```

Regeln:

- **Architektur im Überblick** = der **benannte Auszug `summary`** (reiner
  Text, kein Panel). Die Architektur ist die Substanz der Seite und die
  transkludierbare Zusammenfassung zugleich - kein Duplikat. **Keine
  Meta-Intro** als Auszug.
- **Technologie-Entscheidungen** = 2-Spalten (760), je `<h3>` mit einem
  **passenden Themen-Emoji** (app-abhängig, nicht fix: z.B. ☕ Backend,
  ⚛️ Frontend, 🐍 Mock-Dienst, 🔐 Auth, 🧬 Vektor-DB, 🗄️ Objektspeicher,
  🔗 Integration) + `<p>` Begründung. Bei ungerader Zahl letzte Spalte leer.
- **Abbildung auf die Container-Definition** = Flag→Belegung im
  **Seiteneigenschaften-Makro** (`details`), gefolgt von der
  „Nicht in der yml"-Prosa und der `monoceros init`-Skizze als Code-Block.
  Die Tabelle muss im `details`-Makro stehen: eine nackte Tabelle hebt der
  Editor sonst instabil in einen `<thead>`. (Auch im Makro landet die
  erste Zeile in `<thead>` - beim einmaligen Erstellen harmlos, weil sie
  im ADF eine Header-Spalte `th`+`td` bleibt.)
- **Repos** = der Skill fragt, ob schon ein Repo existiert. Kein Repo →
  `--with-repos` weglassen, Repo als Offenen Punkt. github/gitlab/bitbucket →
  volle HTTPS-URL in `--with-repos`. Anderer Host → nicht in `--with-repos`,
  sondern `monoceros add-repo <name> <url> --provider=…` darunter (Provider
  erfragen). Unter dem Codeblock der Docs-Link zum Token-Setup.
- **Deployment** = **Note-Panel** (`panel-note`). Solange unentschieden:
  kurzer „offen"-Text - und der Punkt taucht dann **nicht zusätzlich** in
  den Offenen Punkten auf (ein Abschnitt ist der eine Ort für sein Thema).
- **Offene Punkte** = 2-Spalten, je `<h3>` mit gelbem `offen`-Status-Chip
  + `<p>`. (Task-Listen kennt HTML+ nicht - die Chips sind der Ersatz.)
  Bei ungerader Zahl letzte Spalte leer.
