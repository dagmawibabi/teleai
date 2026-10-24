part of '../tdapi.dart';

/// **AddQuickReplyShortcutMessage** *(addQuickReplyShortcutMessage)* - TDLib function
///
/// Adds a message to a quick reply shortcut. If shortcut doesn't exist and there are less than getOption("quick_reply_shortcut_count_max") shortcuts, then a new shortcut is created.. The shortcut must not contain more than getOption("quick_reply_shortcut_message_count_max") messages after adding the new message. Returns the added message.
///
/// * [shortcutName]: Name of the target shortcut.
/// * [replyToMessageId]: Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none.
/// * [inputMessageContent]: The content of the message to be added; inputMessagePaidMedia, inputMessageForwarded and inputMessageLiveLocation aren't supported.
///
/// [QuickReplyMessage] is returned on completion.
final class AddQuickReplyShortcutMessage extends TdFunction {
  /// **AddQuickReplyShortcutMessage** *(addQuickReplyShortcutMessage)* - TDLib function
  ///
  /// Adds a message to a quick reply shortcut. If shortcut doesn't exist and there are less than getOption("quick_reply_shortcut_count_max") shortcuts, then a new shortcut is created.. The shortcut must not contain more than getOption("quick_reply_shortcut_message_count_max") messages after adding the new message. Returns the added message.
  ///
  /// * [shortcutName]: Name of the target shortcut.
  /// * [replyToMessageId]: Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none.
  /// * [inputMessageContent]: The content of the message to be added; inputMessagePaidMedia, inputMessageForwarded and inputMessageLiveLocation aren't supported.
  ///
  /// [QuickReplyMessage] is returned on completion.
  const AddQuickReplyShortcutMessage({
    required this.shortcutName,
    required this.replyToMessageId,
    required this.inputMessageContent,
  });

  /// Name of the target shortcut
  final String shortcutName;

  /// Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none
  final int replyToMessageId;

  /// The content of the message to be added; inputMessagePaidMedia, inputMessageForwarded and inputMessageLiveLocation aren't supported
  final InputMessageContent inputMessageContent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "shortcut_name": shortcutName,
      "reply_to_message_id": replyToMessageId,
      "input_message_content": inputMessageContent.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_name]: Name of the target shortcut
  /// * [reply_to_message_id]: Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none
  /// * [input_message_content]: The content of the message to be added; inputMessagePaidMedia, inputMessageForwarded and inputMessageLiveLocation aren't supported
  AddQuickReplyShortcutMessage copyWith({
    String? shortcutName,
    int? replyToMessageId,
    InputMessageContent? inputMessageContent,
  }) =>
      AddQuickReplyShortcutMessage(
        shortcutName: shortcutName ?? this.shortcutName,
        replyToMessageId: replyToMessageId ?? this.replyToMessageId,
        inputMessageContent: inputMessageContent ?? this.inputMessageContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addQuickReplyShortcutMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
