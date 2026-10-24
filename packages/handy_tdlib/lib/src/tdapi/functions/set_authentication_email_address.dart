part of '../tdapi.dart';

/// **SetAuthenticationEmailAddress** *(setAuthenticationEmailAddress)* - TDLib function
///
/// Sets the email address of the user and sends an authentication code to the email address. Works only when the current authorization state is authorizationStateWaitEmailAddress.
///
/// * [emailAddress]: The email address of the user.
///
/// [Ok] is returned on completion.
final class SetAuthenticationEmailAddress extends TdFunction {
  /// **SetAuthenticationEmailAddress** *(setAuthenticationEmailAddress)* - TDLib function
  ///
  /// Sets the email address of the user and sends an authentication code to the email address. Works only when the current authorization state is authorizationStateWaitEmailAddress.
  ///
  /// * [emailAddress]: The email address of the user.
  ///
  /// [Ok] is returned on completion.
  const SetAuthenticationEmailAddress({
    required this.emailAddress,
  });

  /// The email address of the user
  final String emailAddress;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "email_address": emailAddress,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [email_address]: The email address of the user
  SetAuthenticationEmailAddress copyWith({
    String? emailAddress,
  }) =>
      SetAuthenticationEmailAddress(
        emailAddress: emailAddress ?? this.emailAddress,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setAuthenticationEmailAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
