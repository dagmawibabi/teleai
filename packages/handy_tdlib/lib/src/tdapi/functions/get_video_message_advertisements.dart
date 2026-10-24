part of '../tdapi.dart';

/// **GetVideoMessageAdvertisements** *(getVideoMessageAdvertisements)* - TDLib function
///
/// Returns advertisements to be shown while a video from a message is watched. Available only if messageProperties.can_get_video_advertisements.
///
/// * [chatId]: Identifier of the chat with the message.
/// * [messageId]: Identifier of the message.
///
/// [VideoMessageAdvertisements] is returned on completion.
final class GetVideoMessageAdvertisements extends TdFunction {
  /// **GetVideoMessageAdvertisements** *(getVideoMessageAdvertisements)* - TDLib function
  ///
  /// Returns advertisements to be shown while a video from a message is watched. Available only if messageProperties.can_get_video_advertisements.
  ///
  /// * [chatId]: Identifier of the chat with the message.
  /// * [messageId]: Identifier of the message.
  ///
  /// [VideoMessageAdvertisements] is returned on completion.
  const GetVideoMessageAdvertisements({
    required this.chatId,
    required this.messageId,
  });

  /// Identifier of the chat with the message
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat with the message
  /// * [message_id]: Identifier of the message
  GetVideoMessageAdvertisements copyWith({
    int? chatId,
    int? messageId,
  }) =>
      GetVideoMessageAdvertisements(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getVideoMessageAdvertisements';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
