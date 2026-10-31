# Triangle website

A SvelteKit landing page for Triangle, with a canvas hero that reacts to the pointer, self-hosted type, product screenshots, a self-typing feature demo, an approval demo, and links to the Android releases.

## Local development

```sh
pnpm install
pnpm dev
```

## Validation and production

```sh
pnpm check
pnpm build
pnpm preview
```

The landing page is prerendered. The existing Vercel adapter is retained.

## Content and assets

- `src/routes/+page.svelte`: page content, interactions, and metadata.
- `src/routes/layout.css`: design tokens, layouts, motion, and breakpoints.
- `src/lib/components/`: the hero plate, the pointer triangle, and small brand and phone components.
- `static/screenshots/`: actual Flutter message and brief widgets with fictional sample data.
- `static/fonts/`: self-hosted Sora, including its OFL license.
- `static/social-preview.jpg`: 1200 × 630 social sharing image.
- `scripts/social-preview.html`: source composition for the share image; serve with the static assets and capture at 1200 × 630 to regenerate it.
- `DESIGN.md`: visual direction and screenshot provenance.

To regenerate app screenshots, run this from the parent Flutter project after ensuring the app compiles:

```sh
flutter test site/scripts/render_app_screenshots_test.dart
```

The screenshot renderer uses fictional conversations and does not connect to an account or device. Provider usage and optional service requirements are explained in the FAQ. All download links lead to https://github.com/dagmawibabi/triangle/releases so they continue to work as new builds are published.
