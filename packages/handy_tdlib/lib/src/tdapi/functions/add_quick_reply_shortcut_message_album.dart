part of '../tdapi.dart';

/// **AddQuickReplyShortcutMessageAlbum** *(addQuickReplyShortcutMessageAlbum)* - TDLib function
///
/// Adds 2-10 messages grouped together into an album to a quick reply shortcut. Currently, only audio, document, photo and video messages can be grouped into an album.. Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages.
///
/// * [shortcutName]: Name of the target shortcut.
/// * [replyToMessageId]: Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none.
/// * [inputMessageContents]: Contents of messages to be sent. At most 10 messages can be added to an album. All messages must have the same value of show_caption_above_media.
///
/// [QuickReplyMessages] is returned on completion.
final class AddQuickReplyShortcutMessageAlbum extends TdFunction {
  /// **AddQuickReplyShortcutMessageAlbum** *(addQuickReplyShortcutMessageAlbum)* - TDLib function
  ///
  /// Adds 2-10 messages grouped together into an album to a quick reply shortcut. Currently, only audio, document, photo and video messages can be grouped into an album.. Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages.
  ///
  /// * [shortcutName]: Name of the target shortcut.
  /// * [replyToMessageId]: Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none.
  /// * [inputMessageContents]: Contents of messages to be sent. At most 10 messages can be added to an album. All messages must have the same value of show_caption_above_media.
  ///
  /// [QuickReplyMessages] is returned on completion.
  const AddQuickReplyShortcutMessageAlbum({
    required this.shortcutName,
    required this.replyToMessageId,
    required this.inputMessageContents,
  });

  /// Name of the target shortcut
  final String shortcutName;

  /// Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none
  final int replyToMessageId;

  /// Contents of messages to be sent. At most 10 messages can be added to an album. All messages must have the same value of show_caption_above_media
  final List<InputMessageContent> inputMessageContents;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "shortcut_name": shortcutName,
      "reply_to_message_id": replyToMessageId,
      "input_message_contents":
          inputMessageContents.map((i) => i.toJson()).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_name]: Name of the target shortcut
  /// * [reply_to_message_id]: Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none
  /// * [input_message_contents]: Contents of messages to be sent. At most 10 messages can be added to an album. All messages must have the same value of show_caption_above_media
  AddQuickReplyShortcutMessageAlbum copyWith({
    String? shortcutName,
    int? replyToMessageId,
    List<InputMessageContent>? inputMessageContents,
  }) =>
      AddQuickReplyShortcutMessageAlbum(
        shortcutName: shortcutName ?? this.shortcutName,
        replyToMessageId: replyToMessageId ?? this.replyToMessageId,
        inputMessageContents: inputMessageContents ?? this.inputMessageContents,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addQuickReplyShortcutMessageAlbum';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
