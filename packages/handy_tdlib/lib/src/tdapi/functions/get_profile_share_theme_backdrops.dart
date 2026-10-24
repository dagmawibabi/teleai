part of '../tdapi.dart';

/// **GetProfileShareThemeBackdrops** *(getProfileShareThemeBackdrops)* - TDLib function
///
/// Returns the list of backdrops, which can be used as a background of a theme of the screen for sharing a link to a user or a chat.
///
/// [ProfileShareThemeBackdrops] is returned on completion.
final class GetProfileShareThemeBackdrops extends TdFunction {
  /// **GetProfileShareThemeBackdrops** *(getProfileShareThemeBackdrops)* - TDLib function
  ///
  /// Returns the list of backdrops, which can be used as a background of a theme of the screen for sharing a link to a user or a chat.
  ///
  /// [ProfileShareThemeBackdrops] is returned on completion.
  const GetProfileShareThemeBackdrops();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetProfileShareThemeBackdrops copyWith() =>
      const GetProfileShareThemeBackdrops();

  /// TDLib object type
  static const String defaultObjectId = 'getProfileShareThemeBackdrops';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
