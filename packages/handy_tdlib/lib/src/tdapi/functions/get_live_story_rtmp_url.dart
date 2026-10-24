part of '../tdapi.dart';

/// **GetLiveStoryRtmpUrl** *(getLiveStoryRtmpUrl)* - TDLib function
///
/// Returns RTMP URL for streaming to a live story; requires can_post_stories administrator right for channel chats.
///
/// * [chatId]: Chat identifier.
///
/// [RtmpUrl] is returned on completion.
final class GetLiveStoryRtmpUrl extends TdFunction {
  /// **GetLiveStoryRtmpUrl** *(getLiveStoryRtmpUrl)* - TDLib function
  ///
  /// Returns RTMP URL for streaming to a live story; requires can_post_stories administrator right for channel chats.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [RtmpUrl] is returned on completion.
  const GetLiveStoryRtmpUrl({
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
  GetLiveStoryRtmpUrl copyWith({
    int? chatId,
  }) =>
      GetLiveStoryRtmpUrl(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getLiveStoryRtmpUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
