part of '../tdapi.dart';

/// **StickerFullType** *(stickerFullType)* - parent
///
/// Contains full information about sticker type.
sealed class StickerFullType extends TdObject {
  /// **StickerFullType** *(stickerFullType)* - parent
  ///
  /// Contains full information about sticker type.
  const StickerFullType();

  /// a StickerFullType return type can be :
  /// * [StickerFullTypeRegular]
  /// * [StickerFullTypeMask]
  /// * [StickerFullTypeCustomEmoji]
  factory StickerFullType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StickerFullTypeRegular.defaultObjectId:
        return StickerFullTypeRegular.fromJson(json);
      case StickerFullTypeMask.defaultObjectId:
        return StickerFullTypeMask.fromJson(json);
      case StickerFullTypeCustomEmoji.defaultObjectId:
        return StickerFullTypeCustomEmoji.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StickerFullType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StickerFullType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'stickerFullType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StickerFullTypeRegular** *(stickerFullTypeRegular)* - child of StickerFullType
///
/// The sticker is a regular sticker.
///
/// * [premiumAnimation]: Premium animation of the sticker; may be null. If present, only Telegram Premium users can use the sticker *(optional)*.
final class StickerFullTypeRegular extends StickerFullType {
  /// **StickerFullTypeRegular** *(stickerFullTypeRegular)* - child of StickerFullType
  ///
  /// The sticker is a regular sticker.
  ///
  /// * [premiumAnimation]: Premium animation of the sticker; may be null. If present, only Telegram Premium users can use the sticker *(optional)*.
  const StickerFullTypeRegular({
    this.premiumAnimation,
  });

  /// Premium animation of the sticker; may be null. If present, only Telegram Premium users can use the sticker
  final File? premiumAnimation;

  /// Parse from a json
  factory StickerFullTypeRegular.fromJson(Map<String, dynamic> json) =>
      StickerFullTypeRegular(
        premiumAnimation: json['premium_animation'] == null
            ? null
            : File.fromJson(json['premium_animation']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "premium_animation": premiumAnimation?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [premium_animation]: Premium animation of the sticker; may be null. If present, only Telegram Premium users can use the sticker
  @override
  StickerFullTypeRegular copyWith({
    File? premiumAnimation,
  }) =>
      StickerFullTypeRegular(
        premiumAnimation: premiumAnimation ?? this.premiumAnimation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'stickerFullTypeRegular';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StickerFullTypeMask** *(stickerFullTypeMask)* - child of StickerFullType
///
/// The sticker is a mask in WEBP format to be placed on photos or videos.
///
/// * [maskPosition]: Position where the mask is placed; may be null *(optional)*.
final class StickerFullTypeMask extends StickerFullType {
  /// **StickerFullTypeMask** *(stickerFullTypeMask)* - child of StickerFullType
  ///
  /// The sticker is a mask in WEBP format to be placed on photos or videos.
  ///
  /// * [maskPosition]: Position where the mask is placed; may be null *(optional)*.
  const StickerFullTypeMask({
    this.maskPosition,
  });

  /// Position where the mask is placed; may be null
  final MaskPosition? maskPosition;

  /// Parse from a json
  factory StickerFullTypeMask.fromJson(Map<String, dynamic> json) =>
      StickerFullTypeMask(
        maskPosition: json['mask_position'] == null
            ? null
            : MaskPosition.fromJson(json['mask_position']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "mask_position": maskPosition?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [mask_position]: Position where the mask is placed; may be null
  @override
  StickerFullTypeMask copyWith({
    MaskPosition? maskPosition,
  }) =>
      StickerFullTypeMask(
        maskPosition: maskPosition ?? this.maskPosition,
      );

  /// TDLib object type
  static const String defaultObjectId = 'stickerFullTypeMask';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StickerFullTypeCustomEmoji** *(stickerFullTypeCustomEmoji)* - child of StickerFullType
///
/// The sticker is a custom emoji to be used inside message text and caption. Currently, only Telegram Premium users can use custom emoji.
///
/// * [customEmojiId]: Identifier of the custom emoji.
/// * [needsRepainting]: True, if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places.
final class StickerFullTypeCustomEmoji extends StickerFullType {
  /// **StickerFullTypeCustomEmoji** *(stickerFullTypeCustomEmoji)* - child of StickerFullType
  ///
  /// The sticker is a custom emoji to be used inside message text and caption. Currently, only Telegram Premium users can use custom emoji.
  ///
  /// * [customEmojiId]: Identifier of the custom emoji.
  /// * [needsRepainting]: True, if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places.
  const StickerFullTypeCustomEmoji({
    required this.customEmojiId,
    required this.needsRepainting,
  });

  /// Identifier of the custom emoji
  final int customEmojiId;

  /// True, if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places
  final bool needsRepainting;

  /// Parse from a json
  factory StickerFullTypeCustomEmoji.fromJson(Map<String, dynamic> json) =>
      StickerFullTypeCustomEmoji(
        customEmojiId: json['custom_emoji_id'] is int
            ? json['custom_emoji_id']
            : int.parse(json['custom_emoji_id']),
        needsRepainting: json['needs_repainting'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "custom_emoji_id": customEmojiId,
      "needs_repainting": needsRepainting,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [custom_emoji_id]: Identifier of the custom emoji
  /// * [needs_repainting]: True, if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places
  @override
  StickerFullTypeCustomEmoji copyWith({
    int? customEmojiId,
    bool? needsRepainting,
  }) =>
      StickerFullTypeCustomEmoji(
        customEmojiId: customEmojiId ?? this.customEmojiId,
        needsRepainting: needsRepainting ?? this.needsRepainting,
      );

  /// TDLib object type
  static const String defaultObjectId = 'stickerFullTypeCustomEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
