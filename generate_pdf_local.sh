#!/bin/bash

# Create the assets/pdf directory if it doesn't exist
mkdir -p assets/pdf
mkdir -p temp

# Get the current date
CURRENT_DATE=$(date +%Y-%m-%d)

# Loop through all Markdown files in the docs directory
for file in docs/*.md; do
    filename=$(basename -- "$file")
    name="${filename%.*}" # Extract file name without extension
    cp "$file" "temp/${name}_temp.md"
    
    # Replace date placeholder in Markdown content
    sed -i "s/{{ site.time | date: \"%d-%m-%Y\" }}/$CURRENT_DATE/g" "temp/${name}_temp.md"
    # Replace date in the metadata block
    sed -i "s/date: {{ site.time | date: \"%d-%m-%Y\" }}/date: $CURRENT_DATE/g" "temp/${name}_temp.md"
    # Replace TOC syntax for LaTeX
    sed -i '/^\* TOC$/{N;s|.*\n.*$|\\clearpage\\renewcommand{\\contentsname}{Inhaltsverzeichnis}\n\\tableofcontents\n\\clearpage|}' "temp/${name}_temp.md"
    # Remove HTML-only blocks for PDF generation
    sed -i '/<div class="html-only"/,/^<\/div>$/d' "temp/${name}_temp.md"
    # Convert Markdown to PDF
    pandoc "temp/${name}_temp.md" -o "assets/pdf/${name}.pdf" \
      --toc-depth=2 \
      --pdf-engine=xelatex \
      -V geometry:margin=1in \
      --resource-path=./docs
done

echo "PDFs successfully generated in assets/pdf/"
