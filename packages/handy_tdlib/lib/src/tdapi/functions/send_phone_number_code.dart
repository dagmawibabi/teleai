part of '../tdapi.dart';

/// **SendPhoneNumberCode** *(sendPhoneNumberCode)* - TDLib function
///
/// Sends a code to the specified phone number. Aborts previous phone number verification if there was one. On success, returns information about the sent code.
///
/// * [phoneNumber]: The phone number, in international format.
/// * [settings]: Settings for the authentication of the user's phone number; pass null to use default settings *(optional)*.
/// * [type]: Type of the request for which the code is sent.
///
/// [AuthenticationCodeInfo] is returned on completion.
final class SendPhoneNumberCode extends TdFunction {
  /// **SendPhoneNumberCode** *(sendPhoneNumberCode)* - TDLib function
  ///
  /// Sends a code to the specified phone number. Aborts previous phone number verification if there was one. On success, returns information about the sent code.
  ///
  /// * [phoneNumber]: The phone number, in international format.
  /// * [settings]: Settings for the authentication of the user's phone number; pass null to use default settings *(optional)*.
  /// * [type]: Type of the request for which the code is sent.
  ///
  /// [AuthenticationCodeInfo] is returned on completion.
  const SendPhoneNumberCode({
    required this.phoneNumber,
    this.settings,
    required this.type,
  });

  /// The phone number, in international format
  final String phoneNumber;

  /// Settings for the authentication of the user's phone number; pass null to use default settings
  final PhoneNumberAuthenticationSettings? settings;

  /// Type of the request for which the code is sent
  final PhoneNumberCodeType type;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "phone_number": phoneNumber,
      "settings": settings?.toJson(),
      "type": type.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [phone_number]: The phone number, in international format
  /// * [settings]: Settings for the authentication of the user's phone number; pass null to use default settings
  /// * [type]: Type of the request for which the code is sent
  SendPhoneNumberCode copyWith({
    String? phoneNumber,
    PhoneNumberAuthenticationSettings? settings,
    PhoneNumberCodeType? type,
  }) =>
      SendPhoneNumberCode(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        settings: settings ?? this.settings,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendPhoneNumberCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
