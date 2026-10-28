import 'package:flutter_test/flutter_test.dart';
import 'package:teleai/features/chat/data/chat_controller.dart';
import 'package:teleai/features/chat/data/chat_export.dart';
import 'package:teleai/features/chat/domain/chat_models.dart';
import 'package:teleai/features/settings/data/app_data.dart';
import 'package:teleai/features/share/share_intake.dart';

Conversation _chat() => Conversation(
  id: 'c1',
  title: 'Weekend plans',
  entries: [
    UserEntry(id: 'u1', text: 'What did Abel say?'),
    AssistantEntry(
      id: 'a1',
      model: 'gateway:test',
      steps: [
        ModelStep(
          text: 'He asked about [Hiking group](post:-100:5) on Saturday.',
          tools: [ToolPart(callId: 't1', name: 'read_messages', status: ToolStatus.done, result: '{}')],
        ),
      ],
    ),
    UserEntry(id: 'u2', text: 'And then?'),
    AssistantEntry(id: 'a2', steps: [ModelStep(text: 'Nothing else.')]),
  ],
);

void main() {
  test('Markdown export keeps the turns and turns post refs into names', () {
    final md = chatToMarkdown(_chat());
    expect(md, startsWith('# Weekend plans'));
    expect(md, contains('What did Abel say?'));
    expect(md, contains('He asked about Hiking group on Saturday.'));
    expect(md, isNot(contains('post:-100:5')));
    expect(md, contains('> Used read_messages'));
  });

  test('a transcript stops after the entry it is asked to', () {
    final t = ChatController.transcript(_chat(), upTo: 'a1');
    expect(t, contains('What did Abel say?'));
    expect(t, contains('(Assistant used: read_messages)'));
    expect(t, isNot(contains('And then?')));
  });

  test('a compacted conversation keeps its summary when saved', () {
    final c = _chat()
      ..summary = '- Abel asked about hiking'
      ..summaryUntil = 'a1';
    final back = Conversation.fromJson(c.toJson());
    expect(back.summary, '- Abel asked about hiking');
    expect(back.summaryUntil, 'a1');
    expect(Conversation.fromJson(_chat().toJson()).summary, isNull);
  });

  test('a full tool response survives saving, apart from the model\'s copy', () {
    final p = ToolPart(callId: 'x', name: 'gmail_fetch_emails', result: '{"emails":[]}', full: '{"messages":[1,2,3]}');
    final back = ToolPart.fromJson(p.toJson());
    expect(back.full, '{"messages":[1,2,3]}');
    expect(back.result, '{"emails":[]}');
  });

  test('a profile file says what it holds', () {
    final counts = AppData.describe({
      'format': AppData.format,
      'prefs': {'a': 1, 'b': true},
      'secrets': {'vercel_ai_gateway_key': 'k'},
      'files': {'conversations/x.json': '{}', 'content_canvas.json': '{}'},
    });
    expect(counts, containsPair('settings', 2));
    expect(counts, containsPair('keys', 1));
    expect(counts, containsPair('chats', 1));
  });

  test('shares from other apps are read from the channel map', () {
    final s = SharedPayload.fromMap({
      'kind': 'share',
      'text': ' Look at this ',
      'files': [
        {'path': '/cache/a.pdf', 'name': 'a.pdf'},
      ],
    });
    expect(s.selection, isFalse);
    expect(s.text, 'Look at this');
    expect(s.files, [('/cache/a.pdf', 'a.pdf')]);
    expect(SharedPayload.fromMap({'kind': 'selection', 'text': 'hi'}).selection, isTrue);
  });
}
