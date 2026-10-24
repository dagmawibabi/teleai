part of '../tdapi.dart';

/// **GetThemedEmojiStatuses** *(getThemedEmojiStatuses)* - TDLib function
///
/// Returns up to 8 emoji statuses, which must be shown right after the default Premium Badge in the emoji status list for self status.
///
/// [EmojiStatusCustomEmojis] is returned on completion.
final class GetThemedEmojiStatuses extends TdFunction {
  /// **GetThemedEmojiStatuses** *(getThemedEmojiStatuses)* - TDLib function
  ///
  /// Returns up to 8 emoji statuses, which must be shown right after the default Premium Badge in the emoji status list for self status.
  ///
  /// [EmojiStatusCustomEmojis] is returned on completion.
  const GetThemedEmojiStatuses();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetThemedEmojiStatuses copyWith() => const GetThemedEmojiStatuses();

  /// TDLib object type
  static const String defaultObjectId = 'getThemedEmojiStatuses';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
