import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/theme.dart';
import '../../../../core/widgets/app_sheet.dart';
import '../../../canvas/canvas_store.dart';
import '../../../canvas/save_to_canvas.dart';

/// One text message (an SMS, a chat message, a Slack post) in full, the way
/// an email opens: who sent it, when and where, then all of its text.
class MessagePreview {
  const MessagePreview({
    required this.from,
    required this.text,
    this.to,
    this.date,
    this.source = '',
    this.icon = Icons.chat_bubble_outline_rounded,
    this.sent = false,
    this.replyUrl,
    this.openUrl,
  });

  final String from;
  final String? to;
  final String text;
  final DateTime? date;

  /// Where it came from, e.g. "SMS" or "#general · Slack".
  final String source;
  final IconData icon;

  /// Sent by the user rather than received.
  final bool sent;

  /// Where Reply goes (an sms: link); none hides it.
  final String? replyUrl;

  /// The message in its own app; none hides the button.
  final String? openUrl;
}

Future<void> showMessagePreview(BuildContext context, MessagePreview m) => showAppSheet<void>(
  context,
  initialSize: 0.7,
  builder: (context, scroll) => _MessagePreviewView(m: m, scroll: scroll),
);

class _MessagePreviewView extends ConsumerWidget {
  const _MessagePreviewView({required this.m, required this.scroll});
  final MessagePreview m;
  final ScrollController scroll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = m.date;
    return ListView(
      controller: scroll,
      padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.x4),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LetterAvatar(m.from, size: 44),
            const SizedBox(width: Space.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(m.from, style: context.text.titleMedium),
                  if (m.to != null && m.to!.isNotEmpty) Text('to ${m.to}', style: context.text.bodySmall),
                  if (date != null) Text(DateFormat('EEE d MMM y, HH:mm').format(date.toLocal()), style: context.text.bodySmall),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: Space.m),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            if (m.source.isNotEmpty) _Pill(m.source, icon: m.icon),
            _Pill(m.sent ? 'Sent' : 'Received', icon: m.sent ? Icons.north_east_rounded : Icons.south_west_rounded),
            _Pill('${m.text.characters.length} characters'),
          ],
        ),
        const SizedBox(height: Space.l),
        Container(
          padding: const EdgeInsets.all(Space.l),
          decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(Radii.l)),
          child: MarkdownBody(
            data: m.text.isEmpty ? '_No text_' : m.text,
            selectable: true,
            softLineBreak: true,
            onTapLink: (_, href, _) {
              if (href != null) launchUrl(Uri.parse(href), mode: LaunchMode.externalApplication);
            },
          ),
        ),
        const SizedBox(height: Space.l),
        Wrap(
          spacing: Space.s,
          runSpacing: Space.s,
          children: [
            if (m.replyUrl case final url?)
              FilledButton.tonalIcon(
                onPressed: () => launchUrl(Uri.parse(url)),
                icon: const Icon(Icons.reply_rounded, size: 18),
                label: const Text('Reply'),
              ),
            if (m.openUrl case final url?)
              FilledButton.tonalIcon(
                onPressed: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: const Text('Open'),
              ),
            OutlinedButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: m.text));
                showSnack(context, 'Message copied');
              },
              icon: const Icon(Icons.copy_rounded, size: 18),
              label: const Text('Copy text'),
            ),
            OutlinedButton.icon(
              onPressed: () => saveToCanvas(
                context,
                ref,
                kind: CanvasKind.message,
                title: 'From ${m.from}',
                text: m.text,
                url: m.openUrl ?? '',
                source: m.source,
              ),
              icon: const Icon(Icons.dashboard_customize_outlined, size: 18),
              label: const Text('Save to Canvas'),
            ),
          ],
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill(this.text, {this.icon});
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(999)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[Icon(icon, size: 14, color: AppColors.text2), const SizedBox(width: 4)],
        Text(text, style: TextStyle(fontSize: 12, color: AppColors.text2)),
      ],
    ),
  );
}
