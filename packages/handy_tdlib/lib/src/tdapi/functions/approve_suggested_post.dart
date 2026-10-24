part of '../tdapi.dart';

/// **ApproveSuggestedPost** *(approveSuggestedPost)* - TDLib function
///
/// Approves a suggested post in a channel direct messages chat.
///
/// * [chatId]: Chat identifier of the channel direct messages chat.
/// * [messageId]: Identifier of the message with the suggested post. Use messageProperties.can_be_approved to check whether the suggested post can be approved.
/// * [sendDate]: Point in time (Unix timestamp) when the post is expected to be published; pass 0 if the date has already been chosen. If specified,. then the date must be in the future, but at most getOption("suggested_post_send_delay_max") seconds in the future.
///
/// [Ok] is returned on completion.
final class ApproveSuggestedPost extends TdFunction {
  /// **ApproveSuggestedPost** *(approveSuggestedPost)* - TDLib function
  ///
  /// Approves a suggested post in a channel direct messages chat.
  ///
  /// * [chatId]: Chat identifier of the channel direct messages chat.
  /// * [messageId]: Identifier of the message with the suggested post. Use messageProperties.can_be_approved to check whether the suggested post can be approved.
  /// * [sendDate]: Point in time (Unix timestamp) when the post is expected to be published; pass 0 if the date has already been chosen. If specified,. then the date must be in the future, but at most getOption("suggested_post_send_delay_max") seconds in the future.
  ///
  /// [Ok] is returned on completion.
  const ApproveSuggestedPost({
    required this.chatId,
    required this.messageId,
    required this.sendDate,
  });

  /// Chat identifier of the channel direct messages chat
  final int chatId;

  /// Identifier of the message with the suggested post. Use messageProperties.can_be_approved to check whether the suggested post can be approved
  final int messageId;

  /// Point in time (Unix timestamp) when the post is expected to be published; pass 0 if the date has already been chosen. If specified,. then the date must be in the future, but at most getOption("suggested_post_send_delay_max") seconds in the future
  final int sendDate;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "send_date": sendDate,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the channel direct messages chat
  /// * [message_id]: Identifier of the message with the suggested post. Use messageProperties.can_be_approved to check whether the suggested post can be approved
  /// * [send_date]: Point in time (Unix timestamp) when the post is expected to be published; pass 0 if the date has already been chosen. If specified,. then the date must be in the future, but at most getOption("suggested_post_send_delay_max") seconds in the future
  ApproveSuggestedPost copyWith({
    int? chatId,
    int? messageId,
    int? sendDate,
  }) =>
      ApproveSuggestedPost(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        sendDate: sendDate ?? this.sendDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'approveSuggestedPost';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
