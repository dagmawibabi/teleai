import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:teleai/features/ai/data/gateway_client.dart';
import 'package:teleai/features/integrations/app_results.dart';
import 'package:teleai/features/settings/data/settings.dart';
import 'package:teleai/features/telegram/data/telegram_tools.dart';

void main() {
  test('tool names are unique and every app tool maps to a Composio slug', () {
    final names = [for (final t in telegramTools) t.name];
    expect(names.toSet().length, names.length);
    for (final name in appToolSlugs.keys) {
      expect(toolNamed(name), isNotNull, reason: name);
      expect(toolNamed(name)!.category.onAppsScreen, isTrue, reason: name);
    }
  });

  test('app tools are offered only with a key and a connection', () {
    final gmail = toolNamed('gmail_fetch_emails')!;
    final connect = toolNamed('connect_app')!;
    const none = AppSettings();
    const keyed = AppSettings(composioKey: 'ak_x');
    expect(appToolReady(gmail, none, {'gmail'}), isFalse);
    expect(appToolReady(gmail, keyed, {}), isFalse);
    expect(appToolReady(gmail, keyed, {'gmail'}), isTrue);
    expect(appToolReady(connect, keyed, {}), isTrue);
    expect(appToolReady(toolNamed('list_chats')!, none, {}), isTrue);
  });

  test('Gmail results become emails', () {
    final out = AppResults.summarize('gmail', 'GMAIL_FETCH_EMAILS', {
      'messages': [
        {
          'messageId': '18c5f5d1a2b3c4d5',
          'threadId': '18c5f5d1a2b3c4d5',
          'messageTimestamp': '2026-10-23T08:15:00Z',
          'labelIds': ['INBOX', 'UNREAD'],
          'sender': 'Ada Lovelace <ada@example.com>',
          'to': 'me@example.com',
          'subject': 'Engine notes',
          'messageText': '<p>Hello<br>there &amp; welcome</p>',
        },
      ],
      'nextPageToken': 'abc',
    });
    final emails = out['emails'] as List;
    expect(emails, hasLength(1));
    final e = emails.first as Map;
    expect(e['subject'], 'Engine notes');
    expect(e['from'], 'Ada Lovelace <ada@example.com>');
    expect(e['unread'], isTrue);
    expect(e['body'], 'Hello\nthere & welcome');
    expect(out['next_page'], 'abc');
  });

  test('JSON inside strings, Slack messages, events and Notion pages are found', () {
    final slack = AppResults.extract('SLACK_FETCH_CONVERSATION_HISTORY', jsonDecode(jsonEncode({
      'messages': [
        {'type': 'message', 'user': 'U1', 'text': 'Ship it *today*', 'ts': '1761200000.000100', 'reply_count': 2},
      ],
    })));
    expect((slack['messages'] as List).single['replies'], 2);

    final events = AppResults.extract('GOOGLECALENDAR_EVENTS_LIST', {
      'items': [
        {'id': 'e1', 'summary': 'Standup', 'start': {'dateTime': '2026-10-24T09:00:00+03:00'}, 'end': {'dateTime': '2026-10-24T09:15:00+03:00'}},
      ],
    });
    expect((events['events'] as List).single['title'], 'Standup');

    final notion = AppResults.summarize('notion', 'NOTION_SEARCH_NOTION_PAGE', {
      'response_data': jsonEncode({
        'results': [
          {
            'object': 'page',
            'id': 'p1',
            'url': 'https://www.notion.so/p1',
            'icon': {'type': 'emoji', 'emoji': '📘'},
            'properties': {
              'Name': {
                'type': 'title',
                'title': [{'plain_text': 'Roadmap'}],
              },
            },
          },
        ],
      }),
    });
    final page = (notion['pages'] as List).single as Map;
    expect(page['title'], 'Roadmap');
    expect(page['icon'], '📘');
  });

  test('Gemini tool schemas have no additionalProperties or empty objects', () {
    final tools = GatewayClient.geminiTools([
      toolNamed('run_app_tool')!.schema,
      toolNamed('notion_add_multiple_page_content')!.schema,
      toolNamed('list_chats')!.schema,
    ]);
    final text = jsonEncode(tools);
    expect(text.contains('additionalProperties'), isFalse);
    void walk(Object? node) {
      if (node is Map) {
        if (node['type'] == 'object' && node != (tools.first['function'] as Map)['parameters']) {
          expect((node['properties'] as Map?)?.isNotEmpty ?? false, isTrue, reason: '$node');
        }
        node.values.forEach(walk);
      } else if (node is List) {
        node.forEach(walk);
      }
    }

    for (final t in tools) {
      walk(((t['function'] as Map)['parameters'] as Map)['properties']);
    }
  });
}
