part of '../tdapi.dart';

/// **CheckAuthenticationPasskey** *(checkAuthenticationPasskey)* - TDLib function
///
/// Checks a passkey to log in to the corresponding account. Call getAuthenticationPasskeyParameters to get parameters for the passkey. Works only when the current authorization state is. authorizationStateWaitPhoneNumber or authorizationStateWaitOtherDeviceConfirmation, or if there is no pending authentication query and the current authorization state is. authorizationStateWaitPremiumPurchase, authorizationStateWaitEmailAddress, authorizationStateWaitEmailCode, authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword.
///
/// * [credentialId]: Base64url-encoded identifier of the credential.
/// * [clientData]: JSON-encoded client data.
/// * [authenticatorData]: Authenticator data of the application that created the credential.
/// * [signature]: Cryptographic signature of the credential.
/// * [userHandle]: User handle of the passkey.
///
/// [Ok] is returned on completion.
final class CheckAuthenticationPasskey extends TdFunction {
  /// **CheckAuthenticationPasskey** *(checkAuthenticationPasskey)* - TDLib function
  ///
  /// Checks a passkey to log in to the corresponding account. Call getAuthenticationPasskeyParameters to get parameters for the passkey. Works only when the current authorization state is. authorizationStateWaitPhoneNumber or authorizationStateWaitOtherDeviceConfirmation, or if there is no pending authentication query and the current authorization state is. authorizationStateWaitPremiumPurchase, authorizationStateWaitEmailAddress, authorizationStateWaitEmailCode, authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword.
  ///
  /// * [credentialId]: Base64url-encoded identifier of the credential.
  /// * [clientData]: JSON-encoded client data.
  /// * [authenticatorData]: Authenticator data of the application that created the credential.
  /// * [signature]: Cryptographic signature of the credential.
  /// * [userHandle]: User handle of the passkey.
  ///
  /// [Ok] is returned on completion.
  const CheckAuthenticationPasskey({
    required this.credentialId,
    required this.clientData,
    required this.authenticatorData,
    required this.signature,
    required this.userHandle,
  });

  /// Base64url-encoded identifier of the credential
  final String credentialId;

  /// JSON-encoded client data
  final String clientData;

  /// Authenticator data of the application that created the credential
  final String authenticatorData;

  /// Cryptographic signature of the credential
  final String signature;

  /// User handle of the passkey
  final String userHandle;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "credential_id": credentialId,
      "client_data": clientData,
      "authenticator_data": authenticatorData,
      "signature": signature,
      "user_handle": userHandle,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [credential_id]: Base64url-encoded identifier of the credential
  /// * [client_data]: JSON-encoded client data
  /// * [authenticator_data]: Authenticator data of the application that created the credential
  /// * [signature]: Cryptographic signature of the credential
  /// * [user_handle]: User handle of the passkey
  CheckAuthenticationPasskey copyWith({
    String? credentialId,
    String? clientData,
    String? authenticatorData,
    String? signature,
    String? userHandle,
  }) =>
      CheckAuthenticationPasskey(
        credentialId: credentialId ?? this.credentialId,
        clientData: clientData ?? this.clientData,
        authenticatorData: authenticatorData ?? this.authenticatorData,
        signature: signature ?? this.signature,
        userHandle: userHandle ?? this.userHandle,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkAuthenticationPasskey';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
