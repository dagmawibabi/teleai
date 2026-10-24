part of '../tdapi.dart';

/// **PhoneNumberAuthenticationSettings** *(phoneNumberAuthenticationSettings)* - basic class
///
/// Contains settings for the authentication of the user's phone number.
///
/// * [allowFlashCall]: Pass true if the authentication code may be sent via a flash call to the specified phone number.
/// * [allowMissedCall]: Pass true if the authentication code may be sent via a missed call to the specified phone number.
/// * [isCurrentPhoneNumber]: Pass true if the authenticated phone number is used on the current device.
/// * [hasUnknownPhoneNumber]: Pass true if there is a SIM card in the current device, but it is not possible to check whether phone number matches.
/// * [allowSmsRetrieverApi]: For official applications only. True, if the application can use Android SMS Retriever API. (requires Google Play Services. See https://developers.google.com/identity/sms-retriever/ for more details.
/// * [firebaseAuthenticationSettings]: For official Android and iOS applications only; pass null otherwise. Settings for Firebase Authentication *(optional)*.
/// * [authenticationTokens]: List of up to 20 authentication tokens, recently received in updateOption("authentication_token") in previously logged out sessions; for setAuthenticationPhoneNumber only.
final class PhoneNumberAuthenticationSettings extends TdObject {
  /// **PhoneNumberAuthenticationSettings** *(phoneNumberAuthenticationSettings)* - basic class
  ///
  /// Contains settings for the authentication of the user's phone number.
  ///
  /// * [allowFlashCall]: Pass true if the authentication code may be sent via a flash call to the specified phone number.
  /// * [allowMissedCall]: Pass true if the authentication code may be sent via a missed call to the specified phone number.
  /// * [isCurrentPhoneNumber]: Pass true if the authenticated phone number is used on the current device.
  /// * [hasUnknownPhoneNumber]: Pass true if there is a SIM card in the current device, but it is not possible to check whether phone number matches.
  /// * [allowSmsRetrieverApi]: For official applications only. True, if the application can use Android SMS Retriever API. (requires Google Play Services. See https://developers.google.com/identity/sms-retriever/ for more details.
  /// * [firebaseAuthenticationSettings]: For official Android and iOS applications only; pass null otherwise. Settings for Firebase Authentication *(optional)*.
  /// * [authenticationTokens]: List of up to 20 authentication tokens, recently received in updateOption("authentication_token") in previously logged out sessions; for setAuthenticationPhoneNumber only.
  const PhoneNumberAuthenticationSettings({
    required this.allowFlashCall,
    required this.allowMissedCall,
    required this.isCurrentPhoneNumber,
    required this.hasUnknownPhoneNumber,
    required this.allowSmsRetrieverApi,
    this.firebaseAuthenticationSettings,
    required this.authenticationTokens,
  });

  /// Pass true if the authentication code may be sent via a flash call to the specified phone number
  final bool allowFlashCall;

  /// Pass true if the authentication code may be sent via a missed call to the specified phone number
  final bool allowMissedCall;

  /// Pass true if the authenticated phone number is used on the current device
  final bool isCurrentPhoneNumber;

  /// Pass true if there is a SIM card in the current device, but it is not possible to check whether phone number matches
  final bool hasUnknownPhoneNumber;

  /// For official applications only. True, if the application can use Android SMS Retriever API. (requires Google Play Services. See https://developers.google.com/identity/sms-retriever/ for more details
  final bool allowSmsRetrieverApi;

  /// For official Android and iOS applications only; pass null otherwise. Settings for Firebase Authentication
  final FirebaseAuthenticationSettings? firebaseAuthenticationSettings;

  /// List of up to 20 authentication tokens, recently received in updateOption("authentication_token") in previously logged out sessions; for setAuthenticationPhoneNumber only
  final List<String> authenticationTokens;

  /// Parse from a json
  factory PhoneNumberAuthenticationSettings.fromJson(
          Map<String, dynamic> json) =>
      PhoneNumberAuthenticationSettings(
        allowFlashCall: json['allow_flash_call'],
        allowMissedCall: json['allow_missed_call'],
        isCurrentPhoneNumber: json['is_current_phone_number'],
        hasUnknownPhoneNumber: json['has_unknown_phone_number'],
        allowSmsRetrieverApi: json['allow_sms_retriever_api'],
        firebaseAuthenticationSettings:
            json['firebase_authentication_settings'] == null
                ? null
                : FirebaseAuthenticationSettings.fromJson(
                    json['firebase_authentication_settings']),
        authenticationTokens: List<String>.from(
            (json['authentication_tokens'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "allow_flash_call": allowFlashCall,
      "allow_missed_call": allowMissedCall,
      "is_current_phone_number": isCurrentPhoneNumber,
      "has_unknown_phone_number": hasUnknownPhoneNumber,
      "allow_sms_retriever_api": allowSmsRetrieverApi,
      "firebase_authentication_settings":
          firebaseAuthenticationSettings?.toJson(),
      "authentication_tokens": authenticationTokens.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [allow_flash_call]: Pass true if the authentication code may be sent via a flash call to the specified phone number
  /// * [allow_missed_call]: Pass true if the authentication code may be sent via a missed call to the specified phone number
  /// * [is_current_phone_number]: Pass true if the authenticated phone number is used on the current device
  /// * [has_unknown_phone_number]: Pass true if there is a SIM card in the current device, but it is not possible to check whether phone number matches
  /// * [allow_sms_retriever_api]: For official applications only. True, if the application can use Android SMS Retriever API. (requires Google Play Services. See https://developers.google.com/identity/sms-retriever/ for more details
  /// * [firebase_authentication_settings]: For official Android and iOS applications only; pass null otherwise. Settings for Firebase Authentication
  /// * [authentication_tokens]: List of up to 20 authentication tokens, recently received in updateOption("authentication_token") in previously logged out sessions; for setAuthenticationPhoneNumber only
  PhoneNumberAuthenticationSettings copyWith({
    bool? allowFlashCall,
    bool? allowMissedCall,
    bool? isCurrentPhoneNumber,
    bool? hasUnknownPhoneNumber,
    bool? allowSmsRetrieverApi,
    FirebaseAuthenticationSettings? firebaseAuthenticationSettings,
    List<String>? authenticationTokens,
  }) =>
      PhoneNumberAuthenticationSettings(
        allowFlashCall: allowFlashCall ?? this.allowFlashCall,
        allowMissedCall: allowMissedCall ?? this.allowMissedCall,
        isCurrentPhoneNumber: isCurrentPhoneNumber ?? this.isCurrentPhoneNumber,
        hasUnknownPhoneNumber:
            hasUnknownPhoneNumber ?? this.hasUnknownPhoneNumber,
        allowSmsRetrieverApi: allowSmsRetrieverApi ?? this.allowSmsRetrieverApi,
        firebaseAuthenticationSettings: firebaseAuthenticationSettings ??
            this.firebaseAuthenticationSettings,
        authenticationTokens: authenticationTokens ?? this.authenticationTokens,
      );

  /// TDLib object type
  static const String defaultObjectId = 'phoneNumberAuthenticationSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
