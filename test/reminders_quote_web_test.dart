import 'package:flutter_test/flutter_test.dart';
import 'package:handy_tdlib/api.dart' as td;
import 'package:teleai/features/assistant/reminders.dart';
import 'package:teleai/features/telegram/data/message_content.dart';
import 'package:teleai/features/telegram/data/telegram_tools.dart';
import 'package:teleai/features/web/web_fetch.dart';

void main() {
  group('Cron', () {
    final from = DateTime(2026, 10, 23, 14, 7); // a Friday

    test('every 30 minutes', () {
      expect(Cron.parse('*/30 * * * *').nextAfter(from), DateTime(2026, 10, 23, 14, 30));
    });

    test('weekdays at 9 skips the weekend', () {
      expect(Cron.parse('0 9 * * 1-5').nextAfter(from), DateTime(2026, 10, 26, 9, 0));
    });

    test('Sundays by name, and 7 as Sunday', () {
      expect(Cron.parse('0 20 * * sun').nextAfter(from), DateTime(2026, 10, 25, 20, 0));
      expect(Cron.parse('0 20 * * 7').nextAfter(from), DateTime(2026, 10, 25, 20, 0));
    });

    test('day of month or weekday when both are given', () {
      // The 1st, or any Monday: Monday the 26th comes first.
      expect(Cron.parse('0 8 1 * 1').nextAfter(from), DateTime(2026, 10, 26, 8, 0));
    });

    test('aliases and month rollover', () {
      expect(Cron.parse('@monthly').nextAfter(from), DateTime(2026, 11, 1));
      expect(Cron.parse('0 0 1 jan *').nextAfter(from), DateTime(2027, 1, 1));
    });

    test('bad expressions are refused', () {
      expect(() => Cron.parse('0 9 * *'), throwsFormatException);
      expect(() => Cron.parse('61 * * * *'), throwsFormatException);
      expect(() => Cron.parse('*/0 * * * *'), throwsFormatException);
    });

    test('described for people', () {
      expect(Cron.describe('0 9 * * 1-5'), 'weekdays at 09:00');
      expect(Cron.describe('*/15 * * * *'), 'every 15 minutes');
    });

    test('a reminder survives a round trip', () {
      final r = Reminder(id: 'abc', text: 'Walk', next: from, cron: '0 9 * * *', prompt: 'x', createdAt: from);
      final back = Reminder.fromJson(r.toJson());
      expect(back.describe(), r.describe());
      expect(back.isJob, isTrue);
    });
  });

  group('buildQuote', () {
    td.FormattedText text(String s, [List<td.TextEntity> e = const []]) => td.FormattedText(text: s, entities: e);

    test('exact excerpts keep their position', () {
      final q = buildQuote(text('We are launching TryTestr today!'), 'launching TryTestr')!;
      expect(q.text.text, 'launching TryTestr');
      expect(q.position, 7);
    });

    test('non-breaking spaces, line breaks, curly quotes and case are forgiven', () {
      final body = 'We are officially\nlaunching “TryTestr” 🎉 today';
      final q = buildQuote(text(body), 'we are officially launching "TryTestr" 🎉')!;
      // The quote is cut from the message itself, so Telegram accepts it.
      expect(q.text.text, body.substring(0, body.indexOf(' today')));
      expect(q.position, 0);
    });

    test('quote marks or an ellipsis around the excerpt are dropped', () {
      final q = buildQuote(text('Good eyes deserve good rewards.'), '"good rewards…"')!;
      expect(q.text.text, 'good rewards');
    });

    test('formatting over the excerpt comes along, clipped; links do not', () {
      final body = 'Hello bold world and a link';
      final q = buildQuote(
        text(body, [
          const td.TextEntity(offset: 6, length: 4, type: td.TextEntityTypeBold()),
          const td.TextEntity(offset: 23, length: 4, type: td.TextEntityTypeUrl()),
        ]),
        'bold world and a link',
      )!;
      expect(q.position, 6);
      expect(q.text.entities, hasLength(1));
      expect(q.text.entities.single.offset, 0);
      expect(q.text.entities.single.length, 4);
    });

    test('text that is not there gives no quote', () {
      expect(buildQuote(text('Something else entirely'), 'not in it'), isNull);
    });

    test('long quotes are capped', () {
      final body = List.filled(400, 'word').join(' ');
      final q = buildQuote(text(body), body)!;
      expect(q.text.text.length, lessThanOrEqualTo(1024));
      expect(body.startsWith(q.text.text), isTrue);
    });
  });

  group('ReadablePage', () {
    test('text, links, forms and scripts', () {
      const html = '''
<html><head><title>Blog</title><meta name="description" content="Posts">
<script src="/app.js"></script><link rel="modulepreload" href="/chunk.js"></head>
<body><nav>Menu</nav><main><h1>Posts</h1><ul><li><a href="/blog/one">First post</a></li>
<li><a href="https://x.com/two">Second</a></li></ul><p>Hello   world</p></main>
<form action="/send" method="post"><input type="hidden" name="csrf" value="t0k"><textarea name="msg" required></textarea></form>
</body></html>''';
      final page = ReadablePage.parse(html, Uri.parse('https://example.com/blog'));
      expect(page.title, 'Blog');
      expect(page.description, 'Posts');
      expect(page.text, contains('# Posts'));
      expect(page.text, contains('- First post'));
      expect(page.text, contains('Hello world'));
      expect(page.text, isNot(contains('Menu')));
      expect(page.links.first, {'text': 'First post', 'url': 'https://example.com/blog/one'});
      expect(page.scripts, ['https://example.com/app.js', 'https://example.com/chunk.js']);
      expect(page.forms.single['method'], 'POST');
      expect(page.forms.single['action'], 'https://example.com/send');
      expect((page.forms.single['fields'] as List).first, {'name': 'csrf', 'type': 'hidden', 'value': 't0k'});
    });

    test('bare addresses get https', () {
      expect(WebFetcher.normalize('dagmawibabi.com/blog').toString(), 'https://dagmawibabi.com/blog');
      expect(() => WebFetcher.normalize('file:///etc/passwd'), throwsArgumentError);
    });
  });

  test('new tools are registered with the right safety flags', () {
    for (final name in ['create_reminder', 'zip_files', 'fetch_url', 'browser_open', 'get_star_balance']) {
      expect(toolNamed(name), isNotNull, reason: name);
      expect(toolNamed(name)!.requiresApproval, isFalse, reason: name);
    }
    for (final name in ['http_request', 'submit_form', 'browser_click', 'browser_submit', 'browser_run_js', 'set_star_subscription']) {
      expect(toolNamed(name)!.requiresApproval, isTrue, reason: name);
    }
    expect(toolNamed('send_star_reaction')!.alwaysAsk, isTrue);
  });

  test('account, story, folder and chat tools ask before changing anything', () {
    const reading = [
      'list_sessions', 'get_privacy', 'get_profile', 'account_health', 'list_stories', 'view_story', 'story_viewers',
      'get_folder', 'suggested_folders', 'get_boosts', 'invite_link_joins', 'open_telegram_link', 'search_all_chats',
      'inline_bot_query', 'list_message_effects', 'reactions_to_me', 'video_chat', 'storage_report', 'data_usage',
      'web_screenshot', 'web_inspect', 'run_code', 'github_repo', 'github_list', 'github_read', 'github_search',
      'github_issues', 'github_commits', 'github_releases', 'github_download',
      'search_books', 'book_details', 'find_free_copy', 'download_book', 'youtube_search', 'youtube_video',
      'youtube_transcript', 'youtube_channel', 'youtube_playlist', 'x_post', 'x_profile',
    ];
    const changing = [
      'end_session', 'set_session_options', 'set_privacy', 'edit_profile', 'post_story', 'edit_story', 'delete_story',
      'react_to_story', 'create_folder', 'edit_folder', 'delete_folder', 'reorder_folders', 'share_folder',
      'set_chat_settings', 'set_chat_reactions', 'manage_topic', 'delete_topic', 'send_inline_result',
      'mark_reactions_seen', 'manage_video_chat', 'clean_storage', 'web_run_async_js',
    ];
    for (final n in reading) {
      expect(toolNamed(n), isNotNull, reason: n);
      expect(toolNamed(n)!.requiresApproval, isFalse, reason: n);
    }
    for (final n in changing) {
      expect(toolNamed(n), isNotNull, reason: n);
      expect(toolNamed(n)!.requiresApproval, isTrue, reason: n);
    }
    // Logging devices out and deleting stories or topics start off.
    for (final n in ['end_session', 'delete_story', 'delete_topic']) {
      expect(toolNamed(n)!.destructive, isTrue, reason: n);
    }
  });
}
