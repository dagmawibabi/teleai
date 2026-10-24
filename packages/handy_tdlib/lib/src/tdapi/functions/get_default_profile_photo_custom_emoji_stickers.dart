part of '../tdapi.dart';

/// **GetDefaultProfilePhotoCustomEmojiStickers** *(getDefaultProfilePhotoCustomEmojiStickers)* - TDLib function
///
/// Returns default list of custom emoji stickers for placing on a profile photo.
///
/// [Stickers] is returned on completion.
final class GetDefaultProfilePhotoCustomEmojiStickers extends TdFunction {
  /// **GetDefaultProfilePhotoCustomEmojiStickers** *(getDefaultProfilePhotoCustomEmojiStickers)* - TDLib function
  ///
  /// Returns default list of custom emoji stickers for placing on a profile photo.
  ///
  /// [Stickers] is returned on completion.
  const GetDefaultProfilePhotoCustomEmojiStickers();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetDefaultProfilePhotoCustomEmojiStickers copyWith() =>
      const GetDefaultProfilePhotoCustomEmojiStickers();

  /// TDLib object type
  static const String defaultObjectId =
      'getDefaultProfilePhotoCustomEmojiStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
