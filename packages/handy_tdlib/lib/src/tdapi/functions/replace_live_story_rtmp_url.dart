part of '../tdapi.dart';

/// **ReplaceLiveStoryRtmpUrl** *(replaceLiveStoryRtmpUrl)* - TDLib function
///
/// Replaces the current RTMP URL for streaming to a live story; requires owner privileges for channel chats.
///
/// * [chatId]: Chat identifier.
///
/// [RtmpUrl] is returned on completion.
final class ReplaceLiveStoryRtmpUrl extends TdFunction {
  /// **ReplaceLiveStoryRtmpUrl** *(replaceLiveStoryRtmpUrl)* - TDLib function
  ///
  /// Replaces the current RTMP URL for streaming to a live story; requires owner privileges for channel chats.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [RtmpUrl] is returned on completion.
  const ReplaceLiveStoryRtmpUrl({
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
  ReplaceLiveStoryRtmpUrl copyWith({
    int? chatId,
  }) =>
      ReplaceLiveStoryRtmpUrl(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'replaceLiveStoryRtmpUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
