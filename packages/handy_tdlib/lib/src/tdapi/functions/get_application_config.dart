part of '../tdapi.dart';

/// **GetApplicationConfig** *(getApplicationConfig)* - TDLib function
///
/// Returns application config, provided by the server. Can be called before authorization.
///
/// [JsonValue] is returned on completion.
final class GetApplicationConfig extends TdFunction {
  /// **GetApplicationConfig** *(getApplicationConfig)* - TDLib function
  ///
  /// Returns application config, provided by the server. Can be called before authorization.
  ///
  /// [JsonValue] is returned on completion.
  const GetApplicationConfig();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetApplicationConfig copyWith() => const GetApplicationConfig();

  /// TDLib object type
  static const String defaultObjectId = 'getApplicationConfig';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
