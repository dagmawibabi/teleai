part of '../tdapi.dart';

/// **SetChatDraftMessage** *(setChatDraftMessage)* - TDLib function
///
/// Changes the draft message in a chat or a topic.
///
/// * [chatId]: Chat identifier.
/// * [topicId]: Topic in which the draft will be changed; pass null to change the draft for the chat itself *(optional)*.
/// * [draftMessage]: New draft message; pass null to remove the draft *(optional)*.
///
/// [Ok] is returned on completion.
final class SetChatDraftMessage extends TdFunction {
  /// **SetChatDraftMessage** *(setChatDraftMessage)* - TDLib function
  ///
  /// Changes the draft message in a chat or a topic.
  ///
  /// * [chatId]: Chat identifier.
  /// * [topicId]: Topic in which the draft will be changed; pass null to change the draft for the chat itself *(optional)*.
  /// * [draftMessage]: New draft message; pass null to remove the draft *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetChatDraftMessage({
    required this.chatId,
    this.topicId,
    this.draftMessage,
  });

  /// Chat identifier
  final int chatId;

  /// Topic in which the draft will be changed; pass null to change the draft for the chat itself
  final MessageTopic? topicId;

  /// New draft message; pass null to remove the draft
  final DraftMessage? draftMessage;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId?.toJson(),
      "draft_message": draftMessage?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [topic_id]: Topic in which the draft will be changed; pass null to change the draft for the chat itself
  /// * [draft_message]: New draft message; pass null to remove the draft
  SetChatDraftMessage copyWith({
    int? chatId,
    MessageTopic? topicId,
    DraftMessage? draftMessage,
  }) =>
      SetChatDraftMessage(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        draftMessage: draftMessage ?? this.draftMessage,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatDraftMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
