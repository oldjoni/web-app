# PDF Processing Guide

Essential PDF operations using Python libraries and command-line tools.

## Key Libraries

**pypdf** — merging multiple PDFs, splitting individual pages, extracting metadata, and rotating pages.

**pdfplumber** — text and table extraction while preserving layout information.

**reportlab** — PDF creation from scratch, supporting multi-page documents with formatted text, spacing, and page breaks.

## Important Note on Formatting

When creating PDFs with reportlab, avoid Unicode subscript/superscript characters (₀₁₂₃). Instead, use XML markup: `<sub>` tags for subscripts and `<super>` tags for superscripts within Paragraph objects.

## Command-Line Tools

- **pdftotext** — extracts text while preserving layout across specified page ranges
- **qpdf** — merges, splits, rotates, and decrypts PDF files
- **pdftk** (if available) — similar merge, split, and rotation capabilities

## Common Tasks

- OCR on scanned PDFs using pytesseract
- Adding watermarks to documents
- Extracting embedded images
- Password-protecting PDFs

For form filling instructions, reference a separate FORMS.md document.
