import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../canvas/canvas_export.dart' show pdfTheme;
import '../domain/chat_models.dart';

/// A conversation as a file to keep or share.
enum ChatExportFormat {
  markdown('Markdown', 'md', 'text/markdown'),
  pdf('PDF', 'pdf', 'application/pdf');

  const ChatExportFormat(this.label, this.extension, this.mime);
  final String label;
  final String extension;
  final String mime;
}

final _when = DateFormat('d MMM y, HH:mm');

/// What an answer said, across its steps.
String _answer(AssistantEntry e) => [
  for (final s in e.steps)
    if (s.text.trim().isNotEmpty) s.text.trim(),
].join('\n\n');

List<String> _tools(AssistantEntry e) => [for (final s in e.steps) for (final t in s.tools) t.name];

/// Post refs ([Name](post:1:2)) read as plain names outside the app.
String _plainRefs(String text) => text.replaceAllMapped(RegExp(r'\[([^\]]+)\]\(post:[^)]+\)'), (m) => m[1]!);

String _fileName(Conversation c, ChatExportFormat f) {
  final safe = c.title.replaceAll(RegExp(r'[^\w\- ]+'), '').trim().replaceAll(RegExp(r'\s+'), '-');
  return '${safe.isEmpty ? 'chat' : safe}.${f.extension}';
}

/// [c] as Markdown: a heading per turn, answers as written.
String chatToMarkdown(Conversation c) {
  final b = StringBuffer('# ${c.title}\n\n_Exported from Triangle on ${_when.format(DateTime.now())}_\n\n');
  for (final e in c.entries) {
    switch (e) {
      case UserEntry(:final text, :final attachments, :final event):
        b.writeln('## ${event == null ? 'You' : 'Watch · $event'} · ${_when.format(e.at.toLocal())}\n');
        if (text.isNotEmpty) b.writeln('$text\n');
        for (final a in attachments) {
          b.writeln('- 📎 ${a.name}');
        }
        if (attachments.isNotEmpty) b.writeln();
      case AssistantEntry():
        b.writeln('## Assistant${e.model.isEmpty ? '' : ' · ${e.model}'}\n');
        final tools = _tools(e);
        if (tools.isNotEmpty) b.writeln('> Used ${tools.toSet().join(', ')}\n');
        final text = _answer(e);
        if (text.isNotEmpty) b.writeln('${_plainRefs(text)}\n');
        if (e.error != null) b.writeln('> ⚠ ${e.error}\n');
    }
  }
  return b.toString();
}

/// [c] as a PDF, set like the Content Canvas export.
Future<Uint8List> chatToPdf(Conversation c) async {
  final doc = pw.Document(theme: await pdfTheme(), title: c.title, creator: 'Triangle');
  const muted = PdfColor.fromInt(0xFF6C6C76);
  const you = PdfColor.fromInt(0xFFF0F0F3);
  const line = PdfColor.fromInt(0xFFE3E3E8);
  doc.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.fromLTRB(40, 44, 40, 44),
      footer: (ctx) => pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text('Triangle · ${c.title}', style: const pw.TextStyle(fontSize: 8, color: muted)),
          pw.Text('${ctx.pageNumber} / ${ctx.pagesCount}', style: const pw.TextStyle(fontSize: 8, color: muted)),
        ],
      ),
      build: (ctx) => [
        pw.Text(c.title, style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold)),
        pw.Padding(
          padding: const pw.EdgeInsets.only(top: 4, bottom: 14),
          child: pw.Text(
            'Exported ${_when.format(DateTime.now())} · ${c.entries.whereType<UserEntry>().length} questions',
            style: const pw.TextStyle(color: muted, fontSize: 9),
          ),
        ),
        for (final e in c.entries)
          switch (e) {
            UserEntry(:final text, :final attachments, :final event) => pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 10, left: 60),
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                color: you,
                border: pw.Border.all(color: line, width: 0.6),
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(10)),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    '${event == null ? 'You' : 'Watch · $event'} · ${_when.format(e.at.toLocal())}',
                    style: pw.TextStyle(fontSize: 8, color: muted, fontWeight: pw.FontWeight.bold),
                  ),
                  if (text.isNotEmpty)
                    pw.Padding(padding: const pw.EdgeInsets.only(top: 3), child: pw.Text(text, style: const pw.TextStyle(fontSize: 10.5))),
                  for (final a in attachments) pw.Text('Attached: ${a.name}', style: const pw.TextStyle(fontSize: 9, color: muted)),
                ],
              ),
            ),
            AssistantEntry() => pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 14),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Assistant${e.model.isEmpty ? '' : ' · ${e.model}'}${_tools(e).isEmpty ? '' : ' · used ${_tools(e).toSet().join(', ')}'}',
                    style: pw.TextStyle(fontSize: 8, color: muted, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 3),
                    child: pw.Text(
                      _plainRefs(_answer(e)).replaceAll(RegExp(r'^#+\s*', multiLine: true), '').replaceAll('**', ''),
                      style: const pw.TextStyle(fontSize: 10.5, lineSpacing: 2),
                    ),
                  ),
                  if (e.error != null) pw.Text('Error: ${e.error}', style: const pw.TextStyle(fontSize: 9, color: muted)),
                ],
              ),
            ),
          },
      ],
    ),
  );
  return doc.save();
}

/// [c] in [format]: its file name and bytes.
Future<(String, Uint8List)> exportChat(Conversation c, ChatExportFormat format) async => (
  _fileName(c, format),
  switch (format) {
    ChatExportFormat.markdown => Uint8List.fromList(utf8.encode(chatToMarkdown(c))),
    ChatExportFormat.pdf => await chatToPdf(c),
  },
);
