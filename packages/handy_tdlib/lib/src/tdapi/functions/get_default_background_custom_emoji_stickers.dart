part of '../tdapi.dart';

/// **GetDefaultBackgroundCustomEmojiStickers** *(getDefaultBackgroundCustomEmojiStickers)* - TDLib function
///
/// Returns default list of custom emoji stickers for reply background.
///
/// [Stickers] is returned on completion.
final class GetDefaultBackgroundCustomEmojiStickers extends TdFunction {
  /// **GetDefaultBackgroundCustomEmojiStickers** *(getDefaultBackgroundCustomEmojiStickers)* - TDLib function
  ///
  /// Returns default list of custom emoji stickers for reply background.
  ///
  /// [Stickers] is returned on completion.
  const GetDefaultBackgroundCustomEmojiStickers();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetDefaultBackgroundCustomEmojiStickers copyWith() =>
      const GetDefaultBackgroundCustomEmojiStickers();

  /// TDLib object type
  static const String defaultObjectId =
      'getDefaultBackgroundCustomEmojiStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
