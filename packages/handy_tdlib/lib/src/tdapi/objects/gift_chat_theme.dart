part of '../tdapi.dart';

/// **GiftChatTheme** *(giftChatTheme)* - basic class
///
/// Describes a chat theme based on an upgraded gift.
///
/// * [gift]: The gift.
/// * [lightSettings]: Theme settings for a light chat theme.
/// * [darkSettings]: Theme settings for a dark chat theme.
final class GiftChatTheme extends TdObject {
  /// **GiftChatTheme** *(giftChatTheme)* - basic class
  ///
  /// Describes a chat theme based on an upgraded gift.
  ///
  /// * [gift]: The gift.
  /// * [lightSettings]: Theme settings for a light chat theme.
  /// * [darkSettings]: Theme settings for a dark chat theme.
  const GiftChatTheme({
    required this.gift,
    required this.lightSettings,
    required this.darkSettings,
  });

  /// The gift
  final UpgradedGift gift;

  /// Theme settings for a light chat theme
  final ThemeSettings lightSettings;

  /// Theme settings for a dark chat theme
  final ThemeSettings darkSettings;

  /// Parse from a json
  factory GiftChatTheme.fromJson(Map<String, dynamic> json) => GiftChatTheme(
        gift: UpgradedGift.fromJson(json['gift']),
        lightSettings: ThemeSettings.fromJson(json['light_settings']),
        darkSettings: ThemeSettings.fromJson(json['dark_settings']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
      "light_settings": lightSettings.toJson(),
      "dark_settings": darkSettings.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The gift
  /// * [light_settings]: Theme settings for a light chat theme
  /// * [dark_settings]: Theme settings for a dark chat theme
  GiftChatTheme copyWith({
    UpgradedGift? gift,
    ThemeSettings? lightSettings,
    ThemeSettings? darkSettings,
  }) =>
      GiftChatTheme(
        gift: gift ?? this.gift,
        lightSettings: lightSettings ?? this.lightSettings,
        darkSettings: darkSettings ?? this.darkSettings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftChatTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
