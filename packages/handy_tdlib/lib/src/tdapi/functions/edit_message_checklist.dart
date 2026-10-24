part of '../tdapi.dart';

/// **EditMessageChecklist** *(editMessageChecklist)* - TDLib function
///
/// Edits the message content of a checklist. Returns the edited message after the edit is completed on the server side.
///
/// * [chatId]: The chat the message belongs to.
/// * [messageId]: Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited.
/// * [replyMarkup]: The new message reply markup; pass null if none; for bots only *(optional)*.
/// * [checklist]: The new checklist. If some tasks were completed, this information will be kept.
///
/// [Message] is returned on completion.
final class EditMessageChecklist extends TdFunction {
  /// **EditMessageChecklist** *(editMessageChecklist)* - TDLib function
  ///
  /// Edits the message content of a checklist. Returns the edited message after the edit is completed on the server side.
  ///
  /// * [chatId]: The chat the message belongs to.
  /// * [messageId]: Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited.
  /// * [replyMarkup]: The new message reply markup; pass null if none; for bots only *(optional)*.
  /// * [checklist]: The new checklist. If some tasks were completed, this information will be kept.
  ///
  /// [Message] is returned on completion.
  const EditMessageChecklist({
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    required this.checklist,
  });

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited
  final int messageId;

  /// The new message reply markup; pass null if none; for bots only
  final ReplyMarkup? replyMarkup;

  /// The new checklist. If some tasks were completed, this information will be kept
  final InputChecklist checklist;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "reply_markup": replyMarkup?.toJson(),
      "checklist": checklist.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The chat the message belongs to
  /// * [message_id]: Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited
  /// * [reply_markup]: The new message reply markup; pass null if none; for bots only
  /// * [checklist]: The new checklist. If some tasks were completed, this information will be kept
  EditMessageChecklist copyWith({
    int? chatId,
    int? messageId,
    ReplyMarkup? replyMarkup,
    InputChecklist? checklist,
  }) =>
      EditMessageChecklist(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        checklist: checklist ?? this.checklist,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editMessageChecklist';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
