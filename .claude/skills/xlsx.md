# XLSX Skill

Work with Excel files (.xlsx, .xlsm, .csv, .tsv) using Python tools — primarily openpyxl and pandas.

## Key Libraries

- **pandas** — data analysis and manipulation
- **openpyxl** — complex formatting and formula-based Excel models

## Professional Formatting Standards

Color-coding conventions for financial models:
- Blue — inputs
- Black — formulas
- Green — internal links
- Red — external links

Number formatting rules for currency, percentages, multiples, and years.

## Formula Construction Principles

Use formulas instead of calculating values in Python and hardcoding them. All outputs must have **ZERO formula errors**.

## Mandatory Recalculation Workflow

Use `scripts/recalc.py` to evaluate formulas and detect errors (#REF!, #DIV/0!, etc.) after making changes.

## Documentation Requirements

Document hardcoded values with source citations.

## Key Distinctions

- Use **pandas** for data analysis tasks
- Use **openpyxl** for complex formatting and formula-based models
- Preserve existing template conventions rather than imposing standardized formatting
