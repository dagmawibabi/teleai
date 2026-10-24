part of '../tdapi.dart';

/// **GetThemedChatEmojiStatuses** *(getThemedChatEmojiStatuses)* - TDLib function
///
/// Returns up to 8 emoji statuses, which must be shown in the emoji status list for chats.
///
/// [EmojiStatusCustomEmojis] is returned on completion.
final class GetThemedChatEmojiStatuses extends TdFunction {
  /// **GetThemedChatEmojiStatuses** *(getThemedChatEmojiStatuses)* - TDLib function
  ///
  /// Returns up to 8 emoji statuses, which must be shown in the emoji status list for chats.
  ///
  /// [EmojiStatusCustomEmojis] is returned on completion.
  const GetThemedChatEmojiStatuses();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetThemedChatEmojiStatuses copyWith() => const GetThemedChatEmojiStatuses();

  /// TDLib object type
  static const String defaultObjectId = 'getThemedChatEmojiStatuses';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
