part of '../tdapi.dart';

/// **ResendPhoneNumberCode** *(resendPhoneNumberCode)* - TDLib function
///
/// Resends the authentication code sent to a phone number. Works only if the previously received authenticationCodeInfo.next_type was not null and the server-specified timeout has passed.
///
/// * [reason]: Reason of code resending; pass null if unknown *(optional)*.
///
/// [AuthenticationCodeInfo] is returned on completion.
final class ResendPhoneNumberCode extends TdFunction {
  /// **ResendPhoneNumberCode** *(resendPhoneNumberCode)* - TDLib function
  ///
  /// Resends the authentication code sent to a phone number. Works only if the previously received authenticationCodeInfo.next_type was not null and the server-specified timeout has passed.
  ///
  /// * [reason]: Reason of code resending; pass null if unknown *(optional)*.
  ///
  /// [AuthenticationCodeInfo] is returned on completion.
  const ResendPhoneNumberCode({
    this.reason,
  });

  /// Reason of code resending; pass null if unknown
  final ResendCodeReason? reason;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "reason": reason?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reason]: Reason of code resending; pass null if unknown
  ResendPhoneNumberCode copyWith({
    ResendCodeReason? reason,
  }) =>
      ResendPhoneNumberCode(
        reason: reason ?? this.reason,
      );

  /// TDLib object type
  static const String defaultObjectId = 'resendPhoneNumberCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
