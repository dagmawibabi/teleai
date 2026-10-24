import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;

import '../../../app/theme.dart';
import '../../../infrastructure/telegram/telegram_client.dart';
import '../data/rich_message.dart';
import 'link_opener.dart';
import 'media_viewer.dart';
import 'message_tile.dart' show MediaPreview, DocumentRow;

/// A Telegram rich message: headings, paragraphs, lists, tables, quotes,
/// code, math, collapsible details and media, laid out as blocks.
class RichMessageView extends ConsumerStatefulWidget {
  const RichMessageView({super.key, required this.message, this.chatId, this.messageId, this.title = 'Media'});

  final td.RichMessage message;

  /// Where the message lives, to load the rest of a long one.
  final int? chatId;
  final int? messageId;
  final String title;

  @override
  ConsumerState<RichMessageView> createState() => _RichMessageViewState();
}

class _RichMessageViewState extends ConsumerState<RichMessageView> {
  td.RichMessage? _full;
  bool _loading = false;

  Future<void> _loadFull() async {
    if (widget.chatId == null || widget.messageId == null) return;
    setState(() => _loading = true);
    try {
      final full = await ref
          .read(telegramClientProvider)
          .send<td.RichMessage>(td.GetFullRichMessage(chatId: widget.chatId!, messageId: widget.messageId!));
      if (mounted) setState(() => _full = full);
    } catch (e) {
      if (mounted) showSnack(context, 'Couldn\'t load the rest: $e', icon: Icons.error_outline_rounded);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final m = _full ?? widget.message;
    return Directionality(
      textDirection: m.isRtl ? TextDirection.rtl : Directionality.of(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ..._blocks(context, m.blocks),
          if (!m.isFull)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton.icon(
                onPressed: _loading ? null : _loadFull,
                icon: _loading
                    ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.expand_more_rounded, size: 18),
                label: const Text('Show the whole message'),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _blocks(BuildContext context, List<td.PageBlock> blocks) => [
    for (final (i, b) in blocks.indexed)
      Padding(
        padding: EdgeInsets.only(top: i == 0 ? 0 : _gapBefore(b)),
        child: _block(context, b),
      ),
  ];

  double _gapBefore(td.PageBlock b) => switch (b) {
    td.PageBlockSectionHeading() || td.PageBlockHeader() || td.PageBlockTitle() || td.PageBlockSubheader() => 14,
    td.PageBlockDivider() => 4,
    _ => 8,
  };

  Widget _text(td.RichText? t, {TextStyle? style, TextAlign? align}) => Text.rich(
    richSpan(context, t),
    textAlign: align,
    style: const TextStyle(fontSize: 15, height: 1.4, color: AppColors.text).merge(style),
  );

  TextStyle _heading(int size) => TextStyle(
    fontSize: switch (size) {
      1 => 22,
      2 => 19,
      3 => 17,
      4 => 16,
      _ => 15,
    },
    fontWeight: FontWeight.w700,
    height: 1.25,
  );

  Widget _caption(td.PageBlockCaption? c) {
    if (c == null) return const SizedBox.shrink();
    final text = richTextMarkdown(c.text, marks: false).trim();
    final credit = richTextMarkdown(c.credit, marks: false).trim();
    if (text.isEmpty && credit.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (text.isNotEmpty) _text(c.text, style: const TextStyle(fontSize: 13, color: AppColors.text2)),
          if (credit.isNotEmpty) _text(c.credit, style: const TextStyle(fontSize: 12, color: AppColors.text3)),
        ],
      ),
    );
  }

  Widget _media(td.MessageContent content, td.PageBlockCaption? caption) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(Radii.s),
        child: MediaPreview(content: content, onOpen: () => showMediaViewer(context, content, title: widget.title)),
      ),
      _caption(caption),
    ],
  );

  static td.FormattedText get _noCaption => const td.FormattedText(text: '', entities: []);

  Widget _quote(Widget child, {td.RichText? credit, bool pull = false}) => Container(
    padding: const EdgeInsetsDirectional.only(start: 10, top: 2, bottom: 2),
    decoration: BoxDecoration(
      border: BorderDirectional(start: BorderSide(color: AppColors.accent, width: 3)),
    ),
    child: Column(
      crossAxisAlignment: pull ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        child,
        if (richTextMarkdown(credit, marks: false).trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: _text(credit, style: const TextStyle(fontSize: 13, color: AppColors.text3)),
          ),
      ],
    ),
  );

  Widget _block(BuildContext context, td.PageBlock b) => switch (b) {
    td.PageBlockTitle(:final title) => _text(title, style: _heading(1)),
    td.PageBlockSubtitle(:final subtitle) => _text(subtitle, style: const TextStyle(fontSize: 16, color: AppColors.text2)),
    td.PageBlockHeader(:final header) => _text(header, style: _heading(2)),
    td.PageBlockSubheader(:final subheader) => _text(subheader, style: _heading(3)),
    td.PageBlockSectionHeading(:final text, :final size) => _text(text, style: _heading(size)),
    td.PageBlockKicker(:final kicker) => _text(
      kicker,
      style: const TextStyle(fontSize: 12, letterSpacing: 1, fontWeight: FontWeight.w600, color: AppColors.text3),
    ),
    td.PageBlockAuthorDate(:final author) => _text(author, style: const TextStyle(fontSize: 13, color: AppColors.text3)),
    td.PageBlockParagraph(:final text) => _text(text),
    td.PageBlockFooter(:final footer) => _text(footer, style: const TextStyle(fontSize: 13, color: AppColors.text3)),
    td.PageBlockThinking(:final text) => _text(
      text,
      style: const TextStyle(fontStyle: FontStyle.italic, color: AppColors.text3, fontSize: 14),
    ),
    td.PageBlockPreformatted(:final text, :final language) => _CodeBlock(
      code: richTextMarkdown(text, marks: false),
      language: language,
    ),
    td.PageBlockDivider() => const Divider(height: 12, color: AppColors.line),
    td.PageBlockMathematicalExpression(:final expression) => _MathBlock(expression: expression),
    td.PageBlockAnchor() => const SizedBox.shrink(),
    td.PageBlockList(:final items) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final it in items)
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 24,
                  child: it.hasCheckbox
                      ? Icon(
                          it.isChecked ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded,
                          size: 18,
                          color: it.isChecked ? AppColors.accent : AppColors.text3,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Text(
                            it.label.isNotEmpty ? it.label : (it.value > 0 ? '${it.value}.' : '•'),
                            style: const TextStyle(fontSize: 15, height: 1.4, color: AppColors.text2),
                          ),
                        ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _blocks(context, it.blocks),
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
    td.PageBlockBlockQuote(:final blocks, :final credit) => _quote(
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: _blocks(context, blocks)),
      credit: credit,
    ),
    td.PageBlockExpandableBlockQuote(:final text, :final credit) => _quote(_ExpandableText(child: _text(text)), credit: credit),
    td.PageBlockPullQuote(:final text, :final credit) => _quote(
      _text(text, style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16), align: TextAlign.center),
      credit: credit,
      pull: true,
    ),
    td.PageBlockPhoto(:final photo?, :final caption, :final hasSpoiler) => _media(
      td.MessagePhoto(photo: photo, video: null, caption: _noCaption, showCaptionAboveMedia: false, hasSpoiler: hasSpoiler, isSecret: false),
      caption,
    ),
    td.PageBlockVideo(:final video?, :final caption, :final hasSpoiler) => _media(
      td.MessageVideo(
        video: video,
        alternativeVideos: const [],
        storyboards: const [],
        cover: null,
        startTimestamp: 0,
        caption: _noCaption,
        showCaptionAboveMedia: false,
        hasSpoiler: hasSpoiler,
        isSecret: false,
      ),
      caption,
    ),
    td.PageBlockAnimation(:final animation?, :final caption, :final hasSpoiler) => _media(
      td.MessageAnimation(animation: animation, caption: _noCaption, showCaptionAboveMedia: false, hasSpoiler: hasSpoiler, isSecret: false),
      caption,
    ),
    td.PageBlockPhoto(:final caption) || td.PageBlockVideo(:final caption) || td.PageBlockAnimation(:final caption) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [const _Chip(icon: Icons.image_not_supported_outlined, label: 'Media unavailable'), _caption(caption)],
    ),
    td.PageBlockDocument(:final document, :final caption) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [DocumentRow(document: document), _caption(caption)],
    ),
    td.PageBlockAudio(:final audio, :final caption) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Chip(
          icon: Icons.music_note_rounded,
          label: [audio.performer, audio.title].where((e) => e.isNotEmpty).join(' – ').ifEmpty(audio.fileName),
          onTap: () => showMediaViewer(context, td.MessageAudio(audio: audio, caption: _noCaption), title: widget.title),
        ),
        _caption(caption),
      ],
    ),
    td.PageBlockVoiceNote(:final voiceNote, :final caption) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Chip(
          icon: Icons.mic_rounded,
          label: 'Voice message · ${voiceNote.duration}s',
          onTap: () => showMediaViewer(
            context,
            td.MessageVoiceNote(voiceNote: voiceNote, caption: _noCaption, isListened: true),
            title: widget.title,
          ),
        ),
        _caption(caption),
      ],
    ),
    td.PageBlockCover(:final cover) => _block(context, cover),
    td.PageBlockEmbedded(:final url, :final caption) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Chip(icon: Icons.open_in_new_rounded, label: url.isEmpty ? 'Embedded content' : url, onTap: url.isEmpty ? null : () => openUrl(url, context: context)),
        _caption(caption),
      ],
    ),
    td.PageBlockEmbeddedPost(:final author, :final blocks, :final caption) => _quote(
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(author, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          ..._blocks(context, blocks),
          _caption(caption),
        ],
      ),
    ),
    td.PageBlockCollage(:final blocks, :final caption) || td.PageBlockSlideshow(:final blocks, :final caption) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: [
            for (final x in blocks)
              SizedBox(
                width: blocks.length == 1 ? double.infinity : 130,
                child: _block(context, x),
              ),
          ],
        ),
        _caption(caption),
      ],
    ),
    td.PageBlockChatLink(:final title, :final username) => _Chip(
      icon: Icons.forum_outlined,
      label: '$title · @$username',
      onTap: () => openUrl('https://t.me/$username', context: context),
    ),
    td.PageBlockTable(:final caption, :final cells, :final isBordered, :final isStriped, :final isCompact) => _TableBlock(
      caption: caption,
      cells: cells,
      bordered: isBordered,
      striped: isStriped,
      compact: isCompact,
      span: (t, style) => richSpan(context, t),
    ),
    td.PageBlockDetails(:final header, :final blocks, :final isOpen) => _Details(
      header: _text(header, style: const TextStyle(fontWeight: FontWeight.w600)),
      open: isOpen,
      children: _blocks(context, blocks),
    ),
    td.PageBlockRelatedArticles(:final header, :final articles) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _text(header, style: const TextStyle(fontWeight: FontWeight.w600)),
        for (final a in articles)
          _Chip(icon: Icons.article_outlined, label: a.title.isEmpty ? a.url : a.title, onTap: () => openUrl(a.url, context: context)),
      ],
    ),
    td.PageBlockMap(:final location, :final caption) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Chip(
          icon: Icons.place_outlined,
          label: '${location.latitude.toStringAsFixed(5)}, ${location.longitude.toStringAsFixed(5)}',
          onTap: () => openUrl('https://maps.google.com/?q=${location.latitude},${location.longitude}', context: context),
        ),
        _caption(caption),
      ],
    ),
    td.PageBlockButtonRow(:final buttons, :final align) => Wrap(
      alignment: switch (align) {
        td.PageBlockHorizontalAlignmentCenter() => WrapAlignment.center,
        td.PageBlockHorizontalAlignmentRight() => WrapAlignment.end,
        _ => WrapAlignment.start,
      },
      spacing: 6,
      children: [
        for (final btn in buttons)
          OutlinedButton(
            onPressed: switch (btn.type) {
              td.InlineKeyboardButtonTypeUrl(:final url) => () => openUrl(url, context: context),
              _ => null,
            },
            child: Text(richTextMarkdown(btn.text, marks: false)),
          ),
      ],
    ),
    td.PageBlockUnsupported() => const Text(
      'This part of the message isn\'t supported yet.',
      style: TextStyle(fontSize: 13, color: AppColors.text3),
    ),
  };
}

extension on String {
  String ifEmpty(String other) => isEmpty ? other : this;
}

/// A rich text as spans: bold, italics, links, code, spoilers and the rest.
InlineSpan richSpan(BuildContext context, td.RichText? t, {TextStyle style = const TextStyle()}) {
  InlineSpan inner(td.RichText x, TextStyle s) => richSpan(context, x, style: style.merge(s));
  TapGestureRecognizer tap(String url) => TapGestureRecognizer()..onTap = () => openUrl(url, context: context);
  final link = TextStyle(color: AppColors.accent, decoration: TextDecoration.underline, decorationColor: AppColors.accent);
  return switch (t) {
    null => const TextSpan(),
    td.RichTextPlain(:final text) => TextSpan(text: text, style: style),
    td.RichTexts(:final texts) => TextSpan(children: [for (final x in texts) richSpan(context, x, style: style)]),
    td.RichTextBold(:final text) => inner(text, const TextStyle(fontWeight: FontWeight.w700)),
    td.RichTextItalic(:final text) => inner(text, const TextStyle(fontStyle: FontStyle.italic)),
    td.RichTextUnderline(:final text) => inner(text, const TextStyle(decoration: TextDecoration.underline)),
    td.RichTextStrikethrough(:final text) => inner(text, const TextStyle(decoration: TextDecoration.lineThrough)),
    td.RichTextSpoiler(:final text) => WidgetSpan(
      alignment: PlaceholderAlignment.baseline,
      baseline: TextBaseline.alphabetic,
      child: _Spoiler(child: Text.rich(richSpan(context, text, style: style))),
    ),
    td.RichTextMarked(:final text) => inner(text, TextStyle(backgroundColor: AppColors.warning.withValues(alpha: 0.28))),
    td.RichTextSubscript(:final text) => inner(text, const TextStyle(fontSize: 11, fontFeatures: [FontFeature.subscripts()])),
    td.RichTextSuperscript(:final text) => inner(text, const TextStyle(fontSize: 11, fontFeatures: [FontFeature.superscripts()])),
    td.RichTextFixed(:final text) => inner(
      text,
      const TextStyle(fontFamily: 'monospace', fontSize: 13.5, backgroundColor: AppColors.surface3),
    ),
    td.RichTextUrl(:final text, :final url) => TextSpan(
      children: [richSpan(context, text, style: style.merge(link))],
      recognizer: tap(url),
    ),
    td.RichTextAnchorLink(:final text, :final url) || td.RichTextReferenceLink(:final text, :final url) =>
      url.isEmpty ? inner(text, link) : TextSpan(children: [richSpan(context, text, style: style.merge(link))], recognizer: tap(url)),
    td.RichTextEmailAddress(:final text, :final emailAddress) => TextSpan(
      children: [richSpan(context, text, style: style.merge(link))],
      recognizer: tap('mailto:$emailAddress'),
    ),
    td.RichTextPhoneNumber(:final text, :final phoneNumber) => TextSpan(
      children: [richSpan(context, text, style: style.merge(link))],
      recognizer: tap('tel:$phoneNumber'),
    ),
    td.RichTextMention(:final text, :final username) => TextSpan(
      children: [richSpan(context, text, style: style.merge(link))],
      recognizer: tap('https://t.me/$username'),
    ),
    td.RichTextMentionName(:final text) ||
    td.RichTextHashtag(:final text) ||
    td.RichTextCashtag(:final text) ||
    td.RichTextBotCommand(:final text) => inner(text, TextStyle(color: AppColors.accent)),
    td.RichTextBankCardNumber(:final text) || td.RichTextTonAddress(:final text) => inner(
      text,
      const TextStyle(fontFamily: 'monospace'),
    ),
    td.RichTextDateTime(:final text) => inner(text, const TextStyle(decoration: TextDecoration.underline, decorationStyle: TextDecorationStyle.dotted)),
    td.RichTextReference(:final text) => inner(text, const TextStyle()),
    td.RichTextDiff(:final text, :final oldText) => TextSpan(
      children: [
        richSpan(context, oldText, style: style.merge(const TextStyle(decoration: TextDecoration.lineThrough, color: AppColors.danger))),
        richSpan(context, text, style: style.merge(const TextStyle(color: AppColors.success))),
      ],
    ),
    td.RichTextCustomEmoji(:final alternativeText) => TextSpan(text: alternativeText, style: style),
    td.RichTextMathematicalExpression(:final expression) => TextSpan(
      text: expression,
      style: style.merge(const TextStyle(fontFamily: 'serif', fontStyle: FontStyle.italic)),
    ),
    td.RichTextButton(:final button) => TextSpan(
      text: ' ${richTextMarkdown(button.text, marks: false)} ',
      style: style.merge(TextStyle(color: AppColors.accent, backgroundColor: AppColors.accentDim)),
      recognizer: switch (button.type) {
        td.InlineKeyboardButtonTypeUrl(:final url) => tap(url),
        _ => null,
      },
    ),
    td.RichTextIcon() || td.RichTextAnchor() => const TextSpan(),
  };
}

class _Spoiler extends StatefulWidget {
  const _Spoiler({required this.child});
  final Widget child;

  @override
  State<_Spoiler> createState() => _SpoilerState();
}

class _SpoilerState extends State<_Spoiler> {
  bool _shown = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => setState(() => _shown = !_shown),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(color: _shown ? Colors.transparent : AppColors.surface3, borderRadius: BorderRadius.circular(4)),
      child: Opacity(opacity: _shown ? 1 : 0, child: widget.child),
    ),
  );
}

class _ExpandableText extends StatefulWidget {
  const _ExpandableText({required this.child});
  final Widget child;

  @override
  State<_ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<_ExpandableText> {
  bool _open = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => setState(() => _open = !_open),
    child: AnimatedSize(
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.topCenter,
      child: _open
          ? widget.child
          : ShaderMask(
              shaderCallback: (r) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.transparent],
                stops: [0.6, 1],
              ).createShader(r),
              blendMode: BlendMode.dstIn,
              child: ConstrainedBox(constraints: const BoxConstraints(maxHeight: 72), child: ClipRect(child: widget.child)),
            ),
    ),
  );
}

class _Details extends StatefulWidget {
  const _Details({required this.header, required this.open, required this.children});
  final Widget header;
  final bool open;
  final List<Widget> children;

  @override
  State<_Details> createState() => _DetailsState();
}

class _DetailsState extends State<_Details> {
  late bool _open = widget.open;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(Radii.s)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(Radii.s),
          onTap: () => setState(() => _open = !_open),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                AnimatedRotation(
                  turns: _open ? 0.25 : 0,
                  duration: const Duration(milliseconds: 180),
                  child: const Icon(Icons.chevron_right_rounded, size: 20, color: AppColors.text2),
                ),
                const SizedBox(width: 4),
                Expanded(child: widget.header),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topCenter,
          child: _open
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: widget.children),
                )
              : const SizedBox(width: double.infinity),
        ),
      ],
    ),
  );
}

class _CodeBlock extends StatelessWidget {
  const _CodeBlock({required this.code, required this.language});
  final String code;
  final String language;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.surface2,
      borderRadius: BorderRadius.circular(Radii.s),
      border: Border.all(color: AppColors.line),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 4, 2, 0),
          child: Row(
            children: [
              Expanded(
                child: Text(language.isEmpty ? 'code' : language, style: const TextStyle(fontSize: 11.5, color: AppColors.text3)),
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                iconSize: 16,
                tooltip: 'Copy',
                icon: const Icon(Icons.copy_rounded, color: AppColors.text3),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: code));
                  showSnack(context, 'Code copied');
                },
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: SelectableText(code, style: const TextStyle(fontFamily: 'monospace', fontSize: 13, height: 1.45)),
        ),
      ],
    ),
  );
}

class _MathBlock extends StatelessWidget {
  const _MathBlock({required this.expression});
  final String expression;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(Radii.s)),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Text(
        expression,
        style: const TextStyle(fontFamily: 'serif', fontStyle: FontStyle.italic, fontSize: 16),
      ),
    ),
  );
}

class _TableBlock extends StatelessWidget {
  const _TableBlock({
    required this.caption,
    required this.cells,
    required this.bordered,
    required this.striped,
    required this.compact,
    required this.span,
  });

  final td.RichText? caption;
  final List<List<td.PageBlockTableCell>> cells;
  final bool bordered;
  final bool striped;
  final bool compact;
  final InlineSpan Function(td.RichText?, TextStyle) span;

  @override
  Widget build(BuildContext context) {
    if (cells.isEmpty) return const SizedBox.shrink();
    final width = cells.map((r) => r.fold<int>(0, (n, c) => n + (c.colspan < 1 ? 1 : c.colspan))).reduce((a, b) => a > b ? a : b);
    final pad = compact ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4) : const EdgeInsets.symmetric(horizontal: 10, vertical: 7);
    Widget cellWidget(td.PageBlockTableCell c) => Padding(
      padding: pad,
      child: Text.rich(
        span(c.text, const TextStyle()),
        textAlign: switch (c.align) {
          td.PageBlockHorizontalAlignmentCenter() => TextAlign.center,
          td.PageBlockHorizontalAlignmentRight() => TextAlign.end,
          _ => TextAlign.start,
        },
        style: TextStyle(
          fontSize: 14,
          height: 1.35,
          color: AppColors.text,
          fontWeight: c.isHeader ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
    );
    // Flutter's Table has no colspan, so a spanning cell is followed by
    // blanks; rows are padded to the widest one.
    final rows = <TableRow>[];
    for (final (i, r) in cells.indexed) {
      final children = <Widget>[];
      for (final c in r) {
        children.add(c.text == null ? const SizedBox.shrink() : cellWidget(c));
        for (var k = 1; k < c.colspan; k++) {
          children.add(const SizedBox.shrink());
        }
      }
      while (children.length < width) {
        children.add(const SizedBox.shrink());
      }
      final header = r.isNotEmpty && r.every((c) => c.isHeader);
      rows.add(
        TableRow(
          decoration: BoxDecoration(
            color: header ? AppColors.surface3 : (striped && i.isEven ? AppColors.surface2 : null),
          ),
          children: children.take(width).toList(),
        ),
      );
    }
    final hasCaption = richTextMarkdown(caption, marks: false).trim().isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasCaption)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text.rich(span(caption, const TextStyle()), style: const TextStyle(fontSize: 13, color: AppColors.text2)),
          ),
        ClipRRect(
          borderRadius: BorderRadius.circular(Radii.s),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 200),
              child: Table(
                defaultColumnWidth: const IntrinsicColumnWidth(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: bordered
                    ? TableBorder.all(color: AppColors.line, borderRadius: BorderRadius.circular(Radii.s))
                    : const TableBorder(horizontalInside: BorderSide(color: AppColors.line)),
                children: rows,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.icon, required this.label, this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: AppColors.surface2,
    borderRadius: BorderRadius.circular(Radii.s),
    child: InkWell(
      borderRadius: BorderRadius.circular(Radii.s),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        child: Row(
          children: [
            Icon(icon, size: 18, color: AppColors.text2),
            const SizedBox(width: 8),
            Expanded(child: Text(label, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14))),
          ],
        ),
      ),
    ),
  );
}
