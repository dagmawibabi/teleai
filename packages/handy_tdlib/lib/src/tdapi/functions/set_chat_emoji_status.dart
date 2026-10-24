part of '../tdapi.dart';

/// **SetChatEmojiStatus** *(setChatEmojiStatus)* - TDLib function
///
/// Changes the emoji status of a chat. Use chatBoostLevelFeatures.can_set_emoji_status to check whether an emoji status can be set. Requires can_change_info administrator right.
///
/// * [chatId]: Chat identifier.
/// * [emojiStatus]: New emoji status; pass null to remove emoji status *(optional)*.
///
/// [Ok] is returned on completion.
final class SetChatEmojiStatus extends TdFunction {
  /// **SetChatEmojiStatus** *(setChatEmojiStatus)* - TDLib function
  ///
  /// Changes the emoji status of a chat. Use chatBoostLevelFeatures.can_set_emoji_status to check whether an emoji status can be set. Requires can_change_info administrator right.
  ///
  /// * [chatId]: Chat identifier.
  /// * [emojiStatus]: New emoji status; pass null to remove emoji status *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetChatEmojiStatus({
    required this.chatId,
    this.emojiStatus,
  });

  /// Chat identifier
  final int chatId;

  /// New emoji status; pass null to remove emoji status
  final EmojiStatus? emojiStatus;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "emoji_status": emojiStatus?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [emoji_status]: New emoji status; pass null to remove emoji status
  SetChatEmojiStatus copyWith({
    int? chatId,
    EmojiStatus? emojiStatus,
  }) =>
      SetChatEmojiStatus(
        chatId: chatId ?? this.chatId,
        emojiStatus: emojiStatus ?? this.emojiStatus,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatEmojiStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
