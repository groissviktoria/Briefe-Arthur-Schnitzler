# Briefe-Arthur-Schnitzler

Dieses Repository sammelt die Daten zur Digitalisierung der Briefe Arthur Schnitzlers, die in den folgenden gedruckten Bänden veröffentlicht wurden:

- Arthur Schnitzler: Briefe 1875-1912. Herausgegeben von Therese Nickl und Heinrich Schnitzler. S. Fischer Verlag; Frankfurt am Main: 1981 
- Arthur Schnitzler: Briefe 1913-1931. Herausgegeben von Peter Michael Braunwarth, Richard Miklin, Susanne Pertlik und Heinrich Schnitzler. S. Fischer Verlag; Frankfurt am Main: 1984


Der Ordner **XSLs** beinhaltet jegliche XSL-Dateien die für die Transformation der Briefe angelegt wurden.

- **merge.xsl** schreibt alle Dateien in einem Ordner in ein gemeinsames XML-Dokument.
- **Rename Elements.xsl** entfernt nicht benötigte Elemente und versieht die übrigen mit kürzeren Tags (üblicherweise TEI-tags)
- **unpack page.xsl** packt schlicht das Element Page aus, sodass die Inhalte der Briefe nicht mehr an die Seiteneinteilung gebunden sind. (Dieses einfache XSL besteht hauptsächlich zur Verkettung mehrerer XSLs zu einem Transformations-Szanario
- **separate letters.xsl** trennt die trennt die Briefinhalte in TEI-Elemente, die je einen Brief von Anfang bis Ende enthalten.
- **modify-header(briefe-1).xsl** bzw. **modify-header(briefe-2).xsl** erweitert den teiHeader um die notwendigen Elemente, und ergänzt die bibliographischen Informationen sowie Informationen zu Titel und Adressat. (Briefe 1 bezeichnet die Briefe 1875-1912, Briefe 2 die Briefe 1913-1931)
- **match-letters-to-dates-Briefv-1.xsl** und **match-letters-to-dates-Briefv-2.xsl** ergänzen das Briefdatum durch Verknüpfung mit der digitaliserten Version der im gedruckten Band enthaltenen Liste von Empfängern und Daten der Briefe. (Briefv-1 bezeichnet die Briefe 1875-1912, Briefv-2 die Briefe 1913-1931)
- **correspdesc.xsl** extrahiert aus dem Sammeldokument die Informationen über die Korrespondenzen, die im TEI-Feld correspDesc enthalten sind. (Anwendung nach derzeitigem Stand nur vor der Trennung der Briefe in separate Dateien möglich.)
- **separate files.xsl** trennt die Briefe in einzelne fortlaufend nummerierte XML-Dokumente im TEI-Format

Der Ordner **Briefverzeichnis 1** bzw **Briefverzeichnis 2** beinhaltet die XML-Dokumente aller Zwischenschritte sowie die dafür verwendeten XSL-Dateien zur Digitalisierung der Liste von Empfängern und Daten der Briefe (Briefv. 1 bezichnet die Briefe 1875-1912, Briefv. 2 die Briefe 1913-1931)
Die letzte Version ist im Namen durch ein *final* gekennzeichnet. Eine Kopie der finalen Verisonen befindet sich zusätzlich im XSL-Ordner um von den **match-letters-to-dates** XSLs erreicht werden zu können. Fehlerkorrekturen finden daher zuerst im **XSLs**-Ordner statt.

Die Ordner **Testset 1** und **Testset 2** enthalten eine Auswahl von Briefen an denen die XSLs entwickelt und getestet wurden, sowie die Zwischenschritte bis dorthin.
