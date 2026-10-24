part of '../tdapi.dart';

/// **GetDefaultChatPhotoCustomEmojiStickers** *(getDefaultChatPhotoCustomEmojiStickers)* - TDLib function
///
/// Returns default list of custom emoji stickers for placing on a chat photo.
///
/// [Stickers] is returned on completion.
final class GetDefaultChatPhotoCustomEmojiStickers extends TdFunction {
  /// **GetDefaultChatPhotoCustomEmojiStickers** *(getDefaultChatPhotoCustomEmojiStickers)* - TDLib function
  ///
  /// Returns default list of custom emoji stickers for placing on a chat photo.
  ///
  /// [Stickers] is returned on completion.
  const GetDefaultChatPhotoCustomEmojiStickers();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetDefaultChatPhotoCustomEmojiStickers copyWith() =>
      const GetDefaultChatPhotoCustomEmojiStickers();

  /// TDLib object type
  static const String defaultObjectId =
      'getDefaultChatPhotoCustomEmojiStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
