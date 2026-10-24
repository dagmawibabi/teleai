part of '../tdapi.dart';

/// **UpgradedGiftColors** *(upgradedGiftColors)* - basic class
///
/// Contains information about color scheme for user's name, background of empty chat photo, replies to messages and link previews.
///
/// * [id]: Unique identifier of the upgraded gift colors.
/// * [modelCustomEmojiId]: Custom emoji identifier of the model of the upgraded gift.
/// * [symbolCustomEmojiId]: Custom emoji identifier of the symbol of the upgraded gift.
/// * [lightThemeAccentColor]: Accent color to use in light themes in RGB format.
/// * [lightThemeColors]: The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in light themes.
/// * [darkThemeAccentColor]: Accent color to use in dark themes in RGB format.
/// * [darkThemeColors]: The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in dark themes.
final class UpgradedGiftColors extends TdObject {
  /// **UpgradedGiftColors** *(upgradedGiftColors)* - basic class
  ///
  /// Contains information about color scheme for user's name, background of empty chat photo, replies to messages and link previews.
  ///
  /// * [id]: Unique identifier of the upgraded gift colors.
  /// * [modelCustomEmojiId]: Custom emoji identifier of the model of the upgraded gift.
  /// * [symbolCustomEmojiId]: Custom emoji identifier of the symbol of the upgraded gift.
  /// * [lightThemeAccentColor]: Accent color to use in light themes in RGB format.
  /// * [lightThemeColors]: The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in light themes.
  /// * [darkThemeAccentColor]: Accent color to use in dark themes in RGB format.
  /// * [darkThemeColors]: The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in dark themes.
  const UpgradedGiftColors({
    required this.id,
    required this.modelCustomEmojiId,
    required this.symbolCustomEmojiId,
    required this.lightThemeAccentColor,
    required this.lightThemeColors,
    required this.darkThemeAccentColor,
    required this.darkThemeColors,
  });

  /// Unique identifier of the upgraded gift colors
  final int id;

  /// Custom emoji identifier of the model of the upgraded gift
  final int modelCustomEmojiId;

  /// Custom emoji identifier of the symbol of the upgraded gift
  final int symbolCustomEmojiId;

  /// Accent color to use in light themes in RGB format
  final int lightThemeAccentColor;

  /// The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in light themes
  final List<int> lightThemeColors;

  /// Accent color to use in dark themes in RGB format
  final int darkThemeAccentColor;

  /// The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in dark themes
  final List<int> darkThemeColors;

  /// Parse from a json
  factory UpgradedGiftColors.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftColors(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        modelCustomEmojiId: json['model_custom_emoji_id'] is int
            ? json['model_custom_emoji_id']
            : int.parse(json['model_custom_emoji_id']),
        symbolCustomEmojiId: json['symbol_custom_emoji_id'] is int
            ? json['symbol_custom_emoji_id']
            : int.parse(json['symbol_custom_emoji_id']),
        lightThemeAccentColor: json['light_theme_accent_color'],
        lightThemeColors: List<int>.from(
            (json['light_theme_colors'] ?? []).map((item) => item).toList()),
        darkThemeAccentColor: json['dark_theme_accent_color'],
        darkThemeColors: List<int>.from(
            (json['dark_theme_colors'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "model_custom_emoji_id": modelCustomEmojiId,
      "symbol_custom_emoji_id": symbolCustomEmojiId,
      "light_theme_accent_color": lightThemeAccentColor,
      "light_theme_colors": lightThemeColors.map((i) => i).toList(),
      "dark_theme_accent_color": darkThemeAccentColor,
      "dark_theme_colors": darkThemeColors.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the upgraded gift colors
  /// * [model_custom_emoji_id]: Custom emoji identifier of the model of the upgraded gift
  /// * [symbol_custom_emoji_id]: Custom emoji identifier of the symbol of the upgraded gift
  /// * [light_theme_accent_color]: Accent color to use in light themes in RGB format
  /// * [light_theme_colors]: The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in light themes
  /// * [dark_theme_accent_color]: Accent color to use in dark themes in RGB format
  /// * [dark_theme_colors]: The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in dark themes
  UpgradedGiftColors copyWith({
    int? id,
    int? modelCustomEmojiId,
    int? symbolCustomEmojiId,
    int? lightThemeAccentColor,
    List<int>? lightThemeColors,
    int? darkThemeAccentColor,
    List<int>? darkThemeColors,
  }) =>
      UpgradedGiftColors(
        id: id ?? this.id,
        modelCustomEmojiId: modelCustomEmojiId ?? this.modelCustomEmojiId,
        symbolCustomEmojiId: symbolCustomEmojiId ?? this.symbolCustomEmojiId,
        lightThemeAccentColor:
            lightThemeAccentColor ?? this.lightThemeAccentColor,
        lightThemeColors: lightThemeColors ?? this.lightThemeColors,
        darkThemeAccentColor: darkThemeAccentColor ?? this.darkThemeAccentColor,
        darkThemeColors: darkThemeColors ?? this.darkThemeColors,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftColors';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
