part of '../tdapi.dart';

/// **ProfileShareTheme** *(profileShareTheme)* - parent
///
/// Describes a theme of the screen for sharing a link to a user or a chat.
sealed class ProfileShareTheme extends TdObject {
  /// **ProfileShareTheme** *(profileShareTheme)* - parent
  ///
  /// Describes a theme of the screen for sharing a link to a user or a chat.
  const ProfileShareTheme();

  /// a ProfileShareTheme return type can be :
  /// * [ProfileShareThemeEmoji]
  /// * [ProfileShareThemeUpgradedGift]
  factory ProfileShareTheme.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ProfileShareThemeEmoji.defaultObjectId:
        return ProfileShareThemeEmoji.fromJson(json);
      case ProfileShareThemeUpgradedGift.defaultObjectId:
        return ProfileShareThemeUpgradedGift.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ProfileShareTheme)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ProfileShareTheme copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'profileShareTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ProfileShareThemeEmoji** *(profileShareThemeEmoji)* - child of ProfileShareTheme
///
/// A theme with emoji placed on a background.
///
/// * [emojis]: The emoji; 0-6 regular or custom emoji. If empty, then use_default_background is false.
/// * [useDefaultBackground]: True, if the default background is used; otherwise, the backdrop with identifier background_backdrop_id is used as background.
/// * [backgroundBackdropId]: Identifier of the backdrop used as background; must be ignored if use_default_background is true. Use getProfileShareThemeBackdrops to get details about the backdrop.
final class ProfileShareThemeEmoji extends ProfileShareTheme {
  /// **ProfileShareThemeEmoji** *(profileShareThemeEmoji)* - child of ProfileShareTheme
  ///
  /// A theme with emoji placed on a background.
  ///
  /// * [emojis]: The emoji; 0-6 regular or custom emoji. If empty, then use_default_background is false.
  /// * [useDefaultBackground]: True, if the default background is used; otherwise, the backdrop with identifier background_backdrop_id is used as background.
  /// * [backgroundBackdropId]: Identifier of the backdrop used as background; must be ignored if use_default_background is true. Use getProfileShareThemeBackdrops to get details about the backdrop.
  const ProfileShareThemeEmoji({
    required this.emojis,
    required this.useDefaultBackground,
    required this.backgroundBackdropId,
  });

  /// The emoji; 0-6 regular or custom emoji. If empty, then use_default_background is false
  final List<EmojiType> emojis;

  /// True, if the default background is used; otherwise, the backdrop with identifier background_backdrop_id is used as background
  final bool useDefaultBackground;

  /// Identifier of the backdrop used as background; must be ignored if use_default_background is true. Use getProfileShareThemeBackdrops to get details about the backdrop
  final int backgroundBackdropId;

  /// Parse from a json
  factory ProfileShareThemeEmoji.fromJson(Map<String, dynamic> json) =>
      ProfileShareThemeEmoji(
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
  /// * [emojis]: The emoji; 0-6 regular or custom emoji. If empty, then use_default_background is false
  /// * [use_default_background]: True, if the default background is used; otherwise, the backdrop with identifier background_backdrop_id is used as background
  /// * [background_backdrop_id]: Identifier of the backdrop used as background; must be ignored if use_default_background is true. Use getProfileShareThemeBackdrops to get details about the backdrop
  @override
  ProfileShareThemeEmoji copyWith({
    List<EmojiType>? emojis,
    bool? useDefaultBackground,
    int? backgroundBackdropId,
  }) =>
      ProfileShareThemeEmoji(
        emojis: emojis ?? this.emojis,
        useDefaultBackground: useDefaultBackground ?? this.useDefaultBackground,
        backgroundBackdropId: backgroundBackdropId ?? this.backgroundBackdropId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'profileShareThemeEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ProfileShareThemeUpgradedGift** *(profileShareThemeUpgradedGift)* - child of ProfileShareTheme
///
/// A theme based on an upgraded gift owned by the user or the chat.
///
/// * [gift]: The upgraded gift.
final class ProfileShareThemeUpgradedGift extends ProfileShareTheme {
  /// **ProfileShareThemeUpgradedGift** *(profileShareThemeUpgradedGift)* - child of ProfileShareTheme
  ///
  /// A theme based on an upgraded gift owned by the user or the chat.
  ///
  /// * [gift]: The upgraded gift.
  const ProfileShareThemeUpgradedGift({
    required this.gift,
  });

  /// The upgraded gift
  final UpgradedGift gift;

  /// Parse from a json
  factory ProfileShareThemeUpgradedGift.fromJson(Map<String, dynamic> json) =>
      ProfileShareThemeUpgradedGift(
        gift: UpgradedGift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The upgraded gift
  @override
  ProfileShareThemeUpgradedGift copyWith({
    UpgradedGift? gift,
  }) =>
      ProfileShareThemeUpgradedGift(
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId = 'profileShareThemeUpgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
