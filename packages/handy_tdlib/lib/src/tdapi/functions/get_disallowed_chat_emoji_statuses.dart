part of '../tdapi.dart';

/// **GetDisallowedChatEmojiStatuses** *(getDisallowedChatEmojiStatuses)* - TDLib function
///
/// Returns the list of emoji statuses, which can't be used as chat emoji status, even if they are from a sticker set with is_allowed_as_chat_emoji_status == true.
///
/// [EmojiStatusCustomEmojis] is returned on completion.
final class GetDisallowedChatEmojiStatuses extends TdFunction {
  /// **GetDisallowedChatEmojiStatuses** *(getDisallowedChatEmojiStatuses)* - TDLib function
  ///
  /// Returns the list of emoji statuses, which can't be used as chat emoji status, even if they are from a sticker set with is_allowed_as_chat_emoji_status == true.
  ///
  /// [EmojiStatusCustomEmojis] is returned on completion.
  const GetDisallowedChatEmojiStatuses();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetDisallowedChatEmojiStatuses copyWith() =>
      const GetDisallowedChatEmojiStatuses();

  /// TDLib object type
  static const String defaultObjectId = 'getDisallowedChatEmojiStatuses';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
