# LaTeX-Templates for Universiy of Applied Sciences Mannheim (HSMA) 

Das HSMA Bundle ist die Umsetzung des Corporate Designs der Hochschule Mannheim in LaTeX. Es liefert neben den Klassen-, Paket- und Konfigurationsdateien auch Anwenderdokumentation in Form von Templatedateien für verschiedene Dokumententypen.
Die Templates unterstützen sowohl die deutsche als auch englische Sprache. 

## Verwendungshinweis

Für wissenschaftliche Veröffentlichungen und Abschlussarbeiten ist die Erzeugung einer archivierbaren PDF-Datei (PDF/A) vorgesehen. Dies ist mit aktuellen LaTeX-Paketen und dem Compiler LuaLaTeX deutlich besser umzusetzen, als mit älteren Formaten. Aus diesem Grund sollten Sie vor der Verwendung der hier veröffentlichten Templates Ihre TeX-Distribution aktualisieren und nach Möglichkeit LuaLaTeX als Compiler verwenden. Die Nutzung anderer Kompilierungsprogramme ist grundsätzlich möglich, allerdings werden dann ggf. nicht alle Funktionen unterstützt. Es kann sogar notwendig sein, die Erzeugung von PDF/A zu unterbinden. Weitere Hinweise finden sich in den Beispieldateien dokumentiert. Diese sind auch als kompilierte PDFs unter hxyz  oder – falls das Paket installiert ist – im ensprechenden Doku-Verzeichnis (/doc/latex/hsma) verfügbar.


<!---## Nutzung von HSMA über Overleaf--->

<!---Die Hochschule Mannheim verfügt über eine eigene Overleaf-Installation, auf die alle Mitglieder Zugriff haben. Die DEMO-Dateien werden dort in der jeweils aktuellen Version als Templates bereitgestellt: url  Somit ist eine Nutzung ohne lokale Installation möglich.--->



## Enthaltene Templatedateien

Dokumententyp				 | Templatedatei(en)									| Dokumentenklasse
---------------------------------------- | ------------------------------------------------------------------------------------ | ----------------
Abschlussarbeiten 			 | Thesis.tex, verwendet auch Bibliography.bib	| hsma.cls mit studiengaenge.tex, titlepage.sty 
Exposé für das Modul Wissenschaftliches Arbeiten für Fortgeschrittene (WIF)			 | wif.tex, verwendet auch Bibliography.bib	| hsma.cls mit texcount.pl


# Liste aller enthaltenen Dateien:

* README.md
* thesis/
  - bilder/
  - kapitel/
  - src/
  - pdfs/ 
  - abstract.tex
  - docinfo.tex
  - hsma.cls
  - literatur.bib
  - preambel.tex
  - studiengaenge.tex
  - thesis.tex
  - titlepage.sty
* wif/
  - bilder/
  - docinfo.tex
  - hsma.cls
  - literatur.bib
  - preambel.tex
  - texcount.pl
  - wif.tex
  - wordcount.tex
 








