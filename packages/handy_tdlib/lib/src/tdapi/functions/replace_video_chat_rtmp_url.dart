part of '../tdapi.dart';

/// **ReplaceVideoChatRtmpUrl** *(replaceVideoChatRtmpUrl)* - TDLib function
///
/// Replaces the current RTMP URL for streaming to the video chat of a chat; requires owner privileges in the chat.
///
/// * [chatId]: Chat identifier.
///
/// [RtmpUrl] is returned on completion.
final class ReplaceVideoChatRtmpUrl extends TdFunction {
  /// **ReplaceVideoChatRtmpUrl** *(replaceVideoChatRtmpUrl)* - TDLib function
  ///
  /// Replaces the current RTMP URL for streaming to the video chat of a chat; requires owner privileges in the chat.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [RtmpUrl] is returned on completion.
  const ReplaceVideoChatRtmpUrl({
    required this.chatId,
  });

  /// Chat identifier
  final int chatId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  ReplaceVideoChatRtmpUrl copyWith({
    int? chatId,
  }) =>
      ReplaceVideoChatRtmpUrl(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'replaceVideoChatRtmpUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
