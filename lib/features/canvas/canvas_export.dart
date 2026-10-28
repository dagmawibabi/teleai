import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'canvas_store.dart';

/// The formats a Content Canvas folder exports to.
enum CanvasExportFormat {
  json('JSON', 'json'),
  markdown('Markdown', 'md'),
  html('HTML', 'html'),
  pdf('PDF', 'pdf');

  const CanvasExportFormat(this.label, this.extension);
  final String label;
  final String extension;

  static CanvasExportFormat? parse(String s) => switch (s.toLowerCase().trim()) {
    'json' => json,
    'md' || 'markdown' => markdown,
    'html' || 'htm' => html,
    'pdf' => pdf,
    _ => null,
  };
}

/// Where exports are written; the Files page lists them.
Future<Directory> canvasExportDir() async {
  final d = Directory('${(await getApplicationSupportDirectory()).path}/exports');
  await d.create(recursive: true);
  return d;
}

/// One folder and (optionally) its subfolders, flattened for writing.
class _Section {
  _Section(this.folder, this.path, this.depth, this.items);
  final CanvasFolder folder;
  final String path;
  final int depth;
  final List<CanvasItem> items;
}

List<_Section> _sections(CanvasState s, CanvasFolder root, bool subfolders) {
  final out = <_Section>[];
  void walk(CanvasFolder f, int depth) {
    final items = s.itemsIn(f.id)..sort((a, b) => a.addedAt.compareTo(b.addedAt));
    out.add(_Section(f, s.pathOf(f), depth, items));
    if (subfolders) {
      for (final c in s.childrenOf(f.id)) {
        walk(c, depth + 1);
      }
    }
  }

  walk(root, 0);
  return out;
}

final _when = DateFormat('d MMM y, HH:mm');

String _itemTitle(CanvasItem i) => switch (i.post) {
  final p? => [p.chatTitle, if (p.sender != null && p.sender!.isNotEmpty) p.sender!].join(' · '),
  null when i.title.isNotEmpty => [i.title, if (i.source.isNotEmpty) i.source].join(' · '),
  null => 'Note',
};

String _itemBody(CanvasItem i) => i.post?.text ?? [i.text, if (i.url.isNotEmpty) i.url].where((x) => x.isNotEmpty).join('\n');

String _itemDate(CanvasItem i) => _when.format(i.post?.date ?? i.addedAt);

/// Writes [folder] (with its subfolders unless [subfolders] is false) in
/// [format] and returns the file.
Future<File> exportCanvasFolder(
  CanvasState state,
  CanvasFolder folder,
  CanvasExportFormat format, {
  bool subfolders = true,
}) async {
  final sections = _sections(state, folder, subfolders);
  final dir = await canvasExportDir();
  final safe = folder.name.replaceAll(RegExp(r'[^\w\- ]+'), '').trim().replaceAll(' ', '_');
  final stamp = DateFormat('yyyyMMdd-HHmm').format(DateTime.now());
  final file = File('${dir.path}/${safe.isEmpty ? 'canvas' : safe}-$stamp.${format.extension}');
  switch (format) {
    case CanvasExportFormat.json:
      await file.writeAsString(const JsonEncoder.withIndent('  ').convert(_json(sections)));
    case CanvasExportFormat.markdown:
      await file.writeAsString(_markdown(sections));
    case CanvasExportFormat.html:
      await file.writeAsString(_html(sections));
    case CanvasExportFormat.pdf:
      await file.writeAsBytes(await _pdf(sections));
  }
  return file;
}

Map<String, dynamic> _json(List<_Section> sections) => {
  'exported': DateTime.now().toIso8601String(),
  'app': 'Triangle Content Canvas',
  'folders': [
    for (final s in sections)
      {
        'path': s.path,
        'name': s.folder.name,
        if (s.folder.description.isNotEmpty) 'description': s.folder.description,
        'items': [
          for (final i in s.items)
            {
              'kind': i.kind.name,
              if (i.post case final p?) ...{
                'chat': p.chatTitle,
                'sender': ?p.sender,
                'date': p.date.toIso8601String(),
                'ref': 'post:${p.chatId}:${p.messageId}',
                'media': p.kind,
                'text': p.text,
              } else
                'text': i.text,
              if (i.title.isNotEmpty) 'title': i.title,
              if (i.url.isNotEmpty) 'url': i.url,
              if (i.source.isNotEmpty) 'source': i.source,
              if (i.note.isNotEmpty) 'note': i.note,
              if (i.tags.isNotEmpty) 'tags': i.tags,
              'saved': i.addedAt.toIso8601String(),
            },
        ],
      },
  ],
};

String _markdown(List<_Section> sections) {
  final b = StringBuffer();
  for (final s in sections) {
    b.writeln('${'#' * (s.depth + 1).clamp(1, 6)} ${s.folder.name}');
    if (s.folder.description.isNotEmpty) b.writeln('\n_${s.folder.description}_');
    b.writeln();
    if (s.items.isEmpty) b.writeln('_Nothing saved here yet._\n');
    for (final i in s.items) {
      b.writeln('**${_itemTitle(i)}** — ${_itemDate(i)}${i.post != null && i.post!.kind != 'text' ? ' · ${i.post!.kind}' : ''}');
      b.writeln();
      final body = _itemBody(i).trim();
      if (body.isNotEmpty) b.writeln(body.split('\n').map((l) => '> $l').join('\n'));
      if (i.note.isNotEmpty) b.writeln('\n📝 ${i.note}');
      if (i.tags.isNotEmpty) b.writeln('\n${i.tags.map((t) => '#$t').join(' ')}');
      b.writeln('\n---\n');
    }
  }
  b.writeln('_Exported from Triangle on ${_when.format(DateTime.now())}._');
  return b.toString();
}

String _esc(String s) => const HtmlEscape().convert(s).replaceAll('\n', '<br>');

String _html(List<_Section> sections) {
  final b = StringBuffer()
    ..writeln('<!doctype html><html lang="en"><head><meta charset="utf-8">')
    ..writeln('<meta name="viewport" content="width=device-width, initial-scale=1">')
    ..writeln('<title>${_esc(sections.first.folder.name)} · Triangle Canvas</title>')
    ..writeln('''<style>
:root{--bg:#fff;--fg:#17171a;--muted:#6c6c76;--card:#f4f4f6;--line:#e3e3e8;--accent:#3b6ef5}
@media (prefers-color-scheme:dark){:root{--bg:#0b0b0d;--fg:#ededf0;--muted:#a3a3ad;--card:#16161a;--line:#26262c;--accent:#7aa2ff}}
body{margin:0;background:var(--bg);color:var(--fg);font:15px/1.55 system-ui,-apple-system,"Segoe UI",Roboto,"Noto Sans Ethiopic",sans-serif}
main{max-width:760px;margin:0 auto;padding:28px 16px 64px}
h1,h2,h3,h4{margin:28px 0 6px;line-height:1.25}
.desc{color:var(--muted);margin:0 0 12px}
.item{background:var(--card);border:1px solid var(--line);border-radius:14px;padding:14px 16px;margin:12px 0}
.meta{color:var(--muted);font-size:13px;margin-bottom:6px}
.meta b{color:var(--fg)}
.body{white-space:normal;word-wrap:break-word}
.note{margin-top:10px;padding-left:10px;border-left:3px solid var(--accent);color:var(--muted)}
.tags{margin-top:8px;font-size:13px;color:var(--accent)}
.empty{color:var(--muted);font-style:italic}
footer{margin-top:40px;color:var(--muted);font-size:12px;text-align:center}
</style></head><body><main>''');
  for (final s in sections) {
    final h = (s.depth + 1).clamp(1, 4);
    b.writeln('<h$h>${_esc(s.folder.name)}</h$h>');
    if (s.folder.description.isNotEmpty) b.writeln('<p class="desc">${_esc(s.folder.description)}</p>');
    if (s.items.isEmpty) b.writeln('<p class="empty">Nothing saved here yet.</p>');
    for (final i in s.items) {
      b.writeln('<div class="item"><div class="meta"><b>${_esc(_itemTitle(i))}</b> · ${_esc(_itemDate(i))}'
          '${i.post != null && i.post!.kind != 'text' ? ' · ${_esc(i.post!.kind)}' : ''}</div>');
      final body = _itemBody(i).trim();
      if (body.isNotEmpty) b.writeln('<div class="body">${_esc(body)}</div>');
      if (i.note.isNotEmpty) b.writeln('<div class="note">${_esc(i.note)}</div>');
      if (i.tags.isNotEmpty) b.writeln('<div class="tags">${i.tags.map((t) => '#${_esc(t)}').join(' ')}</div>');
      b.writeln('</div>');
    }
  }
  b.writeln('<footer>Exported from Triangle on ${_esc(_when.format(DateTime.now()))}</footer></main></body></html>');
  return b.toString();
}

/// Phone fonts, so text in any script shows (PDF's built-in fonts are
/// Latin only). Missing ones are skipped.
Future<pw.ThemeData> pdfTheme() async {
  pw.Font? load(List<String> names) {
    for (final n in names) {
      try {
        final f = File('/system/fonts/$n');
        if (f.existsSync()) return pw.Font.ttf(f.readAsBytesSync().buffer.asByteData());
      } catch (e) {
        debugPrint('[Export] font $n: $e');
      }
    }
    return null;
  }

  final base = load(['RobotoStatic-Regular.ttf', 'Roboto-Regular.ttf', 'NotoSans-Regular.ttf', 'DroidSans.ttf']);
  final bold = load(['RobotoStatic-Bold.ttf', 'Roboto-Bold.ttf', 'NotoSans-Bold.ttf', 'DroidSans-Bold.ttf']) ?? base;
  final fallback = [
    for (final names in [
      ['NotoSansEthiopic-Regular.ttf', 'NotoSansEthiopic-VF.ttf'],
      ['NotoSansArabic-Regular.ttf', 'NotoNaskhArabic-Regular.ttf'],
      ['NotoSansHebrew-Regular.ttf'],
      ['NotoSansDevanagari-Regular.ttf'],
      ['NotoSansThai-Regular.ttf'],
      ['NotoSansSymbols-Regular-Subsetted.ttf', 'NotoSansSymbols-Regular.ttf'],
    ])
      ?load(names),
  ];
  if (base == null) return pw.ThemeData.base();
  return pw.ThemeData.withFont(base: base, bold: bold, fontFallback: fallback);
}

Future<Uint8List> _pdf(List<_Section> sections) async {
  final doc = pw.Document(theme: await pdfTheme(), title: sections.first.folder.name, creator: 'Triangle');
  const muted = PdfColor.fromInt(0xFF6C6C76);
  const card = PdfColor.fromInt(0xFFF4F4F6);
  const line = PdfColor.fromInt(0xFFE3E3E8);
  const accent = PdfColor.fromInt(0xFF3B6EF5);
  doc.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.fromLTRB(40, 44, 40, 44),
      footer: (ctx) => pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text('Triangle · Content Canvas', style: const pw.TextStyle(fontSize: 8, color: muted)),
          pw.Text('${ctx.pageNumber} / ${ctx.pagesCount}', style: const pw.TextStyle(fontSize: 8, color: muted)),
        ],
      ),
      build: (ctx) => [
        for (final s in sections) ...[
          pw.Padding(
            padding: pw.EdgeInsets.only(top: s.depth == 0 ? 0 : 18, bottom: 4),
            child: pw.Text(
              s.depth == 0 ? s.folder.name : s.path,
              style: pw.TextStyle(fontSize: s.depth == 0 ? 22 : 15, fontWeight: pw.FontWeight.bold),
            ),
          ),
          if (s.folder.description.isNotEmpty)
            pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 6),
              child: pw.Text(s.folder.description, style: const pw.TextStyle(color: muted, fontSize: 10)),
            ),
          if (s.depth == 0)
            pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 10),
              child: pw.Text(
                'Exported ${_when.format(DateTime.now())} · ${sections.fold<int>(0, (n, x) => n + x.items.length)} items',
                style: const pw.TextStyle(color: muted, fontSize: 9),
              ),
            ),
          if (s.items.isEmpty)
            pw.Text('Nothing saved here yet.', style: pw.TextStyle(color: muted, fontStyle: pw.FontStyle.italic, fontSize: 10)),
          for (final i in s.items)
            pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 8),
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                color: card,
                border: pw.Border.all(color: line, width: 0.6),
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    '${_itemTitle(i)} · ${_itemDate(i)}${i.post != null && i.post!.kind != 'text' ? ' · ${i.post!.kind}' : ''}',
                    style: pw.TextStyle(fontSize: 9, color: muted, fontWeight: pw.FontWeight.bold),
                  ),
                  if (_itemBody(i).trim().isNotEmpty)
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(top: 4),
                      child: pw.Text(_itemBody(i).trim(), style: const pw.TextStyle(fontSize: 10.5, lineSpacing: 2)),
                    ),
                  if (i.note.isNotEmpty)
                    pw.Container(
                      margin: const pw.EdgeInsets.only(top: 6),
                      padding: const pw.EdgeInsets.only(left: 6),
                      decoration: const pw.BoxDecoration(border: pw.Border(left: pw.BorderSide(color: accent, width: 2))),
                      child: pw.Text(i.note, style: const pw.TextStyle(fontSize: 9.5, color: muted)),
                    ),
                  if (i.tags.isNotEmpty)
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(top: 4),
                      child: pw.Text(i.tags.map((t) => '#$t').join(' '), style: const pw.TextStyle(fontSize: 9, color: accent)),
                    ),
                ],
              ),
            ),
        ],
      ],
    ),
  );
  return doc.save();
}
