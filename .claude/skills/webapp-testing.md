# Web Application Testing Toolkit

Automated testing of local web applications using Playwright with Python. Core resource: `scripts/with_server.py`, which manages server lifecycles for testing scenarios.

## Key Capabilities

- Verifying frontend functionality
- Debugging UI behavior
- Capturing browser screenshots
- Viewing browser logs

## Primary Workflow

Reconnaissance-then-action approach:

1. Launch the application (using helper scripts if needed)
2. Wait for network activity to complete
3. Inspect the rendered DOM to identify interactive elements
4. Execute test actions using discovered selectors

## Critical Best Practice

Don't inspect the DOM before waiting for `networkidle` on dynamic apps. Always use `page.wait_for_load_state('networkidle')` before inspection on JavaScript-heavy applications.

## Script Invocation

Run helper scripts with `--help` before implementation to understand available options, treating them as black-box utilities rather than reading source code directly to preserve context window space.

Reference examples are available in the `examples/` directory covering element discovery, static HTML automation, and console logging patterns.
