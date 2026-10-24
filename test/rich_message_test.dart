import 'package:flutter_test/flutter_test.dart';
import 'package:handy_tdlib/api.dart' as td;
import 'package:teleai/features/telegram/data/message_content.dart';
import 'package:teleai/features/telegram/data/rich_message.dart';
import 'package:teleai/features/telegram/data/telegram_tools.dart';

String plain(td.RichText? t) => richTextMarkdown(t, marks: false);

void main() {
  group('inlineRichText', () {
    test('marks become rich text', () {
      final t = inlineRichText('**bold** and _it_ and `code` and [site](https://x.dev)');
      expect(t, isA<td.RichTexts>());
      final parts = (t as td.RichTexts).texts;
      expect(parts.first, isA<td.RichTextBold>());
      expect(parts.whereType<td.RichTextItalic>(), hasLength(1));
      expect(parts.whereType<td.RichTextFixed>(), hasLength(1));
      final link = parts.whereType<td.RichTextUrl>().single;
      expect(link.url, 'https://x.dev');
      expect(plain(t), 'bold and it and code and site');
    });

    test('snake_case and prices stay plain', () {
      expect(inlineRichText('use my_var_name here'), isA<td.RichTextPlain>());
      expect(inlineRichText(r'costs $5 and $6'), isA<td.RichTextPlain>());
    });

    test('inline math, spoilers, highlights, mentions', () {
      final parts = (inlineRichText(r'area $\pi r^2$ ||secret|| ==key== @durov') as td.RichTexts).texts;
      expect(parts.whereType<td.RichTextMathematicalExpression>().single.expression, r'\pi r^2');
      expect(parts.whereType<td.RichTextSpoiler>(), hasLength(1));
      expect(parts.whereType<td.RichTextMarked>(), hasLength(1));
      expect(parts.whereType<td.RichTextMention>().single.username, 'durov');
    });

    test('a backslash keeps a mark literal', () {
      expect(plain(inlineRichText(r'2 \* 3')), '2 * 3');
    });
  });

  group('markdownBlocks', () {
    test('headings, paragraphs and dividers', () {
      final b = markdownBlocks('# Title\n\nSome text\non two lines\n\n---\n### Small');
      expect(b, hasLength(4));
      expect((b[0] as td.InputPageBlockSectionHeading).size, 1);
      expect(plain((b[1] as td.InputPageBlockParagraph).text), 'Some text\non two lines');
      expect(b[2], isA<td.InputPageBlockDivider>());
      expect((b[3] as td.InputPageBlockSectionHeading).size, 3);
    });

    test('tables keep header, rows and alignment', () {
      final b = markdownBlocks('| Model | Price |\n|:--|--:|\n| A | 1 |\n| B \\| C | 2 |');
      final t = b.single as td.InputPageBlockTable;
      expect(t.cells, hasLength(3));
      expect(t.cells.first.every((c) => c.isHeader), isTrue);
      expect(t.cells[1][1].align, isA<td.PageBlockHorizontalAlignmentRight>());
      expect(plain(t.cells[2][0].text), 'B | C');
    });

    test('nested, numbered and checkbox lists', () {
      final b = markdownBlocks('1. one\n2. two\n   - inner\n- [x] done\n- [ ] todo');
      expect(b, hasLength(2));
      final numbered = b[0] as td.InputPageBlockList;
      expect(numbered.items.map((i) => i.value), [1, 2]);
      expect(numbered.items[1].blocks.last, isA<td.InputPageBlockList>());
      final checks = (b[1] as td.InputPageBlockList).items;
      expect(checks.map((i) => i.hasCheckbox), [true, true]);
      expect(checks.map((i) => i.isChecked), [true, false]);
    });

    test('code, math, quotes and details', () {
      final b = markdownBlocks(
        '```dart\nvoid main() {}\n```\n\n\$\$\nE = mc^2\n\$\$\n\n> Be brief.\n> — Someone\n\n'
        '<details><summary>More</summary>\n\nHidden **text**\n</details>\nAfter',
      );
      expect((b[0] as td.InputPageBlockPreformatted).language, 'dart');
      expect((b[1] as td.InputPageBlockMathematicalExpression).expression, 'E = mc^2');
      final q = b[2] as td.InputPageBlockBlockQuote;
      expect(plain(q.credit), 'Someone');
      final d = b[3] as td.InputPageBlockDetails;
      expect(plain(d.header), 'More');
      expect(d.blocks.single, isA<td.InputPageBlockParagraph>());
      expect(plain((b[4] as td.InputPageBlockParagraph).text), 'After');
    });

    test('missing images become links', () {
      final b = markdownBlocks('![cat](no/such/file.jpg)');
      expect((b.single as td.InputPageBlockParagraph).text, isA<td.RichTextUrl>());
    });

    test('looksRich spots tables and headings only', () {
      expect(looksRich('| a | b |\n|---|---|\n| 1 | 2 |'), isTrue);
      expect(looksRich('## Plan'), isTrue);
      expect(looksRich('just a | pipe in text'), isFalse);
    });
  });

  group('rich messages for the model', () {
    td.PageBlockTableCell cell(String s, {bool head = false}) => td.PageBlockTableCell(
      text: td.RichTextPlain(text: s),
      isHeader: head,
      colspan: 1,
      rowspan: 1,
      align: const td.PageBlockHorizontalAlignmentLeft(),
      valign: const td.PageBlockVerticalAlignmentTop(),
    );

    final message = td.RichMessage(
      isRtl: false,
      isFull: true,
      blocks: [
        const td.PageBlockSectionHeading(text: td.RichTextPlain(text: 'Prices'), size: 2),
        td.PageBlockTable(
          caption: const td.RichTextPlain(text: ''),
          cells: [
            [cell('Item', head: true), cell('Cost', head: true)],
            [cell('Tea'), cell('2')],
          ],
          isBordered: true,
          isStriped: false,
          isCompact: false,
        ),
        const td.PageBlockList(
          items: [
            td.PageBlockListItem(
              label: '',
              blocks: [td.PageBlockParagraph(text: td.RichTextBold(text: td.RichTextPlain(text: 'cheap')))],
              hasCheckbox: true,
              isChecked: true,
              value: 0,
              type: '',
            ),
          ],
        ),
      ],
    );

    test('blocks read back as Markdown', () {
      final md = richMessageMarkdown(message);
      expect(md, contains('## Prices'));
      expect(md, contains('| Item | Cost |'));
      expect(md, contains('| Tea | 2 |'));
      expect(md, contains('- [x] **cheap**'));
    });

    test('gistOf gives a rich kind and a one-line preview', () {
      final g = gistOf(td.MessageRichMessage(message: message));
      expect(g.kind, 'rich');
      expect(g.detail, 'Prices');
      expect(g.text, contains('| Tea | 2 |'));
    });
  });

  group('approvals', () {
    final botApi = telegramTools.firstWhere((t) => t.name == 'bot_api');
    test('Bot API reads run without asking, writes ask', () {
      expect(callNeedsApproval(botApi, {'method': 'getMe'}), isFalse);
      expect(callNeedsApproval(botApi, {'method': 'sendMessage'}), isTrue);
    });

    test('every new tool is registered once', () {
      const names = [
        'send_rich_message',
        'list_channel_dms',
        'reply_channel_dm',
        'set_member_tag',
        'set_welcome_message',
        'set_private_note',
        'get_profile_music',
        'send_ephemeral_command',
        'stream_bot_message',
        'connect_bot',
        'message_read_status',
        'online_alert',
        'list_online_alerts',
        'music_search',
        'music_album',
        'music_artist',
        'movie_search',
        'movie_details',
        'tv_search',
        'tv_show',
      ];
      for (final n in names) {
        expect(telegramTools.where((t) => t.name == n), hasLength(1), reason: n);
      }
    });
  });
}
