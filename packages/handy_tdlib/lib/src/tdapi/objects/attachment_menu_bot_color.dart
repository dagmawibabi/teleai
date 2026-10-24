part of '../tdapi.dart';

/// **AttachmentMenuBotColor** *(attachmentMenuBotColor)* - basic class
///
/// Describes a color to highlight a bot added to attachment menu.
///
/// * [lightColor]: Color in the RGB format for light themes.
/// * [darkColor]: Color in the RGB format for dark themes.
final class AttachmentMenuBotColor extends TdObject {
  /// **AttachmentMenuBotColor** *(attachmentMenuBotColor)* - basic class
  ///
  /// Describes a color to highlight a bot added to attachment menu.
  ///
  /// * [lightColor]: Color in the RGB format for light themes.
  /// * [darkColor]: Color in the RGB format for dark themes.
  const AttachmentMenuBotColor({
    required this.lightColor,
    required this.darkColor,
  });

  /// Color in the RGB format for light themes
  final int lightColor;

  /// Color in the RGB format for dark themes
  final int darkColor;

  /// Parse from a json
  factory AttachmentMenuBotColor.fromJson(Map<String, dynamic> json) =>
      AttachmentMenuBotColor(
        lightColor: json['light_color'],
        darkColor: json['dark_color'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "light_color": lightColor,
      "dark_color": darkColor,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [light_color]: Color in the RGB format for light themes
  /// * [dark_color]: Color in the RGB format for dark themes
  AttachmentMenuBotColor copyWith({
    int? lightColor,
    int? darkColor,
  }) =>
      AttachmentMenuBotColor(
        lightColor: lightColor ?? this.lightColor,
        darkColor: darkColor ?? this.darkColor,
      );

  /// TDLib object type
  static const String defaultObjectId = 'attachmentMenuBotColor';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
