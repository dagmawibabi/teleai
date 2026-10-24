part of '../tdapi.dart';

/// **GetUpgradedGiftEmojiStatuses** *(getUpgradedGiftEmojiStatuses)* - TDLib function
///
/// Returns available upgraded gift emoji statuses for self status.
///
/// [EmojiStatuses] is returned on completion.
final class GetUpgradedGiftEmojiStatuses extends TdFunction {
  /// **GetUpgradedGiftEmojiStatuses** *(getUpgradedGiftEmojiStatuses)* - TDLib function
  ///
  /// Returns available upgraded gift emoji statuses for self status.
  ///
  /// [EmojiStatuses] is returned on completion.
  const GetUpgradedGiftEmojiStatuses();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetUpgradedGiftEmojiStatuses copyWith() =>
      const GetUpgradedGiftEmojiStatuses();

  /// TDLib object type
  static const String defaultObjectId = 'getUpgradedGiftEmojiStatuses';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
