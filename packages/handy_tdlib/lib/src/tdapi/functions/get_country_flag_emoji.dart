part of '../tdapi.dart';

/// **GetCountryFlagEmoji** *(getCountryFlagEmoji)* - TDLib function
///
/// Returns an emoji for the flag of the given country. Returns an empty string on failure. Can be called synchronously.
///
/// * [countryCode]: A two-letter ISO 3166-1 alpha-2 country code as received from getCountries.
///
/// [Text] is returned on completion.
final class GetCountryFlagEmoji extends TdFunction {
  /// **GetCountryFlagEmoji** *(getCountryFlagEmoji)* - TDLib function
  ///
  /// Returns an emoji for the flag of the given country. Returns an empty string on failure. Can be called synchronously.
  ///
  /// * [countryCode]: A two-letter ISO 3166-1 alpha-2 country code as received from getCountries.
  ///
  /// [Text] is returned on completion.
  const GetCountryFlagEmoji({
    required this.countryCode,
  });

  /// A two-letter ISO 3166-1 alpha-2 country code as received from getCountries
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
  /// * [country_code]: A two-letter ISO 3166-1 alpha-2 country code as received from getCountries
  GetCountryFlagEmoji copyWith({
    String? countryCode,
  }) =>
      GetCountryFlagEmoji(
        countryCode: countryCode ?? this.countryCode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getCountryFlagEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
