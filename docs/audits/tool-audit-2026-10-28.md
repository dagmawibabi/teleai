# Tool audit — 28 October 2026

**Scope:** all 419 tools in the runtime registry, including their descriptions, 1,409 parameter declarations, execution routing, helper implementations, availability rules, categories, chat cards and tool-call bottom sheets. Current placement: 203 Telegram, 195 Apps & web, 21 Device, across 29 categories. There are 179 approval-flagged tools, 36 destructive tools and two always-ask tools. Every declaration and execution entry was mapped, including shared Composio dispatch, SDK memory and controller-owned tools.

**Method and limits:** static source/AST review, runtime catalog export and five focused reproductions with fixture data. No live Telegram, Composio, ElevenLabs, Cloudflare, E2B or device actions were performed. Account-specific rights, native permissions and current external service behavior remain integration-test work. A mapped execution path is not a live-service pass. The preceding app changes were included in the reviewed working tree; this audit adds reports, not application fixes.

**Main finding:** the bottom sheets cannot currently show everything. Some data is discarded before rendering; more is hidden by rendering branches. Fix the shared result contract and renderer before adding hundreds of individual cards.

The accompanying inventory includes every tool, its complete documentation/schema, source references, proposed placement, relevant findings and additional bottom-sheet fields. Missing a targeted finding does not imply that a tool is healthy: shared findings apply conditionally across the catalog.

## Inventory files

[Complete 419-tool source/implementation/grouping inventory](D:/Projects/VibeCoded/teleai/teleai/teleai/docs/audits/tool-inventory-2026-10-28.md)

[CSV with full documentation and parameter schemas](D:/Projects/VibeCoded/teleai/teleai/teleai/docs/audits/tool-inventory-2026-10-28.csv)

[Full annotated JSON catalog](D:/Projects/VibeCoded/teleai/teleai/teleai/docs/audits/tool-catalog-2026-10-28.json)

## Findings

P1 denotes wrong operations, lost data or broken control contracts. P2 denotes material documentation, presentation, diagnostic or consistency problems. Recommendations are distinguished from observed behavior.

### F01 · P1 · App results are permanently reduced before reaching the UI

`AppResults` keeps at most 25 recognized records of each kind. It clips email bodies to 6,000 characters, Slack messages to 4,000, issue bodies to 3,000 and documents to 20,000; spreadsheet extraction stops at 200 rows × 30 columns. For a recognized response of 4,000+ characters it generally omits the original `data`. This loss does not consistently set `truncated`.

The mapper also drops entire field families: Notion database-row properties/schema, event attendee details/recurrence/timezones, mail attachment metadata and task project/assignee fields, among others. Raw JSON in the sheet is consequently often just the reduced result, not the original provider response.

**Reproduced:** a 30-issue response became 25 issues without original data or a truncation marker. **Fix:** persist complete provider data and derive a separate compact model summary. The user-facing sheet should browse/export the full data.

Evidence: [app_results.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/integrations/app_results.dart:11), [app_results.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/integrations/app_results.dart:28).

### F02 · P1 · Mixed results lose their scalar fields

The generic fallback collects only unhandled Map/List fields. Once any summary or collection is rendered, remaining scalars never reach the full structured fallback. Fields such as query, URL, cursor, warnings, totals, status and explanation can disappear.

For example, poll options can appear without the question, anonymous/closed state or explanation; R2 objects can appear without the cursor. **Reproduced:** a mixed result hid its pagination cursor. **Fix:** track consumed field paths, then render **every** remaining field, including scalars, after the specialized view.

Evidence: [tool_result_view.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/presentation/widgets/tool_result_view.dart:446), [tool_result_view.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/presentation/widgets/tool_result_view.dart:458).

### F03 · P1 · Generic success branches show wrong or incomplete results

The `saved == true` branch is not scoped to memory tools. Saved GIFs/stickers and private notes can show **“Remembered: null.”** Broad `done == true` branches reduce many operations to **“Done,”** hiding returned DNS records, poll choices, Stars/balance, privacy changes, folder IDs or story receipts. Story reactions can produce an “in null” label because the renderer expects a `chat` field.

**Reproduced:** the saved-GIF mislabel and a DNS update whose record vanished. **Fix:** dispatch success summaries by tool/result type and append the complete unconsumed result.

Evidence: [tool_result_view.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/presentation/widgets/tool_result_view.dart:149), [tool_result_view.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/presentation/widgets/tool_result_view.dart:228).

### F04 · P2 · Featured views suppress diagnostics and metadata

Early returns are used for errors, images, audio, overview, memories, watches, scheduled messages, topics, profiles and search. They bypass the remaining fields.

- An error hides accompanying HTTP status/headers/body, recovery notes and available caption languages.
- An image hides metadata such as statistics/sample counts and provenance.
- Audio shows playback and text/prompt but hides provider/model/voice/kind.
- Only `run_code` gets special treatment for all `created_files` in this sheet. An E2B result with several charts can display just the first image.
- Successful sends commonly collapse to a sentence, hiding returned refs, IDs and other receipts.

**Fix:** featured content plus a complete expandable remainder. Failures must retain diagnostics and partial outputs.

Evidence: [tool_result_view.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/presentation/widgets/tool_result_view.dart:30), [tool_result_view.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/presentation/widgets/tool_result_view.dart:47).

### F05 · P2 · Inline cards and tool-call sheets use different renderers

Main-chat cards use `richResultFor` and the app/cloud/device renderers; the call bottom sheet directly uses `ToolResultView`. Opening a call does not reuse the rich media, code cards, file browsers or other previews.

Rich inline cards also have hard list/text caps: examples include 40 apps/files, 60 DNS records/objects and 30 SMS/call/contact rows. Those are acceptable preview limits but must not become full-detail limits. **Fix:** share renderers with explicit compact/detail modes, lazy complete lists and a full-field remainder.

Evidence: [tool_card.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/presentation/widgets/tool_card.dart:473), [tool_card.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/presentation/widgets/tool_card.dart:1265).

### F06 · P2 · Canvas folders render as Telegram folders

`canvas_overview` returns folder ID, `path` and `items`. The `folders` renderer expects `title`, `chats` and `unread_chats`. **Reproduced:** a Canvas folder showed `null` and null counts while its real path was absent. **Fix:** separate typed Canvas/Telegram folder contracts and display all IDs, paths, descriptions, counts and saved-item data.

Evidence: [canvas_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/canvas/canvas_tools.dart:52), [tool_result_view.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/presentation/widgets/tool_result_view.dart:404).

### F07 · P1 · “Read-only” uses approval flags rather than actual effects

`TelegramTool.isOn` passes `requiresApproval` as the `writes` argument to read-only filtering. Real writes without that flag remain available: drafts, unread marks, saved GIFs/sticker favorites, Telegram private notes, bot-reply stopping, memory/Canvas changes, watches/reminders and sandbox reset. The tools page describes these as “Read-only.” `view_story` can also mark another person's story seen unless `peek` is true.

This does not mean every local write needs a permission prompt. It means effects and approval are different concepts. **Fix:** declare read/create/update/delete/paid/mark-seen effects separately, use them for read-only mode, and model argument-dependent effects such as story peeking.

Evidence: [settings.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/settings/data/settings.dart:400), [telegram_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_tools.dart:197), [telegram_manage_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_manage_tools.dart:445).

### F08 · P1 · Destructive variants bypass the destructive-tool controls

`e2b_reset_sandbox` loses variables/files but is on by default and requires no approval; `e2b_kill_sandbox` is destructive/off by default. `notion_update_row_database(delete_row: true)` archives a row through a normal update tool, bypassing the destructive switch/always-ask behavior. Canvas deletion is also outside that classification.

**Fix:** classify operation variants explicitly: reset/kill, delete-row/edit-row, folder deletion/moving its contents. Choose the desired local-deletion approval policy, but never label those operations reads.

Evidence: [e2b_reset_sandbox](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_cloud_tools.dart:84), [e2b_kill_sandbox](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_cloud_tools.dart:92), [notion_update_row_database](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_app_catalog.dart:3071), [canvas_delete_folder](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_canvas_tools.dart:91).

### F09 · P1 · Grouping incorrectly controls Telegram availability

- `list_attachments` is local, but Media requires Telegram, so it disappears when disconnected.
- `export_channel_summary` is Creative and not Telegram-gated, although it requires Telegram chat/history.
- `get_private_note` and `set_private_note` are Memory and not Telegram-gated, although they call TDLib.

**Fix:** per-tool prerequisites independent of UI grouping; allow argument-dependent requirements for mixed tools such as `view_image` and Canvas imports.

Evidence: [telegram_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_tools.dart:116), [chat_controller.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/data/chat_controller.dart:525), [list_attachments](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_tools.dart:1462), [export_channel_summary](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_analytics_tools.dart:8).

### F10 · P2 · Availability and approval labels can be false

Tool detail uses only the saved switch preference, then says **“The assistant can call this tool.”** Runtime additionally checks login, keys, app connections, platform, read-only mode and other dependencies. List counts likewise do not mean Ready now.

Labels derive from `requiresApproval` alone, omitting `alwaysAsk`, destructive rules, user approval mode and conditional read variants such as `bot_api`/`device_volume`. Numerous descriptions promise an unconditional approval although Never/watch auto-approval settings can bypass it.

**Fix:** separate Enabled preference from Ready/Blocked/Unavailable; show setup links and effective policy, including conditional reads and always-ask overrides.

Evidence: [tools_screen.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/settings/presentation/tools_screen.dart:505), [chat_controller.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/data/chat_controller.dart:677).

### F11 · P1 · Speech generation ignores selected ElevenLabs voice settings

`_generateAudio` handles Addis specially, then uses `settings.speechModel` and `settings.aiVoice` for every other engine. Read-aloud correctly selects the ElevenLabs model and `elevenVoiceId` when that engine is chosen. The tool advertised as using the selected voice can therefore use a different provider/voice or fail for an unrelated missing key. Device voice selection also has no defined downloadable-file path here.

**Fix:** share a resolved speech configuration with read-aloud; document whether device voice supports creating a downloadable file.

Evidence: [chat_controller.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/data/chat_controller.dart:1357), [speaker.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/voice/speaker.dart:186).

### F12 · P1 · E2B/R2 downloads can overwrite earlier conversation files

Both save into `generated/<last path component>`. Different objects named `report.pdf` or `chart.png` overwrite the same stored file. An older conversation can later open or send newer content under its old attachment.

**Fix:** unique storage paths per download; retain original display name, source bucket/sandbox/key/path, MIME, bytes and hash in metadata.

Evidence: [telegram_cloud_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_cloud_tools.dart:453), [telegram_cloud_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_cloud_tools.dart:739).

### F13 · P1 · Permanent bans are clamped to one day

`ban_member` documents `days: 0` as forever. It calls `_int(... fallback: 0, max: 366)` without `min: 0`; `_int` defaults to minimum 1. Both omitted duration and explicit zero reach `banMember` as 1. The same helper usage also changes background dimming 0 to 1, a minor separate effect.

**Fix:** preserve zero and verify missing/0/1/boundary cases.

Evidence: [telegram_destructive_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_destructive_tools.dart:247), [telegram_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_tools.dart:1614).

### F14 · P1 · Privacy changes can reset an unrelated Stars price

`set_privacy(setting: new_chats)` constructs `NewChatPrivacySettings` with `incomingPaidMessageStarCount: 0`. This field is neither exposed in the request nor preserved from current settings. Changing whether strangers may contact the user can also remove the existing incoming-message price.

**Fix:** preserve unrelated settings, or explicitly expose and confirm the additional change.

Evidence: [telegram_account_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_account_tools.dart:308).

### F15 · P2 · Done does not reliably mean successful

The controller marks failure only for a top-level `error`. E2B execution errors are serialized as `exception`, and shell failures use nonzero `exit_code`; both can get a Done status. There is no common partial-success representation.

**Fix:** explicit success/failed/partial/cancelled outcomes with error and exit-code semantics. Keep logs and artifacts even when execution fails.

Evidence: [chat_controller.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/data/chat_controller.dart:814), [e2b_session.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/integrations/e2b_session.dart:53).

### F16 · P2 · Stop often means stop waiting

The common wrapper races work against a completer. Cancellation is wired for selected paths—on-device code, browser engines and the new creative-audio tokens—but not for E2B calls and most network operations. A stopped E2B execution can continue running/changing state.

**Fix:** expose cancellation capability and acknowledgement, wire supported tokens/interrupts, and distinguish stopping the wait from stopping the operation. Do not suggest an already-sent action was undone.

Evidence: [chat_controller.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/data/chat_controller.dart:365), [chat_controller.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/data/chat_controller.dart:802), [e2b_session.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/integrations/e2b_session.dart:246).

### F17 · P2 · Pagination and search coverage are inconsistent

App summarization recognizes only selected cursor keys, missing structures such as Linear `page_info`/`pageInfo` and Graph next links when original data is omitted. `list_calls` drops its helper's next offset. Several Telegram collections use a fixed first page without a continuation input, including poll voters and some story/subscription/invite-link paths. Cloudflare uses fixed limits and removes useful envelope metadata.

**Fix:** always retain returned count, total/unknown, cursor/page/has-more, limit and skipped/error coverage. Offer continuation where supported; label source limits where it is not.

Evidence: [app_results.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/integrations/app_results.dart:36), [telegram_activity_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_activity_tools.dart:118), [telegram_tools_more.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_tools_more.dart:170).

### F18 · P2 · Documentation and schemas disagree

- Gmail send advertises attachments, but the built-in schema cannot accept them.
- Drive sharing docs refer to `role` and `type`, neither of which is exposed.
- DNS update implementation reads `priority`, but the input schema omits it.
- `data_usage(reset: true)` is advertised but always returns an instruction to use Settings.
- `set_member_tag` refers to nonexistent `get_members` instead of `list_members`.
- `edit_chat_info` describes `photo` as the parameter, while the schema/implementation use `file`.

**Fix:** update descriptions, schema and behavior together; add missing inputs only when actually supported.

Evidence: [gmail_send_email](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_app_catalog.dart:310), [googledrive_add_file_sharing_preference](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_app_catalog.dart:2027), [cloudflare_update_dns_record](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_cloud_tools.dart:190), [telegram_more_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_more_tools.dart:731), [set_member_tag](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_admin_tools.dart:204), [edit_chat_info](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_admin_tools.dart:234).

### F19 · P2 · Parameter documentation is incomplete and partially hidden

Of 1,409 top-level parameters, **586 lack descriptions**, affecting **249 tools**. The details page shows only name/type/required/description/top-level enum; at least **126 parameters** contain additional schema information it does not render, including nesting/items/defaults/bounds/formats.

Five tools are explicitly deprecated in the checked-in generated catalog: `googledrive_parse_file`, `googledrive_add_file_sharing_preference`, `slack_set_status`, `slack_leave_a_conversation`, `todoist_close_task`. Their advertised replacements are not equivalent built-in entries here. This is a checked-in catalog observation, not a live-service deprecation check.

**Fix:** regenerate/migrate the affected schemas. Document defaults, units, limits, conditional requirements, ID sources and examples. Add output contracts; `TelegramTool` currently has no per-tool output schema.

Evidence: [tools_screen.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/settings/presentation/tools_screen.dart:545), [telegram_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_tools.dart:164), [telegram_app_catalog.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_app_catalog.dart:4).

### F20 · P2 · Cost, provider and execution location are conflated

`web_search` inherits Telegram-request cost despite calling paid Exa. The schema does not separately express provider/key, location and billing meter. Speech/Addis/SFX/music generation lack the usage-recording path used by image generation; absent billing data should remain unknown rather than imply free usage.

The bottom sheet also labels result-size/4 as estimated tokens sent to the model, without measuring tokenization, wrappers or image tokens. **Fix:** separate provider, execution location and metering; label actual/estimated/unknown cost and rough text estimates precisely.

Evidence: [web_search](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_tools.dart:743), [chat_controller.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/data/chat_controller.dart:1312), [chat_controller.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/data/chat_controller.dart:1384), [tool_card.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/presentation/widgets/tool_card.dart:1309).

### F21 · P2 · Free-copy search can turn source failures into a false conclusion

`find_free_copy` swallows individual provider exceptions and, if no records remain, says no legal free copy was found and suggests copyright as the likely cause. If all sources failed, that conclusion was not established.

**Fix:** retain per-source success/failure and coverage; distinguish unavailable/partial search from a successful search with no matching results. Apply the same reporting to multi-source book searches.

Evidence: [telegram_discover_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_discover_tools.dart:461).

### F22 · P2 · Image inspection lacks source, decode and failure details

Inspection requires a vision model, accessible input and decoder support. Current input limit is 20 MB; normalized output uses the first animation frame and a target width of 2,048. Telegram photos are selected at up to 1,280 px; GIF/video/sticker paths often use thumbnails.

The controller replaces per-source exceptions with “could not load as an image,” discarding HTTP, size and decoder reasons. Inputs beyond six successes are skipped without per-input status.

**Fix:** document limits and show source versus inspected image, original/decoded dimensions, bytes/format/frame, precise errors, loaded/skipped counts and access to the original. Do not imply that all animation frames or full videos were inspected.

Evidence: [image_input.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/data/image_input.dart:18), [chat_controller.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/chat/data/chat_controller.dart:1067), [telegram_media_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_media_tools.dart:131).

### F23 · P2 · Categories mix incompatible organizing principles

Actions is a 59-tool catch-all, while writes also live in Account/Chats/Messages/Folders and app categories. Memory mixes long-term memory, Canvas and remote Telegram notes. Creative mixes generation, inspection, ZIPs and Telegram analytics. Discovery's label excludes its music/film/TV capabilities.

**Fix:** group by domain; use execution location, provider and effects as badges/filters. The regrouping table preserves the requested Apps & web placement for creative generation.

Evidence: [telegram_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_tools.dart:82), [tools_screen.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/settings/presentation/tools_screen.dart:18).

### F24 · P1 · Partial mutations lose completed-step evidence

`r2_delete` deletes objects one by one but returns the deleted list only if all succeed. A later exception produces only “Cloudflare: …”, hiding what was already deleted. Multi-field profile/chat updates similarly perform separate requests before returning a final receipt. Failure does not roll back earlier operations.

**Fix:** collect per-field/per-target receipts as steps finish; return completed, failed and not-attempted states, with clear retry behavior. Display partial success rather than only a failure sentence.

Evidence: [telegram_cloud_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_cloud_tools.dart:770), [telegram_account_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_account_tools.dart:347), [telegram_manage_tools.dart](D:/Projects/VibeCoded/teleai/teleai/teleai/lib/features/telegram/data/telegram_manage_tools.dart:792).

## What “show everything” should mean

Keep **complete provider/native response**, **complete user-facing result** and **compact model-facing summary** separate. Persist the original response as an artifact with explicit secret redaction. The sheet must expose all data actually obtained with lazy loading, search, copy and export. A summary must not overwrite its source. Fetching further upstream pages is an explicit continuation action; unavailable/unreturned fields must not be fabricated.

Every call should show:

1. **Overview:** actual outcome including partial/cancelled, provider/account, names and IDs, full start/finish dates and timezone, duration, effective approval and approved content, cancellation/retry state, actual/estimated/unknown cost.
2. **Inputs:** complete original and effective arguments, defaults and resolved file names/paths/URLs; expandable text/code and nested structures, beyond three-line chips.
3. **Result:** rich content and every unconsumed field; complete retained lists/text/files, returned/total/remaining counts and open/download/share actions.
4. **Diagnostics:** request IDs, status/reason, provider errors, retry/rate-limit information, coverage, skipped items, permissions and partial failures.
5. **All fields / raw / export:** complete preserved user result and original response, with the model summary labeled separately. Explicit redaction is not silent truncation.

## Data to expose by family — all 419 tools

Show these fields when returned or available through a documented follow-up. This is not a promise that every provider returns every field on its first request.

| Family | Tools | Complete bottom-sheet data |
|---|---:|---|
| account | 22 | Full profile/user IDs; device/session IDs, IP/location, app/system, exact dates/timezone and current/official flags; every privacy rule/exception; health checks/reasons; storage and network counters with exact byte values. |
| chats | 32 | Chat IDs/types, full bio/description/links, rights and membership, unread/mention counts, topics/pins/activity; member roles/rights/inviters/join dates; invite rules/expiry; admin-log payloads and complete statistics with sample window/limits. |
| messages | 25 | Full text/caption/rich entities, sender/chat/message IDs and names, exact sent/edited/read dates, replies/quotes/threads, forwards/reactions/views, media/file metadata, links, poll options/voters/explanation and continuation. |
| media | 15 | All retained media/GIF/sticker items with IDs/refs, previews/playback/downloads, MIME/bytes/dimensions/duration, set/emoji metadata, original file access and continuation. Separate local attachments from Telegram collections. |
| actions | 59 | Targets by name and ID, exact approved text/files and resolved inputs, before/after where available, per-target receipts/new IDs/links, schedule, and every completed/failed/not-attempted step with partial-failure evidence. |
| web | 15 | Requested/final URL, redirects, HTTP status/reason and complete headers/body; readable/full text/highlights, offsets/continuation, browser page/elements, forms/scripts, screenshot dimensions, console/network data and error/retry/coverage details. |
| memory | 16 | Memory ID/content/tags/created/updated; Canvas folder ID/path/description/counts and complete saved-item source/text/file metadata; move/delete/export receipts. Telegram contact notes need their own result contract. |
| automation | 13 | Full watch/reminder/job IDs, scopes and target chats/apps, query/instructions, enabled/paused, trigger/schedule/timezone, next/last run, notifications, background requirements, last error and linked conversation; full brief and coverage window. |
| creative | 8 | Every output file with playback/open/download/share; prompt/provider/model/voice/language, requested and actual duration, MIME/bytes/dimensions/aspect/loop/influence, known usage/cost, creation time/provenance. Inspection: per-source result/error, decoded dimensions/frame and skipped counts. |
| stars | 7 | Exact Stars amount/balance, transaction IDs/date/direction/type/counterparty, subscription ID/price/renewal/cancellation, paid-reaction totals/supporters/anonymous state, revenue/conversion source and continuation. |
| developer | 9 | Repository/ref/path and IDs; complete README/files/diffs/commit messages/comments/releases/assets, counts/rate limits/continuation. Code: exact input, full stdout/stderr/results/traceback, runtime/environment and every output artifact. |
| stories | 7 | Story/poster IDs, dates/expiry, full caption/entities, photo/video metadata and preview, privacy/profile state, views/reactions/forwards/viewers, mark-seen effect, action receipts and continuation. |
| folders | 7 | Folder IDs/name/icon/color, included/excluded/pinned chat IDs plus names, all rule flags, share/invite links and limits, and exact create/update/delete/reorder receipts. Use separate Canvas folders. |
| discover | 18 | All source IDs/URLs and source-success coverage; full books/editions/authors/licensing/formats/covers, captions/chapters/languages/playlists, X posts/quotes/media, music/previews/albums/artists, films/TV cast/seasons/episodes and continuation. |
| gmail | 21 | Full mail/thread IDs, all recipients including Cc/Bcc, subject, complete text/HTML/headers, labels/read/star state, dates, attachment IDs/MIME/bytes/download state, account identity, draft/send receipts and pagination. |
| outlook | 10 | Full mail/attachments/headers/folder/category/importance/recipients/HTML; complete event body/organizer/attendees/RSVP/recurrence/original timezone/meeting data, account identity, Graph continuation and receipts. |
| calendar | 8 | Calendar/event IDs/names, complete description, start/end/original timezone/all-day, attendees/RSVP/organizer, recurrence/exceptions, conference/reminders, free-busy intervals/errors, links and next/sync tokens. |
| googleDocs | 16 | Drive file IDs/path/MIME/bytes/owners/permissions/sharing/modified; full Docs content across tabs/tables/headers/footers; all Sheets rows/columns/value types/formulas/ranges, changes/receipts and continuation. |
| slack | 17 | Workspace/channel/message/user IDs and resolved names, full text/blocks/files, exact times/edits, threads/replies, all reactions/counts, permalinks, topic AND purpose, membership/privacy, reminders/status and cursors. |
| notion | 14 | Database/data-source schema and every row property, page/block content, relation/people/date/status fields, parent/icon/cover, authors/timestamps/archive state, comments, action receipts and cursor/has_more. |
| githubAccount | 9 | Full issue/PR/repository IDs/URLs, body/comments/authors/assignees/labels/milestones/state/timestamps, head/base SHA and merge details, reviews/checks/files when fetched, notification reason/read state and pagination. |
| linear | 9 | Issue ID/identifier/team/project/state, complete body/priority/estimate/cycle/due/assignees/labels, comments/attachments/subscribers/timestamps, team/project metadata and all page_info/pageInfo. |
| todoist | 7 | Task/project/section/parent/assignee IDs, full content/body/priority/labels, due/deadline/timezone/recurrence/duration, completion/archive state/URLs, project metadata, action receipts and cursors. |
| apps | 4 | All connected/pending accounts/aliases/status, connection instructions/button; full discovered action slug/name/toolkit/version and nested schema/defaults/enums/constraints; complete executed response and provider diagnostics. |
| e2b | 8 | Sandbox/template/run/execution IDs, exact code/command/cwd/environment, complete stdout/stderr/MIME results/traceback, semantic outcome/exit code, every chart/file, runtime/lifecycle/expiry/history and file transfer/listing metadata. |
| cloudflare | 14 | Account/zone/resource IDs; complete DNS TTL/proxy/priority/comments/tags/dates; Workers/Pages/deployments/domains/stages; KV value/metadata; before/after and provider errors/messages/result_info pagination. |
| r2 | 8 | Bucket/prefix/key, complete objects with exact bytes/MIME/ETag/modified, folder/returned/total/truncated/cursor state, destination/provenance, upload/overwrite/delete receipts and signed-link creation/expiry. |
| device | 21 | Every native field: specs/security/uptime, battery/thermal/power state, network interfaces/all DNS, all apps, full SMS/calls/contacts and all numbers, exact dates/durations, platform/permission prerequisites and actual action/fallback result. |

## Important current limits

| Layer | Limit or behavior | What to change |
|---|---|---|
| App normalization | 25 records/kind; clipped bodies/docs; 200 × 30 table extraction | Retain full response, limit model summary, show totals/truncation |
| Telegram lists | Message text normally clipped at 1,200 chars; `get_message` restores full text | Identify previews; expose complete text in detail |
| Arguments | Human-readable chips capped at three lines | Expand/copy full text and nested input |
| E2B | Code 20,000 chars, stdout 12,000, stderr/traceback 6,000, text results 8,000 | Preserve exact code and complete logs as artifacts |
| Local code | Output 12,000 chars, error 4,000 | Preserve full logs/errors separately from previews |
| HTTP | Header allowlist; large bodies clipped; HTML may become readable text | Preserve original headers/body plus readable view |
| Discovery/GitHub | Transcript 30,000 chars; commit first 60 files and 1,500-char patches; playlist feed latest 15 | Full-content/continuation paths and explicit source coverage |
| Rich inline cards | Numerous list and line caps | Keep previews compact; full sheets expose every retained item |
| Image inspection | Six successes, 20 MB, normalized first frame; width target 2,048; Telegram photo/thumbnail limits | Per-input status and inspected-image properties |

## What the tools page should show

**List row:** plain-language name, concrete purpose, domain subgroup, enabled preference, Ready/Blocked/Unavailable reason and setup link, provider/account, local/network execution, read/create/write/delete/paid badges, effective approval and billing meter. The technical function ID should be secondary and searchable. Prefer **Ready X / Enabled Y / Total Z** over implying enabled means available.

**Detail page:**

- Purpose, realistic input/output examples and unsupported uses.
- Current login/key/account/alias, OS/model/permission/admin/Premium prerequisites and missing setup.
- Actual effects, mark-read/seen behavior, data destination, reversibility, overwrite and partial-failure behavior.
- Effective approval policy, user setting, destructive/always-ask overrides and conditional reads.
- Complete nested schema, defaults, units, bounds, formats/enums, required combinations, ID sources and pagination.
- Output fields, units/null meaning, counts, file locations, preview/full-content distinction and follow-up paths.
- Provider, execution location and cost meter separately; actual/estimated/unknown billing.
- Timeout, cancellation support, retry/idempotency, limitations and useful last error.
- Provider/schema version, documentation link and deprecation/replacement status.

## Grouping fixes

Keep **Telegram / Apps & web / Device** at the top level. Creative generation stays in Apps & web. Use prerequisites and effects independently from grouping.

| Current placement | Suggested placement | Reason |
|---|---|---|
| Four memory tools in Telegram / Memory | Apps & web / Memory | App-wide conversation memory, independent of Telegram |
| Ten `canvas_*` tools in Telegram / Memory | Apps & web / Canvas | Separate saved-content feature including non-Telegram data |
| Thirteen Automation tools in Telegram | Apps & web / Automation & briefs | Covers apps, schedules, reminders and saved briefs; Telegram only for relevant scopes |
| `get_private_note`, `set_private_note` in Memory | Telegram / Contacts & profile | Telegram contact notes, with correct Telegram prerequisite |
| `list_attachments` in Telegram / Media | Apps & web / Files | Local conversation files; fix login gating |
| `zip_files` in Creative | Apps & web / Files | Packaging rather than generation |
| `view_image` in Creative | Apps & web / Images & vision, or Creative / Inspect | Inspection rather than generation; Telegram only for refs |
| `export_channel_summary` in Creative | Telegram / Analytics | Telegram statistics/export dependency |
| `run_code` in Apps & web / Code & GitHub | Device / Code sandbox, or Code with an On-device badge | Distinguish local sandbox from E2B and GitHub HTTP |
| `list_chat_folders`, `add_chat_to_folder` in Chats | Telegram / Folders | Same domain as folder create/edit/share |
| Sixteen bot tools across Account/Chats/Messages/Actions | Telegram / Bots | BotFather, ownership, buttons, inline queries, commands and connected bots together |
| Discovery label “Books, YouTube & X” | Discovery: books, video, music, film & X | Existing label omits seven music/film/TV tools |
| Fifty-nine tools in Actions | Domain groups with Action/Destructive badges | Consistent with reads/writes already mixed elsewhere |

Actions examples: sends/replies/edits/reactions/polls → Messages; promote/restrict/ban/permissions → Members & admin; join/leave/invites/chat setup → Chats & admin; contact changes → Contacts; stickers/GIFs/background → Media/appearance; bot operations → Bots; group-call control → Calls & live streams. The inventory proposes a placement for every tool.

## Verification and suggested order

[Reproduction harness](D:/Projects/VibeCoded/teleai/teleai/teleai/docs/audits/tool-audit-reproductions.dart). Run `flutter test --no-pub docs/audits/tool-audit-reproductions.dart` from the app directory. These checks intentionally demonstrate the current defects; reverse their expectations when fixing them.

The runtime export identified 419 tools; every definition and execution entry was mapped. Five reproductions passed: saved-GIF mislabel, hidden DNS record, hidden scalar cursor, Canvas folder mismatch and silent app-result/pagination loss. These assert the current defective behavior as audit evidence, not desired regression expectations. No live account reads, paid generation or remote mutations were used.

1. Preserve complete results and introduce effect/dependency/outcome metadata. Fix permanent-ban duration, privacy-price reset, filename collisions and speech configuration.
2. Fix shared bottom-sheet dispatch, unconsumed fields, full-list/full-text access and consistent rich/detail modes.
3. Correct read-only/destructive/readiness controls; preserve partial-failure and cancellation evidence.
4. Repair/regenerate schemas and docs, expose output contracts and apply grouping changes.
5. Verify provider fixtures and then account/platform-dependent paths with suitable integration tests. A route existing must not be treated as proof of correctness.

