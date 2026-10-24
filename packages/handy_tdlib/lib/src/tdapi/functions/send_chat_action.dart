part of '../tdapi.dart';

/// **SendChatAction** *(sendChatAction)* - TDLib function
///
/// Sends a notification about user activity in a chat.
///
/// * [chatId]: Chat identifier.
/// * [topicId]: Identifier of the topic in which the action is performed; pass null if none *(optional)*.
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request; for bots only.
/// * [action]: The action description; pass null to cancel the currently active action *(optional)*.
///
/// [Ok] is returned on completion.
final class SendChatAction extends TdFunction {
  /// **SendChatAction** *(sendChatAction)* - TDLib function
  ///
  /// Sends a notification about user activity in a chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [topicId]: Identifier of the topic in which the action is performed; pass null if none *(optional)*.
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request; for bots only.
  /// * [action]: The action description; pass null to cancel the currently active action *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SendChatAction({
    required this.chatId,
    this.topicId,
    required this.businessConnectionId,
    this.action,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the topic in which the action is performed; pass null if none
  final MessageTopic? topicId;

  /// Unique identifier of business connection on behalf of which to send the request; for bots only
  final String businessConnectionId;

  /// The action description; pass null to cancel the currently active action
  final ChatAction? action;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId?.toJson(),
      "business_connection_id": businessConnectionId,
      "action": action?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [topic_id]: Identifier of the topic in which the action is performed; pass null if none
  /// * [business_connection_id]: Unique identifier of business connection on behalf of which to send the request; for bots only
  /// * [action]: The action description; pass null to cancel the currently active action
  SendChatAction copyWith({
    int? chatId,
    MessageTopic? topicId,
    String? businessConnectionId,
    ChatAction? action,
  }) =>
      SendChatAction(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        action: action ?? this.action,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendChatAction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
