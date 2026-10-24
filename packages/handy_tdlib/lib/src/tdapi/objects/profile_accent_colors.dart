part of '../tdapi.dart';

/// **ProfileAccentColors** *(profileAccentColors)* - basic class
///
/// Contains information about supported accent colors for user profile photo background in RGB format.
///
/// * [paletteColors]: The list of 1-2 colors in RGB format, describing the colors, as expected to be shown in the color palette settings.
/// * [backgroundColors]: The list of 1-2 colors in RGB format, describing the colors, as expected to be used for the profile photo background.
/// * [storyColors]: The list of 2 colors in RGB format, describing the colors of the gradient to be used for the unread active story indicator around profile photo.
final class ProfileAccentColors extends TdObject {
  /// **ProfileAccentColors** *(profileAccentColors)* - basic class
  ///
  /// Contains information about supported accent colors for user profile photo background in RGB format.
  ///
  /// * [paletteColors]: The list of 1-2 colors in RGB format, describing the colors, as expected to be shown in the color palette settings.
  /// * [backgroundColors]: The list of 1-2 colors in RGB format, describing the colors, as expected to be used for the profile photo background.
  /// * [storyColors]: The list of 2 colors in RGB format, describing the colors of the gradient to be used for the unread active story indicator around profile photo.
  const ProfileAccentColors({
    required this.paletteColors,
    required this.backgroundColors,
    required this.storyColors,
  });

  /// The list of 1-2 colors in RGB format, describing the colors, as expected to be shown in the color palette settings
  final List<int> paletteColors;

  /// The list of 1-2 colors in RGB format, describing the colors, as expected to be used for the profile photo background
  final List<int> backgroundColors;

  /// The list of 2 colors in RGB format, describing the colors of the gradient to be used for the unread active story indicator around profile photo
  final List<int> storyColors;

  /// Parse from a json
  factory ProfileAccentColors.fromJson(Map<String, dynamic> json) =>
      ProfileAccentColors(
        paletteColors: List<int>.from(
            (json['palette_colors'] ?? []).map((item) => item).toList()),
        backgroundColors: List<int>.from(
            (json['background_colors'] ?? []).map((item) => item).toList()),
        storyColors: List<int>.from(
            (json['story_colors'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "palette_colors": paletteColors.map((i) => i).toList(),
      "background_colors": backgroundColors.map((i) => i).toList(),
      "story_colors": storyColors.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [palette_colors]: The list of 1-2 colors in RGB format, describing the colors, as expected to be shown in the color palette settings
  /// * [background_colors]: The list of 1-2 colors in RGB format, describing the colors, as expected to be used for the profile photo background
  /// * [story_colors]: The list of 2 colors in RGB format, describing the colors of the gradient to be used for the unread active story indicator around profile photo
  ProfileAccentColors copyWith({
    List<int>? paletteColors,
    List<int>? backgroundColors,
    List<int>? storyColors,
  }) =>
      ProfileAccentColors(
        paletteColors: paletteColors ?? this.paletteColors,
        backgroundColors: backgroundColors ?? this.backgroundColors,
        storyColors: storyColors ?? this.storyColors,
      );

  /// TDLib object type
  static const String defaultObjectId = 'profileAccentColors';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
