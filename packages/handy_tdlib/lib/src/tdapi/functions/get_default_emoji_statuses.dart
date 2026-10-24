part of '../tdapi.dart';

/// **GetDefaultEmojiStatuses** *(getDefaultEmojiStatuses)* - TDLib function
///
/// Returns default emoji statuses for self status.
///
/// [EmojiStatusCustomEmojis] is returned on completion.
final class GetDefaultEmojiStatuses extends TdFunction {
  /// **GetDefaultEmojiStatuses** *(getDefaultEmojiStatuses)* - TDLib function
  ///
  /// Returns default emoji statuses for self status.
  ///
  /// [EmojiStatusCustomEmojis] is returned on completion.
  const GetDefaultEmojiStatuses();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetDefaultEmojiStatuses copyWith() => const GetDefaultEmojiStatuses();

  /// TDLib object type
  static const String defaultObjectId = 'getDefaultEmojiStatuses';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
