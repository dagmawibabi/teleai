part of '../tdapi.dart';

/// **EmojiChatTheme** *(emojiChatTheme)* - basic class
///
/// Describes a chat theme based on an emoji.
///
/// * [name]: Theme name.
/// * [lightSettings]: Theme settings for a light chat theme.
/// * [darkSettings]: Theme settings for a dark chat theme.
final class EmojiChatTheme extends TdObject {
  /// **EmojiChatTheme** *(emojiChatTheme)* - basic class
  ///
  /// Describes a chat theme based on an emoji.
  ///
  /// * [name]: Theme name.
  /// * [lightSettings]: Theme settings for a light chat theme.
  /// * [darkSettings]: Theme settings for a dark chat theme.
  const EmojiChatTheme({
    required this.name,
    required this.lightSettings,
    required this.darkSettings,
  });

  /// Theme name
  final String name;

  /// Theme settings for a light chat theme
  final ThemeSettings lightSettings;

  /// Theme settings for a dark chat theme
  final ThemeSettings darkSettings;

  /// Parse from a json
  factory EmojiChatTheme.fromJson(Map<String, dynamic> json) => EmojiChatTheme(
        name: json['name'],
        lightSettings: ThemeSettings.fromJson(json['light_settings']),
        darkSettings: ThemeSettings.fromJson(json['dark_settings']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
      "light_settings": lightSettings.toJson(),
      "dark_settings": darkSettings.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Theme name
  /// * [light_settings]: Theme settings for a light chat theme
  /// * [dark_settings]: Theme settings for a dark chat theme
  EmojiChatTheme copyWith({
    String? name,
    ThemeSettings? lightSettings,
    ThemeSettings? darkSettings,
  }) =>
      EmojiChatTheme(
        name: name ?? this.name,
        lightSettings: lightSettings ?? this.lightSettings,
        darkSettings: darkSettings ?? this.darkSettings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojiChatTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
