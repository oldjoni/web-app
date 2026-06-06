# Claude API Skill

Ready to help build, debug, and optimize Claude API applications using the Anthropic SDK.

## What I Handle

- **Claude API integration** across Python, TypeScript, Java, Go, Ruby, C#, PHP, and cURL
- **Feature implementation**: prompt caching, adaptive thinking, tool use, structured outputs, batches, and files
- **Model migrations** between Claude versions (e.g., Opus 4.6 → 4.7 → 4.8)
- **Managed Agents setup** (server-managed stateful agents with persistent configs)
- **Architecture guidance**: choosing between single API calls, workflows, or agents based on your use case

## Key Defaults

- **Model**: Claude Opus 4.8 (`claude-opus-4-8`) unless you specify otherwise
- **Thinking**: Adaptive thinking (`thinking: {type: "adaptive"}`) for complex tasks
- **Streaming**: Enabled for long input/output to prevent timeouts
- **SDK usage**: Official Anthropic SDKs — never OpenAI-compatible shims

## Next Steps

**Tell me:**
1. What you're building (classification, agent, workflow, etc.)
2. Your language (Python, TypeScript, Java, Go, Ruby, C#, PHP, or cURL)
3. Any specific feature you need (caching, tool use, thinking, etc.)

Or use a subcommand like `/claude-api managed-agents-onboard` to walk through setting up a Managed Agent from scratch.
