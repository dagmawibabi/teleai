part of '../tdapi.dart';

/// **GetMessagePublicForwards** *(getMessagePublicForwards)* - TDLib function
///
/// Returns forwarded copies of a channel message to different public channels and public reposts as a story. Can be used only. if messageProperties.can_get_statistics == true. For optimal performance, the number of returned messages and stories is chosen by TDLib.
///
/// * [chatId]: Chat identifier of the message.
/// * [messageId]: Message identifier.
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of messages and stories to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit.
///
/// [PublicForwards] is returned on completion.
final class GetMessagePublicForwards extends TdFunction {
  /// **GetMessagePublicForwards** *(getMessagePublicForwards)* - TDLib function
  ///
  /// Returns forwarded copies of a channel message to different public channels and public reposts as a story. Can be used only. if messageProperties.can_get_statistics == true. For optimal performance, the number of returned messages and stories is chosen by TDLib.
  ///
  /// * [chatId]: Chat identifier of the message.
  /// * [messageId]: Message identifier.
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of messages and stories to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [PublicForwards] is returned on completion.
  const GetMessagePublicForwards({
    required this.chatId,
    required this.messageId,
    required this.offset,
    required this.limit,
  });

  /// Chat identifier of the message
  final int chatId;

  /// Message identifier
  final int messageId;

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of messages and stories to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the message
  /// * [message_id]: Message identifier
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of messages and stories to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
  GetMessagePublicForwards copyWith({
    int? chatId,
    int? messageId,
    String? offset,
    int? limit,
  }) =>
      GetMessagePublicForwards(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessagePublicForwards';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
