part of '../tdapi.dart';

/// **GetPreferredCountryLanguage** *(getPreferredCountryLanguage)* - TDLib function
///
/// Returns an IETF language tag of the language preferred in the country, which must be used to fill native fields in Telegram Passport personal details.. Returns a 404 error if unknown.
///
/// * [countryCode]: A two-letter ISO 3166-1 alpha-2 country code.
///
/// [Text] is returned on completion.
final class GetPreferredCountryLanguage extends TdFunction {
  /// **GetPreferredCountryLanguage** *(getPreferredCountryLanguage)* - TDLib function
  ///
  /// Returns an IETF language tag of the language preferred in the country, which must be used to fill native fields in Telegram Passport personal details.. Returns a 404 error if unknown.
  ///
  /// * [countryCode]: A two-letter ISO 3166-1 alpha-2 country code.
  ///
  /// [Text] is returned on completion.
  const GetPreferredCountryLanguage({
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
  GetPreferredCountryLanguage copyWith({
    String? countryCode,
  }) =>
      GetPreferredCountryLanguage(
        countryCode: countryCode ?? this.countryCode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPreferredCountryLanguage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
