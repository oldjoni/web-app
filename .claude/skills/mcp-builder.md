# MCP Server Development Guide

Structured four-phase approach for building high-quality MCP (Model Context Protocol) servers that enable LLMs to interact with external services.

## Key Phases

**Phase 1: Deep Research and Planning** — Understand modern MCP design principles, study the MCP protocol specification, and review framework documentation. Preferred stack: TypeScript with the MCP SDK; Python with FastMCP also supported.

**Phase 2: Implementation** — Set up project structure, create core infrastructure (API clients, error handling), and implement individual tools with proper input/output schemas and descriptions.

**Phase 3: Review and Test** — Ensure code quality through DRY principles, consistent error handling, and full type coverage, with verification using the MCP Inspector.

**Phase 4: Create Evaluations** — Design 10 complex, realistic questions to test whether LLMs can effectively use the server to accomplish real-world tasks.

## Core Design Principles

"The quality of an MCP server is measured by how well it enables LLMs to accomplish real-world tasks." Key considerations:

- Balance API coverage with specialized workflow tools
- Use clear and discoverable tool names with consistent prefixes
- Manage context through focused data returns
- Provide actionable error messages
- Annotate tools with `readOnlyHint`, `destructiveHint`, `idempotentHint`, and `openWorldHint`
