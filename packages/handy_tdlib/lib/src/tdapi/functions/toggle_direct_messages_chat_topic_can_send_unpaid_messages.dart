part of '../tdapi.dart';

/// **ToggleDirectMessagesChatTopicCanSendUnpaidMessages** *(toggleDirectMessagesChatTopicCanSendUnpaidMessages)* - TDLib function
///
/// Allows to send unpaid messages to the given topic of the channel direct messages chat administered by the current user.
///
/// * [chatId]: Chat identifier.
/// * [topicId]: Identifier of the topic.
/// * [canSendUnpaidMessages]: Pass true to allow unpaid messages; pass false to disallow unpaid messages.
/// * [refundPayments]: Pass true to refund the user previously paid messages.
///
/// [Ok] is returned on completion.
final class ToggleDirectMessagesChatTopicCanSendUnpaidMessages
    extends TdFunction {
  /// **ToggleDirectMessagesChatTopicCanSendUnpaidMessages** *(toggleDirectMessagesChatTopicCanSendUnpaidMessages)* - TDLib function
  ///
  /// Allows to send unpaid messages to the given topic of the channel direct messages chat administered by the current user.
  ///
  /// * [chatId]: Chat identifier.
  /// * [topicId]: Identifier of the topic.
  /// * [canSendUnpaidMessages]: Pass true to allow unpaid messages; pass false to disallow unpaid messages.
  /// * [refundPayments]: Pass true to refund the user previously paid messages.
  ///
  /// [Ok] is returned on completion.
  const ToggleDirectMessagesChatTopicCanSendUnpaidMessages({
    required this.chatId,
    required this.topicId,
    required this.canSendUnpaidMessages,
    required this.refundPayments,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the topic
  final int topicId;

  /// Pass true to allow unpaid messages; pass false to disallow unpaid messages
  final bool canSendUnpaidMessages;

  /// Pass true to refund the user previously paid messages
  final bool refundPayments;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId,
      "can_send_unpaid_messages": canSendUnpaidMessages,
      "refund_payments": refundPayments,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [topic_id]: Identifier of the topic
  /// * [can_send_unpaid_messages]: Pass true to allow unpaid messages; pass false to disallow unpaid messages
  /// * [refund_payments]: Pass true to refund the user previously paid messages
  ToggleDirectMessagesChatTopicCanSendUnpaidMessages copyWith({
    int? chatId,
    int? topicId,
    bool? canSendUnpaidMessages,
    bool? refundPayments,
  }) =>
      ToggleDirectMessagesChatTopicCanSendUnpaidMessages(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        canSendUnpaidMessages:
            canSendUnpaidMessages ?? this.canSendUnpaidMessages,
        refundPayments: refundPayments ?? this.refundPayments,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'toggleDirectMessagesChatTopicCanSendUnpaidMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
