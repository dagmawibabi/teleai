part of '../tdapi.dart';

/// **ProfileAccentColor** *(profileAccentColor)* - basic class
///
/// Contains information about supported accent color for user profile photo background.
///
/// * [id]: Profile accent color identifier.
/// * [lightThemeColors]: Accent colors expected to be used in light themes.
/// * [darkThemeColors]: Accent colors expected to be used in dark themes.
/// * [minSupergroupChatBoostLevel]: The minimum chat boost level required to use the color in a supergroup chat.
/// * [minChannelChatBoostLevel]: The minimum chat boost level required to use the color in a channel chat.
final class ProfileAccentColor extends TdObject {
  /// **ProfileAccentColor** *(profileAccentColor)* - basic class
  ///
  /// Contains information about supported accent color for user profile photo background.
  ///
  /// * [id]: Profile accent color identifier.
  /// * [lightThemeColors]: Accent colors expected to be used in light themes.
  /// * [darkThemeColors]: Accent colors expected to be used in dark themes.
  /// * [minSupergroupChatBoostLevel]: The minimum chat boost level required to use the color in a supergroup chat.
  /// * [minChannelChatBoostLevel]: The minimum chat boost level required to use the color in a channel chat.
  const ProfileAccentColor({
    required this.id,
    required this.lightThemeColors,
    required this.darkThemeColors,
    required this.minSupergroupChatBoostLevel,
    required this.minChannelChatBoostLevel,
  });

  /// Profile accent color identifier
  final int id;

  /// Accent colors expected to be used in light themes
  final ProfileAccentColors lightThemeColors;

  /// Accent colors expected to be used in dark themes
  final ProfileAccentColors darkThemeColors;

  /// The minimum chat boost level required to use the color in a supergroup chat
  final int minSupergroupChatBoostLevel;

  /// The minimum chat boost level required to use the color in a channel chat
  final int minChannelChatBoostLevel;

  /// Parse from a json
  factory ProfileAccentColor.fromJson(Map<String, dynamic> json) =>
      ProfileAccentColor(
        id: json['id'],
        lightThemeColors:
            ProfileAccentColors.fromJson(json['light_theme_colors']),
        darkThemeColors:
            ProfileAccentColors.fromJson(json['dark_theme_colors']),
        minSupergroupChatBoostLevel: json['min_supergroup_chat_boost_level'],
        minChannelChatBoostLevel: json['min_channel_chat_boost_level'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "light_theme_colors": lightThemeColors.toJson(),
      "dark_theme_colors": darkThemeColors.toJson(),
      "min_supergroup_chat_boost_level": minSupergroupChatBoostLevel,
      "min_channel_chat_boost_level": minChannelChatBoostLevel,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Profile accent color identifier
  /// * [light_theme_colors]: Accent colors expected to be used in light themes
  /// * [dark_theme_colors]: Accent colors expected to be used in dark themes
  /// * [min_supergroup_chat_boost_level]: The minimum chat boost level required to use the color in a supergroup chat
  /// * [min_channel_chat_boost_level]: The minimum chat boost level required to use the color in a channel chat
  ProfileAccentColor copyWith({
    int? id,
    ProfileAccentColors? lightThemeColors,
    ProfileAccentColors? darkThemeColors,
    int? minSupergroupChatBoostLevel,
    int? minChannelChatBoostLevel,
  }) =>
      ProfileAccentColor(
        id: id ?? this.id,
        lightThemeColors: lightThemeColors ?? this.lightThemeColors,
        darkThemeColors: darkThemeColors ?? this.darkThemeColors,
        minSupergroupChatBoostLevel:
            minSupergroupChatBoostLevel ?? this.minSupergroupChatBoostLevel,
        minChannelChatBoostLevel:
            minChannelChatBoostLevel ?? this.minChannelChatBoostLevel,
      );

  /// TDLib object type
  static const String defaultObjectId = 'profileAccentColor';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
