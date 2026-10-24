part of '../tdapi.dart';

/// **GetPhoneNumberInfo** *(getPhoneNumberInfo)* - TDLib function
///
/// Returns information about a phone number by its prefix. Can be called before authorization.
///
/// * [phoneNumberPrefix]: The phone number prefix.
///
/// [PhoneNumberInfo] is returned on completion.
final class GetPhoneNumberInfo extends TdFunction {
  /// **GetPhoneNumberInfo** *(getPhoneNumberInfo)* - TDLib function
  ///
  /// Returns information about a phone number by its prefix. Can be called before authorization.
  ///
  /// * [phoneNumberPrefix]: The phone number prefix.
  ///
  /// [PhoneNumberInfo] is returned on completion.
  const GetPhoneNumberInfo({
    required this.phoneNumberPrefix,
  });

  /// The phone number prefix
  final String phoneNumberPrefix;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "phone_number_prefix": phoneNumberPrefix,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [phone_number_prefix]: The phone number prefix
  GetPhoneNumberInfo copyWith({
    String? phoneNumberPrefix,
  }) =>
      GetPhoneNumberInfo(
        phoneNumberPrefix: phoneNumberPrefix ?? this.phoneNumberPrefix,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPhoneNumberInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
