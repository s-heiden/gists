# Workflow Scannen: Scan oder PDF zu EPUB

## ABBYYY FineReader

-   Scan
-   Dokumententeilungen markieren
-   Listenanfang und -ende markieren sowie Absätze dazwischen ohne Aufzählungspunkt
-   Titel, Untertitel, Autor, Verlag markieren
-   Überschrift1, 2, 3, … markieren
-   Evtl. Ort der Bilder markieren
-   Eingezogene Quotierungen markieren und ihr Ende
-   Zerstückelte Wortteile am Seitenanfang markieren (z. B. „\_wt\_lich sind. …“)
-   Großgeschriebene Worte am Seitenanfang, die nicht Anfang eines neuen Absatzes sind, markieren (z. B. „Malz, Gott erhalt’s. …“)
-   Auslassungszeichen markieren
-   Spitze Anführungszeichen
-   Pfeile markieren
-   Nicht erkannte Sonderzeichen markieren
-   Besondere Formatierungen markieren (Hängender Einzug, Tabellen, Zentriert, etc.)
-   Horizontale Abstände im Layout markieren
-   Rechtschreibfehler und fragliche Scanbereiche aufmerksam durchgehen
-   Exportieren als HTM mit Formatierung

## LibreOffice Writer

-   Gedankenstriche
-   Paragraphs die mit einem kleinen Zeichen anfangen: `^\[a-z\]`
-   Paragraphs die nicht in einem Satzzeichen enden: `\[a-z\]$`
-   Einfache Apostrophe und Zollzeichen durch „Smart Quotes“ ersetzen:
	-   `"$` → `“` (D) 
	-   `"$` → `”` (E)
	-   `^"` → `“` (E)
	-   `^"` → `„` (D)
	-   `([a-zäüöß,.!?])"` → `\1“` (D)
	-   `([a-zäüöß,.!?])"` → `\1”` (E)
	-   ` "([a-zäüöß,.!?])` → `„\1` (D)
	-   ` "([a-zäüöß,.!?])` → `“\1` (E)
-   Markierungen in HTML CSS-Klassen übersetzen
-   Ellipsis
	-   `[ ]{0,1}\.[ ]{0,1}\.[ ]{0,1}\.[ ]{0,1}` → `… `


