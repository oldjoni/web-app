# Web Artifacts Builder

Suite of tools for creating elaborate, multi-component claude.ai HTML artifacts using modern frontend web technologies (React, Tailwind CSS, shadcn/ui).

## Workflow

1. Initialize a frontend repository
2. Develop the artifact through code editing
3. Bundle everything into a single HTML file
4. Display it to users
5. Optionally test it afterward

## Technology Stack

React 18 + TypeScript + Vite + Parcel (bundling) + Tailwind CSS + shadcn/ui

## Key Features

The initialization script automatically configures:
- React with TypeScript via Vite
- Tailwind CSS 3.4.1 with shadcn/ui theming
- Path aliases and 40+ pre-installed shadcn/ui components
- Parcel bundling configuration
- Node 18+ compatibility

## Design Principle

Avoid "excessive centered layouts, purple gradients, uniform rounded corners, and Inter font" to prevent generic, low-quality output.

## Output

The bundling process produces a self-contained `bundle.html` file with all JavaScript, CSS, and dependencies inlined — ready to share as a claude.ai artifact.
