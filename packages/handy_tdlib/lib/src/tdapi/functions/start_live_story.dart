part of '../tdapi.dart';

/// **StartLiveStory** *(startLiveStory)* - TDLib function
///
/// Starts a new live story on behalf of a chat; requires can_post_stories administrator right for channel chats.
///
/// * [chatId]: Identifier of the chat that will start the live story. Pass Saved Messages chat identifier when starting a live story on behalf of the current user, or a channel chat identifier.
/// * [privacySettings]: The privacy settings for the story; ignored for stories posted on behalf of channel chats.
/// * [protectContent]: Pass true if the content of the story must be protected from screenshotting.
/// * [isRtmpStream]: Pass true to create an RTMP stream instead of an ordinary group call.
/// * [enableMessages]: Pass true to allow viewers of the story to send messages.
/// * [paidMessageStarCount]: The minimum number of Telegram Stars that must be paid by viewers for each sent message to the call; 0-getOption("paid_group_call_message_star_count_max").
///
/// [StartLiveStoryResult] is returned on completion.
final class StartLiveStory extends TdFunction {
  /// **StartLiveStory** *(startLiveStory)* - TDLib function
  ///
  /// Starts a new live story on behalf of a chat; requires can_post_stories administrator right for channel chats.
  ///
  /// * [chatId]: Identifier of the chat that will start the live story. Pass Saved Messages chat identifier when starting a live story on behalf of the current user, or a channel chat identifier.
  /// * [privacySettings]: The privacy settings for the story; ignored for stories posted on behalf of channel chats.
  /// * [protectContent]: Pass true if the content of the story must be protected from screenshotting.
  /// * [isRtmpStream]: Pass true to create an RTMP stream instead of an ordinary group call.
  /// * [enableMessages]: Pass true to allow viewers of the story to send messages.
  /// * [paidMessageStarCount]: The minimum number of Telegram Stars that must be paid by viewers for each sent message to the call; 0-getOption("paid_group_call_message_star_count_max").
  ///
  /// [StartLiveStoryResult] is returned on completion.
  const StartLiveStory({
    required this.chatId,
    required this.privacySettings,
    required this.protectContent,
    required this.isRtmpStream,
    required this.enableMessages,
    required this.paidMessageStarCount,
  });

  /// Identifier of the chat that will start the live story. Pass Saved Messages chat identifier when starting a live story on behalf of the current user, or a channel chat identifier
  final int chatId;

  /// The privacy settings for the story; ignored for stories posted on behalf of channel chats
  final StoryPrivacySettings privacySettings;

  /// Pass true if the content of the story must be protected from screenshotting
  final bool protectContent;

  /// Pass true to create an RTMP stream instead of an ordinary group call
  final bool isRtmpStream;

  /// Pass true to allow viewers of the story to send messages
  final bool enableMessages;

  /// The minimum number of Telegram Stars that must be paid by viewers for each sent message to the call; 0-getOption("paid_group_call_message_star_count_max")
  final int paidMessageStarCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "privacy_settings": privacySettings.toJson(),
      "protect_content": protectContent,
      "is_rtmp_stream": isRtmpStream,
      "enable_messages": enableMessages,
      "paid_message_star_count": paidMessageStarCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that will start the live story. Pass Saved Messages chat identifier when starting a live story on behalf of the current user, or a channel chat identifier
  /// * [privacy_settings]: The privacy settings for the story; ignored for stories posted on behalf of channel chats
  /// * [protect_content]: Pass true if the content of the story must be protected from screenshotting
  /// * [is_rtmp_stream]: Pass true to create an RTMP stream instead of an ordinary group call
  /// * [enable_messages]: Pass true to allow viewers of the story to send messages
  /// * [paid_message_star_count]: The minimum number of Telegram Stars that must be paid by viewers for each sent message to the call; 0-getOption("paid_group_call_message_star_count_max")
  StartLiveStory copyWith({
    int? chatId,
    StoryPrivacySettings? privacySettings,
    bool? protectContent,
    bool? isRtmpStream,
    bool? enableMessages,
    int? paidMessageStarCount,
  }) =>
      StartLiveStory(
        chatId: chatId ?? this.chatId,
        privacySettings: privacySettings ?? this.privacySettings,
        protectContent: protectContent ?? this.protectContent,
        isRtmpStream: isRtmpStream ?? this.isRtmpStream,
        enableMessages: enableMessages ?? this.enableMessages,
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'startLiveStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
