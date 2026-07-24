# Vorlagen: Epic & Story (für Jira)

In Jira als **ADF**. Regeln:

- **Referenzen als ADF-Karten**, nie als rohe URL/Markdown-Link.
  Prominente Einzel-Referenzen (Journey am Epic, Design-Screen an der
  Story) als volle **`blockCard`**. Kontext-Referenzen an der Story
  (Persona, Journey, Technical Brief) als **`inlineCard` mit fettem
  Label davor** (`Persona:`, `Journey:`, `Technical Brief:`).
- **Akzeptanzkriterien als Checkbox-Liste**; Given/When/Then je auf
  eigener Zeile, Labels **fett und in Farbe `#403294`**.
- Beschreibungen strukturiert, nicht als Prosa-Wust.

Ziel: die Story ist autark. Entferne die Klammer-Hinweise in der finalen
Fassung.

---

## Epic (Business) - schlank, Vermittler zur Journey

- **Summary**: {kurzer, prägnanter Titel}
- **Label**: `business`

{Ein bis zwei Sätze Prosa: die Essenz des Epics.}

{Journey als blockCard}

### Akzeptanzkriterien

- [ ] {epic-weites Kriterium}
- [ ] {…}

---

## Epic (Architectural)

- **Summary**: {Walking Skeleton …}
- **Label**: `architectural`

{Ein bis zwei Sätze Prosa.}

{Technical Brief als blockCard}

### Akzeptanzkriterien

- [ ] {…}

---

## Story - autark

Als {Persona} möchte ich {Funktion}, um {Nutzen}.

### Fachlicher Kontext

Ein paar Sätze zum Bedürfnis dahinter - genug, dass der fachliche Sinn
klar ist (kein Ein-Satz-Verweis).

**Persona:** {Persona als Inline-Karte}

**Journey:** {Journey als Inline-Karte}

### Umsetzungsinformationen

Plan als Liste - was zu tun ist und woran zu denken:

- {Backend: Endpoint, Persistenz/Migration}
- {Frontend: Komponente(n)}
- {Integrationen: Auth, Speicher, externe Dienste}
- {Randfälle}
- {Testebene}

**Technical Brief:** {als Inline-Karte}

## Design

{Nur wenn die Story UI/Frontend berührt: der Design-Screen bzw. Prototyp
als volle `blockCard` (URL aus dem Prompt oder beim Nutzer erfragt,
werkzeugunabhängig). Sonst diesen Abschnitt weglassen.}

### Akzeptanzkriterien

Given/When/Then fett und in Farbe `#403294`, je auf eigener Zeile:

- [ ] **Given** {Ausgangslage}
  **When** {Aktion}
  **Then** {erwartetes, prüfbares Ergebnis}
- [ ] **Given** {…}
  **When** {…}
  **Then** {…}
