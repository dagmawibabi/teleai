# Triangle landing page

Triangle brings a person's chats, apps, phone and PC into one conversation with an AI.
The page has one job: show what that can do and invite an Android download.

## Visual direction

Monochrome and industrial: a machined plate, not a marketing page.

- True black `#000`, white `#fff`, steel `#8c8c8c`, graphite `#2a2a2a`, plate `#141414`. No accent colour.
- Sora only, self-hosted. Its weight axis is the type treatment: headlines thicken from a hairline as they arrive, and rows and numbers change weight when hovered.
- Square corners and 1px rules. Only the phone frames are rounded, because phones are.
- The triangle is the only motif and the only pointer glyph. It replaces arrows, spinners and carets.

## The signature

`TrianglePlate.svelte` draws a perforated plate on a canvas: a lattice of tiny triangles forming the hollow logo. It ripples as if listening, parts around the pointer, rings when clicked, comes apart on scroll, and is cut away around the headline so the words stay readable. Everything else stays quieter than this.

```text
  [logo draws itself with scroll]          nav   [download]
  Your world.                  ▲ the plate
  One conversation.           ▲ ▲
  [download]
  ─ apps sliding past ─────────────────────────────────────
  Rows, thin to bold           Demo window that types itself
  Steps of copy                Pinned phone; screens open out of a triangle
  [ tool grid with shared 1px rules, spans 4+2, 3+3, 2+2+2 ]
  Control copy                 Approval demo
  1  2  3
  Questions                    Accordion
  ████████ white download section, with a giant triangle ████
```

## Tool catalogue

`/tools` lists every tool, generated from the app so it can't drift. After tools change, regenerate it:

- From the Flutter root: `flutter test site/scripts/export_tools_test.dart`
- From `companion/`: `flutter test ../site/scripts/export_companion_tools_test.dart`

`src/lib/data/catalogue.ts` sorts categories into groups and shortens descriptions. The build fails if a tool's category isn't in a group, so nothing goes missing silently.

## Motion

The brief asks for a lot of animation, so motion is everywhere, with a shared vocabulary:

- A growing triangle is how things change state: buttons fill from one, grid cells invert from one, screens and the mobile menu open from one.
- Elements ease with `--snap`; nothing bounces.
- `Cursor.svelte` trails the mouse with a small triangle that points where it's moving. The real cursor stays.
- Buttons lean toward the mouse and press in.

`prefers-reduced-motion` turns all of it off: the plate draws once, the demo shows complete, nothing is hidden.

## Writing

Plain and specific: say what it does. Sentence case, no labels above headings, no arrows in text. Numbers appear only on the setup steps, which are a real sequence.

## Screenshot provenance

`static/screenshots/` contains screenshots rendered from Triangle's Flutter widgets,
with entirely fictional sample data. The assistant and watch views use the actual
`UserBubble` and `AssistantMessage` widgets inside a representative app shell. The
brief is the actual `BriefView`. This is disclosed in the enlarged view.

`scripts/render_app_screenshots_test.dart` reproduces the images from the Flutter root.
It needs a compiling Flutter application. No account or network connection is required.
