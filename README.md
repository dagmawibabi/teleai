# TeleAI

TeleAI is a Flutter Telegram client with an AI workspace. It connects to your own Telegram account through TDLib, lets you browse and manage chats, and gives the assistant permission-aware tools for finding information and taking actions on your behalf.

The app is designed around reviewable actions: whenever the assistant wants to send, edit, moderate, or otherwise change something in Telegram, it presents the call and its arguments for approval first.

## What it does

### Telegram

- Browse chats, folders, channels, groups, bots, contacts, archives, and generated files.
- View photos and videos full screen; play audio and voice messages; download supported media to the device.
- Send text, albums, files, stickers, GIFs, locations, and native voice messages.
- Record a voice note from the composer, then send it directly or give it to the assistant to route.
- Show live chat activity below the title: typing, recording, uploading, choosing media, playing a game, and more.
- Open chat, channel, and group profiles from the chat UI or an AI-post detail sheet.

### AI workspace

- Ask questions about chats, messages, files, media, members, folders, and recent activity.
- Inspect tool calls and their results in rich bottom sheets; open cited Telegram posts with media controls.
- Send channel posts or other Telegram content through an adaptive preview card before forwarding.
- Generate images and audio, keep the resulting assets in **Files**, and send them to Telegram.
- Search the web with Exa when a search key is configured.
- Use approval-gated Telegram actions, including messages, voice notes, live activity states, and other enabled tools.

### Personalization and background work

- Choose theme, accent color, code-highlight theme, font, and chat font size with an in-app appearance preview.
- Configure notifications and optional background activity for watches and proactive updates.
- Choose chat, image, and audio models in Settings. Keys are stored locally on the device.

## Prerequisites

- A recent Flutter SDK.
- Telegram API credentials from [my.telegram.org](https://my.telegram.org) → **API development tools**.
- An Android device or emulator for the supported Android workflow.

## Setup

1. Fetch dependencies:

   ```sh
   flutter pub get
   ```

2. Configure Telegram credentials using one of these methods.

   **Recommended for local development:** copy the tracked template, then fill in your values:

   ```powershell
   Copy-Item lib/core/config/telegram_api.example.dart lib/core/config/telegram_api.dart
   ```

   Edit the copied file and replace `apiId` and `apiHash`. The real config file is git-ignored and must never be committed.

   **For CI or local secret injection:** provide compile-time values instead:

   ```sh
   flutter run --dart-define=TELEGRAM_API_ID=123456 --dart-define=TELEGRAM_API_HASH=your_hash
   ```

   You can also use `--dart-define-from-file=telegram_api.json`. Keep that file outside version control; it is ignored by this project.

3. Start the app:

   ```sh
   flutter run
   ```

4. Sign in to Telegram, then open **Settings** to configure the AI provider and models.

## Optional service keys

These are added from the app’s Settings UI and remain local to the device.

| Service | Why you may add it |
| --- | --- |
| Vercel AI Gateway | Primary AI models and compatible image/audio models. |
| OpenRouter | Optional alternative model provider. |
| Exa | Enables the assistant’s web-search tool. |
| ElevenLabs | Optional voices and voice transcription. |

## Safety and privacy

- Telegram API credentials live only in your local config or build environment—never commit them.
- The assistant can read only the Telegram data available to the signed-in account.
- Writes and sensitive changes are presented for explicit approval before they are sent to Telegram.
- The app does not mark a chat as read simply because it is opened or queried.
- Tool availability is visible and configurable in **Settings → Tools**.

## Project layout

```text
lib/
  app/                     App shell and themes
  core/config/             Local and compile-time configuration
  infrastructure/telegram/ TDLib client, update receiver, security, rate limits
  features/auth/           Telegram sign-in flow
  features/telegram/       Chat store, Telegram tools, media, chat UI
  features/chat/           AI conversation state, tool loop, composer, result UI
  features/assistant/      Watches, notifications, proactive routines
  features/settings/       Providers, model selection, tools, personalization
  features/voice/          Recording, dictation, and speech support
```

## Validation

```sh
dart analyze
flutter test
```

`dart analyze` currently reports style-level lint information from the existing codebase; `flutter test` should pass before a change is merged.
