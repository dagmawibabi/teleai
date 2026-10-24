part of '../tdapi.dart';

/// **SendEmailAddressVerificationCode** *(sendEmailAddressVerificationCode)* - TDLib function
///
/// Sends a code to verify an email address to be added to a user's Telegram Passport.
///
/// * [emailAddress]: Email address.
///
/// [EmailAddressAuthenticationCodeInfo] is returned on completion.
final class SendEmailAddressVerificationCode extends TdFunction {
  /// **SendEmailAddressVerificationCode** *(sendEmailAddressVerificationCode)* - TDLib function
  ///
  /// Sends a code to verify an email address to be added to a user's Telegram Passport.
  ///
  /// * [emailAddress]: Email address.
  ///
  /// [EmailAddressAuthenticationCodeInfo] is returned on completion.
  const SendEmailAddressVerificationCode({
    required this.emailAddress,
  });

  /// Email address
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
  /// * [email_address]: Email address
  SendEmailAddressVerificationCode copyWith({
    String? emailAddress,
  }) =>
      SendEmailAddressVerificationCode(
        emailAddress: emailAddress ?? this.emailAddress,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendEmailAddressVerificationCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
