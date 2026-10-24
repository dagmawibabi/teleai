part of '../tdapi.dart';

/// **ChatBackground** *(chatBackground)* - basic class
///
/// Describes a background set for a specific chat.
///
/// * [background]: The background.
/// * [darkThemeDimming]: Dimming of the background in dark themes, as a percentage; 0-100. Applied only to Wallpaper and Fill types of background.
final class ChatBackground extends TdObject {
  /// **ChatBackground** *(chatBackground)* - basic class
  ///
  /// Describes a background set for a specific chat.
  ///
  /// * [background]: The background.
  /// * [darkThemeDimming]: Dimming of the background in dark themes, as a percentage; 0-100. Applied only to Wallpaper and Fill types of background.
  const ChatBackground({
    required this.background,
    required this.darkThemeDimming,
  });

  /// The background
  final Background background;

  /// Dimming of the background in dark themes, as a percentage; 0-100. Applied only to Wallpaper and Fill types of background
  final int darkThemeDimming;

  /// Parse from a json
  factory ChatBackground.fromJson(Map<String, dynamic> json) => ChatBackground(
        background: Background.fromJson(json['background']),
        darkThemeDimming: json['dark_theme_dimming'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "background": background.toJson(),
      "dark_theme_dimming": darkThemeDimming,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [background]: The background
  /// * [dark_theme_dimming]: Dimming of the background in dark themes, as a percentage; 0-100. Applied only to Wallpaper and Fill types of background
  ChatBackground copyWith({
    Background? background,
    int? darkThemeDimming,
  }) =>
      ChatBackground(
        background: background ?? this.background,
        darkThemeDimming: darkThemeDimming ?? this.darkThemeDimming,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
