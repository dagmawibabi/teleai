part of '../tdapi.dart';

/// **GetVideoChatRtmpUrl** *(getVideoChatRtmpUrl)* - TDLib function
///
/// Returns RTMP URL for streaming to the video chat of a chat; requires can_manage_video_chats administrator right.
///
/// * [chatId]: Chat identifier.
///
/// [RtmpUrl] is returned on completion.
final class GetVideoChatRtmpUrl extends TdFunction {
  /// **GetVideoChatRtmpUrl** *(getVideoChatRtmpUrl)* - TDLib function
  ///
  /// Returns RTMP URL for streaming to the video chat of a chat; requires can_manage_video_chats administrator right.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [RtmpUrl] is returned on completion.
  const GetVideoChatRtmpUrl({
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
  GetVideoChatRtmpUrl copyWith({
    int? chatId,
  }) =>
      GetVideoChatRtmpUrl(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getVideoChatRtmpUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
