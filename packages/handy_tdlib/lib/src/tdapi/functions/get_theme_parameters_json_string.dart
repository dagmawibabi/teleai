part of '../tdapi.dart';

/// **GetThemeParametersJsonString** *(getThemeParametersJsonString)* - TDLib function
///
/// Converts a themeParameters object to corresponding JSON-serialized string. Can be called synchronously.
///
/// * [theme]: Theme parameters to convert to JSON.
///
/// [Text] is returned on completion.
final class GetThemeParametersJsonString extends TdFunction {
  /// **GetThemeParametersJsonString** *(getThemeParametersJsonString)* - TDLib function
  ///
  /// Converts a themeParameters object to corresponding JSON-serialized string. Can be called synchronously.
  ///
  /// * [theme]: Theme parameters to convert to JSON.
  ///
  /// [Text] is returned on completion.
  const GetThemeParametersJsonString({
    required this.theme,
  });

  /// Theme parameters to convert to JSON
  final ThemeParameters theme;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "theme": theme.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [theme]: Theme parameters to convert to JSON
  GetThemeParametersJsonString copyWith({
    ThemeParameters? theme,
  }) =>
      GetThemeParametersJsonString(
        theme: theme ?? this.theme,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getThemeParametersJsonString';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
