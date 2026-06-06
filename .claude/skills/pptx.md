# PPTX Skill

Handle all PowerPoint presentation work — creating, editing, reading, or modifying .pptx files.

## Key Commands

- **Extract text**: `python -m markitdown presentation.pptx`
- **Visual preview**: `python scripts/thumbnail.py presentation.pptx`
- **Create from scratch**: Use pptxgenjs (see pptxgenjs.md)
- **Edit existing**: Unpack → modify → pack (see editing.md)

## Design Essentials

**Avoid plain bullet slides.** Instead:
- Pick a **topic-specific color palette** (60-70% dominant color, supporting tones, one accent)
- Use **contrasting dark/light** (dark titles, light content)
- **Repeat one visual motif** across all slides (icons, borders, frames)
- Include **visual elements on every slide** — images, charts, icons, or shapes
- Pair **interesting fonts** (not generic Arial)
- Maintain **consistent 0.3-0.5" spacing** and 0.5" margins

## Common Mistakes to Avoid

- Text-only slides without visuals
- Centered body text (left-align instead)
- Repeated layouts slide-to-slide
- Low-contrast elements
- Accent lines under titles (hallmark of AI-generated slides)
- Inconsistent spacing
- Placeholder text left in templates

## Quality Assurance

1. Extract and verify content with markitdown
2. **Use subagents** to inspect visual slides for overlaps, cut-off text, and alignment issues
3. Fix problems and re-verify
4. Repeat until a full pass finds no new issues
