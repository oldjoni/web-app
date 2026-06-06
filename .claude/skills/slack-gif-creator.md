# Slack GIF Creator

Toolkit for generating animated GIFs optimized for Slack messaging.

## Key Technical Requirements

- **Emoji GIFs**: 128x128 pixels, 10-30 FPS, under 3 seconds
- **Message GIFs**: 480x480 pixels
- **Color palettes**: 48-128 colors

## Core Capabilities

1. **GIFBuilder** — assembles individual frames and handles optimization for Slack's platform
2. **PIL Integration** — uses Python Imaging Library primitives (circles, polygons, lines, rectangles) to create graphics from scratch
3. **Animation Utilities** — easing functions and helper tools for bouncing, pulsing, fading, and sliding effects

## Design Philosophy

Emphasizes creative flexibility using PIL's drawing capabilities. Load uploaded images for reference or direct use, then combine animation concepts (bouncing + rotating) to achieve polished results.

Achieve visual quality through: thicker outlines, layered shapes, gradients, and thoughtful color choices to avoid amateurish appearance.
