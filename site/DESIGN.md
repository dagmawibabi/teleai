# Triangle landing page

Triangle brings a person's chats, apps and AI into a workspace on their own phone.
The page has one job: make those connections tangible and invite an Android download.

## Visual direction

- Ink `#080B12`, frost `#F3F6FB`, steel `#919AAF`, signal blue `#3975F6`, ice `#B9D7FF`, mint `#A8DCC0`.
- Sora display typography echoes the geometry of the product's triangle. Manrope keeps the reading voice softer. Both variable fonts are self-hosted; licenses live with the assets.
- A centered, oversized opening gives way to an interactive split layout, a pale blue connection map, a detailed toolkit, a hands-on approval example, and the actual Flutter widgets in a screenshot gallery.
- The signature is a three-phone fan unfolding around a thin triangle. Scroll motion separates the layers; the other sections use restrained, staggered reveals.

```text
         triangle                         navigation / download
                         Your world.
                      One conversation.
                         [download]
                 / phone / PHONE / phone /
                    favorite app connections

  What becomes possible       [ask / create / watch / PC / code]
  Context and explanation     [interactive conversation example]

  Your connected world        [apps converge around Triangle]
  Everyday toolkit            [six illustrated capabilities]
  [try an approval]           You set the boundaries
                 [three expandable screenshots]
                   [download / connect / ask]
  Questions                   [native accessible accordions]
                         [download]
```

## Critique and revisions

The app's monochrome identity makes dark surfaces appropriate, but a uniformly dark,
generic AI page would lose its human side. A daylight blue integration section provides
contrast, and specific sample conversations replace invented metrics or testimonials.
The triangle belongs to the product; it is the single visual motif. No stock space art,
rotating marketing phrases, or decorative sequence numbers are needed. Setup steps are
numbered because they represent an actual sequence.

Browser review led to fluid tablet headlines, larger body text at smaller breakpoints,
and a native dialog for readable screenshots. Reduced motion, keyboard tabs, focus rings,
and server-rendered content are built in.

## Screenshot provenance

`static/screenshots/` contains screenshots rendered from Triangle's Flutter widgets,
with entirely fictional sample data. The assistant and watch views use the actual
`UserBubble` and `AssistantMessage` widgets inside a representative app shell. The
brief is the actual `BriefView`. This is disclosed alongside the gallery.

`scripts/render_app_screenshots_test.dart` reproduces the images from the Flutter root.
It needs a compiling Flutter application. No account or network connection is required.
