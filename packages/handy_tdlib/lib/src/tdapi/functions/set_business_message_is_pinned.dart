part of '../tdapi.dart';

/// **SetBusinessMessageIsPinned** *(setBusinessMessageIsPinned)* - TDLib function
///
/// Pins or unpins a message sent on behalf of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which the message was sent.
/// * [chatId]: The chat the message belongs to.
/// * [messageId]: Identifier of the message.
/// * [isPinned]: Pass true to pin the message, pass false to unpin it.
///
/// [Ok] is returned on completion.
final class SetBusinessMessageIsPinned extends TdFunction {
  /// **SetBusinessMessageIsPinned** *(setBusinessMessageIsPinned)* - TDLib function
  ///
  /// Pins or unpins a message sent on behalf of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which the message was sent.
  /// * [chatId]: The chat the message belongs to.
  /// * [messageId]: Identifier of the message.
  /// * [isPinned]: Pass true to pin the message, pass false to unpin it.
  ///
  /// [Ok] is returned on completion.
  const SetBusinessMessageIsPinned({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    required this.isPinned,
  });

  /// Unique identifier of business connection on behalf of which the message was sent
  final String businessConnectionId;

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Pass true to pin the message, pass false to unpin it
  final bool isPinned;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "chat_id": chatId,
      "message_id": messageId,
      "is_pinned": isPinned,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection on behalf of which the message was sent
  /// * [chat_id]: The chat the message belongs to
  /// * [message_id]: Identifier of the message
  /// * [is_pinned]: Pass true to pin the message, pass false to unpin it
  SetBusinessMessageIsPinned copyWith({
    String? businessConnectionId,
    int? chatId,
    int? messageId,
    bool? isPinned,
  }) =>
      SetBusinessMessageIsPinned(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBusinessMessageIsPinned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
