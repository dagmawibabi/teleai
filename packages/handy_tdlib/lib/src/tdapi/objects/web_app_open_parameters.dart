part of '../tdapi.dart';

/// **WebAppOpenParameters** *(webAppOpenParameters)* - basic class
///
/// Options to be used when a Web App is opened.
///
/// * [theme]: Preferred Web App theme; pass null to use the default theme *(optional)*.
/// * [applicationName]: Short name of the current application; 0-64 English letters, digits, and underscores.
/// * [mode]: The mode in which the Web App is opened; pass null to open in webAppOpenModeFullSize *(optional)*.
final class WebAppOpenParameters extends TdObject {
  /// **WebAppOpenParameters** *(webAppOpenParameters)* - basic class
  ///
  /// Options to be used when a Web App is opened.
  ///
  /// * [theme]: Preferred Web App theme; pass null to use the default theme *(optional)*.
  /// * [applicationName]: Short name of the current application; 0-64 English letters, digits, and underscores.
  /// * [mode]: The mode in which the Web App is opened; pass null to open in webAppOpenModeFullSize *(optional)*.
  const WebAppOpenParameters({
    this.theme,
    required this.applicationName,
    this.mode,
  });

  /// Preferred Web App theme; pass null to use the default theme
  final ThemeParameters? theme;

  /// Short name of the current application; 0-64 English letters, digits, and underscores
  final String applicationName;

  /// The mode in which the Web App is opened; pass null to open in webAppOpenModeFullSize
  final WebAppOpenMode? mode;

  /// Parse from a json
  factory WebAppOpenParameters.fromJson(Map<String, dynamic> json) =>
      WebAppOpenParameters(
        theme: json['theme'] == null
            ? null
            : ThemeParameters.fromJson(json['theme']),
        applicationName: json['application_name'],
        mode:
            json['mode'] == null ? null : WebAppOpenMode.fromJson(json['mode']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "theme": theme?.toJson(),
      "application_name": applicationName,
      "mode": mode?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [theme]: Preferred Web App theme; pass null to use the default theme
  /// * [application_name]: Short name of the current application; 0-64 English letters, digits, and underscores
  /// * [mode]: The mode in which the Web App is opened; pass null to open in webAppOpenModeFullSize
  WebAppOpenParameters copyWith({
    ThemeParameters? theme,
    String? applicationName,
    WebAppOpenMode? mode,
  }) =>
      WebAppOpenParameters(
        theme: theme ?? this.theme,
        applicationName: applicationName ?? this.applicationName,
        mode: mode ?? this.mode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'webAppOpenParameters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
