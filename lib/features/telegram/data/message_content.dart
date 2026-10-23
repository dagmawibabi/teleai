import 'package:handy_tdlib/api.dart' as td;

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
