part of '../tdapi.dart';

/// **CloseWebApp** *(closeWebApp)* - TDLib function
///
/// Informs TDLib that a previously opened Web App was closed.
///
/// * [webAppLaunchId]: Identifier of Web App launch, received from openWebApp.
///
/// [Ok] is returned on completion.
final class CloseWebApp extends TdFunction {
  /// **CloseWebApp** *(closeWebApp)* - TDLib function
  ///
  /// Informs TDLib that a previously opened Web App was closed.
  ///
  /// * [webAppLaunchId]: Identifier of Web App launch, received from openWebApp.
  ///
  /// [Ok] is returned on completion.
  const CloseWebApp({
    required this.webAppLaunchId,
  });

  /// Identifier of Web App launch, received from openWebApp
  final int webAppLaunchId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "web_app_launch_id": webAppLaunchId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [web_app_launch_id]: Identifier of Web App launch, received from openWebApp
  CloseWebApp copyWith({
    int? webAppLaunchId,
  }) =>
      CloseWebApp(
        webAppLaunchId: webAppLaunchId ?? this.webAppLaunchId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'closeWebApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
