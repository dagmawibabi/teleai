part of '../tdapi.dart';

/// **EmojiStatusType** *(emojiStatusType)* - parent
///
/// Describes type of emoji status.
sealed class EmojiStatusType extends TdObject {
  /// **EmojiStatusType** *(emojiStatusType)* - parent
  ///
  /// Describes type of emoji status.
  const EmojiStatusType();

  /// a EmojiStatusType return type can be :
  /// * [EmojiStatusTypeCustomEmoji]
  /// * [EmojiStatusTypeUpgradedGift]
  factory EmojiStatusType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case EmojiStatusTypeCustomEmoji.defaultObjectId:
        return EmojiStatusTypeCustomEmoji.fromJson(json);
      case EmojiStatusTypeUpgradedGift.defaultObjectId:
        return EmojiStatusTypeUpgradedGift.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of EmojiStatusType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  EmojiStatusType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'emojiStatusType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **EmojiStatusTypeCustomEmoji** *(emojiStatusTypeCustomEmoji)* - child of EmojiStatusType
///
/// A custom emoji set as emoji status.
///
/// * [customEmojiId]: Identifier of the custom emoji in stickerFormatTgs format.
final class EmojiStatusTypeCustomEmoji extends EmojiStatusType {
  /// **EmojiStatusTypeCustomEmoji** *(emojiStatusTypeCustomEmoji)* - child of EmojiStatusType
  ///
  /// A custom emoji set as emoji status.
  ///
  /// * [customEmojiId]: Identifier of the custom emoji in stickerFormatTgs format.
  const EmojiStatusTypeCustomEmoji({
    required this.customEmojiId,
  });

  /// Identifier of the custom emoji in stickerFormatTgs format
  final int customEmojiId;

  /// Parse from a json
  factory EmojiStatusTypeCustomEmoji.fromJson(Map<String, dynamic> json) =>
      EmojiStatusTypeCustomEmoji(
        customEmojiId: json['custom_emoji_id'] is int
            ? json['custom_emoji_id']
            : int.parse(json['custom_emoji_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "custom_emoji_id": customEmojiId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [custom_emoji_id]: Identifier of the custom emoji in stickerFormatTgs format
  @override
  EmojiStatusTypeCustomEmoji copyWith({
    int? customEmojiId,
  }) =>
      EmojiStatusTypeCustomEmoji(
        customEmojiId: customEmojiId ?? this.customEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojiStatusTypeCustomEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **EmojiStatusTypeUpgradedGift** *(emojiStatusTypeUpgradedGift)* - child of EmojiStatusType
///
/// An upgraded gift set as emoji status.
///
/// * [upgradedGiftId]: Identifier of the upgraded gift.
/// * [giftTitle]: The title of the upgraded gift.
/// * [giftName]: Unique name of the upgraded gift that can be used with internalLinkTypeUpgradedGift.
/// * [modelCustomEmojiId]: Custom emoji identifier of the model of the upgraded gift.
/// * [symbolCustomEmojiId]: Custom emoji identifier of the symbol of the upgraded gift.
/// * [backdropColors]: Colors of the backdrop of the upgraded gift.
final class EmojiStatusTypeUpgradedGift extends EmojiStatusType {
  /// **EmojiStatusTypeUpgradedGift** *(emojiStatusTypeUpgradedGift)* - child of EmojiStatusType
  ///
  /// An upgraded gift set as emoji status.
  ///
  /// * [upgradedGiftId]: Identifier of the upgraded gift.
  /// * [giftTitle]: The title of the upgraded gift.
  /// * [giftName]: Unique name of the upgraded gift that can be used with internalLinkTypeUpgradedGift.
  /// * [modelCustomEmojiId]: Custom emoji identifier of the model of the upgraded gift.
  /// * [symbolCustomEmojiId]: Custom emoji identifier of the symbol of the upgraded gift.
  /// * [backdropColors]: Colors of the backdrop of the upgraded gift.
  const EmojiStatusTypeUpgradedGift({
    required this.upgradedGiftId,
    required this.giftTitle,
    required this.giftName,
    required this.modelCustomEmojiId,
    required this.symbolCustomEmojiId,
    required this.backdropColors,
  });

  /// Identifier of the upgraded gift
  final int upgradedGiftId;

  /// The title of the upgraded gift
  final String giftTitle;

  /// Unique name of the upgraded gift that can be used with internalLinkTypeUpgradedGift
  final String giftName;

  /// Custom emoji identifier of the model of the upgraded gift
  final int modelCustomEmojiId;

  /// Custom emoji identifier of the symbol of the upgraded gift
  final int symbolCustomEmojiId;

  /// Colors of the backdrop of the upgraded gift
  final UpgradedGiftBackdropColors backdropColors;

  /// Parse from a json
  factory EmojiStatusTypeUpgradedGift.fromJson(Map<String, dynamic> json) =>
      EmojiStatusTypeUpgradedGift(
        upgradedGiftId: json['upgraded_gift_id'] is int
            ? json['upgraded_gift_id']
            : int.parse(json['upgraded_gift_id']),
        giftTitle: json['gift_title'],
        giftName: json['gift_name'],
        modelCustomEmojiId: json['model_custom_emoji_id'] is int
            ? json['model_custom_emoji_id']
            : int.parse(json['model_custom_emoji_id']),
        symbolCustomEmojiId: json['symbol_custom_emoji_id'] is int
            ? json['symbol_custom_emoji_id']
            : int.parse(json['symbol_custom_emoji_id']),
        backdropColors:
            UpgradedGiftBackdropColors.fromJson(json['backdrop_colors']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "upgraded_gift_id": upgradedGiftId,
      "gift_title": giftTitle,
      "gift_name": giftName,
      "model_custom_emoji_id": modelCustomEmojiId,
      "symbol_custom_emoji_id": symbolCustomEmojiId,
      "backdrop_colors": backdropColors.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [upgraded_gift_id]: Identifier of the upgraded gift
  /// * [gift_title]: The title of the upgraded gift
  /// * [gift_name]: Unique name of the upgraded gift that can be used with internalLinkTypeUpgradedGift
  /// * [model_custom_emoji_id]: Custom emoji identifier of the model of the upgraded gift
  /// * [symbol_custom_emoji_id]: Custom emoji identifier of the symbol of the upgraded gift
  /// * [backdrop_colors]: Colors of the backdrop of the upgraded gift
  @override
  EmojiStatusTypeUpgradedGift copyWith({
    int? upgradedGiftId,
    String? giftTitle,
    String? giftName,
    int? modelCustomEmojiId,
    int? symbolCustomEmojiId,
    UpgradedGiftBackdropColors? backdropColors,
  }) =>
      EmojiStatusTypeUpgradedGift(
        upgradedGiftId: upgradedGiftId ?? this.upgradedGiftId,
        giftTitle: giftTitle ?? this.giftTitle,
        giftName: giftName ?? this.giftName,
        modelCustomEmojiId: modelCustomEmojiId ?? this.modelCustomEmojiId,
        symbolCustomEmojiId: symbolCustomEmojiId ?? this.symbolCustomEmojiId,
        backdropColors: backdropColors ?? this.backdropColors,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojiStatusTypeUpgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
