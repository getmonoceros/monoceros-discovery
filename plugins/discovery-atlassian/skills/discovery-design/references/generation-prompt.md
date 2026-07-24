# Vorlage: Generierungs-Prompt

Der Skill füllt diese Vorlage am Ende aus: `{{PRODUKTNAME}}` durch den
Produktnamen ersetzen, `{{DESIGN_BRIEF}}` durch den vollständigen
Inhalt des erstellten Design Brief. Das Ergebnis als **Codeblock**
ausgeben, damit der Nutzer es mit einem Klick kopieren und in Claude
Design (oder Figma Make) einfügen kann.

Produkt-Spezifika (Palette, Screens, Plattform) kommen aus der
eingebetteten Design Brief - die Vorlage bleibt darum generisch.

---

Du gestaltest ein Design-System und einen Hifi-Prototyp für
{{PRODUKTNAME}}. Grundlage ist der unten stehende Design Brief; halte
dich an Nordstern, Tonalität und Gestaltungsprinzipien.

Geh in zwei Schritten vor:

1. Etabliere zuerst das Design-System. Tokens: Farbpalette inklusive
   Zustandsfarben, Typografie-Skala, Abstände, Radien, Schatten. Dazu ein
   Kern-Komponenten-Set: Buttons, Eingabefelder, Cards, Listen,
   Navigation, Status-/Badge-Elemente, Empty States. Das System trägt die
   Markenpersönlichkeit aus dem Design Brief.
2. Baue darauf den Hifi-Prototyp der Schlüssel-Screens. Jeder Screen
   nutzt ausschließlich das System, damit alles konsistent ist.

Halte dich an:

- Die Plattform-, Interaktions- und Barrierefreiheits-Vorgaben des
  Design Brief; Kontrast mindestens AA und Zustand nie nur über Farbe als
  Grundlinie.
- Die im Design Brief beschriebene Bildsprache; nutze Platzhalterbilder.

Deliverable: das Design-System als maschinenlesbare Tokens (z.B.
CSS-Variablen oder JSON) plus Komponenten und Prototyp als Code (HTML/CSS
oder React), damit ein Entwickler oder Coding-Agent direkt damit
weiterarbeiten kann. Kein reines Figma-Artefakt. Wenn das Werkzeug primär
Figma erzeugt, exportiere zusätzlich die Tokens und liefere einen
Code-Handoff.

Design Brief:

{{DESIGN_BRIEF}}
