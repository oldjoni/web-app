# Doc Co-Authoring Workflow

Collaborative document creation via three structured stages. Activates when users mention writing documentation, proposals, specs, or similar content.

## Three Stages

**Stage 1: Context Gathering**
Ask meta-questions about document type, audience, and desired impact, then encourage comprehensive information dumping. Goal is closing knowledge gaps between user and Claude so guidance becomes more intelligent.

**Stage 2: Refinement & Structure**
Build content section-by-section through clarifying questions, brainstorming 5-20 options, curating selections, and iterative refinement. Rather than direct editing, users indicate desired changes, helping the agent learn their preferences across remaining sections.

**Stage 3: Reader Testing**
Test the document with a fresh Claude instance (no context bleed) to catch blind spots. Predict reader questions, check if the document answers them correctly, and identify ambiguous language or assumed knowledge.

## Key Design Principles

- **User Agency**: Users can skip stages or work freeform if preferred
- **Surgical Edits**: Changes use targeted replacements rather than reprinting entire documents
- **Quality Focus**: Each iteration should meaningfully improve the work
- **Specificity Matters**: Detailed feedback helps the agent refine subsequent sections

Documents must work for actual readers, not just authors.
