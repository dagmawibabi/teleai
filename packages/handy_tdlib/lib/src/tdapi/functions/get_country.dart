part of '../tdapi.dart';

/// **GetCountry** *(getCountry)* - TDLib function
///
/// Returns information about an existing country. Can be called before authorization.
///
/// * [countryCode]: A two-letter ISO 3166-1 alpha-2 country code.
///
/// [CountryInfo] is returned on completion.
final class GetCountry extends TdFunction {
  /// **GetCountry** *(getCountry)* - TDLib function
  ///
  /// Returns information about an existing country. Can be called before authorization.
  ///
  /// * [countryCode]: A two-letter ISO 3166-1 alpha-2 country code.
  ///
  /// [CountryInfo] is returned on completion.
  const GetCountry({
    required this.countryCode,
  });

  /// A two-letter ISO 3166-1 alpha-2 country code
  final String countryCode;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "country_code": countryCode,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [country_code]: A two-letter ISO 3166-1 alpha-2 country code
  GetCountry copyWith({
    String? countryCode,
  }) =>
      GetCountry(
        countryCode: countryCode ?? this.countryCode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getCountry';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
