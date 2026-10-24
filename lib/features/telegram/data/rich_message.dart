import 'dart:io';

import 'package:handy_tdlib/api.dart' as td;

import '../../../infrastructure/telegram/td_compat.dart';

/// Telegram's rich messages: blocks (headings, lists, tables, quotes, code,
/// math, collapsible details, media) instead of one formatted text.
///
/// A user account sends them as blocks (Markdown and HTML sources are for
/// bots only), so [markdownToRichMessage] turns Markdown into blocks here.
/// [richMessageMarkdown] goes the other way, for the model and for copying.

// ---- Markdown → blocks -------------------------------------------------------

td.RichText _plain(String s) => td.RichTextPlain(text: s);

td.RichText _join(List<td.RichText> parts) => switch (parts.length) {
  0 => _plain(''),
  1 => parts.first,
  _ => td.RichTexts(texts: parts),
};

final _link = RegExp(r'\[([^\]]*)\]\(([^)\s]+)\)');
final _mention = RegExp(r'@([A-Za-z][A-Za-z0-9_]{3,31})');

/// Inline Markdown: **bold**, *italic* or _italic_, __underline__,
/// ~~strike~~, ||spoiler||, ==marked==, `code`, $math$, [text](url),
/// ^superscript^, ~subscript~ and @mentions.
td.RichText inlineRichText(String s) {
  final out = <td.RichText>[];
  final buf = StringBuffer();
  void flush() {
    if (buf.isNotEmpty) {
      out.add(_plain(buf.toString()));
      buf.clear();
    }
  }

  bool wordChar(int i) => i >= 0 && i < s.length && RegExp(r'[A-Za-z0-9]').hasMatch(s[i]);

  var i = 0;
  while (i < s.length) {
    final c = s[i];
    // A backslash keeps the next character literal.
    if (c == '\\' && i + 1 < s.length) {
      buf.write(s[i + 1]);
      i += 2;
      continue;
    }
    if (c == '`') {
      final end = s.indexOf('`', i + 1);
      if (end > i) {
        flush();
        out.add(td.RichTextFixed(text: _plain(s.substring(i + 1, end))));
        i = end + 1;
        continue;
      }
    }
    // $x^2$ is math; "$5 and $6" isn't (no digit or space after the opener).
    if (c == r'$' && i + 1 < s.length && s[i + 1] != r'$' && !RegExp(r'[\s\d]').hasMatch(s[i + 1])) {
      final end = s.indexOf(r'$', i + 1);
      if (end > i + 1 && s[end - 1] != ' ') {
        flush();
        out.add(td.RichTextMathematicalExpression(expression: s.substring(i + 1, end)));
        i = end + 1;
        continue;
      }
    }
    if (c == '[') {
      final m = _link.matchAsPrefix(s, i);
      if (m != null) {
        flush();
        out.add(td.RichTextUrl(text: inlineRichText(m[1]!), url: m[2]!, isCached: false));
        i = m.end;
        continue;
      }
    }
    if (c == '@' && !wordChar(i - 1)) {
      final m = _mention.matchAsPrefix(s, i);
      if (m != null) {
        flush();
        out.add(td.RichTextMention(text: _plain(m[0]!), username: m[1]!));
        i = m.end;
        continue;
      }
    }
    td.RichText? wrapped;
    for (final (open, make) in <(String, td.RichText Function(td.RichText))>[
      ('**', (t) => td.RichTextBold(text: t)),
      ('__', (t) => td.RichTextUnderline(text: t)),
      ('~~', (t) => td.RichTextStrikethrough(text: t)),
      ('||', (t) => td.RichTextSpoiler(text: t)),
      ('==', (t) => td.RichTextMarked(text: t)),
      ('*', (t) => td.RichTextItalic(text: t)),
      ('_', (t) => td.RichTextItalic(text: t)),
      ('^', (t) => td.RichTextSuperscript(text: t)),
      ('~', (t) => td.RichTextSubscript(text: t)),
    ]) {
      if (!s.startsWith(open, i)) continue;
      // snake_case words aren't italics.
      if (open == '_' && wordChar(i - 1)) break;
      final from = i + open.length;
      if (from >= s.length || s[from] == ' ') break;
      var end = s.indexOf(open, from);
      while (end > from && open == '_' && wordChar(end + 1)) {
        end = s.indexOf(open, end + 1);
      }
      if (end <= from || s[end - 1] == ' ') continue;
      flush();
      wrapped = make(inlineRichText(s.substring(from, end)));
      i = end + open.length;
      break;
    }
    if (wrapped != null) {
      out.add(wrapped);
      continue;
    }
    buf.write(c);
    i++;
  }
  flush();
  return _join(out);
}

final _heading = RegExp(r'^(#{1,6})\s+(.*?)\s*#*\s*$');
final _rule = RegExp(r'^\s*([-*_])(\s*\1){2,}\s*$');
final _listItem = RegExp(r'^(\s*)([-*+]|(\d+)[.)])\s+(?:\[([ xX])\]\s+)?(.*)$');
final _tableRule = RegExp(r'^\s*\|?\s*:?-+:?\s*(\|\s*:?-+:?\s*)*\|?\s*$');
final _image = RegExp(r'^!\[([^\]]*)\]\(([^)]+)\)\s*$');
final _fence = RegExp(r'^\s*(```|~~~)\s*([\w+#.-]*)\s*$');

List<String> _cells(String row) {
  var r = row.trim();
  if (r.startsWith('|')) r = r.substring(1);
  if (r.endsWith('|') && !r.endsWith(r'\|')) r = r.substring(0, r.length - 1);
  final out = <String>[];
  final b = StringBuffer();
  for (var i = 0; i < r.length; i++) {
    if (r[i] == '\\' && i + 1 < r.length && r[i + 1] == '|') {
      b.write('|');
      i++;
    } else if (r[i] == '|') {
      out.add(b.toString().trim());
      b.clear();
    } else {
      b.write(r[i]);
    }
  }
  out.add(b.toString().trim());
  return out;
}

td.PageBlockHorizontalAlignment _align(String rule) {
  final r = rule.trim();
  if (r.startsWith(':') && r.endsWith(':')) return const td.PageBlockHorizontalAlignmentCenter();
  if (r.endsWith(':')) return const td.PageBlockHorizontalAlignmentRight();
  return const td.PageBlockHorizontalAlignmentLeft();
}

int _indent(String line) => line.length - line.trimLeft().length;

td.PageBlockCaption _caption(String text) => td.PageBlockCaption(text: inlineRichText(text), credit: _plain(''));

/// Markdown → rich message blocks. Covers headings, paragraphs, bullet,
/// numbered and checkbox lists (nested by indent), > quotes, ``` code,
/// $$ math $$, | tables |, --- rules, `<details><summary>…</summary> …`
/// `</details>`, and ![caption](local path) images, videos and files.
List<td.InputPageBlock> markdownBlocks(String md) {
  final lines = md.replaceAll('\r\n', '\n').split('\n');
  final blocks = <td.InputPageBlock>[];
  var i = 0;
  bool special(String l) =>
      l.trim().isEmpty ||
      _heading.hasMatch(l) ||
      _fence.hasMatch(l) ||
      l.trim() == r'$$' ||
      _rule.hasMatch(l) ||
      _listItem.hasMatch(l) ||
      l.trimLeft().startsWith('>') ||
      l.trimLeft().toLowerCase().startsWith('<details') ||
      _image.hasMatch(l.trim());

  while (i < lines.length) {
    final line = lines[i];
    final t = line.trim();
    if (t.isEmpty) {
      i++;
      continue;
    }
    if (_fence.firstMatch(line) case final f?) {
      final body = <String>[];
      i++;
      while (i < lines.length && !lines[i].trim().startsWith(f[1]!)) {
        body.add(lines[i++]);
      }
      i++;
      blocks.add(td.InputPageBlockPreformatted(text: _plain(body.join('\n')), language: f[2] ?? ''));
      continue;
    }
    if (t == r'$$' || (t.startsWith(r'$$') && t.endsWith(r'$$') && t.length > 4)) {
      if (t != r'$$') {
        blocks.add(td.InputPageBlockMathematicalExpression(expression: t.substring(2, t.length - 2).trim()));
        i++;
        continue;
      }
      final body = <String>[];
      i++;
      while (i < lines.length && lines[i].trim() != r'$$') {
        body.add(lines[i++]);
      }
      i++;
      blocks.add(td.InputPageBlockMathematicalExpression(expression: body.join('\n').trim()));
      continue;
    }
    if (_heading.firstMatch(line) case final h?) {
      blocks.add(td.InputPageBlockSectionHeading(text: inlineRichText(h[2]!), size: h[1]!.length));
      i++;
      continue;
    }
    if (_rule.hasMatch(line)) {
      blocks.add(const td.InputPageBlockDivider());
      i++;
      continue;
    }
    if (t.contains('|') && i + 1 < lines.length && _tableRule.hasMatch(lines[i + 1]) && lines[i + 1].contains('-')) {
      final header = _cells(line);
      final aligns = [for (final r in _cells(lines[i + 1])) _align(r)];
      td.PageBlockHorizontalAlignment alignAt(int c) =>
          c < aligns.length ? aligns[c] : const td.PageBlockHorizontalAlignmentLeft();
      td.PageBlockTableCell cell(String text, int c, bool head) => td.PageBlockTableCell(
        text: inlineRichText(text),
        isHeader: head,
        colspan: 1,
        rowspan: 1,
        align: alignAt(c),
        valign: const td.PageBlockVerticalAlignmentMiddle(),
      );
      final rows = <List<td.PageBlockTableCell>>[
        [for (var c = 0; c < header.length; c++) cell(header[c], c, true)],
      ];
      i += 2;
      while (i < lines.length && lines[i].trim().isNotEmpty && lines[i].contains('|')) {
        final r = _cells(lines[i++]);
        rows.add([for (var c = 0; c < header.length; c++) cell(c < r.length ? r[c] : '', c, false)]);
      }
      blocks.add(td.InputPageBlockTable(caption: _plain(''), cells: rows, isBordered: true, isStriped: true, isCompact: false));
      continue;
    }
    if (t.startsWith('>')) {
      final body = <String>[];
      while (i < lines.length && lines[i].trimLeft().startsWith('>')) {
        body.add(lines[i++].trimLeft().substring(1).replaceFirst(RegExp(r'^ '), ''));
      }
      // A trailing "— Name" line is the quote's credit.
      var credit = '';
      if (body.isNotEmpty && RegExp(r'^(—|--|-)\s+\S').hasMatch(body.last.trim())) {
        credit = body.removeLast().trim().replaceFirst(RegExp(r'^(—|--|-)\s+'), '');
      }
      blocks.add(td.InputPageBlockBlockQuote(blocks: markdownBlocks(body.join('\n')), credit: inlineRichText(credit)));
      continue;
    }
    if (t.toLowerCase().startsWith('<details')) {
      final open = t.toLowerCase().contains('open');
      var header = 'Details';
      final body = <String>[];
      var depth = 1;
      final rest = t.replaceFirst(RegExp(r'^<details[^>]*>', caseSensitive: false), '');
      i++;
      final lead = <String>[if (rest.trim().isNotEmpty) rest];
      final source = [...lead, ...lines.sublist(i)];
      var j = 0;
      for (; j < source.length; j++) {
        final l = source[j];
        final lower = l.toLowerCase();
        if (lower.contains('<details')) depth++;
        if (lower.contains('</details>')) {
          depth--;
          if (depth == 0) {
            final before = l.substring(0, lower.indexOf('</details>'));
            if (before.trim().isNotEmpty) body.add(before);
            break;
          }
        }
        final s = RegExp(r'<summary>(.*?)</summary>', caseSensitive: false).firstMatch(l);
        if (s != null && body.isEmpty && header == 'Details') {
          header = s[1]!.trim();
          final after = l.substring(s.end);
          if (after.trim().isNotEmpty) body.add(after);
          continue;
        }
        body.add(l);
      }
      i += j + 1 - lead.length;
      blocks.add(td.InputPageBlockDetails(header: inlineRichText(header), blocks: markdownBlocks(body.join('\n')), isOpen: open));
      continue;
    }
    if (_image.firstMatch(t) case final m?) {
      i++;
      final path = m[2]!.trim();
      final caption = _caption(m[1]!);
      final lower = path.toLowerCase();
      if (!File(path).existsSync()) {
        blocks.add(td.InputPageBlockParagraph(text: td.RichTextUrl(text: _plain(m[1]!.isEmpty ? path : m[1]!), url: path, isCached: false)));
      } else if (RegExp(r'\.(mp4|mov|webm|mkv)$').hasMatch(lower)) {
        blocks.add(td.InputPageBlockVideo(video: inputVideo(path), caption: caption, hasSpoiler: false));
      } else if (lower.endsWith('.gif')) {
        blocks.add(td.InputPageBlockAnimation(animation: inputAnimation(path), caption: caption, hasSpoiler: false));
      } else if (RegExp(r'\.(mp3|m4a|flac|wav|aac)$').hasMatch(lower)) {
        blocks.add(td.InputPageBlockAudio(audio: inputAudio(path), caption: caption));
      } else if (RegExp(r'\.(ogg|oga|opus)$').hasMatch(lower)) {
        blocks.add(td.InputPageBlockVoiceNote(voiceNote: inputVoiceNote(path), caption: caption));
      } else if (RegExp(r'\.(jpe?g|png|webp|heic)$').hasMatch(lower)) {
        blocks.add(td.InputPageBlockPhoto(photo: inputPhoto(path), caption: caption, hasSpoiler: false));
      } else {
        blocks.add(td.InputPageBlockDocument(document: inputDocument(path), caption: caption));
      }
      continue;
    }
    if (_listItem.hasMatch(line)) {
      final base = _indent(line);
      // Numbered and bulleted items make separate lists.
      final ordered = _listItem.firstMatch(line)![3] != null;
      final items = <td.InputPageBlockListItem>[];
      while (i < lines.length) {
        final m = _listItem.firstMatch(lines[i]);
        if (m == null || _indent(lines[i]) != base || (m[3] != null) != ordered) break;
        i++;
        // Deeper-indented lines (nested lists, continued text) belong to it.
        final inner = <String>[m[5]!];
        while (i < lines.length &&
            (lines[i].trim().isEmpty ? (i + 1 < lines.length && _indent(lines[i + 1]) > base) : _indent(lines[i]) > base)) {
          inner.add(lines[i++]);
        }
        final first = inner.first;
        final nested = inner.length > 1 ? markdownBlocks(_dedent(inner.sublist(1))) : const <td.InputPageBlock>[];
        final number = int.tryParse(m[3] ?? '');
        items.add(
          td.InputPageBlockListItem(
            blocks: [td.InputPageBlockParagraph(text: inlineRichText(first)), ...nested],
            hasCheckbox: m[4] != null,
            isChecked: m[4] != null && m[4]!.toLowerCase() == 'x',
            value: number ?? 0,
            type: number == null ? '' : '1',
          ),
        );
      }
      blocks.add(td.InputPageBlockList(items: items));
      continue;
    }
    // A paragraph: lines up to the next blank line or other block.
    final para = <String>[t];
    i++;
    while (i < lines.length && !special(lines[i]) && !(lines[i].contains('|') && i + 1 < lines.length && _tableRule.hasMatch(lines[i + 1]))) {
      para.add(lines[i++].trim());
    }
    blocks.add(td.InputPageBlockParagraph(text: inlineRichText(para.join('\n'))));
  }
  return blocks;
}

String _dedent(List<String> lines) {
  final widths = [for (final l in lines) if (l.trim().isNotEmpty) _indent(l)];
  final cut = widths.isEmpty ? 0 : widths.reduce((a, b) => a < b ? a : b);
  return [for (final l in lines) l.length >= cut ? l.substring(cut) : l.trimLeft()].join('\n');
}

td.InputRichMessage markdownToRichMessage(String md, {bool rtl = false}) => td.InputRichMessage(
  source: td.RichMessageSourceBlocks(blocks: markdownBlocks(md)),
  isRtl: rtl,
  detectAutomaticBlocks: true,
);

/// Whether text is worth sending as a rich message: it has a table, a
/// heading, a code block, math, or collapsible details.
bool looksRich(String md) =>
    md.split('\n').any((l) => _heading.hasMatch(l) || _fence.hasMatch(l) || l.trim() == r'$$' || l.toLowerCase().contains('<details')) ||
    RegExp(r'^\s*\|.*\|\s*$\n^\s*\|?\s*:?-+', multiLine: true).hasMatch(md);

// ---- blocks → Markdown ---------------------------------------------------------

/// The text of a rich text, with Markdown marks where they matter.
String richTextMarkdown(td.RichText? t, {bool marks = true}) {
  String m(String mark, td.RichText x) => marks ? '$mark${richTextMarkdown(x)}$mark' : richTextMarkdown(x, marks: false);
  return switch (t) {
    null => '',
    td.RichTextPlain(:final text) => text,
    td.RichTexts(:final texts) => texts.map((x) => richTextMarkdown(x, marks: marks)).join(),
    td.RichTextBold(:final text) => m('**', text),
    td.RichTextItalic(:final text) => m('_', text),
    td.RichTextUnderline(:final text) => m('__', text),
    td.RichTextStrikethrough(:final text) => m('~~', text),
    td.RichTextSpoiler(:final text) => m('||', text),
    td.RichTextMarked(:final text) => m('==', text),
    td.RichTextSubscript(:final text) => richTextMarkdown(text, marks: marks),
    td.RichTextSuperscript(:final text) => richTextMarkdown(text, marks: marks),
    td.RichTextFixed(:final text) => m('`', text),
    td.RichTextUrl(:final text, :final url) =>
      marks ? '[${richTextMarkdown(text)}]($url)' : richTextMarkdown(text, marks: false),
    td.RichTextEmailAddress(:final text) ||
    td.RichTextPhoneNumber(:final text) ||
    td.RichTextMention(:final text) ||
    td.RichTextMentionName(:final text) ||
    td.RichTextHashtag(:final text) ||
    td.RichTextCashtag(:final text) ||
    td.RichTextBankCardNumber(:final text) ||
    td.RichTextTonAddress(:final text) ||
    td.RichTextBotCommand(:final text) ||
    td.RichTextDateTime(:final text) ||
    td.RichTextReference(:final text) ||
    td.RichTextReferenceLink(:final text) ||
    td.RichTextAnchorLink(:final text) => richTextMarkdown(text, marks: marks),
    td.RichTextDiff(:final text) => richTextMarkdown(text, marks: marks),
    td.RichTextCustomEmoji(:final alternativeText) => alternativeText,
    td.RichTextMathematicalExpression(:final expression) => marks ? '\$$expression\$' : expression,
    td.RichTextButton(:final button) => '[${richTextMarkdown(button.text, marks: false)}]',
    td.RichTextIcon() || td.RichTextAnchor() => '',
  };
}

String _captionText(td.PageBlockCaption? c) {
  if (c == null) return '';
  final a = richTextMarkdown(c.text).trim();
  final b = richTextMarkdown(c.credit).trim();
  return [a, b].where((e) => e.isNotEmpty).join(' — ');
}

String _block(td.PageBlock b, String indent) {
  String quote(String s) => s.split('\n').map((l) => '$indent> $l').join('\n');
  return switch (b) {
    td.PageBlockTitle(:final title) => '$indent# ${richTextMarkdown(title)}',
    td.PageBlockSubtitle(:final subtitle) => '$indent## ${richTextMarkdown(subtitle)}',
    td.PageBlockHeader(:final header) => '$indent## ${richTextMarkdown(header)}',
    td.PageBlockSubheader(:final subheader) => '$indent### ${richTextMarkdown(subheader)}',
    td.PageBlockSectionHeading(:final text, :final size) => '$indent${'#' * size.clamp(1, 6)} ${richTextMarkdown(text)}',
    td.PageBlockKicker(:final kicker) => '$indent${richTextMarkdown(kicker).toUpperCase()}',
    td.PageBlockAuthorDate(:final author) => '${indent}_${richTextMarkdown(author, marks: false)}_',
    td.PageBlockParagraph(:final text) => '$indent${richTextMarkdown(text)}',
    td.PageBlockFooter(:final footer) => '$indent${richTextMarkdown(footer)}',
    td.PageBlockThinking(:final text) => '${indent}_(thinking) ${richTextMarkdown(text, marks: false)}_',
    td.PageBlockPreformatted(:final text, :final language) =>
      '$indent```$language\n${richTextMarkdown(text, marks: false)}\n$indent```',
    td.PageBlockDivider() => '$indent---',
    td.PageBlockMathematicalExpression(:final expression) => '$indent\$\$\n$expression\n$indent\$\$',
    td.PageBlockAnchor() => '',
    td.PageBlockList(:final items) => [
      for (final it in items)
        () {
          final mark = it.hasCheckbox
              ? '- [${it.isChecked ? 'x' : ' '}]'
              : it.value > 0
              ? (it.label.isNotEmpty ? it.label : '${it.value}.')
              : (it.label.isNotEmpty && it.label != '•' ? it.label : '-');
          final inner = pageBlocksMarkdown(it.blocks, indent: '$indent  ').trimLeft();
          return '$indent$mark $inner';
        }(),
    ].join('\n'),
    td.PageBlockBlockQuote(:final blocks, :final credit) => quote(
      [pageBlocksMarkdown(blocks), if (richTextMarkdown(credit).isNotEmpty) '— ${richTextMarkdown(credit)}'].join('\n'),
    ),
    td.PageBlockExpandableBlockQuote(:final text, :final credit) ||
    td.PageBlockPullQuote(:final text, :final credit) => quote(
      [richTextMarkdown(text), if (richTextMarkdown(credit).isNotEmpty) '— ${richTextMarkdown(credit)}'].join('\n'),
    ),
    td.PageBlockAnimation(:final caption) => '$indent[GIF${_captionText(caption).isEmpty ? '' : ': ${_captionText(caption)}'}]',
    td.PageBlockAudio(:final audio, :final caption) =>
      '$indent[audio: ${[audio.performer, audio.title].where((e) => e.isNotEmpty).join(' – ')}${_captionText(caption).isEmpty ? '' : ' · ${_captionText(caption)}'}]',
    td.PageBlockDocument(:final document, :final caption) =>
      '$indent[file: ${document.fileName}${_captionText(caption).isEmpty ? '' : ' · ${_captionText(caption)}'}]',
    td.PageBlockPhoto(:final caption) => '$indent[photo${_captionText(caption).isEmpty ? '' : ': ${_captionText(caption)}'}]',
    td.PageBlockVideo(:final caption) => '$indent[video${_captionText(caption).isEmpty ? '' : ': ${_captionText(caption)}'}]',
    td.PageBlockVoiceNote() => '$indent[voice message]',
    td.PageBlockCover(:final cover) => _block(cover, indent),
    td.PageBlockEmbedded(:final url, :final caption) => '$indent[embedded: $url${_captionText(caption).isEmpty ? '' : ' · ${_captionText(caption)}'}]',
    td.PageBlockEmbeddedPost(:final author, :final blocks) => quote('$author:\n${pageBlocksMarkdown(blocks)}'),
    td.PageBlockCollage(:final blocks, :final caption) ||
    td.PageBlockSlideshow(:final blocks, :final caption) => [
      pageBlocksMarkdown(blocks, indent: indent),
      if (_captionText(caption).isNotEmpty) '${indent}_${_captionText(caption)}_',
    ].join('\n'),
    td.PageBlockChatLink(:final title, :final username) => '$indent[chat: $title @$username]',
    td.PageBlockTable(:final caption, :final cells) => _table(caption, cells, indent),
    td.PageBlockDetails(:final header, :final blocks, :final isOpen) =>
      '$indent<details${isOpen ? ' open' : ''}><summary>${richTextMarkdown(header)}</summary>\n\n${pageBlocksMarkdown(blocks, indent: indent)}\n\n$indent</details>',
    td.PageBlockRelatedArticles(:final header, :final articles) => [
      '$indent**${richTextMarkdown(header, marks: false)}**',
      for (final a in articles) '$indent- [${a.title.isEmpty ? a.url : a.title}](${a.url})',
    ].join('\n'),
    td.PageBlockMap(:final location) => '$indent[map: ${location.latitude}, ${location.longitude}]',
    td.PageBlockButtonRow(:final buttons) => '$indent${buttons.map((b) => '[${richTextMarkdown(b.text, marks: false)}]').join(' ')}',
    td.PageBlockUnsupported() => '$indent[unsupported block]',
  };
}

String _table(td.RichText? caption, List<List<td.PageBlockTableCell>> cells, String indent) {
  if (cells.isEmpty) return '';
  String cell(td.PageBlockTableCell c) => richTextMarkdown(c.text).replaceAll('|', r'\|').replaceAll('\n', ' ');
  final width = cells.map((r) => r.length).reduce((a, b) => a > b ? a : b);
  List<String> row(List<td.PageBlockTableCell> r) => [for (var i = 0; i < width; i++) i < r.length ? cell(r[i]) : ''];
  final out = <String>[
    if (richTextMarkdown(caption).isNotEmpty) '$indent**${richTextMarkdown(caption, marks: false)}**',
    '$indent| ${row(cells.first).join(' | ')} |',
    '$indent|${List.filled(width, ' --- ').join('|')}|',
    for (final r in cells.skip(1)) '$indent| ${row(r).join(' | ')} |',
  ];
  return out.join('\n');
}

String pageBlocksMarkdown(List<td.PageBlock> blocks, {String indent = ''}) =>
    blocks.map((b) => _block(b, indent)).where((s) => s.trim().isNotEmpty).join('\n\n');

/// A rich message as Markdown, for the model, previews and copying.
String richMessageMarkdown(td.RichMessage m) =>
    pageBlocksMarkdown(m.blocks) + (m.isFull ? '' : '\n\n[…message continues; open it to load the rest]');

/// A one-line preview: the first heading or paragraph.
String richMessagePreview(td.RichMessage m) {
  for (final b in m.blocks) {
    final s = _block(b, '').replaceAll(RegExp(r'[#*_`>|=~]'), '').trim();
    if (s.isNotEmpty && !s.startsWith('---')) return s.split('\n').first;
  }
  return 'Rich message';
}
