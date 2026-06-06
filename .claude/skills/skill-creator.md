# Skill Creator

Comprehensive guide for building and iterating on Claude skills through a structured workflow.

## Core Process

The fundamental loop: define intent → write a draft skill → create test cases → run evaluations with user feedback → iterate based on results.

## Key Workflow Phases

**Capture Intent**: Clarify what the skill does, when it triggers, expected output format, and whether test cases are appropriate.

**Write the Skill**: Create a SKILL.md file with YAML frontmatter (name and description required) and markdown instructions under 500 lines when possible. Descriptions should be explicit about triggering contexts — Claude has a tendency to undertrigger skills, so descriptions should be somewhat "pushy" about usage scenarios.

**Test and Evaluate**: Run test cases with skill enabled and baseline (no skill) in parallel. Grade outputs using assertions, aggregate benchmark data, and use the `eval-viewer/generate_review.py` script to display results for user review.

**Iterate**: Based on user feedback, improve the skill by generalizing lessons, removing unproductive elements, and bundling repeated helper scripts.

## Important Principles

- Keep prompts lean and explain the reasoning behind instructions
- Look for patterns across test cases where similar helper code appears
- Avoid overfitting to specific examples — skills must work across millions of future invocations
- Focus user feedback on substantive issues rather than minor tweaks

## Platform-Specific Notes

**Claude.ai**: Run test cases sequentially without subagents; skip baseline comparisons and quantitative benchmarking; use direct conversation feedback instead of the browser viewer.
