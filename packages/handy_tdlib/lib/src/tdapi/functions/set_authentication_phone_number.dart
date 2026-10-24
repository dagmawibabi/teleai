part of '../tdapi.dart';

/// **SetAuthenticationPhoneNumber** *(setAuthenticationPhoneNumber)* - TDLib function
///
/// Sets the phone number of the user and sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitPhoneNumber,. or if there is no pending authentication query and the current authorization state is authorizationStateWaitPremiumPurchase, authorizationStateWaitEmailAddress,. authorizationStateWaitEmailCode, authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword.
///
/// * [phoneNumber]: The phone number of the user, in international format.
/// * [settings]: Settings for the authentication of the user's phone number; pass null to use default settings *(optional)*.
///
/// [Ok] is returned on completion.
final class SetAuthenticationPhoneNumber extends TdFunction {
  /// **SetAuthenticationPhoneNumber** *(setAuthenticationPhoneNumber)* - TDLib function
  ///
  /// Sets the phone number of the user and sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitPhoneNumber,. or if there is no pending authentication query and the current authorization state is authorizationStateWaitPremiumPurchase, authorizationStateWaitEmailAddress,. authorizationStateWaitEmailCode, authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword.
  ///
  /// * [phoneNumber]: The phone number of the user, in international format.
  /// * [settings]: Settings for the authentication of the user's phone number; pass null to use default settings *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetAuthenticationPhoneNumber({
    required this.phoneNumber,
    this.settings,
  });

  /// The phone number of the user, in international format
  final String phoneNumber;

  /// Settings for the authentication of the user's phone number; pass null to use default settings
  final PhoneNumberAuthenticationSettings? settings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "phone_number": phoneNumber,
      "settings": settings?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [phone_number]: The phone number of the user, in international format
  /// * [settings]: Settings for the authentication of the user's phone number; pass null to use default settings
  SetAuthenticationPhoneNumber copyWith({
    String? phoneNumber,
    PhoneNumberAuthenticationSettings? settings,
  }) =>
      SetAuthenticationPhoneNumber(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        settings: settings ?? this.settings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setAuthenticationPhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
