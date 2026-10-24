import 'package:handy_tdlib/api.dart' as td;
import 'rich_message.dart';

/// A message's content reduced to what a reader (or the model) needs.
class MessageGist {
  const MessageGist({required this.kind, this.text = '', this.formatted, this.detail});

  /// text, photo, video, document, audio, voice, video_note, sticker, gif,
  /// poll, location, contact, service, …
  final String kind;

  /// The text or caption.
  final String text;
  final td.FormattedText? formatted;

  /// A short line about the media: a file name, a poll question.
  final String? detail;

  bool get isMedia => kind != 'text' && kind != 'service';
}

MessageGist gistOf(td.MessageContent content) => switch (content) {
  td.MessageRichMessage(:final message) => MessageGist(
    kind: 'rich',
    text: richMessageMarkdown(message),
    detail: richMessagePreview(message),
  ),
  td.MessageText(:final text, :final linkPreview) => MessageGist(
    kind: 'text',
    text: text.text,
    formatted: text,
    detail: linkPreview == null
        ? null
        : 'Link preview: ${[if (linkPreview.siteName.isNotEmpty) linkPreview.siteName, if (linkPreview.title.isNotEmpty) linkPreview.title, if (linkPreview.description.text.isNotEmpty) linkPreview.description.text].join(' — ')} (${linkPreview.url})',
  ),
  td.MessagePhoto(:final caption) => MessageGist(kind: 'photo', text: caption.text, formatted: caption),
  td.MessageVideo(:final caption, :final video) => MessageGist(
    kind: 'video',
    text: caption.text,
    formatted: caption,
    detail: '${video.duration}s video',
  ),
  td.MessageAnimation(:final caption) => MessageGist(kind: 'gif', text: caption.text, formatted: caption),
  td.MessageDocument(:final caption, :final document) => MessageGist(
    kind: 'document',
    text: caption.text,
    formatted: caption,
    detail: document.fileName,
  ),
  td.MessageAudio(:final caption, :final audio) => MessageGist(
    kind: 'audio',
    text: caption.text,
    formatted: caption,
    detail: [audio.performer, audio.title].where((s) => s.isNotEmpty).join(' – '),
  ),
  td.MessageVoiceNote(:final caption, :final voiceNote) => MessageGist(
    kind: 'voice',
    text: caption.text,
    formatted: caption,
    detail: '${voiceNote.duration}s voice message',
  ),
  td.MessageVideoNote(:final videoNote) => MessageGist(kind: 'video_note', detail: '${videoNote.duration}s video message'),
  td.MessageSticker(:final sticker) => MessageGist(kind: 'sticker', text: sticker.emoji),
  td.MessagePoll(:final poll) => MessageGist(
    kind: 'poll',
    text: poll.question.text,
    detail: poll.options.map((o) => '• ${o.text.text} (${o.votePercentage}%)').join('\n'),
  ),
  td.MessageLocation() => const MessageGist(kind: 'location', text: 'Location'),
  td.MessageVenue(:final venue) => MessageGist(kind: 'location', text: venue.title, detail: venue.address),
  td.MessageContact(:final contact) => MessageGist(
    kind: 'contact',
    text: '${contact.firstName} ${contact.lastName}'.trim(),
    detail: contact.phoneNumber,
  ),
  td.MessageDice(:final emoji, :final value) => MessageGist(kind: 'dice', text: '$emoji $value'),
  td.MessageStory() => const MessageGist(kind: 'story', text: 'Shared a story'),
  td.MessagePinMessage() => const MessageGist(kind: 'service', text: 'Pinned a message'),
  td.MessageChatAddMembers() => const MessageGist(kind: 'service', text: 'Added members'),
  td.MessageChatJoinByLink() => const MessageGist(kind: 'service', text: 'Joined by link'),
  td.MessageChatDeleteMember() => const MessageGist(kind: 'service', text: 'A member left'),
  td.MessageChatChangeTitle(:final title) => MessageGist(kind: 'service', text: 'Changed the title to "$title"'),
  td.MessageChatChangePhoto() => const MessageGist(kind: 'service', text: 'Changed the photo'),
  td.MessageUnsupported() => const MessageGist(kind: 'unsupported', text: 'A message this app can\'t show'),
  _ => MessageGist(kind: 'service', text: _humanize(content.runtimeType.toString())),
};

String _humanize(String type) {
  final words = type.replaceFirst('Message', '').replaceAllMapped(RegExp('([a-z])([A-Z])'), (m) => '${m[1]} ${m[2]}');
  return words.isEmpty ? 'Message' : words;
}

/// A quote of [wanted] out of [body], the way Telegram accepts it, or null
/// when [wanted] isn't in [body].
///
/// Telegram takes only a quote that is exactly a piece of the message, at
/// the right UTF-16 position, carrying the message's bold, italic,
/// underline, strikethrough, spoiler and custom-emoji formatting over that
/// piece (and nothing else), at most [maxLength] long. What the model
/// copies rarely matches byte for byte (non-breaking spaces, line breaks,
/// curly quotes, dashes, case), so the match ignores those differences and
/// the quote is then cut from the message itself.
td.InputTextQuote? buildQuote(td.FormattedText body, String wanted, {int maxLength = 1024}) {
  final source = body.text;
  if (wanted.trim().isEmpty || source.isEmpty) return null;

  // Each kept character of [s], folded, with where it came from.
  (String, List<int>) fold(String s) {
    final out = StringBuffer();
    final from = <int>[];
    var space = false;
    for (var i = 0; i < s.length; i++) {
      var ch = s[i];
      if (_spaceLike.hasMatch(ch)) {
        if (space || out.isEmpty) continue;
        space = true;
        out.write(' ');
        from.add(i);
        continue;
      }
      space = false;
      ch = switch (ch) {
        '‘' || '’' || '‛' || '`' || '´' => "'",
        '“' || '”' || '„' || '«' || '»' => '"',
        '‐' || '‑' || '‒' || '–' || '—' || '−' => '-',
        _ => ch.toLowerCase(),
      };
      out.write(ch);
      from.add(i);
    }
    return (out.toString(), from);
  }

  final (hay, map) = fold(source);
  var (needle, _) = fold(wanted.trim());
  needle = needle.trim();
  // A model often wraps the excerpt in quotes or an ellipsis.
  needle = needle.replaceAll(RegExp(r'''^["'.…\s]+|["'.…\s]+$'''), '');
  if (needle.isEmpty) return null;
  final at = hay.indexOf(needle);
  if (at < 0) return null;
  var start = map[at];
  var end = map[at + needle.length - 1] + 1;
  // Never split a surrogate pair (emoji) at either end.
  if (end < source.length && end > 0 && _isHighSurrogate(source.codeUnitAt(end - 1))) end++;
  if (end - start > maxLength) {
    end = start + maxLength;
    final cut = source.lastIndexOf(' ', end);
    if (cut > start + maxLength ~/ 2) end = cut;
    if (_isHighSurrogate(source.codeUnitAt(end - 1))) end--;
  }
  while (start < end && source[start].trim().isEmpty) {
    start++;
  }
  while (end > start && source[end - 1].trim().isEmpty) {
    end--;
  }
  if (end <= start) return null;

  final entities = <td.TextEntity>[
    for (final e in body.entities)
      if (switch (e.type) {
        td.TextEntityTypeBold() ||
        td.TextEntityTypeItalic() ||
        td.TextEntityTypeUnderline() ||
        td.TextEntityTypeStrikethrough() ||
        td.TextEntityTypeSpoiler() ||
        td.TextEntityTypeCustomEmoji() => true,
        _ => false,
      })
        if (e.offset < end && e.offset + e.length > start)
          // A custom emoji can't be cut; one sticking out is left out.
          if (e.type is! td.TextEntityTypeCustomEmoji || (e.offset >= start && e.offset + e.length <= end))
            td.TextEntity(
              offset: (e.offset < start ? start : e.offset) - start,
              length: ((e.offset + e.length > end ? end : e.offset + e.length) - (e.offset < start ? start : e.offset)),
              type: e.type,
            ),
  ];
  return td.InputTextQuote(
    text: td.FormattedText(text: source.substring(start, end), entities: entities),
    richTexts: const [],
    position: start,
  );
}

final _spaceLike = RegExp(r'[\s  -​  　﻿]');

bool _isHighSurrogate(int unit) => unit >= 0xD800 && unit <= 0xDBFF;

/// The smallest photo size of at least [minWidth], or the largest there is.
td.PhotoSize? pickPhotoSize(List<td.PhotoSize> sizes, {int minWidth = 600}) {
  if (sizes.isEmpty) return null;
  final sorted = [...sizes]..sort((a, b) => a.width.compareTo(b.width));
  return sorted.where((s) => s.width >= minWidth).firstOrNull ?? sorted.last;
}

/// The picture a message carries, if any: a photo, or a video's or
/// document's thumbnail.
td.File? previewFileOf(td.MessageContent content) => switch (content) {
  td.MessagePhoto(:final photo) => pickPhotoSize(photo.sizes)?.photo,
  td.MessageVideo(:final video) => video.thumbnail?.file,
  td.MessageAnimation(:final animation) => animation.thumbnail?.file,
  td.MessageDocument(:final document) => document.thumbnail?.file,
  _ => null,
};
