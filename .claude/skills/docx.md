# DOCX Skill

Create, edit, and analyze Word documents (.docx files).

## Core Functions

**Creating Documents**: Use the `docx` npm library with JavaScript to generate formatted .docx files with support for headings, tables, images, headers/footers, and table of contents.

**Reading Content**: Extract text using pandoc or unpack the ZIP archive to access raw XML.

**Editing Existing Documents**: Three-step process — unpack the .docx file, edit the XML, then repack it.

## Critical Implementation Details

- **Page sizing**: docx-js defaults to A4, not US Letter. Always set page size explicitly (12,240 × 15,840 DXA units for US Letter).
- **Table widths**: Tables require dual width specifications — both `columnWidths` array and individual cell `width` properties, using DXA units only (percentage-based widths break in Google Docs).
- **Smart typography**: When editing, use XML entities like `&#x2019;` for apostrophes and `&#x201C;`/`&#x201D;` for quotation marks.
- **Tracked changes**: Deletion markers use `<w:delText>` instead of `<w:t>`, and paragraph deletions require additional markup to prevent empty paragraphs after accepting changes.
- **Structural rules**: PageBreak elements must nest inside Paragraph containers; list bullets use `LevelFormat.BULLET` (never manual unicode characters).

The skill handles format conversions, tracked changes management, and comment insertion through supporting Python scripts.
