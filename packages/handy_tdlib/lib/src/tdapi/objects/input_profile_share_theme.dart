part of '../tdapi.dart';

/// **InputProfileShareTheme** *(inputProfileShareTheme)* - parent
///
/// Describes a theme of the screen for sharing a link to a user or a chat to be set.
sealed class InputProfileShareTheme extends TdObject {
  /// **InputProfileShareTheme** *(inputProfileShareTheme)* - parent
  ///
  /// Describes a theme of the screen for sharing a link to a user or a chat to be set.
  const InputProfileShareTheme();

  /// a InputProfileShareTheme return type can be :
  /// * [InputProfileShareThemeEmoji]
  /// * [InputProfileShareThemeUpgradedGift]
  factory InputProfileShareTheme.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputProfileShareThemeEmoji.defaultObjectId:
        return InputProfileShareThemeEmoji.fromJson(json);
      case InputProfileShareThemeUpgradedGift.defaultObjectId:
        return InputProfileShareThemeUpgradedGift.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputProfileShareTheme)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputProfileShareTheme copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputProfileShareTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputProfileShareThemeEmoji** *(inputProfileShareThemeEmoji)* - child of InputProfileShareTheme
///
/// A theme with emoji placed on a background.
///
/// * [emojis]: The emoji; 0-6 regular or custom emoji. If empty, then use_default_background must be false.
/// * [useDefaultBackground]: Pass true to use the default background; otherwise, the backdrop with identifier background_backdrop_id will be used as background.
/// * [backgroundBackdropId]: Identifier of the backdrop to be used as background; ignored if use_default_background is true. Use getProfileShareThemeBackdrops to get the list of available backdrops.
final class InputProfileShareThemeEmoji extends InputProfileShareTheme {
  /// **InputProfileShareThemeEmoji** *(inputProfileShareThemeEmoji)* - child of InputProfileShareTheme
  ///
  /// A theme with emoji placed on a background.
  ///
  /// * [emojis]: The emoji; 0-6 regular or custom emoji. If empty, then use_default_background must be false.
  /// * [useDefaultBackground]: Pass true to use the default background; otherwise, the backdrop with identifier background_backdrop_id will be used as background.
  /// * [backgroundBackdropId]: Identifier of the backdrop to be used as background; ignored if use_default_background is true. Use getProfileShareThemeBackdrops to get the list of available backdrops.
  const InputProfileShareThemeEmoji({
    required this.emojis,
    required this.useDefaultBackground,
    required this.backgroundBackdropId,
  });

  /// The emoji; 0-6 regular or custom emoji. If empty, then use_default_background must be false
  final List<EmojiType> emojis;

  /// Pass true to use the default background; otherwise, the backdrop with identifier background_backdrop_id will be used as background
  final bool useDefaultBackground;

  /// Identifier of the backdrop to be used as background; ignored if use_default_background is true. Use getProfileShareThemeBackdrops to get the list of available backdrops
  final int backgroundBackdropId;

  /// Parse from a json
  factory InputProfileShareThemeEmoji.fromJson(Map<String, dynamic> json) =>
      InputProfileShareThemeEmoji(
        emojis: List<EmojiType>.from((json['emojis'] ?? [])
            .map((item) => EmojiType.fromJson(item))
            .toList()),
        useDefaultBackground: json['use_default_background'],
        backgroundBackdropId: json['background_backdrop_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "emojis": emojis.map((i) => i.toJson()).toList(),
      "use_default_background": useDefaultBackground,
      "background_backdrop_id": backgroundBackdropId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [emojis]: The emoji; 0-6 regular or custom emoji. If empty, then use_default_background must be false
  /// * [use_default_background]: Pass true to use the default background; otherwise, the backdrop with identifier background_backdrop_id will be used as background
  /// * [background_backdrop_id]: Identifier of the backdrop to be used as background; ignored if use_default_background is true. Use getProfileShareThemeBackdrops to get the list of available backdrops
  @override
  InputProfileShareThemeEmoji copyWith({
    List<EmojiType>? emojis,
    bool? useDefaultBackground,
    int? backgroundBackdropId,
  }) =>
      InputProfileShareThemeEmoji(
        emojis: emojis ?? this.emojis,
        useDefaultBackground: useDefaultBackground ?? this.useDefaultBackground,
        backgroundBackdropId: backgroundBackdropId ?? this.backgroundBackdropId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputProfileShareThemeEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputProfileShareThemeUpgradedGift** *(inputProfileShareThemeUpgradedGift)* - child of InputProfileShareTheme
///
/// A theme based on an upgraded gift.
///
/// * [receivedGiftId]: Identifier of the upgraded gift, which is owned by the user or the chat, for which the theme is set.
final class InputProfileShareThemeUpgradedGift extends InputProfileShareTheme {
  /// **InputProfileShareThemeUpgradedGift** *(inputProfileShareThemeUpgradedGift)* - child of InputProfileShareTheme
  ///
  /// A theme based on an upgraded gift.
  ///
  /// * [receivedGiftId]: Identifier of the upgraded gift, which is owned by the user or the chat, for which the theme is set.
  const InputProfileShareThemeUpgradedGift({
    required this.receivedGiftId,
  });

  /// Identifier of the upgraded gift, which is owned by the user or the chat, for which the theme is set
  final String receivedGiftId;

  /// Parse from a json
  factory InputProfileShareThemeUpgradedGift.fromJson(
          Map<String, dynamic> json) =>
      InputProfileShareThemeUpgradedGift(
        receivedGiftId: json['received_gift_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "received_gift_id": receivedGiftId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [received_gift_id]: Identifier of the upgraded gift, which is owned by the user or the chat, for which the theme is set
  @override
  InputProfileShareThemeUpgradedGift copyWith({
    String? receivedGiftId,
  }) =>
      InputProfileShareThemeUpgradedGift(
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputProfileShareThemeUpgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
