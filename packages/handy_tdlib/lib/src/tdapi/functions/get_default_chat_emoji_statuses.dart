part of '../tdapi.dart';

/// **GetDefaultChatEmojiStatuses** *(getDefaultChatEmojiStatuses)* - TDLib function
///
/// Returns default emoji statuses for chats.
///
/// [EmojiStatusCustomEmojis] is returned on completion.
final class GetDefaultChatEmojiStatuses extends TdFunction {
  /// **GetDefaultChatEmojiStatuses** *(getDefaultChatEmojiStatuses)* - TDLib function
  ///
  /// Returns default emoji statuses for chats.
  ///
  /// [EmojiStatusCustomEmojis] is returned on completion.
  const GetDefaultChatEmojiStatuses();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetDefaultChatEmojiStatuses copyWith() => const GetDefaultChatEmojiStatuses();

  /// TDLib object type
  static const String defaultObjectId = 'getDefaultChatEmojiStatuses';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
