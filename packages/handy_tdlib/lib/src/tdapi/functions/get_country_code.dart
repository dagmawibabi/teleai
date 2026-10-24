part of '../tdapi.dart';

/// **GetCountryCode** *(getCountryCode)* - TDLib function
///
/// Uses the current IP address to find the current country. Returns two-letter ISO 3166-1 alpha-2 country code. Can be called before authorization.
///
/// [Text] is returned on completion.
final class GetCountryCode extends TdFunction {
  /// **GetCountryCode** *(getCountryCode)* - TDLib function
  ///
  /// Uses the current IP address to find the current country. Returns two-letter ISO 3166-1 alpha-2 country code. Can be called before authorization.
  ///
  /// [Text] is returned on completion.
  const GetCountryCode();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetCountryCode copyWith() => const GetCountryCode();

  /// TDLib object type
  static const String defaultObjectId = 'getCountryCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
