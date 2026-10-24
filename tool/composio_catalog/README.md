# Composio app tool catalog

`lib/features/telegram/data/telegram_app_catalog.dart` is generated from
Composio's toolkit reference. To add a tool or refresh the schemas:

1. Download the toolkit pages into a work folder (`<work>/composio`):

   ```sh
   for t in gmail outlook googlecalendar googledrive googledocs googlesheets slack notion github linear todoist; do
     curl -sL https://docs.composio.dev/toolkits/$t.md -o <work>/composio/tk_$t.md
   done
   ```

2. Copy these scripts to `<work>/scripts`, edit `curated.py` (toolkit, slug,
   `r` read / `w` asks first / `d` destructive, card label), then run:

   ```sh
   python -I <work>/scripts/parse.py <work>/composio
   python -I <work>/scripts/gen.py <work> lib/features/telegram/data/telegram_app_catalog.dart
   ```
