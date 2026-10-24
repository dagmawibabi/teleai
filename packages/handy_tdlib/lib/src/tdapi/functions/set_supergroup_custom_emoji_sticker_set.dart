part of '../tdapi.dart';

/// **SetSupergroupCustomEmojiStickerSet** *(setSupergroupCustomEmojiStickerSet)* - TDLib function
///
/// Changes the custom emoji sticker set of a supergroup; requires can_change_info administrator right. The chat must have at least chatBoostFeatures.min_custom_emoji_sticker_set_boost_level boost level to set a custom emoji sticker set.
///
/// * [supergroupId]: Identifier of the supergroup.
/// * [customEmojiStickerSetId]: New value of the custom emoji sticker set identifier for the supergroup. Use 0 to remove the custom emoji sticker set in the supergroup.
///
/// [Ok] is returned on completion.
final class SetSupergroupCustomEmojiStickerSet extends TdFunction {
  /// **SetSupergroupCustomEmojiStickerSet** *(setSupergroupCustomEmojiStickerSet)* - TDLib function
  ///
  /// Changes the custom emoji sticker set of a supergroup; requires can_change_info administrator right. The chat must have at least chatBoostFeatures.min_custom_emoji_sticker_set_boost_level boost level to set a custom emoji sticker set.
  ///
  /// * [supergroupId]: Identifier of the supergroup.
  /// * [customEmojiStickerSetId]: New value of the custom emoji sticker set identifier for the supergroup. Use 0 to remove the custom emoji sticker set in the supergroup.
  ///
  /// [Ok] is returned on completion.
  const SetSupergroupCustomEmojiStickerSet({
    required this.supergroupId,
    required this.customEmojiStickerSetId,
  });

  /// Identifier of the supergroup
  final int supergroupId;

  /// New value of the custom emoji sticker set identifier for the supergroup. Use 0 to remove the custom emoji sticker set in the supergroup
  final int customEmojiStickerSetId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "custom_emoji_sticker_set_id": customEmojiStickerSetId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the supergroup
  /// * [custom_emoji_sticker_set_id]: New value of the custom emoji sticker set identifier for the supergroup. Use 0 to remove the custom emoji sticker set in the supergroup
  SetSupergroupCustomEmojiStickerSet copyWith({
    int? supergroupId,
    int? customEmojiStickerSetId,
  }) =>
      SetSupergroupCustomEmojiStickerSet(
        supergroupId: supergroupId ?? this.supergroupId,
        customEmojiStickerSetId:
            customEmojiStickerSetId ?? this.customEmojiStickerSetId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setSupergroupCustomEmojiStickerSet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
