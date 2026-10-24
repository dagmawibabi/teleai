part of '../tdapi.dart';

/// **AccentColor** *(accentColor)* - basic class
///
/// Contains information about supported accent color for user/chat name, background of empty chat photo, replies to messages and link previews.
///
/// * [id]: Accent color identifier.
/// * [builtInAccentColorId]: Identifier of a built-in color to use in places, where only one color is needed; 0-6.
/// * [lightThemeColors]: The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in light themes.
/// * [darkThemeColors]: The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in dark themes.
/// * [minChannelChatBoostLevel]: The minimum chat boost level required to use the color in a channel chat.
final class AccentColor extends TdObject {
  /// **AccentColor** *(accentColor)* - basic class
  ///
  /// Contains information about supported accent color for user/chat name, background of empty chat photo, replies to messages and link previews.
  ///
  /// * [id]: Accent color identifier.
  /// * [builtInAccentColorId]: Identifier of a built-in color to use in places, where only one color is needed; 0-6.
  /// * [lightThemeColors]: The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in light themes.
  /// * [darkThemeColors]: The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in dark themes.
  /// * [minChannelChatBoostLevel]: The minimum chat boost level required to use the color in a channel chat.
  const AccentColor({
    required this.id,
    required this.builtInAccentColorId,
    required this.lightThemeColors,
    required this.darkThemeColors,
    required this.minChannelChatBoostLevel,
  });

  /// Accent color identifier
  final int id;

  /// Identifier of a built-in color to use in places, where only one color is needed; 0-6
  final int builtInAccentColorId;

  /// The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in light themes
  final List<int> lightThemeColors;

  /// The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in dark themes
  final List<int> darkThemeColors;

  /// The minimum chat boost level required to use the color in a channel chat
  final int minChannelChatBoostLevel;

  /// Parse from a json
  factory AccentColor.fromJson(Map<String, dynamic> json) => AccentColor(
        id: json['id'],
        builtInAccentColorId: json['built_in_accent_color_id'],
        lightThemeColors: List<int>.from(
            (json['light_theme_colors'] ?? []).map((item) => item).toList()),
        darkThemeColors: List<int>.from(
            (json['dark_theme_colors'] ?? []).map((item) => item).toList()),
        minChannelChatBoostLevel: json['min_channel_chat_boost_level'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "built_in_accent_color_id": builtInAccentColorId,
      "light_theme_colors": lightThemeColors.map((i) => i).toList(),
      "dark_theme_colors": darkThemeColors.map((i) => i).toList(),
      "min_channel_chat_boost_level": minChannelChatBoostLevel,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Accent color identifier
  /// * [built_in_accent_color_id]: Identifier of a built-in color to use in places, where only one color is needed; 0-6
  /// * [light_theme_colors]: The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in light themes
  /// * [dark_theme_colors]: The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in dark themes
  /// * [min_channel_chat_boost_level]: The minimum chat boost level required to use the color in a channel chat
  AccentColor copyWith({
    int? id,
    int? builtInAccentColorId,
    List<int>? lightThemeColors,
    List<int>? darkThemeColors,
    int? minChannelChatBoostLevel,
  }) =>
      AccentColor(
        id: id ?? this.id,
        builtInAccentColorId: builtInAccentColorId ?? this.builtInAccentColorId,
        lightThemeColors: lightThemeColors ?? this.lightThemeColors,
        darkThemeColors: darkThemeColors ?? this.darkThemeColors,
        minChannelChatBoostLevel:
            minChannelChatBoostLevel ?? this.minChannelChatBoostLevel,
      );

  /// TDLib object type
  static const String defaultObjectId = 'accentColor';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
