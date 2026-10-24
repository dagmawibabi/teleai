part of '../tdapi.dart';

/// **DeclineSuggestedPost** *(declineSuggestedPost)* - TDLib function
///
/// Declines a suggested post in a channel direct messages chat.
///
/// * [chatId]: Chat identifier of the channel direct messages chat.
/// * [messageId]: Identifier of the message with the suggested post. Use messageProperties.can_be_declined to check whether the suggested post can be declined.
/// * [comment]: Comment for the creator of the suggested post; 0-128 characters.
///
/// [Ok] is returned on completion.
final class DeclineSuggestedPost extends TdFunction {
  /// **DeclineSuggestedPost** *(declineSuggestedPost)* - TDLib function
  ///
  /// Declines a suggested post in a channel direct messages chat.
  ///
  /// * [chatId]: Chat identifier of the channel direct messages chat.
  /// * [messageId]: Identifier of the message with the suggested post. Use messageProperties.can_be_declined to check whether the suggested post can be declined.
  /// * [comment]: Comment for the creator of the suggested post; 0-128 characters.
  ///
  /// [Ok] is returned on completion.
  const DeclineSuggestedPost({
    required this.chatId,
    required this.messageId,
    required this.comment,
  });

  /// Chat identifier of the channel direct messages chat
  final int chatId;

  /// Identifier of the message with the suggested post. Use messageProperties.can_be_declined to check whether the suggested post can be declined
  final int messageId;

  /// Comment for the creator of the suggested post; 0-128 characters
  final String comment;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "comment": comment,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the channel direct messages chat
  /// * [message_id]: Identifier of the message with the suggested post. Use messageProperties.can_be_declined to check whether the suggested post can be declined
  /// * [comment]: Comment for the creator of the suggested post; 0-128 characters
  DeclineSuggestedPost copyWith({
    int? chatId,
    int? messageId,
    String? comment,
  }) =>
      DeclineSuggestedPost(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        comment: comment ?? this.comment,
      );

  /// TDLib object type
  static const String defaultObjectId = 'declineSuggestedPost';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
