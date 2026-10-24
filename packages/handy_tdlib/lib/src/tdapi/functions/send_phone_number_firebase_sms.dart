part of '../tdapi.dart';

/// **SendPhoneNumberFirebaseSms** *(sendPhoneNumberFirebaseSms)* - TDLib function
///
/// Sends Firebase Authentication SMS to the specified phone number. Works only when received a code of the type authenticationCodeTypeFirebaseAndroid or authenticationCodeTypeFirebaseIos.
///
/// * [token]: Play Integrity API or SafetyNet Attestation API token for the Android application, or secret from push notification for the iOS application.
///
/// [Ok] is returned on completion.
final class SendPhoneNumberFirebaseSms extends TdFunction {
  /// **SendPhoneNumberFirebaseSms** *(sendPhoneNumberFirebaseSms)* - TDLib function
  ///
  /// Sends Firebase Authentication SMS to the specified phone number. Works only when received a code of the type authenticationCodeTypeFirebaseAndroid or authenticationCodeTypeFirebaseIos.
  ///
  /// * [token]: Play Integrity API or SafetyNet Attestation API token for the Android application, or secret from push notification for the iOS application.
  ///
  /// [Ok] is returned on completion.
  const SendPhoneNumberFirebaseSms({
    required this.token,
  });

  /// Play Integrity API or SafetyNet Attestation API token for the Android application, or secret from push notification for the iOS application
  final String token;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "token": token,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [token]: Play Integrity API or SafetyNet Attestation API token for the Android application, or secret from push notification for the iOS application
  SendPhoneNumberFirebaseSms copyWith({
    String? token,
  }) =>
      SendPhoneNumberFirebaseSms(
        token: token ?? this.token,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendPhoneNumberFirebaseSms';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
