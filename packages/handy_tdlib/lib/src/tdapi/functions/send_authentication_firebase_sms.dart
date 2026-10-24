part of '../tdapi.dart';

/// **SendAuthenticationFirebaseSms** *(sendAuthenticationFirebaseSms)* - TDLib function
///
/// Sends Firebase Authentication SMS to the phone number of the user. Works only when the current authorization state is. authorizationStateWaitCode and the server returned code of the type authenticationCodeTypeFirebaseAndroid or authenticationCodeTypeFirebaseIos.
///
/// * [token]: Play Integrity API or SafetyNet Attestation API token for the Android application, or secret from push notification for the iOS application.
///
/// [Ok] is returned on completion.
final class SendAuthenticationFirebaseSms extends TdFunction {
  /// **SendAuthenticationFirebaseSms** *(sendAuthenticationFirebaseSms)* - TDLib function
  ///
  /// Sends Firebase Authentication SMS to the phone number of the user. Works only when the current authorization state is. authorizationStateWaitCode and the server returned code of the type authenticationCodeTypeFirebaseAndroid or authenticationCodeTypeFirebaseIos.
  ///
  /// * [token]: Play Integrity API or SafetyNet Attestation API token for the Android application, or secret from push notification for the iOS application.
  ///
  /// [Ok] is returned on completion.
  const SendAuthenticationFirebaseSms({
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
  SendAuthenticationFirebaseSms copyWith({
    String? token,
  }) =>
      SendAuthenticationFirebaseSms(
        token: token ?? this.token,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendAuthenticationFirebaseSms';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
