# MKK Vereinsdokumente

Dieses Repository enthält die offiziellen Dokumente des Monsterkicker Klubs e.V. (MKK) als Markdown-Dateien. Die Dokumente werden automatisch in PDF-Dateien umgewandelt und stehen zum Download bereit.

## Inhalt

- **docs/**: Enthält die Markdown-Quellen der Vereinsdokumente (`FTL.md`, usw.).
- **assets/pdf/**: Hier werden die automatisch generierten PDF-Versionen der Dokumente abgelegt.
- **assets/css/**: Enthält das Stylesheet für die HTML-Darstellung.
- **generate_pdf_local.sh**: Skript zur lokalen PDF-Erzeugung aus den Markdown-Dateien.
- **.github/workflows/generate-pdf.yml**: GitHub Actions Workflow zur automatischen PDF-Erstellung bei jedem Push auf den `main`-Branch.
- **_layouts/** und **_config.yml**: Dateien für das Jekyll-Setup zur HTML-Darstellung auf GitHub Pages.

---

## Hinweise zur Bearbeitung der Markdown-Dokumente

Die Dokumente werden im [Markdown-Format](https://www.markdownguide.org/basic-syntax/) geschrieben. Markdown ist eine einfache Auszeichnungssprache, die leicht zu lesen und zu bearbeiten ist – auch für Nicht-ITler.

### Automatische Platzhalter und "Magic"

- **Datum:** Ganz oben im Dokument steht oft eine Zeile wie  
  `date: {{ site.time | date: "%d-%m-%Y" }}`  
  Beim PDF-Export wird dieser Platzhalter automatisch durch das Datum des letzten Commits ersetzt.
- **TOC (Inhaltsverzeichnis):**  
  Die Zeile  
  ```
  * TOC
  {:toc}
  ```
  erzeugt beim Export ein automatisches Inhaltsverzeichnis an dieser Stelle.
- **HTML-Blöcke:**  
  Blöcke wie `<div class="html-only">...</div>` werden beim PDF-Export entfernt und erscheinen nur in der HTML-Version.
- **Alphabetische Listen:**  
  Für Listen mit Buchstaben (a, b, c, ...) wird in HTML folgendes verwendet:
  ```html
  <ol type="a">
    <li>Erster Punkt</li>
    <li>Zweiter Punkt</li>
  </ol>
  ```
  Diese Syntax wird beim PDF-Export automatisch in eine passende Darstellung umgewandelt.  
  **Hinweis:** Solche Listen bitte nur verwenden, wenn wirklich eine alphabetische Nummerierung (a, b, c, ...) benötigt wird.

Alle diese Anpassungen werden automatisch durch das Skript und den GitHub Actions Workflow erledigt (siehe `.github/workflows/generate-pdf.yml`).

---

### Überschriften

Überschriften werden mit `#` markiert. Je mehr `#`, desto kleiner die Überschrift:

```
# Überschrift 1
## Überschrift 2
### Überschrift 3
```

---

### Aufzählungen (Listen)

**Ungeordnete Liste (Punkte):**

```
- Erster Punkt
- Zweiter Punkt
  - Unterpunkt
```

**Ergebnis:**
- Erster Punkt
- Zweiter Punkt
  - Unterpunkt

**Geordnete Liste (Nummerierung):**

```
1. Erster Punkt
2. Zweiter Punkt
   1. Unterpunkt
```

**Ergebnis:**
1. Erster Punkt
2. Zweiter Punkt
   1. Unterpunkt

---

### Bilder einfügen

Bilder können mit folgender Syntax eingefügt werden:

```
![Alternativtext](pfad/zum/bild.png)
```

Beispiel:

```
![TFVSH Logo](images/tfvsh-logo.png)
```

---

### Weitere Tipps

- **Fett:** `**Text**` → **Text**
- **Kursiv:** `_Text_` → _Text_
- **Links:** `[Linktext](URL)`
- **Tabellen:** Siehe Beispiele in den bestehenden Dokumenten.

Eine ausführliche Anleitung zu Markdown findest du z.B. hier:  
👉 [Markdown Guide (deutsch)](https://www.markdownguide.org/basic-syntax/)

---

## Automatische PDF-Erstellung

Bei jedem Push auf den `main`-Branch wird der [GitHub Actions Workflow](.github/workflows/generate-pdf.yml) ausgeführt:

1. Das Änderungsdatum wird automatisch in die Dokumente eingefügt.
2. Die Markdown-Dateien werden mit Pandoc und LaTeX in PDFs umgewandelt.
3. Die PDFs werden im Ordner [`assets/pdf/`](assets/pdf/) gespeichert und ins Repository zurückgepusht.

**Hinweis:**  
Wenn das Repository auf eine Organisation (wie MKK) umgezogen wurde, muss für GitHub Actions das "Workflow permissions" Feature aktiviert werden, damit der Workflow Änderungen (z.B. neue PDFs) auf den `main`-Branch pushen darf.  
Gehe dazu in die Repository-Einstellungen unter  
`Settings` → `Actions` → `General` → `Workflow permissions`  
und aktiviere **"Read and write permissions"**.

---

## Lokale PDF-Erstellung

Um die PDFs lokal zu generieren, führe das Skript aus:

```sh
bash generate_pdf_local.sh
```

Voraussetzungen:
- [Pandoc](https://pandoc.org/)
- [XeLaTeX](https://www.tug.org/xetex/)

---

## Lizenz

[UNLICENSE](LICENSE) – Public Domain

---

Bei Fragen oder Verbesserungsvorschlägen bitte ein Issue eröffnen oder einen Pull Request stellen.
