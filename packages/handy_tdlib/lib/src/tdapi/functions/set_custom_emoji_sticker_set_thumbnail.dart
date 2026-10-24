part of '../tdapi.dart';

/// **SetCustomEmojiStickerSetThumbnail** *(setCustomEmojiStickerSetThumbnail)* - TDLib function
///
/// Sets a custom emoji sticker set thumbnail.
///
/// * [name]: Sticker set name. The sticker set must be owned by the current user.
/// * [customEmojiId]: Identifier of the custom emoji from the sticker set, which will be set as sticker set thumbnail; pass 0 to remove the sticker set thumbnail.
///
/// [Ok] is returned on completion.
final class SetCustomEmojiStickerSetThumbnail extends TdFunction {
  /// **SetCustomEmojiStickerSetThumbnail** *(setCustomEmojiStickerSetThumbnail)* - TDLib function
  ///
  /// Sets a custom emoji sticker set thumbnail.
  ///
  /// * [name]: Sticker set name. The sticker set must be owned by the current user.
  /// * [customEmojiId]: Identifier of the custom emoji from the sticker set, which will be set as sticker set thumbnail; pass 0 to remove the sticker set thumbnail.
  ///
  /// [Ok] is returned on completion.
  const SetCustomEmojiStickerSetThumbnail({
    required this.name,
    required this.customEmojiId,
  });

  /// Sticker set name. The sticker set must be owned by the current user
  final String name;

  /// Identifier of the custom emoji from the sticker set, which will be set as sticker set thumbnail; pass 0 to remove the sticker set thumbnail
  final int customEmojiId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "name": name,
      "custom_emoji_id": customEmojiId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Sticker set name. The sticker set must be owned by the current user
  /// * [custom_emoji_id]: Identifier of the custom emoji from the sticker set, which will be set as sticker set thumbnail; pass 0 to remove the sticker set thumbnail
  SetCustomEmojiStickerSetThumbnail copyWith({
    String? name,
    int? customEmojiId,
  }) =>
      SetCustomEmojiStickerSetThumbnail(
        name: name ?? this.name,
        customEmojiId: customEmojiId ?? this.customEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setCustomEmojiStickerSetThumbnail';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
