part of '../tdapi.dart';

/// **GetPhoneNumberInfoSync** *(getPhoneNumberInfoSync)* - TDLib function
///
/// Returns information about a phone number by its prefix synchronously. getCountries must be called at least once after changing. localization to the specified language if properly localized country information is expected. Can be called synchronously.
///
/// * [languageCode]: A two-letter ISO 639-1 language code for country information localization.
/// * [phoneNumberPrefix]: The phone number prefix.
///
/// [PhoneNumberInfo] is returned on completion.
final class GetPhoneNumberInfoSync extends TdFunction {
  /// **GetPhoneNumberInfoSync** *(getPhoneNumberInfoSync)* - TDLib function
  ///
  /// Returns information about a phone number by its prefix synchronously. getCountries must be called at least once after changing. localization to the specified language if properly localized country information is expected. Can be called synchronously.
  ///
  /// * [languageCode]: A two-letter ISO 639-1 language code for country information localization.
  /// * [phoneNumberPrefix]: The phone number prefix.
  ///
  /// [PhoneNumberInfo] is returned on completion.
  const GetPhoneNumberInfoSync({
    required this.languageCode,
    required this.phoneNumberPrefix,
  });

  /// A two-letter ISO 639-1 language code for country information localization
  final String languageCode;

  /// The phone number prefix
  final String phoneNumberPrefix;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "language_code": languageCode,
      "phone_number_prefix": phoneNumberPrefix,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [language_code]: A two-letter ISO 639-1 language code for country information localization
  /// * [phone_number_prefix]: The phone number prefix
  GetPhoneNumberInfoSync copyWith({
    String? languageCode,
    String? phoneNumberPrefix,
  }) =>
      GetPhoneNumberInfoSync(
        languageCode: languageCode ?? this.languageCode,
        phoneNumberPrefix: phoneNumberPrefix ?? this.phoneNumberPrefix,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPhoneNumberInfoSync';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
