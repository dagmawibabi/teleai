import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:teleai/features/ai/data/model_catalog.dart';
import 'package:teleai/features/assistant/watches.dart';
import 'package:teleai/features/usage/usage.dart';
import 'package:teleai/features/chat/domain/chat_models.dart';
import 'package:teleai/infrastructure/telegram/rate_limiter.dart';
import 'package:teleai/features/telegram/presentation/formatted_text.dart';
import 'package:teleai/features/voice/speaker.dart';
import 'package:teleai/features/settings/data/settings.dart';
import 'package:teleai/features/telegram/data/telegram_tools.dart';
import 'package:teleai/features/canvas/canvas_store.dart';
import 'package:teleai/infrastructure/telegram/telegram_exception.dart';

void main() {
  group('RateLimiter', () {
    test('lets a burst through, then paces', () async {
      final limiter = RateLimiter(capacity: 3, refillEvery: const Duration(milliseconds: 100));
      final watch = Stopwatch()..start();
      for (var i = 0; i < 3; i++) {
        await limiter.acquire();
      }
      expect(watch.elapsedMilliseconds, lessThan(60));
      await limiter.acquire();
      expect(watch.elapsedMilliseconds, greaterThanOrEqualTo(80));
    });

    test('a flood wait pauses everyone', () async {
      final limiter = RateLimiter(capacity: 5, refillEvery: const Duration(milliseconds: 10));
      limiter.floodWait(0);
      expect(limiter.pausedUntil, isNotNull);
      final watch = Stopwatch()..start();
      await limiter.acquire();
      expect(watch.elapsedMilliseconds, greaterThanOrEqualTo(900));
    });
  });

  test('flood wait seconds are read from the error', () {
    const e = TelegramException(429, 'Too Many Requests: retry after 35');
    expect(e.isFloodWait, isTrue);
    expect(e.retryAfterSeconds, 35);
    expect(const TelegramException(420, 'FLOOD_WAIT_7').retryAfterSeconds, 7);
  });

  test('catalogs merge with models.dev details', () {
    final gateway = jsonEncode({
      'data': [
        {
          'id': 'anthropic/claude-x',
          'name': 'Claude X',
          'type': 'language',
          'owned_by': 'anthropic',
          'context_window': 200000,
          'pricing': {'input': '0.000003', 'output': '0.000015'},
          'tags': ['tool-use'],
        },
        {'id': 'bfl/flux', 'type': 'image'},
      ],
    });
    final dev = jsonEncode({
      'vercel': {
        'models': {
          'anthropic/claude-x': {'reasoning': true, 'tool_call': true, 'knowledge': '2026-03', 'release_date': '2026-05-01'},
        },
      },
    });
    final openRouter = jsonEncode({
      'data': [
        {
          'id': 'openai/gpt-x:free',
          'name': 'OpenAI: GPT X',
          'context_length': 128000,
          'architecture': {'input_modalities': ['text', 'image'], 'output_modalities': ['text']},
          'pricing': {'prompt': '0', 'completion': '0'},
          'supported_parameters': ['tools'],
        },
      ],
    });
    final models = mergeCatalogs((gateway, dev, openRouter));
    expect(models.map((m) => m.id), ['anthropic/claude-x', 'bfl/flux', 'or:openai/gpt-x:free']);
    expect(models.where((m) => m.fits(ModelKind.text)).map((m) => m.id), ['anthropic/claude-x', 'or:openai/gpt-x:free']);
    expect(models.where((m) => m.fits(ModelKind.image)).map((m) => m.id), ['bfl/flux']);
    final claude = models.first;
    expect(claude.inputPrice, closeTo(3, 1e-9));
    expect(claude.reasoning && claude.toolCall, isTrue);
    expect(claude.knowledge, '2026-03');
    final gpt = models.last;
    expect(gpt.fits(ModelKind.transcription), isFalse);
    expect(gpt.name, 'GPT X');
    expect(gpt.isFree && gpt.vision && gpt.toolCall, isTrue);
  });

  test('a send left waiting for approval reloads as declined', () {
    final c = Conversation(id: 'c1', entries: [
      AssistantEntry(id: 'a', steps: [
        ModelStep(tools: [ToolPart(callId: 'x', name: 'send_message', status: ToolStatus.awaitingApproval)]),
      ]),
    ]);
    final back = Conversation.fromJson(jsonDecode(jsonEncode(c.toJson())));
    final part = (back.entries.single as AssistantEntry).steps.single.tools.single;
    expect(part.status, ToolStatus.denied);
  });

  test('read-aloud text drops markdown and post links, and splits into parts', () {
    final words = Speaker.clean('**Hi** there. See [Tech News](post:-100:5)!\n- one\n- two');
    expect(words, 'Hi there. See Tech News!\none\ntwo');
    final parts = Speaker.chunk(List.filled(40, 'A short sentence.').join(' '), size: 100);
    expect(parts.length, greaterThan(5));
    expect(parts.every((p) => p.length <= 120), isTrue);
  });

  test('voice waveforms unpack 5-bit samples', () {
    expect(decodeWaveform('H8AS/GE=', bars: 8), [31, 0, 16, 5, 1, 30, 7, 12]);
    expect(decodeWaveform('', bars: 4), [4, 4, 4, 4]);
  });

  test('watches survive a save and load', () {
    final w = Watch(
      id: 'w1',
      name: 'DMs',
      scope: WatchScope.allDms,
      mode: WatchMode.act,
      instructions: 'Reply politely',
      includeMuted: false,
      createdAt: DateTime(2026, 10, 23),
    );
    final back = Watch.fromJson(jsonDecode(jsonEncode(w.toJson())));
    expect(back.scope, WatchScope.allDms);
    expect(back.mode, WatchMode.act);
    expect(back.instructions, 'Reply politely');
    expect(back.includeMuted, isFalse);
    expect(back.describe()['trigger'], 'allDms');
  });

  test('watch events and auto-approved calls are kept', () {
    final c = Conversation(id: 'c', entries: [
      UserEntry(id: 'u', text: 'New messages', event: 'DMs'),
      AssistantEntry(id: 'a', steps: [
        ModelStep(tools: [ToolPart(callId: 'x', name: 'send_message', status: ToolStatus.done, autoApproved: true)]),
      ]),
    ]);
    final back = Conversation.fromJson(jsonDecode(jsonEncode(c.toJson())));
    expect((back.entries.first as UserEntry).event, 'DMs');
    expect((back.entries.last as AssistantEntry).steps.single.tools.single.autoApproved, isTrue);
  });

  test('list prices count cached input at the cached rate', () {
    const m = ModelInfo(id: 'a/b', name: 'B', provider: 'a', inputPrice: 3, outputPrice: 15, cacheReadPrice: 0.3);
    // 1M input of which 400K cached, 100K output.
    final cost = UsageStore.listPrice(m, 1000000, 100000, 400000);
    expect(cost, closeTo(0.6 * 3 + 0.4 * 0.3 + 0.1 * 15, 1e-9));
    final e = UsageEvent.fromJson(
      UsageEvent(at: DateTime(2026), model: 'a/b', modality: Modality.image, units: 1, cost: 0.04, estimated: true).toJson(),
    );
    expect(e.modality, Modality.image);
    expect(e.estimated, isTrue);
  });

  group('Tools', () {
    test('names are unique', () {
      final names = [for (final t in telegramTools) t.name];
      expect(names.toSet().length, names.length);
    });

    test('destructive tools start off and always ask', () {
      const s = AppSettings();
      for (final t in telegramTools.where((t) => t.destructive)) {
        expect(t.isOn(s), isFalse, reason: t.name);
        expect(t.requiresApproval, isTrue, reason: t.name);
      }
      expect(telegramTools.any((t) => t.destructive), isTrue);
    });

    test('read-only mode keeps only reading tools', () {
      final s = const AppSettings().copyWith(readOnlyMode: true);
      for (final t in telegramTools) {
        expect(t.isOn(s), !t.requiresApproval && !t.destructive, reason: t.name);
      }
    });

    test('forward targets merge to_chat_id and to_chat_ids', () {
      expect(TelegramToolRunner.forwardTargets({'to_chat_id': 1, 'to_chat_ids': [2, 1, '3']}), [1, 2, 3]);
    });
  });

  group('Canvas', () {
    test('folders resolve by name and path', () {
      final now = DateTime(2026);
      final a = CanvasFolder(id: 'a', name: 'News', createdAt: now);
      final b = CanvasFolder(id: 'b', name: 'AI', parentId: 'a', createdAt: now);
      final s = CanvasState(folders: [a, b], loaded: true);
      expect(s.find('news')?.id, 'a');
      expect(s.find('News/AI')?.id, 'b');
      expect(s.pathOf(b), 'News / AI');
      expect(s.find('b')?.name, 'AI');
    });
  });
}
