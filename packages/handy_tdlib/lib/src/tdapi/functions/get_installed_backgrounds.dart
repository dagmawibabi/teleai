part of '../tdapi.dart';

/// **GetInstalledBackgrounds** *(getInstalledBackgrounds)* - TDLib function
///
/// Returns backgrounds installed by the user.
///
/// * [forDarkTheme]: Pass true to order returned backgrounds for a dark theme.
///
/// [Backgrounds] is returned on completion.
final class GetInstalledBackgrounds extends TdFunction {
  /// **GetInstalledBackgrounds** *(getInstalledBackgrounds)* - TDLib function
  ///
  /// Returns backgrounds installed by the user.
  ///
  /// * [forDarkTheme]: Pass true to order returned backgrounds for a dark theme.
  ///
  /// [Backgrounds] is returned on completion.
  const GetInstalledBackgrounds({
    required this.forDarkTheme,
  });

  /// Pass true to order returned backgrounds for a dark theme
  final bool forDarkTheme;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "for_dark_theme": forDarkTheme,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [for_dark_theme]: Pass true to order returned backgrounds for a dark theme
  GetInstalledBackgrounds copyWith({
    bool? forDarkTheme,
  }) =>
      GetInstalledBackgrounds(
        forDarkTheme: forDarkTheme ?? this.forDarkTheme,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getInstalledBackgrounds';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
